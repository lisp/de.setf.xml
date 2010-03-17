;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  xpath component initialization from parsed terms.
  this file comprises the class definitions, initialization functions,
  accessors, and constructors which accept parse terms.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
  <DELTA DATE='20010306' AUTHOR='JAA'>
   replaced with a version which instantiates 'in-line' within the parser
   </DELTA>
  <DELTA DATE='20011211'>corrections to NameTest-Constructor for name instances
   </DELTA>
 </DOCUMENTATION>
|#
(in-package "XML-PATH")

#|

(defMethod initialize-instance :around
           ((instance path-element) &rest initargs
            &key term)
  (apply #'call-next-method instance
         (nconc (compute-term-properties instance (first term) (rest term))
                initargs)))
        

;;
;;
;; term property generation

(defGeneric compute-term-properties (context key terms)
  (:argument-precedence-order terms key context)
  (:method ((context t) (key null) (forms t)) nil)
  (:method ((context t) (key t) (forms null)) nil)
  (:method ((context t) (key t) (forms t))
           (warn "no method to computer properties for term: ~s: ~s."
                 key forms)
           nil))

(defun collect-term-properties
       (context key forms-list &aux list-properties)
  (mapc #'(lambda (forms &aux properties)
            (setf properties (compute-term-properties context key forms))
            (loop (destructuring-bind (key value &rest rest)
                                      properties
                    (push value (getf list-properties key))
                    (if rest (setf properties rest) (return)))))
        forms-list)
  (mapcar #'(lambda (e) (if (consp e) (nreverse e) e)) list-properties))
|#

(defun path-syntax-error (&optional (message "syntax error in path.") &rest args)
  (apply #'xml-error message args))

;;
;;
;;

(defun |AbbreviatedAbsoluteLocationPath-Constructor|
       (double-slash relative-path)
  (cond ((and double-slash relative-path)
         `(xpa:path (xpa:root-step)
                    (xpa:wild-inferior-step)
                    ,@(rest relative-path)))
        (t (path-syntax-error))))

(defun |AbbreviatedAxisSpecifier-Constructor| (structure) structure)

#|
(defun |AbbreviatedRelativeLocationPath-Constructor|
       (double-slash relative-path step)
    (cond ((and step double-slash relative-path)
           `(xpa:path ,step (xpa:wild-inferior-step) ,@(rest relative-path)))
          (t (path-syntax-error))))|#

(defun |AbbreviatedStep-Constructor| (token)
  (case token
    (|xml|:|.| '(xpa:self-step))
    (|xml|:|..| '(xpa:parent-step))
    (t (path-syntax-error "bbreviation not recognized: '~s'." token))))

(defun |AbsoluteLocationPath-Constructor| (aal-path relative-path single-slash)
    (cond (single-slash
           `(xpa:path (xpa:root-step) ,@(rest relative-path)))
          (aal-path aal-path)
          (t (path-syntax-error))))

(defun |AdditiveExpr-Constructor| (additive-expr additive-op multiplicative-expr)
  (cond (additive-expr (list additive-op multiplicative-expr additive-expr))
        (multiplicative-expr multiplicative-expr)
        (t (path-syntax-error))))

(defun |AdditiveInverse-Constructor| (unary)
  (cond (unary (list 'xpa:|-| unary))
        (t (path-syntax-error))))

(defun |AdditiveOp-Constructor| (op)
  (case op
    (|xml|:|+| 'xpa:|+|)
    (|xml|:|-| 'xpa:|-|)
    (path-syntax-error)))

(defun |AndExpr-Constructor| (and-expr and-op equality-expr)
  (cond (and-expr (list equality-expr and-op and-expr))
        (equality-expr equality-expr)
        (t (path-syntax-error))))

(defun |andOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|and|)

(defun |Argument-Constructor| (expr)
  (if expr expr (path-syntax-error)))

(defun |AxisName-Constructor| (structure)
  (case structure
    (|xml|:|ancestor| 'xpa:ancestor)
    (|xml|:|ancestor-or-self| 'xpa:ancestor-or-self)
    (|xml|:|attribute|  xpa:attribute)
    (|xml|:|child| 'xpa:child)
    (|xml|:|descendant| 'xpa:descendant)
    (|xml|:|descendant-or-self| 'xpa:descendant-or-self)
    (|xml|:|following| 'xpa:following)
    (|xml|:|following-sibling| 'xpa:following-sibling)
    (|xml|:|namespace| 'xpa:namespace)
    (|xml|:|parent| 'xpa:parent)
    (|xml|:|preceding| 'xpa:preceding)
    (|xml|:|preceding-sibling| 'xpa:preceding-sibling)
    (|xml|:|self| 'xpa:self)
    (t (path-syntax-error))))

(defun |AxisSpecifier-Constructor| (abbreviation axis-name)
  (cond (axis-name axis-name)
        (abbreviation 'xpa:attribute)
        (t (path-syntax-error))))

(defun |EqualityExpr-Constructor| (equality-expr equality-op relational-expr)
  (cond (equality-expr (list equality-op relational-expr equality-expr))
        (relational-expr relational-expr)
        (t (path-syntax-error))))

(defun |EqualityOp-Constructor| (structure)
  (case structure
    (|xml|:|=| 'xpa:|=|)
    (|xml|:|!=| 'xpa:|!=|)))

(defun |Expr-Constructor| (or-expr)
  or-expr)

(defun |divOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|/|)

(defun |DoubleSlash-Constructor| (structure) structure)

(defun |eqOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|=|)

(defun |FilterExpr-Constructor| (filter predicate primary)
  (cond (primary)
        ((or predicate filter)
         (unless (and predicate filter) (path-syntax-error))
         (cons predicate filter))
        (t (path-syntax-error))))

(defun |FunctionCall-Constructor| (argument* function-name)
  (cond (function-name
         (list* 'xpa::funcall function-name (nreverse argument*)))
        (t (path-syntax-error))))

(defun |FunctionName-Constructor| (qname)
  ;; assert the path algebra as the default namespace for function names
  (unless (getf (rest qname) :prefix)
    (setf (getf (rest qname) :namespace) "XPA"))
  qname)

(defun |geOp-Constructor| (structure) 
  (declare (ignore structure))
  'xpa:|<=|)

(defun |gtOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|>|)

(defun |leOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|>=|)

(defun |Literal-Constructor| (x) x)

(defun |LocalPart-Constructor| (name) name)

(defun |LocationPath-Constructor| (absolute-location-path relative-location-path)
  (if absolute-location-path absolute-location-path relative-location-path))

(defun |ltOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|<|)

(defun |minusOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|-|)

(defun |modOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|mod|)

(defun |MultiplicativeExpr-Constructor| (multiplicative-expr multiplicative-op unary-expr)
  (cond (multiplicative-expr (list multiplicative-op unary-expr multiplicative-expr))
        (unary-expr unary-expr)
        (t (path-syntax-error))))

(defun |MultiplicativeOp-Constructor| (structure)
  (case structure
    (|xml|:|div| 'xpa:|/|)
    (|xml|:|mod| 'xpa:|mod|)
    (|xml|:|*| 'xpa:|*|)
    (t (path-syntax-error))))

(defun |NameTest-Constructor| (local-part prefix-test wild-name)
  `(xpa:name-test
    :name
    (xpa:uname :local-part ,(if wild-name (local-part wild-name)
                                (if local-part (string local-part)
                                    nil))
               ,@(when prefix-test (list :prefix (string prefix-test))))))

(defun |NCName-Constructor| (name) name)

(defun |neqOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|!=|)

(defAlternativeConstructor |NodeTest-Constructor| )

(defun |NodeType-Constructor| (structure) structure)

(defun |notOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|not|)

(defun |Number-Constructor| (x) x)

(defun |OrExpr-Constructor| (and-exp or-exp or-op)
  (cond (or-exp (list or-op and-exp or-exp))
        (and-exp and-exp)
        (t (path-syntax-error))))

(defun |orOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|or|)

(defun |PathExpr-Constructor|
       (double-slash filter-expr location-path relative-path single-slash)
  (cond (relative-path
         (unless (and filter-expr (or single-slash double-slash))
           (path-syntax-error))
         (list 'xpa::apply-path
               (if double-slash
                 `(xpa:path ,filter-expr
                            (xpa:step (xpa:descendant-or-self))
                            ,@(rest relative-path))
                 `(xpa:path ,filter-expr
                            (xpa:step (xpa:child))
                            ,@(rest relative-path)))
               'xpa:*context-node*))
        (filter-expr)
        (location-path
         (list 'xpa::apply-path location-path 'xpa:*context-node*))
        (t (path-syntax-error))))

(defun |PiTest-Constructor| (literal)
  (xpa:pi-test :target literal))

(defun |plusOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|+|)

(defun |Predicate-Constructor| (expr)
  (cond (expr
         `(xpa:predicate :expression ,expr))
        (t (path-syntax-error))))

(defun |PredicateExpr-Constructor| (expr)
  expr)

(defun |Prefix-Constructor| (name) name)

(defun |PrefixTest-Constructor| (ncname wild-name)
  (if ncname ncname wild-name))

(defAlternativeConstructor |PrimaryExpr-Constructor| )

(defun |QName-Constructor| (local-part prefix)
  (unless local-part (path-syntax-error))
  `(xpa:uname ,@(when prefix (list :prefix (string prefix)))
              :local-part ,(string local-part)))

(defun |RelationalExpr-Constructor| (additive-expr relational-expr relational-op)
  (cond (relational-expr (list relational-op additive-expr relational-expr))
        (additive-expr additive-expr)
        (t (path-syntax-error))))

#|
(defun |RelativeLocationPath-Constructor|
       (arl-path rel-path single-slash step)
  (declare (ignore single-slash))
  (cond (step `(xpa:path ,step ,@(rest rel-path)))
        (arl-path arl-path)
        (t (path-syntax-error))))|#

(defun |RelativeLocationPath-Constructor|
       (double-slash relative-path single-slash step)
  (cond (relative-path
         (if single-slash
           `(xpa:path ,step ,@(rest relative-path))
           (if double-slash
             `(xpa:path ,step (xpa:wild-inferior-step) ,@(rest relative-path))
             (path-syntax-error))))
        (step `(xpa:path ,step))
        (t (path-syntax-error))))

(defun |RelationalOp-Constructor| (op)
  (case op
    (|xml|:|<| 'xpa:|<|)
    (|xml|:|<=| 'xpa:|<=|)
    (|xml|:|>| 'xpa:|>|)
    (|xml|:|>=| 'xpa:|>=|)
    (path-syntax-error)))

(defun |SingleSlash-Constructor| (structure) structure)

(defun |Step-Constructor|
       (abbreviated-step axis-specifier node-test predicate*)
  (cond (abbreviated-step abbreviated-step)
        (node-test
         `(xpa:step ,(if axis-specifier `(,axis-specifier) '(xpa:child))
                    ,node-test
                    ,@(nreverse predicate*)))
        (t
         (path-syntax-error))))

(defun |timesOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|*|)

(defun |TypeTest-Constructor| (type)
  (ecase type
    (|xml|:|comment| '(xpa:comment-test))
    (|xml|:|processing-instruction| '(xpa:pi-test))
    (|xml|:|text| '(xpa:text-test))
    (|xml|:|node| '(xpa:type-test :type '{xsd}element))))

(defun |UnaryExpr-Constructor| (additive-inverse-expr union-expr)
  (cond ((if union-expr union-expr additive-inverse-expr))
        (t
         (path-syntax-error))))

(defun |UnionExpr-Constructor| (path-expr union-expr union-op)
  (declare (ignore union-op))
  (cond (union-expr `(|xml|:|union| ,path-expr ,union-expr))
        (path-expr path-expr)
        (t (path-syntax-error))))

(defun |unionOp-Constructor| (structure)
  (declare (ignore structure))
  'xpa:|union|)

(defun |VariableReference-Constructor| (qname)
  `(xpa::variable ,qname))

(defun |WildName-Constructor| (structure)
  (declare (ignore structure))
  *wild-name*)

;;
;;










:EOF