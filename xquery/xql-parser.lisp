;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  defines the structure of documents from minimal XQuery algebra expressions.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010306' AUTHOR='JAA'>
  <ul>
   <li>inline reduction</li>
   <li>reader macro function</li></ul>
  </DELTA>
  <DELTA DATE='20010612'>parser recursion controls now per term</DELTA>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010913'>added parsetable for string literal data</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-QUERY")

(eval-when (:compile-toplevel :load-toplevel :execute)

;; 20010607 eliminated: (defun |IS-Identifier| (x) (stringp x))
;; 20010607 changed: (defun |IS-Literal| (x) (and (consp x) (eq (first x) 'quote)))

(defun |IS-CDataCharData| (x) (stringp x))
(defun |IS-CharData| (x) (stringp x))
(defun |IS-CharRefData| (x)
  (and (stringp x) (> (length x) 0)
       (cond ((digit-char-p (schar x 0))
              ;; start over in case length 1
              (not (find-if (complement #'digit-char-p) x)))
             ((and (char= #\x (schar x 0)) (> (length x) 1))
              (not (find-if (complement #'(lambda (c) (digit-char-p c 16)))
                            x :start 1))))))
(defun |IS-NCName| (x) (is-ncname x))
(defParameter *number-literal-bnf*
 "number::= (('.' [0-9]+) | ([0-9]+ ('.' [0-9]+)?)) ([eE] ('+' | '-')? [0-9]+)?")
(defParameter *number-literal-atn* (bnf-to-regex-atn *number-literal-bnf*))
(defun |IS-NumericLiteral| (x)
  (and (stringp x)
       (match-regex *number-literal-atn* x)))

#|
(defun |IS-NumericLiteral| (x)
  (and (stringp x) (> (length x) 0)
       (find (char x 0) "0123456789.")
       (not (find-if (complement #'(lambda (c) (find c "0123456789.+-Ee")))
                     x))))
|#
(defun |IS-S| (x)
  ;; must allow for string tokens - that is those which have been reduced
  ;; during reading
  (or (eq x '|xml|:| |)
      (and (stringp x)
           (not (find-if (complement #'xml-space?) x)))))
(defun |IS-StringLiteralData| (x) (stringp x))
(defun |IS-Variable| (x)
  (and (symbolp x) (eq (symbol-package x) *xqa-package*)))




;;
;;

(defClass xql-lexical-unit () ())

(defGeneric lexical-context (node)
  (:method ((unit atn)) (bnfp::atn-name unit))
  (:method ((unit atn-node)) (bnfp::atn-name unit))
  (:method ((unit cat-atn-edge)) (bnfp::category-name (bnfp::atn-cat unit)))
  (:method ((unit test-atn-edge)) (bnfp::atn-test unit))
  (:method ((unit pop-atn-edge)) (bnfp::atn-register unit))
  (:method ((unit word-atn-edge)) (bnfp::atn-word unit)))


(defClass xql-atn (xql-lexical-unit atn)
  ((ignored-terms :initform '(|S|)))
  (:documentation
   "an augmented atn class serves to extend the compiled bindings to include
    the namespace stack."))

(defClass xql-test-atn-edge (xql-lexical-unit test-atn-edge) ()
  (:documentation
   "an augmented atn class serves to extend the compiled bindings to bind parse tables."))

(defMethod atn-term-names ((node xql-atn))
  (with-slots (ignored-terms) node
    (remove-if #'(lambda (term) (member term ignored-terms :test #'string=))
               (call-next-method))))

(defMethod atn-term-cardinality ((node xql-atn) name)
  (with-slots (ignored-terms) node
    (unless (member name ignored-terms :test #'string=)
      (call-next-method))))

(defMethod bnfp:atn-bindings ((node xql-atn))
  (append (when (eq (bnfp::atn-name node) '|Element|)
            '((*namespace-bindings* *namespace-bindings*)))
          (when (eq (bnfp::atn-name node) '|MatchCase|)
            '((*value-types* *value-types*)))
          (when (eq (bnfp::atn-name node) '|LocalBindingExp|)
            '((*value-types* *value-types*)
              (*variable-values* *variable-values*)))
          (when (eq (bnfp::atn-name node) '|FunctionDeclaration|)
            '((*value-types* *value-types*)))
          (call-next-method)))

(defMethod bnfp:atn-recursion ((node xql-atn))
  (if (member (bnfp::atn-name node) '(|Expr|))
    :allow
    :suppress))

(defMethod bnfp:atn-bindings ((node xql-lexical-unit)
                             &aux 
                             (name (lexical-context node))
                             (parsetable (parsetable name)))
  (append (when parsetable
            `((*parsetable*
               ,(intern (concatenate 'string (string name) "-Parsetable")))))
          (when (and parsetable
                     (find 'quote (table.properties parsetable)))
            `((*quote-token* nil)))
          (call-next-method)))

) ;; eval-when

;;
;;

(let* ((*class.atn* 'xql-atn)
       (*class.test-atn-edge* 'xql-test-atn-edge))
  (compile-atn-system #p"xml:bnf;xql-grammar.bnf"
                      :compile nil      ; rely on system definition
                      :load nil         
                      :execute nil
                      :package *token-package*
                      :source-pathname "xml:xquery;grammar;xql-grammar.lisp"
                      ;; :ambiguous t
                      :wfst t
                      :word-predicate 'string-equal
                      :trace nil))


;;
;;
;; as the grammar is ambiguous, and the tokens are context-independant,
;; all are retained in an extending buffer.

(defClass xq-input (atn-input)
  ((stream :initarg :stream)
   (index :initform -1)
   (last :initform nil)
   (cache :initform (make-array 32 :initial-element nil
                                :fill-pointer 0 :adjustable t))
   (column :initform 0)
   (line :initform 0)))

(defMethod parse-state ((input xq-input))
  (with-slots (stream index last cache column line) input
    (list* :inputs (list :source stream
                         :position (stream-position stream)
                         :column column
                         :line line))
          :input last
          (call-next-method)))

(defMethod input.item ((input xq-input) position &aux token)
  (with-slots (index cache last stream) input
    (cond ((= position index) (setf token last))
          ((and (= position (1+ index)) (setf token (token-reader stream)))
           (incf index)
           (setf last token)
           (vector-push-extend token cache)
           token)
          ((< position index)
           (setf token (aref cache position)))
          ((> position index)
           nil))
    (when *atn-trace*
      (bnfp::%atn-format " [item @(~s/~s) == ~s]"
                         position index token))
    token))

(defMethod input.peek-item ((input xq-input) position &aux token)
  (with-slots (index cache) input
    (setf token (when (<= position index)
                  (aref cache position)))
    (when *atn-trace*
      (bnfp::%atn-format " [peek @(~s/~s) == ~s]"
                         position index token))
    token))

(defMethod input.is-at-end ((input xq-input) position)
  (with-slots (stream index) input
    (and (> position index)
         (null (peek-char t stream nil nil)))))
;;
;;
;;

(defMethod query-parser ((stream stream) &rest args
                         &aux
                         (*namespace-bindings* (make-document-namespace-bindings))
                         (*namespace-mode* :copy)
                         (|xml|:|{| 0) (|xml|:|(| 0) (|xml|:|[| 0)
                         (*type-variables* *type-variables*)
                         (*functions* *functions*)
                         (*function-types* *function-types*)
                         (*variable-types* *variable-types*)
                         (*variables* *variables*)
                         (*gensym-counter* 1)
                         (*parsetable* (parsetable '|QueryModule|))
                         (*saved-token* nil))
  (multiple-value-bind (result index is-complete)
                       (apply #'|QueryModuleList-Parser|
                              (make-instance 'xq-input :stream stream)
                              args)
    (if is-complete
      (values result index)
      (xml-error 'incomplete-parse :result result))))

(defMethod query-parser ((source pathname) &rest args)
  (with-open-file (stream source :direction :input :element-type 'character)
    (apply #'query-parser stream args)))

(defMethod query-parser ((source string) &rest args
                            &key (start 0) (end (length source))
                            &allow-other-keys)
  (with-input-from-string (stream source :start start :end end)
    (apply #'query-parser stream args)))




;;
;;

(defMethod |!-reader|
           ((stream stream) (char (eql #\[)) (sub t)
            &aux (input (make-array 32 :adjustable t :fill-pointer 0
                                    :element-type 'character))
            (level 1))
  (loop (case (setf char (read-char stream))
          (#\[ (incf level))
          (#\] (decf level)))
        (when (zerop level) (return))
        (vector-push-extend char input))
  (query-parser input))


; #![book
:EOF

