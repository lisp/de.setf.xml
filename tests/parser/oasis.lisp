;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

;;; the conformance suite is available from oasis.org
;;; (see http://www.oasis-open.org/committees/xml-conformance/)
;;; 
;;; adjust the following logical host


(setf (logical-pathname-translations "xmlconf")
      '(("**;*.*" "xml:Standards;XML;XMLConf;xmlconf;**;*.*")))

;;;
;;; utilities

(defun limited-code-char (code)
  ;; like checked-code-char , but always and otherwise returning encoded 255
  (or (when (<-char-code-limit code)
        (code-char code))
      #.(code-char 255)))
       
(defMethod stream->string ((stream stream)
                           &aux (buffer (make-array 0 :element-type 'character
                                                    :adjustable t
                                                    :fill-pointer 0))
                           character byte)
  (loop (unless (setf byte (read-byte stream nil nil))
          (return buffer))
        (setf character (limited-code-char byte))
        (vector-push-extend character buffer)))
(defMethod stream->string ((pathname pathname))
  ;; use binary mode to avoid automatic unicode handling in lispworks
  (with-open-file (stream pathname :direction :input :element-type '(unsigned-byte 8))
    (stream->string stream)))
(defMethod stream->vector ((stream stream)
                           &aux (buffer (make-array 0 :element-type 'cons
                                                    :adjustable t
                                                    :fill-pointer 0))
                           byte)
  (loop (unless (setf byte (read-byte stream nil nil))
          (return buffer))
        (vector-push-extend (cons byte (limited-code-char byte)) buffer)))
(defMethod stream->vector ((pathname pathname))
  (with-open-file (stream pathname :direction :input :element-type '(unsigned-byte 8))
    (stream->vector stream)))

(defParameter *discrepancies*
  '((p04pass1 . "PE: tag '<A.-:̀·/>' is a qualified name")
    (p05pass1 . "PE: tags '<::._-0/>' and '<:/>' don't follow QName constraint.")
    (p66pass1 . "IR: character is beyond implementation limit.")
    (p06fail1 . "VR: idref validity not enforced")
    (p08fail1 . "VR: a null name or empty set is permitted")
    (p08fail2 . "VR: passes when not validating")
    (p11pass1 . "PE: the system literal contains a fragment identifier.")
    (p16fail3 . "PE: is not present in the documentation and has a legal NCName as PiTarget.")
    (pe01 . "PE: a parameter entities is not recognized in an attribute default.")
    (empty . "VR: whitespace, comments, and processing instructions are permitted in EMPTY.")
    (id08 . "VR: validation does not check id cross-references")
    (id09 . "VR: validation does not check id cross-references")
    (not-sa01 . "VR: standalone stipulation not enforced.")
    (not-sa02 . "VR: standalone stipulation not enforced.")
    (not-sa03 . "VR: standalone stipulation not enforced.")
    (not-sa04 . "VR: standalone stipulation not enforced.")
    (not-sa05 . "VR: standalone stipulation not enforced.")
    (not-sa06 . "VR: standalone stipulation not enforced.")
    (not-sa07 . "VR: standalone stipulation not enforced.")
    (not-sa08 . "VR: standalone stipulation not enforced.")
    (not-sa09 . "VR: standalone stipulation not enforced.")
    (not-sa10 . "VR: standalone stipulation not enforced.")
    (not-sa11 . "VR: standalone stipulation not enforced.")
    (not-sa12 . "VR: standalone stipulation not enforced.")
    (not-sa13 . "VR: standalone stipulation not enforced.")
    (not-sa14 . "VR: standalone stipulation not enforced.")
    (ext01 . "PE: references a non-existent external entity.")
    (notation01 . "VR: a notation is used prior to definition")
    (432gewf . "PE: general entity content constraint not enforced")
    (ibm29i01 . "VR: standalone stipulation not enforced.")
    (ibm32i01 . "VR: standalone stipulation not enforced.")
    (ibm32i02 . "VR: standalone stipulation not enforced.")
    (ibm32i03 . "VR: standalone stipulation not enforced.")
    (ibm32i04 . "VR: standalone stipulation not enforced.")
    (ibm49i01 . "VR: group/pe nesting not enforced")
      ;; (ibm49i02 . "PE: ibm49i02.dtd is missing") not detected as such as the document should be invalid anyway
    (ibm50i01 . "VR: group/pe nesting not enforced")
    (ibm51i01 . "VR: group/pe nesting not enforced")
    (ibm56i08 . "PE: references a non-existent external entity.")
    (ibm56i10 . "VR: id reference validity is not enforced.")
    (ibm02v01 . "IR: character is beyond implementation limit at offset 281.")
    (ibm54v01 . "VR: a notation is used prior to definition")
    (ibm58v01 . "PE: constraint introduced in errata.")
    (ibm59v01 . "PE: constraint introduced in errata.")
    (ibm66v01 . "IR: character is beyond implementation limit.")
    (|001| . "VR: group/pe nesting not enforced")
    (|002| . "VR: group/pe nesting not enforced")
    (|003| . "PE: 003-2.ent is missing.")
    (|006| . "VR: group/pe nesting not enforced")
    (|012| . "PE: attribute name ':' is not namespace conform")
    (|052| . "IR: character is beyond implementation limit.")
    (|064| . "IR: character is beyond implementation limit.")
    (|074| . "VR: group/pe nesting not enforced")
    (|076| . "VR: a notation is used prior to definition.")
    (|089| . "IR: character is beyond implementation limit.")
    (|090| . "VR: a notation is used prior to definition.")
    (|104| . "VR: group/pe nesting not enforced.")
    (|115| . "PE a single character reference is well-formed.")
    (|117| . "PE a single character reference is well-formed.")
    (|119| . "PE a single character reference is well-formed.")
    (|120| . "PE a single character reference is well-formed.")
    (|181| . "VR: group/pe nesting not enforced.")
    (|182| . "VR: group/pe nesting not enforced.")))

(defun report-parse (pathname
                     &key pass (validate t) (reduce t) trace (discrepancies *discrepancies*)
                     (verbose nil) (verbose-discrepant t) break-on-errors
                     &aux (bnfp:*terminal-parser-error-action* :signal)
                     (*print-length* 3))
  (let ((result nil)
        (discrepant (assoc (pathname-name pathname) discrepancies
                           :test #'string-equal)))
    (block :do-parse
      (handler-bind
        ((error #'(lambda (condition)
                        (setf result condition)
                        (when break-on-errors (break "condition ~a." condition))
                        (return-from :do-parse))))
        (setf result
              (document-parser pathname :reduce reduce :trace trace
                                           :validate validate))))
    (flet ((condition-string (c)
             (substitute-if #\space #'xml-space?
                            (with-output-to-string (s) (princ c s))))
           (format-file ()
             (format *trace-output* "~:[~%~%~; ~]~a (p ~:[n~;y~]) (v ~:[n~;y~]):~16t"
                     verbose (file-namestring pathname) pass validate)))
      (typecase result
        ((or null xml-error)
         (cond ((not pass)
                (cond (verbose
                       (format-file) 
                       (format *trace-output* "FAILED: ")
                       (format *trace-output* "OK -> ~a" (condition-string result)))
                      (t
                       (write-char #\. *trace-output*)))
                :conformant)
               (discrepant
                (cond (verbose-discrepant
                       (format-file)
                       (format *trace-output* "FAILED: ")
                       (format *trace-output* "OK/DISCREPANT: ~a -> ~a"
                               (rest discrepant) (condition-string result)))
                      (t
                       (write-char #\. *trace-output*)))
                :discrepant)
               (t
                (format-file)
                (format *trace-output* "FAILED: ")
                (format *trace-output* " ! SHOULD PASS: -> ~a ~a~%~a"
                        (condition-string result)
                        pathname
                        (substitute-if #\space #'xml-space?
                                       (stream->string pathname)))
                :nonconformant)))
        (condition
         (cond ((or verbose (not discrepant)
                    (and discrepant verbose-discrepant))
                (format-file)
                (format *trace-output* "ERROR: -> ~a~%~a"
                        (condition-string result) 
                        (substitute-if #\space #'xml-space?
                                       (stream->string pathname))))
               (t
                (write-char #\. *trace-output*)))
         :erroneous)
        (t
         (cond (pass
                (cond (verbose
                       (format-file)
                       (format *trace-output* "PASSED: ~s: " result)
                       (format *trace-output* "OK."))
                      (t
                       (write-char #\. *trace-output*)))
                :conformant)
               (discrepant
                (cond (verbose-discrepant
                       (format-file)
                       (format *trace-output* "PASSED: ~s: " result)
                       (format *trace-output* "OK/DISCREPANT: ~a." (rest discrepant)))
                      (t
                       (write-char #\. *trace-output*)))
                :discrepant)
               (t
                (format-file)
                (format *trace-output* "PASSED: ~s: " result)
                ;; (break)
                (format *trace-output* " ! SHOULD FAIL: ~a~%~a"
                        pathname
                        (substitute-if #\space #'xml-space?
                                       (stream->string pathname)))
                :nonconformant)))))))

;; this is the actual test run

(defParameter *discrepant-files* nil)
(defParameter *erroneous-files* nil)
(defParameter *nonconformant-files* nil)

(defun run-oasis-tests (paths
                        &aux (case-count 0)
                        (conformant-count 0))
  (setq *nonconformant-files* nil)
  (setq *discrepant-files* nil)
  (setq *erroneous-files* nil)
  
  (unwind-protect
    (time 
     (map nil
          #'(lambda (location)
              (destructuring-bind (directory &rest args &key validate pass (reduce t)) location
                (format *trace-output* "~%~%~s ~s" directory args)
                (map nil #'(lambda (path)
                             ;; skip files which are intended as external entities
                             (unless (search ".ent." (file-namestring path))
                               (ecase (report-parse path :reduce reduce :validate validate
                                                    :pass pass)
                                 (:conformant (incf conformant-count))
                                 (:discrepant (push (file-namestring path) *discrepant-files*))
                                 (:nonconformant (push (file-namestring path) *nonconformant-files*))
                                 (:erroneous (push (file-namestring path) *erroneous-files*)))
                               (incf case-count)))
                     ;; sort to ease cross-implementation comparison
                     (sort (directory directory) #'string-lessp :key #'file-namestring))))
          paths))
    (print (list :cases case-count
                 :conformant conformant-count
                 :discrepant (length *discrepant-files*)
                 :nonconformant (length *nonconformant-files*) 
                 :erroneous (length *erroneous-files*))))
  (setf *discrepant-files* (reverse *discrepant-files*)
        *nonconformant-files* (reverse *nonconformant-files*)
        *erroneous-files* (reverse *erroneous-files*))
  (list :cases case-count
        :conformant conformant-count
        :discrepant (cons (length *discrepant-files*) *discrepant-files*)
        :nonconformant (cons (length *nonconformant-files*) *nonconformant-files*)
        :erroneous (cons (length *erroneous-files*) *erroneous-files*)))

(print
 (run-oasis-tests '((#P"xmlconf:oasis;*pass*.xml" :pass t)
                    (#P"xmlconf:oasis;*fail*.xml" :pass nil)
                    (#P"xmlconf:sun;not-wf;*.xml" :pass nil)
                    (#P"xmlconf:sun;invalid;*.xml" :pass nil :validate t)
                    (#P"xmlconf:sun;valid;*.xml" :pass t :validate t)
                    (#P"xmlconf:ibm;not-wf;*;*.xml" :pass nil)
                    (#P"xmlconf:ibm;invalid;*;*.xml" :pass nil :validate t)
                    (#P"xmlconf:ibm;valid;*;*.xml" :pass t :validate t)
                    (#P"xmlconf:xmltest;not-wf;*;*.xml" :pass nil)
                    (#P"xmlconf:xmltest;invalid;*.xml" :pass nil :validate t)
                    (#P"xmlconf:xmltest;valid;*;*.xml" :pass t :validate t)
                    )))

#|
mcl 4.3.1 ppc604/200 +xml-symbols
took 94,417 milliseconds (94.417 seconds) to run.
Of that, 1,411 milliseconds (1.411 seconds) were spent in The Cooperative Multitasking Experience.
648 milliseconds (0.648 seconds) was spent in GC.
 26,319,200 bytes of memory allocated.

(defmacro print-parser (name)
  `(pprint (function-lambda-expression (function ,name))))
(defmacro idp (x) `(inspect (document-parser ,x)))

(let ((*xml-verbose* t))
  (document-parser #p"osx.tschichold:Documents:Standards:XML:XMLConf:xmlconf:xmltest:not-wf:sa:082.xml"
                   :validate nil :trace nil))

(let ((*xml-verbose* t))
  (document-parser #p"osx.tschichold:Documents:Standards:XML:XMLConf:xmlconf:xmltest:not-wf:sa:082.xml"
                   :validate t :trace nil))

"osx.tschichold:Documents:Standards:XML:XMLConf:xmlconf:sun:valid:sa.dtd"
"www:Dokumente:Standards:XML:XMLConf:xmlconf:ibm:valid:P32:ibm32v01.dtd"
"www:Dokumente:Standards:XML:XMLConf:xmlconf:sun:invalid:not-sa02.xml"

(document-parser
 #P"www:Dokumente:Standards:XML:XMLConf:xmlconf:sun:valid:not-sa01.xml")
(document-parser
 #p"www:Dokumente:Standards:XML:XMLConf:xmlconf:sun:valid:ext02.xml")
(idp #P"www:Dokumente:Standards:XML:XMLConf:xmlconf:ibm:invalid:P49:ibm49i02.xml")
(parse-external-subset-toplevel "www:Dokumente:Standards:XML:XMLConf:xmlconf:oasis:p09pass1.dtd"
                 :validate t :trace nil)
(inspect *)
(inspect
 (stream->vector #p"xmlconf:xmltest;valid;not-sa;031-2.ent"))


(map nil
     #'(lambda (location)
         (destructuring-bind (directory &key validate pass (reduce t)) location
           (format *trace-output* "~%~%~s" directory)
           (map nil #'(lambda (path)
                        (print path)
                        (report-parse path :reduce reduce :validate validate :pass pass))
                (directory directory))))
     '(  (#P"xmlconf:ibm;valid;*;*.xml" :pass t :validate t)))

(length *discrepancies*)

;; tests of specific anomalies

;; selected discrepant oasis tests

;; the constraint on parameter entity applies to those which contribute
;; to a DeclSep production. the test case places it _within_ an attribute
;; value, where it is not recognized. if the quotes are removed, then the error
;; is recognized.
invalid.pe01 (idp #P"www:Dokumente:Standards:XML:XMLConf:xmlconf:sun:invalid:pe01.xml")

;; the entity is never referenced. as such there is no way to "know" that it is is not well formed.
;; testing it would require a separate post process to expand all unreferenced entities.
;; a reference to the entity _does_ effect the constraint in the course of subsequent parsing
432gewf (idp "<!DOCTYPE student [<!ELEMENT student (#PCDATA)><!ENTITY gewithElemnetDecl '<!ELEMENT bogus ANY>'><!ATTLIST student att1 CDATA #REQUIRED>]><!--* This test is to test the GE well-formedness constraints in Section 4.3.2:An internal general parsed encith is well-formed if its replacement text matches the production labeled 'content' *--> <?MyInstruct This is a test ?><student att1='ibm'>My Name is SnowMan. </student>")
432gewf (idp "<!DOCTYPE student [<!ELEMENT student (#PCDATA)><!ENTITY gewithElemnetDecl '<!ELEMENT bogus ANY>'><!ATTLIST student att1 CDATA #REQUIRED>]><!--* This test is to test the GE well-formedness constraints in Section 4.3.2:An internal general parsed encith is well-formed if its replacement text matches the production labeled 'content' *--> <?MyInstruct This is a test ?><student att1='ibm'>My Name is SnowMan. &gewithElemnetDecl;</student>")

;; The string "AT&amp;T;" expands to "AT&T;" and the remaining ampersand
;; is not recognized as an entity-reference delimiter.
;; i take this to mean that a single-character entity is literal character
;; data and normalize entites upon instantiation to enforce this.

115 (idp "<!DOCTYPE doc [<!ENTITY e '&#38;'>]><doc a='&e;'></doc>")
116 (idp "<!DOCTYPE doc [<!ENTITY e '&#38;#9'>]><doc>&e;7;</doc>")
116 is a replacement text integrity violation
117 (idp "<!DOCTYPE doc [<!ENTITY e '&#38;'>]><doc>&e;#97;</doc>")
118 (idp "<!DOCTYPE doc [<!ENTITY e '#'> ]><doc>&&e;97;</doc>")
118 an entity reference is not permitted in the entity name itself
119 (idp "<!DOCTYPE doc [<!ENTITY e '&#38;'>]><doc>&e;#38;</doc>")
120 (idp "<!DOCTYPE doc [<!ENTITY e '&#38;'>]><doc>&e;</doc>")


(document-parser #p"xmlconf:oasis;p04pass1.xml")
(document-parser #p"xmlconf:xmltest;valid;not-sa;026.xml")

;; lispworks bugs

;; character limit problems
(lw:set-default-character-element-type 'lw:simple-char)
(document-parser #p"xmlconf:xmltest;valid;sa;089.xml") -> should signal invalid character
(document-parser #p"xmlconf:ibm;valid;p66;ibm66v01.xml")
(document-parser #p"xmlconf:ibm;valid;p02;ibm02v01.xml")

;; tokenizer name problem
(document-parser #p"xmlconf:sun;invalid;attr08.xml")

;; allegro
(document-parser #p"xmlconf:ibm;valid;p88;ibm88v01.xml")

(inspect (parse-document #p"www:Dokumente:Standards:XML:XMLConf:xmlconf:sun:invalid:attr08.xml"
                         :validate t))

|#
:EOF
