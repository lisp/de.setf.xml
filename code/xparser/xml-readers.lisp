;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  readers for use with an xml tokenizer.
  nb. in contrast to changes for name instances, these tokens remain symbols.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010312' AUTHOR='jaa'>initial version</DELTA>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010624'>
   fixed ignorable-whitespace-reader for eol normailzation.
   should probably eliminate it...</DELTA>
  <DELTA DATE='20020110'>added handler for bad entity names to readers in order to permit
   unescpaed ampersands in attribute values</DELTA>
  <DELTA DATE='20020116'>adjusted char-code-limit comparison for mcl and allegro</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")


;;
;;
;; reader functions

(eval-when (:compile-toplevel :load-toplevel :execute)

(defun compute-pattern-tree (forms)
  (let ((groups nil) (group nil))
    (dolist (form forms)
      (destructuring-bind (pattern token) form
        (if (= (length pattern) 0)
          (push token groups)
          (if (setf group (assoc (schar pattern 0) groups :test #'char=))
            (push (list (subseq pattern 1) token) (rest group))
            (push (list (schar pattern 0) (list (subseq pattern 1) token)) groups)))))
    (flet ((do-group (group)
             (if (symbolp group)
               group
               (cons (char-code (first group))
                     (compute-pattern-tree (rest group))))))
      (if (cdr groups)
        (mapcar #'do-group groups)
        (do-group (first groups))))))
)

(defMacro pattern-test (&rest forms)
  ;; each form has the content (<string> <token>)
  ;; where the string is matched in the input the token is returned.
  ;; otherwise the input to that point is returned.
  ;; since match strings may share common sequences, the test may be combined.
  `(test-pattern-tree ',(compute-pattern-tree forms)))

(defun test-pattern-tree (tree &aux item result)
  (typecase (setf item (first tree))
    (fixnum (when (= (get-input) item)
              (cond ((consp (rest tree))
                     (advance-input-no-eof)
                     (test-pattern-tree (rest tree)))
                    ((rest tree)))))
    (list (dolist (tree tree)
            (when (setf result (test-pattern-tree tree))
              (return result))))))


#|
(defparameter *input* nil)
(defun get-input () *input*)
(defun advance-input-no-eof (&aux (char (read-char)))
  (setf *input* (char-code char)))
(defparameter *tree* (compute-pattern-tree '( ("--" |xml|:|<!--| )
                                              ("[" |xml|:|<![| )
                                              ("ATTLIST" |xml|:|<!ATTLIST| )
                                              ("ENTITY" |xml|:|<!ENTITY| )
                                              ("ELEMENT" |xml|:|<!ELEMENT| )
                                              ("NOTATION" |xml|:|<!NOTATION| ))))
(pprint *tree*)
(with-input-from-string (*standard-input* "--")
  (time (dotimes (x 1000) (stream-position *standard-input* 0)
                 (advance-input-no-eof)
                 (test-pattern-tree *tree*))))

(pattern-test ("--" |xml|:|<!--| )
                 ("[" |xml|:|<![| )
                 ("ATTLIST" |xml|:|<!ATTLIST| )
                 ("ENTITY" |xml|:|<!ENTITY| )
                 ("ELEMENT" |xml|:|<!ELEMENT| )
                 ("NOTATION" |xml|:|<!NOTATION| ))

|#

;;
;;
;;

(defun |_read-entity-ref-name|
       (&aux (char-code 0))
  (declare (optimize (speed 3) (safety 1))
           (ftype (function () fixnum)  get-input)
           (type fixnum count char-code))
  (setf char-code (get-input))
  (loop (when (= char-code #.(char-code #\;))
          ;; don't (advance-input) since this byte may be replaced
          (when (= *name-length* 0)
            (xml-error |WFC: [EntityRef]|
                       :format-control "no name provided."))
          (return (make-name-string)))
        (extend-name char-code)
        (unless (if (= 1 *name-length*)
                  (xml-initial-namechar? char-code)
                  (xml-namechar? char-code))
          (xml-error |WFC: [EntityRef]|
                     :format-control "illegal entity reference name: ~s."
                     :format-arguments (list (make-name-string))))
        (setf char-code (get-next-input-no-eof))))

;; (with-ring-buffer ("asdf; ") (list (|_read-entity-ref-name|) (code-char (get-input))))


(defun |_read-character-entity-ref-name|
       (&aux (char-code 0) (is-hex nil))
  (declare (optimize (speed 3) (safety 1))
           (ftype (function () fixnum)  get-input)
           (type fixnum count char-code))
  (setf char-code (get-input))
  (loop (when (= char-code #.(char-code #\;))
          ;; don't (advance-input), leave it to the caller to do
          (when (= *name-length* 0)
            (xml-error |WFC: [CharRef]|
                       :format-control "no name provided."))
          (return (make-name-string)))
        (extend-name char-code)
        (unless (or (and (= 1 *name-length*)
                         (when (= char-code #.(char-code #\x)) (setf is-hex t)))
                    (<= #.(char-code #\0) char-code #.(char-code #\9))
                    (when is-hex (or (<= #.(char-code #\a) char-code #.(char-code #\f))
                                     (<= #.(char-code #\A) char-code #.(char-code #\F)))))
          (xml-error |WFC: [CharRef]|
                     :format-control "illegal character reference: ~s"
                     :format-arguments (list (make-name-string))))
        (setf char-code (get-next-input-no-eof))))

;; (with-ring-buffer ("x123; ") (list (|_read-character-entity-ref-name|) (code-char (get-input))))


(defun |_read-char-ref| ()
  (let ((code 0)
        (radix 10)
        (start 0)
        (buffer (|_read-character-entity-ref-name|)))
    (cond (buffer
           (when (char= (schar buffer 0) #\x)
             (setf radix 16)
             (setf start 1))
           (setf code (ignore-errors (parse-integer buffer :radix radix :start start)))
           (cond ((and code (xml-char? code) (<-char-code-limit code))
                  (return-buffer-string buffer)
                  code)
                 (t
                  (xml-error |WFC: Legal Character| :name buffer :code code))))
          (t
           (xml-error |WFC: Legal Character| :name buffer)))))

;; (with-ring-buffer ("48; ") (list (code-char (|_read-char-ref|)) (code-char (get-input))))
;; (with-ring-buffer ("x30; ") (list (code-char (|_read-char-ref|)) (code-char (get-input))))

(defun |_read-operator-name|
       (&aux (char-code 0))
  (declare (optimize (speed 3) (safety 1))
           (ftype (function () fixnum)  get-input)
           (type fixnum count char-code))
  (loop (setf char-code (get-next-input-no-eof))
        (when (not (xml-namechar? char-code))
          ;; but the breaking byte back and return the name
          (unget-input char-code) 
          (when (= *name-length* 0)
            (xml-error |WFC: Name|
                       :format-control "no name provided."))
          (return (make-name-string)))
        (extend-name char-code)))


#|
entity "reduction" occurs 'in-line'.
the respective entity is returned to the tokenizer for it to introduce into
the stream. if reduction is disabled, then the tokens should be included
verbatim, since no binding is performed, and therefore no resolution, will
be possible
|#

(defun |&-char-reader| (&aux byte)
  ;; character entity references only are expanded appended to the token
  ;; and anything else is appended 'as-is'
  (cond ((= #.(char-code #\#) (setf byte (get-next-input-no-eof)))
         (advance-input-no-eof)
         (extend-token (|_read-char-ref|))
         (advance-input) ; past the terminating #\;
         #|(format *trace-output* "~%char ref giving token (~s) and input[8] (~s)/~s."
                 (ring-buffer-string *token-start* *token-length*)
                 (ring-buffer-string *input-start* 8) (get-input))|#
         )
        (t
         ;; in a context where character references can be read, ensure that at least it's
         ;; a plausible name
         (cond ((xml-initial-namechar? byte)  ;; ok leave it
                (extend-token #.(char-code #\&)))
               (t
                (xml-error |WFC: [CharRef]|
                           :format-control "illegal name provided."))))))

(defun |&-reader| (&aux byte name)
  (cond ((= #.(char-code #\#) (setf byte (get-next-input-no-eof)))
         (advance-input-no-eof)
         (extend-token (|_read-char-ref|))
         (advance-input) ; past the terminating #\;
         )
        ((xml-space? byte)
         (|character-error| ))
        (t
         (handler-case (setf name (make-ncname (|_read-entity-ref-name|)))
           (|WFC: [EntityRef]| (condition)
                               (let ((name (first (simple-condition-format-arguments condition))))
                                 (cond ((and *permit-unescaped-urls*
                                             (char= #\= (char name (1- (length name)))))
                                        (extend-token #.(char-code #\&))
                                        (dotimes (i (length name))
                                          (extend-token (char-code (char name i))))
                                        (return-from  |&-reader|))
                                       (t
                                        (signal condition))))))
         (cond ((is-reduction-enabled)
                (replace-input (find-def-general-entity name *document*)))
               (t
                (replace-input (make-ref-general-entity :name name)))))))

;(with-ring-buffer ("&#38; ") (|&-reader|) (list (make-token-string) (get-input)))

(defun |&-if-not-in-tag-reader| ()
  (cond (*atn-term*
         (advance-input)
         (extend-token #.(char-code #\&)))
        (t (|&-reader| ))))

(defun |%-reader| (&aux byte name)
  ;; where a space immediately follows, the '%' stands alone as a token.
  ;; the situation is likely '<!ENTITY % ... >' it will then either succeed
  ;; as such, or cause the parse to fail.
  ;; where entities are being expanded, include the text. 
  (cond ((xml-space? (setf byte (get-next-input-no-eof)))
         (unget-input byte)
         (replace-input '|xml|:|%|))
        (t
         (setf name (make-ncname (|_read-entity-ref-name|)))
         (cond ((is-reduction-enabled)
                (replace-input (find-def-parameter-entity name *document*)))
               (t
                (replace-input (make-ref-parameter-entity :name name)))))))

#|
;;an alternative which returns parameter entities by name
(defun |%-reader| (char reader arg &aux def)
  ;; where a space immediately follows, the '%' stands alone as a token.
  ;; the situation is likely '<!ENTITY % ... >' it will then either succeed
  ;; as such, or cause the parse to fail.
  ;; where entites are being expanded, include the text. 
  (setf char (|read-and-test| reader arg))
  (cond ((xml-space? char)
         (values '|xml|:|%| char))
        (t
         (let ((name (next-token-buffer)))
           (|read-entity-ref-name| reader arg nil char name)
           (cond ((and *parameter-entities* (is-reduction-enabled))
                  (setf name (make-qname-and-free-token-buffer name))
                  (setf def (find-ncname-binding name *parameter-entities*))
                  ;; an internal entity is returned to the tokenizer for it to include
                  ;; an external entity is returned by name for the parser to recognize
                  ;; so that the content can be parsed as an external subset.
                  (if (is-def-internal-entity def)
                    def
                    (list '|xml|:|%| name '|xml|:|;|)))
                 (t
                  (list '|xml|:|%| name '|xml|:|;|)))))))
|#

(defun |?-reader| ()
  ;; recognize the ?> in the respective context only once the opening term has
  ;; been recognized. otherwise it's just character data.
  (cond ((= (get-next-input-no-eof) #.(char-code #\>)) (replace-input '|xml|:|?>|))
        (t (extend-token #.(char-code #\?)))))

(defun |?-if-in-tag-reader| ()
  ;; recognize the ?> in the respective context only once the opening term has
  ;; been recognized. otherwise it's just character data.
  (cond (*atn-term*
         (cond ((= (get-next-input-no-eof) #.(char-code #\>)) (replace-input '|xml|:|?>|))
               (t (extend-token #.(char-code #\?)))))
        (t (extend-token #.(char-code #\?)) (advance-input-no-eof))))

(defun |=-reader| ()
  (replace-input '|xml|:|=|))

(defun |=-if-in-tag-reader| ()
  ;; recognize the = in the respective context only once the opening term has
  ;; been recognized. otherwise it's just character data.
  (cond (*atn-term* (replace-input '|xml|:|=|))
        (t (extend-token #.(char-code #\=)) (advance-input-no-eof))))


(defun |>-reader| ()
  (replace-input '|xml|:|>|))

(defun |>-if-in-tag-reader| (char reader arg)
  ;; recognize the > in the respective context only once the opening term has
  ;; been recognized. otherwise it's just character data.
  (declare (ignore char reader arg))
  (cond (*atn-term* (|>-reader|))
        (t (extend-token #.(char-code #\>)) (advance-input-no-eof))))

#|
;; the grammar is written to expcet two distinct tokens
(defun |)-reader| ()
  (cond ((= (get-next-input-no-eof) #.(char-code #\*)) (replace-input '|xml|:|)*|))
        (t (push-input '|xml|:|)|))))
|#

(defun |/-reader| ()
  ;; recognize the = in the respective context only once the opening term has
  ;; been recognized. otherwise it's just character data.
  (cond ((= (get-next-input-no-eof) #.(char-code #\>)) (replace-input '|xml|:|/>|))
        (t (extend-token #.(char-code #\/)))))

(defun |/-if-in-tag-reader| ()
  ;; recognize the = in the respective context only once the opening term has
  ;; been recognized. otherwise it's just character data.
  (cond (*atn-term*
         (cond ((= (get-next-input-no-eof) #.(char-code #\>)) (replace-input '|xml|:|/>|))
               (t (extend-token #.(char-code #\/)))))
        (t (extend-token #.(char-code #\/)) (advance-input-no-eof))))

;; for use in declaration contexts, allow the operator after the <![ to be tokenized
(defun |<-reader| (&aux (byte 0) name)
  (declare (type fixnum byte)
           (ftype (function (t) integer) reader)
           (inline =)
           (optimize (speed 3) (safety 0)))
  (setf byte (get-next-input-no-eof))
  (cond ((= byte #.(char-code #\/)) (replace-input '|xml|:|</|))
        ((= byte #.(char-code #\?))
         (setf name (|_read-operator-name|))
         (if (string= name "xml")
           (replace-input |xml|:|<?xml|)
           (replace-input (cons |xml|:|<?| name))))
        ((= byte #.(char-code #\!))
         (get-next-input-no-eof)
         (setf name (pattern-test ("--" |xml|:|<!--| )
                                  ("[" |xml|:|<![| )
                                  ("ATTLIST" |xml|:|<!ATTLIST| )
                                  ("ENTITY" |xml|:|<!ENTITY| )
                                  ("ELEMENT" |xml|:|<!ELEMENT| )
                                  ("NOTATION" |xml|:|<!NOTATION| )))
         (if name
           (replace-input name)
           (xml-error "declaration operator not recognized.")))
        (t (unget-input byte)
           (replace-input '|xml|:|<|))))

(defun |<-ignore-reader| (&aux (byte 0))
  (declare (type fixnum byte)
           (ftype (function (t) integer) reader)
           (inline =)
           (optimize (speed 3) (safety 0)))
  (setf byte (get-next-input-no-eof))
  (cond ((= byte #.(char-code #\!))
         (setf byte (get-next-input-no-eof))
         (cond ((= byte #.(char-code #\[))
                (replace-input '|xml|:|<![| ))
               (t
                (advance-input-no-eof)
                (extend-token #.(char-code #\<))
                (extend-token #.(char-code #\!))
                (extend-token byte))))
        (t
         (advance-input-no-eof)
         (extend-token #.(char-code #\!))
         (extend-token byte))))


;; where markup appears in character content, it requires the exact string after <![ and 
;; permits no declarations
(defun |<![CDATA[-reader| (&aux (byte 0) name)
  (declare (type fixnum byte)
           (ftype (function (t) fixnum) reader)
           (inline =)
           (optimize (speed 3) (safety 0)))
  (setf byte (get-next-input-no-eof))
  (cond ((= byte #.(char-code #\/)) (replace-input '|xml|:|</|))
        ((= byte #.(char-code #\?))
         (setf name (|_read-operator-name|))
         (if (string= name "xml")
           (replace-input |xml|:|<?xml|)
           (replace-input (cons |xml|:|<?| name))))
        ((= byte #.(char-code #\!))
         (get-next-input-no-eof)
         (setf name (pattern-test ("--" |xml|:|<!--| )
                                  ("[CDATA[" |xml|:|<![CDATA[| )
                                  ("DOCTYPE" |xml|:|<!DOCTYPE| )))
         (if name
           (replace-input name)
           (xml-error "declaration operator not recognized.")))
        (t (unget-input byte)
           (replace-input '|xml|:|<|))))

(defun |]-reader| (&aux byte)
  (cond ((= #.(char-code #\]) (get-next-input-no-eof))
         (loop 
           (cond ((= #.(char-code #\>) (setf byte  (get-next-input-no-eof)))
                  (replace-input '|xml|:|]]>|)
                  (return))
                 ((= #.(char-code #\]) byte)
                  (extend-token #.(char-code #\])))
                 (t
                  (extend-token #.(char-code #\]))
                  (extend-token #.(char-code #\]))
                  (return)))))
        (t ;; extend with first byte, leave the next to reexamine
         (extend-token #.(char-code #\])))))

(defun |--reader| (&aux byte)
  (cond ((= #.(char-code #\-) (setf byte (get-next-input-no-eof)))
         (cond ((= #.(char-code #\>) (get-next-input-no-eof)) (replace-input '|xml|:|-->|))
               (t (extend-token #.(char-code #\-))
                  (extend-token #.(char-code #\-))
                  (xml-error |WFC: [Comment]| :format-control "sequence '--' in comment data."))))
        (t
         ;; if it's not '--', then extend with both bytes and continue
         (extend-token #.(char-code #\-)) (extend-token byte) (advance-input-no-eof))))


(defun |quote-reader| ()
  ;; test if this is a matching quote
  (unless *quote-token*
    (|character-error|))
  ;;(print (list :quote :old *quote-token :new char))
  (cond ((in-literal-entity-reference?) ; referenced quotes don't terminate in entities
         (extend-token (get-input))
         (advance-input-no-eof))
        (t
         (ecase (get-input)
           (#.(char-code #\')
            (case *quote-token*
              (|xml|:|'| (setf *quote-token* t) (replace-input '|xml|:|'|))
              ((t) (setf *quote-token* (replace-input '|xml|:|'|)))
              (t (extend-token (get-input)) (advance-input-no-eof))))
           (#.(char-code #\")
            (case *quote-token*
              (|xml|:|"| (setf *quote-token* t) (replace-input '|xml|:|"|))
              ((t) (setf *quote-token* (replace-input '|xml|:|"|)))
              (t (extend-token (get-input)) (advance-input-no-eof))))))))

(defun |unbalanced-delimiter-error| ()
  (xml-error "unmatched delimiter."))

(defun |character-error| ()
  (xml-error |WFC: Character Context|
             :character (code-char (get-input))
             :context (when *parsetable* (table.name *parsetable*))))

(defun |ignore-whitespace-reader| (&aux byte)
  (loop (setf byte (get-next-input))
        (unless (and byte (xml-space? byte)) (setf *ignore-whitespace* nil) (return t))))

(defun |ignorable-whitespace-reader| (&aux (byte (get-input)))
  ;; if ignoring whitespace, skip it, otherwise build it and return
  ;; (print (list *ignore-whitespace* *atn-net))
  (cond (*ignore-whitespace*
         (|ignore-whitespace-reader|))
        (t
         (loop (extend-token (eol-normalize-input byte)) ;; (extend-token byte)
               (setf byte (get-next-input))
               (unless (and byte (xml-space? byte))
                 ;; don't need to put it back, just dont advance ... (unget-input byte)
                 (return))))))

;; return a single symbol to indicate that the space is a separate token
(defun |tokenize-whitespace-reader| (&aux byte )
  (setf byte (get-input))
  (loop (eol-normalize-input byte)
        (setf byte (get-next-input))
        (unless (and byte (xml-space? byte))
          (unget-input byte)
          (replace-input '|xml|:| |)
          (return))))

(defun |tokenize-whitespace-if-in-tag-reader| ()
  (cond (*atn-term*
         (|tokenize-whitespace-reader| ))
        (t
         (extend-token (eol-normalize-input (get-input)))
         (advance-input-no-eof))))

;; augment the token with a single space.
;; nb. this is not used, since normalization depends on attribute type.
(defun |normalize-whitespace-reader| (&aux byte)
  (loop (setf byte (get-next-input))
        (unless (and byte (xml-space? byte))
          (extend-token #.(char-code #\space))
          (return))))


#|
(mapcar #'(lambda (string)
             (with-input-from-string (stream string)
               (multiple-value-bind (reader arg) (stream-reader stream)
                (multiple-value-list (|<![CDATA[-reader| #\< reader arg)))))
     '("! ..."
       "!-- ..." "!- ..."
       "![CDATA[ ..." "![CDATA ..." "![CDAT ..." "![CDA ..." "![CD ..." "![C ..."
       "?xml ..." "?xm ..." "?x ..."
       "/..."
       "..."))

(mapcar #'(lambda (string &aux (i 0) result)
            (setf result
                  (multiple-value-list (|<-reader| #\<
                                                   #'(lambda (byte)
                                                       (when (< i (length string))
                                                         (setf byte (char-code (schar string i))
                                                               i (1+ i))
                                                         byte))
                                                   0)))
            (list (first result)
                  (if (vectorp (second result))
                    (map 'string #'code-char (second result))
                    (second result))))
     '("!NOTATION ..." "!NOTATIO ..." "!NOTATI ..." "!NOTAT ..." "!NOTA ..." "!NOT ..." "!NO ..." "!N ..." "! ..."
       "!ENTITY ..." "!ENTIT ..." "!ENTI ..." "!ENT ..." "!EN ..." "!E ..."
       "!ELEMENT ..." "!ELEMEN ..." "!ELEME ..." "!ELEM ..." "!ELE ..." "!EL ..." "!E ..."
       "!ATTLIST ...." "!ATTLIS ...." "!ATTLI ...." "!ATTL ...." "!ATT ...." "!AT ...." "!A ...."
       "!DOCTYPE ..." "!DOCTYP ..." "!DOCTY ..." "!DOCT ..." "!DOC ..." "!DO ..." "!D ..."
       "!-- ..." "!- ..."
       "![CDATA[ ..." "![CDATA ..." "![CDAT ..." "![CDA ..." "![CD ..." "![C ..."
       "?xml ..." "?xm ..." "?x ..."
       "/..."
       "..."))



|#


:EOF
