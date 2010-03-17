;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: TAL; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  bnf-driven parser for XML.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20020212'>new</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "TAL")

;; terminal primitives apply for many of the non-terminal productions in the
;; original bnf. in cases where the tokenizer implements the distinction,
;; the nonterminal is replaced by a category predicate, the various data tokens
;; are simply strings, and the tokenizer ensures the correct content.

(eval-when (:compile-toplevel :load-toplevel :execute)

(defLiteralPredicates  *tales-literal-strings*
  "local" "global" "text" "structure" "python" "lisp"
  "path" "not" "str" "string" "var")

(defun |IS-StringData| (x) (xmlp::|IS-AttCharData| x))
(defun |IS-NCName| (x) (xmlp::|IS-NCName| x))

(defClass tal-lexical-unit () ())

(defClass tal-atn (tal-lexical-unit bnfp:atn)
  ()
  (:documentation
   "an augmented atn class serves to extend the compiled bindings to bind markers which inflect
    tokenizer."))

(defGeneric lexical-context (node)
  (:method ((unit tal-atn)) (bnfp::atn-name unit)))

(defMethod bnfp:atn-bindings ((node tal-atn)
                              &aux (name (lexical-context node)))
  (append (cond ((eq name '|PlainStringElement|)
                 '((*string-data-terminator* '(#\$ #\;))))
                ((eq name '|PythonExpression|)
                 '((*string-data-terminator* '(#\;))
                   (*string-data-colon* nil)))
                ((eq name '|LispExpression|)
                 '((*string-data-terminator* '(#\;))
                   (*string-data-colon* nil)))
                ((eq name '|StringExpression|)
                 '((*string-data-terminator* '(#\;))
                   (*string-data-colon* nil)))
                ((eq name '|Expression|)
                 '((*string-data-terminator* nil)
                   (*string-data-colon* nil)))
                )
          (call-next-method)))
)

;; input

(defClass tal-input (bnfp:atn-input) ())

(defMethod parse-state ((input tal-input))
  (list* :inputs (list :source *input-source* :position (stream-position *input-source*))
         :last-input *input-last*
         :last-datum *input-datum*
         (call-next-method)))

(defClass tal-parse-state (bnfp:parse-state)
  ((sources :type list
            :documentation "binds a list of property lists, each of which describes a source and the position of the parse in that source.")
   (input :reader parse-state-input
          :documentation "binds the last read input. this is either a character (based on its code-point), or a compund object, if that has been pushed back into the input.")
   (token :type (or string symbol))
   (lexical-context :reader parse-state-lexical-context :type (or string symbol))))

(defMethod bnfp:make-parse-state ((input tal-input))
  (make-instance 'tal-parse-state))

(defmethod initialize-instance :after ((instance tal-parse-state) &key)
  (with-slots (source sources input token lexical-context) instance
    (cond ((bnfp:parse-state-active-p instance)
           (let ((datum (xmlp::get-input)))
             (setf input (typecase datum
                           (fixnum (if (<-char-code-limit datum) (code-char datum) datum))
                           (t datum))))
           (setf lexical-context nil))
          (t
           (setf sources nil
                 input nil
                 token nil
                 lexical-context nil)))))

(defun input-reference (position &aux token)
  (declare (ignore input)
           (type fixnum position *input-index*)
           (type vector *input-token-cache*)
           (optimize (speed 3) (safety 0)))
  (cond ((= position *input-index*) *input-datum*)
        ((and (= position (1+ *input-index*)) (setf token (token-reader)))
         (incf *input-index*)
         (vector-push-extend (setf *input-datum* token) *input-token-cache*)
         token)
        ((< position *input-index*)
         (aref *input-token-cache* position))
        ((> position *input-index*)
         nil)))

(defun input-eof? (position)
  (and (> position *input-index*)
       *input-eof*))

;;
;;
;;

(eval-when (:compile-toplevel)
  (let* ((bnfp:*class.atn* 'tal-atn))
    (bnfp:compile-atn-system #p"xml:tales-grammar.bnf"
                             :compile t
                             ;; don't load directly - leave that to the app
                             ;; :load t
                             :package *token-package*
                             :fasl-pathname "xml:code;atn-lib;tales-grammar.bin"
                             :source-pathname "xml:code;atn-lib;tales-grammar.lisp"
                             :input-function 'input-reference
                             :input-eof-function 'input-eof?
                             :trace nil)
    ))


(eval-when  (:load-toplevel)
  (cl-user::conditional-load-file "xml:code;atn-lib;tales-grammar"))

(eval-when (:execute)
  (let* ((bnfp:*class.atn* 'tal-atn))
    (bnfp:compile-atn-system #p"xml:tales-grammar.bnf"
                             :execute t :compile nil
                             :package *token-package*
                             :source-pathname "xml:code;atn-lib;tales-grammar.lisp"
                             :input-function 'input-reference
                             :input-eof-function 'input-eof?
                             :trace nil)
    ))


;;
;;           
;;


(defun call-with-tales-parse-environment (function *input-source*
                                                   &key 
                                                   &allow-other-keys)
  (let* ((*input-index* -1)             ; parser's position in the input token cache sequence
         (*input-last* nil)             ; last token read
         (*input-token-cache* (make-array 32 :adjustable t :fill-pointer 0 :initial-element nil))
         (*input-datum* nil)            ; last token parsed
         (*input-eof* nil)              ; note end of file
         (*input-reread-char* nil)
         (*tal-input (make-instance 'tal-input))
         (*input-buffer* (make-array 8 :element-type 'character :adjustable t :fill-pointer 0))
         (bnfp::*atn-input *tal-input)
         )
    (funcall function)))


(defGeneric parse-tales (source &rest args)
  (:documentation
   "establish a new parsing context and parse a tal-expression.")
  (:method ((stream stream) &rest args
            &key (start-name '|Tales|)
            &allow-other-keys
            )
           ;; check settings for name handling
           (apply #'call-with-tales-parse-environment
                  #'(lambda ()
                      (multiple-value-bind (result index complete)
                                           (apply #'|Tales-Parser| *tal-input
                                                  :start-name start-name
                                                  args)
                        ;; (break)
                        (if complete
                          (values result index)
                          (xml-error 'incomplete-parse :result result
                                     :document stream))))
                  stream
                  args))
  (:method ((source string) &rest args)
           (with-input-from-string (stream source)
             (apply #'parse-tales stream args))))

(defun parse-define (string) (parse-tales string :start-name '|DefineArgument|))
(defun parse-expression (string) (parse-tales string :start-name '|Expression|))
(defun parse-attributes (string) (parse-tales string :start-name '|AttributesArgument|))
(defun parse-condition (string) (parse-tales string :start-name '|ConditionArgument|))
(defun parse-replace (string) (parse-tales string :start-name '|ReplaceArgument|))
(defun parse-content (string) (parse-tales string :start-name '|ContentArgument|))
(defun parse-repeat (string) (parse-tales string :start-name '|RepeatArgument|))
(defun parse-on-error (string) (parse-tales string :start-name '|OnErrorArgument|))
(defun parse-omit-tag (string) (parse-tales string :start-name '|OmitTagArgument|))

;(parse-repeat "car python:['honda','subaru','acura']")
;(parse-replace "var:car")
;(parse-attributes "href python:'http://python.org' ")
;(parse-define "global x str:<h3>Header Level 3</h3>")
;(parse-define "global x python:'&' + 'nbsp;;' + x")
;(parse-define "local x python:1")
;(parse-define "x python:1")
;(parse-replace "structure x")
;(parse-content "structure x")
;(parse-expression "str: asdf qwer")
;(parse-tales "str: asdf qwer" :start-name '|StringExpression|)
;(untrace token-reader |StringExpression| |StringExpressionElement| |IS-PlainStringElement| |IS-StringData|)


:EOF

