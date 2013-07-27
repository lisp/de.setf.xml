;;; -*- Mode: LISP; Syntax: ansi-common-lisp; Base: 10; Package: (tk1 :use (future-common-lisp)); -*-

;;; Copyright John C. Mallery,  1999-2001.
;;; All rights reserved.

;;; Any bugs in this file should be reported to bug-cl-http@ai.mit.edu
;;; Newer versions may be found in the CL-HTTP distribution.

;;; Inspired by a kernel provided by Rusty Johnson. Revised, polished,
;;; debugged, and integrated by John C. Mallery. Improved by comments from
;;; Martin Simmons, Kalman Reti. 
;;; JCMa 8/18/2001 Double hash probing and deletion added.
;;; jaa 20010930 package definition removed to xml:base;package.lisp
;;; jaa 20030320 default tokenizer table value chenged to #()
;;; jaa 20030602 scl like cmucl

;;;------------------------------------------------------------------- 
;;;
;;; FAST TOKEN HASHING
;;; 

;;; package definition removed to xml:base;package.lisp
#|
(eval-when (:load-toplevel :compile-toplevel :execute)
  (defpackage tk1
    (:use future-common-lisp)
    (:import-from "WWW-UTILS" "WITH-FAST-ARRAY-REFERENCES" "MAKE-LOCK" "WITH-LOCK-HELD")
    (:export
      "*DEFAULT-TOKENIZER-SIZE*"
      "CLEAR-TOKENIZER"
      "CREATE-TOKENIZER"
      "DEFINE-TOKENIZER"
      "DESCRIBE-TOKENIZER"
      "FIND-TOKENIZER-NAMED"
      "GET-TOKEN"
      "INSERT-TOKEN"
      "MAP-TOKENS"
      "REHASH-TOKENIZER"
      "REMOVE-TOKEN"
      "TOKENIZE"
      "UNDEFINE-TOKENIZER"))
  ) |#

(in-package :tk1) 

;;;------------------------------------------------------------------- 
;;;
;;; STRING HASHING FUNCTIONS 
;;; 

(eval-when (:compile-toplevel :execute :load-toplevel)
  (if (intersection '(:genera) *features*)
      (setq *features* (delete :sxhash-tokenization *features*))
      (pushnew :sxhash-tokenization *features*)))

#-SXHash-Tokenization
(declaim (inline non-negative-fixnum))

#-SXHash-Tokenization
(defun non-negative-fixnum (n)
  (declare (fixnum n))
  #+Genera 
  (logxor (ldb (byte 31. 0) n) (ldb (byte 1. 31.) n))
  #-Genera
  (multiple-value-bind (top bottom)
      (floor n most-positive-fixnum)
    (declare (fixnum top bottom))
    (loop until (or (eql 0 top) (eql -1 top))
          ;;(< -2 top 1)          ;might be faster on some architectures
          do (multiple-value-setq (top bottom)
               (floor (logxor top bottom) most-positive-fixnum))
          finally (return bottom)))) 

#|
(defun rotate (integer n)
  ;; 32-bit rotate in genera
  #+Genera
  (sys:rot integer n)
  #-Genera
  (let* ((window (- #.(1- (integer-length most-positive-fixnum)) n))    ; remove 1 for sign bit
         (source (ldb (byte window 0) integer)))
    (declare (dynamic-extent window source))
    (dpb source (byte window n) (ldb (byte n window) integer))))
|# 

#-SXHash-Tokenization
(defmacro %rotate (integer n)
  ;; 32-bit rotate in genera
  #+Genera 
  `(sys:rot ,integer ,n)
  ;; 29-bit rotate everywhere else
  #-Genera 
                                                ; Wrong if ever compiled on a cross compiler for a different platform architecture.
                                                ; Remove 1 bit to avoid creating a bignum
  (let ((window (- (integer-length most-positive-fixnum) 1 n))) ; remove 1 for sign bit
    `(let ((source (ldb ,(byte window 0) ,integer)))
       (declare (dynamic-extent source))
       (dpb source ,(byte window n) (ldb ,(byte window n) ,integer))))) 

#-SXHash-Tokenization
(declaim (inline HASH-CHAR))

#-SXHash-Tokenization
(defun hash-char (hash char hash-mask)
  (declare (fixnum hash hash-mask)
	   (character char))
  (let* ((mask-bits (logand (char-code char) hash-mask))
	 (merge-bits (logxor mask-bits hash)))
    (declare (dynamic-extent mask-bits merge-bits)
	     (fixnum mask-bits merge-bits))
    (%rotate merge-bits 7)))

;; This is the same as (sxhash (subseq string start end))
;; Same speed as (sxhash <string>) on VLM (~ 1.55 secs / 10 million iterations)
;;
;; Hash-Masks: Case-Insensitive #b11011111
;;               Case-Sensitive #b11111111 

#-SXHash-Tokenization
(defun hash-string* (string &optional (start 0) (end (length string)) (hash-mask #b11011111))
  (declare (fixnum start end hash-mask))
  (with-fast-array-references ((string string string))
    (loop for idx fixnum from start below end
          for hash fixnum = (hash-char most-positive-fixnum (aref string idx) hash-mask) then (hash-char hash (aref string idx) hash-mask)
          finally (return (non-negative-fixnum hash)))))

#+(and :SXHash-Tokenization (not :Genera))
(defmacro with-stack-array ((var length &rest keys) &body body)
  `(let ((,var (make-array (the fixnum ,length) ,@keys)))
     (declare (dynamic-extent ,var))
     ,@body))

#+(and :SXHash-Tokenization (not :Genera))
(defmacro with-stack-string ((var length &rest keys) &body body)
  `(with-stack-array (,var ,length :element-type http:*standard-character-type* ,@keys)
                     ,@body))

#+(and :SXHash-Tokenization (not :Genera))
(defmacro with-stack-substring ((var string &key (start 0) end) &body body)
  `(let* ((s ,start)
          (e (or ,end (length ,string)))
          (size (- e s)))
     (declare (fixnum s e size))
     (with-stack-string (,var size)
                        (http::copy-vector-portion string s e ,var 0 size)
                        ,@body))) 

#+(and :SXHash-Tokenization (not :Genera))
(defun hash-string (string &optional (start 0) end (hash-mask #b11011111))
  (declare (fixnum start))
  (ecase hash-mask
    (#b11011111
     (with-stack-substring (str string :start start :end end)
                           (nstring-upcase str)
                           (sxhash str)))
    (#b11111111
     (if (and (eql 0 start) (or (null end) (eql end (length string))))
         (sxhash string)
         (with-stack-substring (str string :start start :end end)
                               (sxhash str))))))

;;;------------------------------------------------------------------- 
;;;
;;; FAST STRING EQUALITY FUNCTIONS 
;;;

;; TOKEN-EQUAL is either STRING-EQUAL or STRING= depending on the value of mask
;;   It also has no keyword options, and ignores character style (font) and control-bits.
;;   It is approximately 3 times faster.
;; char-equal (zerop (logand #b11011111 (logxor (char-code #\a) (char-code #\a) )))
;; char=      (zerop (logand #b11111111 (logxor (char-code #\a) (char-code #\a) )))
;; char=      (zerop                    (logxor (char-code #\a) (char-code #\a) )) 

(defmacro %%token-equal (string1 start1 end1 string2 start2 end2 mask)
  (case mask
    (#b11011111
     #-Genera
     `(string-equal ,string1 ,string2 :start1 ,start1 :end1 ,end1 :start2 ,start2 :end2 ,end2)
     #+Genera
     `(with-fast-array-references ((,string1 ,string1 string)
                                   (,string2 ,string2 string))
        (loop for idx1 fixnum upfrom ,start1 below ,end1
              for idx2 fixnum upfrom ,start2
              do (let* ((xor (logxor (char-code (aref ,string1 idx1))
                                     (char-code (aref ,string2 idx2)) ))
                        (mask-and (logand ,mask xor)))
                   (declare (dynamic-extent xor mask-and))
                   (unless (eql 0 mask-and)
                     (return nil)))
              finally (return t))))
    (#b11111111
     #-Genera
     `(string= ,string1 ,string2 :start1 ,start1 :end1 ,end1 :start2 ,start2 :end2 ,end2)
     #+ Genera ;; EQL is faster than all the bit operations -- Reti 4/16/2000.
     `(with-fast-array-references ((,string1 ,string1 string)
                                   (,string2 ,string2 string))
        (loop for idx1 fixnum upfrom ,start1 below ,end1
              for idx2 fixnum upfrom ,start2
              unless (eql (aref ,string1 idx1) (aref ,string2 idx2))
                do (return nil)
              finally (return t))))
    (t `(ecase ,mask
          (#b11011111
           (%%token-equal ,string1 ,start1 ,end1 ,string2 ,start2 ,end2 #b11011111))
          (#b11111111
           (%%token-equal ,string1 ,start1 ,end1 ,string2 ,start2 ,end2 #b11111111))))))

(declaim (inline %token-equal))

(defun %token-equal (string1 start1 end1 string2 start2 end2 mask)
  (declare (fixnum start1 end1 start2 end2))
  (cond ((eql (the fixnum (- end1 start1)) (the fixnum (- end2 start2)))
         (%%token-equal string1 start1 end1 string2 start2 end2 mask))
        (t nil)))

(defun token-equal (string1 string2 &key (start1 0) (end1 (length string1)) 
                            (start2 0) (end2 (length string2)) (test #'char-equal))
  "Returns non-null if string1 is equal to string2 within the specified ranges.
test operators can be CHAR=, CHAR-EQUAL and EQL."
  (check-type string1 string)
  (check-type string2 string)
  (let ((mask (cond ((or (eq test #'char-equal) (eq test 'char-equal))
                     #b11011111)
                    ((or (eq test #'eql) (eq test 'eql))
                     #b11111111)
                    ((or (eq test #'char=) (eq test #'char=))
                     #b11111111)
                    (t (error "Unknown function for TEST: ~S" test)))))
    (%token-equal string1 start1 end1 string2 start2 end2 mask))) 

;;;------------------------------------------------------------------- 
;;;
;;; GENERATING GOOD ARRAY SIZES 
;;;

;;; Generate a sequence of primes at compile time to use as array sizes.

(eval-when (:load-toplevel :execute :compile-toplevel)

;; grow by 2.5 percent
(defvar *tokenizer-growth-factor* 1.025)

;; use primes distributed logarithmically between 3 and MAX-SIZE as sizes for tokenizer tables. 
(defun prime-numbers-for-tokenizer-system (max-size)
  (flet ((next-prime (start)
	   #-(or clisp cmu sbcl scl)(declare (values prime prime+2))
	   (loop with prime
		 for prime+2 fixnum from (logior start 1) by 2
		 when (loop for factor fixnum from 3 by 2 to (isqrt prime+2)
			    never (zerop (mod prime+2 factor)))
		   do (if (eql prime (- prime+2 2))
			  (return-from next-prime prime)
			  (setq prime prime+2)))))
    (declare (inline next-prime))
    (loop with max-tokenizer-elements fixnum = (min most-positive-fixnum max-size)
	  and growth-factor of-type short-float = (coerce *tokenizer-growth-factor* 'short-float)
	  for i fixnum = 3 then (floor (* (1+ prime) growth-factor))
	  while (< i max-tokenizer-elements)
	  as prime fixnum = (next-prime i)
	  collect prime)))

(defvar *tokenizer-maximum-size* 1000000)     ; 1 million entries max
  )                                             ; close eval when 

(defvar *tokenizer-table-sizes* '#.(prime-numbers-for-tokenizer-system *tokenizer-maximum-size*)) 

(declaim (inline tokenizer-size-prime-ceiling))

(defun tokenizer-size-prime-ceiling (integer)
  (or (find integer *tokenizer-table-sizes* :test #'<)
      (error "No prime ceiling found for ~D" integer)))

(defun load-factor (tokenizer)
  "Returns the load factor for TOKENIZER."
  (coerce (/ (the fixnum (tokenizer-count tokenizer)) (the fixnum (tokenizer-modulus tokenizer))) 'short-float))

(defun expected-probes-per-unsuccessful-hash (tokenizer)
  "Returns the Expected number of table probes for an when a token is not present in TOKENIZER."
  (let ((load-factor (load-factor tokenizer)))
    (declare (short-float load-factor))
    (if (zerop load-factor)
	1
	(/ 1 (- 1 load-factor)))))

(defun expected-probes-per-new-token-insertion (tokenizer)
  "Returns the Expected number of table probes required to insert a new token into TOKENIZER."
  (expected-probes-per-unsuccessful-hash tokenizer))

(defun %expected-probes-per-successful-hash (load-factor)
  (declare (short-float load-factor))
  (if (zerop load-factor)
      1
      (/ (log (/ 1 (- 1 load-factor)) 2) load-factor)))

(defun expected-probes-per-successful-hash (tokenizer)
  "Returns the Expected number of table probes to find a token present in TOKENIZER."
  (%expected-probes-per-successful-hash (load-factor tokenizer)))

(defun select-table-size (filled-size)
  "Returns a new size for a tokenizer table with at least FILLED-SIZE elements
as well as a threshold when the tokenizer table should be rehashed."
  #-(or clisp cmu sbcl scl)(declare (values size rehash-size))
  (let* ((min-size (ceiling (* #+Genera filled-size
			       #-Genera (the fixnum (etypecase filled-size (fixnum filled-size) (number (ceiling filled-size))))
			       5) 4))		; allow hash array to become 80% full.
	 (modulus (tokenizer-size-prime-ceiling min-size)))
    (declare (fixnum modulus))
    (unless modulus
      (error "Attempt to create a tokenizer table larger than the maximum implementation size, ~D." *tokenizer-maximum-size*))
    (values modulus (floor (* modulus 4) 5)))) 

;;;------------------------------------------------------------------- 
;;;
;;; DEFINE TOKENIZER
;;; 

(defstruct (tokenizer (:print-function print-tokenizer))
  (lock nil)                                    ; lock for multithreaded operation
  (table #() :type vector)                      ; array containing entries 
  (modulus 0 :type fixnum) 
  (mask 0 :type fixnum) 
  (function nil :type (or null function))       ; tokenizing function
  (count 0 :type fixnum)                        ; number of entries
  (rehash-size 0 :type fixnum)                  ; when to grow the table
  (name "tokenizer" :type string)
  (documentation nil :type (or null string))) 

(defun print-tokenizer (tokenizer stream depth)
  (declare (ignore depth))
  (print-unreadable-object (tokenizer stream :type t :identity t)
    (when (tokenizer-function tokenizer)
      (format stream "~A ~D (~D)" 
              (tokenizer-name tokenizer) (tokenizer-count tokenizer) (tokenizer-rehash-size tokenizer)))))

(defstruct (entry (:print-function print-entry))
  (hash 0 :type fixnum)                         ; hash value 
  (key-size 0 :type fixnum)			; token string size
  (key nil :type (or null string))		; token string
  (value nil))					; token value 

(defun print-entry (entry stream depth)
  (declare (ignore depth))
  (print-unreadable-object (entry stream :type t :identity t)
    (when (entry-key entry)
      (write (entry-key entry) :stream stream :escape nil)
      (write-string "=>" stream)
      (write (entry-value entry) :stream stream :escape nil)))) 

(declaim (inline empty-entry-p))
(defun empty-entry-p (entry)
  (null (entry-key entry))) 

(declaim (inline entry-valid-p))
(defun entry-valid-p (entry)
  (entry-key entry))

(defparameter *default-tokenizer-size* 20
  "The default initial size for tokenizer tables.")

(defun allocate-table (size)
  (make-array size :element-type t :initial-element nil)) 

(defun compute-mask (test)
  (cond ((or (eql test 'string-equal) (eql test #'string-equal)
             (eq test #'char-equal) (eq test 'char-equal)
             (eq test #'equalp) (eq test 'equalp))
         #b11011111)
        ((or (eql test 'string=) (eql test #'string=)
             (eq test #'eql) (eq test 'eql)
             (eq test #'char=) (eq test #'char=)
             (eq test #'equal) (eq test 'equal))
         #b11111111)
        (t (error "Unknown string equality comparitor, ~S." test))))

(defun create-tokenizer (name &key (function #'identity) (size *default-tokenizer-size*) (test #'string-equal)
                              documentation)
  "Creates and returns a new TOKENIZER."
  (check-type name string)
  (check-type size integer)
  (check-type function function)
  (multiple-value-bind (modulus rehash-size) 
      (select-table-size  size)
    (make-tokenizer :table (allocate-table modulus)
                    :modulus modulus
                    :mask (compute-mask test)
                    :function function
                    :rehash-size rehash-size
                    :count 0
                    :name name
                    :lock (make-lock name :type :multiple-reader-single-writer)
                    :documentation documentation))) 

;;;------------------------------------------------------------------- 
;;;
;;; MAPPING TOKEN TABLES 
;;;

(defun map-tokens (tokenizer function)
  "Maps FUNCTION over all the tokens of TOKENIZER.
FUNCTION is called with (KEY VALUE), where KEY is
a string and VALUE is the tokenized value."
  (with-lock-held ((tokenizer-lock tokenizer) :read "Map Tokens")
    (loop for entry across (tokenizer-table tokenizer)
          when (and entry (entry-valid-p entry)) 
            do (funcall function (entry-key entry) (entry-value entry)))
    tokenizer)) 

;;;------------------------------------------------------------------- 
;;;
;;; REHASHING TOKEN TABLES 
;;; 

;; Computes the first table index given the hash value and the modulus.
(defmacro compute-index (hash-value modulus)
  `(mod (the fixnum ,hash-value) (the fixnum ,modulus)))

;; Compute hash-specific offset for Double hashing probe method
(defmacro compute-secondary-offset (hash-value modulus)
  `(1+ (mod (the fixnum ,hash-value) (the fixnum (1- ,modulus))))) 

;; Computes the subsequent indices after a collision on the first probe
(defmacro compute-next-index (index modulus offset)
  `(let ((new-index (+ (the fixnum ,index) (the  fixnum ,offset))))
     (declare (integer new-index))		; possible overflowing into bignums for very large tables
     (if (< new-index (the fixnum ,modulus))
	 new-index
	 (- new-index (the fixnum ,modulus)))))

(defun %rehash-tokenizer (tokenizer &optional size)
  (check-type tokenizer tokenizer)
  (flet ((entry-valid-p (entry)
	   (entry-key entry))
	 (rebucket (entry tokenizer new-table modulus)
	   (declare (fixnum modulus))
	   (with-fast-array-references ((new-table new-table vector))
	     (loop with hash = (entry-hash entry) and offset
		   repeat modulus
		   for index fixnum = (compute-index hash modulus) 
			     then (compute-next-index index modulus (or offset (setq offset (compute-secondary-offset hash modulus))))
		   as temp = (aref new-table index)
		   do (unless temp
			(setf (aref new-table index) entry)
			(incf (tokenizer-count tokenizer))
			(return-from rebucket t))
		   finally (error "Missing hash bucket: This should never happen.")))))
    (declaim (inline entry-valid-p rebucket))
    (multiple-value-bind (modulus rehash-size)
	(select-table-size (or size (* (tokenizer-count tokenizer) *tokenizer-growth-factor*)))
      (let ((table (tokenizer-table tokenizer))
	    (new-table (allocate-table modulus)))
	(with-fast-array-references ((table table vector))
	  (loop with count fixnum = 0
		for entry across table
		when (and entry (entry-valid-p entry))
		  do (rebucket entry tokenizer new-table modulus)
		     (incf count)
		finally (setf (tokenizer-table tokenizer) new-table
			      (tokenizer-modulus tokenizer) modulus
			      (tokenizer-rehash-size tokenizer) rehash-size
			      (tokenizer-count tokenizer) count))))
      tokenizer))) 

(defun rehash-tokenizer (tokenizer &optional size)
  "Rehashes the tokenizer, TOKENIZER, according to SIZE while holding a write lock."
  (with-lock-held ((tokenizer-lock tokenizer) :write "Rehash Tokenizer")
    (%rehash-tokenizer tokenizer size)))

(defun optimize-tokenizer (tokenizer)
  (rehash-tokenizer tokenizer (tokenizer-count tokenizer)))

;;;------------------------------------------------------------------- 
;;;
;;; TOKENIZE 
;;; 

(defmacro with-tokenizing ((tokenizer hash-mask hash string start end
				      &key (table-var 'table) (index-var 'index) insertion-p) 
			   &key entry-not-found  (entry-found '(values (entry-value entry) nil) ))
  `(let* ((,table-var (tokenizer-table ,tokenizer))
	  (modulus (tokenizer-modulus ,tokenizer))
	  (size (- (the fixnum ,end) (the fixnum ,start))))
     (declare (fixnum hash modulus size))
     (with-fast-array-references ((,table-var ,table-var array))
       (loop with offset and key ,@(when insertion-p '(and free-entry))
	     repeat modulus
	     for ,index-var fixnum = (compute-index ,hash modulus) 
			    then (compute-next-index ,index-var modulus (or offset (setq offset (compute-secondary-offset ,hash modulus))))
	     as entry = (aref ,table-var ,index-var)
	     do (progn
		  (unless entry
		    (return ,entry-not-found))
		  (when (and (eql (entry-hash entry) ,hash)
			     (eql (entry-key-size entry) size)
			     (setq key (entry-key entry))	; watch out for deleted entries
			     (%%token-equal key 0 size ,string ,start ,end ,hash-mask))
		    (return ,entry-found))
		  ,@(when insertion-p		; insert code to spot empty entries for insertion
		      '((unless (or free-entry (entry-valid-p entry))
			  (setq free-entry entry)))))
	     finally (error "TOKENIZE Lost: This should never happen.")))))

(declaim (inline %insert-new-token)) 

(defun %insert-new-token (tokenizer table index free-entry hash token key key-size)
  (if free-entry
      ;; deleted entry in hash chain available for reuse
      (setf (entry-hash free-entry) hash
	    (entry-key free-entry) key
	    (entry-key-size free-entry) key-size
	    (entry-value free-entry) token)
      ;; create a new entry
      (setf (aref table index) (make-entry :hash hash :key key :key-size key-size :value token)))
  (unless (< (incf (the fixnum (tokenizer-count tokenizer))) (tokenizer-rehash-size tokenizer))
    (%rehash-tokenizer tokenizer))
  token)

(defun %create-and-insert-new-token (tokenizer table index free-entry hash string start end)
  (declare (fixnum index start end))
  (let* ((key (subseq string start end))
	 (key-size (- end start))
	 (token (funcall (tokenizer-function tokenizer) key 0 key-size)))
    (%insert-new-token tokenizer table index free-entry hash token key key-size)))

(declaim (inline %tokenize))

(defun %tokenize (tokenizer hash-mask string start end)
  "Tokenize STRING using TOKENIZER while ensuring thread safety."
  #-(or clisp cmu sbcl scl) (declare (values token newly-interned-p))
  (let ((lock (tokenizer-lock tokenizer))
	(hash (hash-string string start end hash-mask)))
    (with-lock-held (lock :read "Tokenize")
      (with-tokenizing (tokenizer hash-mask hash string start end)
		       :entry-found (values (entry-value entry) nil)
		       :entry-not-found nil))	; fall through to capture write lock
    ;; must recheck in case someone else has interned the entry or the tokenizer has been rehashed.
    (with-lock-held (lock :write "Intern Token")
      (with-tokenizing (tokenizer hash-mask hash string start end :insertion-p t)
		       :entry-found (values (entry-value entry) nil)
		       :entry-not-found (values (%create-and-insert-new-token tokenizer table index free-entry hash string start end) t)))))

(defun tokenize (tokenizer string &optional (start 0) (end (length string)))
  "Tokenize STRING using TOKENIZER while ensuring thread safety."
  #-(or clisp cmu sbcl scl) (declare (values token newly-interned-p))
  (locally
    (declare (inline %tokenize))
    (%tokenize tokenizer (tokenizer-mask tokenizer) string start end)))

(declaim (notinline %tokenize))

(declaim (inline %get-token))

(defun %get-token (tokenizer hash-mask string start end)
  (let ((hash (hash-string string start end hash-mask)))
    (with-lock-held ((tokenizer-lock tokenizer) :read "Tokenize")
      (with-tokenizing (tokenizer hash-mask hash string start end)
                       :entry-found (values (entry-value entry) nil)
		       :entry-not-found nil))))

(defun get-token (tokenizer string &optional (start 0) (end (length string)))
  (%get-token tokenizer (tokenizer-mask tokenizer) string start end)) 

(defun insert-token (tokenizer token string &optional (start 0) (end (length string)))
  "Inserts a new TOKEN keyed by STRING into TOKENIZER."
  (declare (fixnum start end)
	   (values t t))
  (let* ((lock (tokenizer-lock tokenizer))
	 (hash-mask (tokenizer-mask tokenizer))
	 (hash (hash-string string start end hash-mask)))
    (with-lock-held (lock :write "Intern Token")
      (with-tokenizing (tokenizer hash-mask hash string start end :insertion-p t)
		       :entry-found (setf (entry-value entry) token)
		       :entry-not-found (values (%insert-new-token tokenizer table index free-entry hash token (subseq string start end)(- end start))
						t)))))

(defun remove-token (tokenizer string &optional (start 0) (end (length string)))
  "Removes STRING from TOKENIZER."
  (declare (fixnum start end)
	   (values t t))
  (flet ((%delete-entry (entry)
	   (setf (entry-hash entry) 0           ; reset hash value
		 (entry-key entry) nil		; free key for GC
		 (entry-key-size entry) 0	; no key size
		 (entry-value entry) nil)))	; free value for GC
    (declare (inline %delete-entry))
    (let* ((lock (tokenizer-lock tokenizer))
	   (hash-mask (tokenizer-mask tokenizer))
	   (hash (hash-string string start end hash-mask)))
      (declare (fixnum hash))
      (with-lock-held (lock :write "Remove Token")
	(with-tokenizing (tokenizer hash-mask hash string start end)
			 :entry-found (multiple-value-prog1
					(values t (entry-value entry))
					(%delete-entry entry)
					(decf (tokenizer-count tokenizer)))
			 :entry-not-found (values nil)))))) 

(defun clear-tokenizer (tokenizer)
  "Clears all entries in TOKENIZER."
  (let ((lock (tokenizer-lock tokenizer)))
    (with-lock-held (lock :write "Clear Tokenizer")
      (loop with table = (tokenizer-table tokenizer)
	    for idx upfrom 0 below (length table)
	    do (setf (aref table idx) nil)
	    finally (setf (tokenizer-count tokenizer) 0))
      tokenizer)))

(defun update-tokenizer (tokenizer name function test documentation)
  (check-type tokenizer tokenizer)
  (check-type name string)
  (check-type function function)
  (check-type test function)
  (check-type documentation (or null string))
  (setf (tokenizer-name tokenizer) name
        (tokenizer-function tokenizer) function
        (tokenizer-mask tokenizer) (compute-mask  test)
        (tokenizer-documentation tokenizer) documentation)
  tokenizer) 

#|
(setq t1 (create-tokenizer "test-1" :tokenizer #'http::intern-keyword :size 100 :test #'string=))

(dolist (x '("foo" "bar" "baz"))
  (tokenize t1 x))

(map-tokens t1 #'(lambda (key val) (format t "~&~A: ~S" key val)))

(dolist (x '("foo" "bar" "baz" "Foo" "Bar" "Baz" "Joe"))
  (multiple-value-bind (token new-p)
      (tokenize t1 x)
    (format t "~&~A => ~S ~:[~;!~]" x token new-p)))
|# 


;;;------------------------------------------------------------------- 
;;;
;;; DESCRIBING TOKENIZERS 
;;; 

(defun collision-map (tokenizer &aux collision-alist (deleted-entries 0) (deleted-entry-collisions 0) (total-collisions 0))
  "Returns an alist of the hash collisions in tokenizer."
  #-(or clisp cmu sbcl scl) (declare (values collision-alist deleted-entry-collisions deleted-entries probes-per-successful-hash ))
  (with-lock-held ((tokenizer-lock tokenizer) :read "Count Collisions")
    (let* ((table (tokenizer-table tokenizer))
	   (modulus (tokenizer-modulus tokenizer))
	   (hash-mask (tokenizer-mask tokenizer))
	   (count (tokenizer-count tokenizer)))
      (labels ((note-collision (num-collisions key colliding-keys)
		 (let ((entry (assoc num-collisions collision-alist)))
		   (if entry
		       (push (list* key colliding-keys) (cdr entry))
		       (push (list num-collisions (list* key colliding-keys)) collision-alist))))
	       (check-entry (key value)
		 (declare (ignore value))
		 (macrolet ((get-entry-key (entry)
			      `(or (entry-key ,entry) 
				   (prog1 :+deleted+ (incf deleted-entry-collisions)))))
		   (let* ((key-size (length key))
			  (hash (hash-string key 0 key-size hash-mask)))
		     (declare (fixnum hash modulus))
		     (with-fast-array-references ((table table vector))
		       (loop with num-collisions fixnum = 0 and offset and colliding-keys
			     repeat modulus
			     for index fixnum = (compute-index hash modulus) 
				       then (compute-next-index index modulus (or offset (setq offset (compute-secondary-offset hash modulus))))
			     as entry = (aref table index)
			     ;;do (format t "~&Checking ~D: ~S against ~S" num-collisions key (entry-key entry))
			     when (and (eql (entry-hash entry) hash)
				       (%token-equal key 0 key-size (entry-key entry) 0 (entry-key-size entry) hash-mask))
			       do (unless (zerop num-collisions)
				    (note-collision num-collisions key colliding-keys)
				    (incf total-collisions num-collisions))
				  (return-from check-entry)
			     else do (incf num-collisions)	; track total collisions
			     do (push (get-entry-key entry) colliding-keys)
			     finally (error "COUNT-COLLISIONS Lost: This should never happen.")))))))
	(declare (dynamic-extent #'note-collision #'check-entry))
	(loop for entry across (tokenizer-table tokenizer)
	      when entry
		do (if (entry-valid-p entry)
		       (check-entry (entry-key entry) (entry-value entry))
		       (incf deleted-entries)))
	(values collision-alist deleted-entry-collisions deleted-entries (if (zerop count) 1 (1+ (/ total-collisions count))))))))

(defun show-collisions (tokenizer &optional (stream *standard-output*))
  "Shows the hash collisions in TOKENIZER on STREAM."
  (multiple-value-bind (collision-alist deleted-entry-collisions deleted-entries probes-per-successful-hash)
      (collision-map tokenizer)
    (format stream "~&Actual Probes per Successful Hash: ~4,2,,F" probes-per-successful-hash)
    (unless (zerop deleted-entries)
      (format stream "~&Deleted Entries: ~D" deleted-entries)
      (if (zerop deleted-entry-collisions) 
	  (format stream "~&No Probe Collisions with Deleted Entries")
	  (format stream "~&Probe Collisions with Deleted Entries: ~D" deleted-entry-collisions)))
    (format stream "~&~:[No ~;~]Hash Collisions~:*~:[.~;:~]" collision-alist)
    (when collision-alist
      (loop for (num-collisions . entries) in (sort collision-alist #'> :key #'car)
	    do (format stream "~&~5T~D Collision~:*~P for ~D Entr~:*~@P:" num-collisions (length entries))
	    sum (loop for (key . colliding-keys) in entries
		      do (format stream "~&~35T~A <= ~{ ~A~^,~}" key colliding-keys)
		      sum num-collisions)
	      into collisions
	    finally (format stream "~&Hash Secondary Buckets: ~D" collisions))
      collision-alist))) 

(defun describe-tokenizer (tokenizer &optional (stream *standard-output*))
  "Describes TOKENIZER on STREAM."
  (flet ((describe-entry (key value)
	   (format stream "~16T~A => ~S~&" key value)))
    (format stream "~&Tokenizer: ~A~&Filled Elements: ~D~&Rehash Size: ~D~&Modulus: ~D~
                                ~&Function: ~S~&Documentation: ~A~
                                ~&Load Factor: ~4,2,,F~&Expected Probes per Unsuccessful Hash: ~,2,,F~&Expected Probes per Successful Hash: ~,2,,F"
	    (tokenizer-name tokenizer)
	    (tokenizer-count tokenizer)
	    (tokenizer-rehash-size tokenizer)
	    (tokenizer-modulus tokenizer)
	    (tokenizer-function tokenizer)
	    (tokenizer-documentation tokenizer)
	    (load-factor tokenizer)
	    (expected-probes-per-unsuccessful-hash tokenizer)
	    (expected-probes-per-successful-hash tokenizer))
    (show-collisions tokenizer stream)
    (format stream "~&Contents:" )
    (map-tokens tokenizer #'describe-entry)
    tokenizer))

;;;------------------------------------------------------------------- 
;;;
;;; 
;;;

#+ignore
 (defun map-over-tokens (tokenizer continuation string delimiters &optional (start 0) (end (length string))) 
  (flet ((charset-position (charset string start end)
           (declare (fixnum start end))
           (with-fast-array-references ((string string string))
             (loop for idx fixnum upfrom start below end
                   when (member (aref string idx) charset)
                     return idx
                   finally (return nil))))
         (not-charset-position (charset string start end)
           (declare (fixnum start end))
           (with-fast-array-references ((string string string))
             (loop for idx fixnum upfrom start below end
                   unless (member (aref string idx) charset)
                     return idx
                   finally (return nil)))))
    (declare (inline charset-position not-charset-position))
    (loop with temp = start
          do (setq start (or (not-charset-position delimiters string temp end) end))
          while (< start end)
          do (setq temp (or (charset-position delimiters string start end) end))
             (funcall continuation (tokenize token-table string start temp))
          until (= temp end))))

;;;------------------------------------------------------------------- 
;;;
;;; PROGRAMMER INTERFACE
;;;

(defun %tokenizer-variable (name &optional (package *package*))
  (intern (concatenate 'string "*" (string-upcase name) "-TOKENIZER*") package))

(defun %tokenizer-function (name &optional (package *package*))
  (intern (format nil "TOKENIZE-~A" name) package))

(defun %tokenizer-fast-function (name &optional (package *package*))
  (intern (format nil "%TOKENIZE-~A" name) package)) 

(defun find-tokenizer-named (name &optional (error-p t) (package *package*))
  "Finds the tokenizer named NAME.
Unless ERROR-P is non-null, it returns NIL when no tokenizer is found.
Otherwise an error is signalled."
  (let ((variable (%tokenizer-variable name package)))
    (cond ((boundp variable) (symbol-value variable))
          (error-p (error "No tokenizer named ~S was found." name))
          (t nil))))

(defun %define-tokenizer (name tokenizer test size documentation definer)
  (labels ((frob-test (test)
	     (etypecase test
	       (symbol
		 (case test
		   ((equalp char-equal) 'string-equal)
		   ((eql char=) 'string=)
		   (t test)))
	       (cons
		 (case (car test)
		   ((quote function) (frob-test (second test)))
		   (t test))))))
    (let* ((name (string name))
	   (package *package*)
	   (variable (%tokenizer-variable name package))
	   (function-name (%tokenizer-function name package))
	   (fast-function-name (%tokenizer-fast-function name package))
	   (test (frob-test test))
	   (mask (compute-mask test)))
      (check-type definer symbol)
      `(progn
	 (defvar ,variable)
	 (if (boundp ',variable)
	     (update-tokenizer ,variable ,name (fdefinition ,tokenizer) (fdefinition ',test) ,documentation)
	     (setq ,variable (create-tokenizer ,name
					       :test (fdefinition ',test)
					       :function (fdefinition ,tokenizer)
					       :size ,(or size *default-tokenizer-size*)
					       :documentation ,documentation)))
	 ;; define a fast tokenizer
	 (declaim (inline ,fast-function-name))
	 (,definer ,fast-function-name (string &optional (start 0) (end (length string)))
	  #-(or clisp cmu sbcl scl) (declare (values token newly-interned-p))
	  (%tokenize ,variable ,mask  string start end))
	 ;; define a general-purpose interface function.
	 (,definer ,function-name (string &optional (start 0) (end (length string)) (if-does-not-exist :create))
	  #-(or clisp cmu sbcl scl) (declare (values token newly-interned-p))
	  (ecase if-does-not-exist
	    (:create
	      (%tokenize ,variable ,mask string start end))
	    (:soft (get-token ,variable string start end))
	    (:error
	      (or (get-token ,variable string start end)
		  (error "Unknown token: ~S." (subseq  string start end))))))
	 ,variable))))

(defmacro define-tokenizer (name &key tokenizer test size documentation (definer 'defun))
  (%define-tokenizer name tokenizer test size documentation definer))

(defun undefine-tokenizer (name &optional (package *package*))
  #-(or clisp cmu sbcl scl) (declare (values tokenizer-undefined-p))
  (let ((var (%tokenizer-variable name package)))
    (when (boundp var)
      (makunbound var)
      (unintern var package))))

#| 

(defparameter headers '("accept"
                        "authorization"
                        "connection"
                        "content-id"
                        "content-length"
                        "content-type"
                        "date"
                        "derived-from"
                        "expires"
                        "forwarded"
                        "from"
                        "if-modified-since"
                        "keep-alive"
                        "last-modified"
                        "location"
                        "method"
                        "mime-version"
                        "referer"
                        "Server"
                        "uri"
                        "User-Agent"
                        "version"
                        "www-authenticate")) 

(defun make-circular-list (list)
  (let ((l1 (copy-list list)))
    (nconc l1 l1)
    l1)) 

(mapcar #'integer-length (mapcar #'hash-string headers))

(mapcar #'sxhash headers)

(defvar circular-headers (make-circular-list headers))

(defun test-hash1 (n)
  (loop repeat n
        for item in circular-headers
        do (hash-string item 0 (length item) #b11111111)))

(defun test-hash2 (n)
  (loop repeat n
        for item in circular-headers
        do (hash-string* item 0 (length item) #b11111111)))

(defun test-hash1-equal (n)
  (loop repeat n
        for item in circular-headers
        do (hash-string item 0 (length item) #b11011111)))

(defun test-hash2-equal (n)
  (loop repeat n
        for item in circular-headers
        do (hash-string* item 0 (length item) #b11011111)))

(defun test-token-equal (n)
  (loop repeat n
        for item in circular-headers
        do (token-equal item item :test #'char=))) 

(undefine-tokenizer 'header)

(clear-tokenizer *header-tokenizer*)

(define-tokenizer header
                  :tokenizer 'http::%intern-new-header 
                  :test 'string-equal
                  :documentation"Tokenizes headers without consing.")

(mapc #'%tokenize-header headers) 

(defun test2 (n)
  (loop repeat n
        for item in circular-headers
        do #+ignore (intern-header item)
           (%tokenize-header item)))

(undefine-tokenizer 'header-eq)

(define-tokenizer header-eq
                  :tokenizer 'http::%intern-new-header 
                  :test 'string=
                  :documentation"Tokenizes headers without consing.")

(mapc #'tokenize-header-eq headers) 

(defun test3 (n)
  (loop repeat n
        for item in circular-headers
        do #+ignore (intern-header item)
           (%tokenize-header-eq item)))

(undefine-tokenizer 'header1)

(tk1:define-tokenizer header1
                      :tokenizer 'http::%intern-new-header-value
                      :test 'equal
                      :documentation "Tokenizes headers without consing.")

(mapc #'tokenize-header1 headers)

(defun test1 (n)
  (loop repeat n
        for item in circular-headers
        do #+ignore (intern-header item)
           (%tokenize-header1 item)))

|#

#|

(defun next-prime (start)
  #-(or clisp cmu sbcl scl) (declare (values prime prime2))
  (loop with prime
	for prime+2 fixnum from (logior start 1) by 2
	when (loop for factor fixnum from 3 by 2 to (isqrt prime+2)
		   never (zerop (mod prime+2 factor)))
	  do (if (eql prime (- prime+2 2))
		 (return-from next-prime prime)
		 (setq prime prime+2))))

(defun most-positive-fixnum-prime ()
  (loop for int downfrom most-positive-fixnum by 2
	for prime = (next-prime int)
	when (< prime most-positive-fixnum)
	  return prime))

(defun division-hash (key modulus)
  (mod (the fixnum key) (the fixnum modulus)))

;; Knuth's default. can be tuned to applications
(defconstant *multiplication-hash-constant* (/ (1- (sqrt 5)) 2)) 
   
(defun multiplication-hash (key modulus)
  (declare (fixnum key modulo))
  (floor (* modulus (mod (* key *multiplication-hash-constant*) 1))))

(defconstant most-positive-fixnum-prime 536870837)

(defun universal-hash (key modulus)
  (let* ((key* (if (< key most-positive-fixnum-prime) key (- most-positive-fixnum-prime key)))
	 (alpha (1+ (random (- most-positive-fixnum-prime 2))))
	 (beta (random (1- most-positive-fixnum-prime))))
    (mod (mod most-positive-fixnum-prime (+ (* alpha key*) beta) ) modulus))) 

(defun test (n hash-function)
  (let* ((prime (tokenizer-size-prime-ceiling n))
	 (vector (make-array prime :initial-element 0))
	 (hash-fctn (ecase hash-function
		      (:division-hash #'division-hash)
		      (:multiplication-hash #'multiplication-hash)
		      (:universal-hash #'universal-hash))))
    (declare (dynamic-extent prime))
    (loop for idx upfrom 0 below n
	  for hash = (sxhash idx)
	  for index = (funcall hash-fctn hash prime)
	  do (format t "~&~D => ~D" hash index)
	     (incf (aref vector index)))
    (loop for idx upfrom 0 below prime
	  for hits = (aref vector idx)
	  when (> hits 1)
	    do (format t "~&~D => ~D collisions" idx hits)))) 
|#
