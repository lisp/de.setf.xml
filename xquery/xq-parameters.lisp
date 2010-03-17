;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010318' AUTHOR='JAA'></DELTA>
  <DELTA DATE='20010530' VERSION='0.501'>
   first version of the parser / compiler combination</DELTA>
  <DELTA DATE='20010612'>token variations for 20010607 version</DELTA>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010910' VERSION='0.503'>parallel to xparser tokenizers</DELTA>
  <DELTA DATE='20010910' VERSION='0.504'>
   successfully parses WD-xmlquery-use-cases-20010608</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
 |#

(in-package "XML-QUERY")

(defParameter *version* "0.504")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defTokens
    "ASCENDING" "DESCENDING" "NOT"))
;;
;; tokens are case-insensitive, thus a hastable is not indicated.
;; the collection is held as a list, with the value present serving as
;; the canonical token.

(defParameter *literal-tokens* nil)

(defun register-token (token &aux old)
  (when (setf old (find token *literal-tokens* :test #'string-equal))
    (setf *literal-tokens* (delete old *literal-tokens*)))
  (push token *literal-tokens*)
  token)

(defun token (token)
  (find token *literal-tokens* :test #'string-equal))

(defmacro defLiteralToken (string)
  (let ((token (intern string *token-package*)))
    `(register-token ',token)))

(defMacro defLiteralTokens (&rest strings)
  `(progn
     ,@(mapcar #'(lambda (string) `(defLiteralToken ,string)) strings)))


;; terminals

(defParameter *xquery-nonterminals*
  '(|Query| |ContextDecl| |FunctionDefn|
    |ParameterList| |Parameter| |Datatype| |SimpleDatatype|
    |Expr| |ExprList| |FlwrExpr| |ForClause| |LetClause| |WhereClause|
    |ReturnClause| |SortSpecList| |SortSpec| |ElementConstructor|
    |PathExpr| |Path| |Step| |NodeGenerator| |Predicate|
    |NameTest| |NameTestPrefix| |NameTestLocalName|
    |NodeType| |StartTag| |TagName| |FunctionName| |AttributeList|
    |AttributeName| |EndTag| |QName| |Prefix| |PrefixName| |LocalName|
    |BinaryOp| |LogicalOp| |CompareOp| |ArithOp| |UnaryOp| |WildName|)
  "xquery grammar symbols appear in the parse result tree")


;; metasymbols

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defTokens
    "{" "}" "(" ")" "[" "]" "&" "&#" "@" "," "*" "*:" ";" ":" ":=" "::" ":*"
    "=" "==" "!=" "!==" "<" "<=" ">" ">=" "." ".." "</" "/>"
    "<!--" "-->" "->" "<?" "?>"
    "<![CDATA[" "]]>"
    "/" "//" "¯" "^" "-" "+" "|"))

;; keywords
(defLiteralTokens
  "AND" "AFTER" "ASCENDING" "BEFORE" 
  "CASE" "CAST" "COMMENT"
  "DEFAULT" "DESCENDING" "DIV"
  "ELEMENT" "ELSE" "EVERY" "EXCEPT" "FOR" "FUNCTION"
  "IF" "IN" "INSTANCEOF" "INTERSECT" "LET" "LIST"
  "MOD"
  "NAMESPACE" "NODE" "NOT" "OR"
  "PROCESSING-INSTRUCTION"
  "RANGE" "RETURN" "RETURNS" "SATISFIES" "SOME" "SORTBY"
  "TEXT" "THEN" "TO" "TREAT" "UNION" "WHERE")

(defParameter *quote-token* nil
  "binds the opening token for a literal")


(defParameter *xq-package* (find-package "XQ"))
(defParameter *XQA-PACKAGE* (find-package "XQA"))
(defparameter *XSD-PACKAGE* (find-package "XSD"))


(defParameter *unbound* '(UNBOUND))
(defParameter *type-variables* nil
  "binds declared type variables")
(defParameter *variable-types* nil
  "binds local variable value type declarations")
(defParameter *variables* nil
  "binds variable type declarations in the parse/compile environment to check 
   types and/or for constant values.")
(defParameter *function-types* nil
  "binds declared function types")
(defParameter *functions* nil
  "binds declared functions")



:EOF
