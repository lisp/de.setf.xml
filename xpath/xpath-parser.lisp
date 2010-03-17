;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  the structure of XPTR is defined.
  the abstract structure is described in BNF. this description is translated
  into lisp. provisions are present to either export the formulation to a file
  and compile it from there, load the external file, or evaluate the lisp
  formulation directly.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20011220' AUTHOR='MS'>
   fix to compile pathname</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PATH")

(defParameter *xpath-nonterminals*
  '(|LocationPath| |RelativeLocationPath| |AbsoluteLocationPath|
   |AbsoluteLocationPath| |RelativeLocationPath| |AbbreviatedAbsoluteLocationPath|
   |RelativeLocationPath| |Step| |AbbreviatedRelativeLocationPath|
   |AxisSpecifier| |NodeTest| |Predicate| |AbbreviatedStep|
   |AxisName| |AbbreviatedAxisSpecifier|
   |NameTest| |NodeType| |Literal|
   |Predicate| |PredicateExpr|
   |Expr|
   |RelativeLocationPath|
   |OrExpr|
   |PrimaryExpr| |VariableReference| |Number| |FunctionCall|
   |FunctionName| |Argument| |ArgumentSequence|
   |UnionExpr| |PathExpr|
   |LocationPath| |FilterExpr|
   |AndExpr|
   |EqualityExpr|
   |RelationalExpr|
   |AdditiveExpr|
   |MultiplicativeExpr|
   |UnaryExpr| |MultiplyOperator|
   |ExprToken|
   |Operator| |FunctionName| |AxisName| |Literal|
   |VariableReference|
   |OperatorName|
   |QName| |Prefix| |LocalPart| |WildName|
   )
  "xpath grammar symbols appear in the parse result tree")


(eval-when (:compile-toplevel :load-toplevel :execute)

(defun |IS-Literal| (x)
  ;(when (and (or (symbolp x) (stringp x)) (string-equal x "warning")) (break))
  (stringp x))
(defun |IS-Number| (x) (numberp x))
(defun |IS-NC| (x) (or (alpha-char-p x) (find x ".-_" :test #'eql)))
(defun |IS-NCName| (x)
  (and (symbolp x)
       (not (member x '(|.| |..|) :test #'string-equal))
       (not (member x *node-types*))
       (let ((name (symbol-name x)))
         (and (xml-initial-namechar? (schar name 0))
              (not (find-if (complement #'xml-namechar?)
                            name :start 1))))))
 )

;;
;;
;;


(compile-atn-system #p"xml:bnf;xpath-grammar.bnf"
                    :compile nil        ; rely on system definition
                    :load nil           
                    :execute nil
                    :start-name '|Expr|
                    :package *token-package*
                    :pathname "xml:xpath;grammar;xpath-grammar.lisp")


;;
;;
;;

(defMethod xpath-parser ((input atn-sequence-input) &rest args
                         &aux
                         (*namespace-bindings*
                          (or *namespace-bindings*
                              (make-document-namespace-bindings)))
                         (*namespace-mode* :copy))
  (multiple-value-bind (result index success)
                       (apply #'|LocationPath-Parser| input args)
    (if success
      (values `(lambda (xpa:*context-node*) ,result)
              index success)
      (values result index success))))

(defMethod xpath-parser ((input string) &rest args)
  (let ((*package* *token-package*)
        (tokens (xpath-tokenizer input)))
    (apply #'xpath-parser tokens args)))

(defMethod xpath-parser ((input sequence) &rest args
                         &key trace start-name &allow-other-keys)
  (when trace
    (let ((*print-array* t))
      (format *trace-output* "~%net ~a~@[/~s~] on ~s"
              'xpath-parser start-name input)))
  (apply #'xpath-parser (make-instance 'atn-sequence-input :sequence input)
         args))



;;
;;

(defMethod |!-reader|
           ((stream stream) (char (eql #\?)) (sub t))
  (let ((buffer #.(make-array 0 :fill-pointer 0 :adjustable t)))
    (setf (fill-pointer buffer) 0)
    (loop (when (eql (setf char (read-char stream)) #\?)
            (return (xpath-parser (make-array (length buffer)
                                              :element-type 'character
                                              :initial-contents buffer))))
          (if (eql char #\\)
            (vector-push-extend (read-char stream) buffer) 
            (vector-push-extend char buffer)))))


;(print *locationpath-parser-grammar*)
;(inspect (bnfp::symbol-atn-node-source 'LocationPath-Parser '|LocationPath|))

:EOF

