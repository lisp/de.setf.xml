;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
 this file comprises macros and functions which the query language specifies
 in addition or distinction to those from the algebra.
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 </DOCUMENTATION>
|#

(in-package "XML-QUERY") 


(defMacro xql:element (start-tag attribute-list &optional expression-list end-tag)
  (when (and end-tag (symbolp end-tag))
    ;; where the tag identifiers are variables (as denoted by symbols), then
    ;; the identity can be pre-checked at compile-time.
    (unless (eq end-tag start-tag)
      (xml-error |WFC: Element Type Match|
                    :start-name start-tag :end-name end-tag)))
  (if expression-list
    `(let ((xqa::start-name ,start-tag)
           (xqa::end-name ,end-tag))
       (unless (eq xqa::start-name xqa::end-name)
         (xml-error |WFC: Element Type Match|
                    :start-name xqa::start-name :end-name xqa::end-name))
       (xqa:element xqa::start-name (append ,attribute-list
                                            ,(if (consp expression-list)
                                               (if (eq (first expression-list)
                                                       'xqa:|sequence|)
                                                 (cons 'collect-nodes
                                                       (rest expression-list))
                                                 (cons 'collect-nodes
                                                       expression-list))
                                               `(collect-nodes
                                                 ,expression-list)))))
    `(xqa:element ,start-tag ,attribute-list)))

(defMacro xql:attribute (att-name value)
  `(xqa:attribute ,att-name (mapcar #'value-string (collect-nodes ,value))))

(defMacro xql:every (variable expr test)
  `(xqa:|empty| (xqa:for (,variable ,expr)
                         (xqa:where (xqa:|not| ,test) ,variable))))

(defMacro xql:funcall (name &rest argument-list &aux symbol)
  ;; this is done with funcall and symbol function instead of a list-application
  ;; in order that the function name can be determined at runtime where the
  ;; namespace is bound late.
  (if (setf symbol (compile-time-name name))
    `(,symbol ,@argument-list)
    `(funcall (symbol-function ,name) ,@argument-list)))

(defMacro xql:function (name parameters type body)
  `(xqa:fun ,name ,parameters ,type ,body))

(defMacro xql:instanceof (expr type exact-p)
  (when exact-p
    (warn "exact typep not supported: ~s: ~s." expr type))
  `(xsd:typep ,expr ,type ))

(defMacro xql:namespace-decl ((prefix literal) &rest body)
  ;; bind compile-time environment as well as run-time.
  (setf (prefix-value prefix) (find-namespace literal))
  `(xqa:let (,prefix ,literal) ,@body))

(defMacro xql:qname (prefix local-part)
  ;; a query 'qualified name' denotes a universal name in the algebra
  `(xqa::make-uname (prefix-value ,prefix) ',local-part))

(defMacro xql:schema-decl ((schema-name string-literal))
  ;; load the document definition into a new
  `(xqa:schema ,schema-name ,string-literal))

(defMacro xql:some (variable expr test)
  `(xqa:|not| (xqa:|empty| (xqa:for (,variable ,expr)
                             (xqa:where ,test ,variable)))))


:EOF
