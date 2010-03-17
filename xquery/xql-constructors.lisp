;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  constructor methods for use with the parser/reader for the query algebra
  in the form specified by the query language.
  consistent with the bnf in "XQ-grammar.bnf".
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010515' AUTHOR='JAA'/>
  <DELTA DATE='20010605'>provisional results for FunctionLibrary</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#
(in-package "XML-QUERY")

;; the reordering includes flwr/let, but it's not clear that it will work

(defParameter *binary-operators*
  '(XQA:DIFFERENCE XQA:INTERSECTION XQA:UNION
    XQA:* XQA:DIV XQA:MOD XQA:+ XQA:- XQA:RANGE-TEST
    XQA:< XQA:<= XQA:> XQA:>= XQL:INSTANCEOF XQA:= XQA:== XQA:!= XQA:!==
    XQA:FOR XQA:LET
    XQA:BEFORE XQA:AFTER XQA:AND 
    XQA:|\|| XQA:OR XQA:SORT))

(defParameter *comparison-operators*
  '(XQA:= XQA:< XQA:<= XQA:> XQA:>= XQA:!= XQL:INSTANCEOF))

(defun binary-expression-constructor (operator expr1 expr2 &aux expr2-op-pos op-pos)
  "binary expressions must observe operator precedence."
  (if (and (consp expr2)
           (setf op-pos (position operator *binary-operators*))
           (setf expr2-op-pos (position (first expr2) *binary-operators*))
           (> expr2-op-pos op-pos))
    ;; reorder operators according to precedence
    (list (first expr2)
          (list operator expr1 (second expr2))
          (third expr2))
    (list operator expr1 expr2)))

(defun construct-flattened-sequence (expr*)
  (flet ((nested-sequence? (element)
           (and (consp element) (eq (first element) 'xqa:|sequence|))))
    (if (find-if #'nested-sequence? expr*)
      (let ((result nil))
        (dolist (element expr*)
          (cond ((nested-sequence? element)
                 (dolist (nested-element (nreverse (rest element)))
                   (push nested-element result)))
                (t
                 (push element result))))
        `(xqa:|sequence| ,@result))
      `(xqa:|sequence| ,@(nreverse expr*)))))

(defConstructor |AdditiveExpr-Constructor| (additive-op expr-arg1 expr-arg2)
  (binary-expression-constructor additive-op expr-arg1 expr-arg2))

(defConstructor |AdditiveOp-Constructor| (op)
  (case op
    (|xml|::|-| 'XQA:|-|)
    (|xml|::|+| 'XQA:|+|)
    (t (xml-error 'undefined-function :name op))))

(defConstructor |AndExpr-Constructor| (expr-arg1 expr-arg2)
  (binary-expression-constructor 'XQA:AND expr-arg1 expr-arg2))

(defConstructor |AnyKindTest-Constructor| ()
  `(xpa:type-test :type NODE))

(defConstructor |AppliedPath-Constructor| (double-slash expr-wo-path path single-slash)
  (cond (single-slash
         `(xpa::APPLY-PATH (xpa:path (xpa:step (xpa:child)
                                               ,@(cddr (second path)))
                                     ,@(cddr path))
                          ,expr-wo-path))
        (double-slash
         `(xpa::APPLY-PATH (xpa:path (xpa:step (xpa:descendant-or-self)
                                               ,@(cddr (second path)))
                                     ,@(cddr path))
                           ,expr-wo-path))
        (t (error "AppliedPath syntax error."))))

(defConstructor |AtOp-Constructor| (token)
  token)

(defConstructor |Attribute-Constructor| (attribute-value enclosed-expr name-spec)
  `(xql:attribute ,name-spec ,(or attribute-value enclosed-expr)))

(defConstructor |AttributeValue-Constructor| (attribute-value-content*)
  (if (rest attribute-value-content*)
    (nreverse attribute-value-content*)
    (first attribute-value-content*)))

(defAlternativeConstructor |AttributeValueContent-Constructor| )

(defConstructor |AttributeList-Constructor| (attribute+)
  (nreverse attribute+))

(defConstructor |AttributeName-Constructor| (qname variable)
  (if qname qname variable))

(defConstructor |Axis-Constructor| (at-op ncname)
  (if at-op at-op ncname))

(defConstructor |AxisStepExpr-Constructor| (axis node-test step-qualifiers*)
  `(xpa:step ,(if (eq axis '|xml|:|@|)  '(xpa:attribute) `(,axis))
             ,node-test
             ,@(nreverse step-qualifiers*)))

(defConstructor |BeforeAfterExpr-Constructor| (expr-arg1 expr-arg2 order-op)
  (binary-expression-constructor order-op expr-arg1 expr-arg2))

(defConstructor |BeforeAfterOp-Constructor| (op)
  (or (rest (assoc op '((|xml|:BEFORE . XQA:|BEFORE|)
                        (|xml|:AFTER . XQA:|AFTER|))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

#|
(defConstructor |BinaryOp-Constructor| (op)
  (case op
    (|xml|::|UNION| 'XQA:|union|)
    (|xml|::|BEFORE| 'XQA:|BEFORE|)
    (|xml|::|AFTER| 'XQA:|AFTER|)
    (|xml|::|\|| 'XQA:|or|)
    (|xml|::|EXCEPT| 'XQA:|DIFFERENCE|)
    (|xml|::|OR| 'XQA:|or|)
    (|xml|::|AND| 'XQA:|and|)
    (|xml|::|+| 'XQA:|+|)
    (|xml|::|-| 'XQA:|-|)
    (|xml|::|DIV| 'XQA:|DIV|)
    (|xml|::|MOD| 'XQA:|MOD|)
    (|xml|::|*| 'XQA:|*|)
    (|xml|::|=| 'XQA:|=|)
    (|xml|::|<| 'XQA:|<=|)
    (|xml|::|>| 'XQA:|>|)
    (|xml|::|<=| 'XQA:|<=|)
    (|xml|::|>=| 'XQA:|>=|)
    (|xml|::|!=| 'XQA:|!=|)
    (t (xml-error 'undefined-function :name op))))
|#

(defConstructor |CaseClause-Constructor| (datatype expr)
  `(xqa::case ,datatype ,expr))

(defConstructor |CastExpr-Constructor| (cast-op datatype expr treat-op)
  `(,(cond (cast-op 'xql:cast)
           (treat-op 'xql:treat)
           (t (error "ExprCast syntax error.")))
    ,expr ,datatype))

(defConstructor |CastOp-Constructor| (token)
  token)

(defConstructor |CDataCharData-Constructor| (datum)
  datum)

(defConstructor |CDataSection-Constructor| (datum)
  `(xqa:|cdata| ,datum))

(defConstructor |CharData-Constructor| (datum)
  datum)

(defConstructor |CharRef-Constructor| (char-ref-data &aux (radix 10) (start 0) code)
  ;; in contrast to the full xml parser, charater references are handled
  ;; here as parsed structures - thus the conversion in the constructor
  (when (char= (char char-ref-data 0) #\x)
    (setf radix 16)
    (setf start 1))
  (setf code (ignore-errors (parse-integer char-ref-data
                                           :radix radix :start start)))
  (cond ((and code (xml-char? code) (<-char-code-limit code))
         (code-char code))
        (t
         (xml-error |WFC: Legal Character| :name char-ref-data :code code))))

(defConstructor |CharRefData-Constructor| (datum)
  datum)

(defConstructor |CommentConstructor-Constructor| (char-data)
  `(xqa:|comment| ,char-data))

(defConstructor |CommentTest-Constructor| ()
  `(xpa:type-test :type COMMENT))

(defConstructor |ContextDecl-Constructor| (namespace-decl schema-decl)
  (if namespace-decl namespace-decl schema-decl))

(defConstructor |Datatype-Constructor| (qname)
  qname)

(defConstructor |DefaultExpr-Constructor| (expr)
  expr)

(defConstructor |DotDot-Constructor| (token)
  token)

(defConstructor |Dot-Constructor| (token)
  token)

(defConstructor |DoubleSlash-Constructor| (token)
  (declare (ignore token))
  'XQA:|//|)

(defConstructor |ElementConstructor-Constructor| (element-content* end-tag start-tag)
  (destructuring-bind (&key attribute-list tag-name)
                      start-tag
    ;; wrap the sequences to ensure that they are flattened
    `(xql:element ,tag-name
                  ,(when attribute-list
                     (construct-flattened-sequence attribute-list))
                  ,(when element-content*
                     (construct-flattened-sequence element-content*))
                  ,end-tag)))


(defAlternativeConstructor |ElementContent-Constructor| )

(defConstructor |EnclosedExpr-Constructor| (expr)
  expr)

(defConstructor |EndTag-Constructor| (tag-name)
  tag-name)

(defConstructor |EntityOp-Constructor| (op)
  (or (find op '({}lt {}gt {}amp {}apos {}quot)
            :test #'string-equal :key #'local-part)
      (xml-error 'undefined-function :name op)))

(defConstructor |EqualityExpr-Constructor| (equality-op expr-arg1 expr-arg2)
  (binary-expression-constructor equality-op expr-arg1 expr-arg2))

(defConstructor |EqualityOp-Constructor| (op)
  (or (rest (assoc op '((|xml|::|=| . XQA:|=|)
                        (|xml|::|!=| . XQA:|!=|)
                        (|xml|::|==| . XQA:|==|)
                        (|xml|::|!==| . XQA:|!==|))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defConstructor |EveryExpr-Constructor| (expr expr-test variable)
  `(xql:every ,variable ,expr ,expr-test))

(defAlternativeConstructor |Expr-Constructor| )

(defConstructor |ExprArg1-Constructor| (expr)
  expr)

(defConstructor |ExprArg2-Constructor| (expr)
  expr)

(defConstructor |ExprBinary-Constructor| (binary-op expr expr-wo-binary
                                           &aux op-pos expr-op-pos)
  "binary expressions must observe operator precedence and
   force path dereferencing for their arguments."
  (if (and (consp expr)
           (setf op-pos (position binary-op *binary-operators*))
           (setf expr-op-pos (position (first expr) *binary-operators*))
           (> expr-op-pos op-pos))
    ;; reorder operators according to precedence
    (list (first expr)
          (list binary-op expr-wo-binary (second expr))
          (third expr))
    (list binary-op expr-wo-binary expr)))

(defAlternativeConstructor |ExprContent-Constructor| )

(defConstructor |ExprDot-Constructor| (token)
  (declare (ignore token))
  'XQA:|.|)

(defConstructor |ExprSequence-Constructor| (expr*)
  ;; wrap the sequence to ensure that they are flattened
  (construct-flattened-sequence expr*))

(defConstructor |ExprTest-Constructor| (expr) expr)

(defConstructor |ExprUnary-Constructor| (exp unary-op)
  (list unary-op exp))

(defConstructor |FlwrExpr-Constructor| (flwr-expr-for-let+ return-clause where-clause)
  (let ((form return-clause))
    (when where-clause
      (setf form `(when ,where-clause ,form)))
    (setf flwr-expr-for-let+ (reverse flwr-expr-for-let+))
    (dolist (for-let* flwr-expr-for-let+)
      (dolist (for-let for-let*)
        ;(break)
        ;; (setf form ;; (append for-let (list form)))))
        (setf form (binary-expression-constructor
                    (first for-let) (second for-let) form))))
    form))

(defConstructor |FlwrExprForLet-Constructor| (for-clause let-clause)
  (if for-clause for-clause let-clause))

(defConstructor |FlwrForBinding-Constructor| (expr variable)
  (list variable expr))

(defConstructor |FlwrLetBinding-Constructor| (expr variable)
  (list variable expr))

(defConstructor |ForClause-Constructor| (for-binding*)
  (mapcar #'(lambda (binding) `(xqa::for ,binding))
          (nreverse for-binding*)))

(defConstructor |FunctionCall-Constructor| (expr* qname)
  `(xql:funcall ,qname ,@(nreverse expr*)))

(defConstructor |FunctionDefn-Constructor| (datatype expr parameter-list qname)
  ;; bind the type immediately, return the evaluation form
  `(xql:function ,qname ,parameter-list ,datatype ,expr))

(defConstructor |FunctionName-Constructor| (qname)
  qname)

(defConstructor |InstanceofExpr-Constructor| (datatype expr only-op)
  `(xql:instanceof ,expr ,datatype ,(not (null only-op))))


(defConstructor |LetClause-Constructor| (for-binding*)
  (mapcar #'(lambda (binding) `(xqa::let ,binding))
          (nreverse for-binding*)))

(defConstructor |Literal-Constructor| (numeric-literal string-literal)
  (let ((value (if numeric-literal numeric-literal string-literal)))
    (etypecase value
      (cons (second value))
      (number value)
      (string value))))

(defConstructor |LocalName-Constructor| (namestring)
  namestring)


(defConstructor |GlobalVariableDeclaration-Constructor| (exp typed-var)
  ;; the type is already bound, return the evaluation form
  (typecase typed-var
    (symbol `(xqa::let ,typed-var ,exp))
    (t (error "GlobalVariableDeclaration syntax error: ~s."
              (list exp typed-var)))))

(defConstructor |Identifier-Constructor| (string)
  string)

(defConstructor |IfExpr-Constructor| (expr expr-if-else expr-if-then)
  `(if ,expr ,expr-if-then ,expr-if-else))

(defConstructor |IfElseExpr-Constructor| (expr)
  expr)

(defConstructor |IfThenExpr-Constructor| (expr)
  expr)

(defConstructor |IntersectExceptExpr-Constructor| (expr-arg1 expr-arg2 intersection-except-op)
  (binary-expression-constructor intersection-except-op expr-arg1 expr-arg2))

(defConstructor |IntersectExceptOp-Constructor| (op)
  (or (rest (assoc op '((xql:INTERSECT . xqa:intersection)
                        (xql:EXCEPT . xqa:difference))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defAlternativeConstructor |KindTest-Constructor| )

(defConstructor |ListOp-Constructor| (token)
  token)

(defConstructor |MultiplicativeExpr-Constructor| (expr-arg1 expr-arg2 multiplicative-op)
  (binary-expression-constructor multiplicative-op expr-arg1 expr-arg2))

(defConstructor |MultiplicativeOp-Constructor| (op)
  (or (rest (assoc op '((|xml|::|DIV| . XQA:|DIV|)
                        (|xml|::|MOD| . XQA:|MOD|)
                        (|xml|::|*| . XQA:|*|))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defConstructor |NamePrefix-Constructor| (ncname)
  ncname)

(defConstructor |NamespaceDecl-Constructor| (ncname string-literal)
  (etypecase ncname
    (string (intern-prefix ncname *xmlns-namespace*))
    (null (setf ncname *default-namespace-attribute-name*)))
  `(xql:namespace-decl (,ncname ,string-literal)))

(defConstructor |NamespaceExp-Constructor| (exp) exp)

(defConstructor |NameSpec-Constructor| (expr qname)
  (if expr expr qname))

(defConstructor |NameTarget-Constructor| (name-test-local-name name-test-prefix)
  `(xql:qname ,name-test-prefix ,name-test-local-name))

(defConstructor |NameTest-Constructor| (name-test-prefix ncname wild-name)
 `(xql:qname ,name-test-prefix ,(if ncname ncname wild-name)))

#|(defConstructor |Wildcard-Constructor| (name-prefix ncname)
  (cond (ncname
         `(xql:qname xql:* ,ncname))
        (name-prefix
         `(xql:qname ,name-prefix xql:*))
        (t
         `(xql:qname xql:* xql:*))))|#

(defConstructor |NCName-Constructor| (name)
  ;; leave as a string
  name)

#|
(defConstructor |NodeGenerator-Constructor| (at-op dot-dot name-target name-test node-type)
  (cond (at-op
         ;; the deref is part test / part generator
          (if name-target
          `(xqa:id-test :type {xsd}attribute
                        :name ,name-test
                        :target ,name-target)
          `(xpa:type-name-test :type {xsd}attribute
                              :name ,name-test)))
        (dot-dot
         `(xpa:parent))
        (node-type
         `(xpa:type-test :type ,node-type))
        (name-test
         `(xpa:type-name-test :type {xsd}element
                              :name ,name-test))
        (t
         (error "NodeGenerator syntax error."))))
|#

(defConstructor |NodeTest-Constructor| (kind-test name-test)
  (if kind-test kind-test name-test))

(defConstructor |NodeType-Constructor| (type)
  (ecase type
    (|xml|::NODE '{xsd}anyComplexType)
    (|xml|::TEXT '{xsd}string)
    (|xml|::COMMENT '{xsd}comment)
    (|xml|::PROCESSING-INSTRUCTION '{xsd}pi)))

(defConstructor |NumericLiteral-Constructor| (literal-string &aux datum)
  (setf datum (ignore-errors (read-from-string literal-string)))
  (unless (numberp datum)
    (xml-error "number syntax error: ~s." literal-string))
  datum)

(defConstructor |OnlyOp-Constructor| (op)
  op)

(defConstructor |OrExpr-Constructor| (expr-arg1 expr-arg2 )
  (binary-expression-constructor 'xqa:OR expr-arg1 expr-arg2))

(defConstructor |OtherStepExpr-Constructor| (primary-expr step-qualifier*)
  (if step-qualifier*
    `(xpa:step (xpa:child) ,primary-expr ,@(reverse step-qualifier*))
    primary-expr))
  
(defConstructor |Param-Constructor| (datatype variable)
  (list variable datatype))

(defConstructor |ParamList-Constructor| (parameter*)
  (nreverse parameter*))

(defConstructor |ParenthesizedExpr-Constructor| (expr)
  expr)

(defConstructor |PathExpr-Constructor| (double-slash relative-path single-slash)
  ;; the axis on the first step is replaced with the respective generator
  (cond (single-slash
         `(xpa::APPLY-PATH ,relative-path xpa:*context-node*))
        (double-slash
         `(xpa::APPLY-PATH (xpa:path (xpa:step (xpa:descendant-or-self))
                                     ,@(cdr relative-path))
                          xpa:*context-node*))
        (t
         #|`(xpa::APPLY-PATH ,path xpa:*context-node*)|#
         relative-path)))

(defConstructor |PIConstructor-Constructor| (char-data ncname)
  `(xqa:|processing_instruction| ,ncname ,char-data))

(defConstructor |PITest-Constructor| (string-literal)
  `(xpa:pi-test ,string-literal *wild-namestring*))

(defConstructor |PredefinedEntityRef-Constructor| (entity-op)
  (or (rest (assoc entity-op '(({}lt . "<")
                               ({}gt . ">")
                               ({}amp . "&")
                               ({}quot ."\"")
                               ({}apos . "'"))))
      (xml-error |WFC: Entity Declared| :name entity-op)))

(defConstructor |PredicateExpr-Constructor| (expr )
  `(xpa:predicate :expression ,expr))

(defAlternativeConstructor |PrimaryExpr-Constructor| )

(defConstructor |QName-Constructor|
       (ncname qname-prefix)
  `(xql:qname ,qname-prefix ,ncname))

(defConstructor |QNamePrefix-Constructor| (ncname)
  ncname)

(defConstructor |QueryModule-Constructor| (context-decl* expr function-decl*)
  ;; reorder the forms as type-, variable-, function-declarations followed by
  ;; query expressions. wrap the queries in a form to save the results.
  ;; print the finsl result.
  `(progn ,@(nreverse context-decl*)
          ,@(nreverse function-decl*)
          (sort (remove-duplicates ,expr) #'< :key #'ordinality)))

(defConstructor |QueryModuleList-Constructor| (query-module*)
  (cons 'progn (nreverse query-module*)))

(defConstructor |FunctionLibrary-Constructor| (context-decl* function-defn+)
  ;; the likely use it to write the result to an external store. thus just
  ;; return the elements as a list
  (append (nreverse context-decl*) (nreverse function-defn+)))

(defConstructor |RangeExpr-Constructor| (expr-arg1 expr-arg2)
  `(xqa:range-test :min ,expr-arg1 :max ,expr-arg2))

(defConstructor |RelatedStep-Constructor| (double-slash single-slash step)
  (cond (double-slash
         `((xpa:step (xpa:descendant)) ,step))
        (single-slash
         (list step))
        (t (error "RelatedStep syntax error."))))

(defConstructor |RelationalExpr-Constructor| (expr-arg1 expr-arg2 relational-op)
  (binary-expression-constructor relational-op expr-arg1 expr-arg2))

(defConstructor |RelationalOp-Constructor| (op)
  (or (rest (assoc op '((|xml|::|<| . XQA:|<=|)
                        (|xml|::|>| . XQA:|>|)
                        (|xml|::|<=| . XQA:|<=|)
                        (|xml|::|>=| . XQA:|>=|))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defConstructor |RelativePathExpr-Constructor| (related-step* step)
  (if related-step*
    `(xpa::path ,step ,@(apply #'append (reverse related-step*)))
    step))

(defConstructor |ReturnClause-Constructor| (expr)
  expr)

(defConstructor |SchemaDecl-Constructor| (schema-name string-literal)
  `(xql:schema-decl (,schema-name ,string-literal)))

(defConstructor |SchemaName-Constructor| (string-literal)
  string-literal)

(defConstructor |SimpleDatatype-Constructor| (at-op qname)
  (if at-op `({xsd}attribute ,qname)
      (if qname
        (cond ((string-equal (local-part qname) "ELEMENT")
               '{xsd}element)
              #|this fails for instance names
              ((and (find-class qname nil)
                    (subtypep qname 'xqdm:elem-node-interface))
               `(quote ,qname)
               |#
              ((eq (namespace qname) *xsd-namespace*)
               qname)
              (t
               `({xsd}element ,qname)))
        '{xsd}element)))

(defConstructor |SingleSlash-Constructor| (token)
  (declare (ignore token))
  'XQA:|/|)

(defConstructor |SomeExpr-Constructor| (expr expr-test variable)
  `(xql:some ,variable ,expr ,expr-test))

(defConstructor |SortExpr-Constructor| (expr sort-spec-list)
  `(xqa:sort ,expr ,(apply #'append sort-spec-list)))

(defConstructor |SortOrder-Constructor| (op)
  (or (rest (assoc op '((|xml|:ASCENDING . xqa:<)
                        (|xml|:DESCENDING . xqa:>))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defConstructor |SortSpec-Constructor| (path-expr sort-order)
  `(,path-expr ,(if sort-order sort-order 'xqa:<)))

(defConstructor |SortSpecList-Constructor| (sort-spec*)
  (nreverse sort-spec*))

(defConstructor |StartTag-Constructor| (attribute-list tag-name)
  (list :attribute-list attribute-list :tag-name tag-name))

(defConstructor |Step-Constructor| (node-generator step-qualifier*)
  ;; take a self generator as the default - the thing which the grammar called
  ;; node-generator is really half test / half generator
  `(xpa:step (xpa:child) ,node-generator ,@(nreverse step-qualifier*)))

(defConstructor |StepExpr-Constructor| (axis-step-expr other-step-expr)
  (if axis-step-expr axis-step-expr other-step-expr))

(defAlternativeConstructor |StepQualifier-Constructor| )

(defConstructor |StringLiteral-Constructor| (datum)
  datum)

(defConstructor |StringLiteralData-Constructor| (datum)
  datum)

(defConstructor |TagName-Constructor| (qname variable)
  (if qname qname variable))

(defConstructor |TargetExpr-Constructor| (name-test)
   `(xqa:id-test :type {xsd}attribute
                 :target ,name-test))

(defConstructor |TextTest-Constructor| ()
  `(xpa:type-test :type TEXT))

(defConstructor |TreatOp-Constructor| (token)
  token)

(defConstructor |TypeSwitchExpr-Constructor| (case-clause+ default-expr expr variable)
  (if variable
    `(xqa:match (,variable ,expr) ,@(nreverse case-clause+)
                (xqa:else ,default-expr))
    `(xqa:match (,expr) ,@(nreverse case-clause+)
                (xqa:else ,default-expr))))

(defConstructor |UnaryExpr-Constructor| (expr unary-op)
  `(,unary-op ,expr))

(defConstructor |UnaryOp-Constructor| (op)
  (or (rest (assoc op '((|xml|:NOT . xqa:not)
                        (|xml|:+ . xqa:+)
                        (|xml|:- . xqa:-))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defConstructor |UnionExpr-Constructor| (expr-arg1 expr-arg2 union-or-op)
  (binary-expression-constructor union-or-op expr-arg1 expr-arg2))

(defConstructor |UnionOrOp-Constructor| (op)
  (or (rest (assoc op '((|xml|::|UNION| . 'XQA:|union|)
                        (|xml|::|\|| . 'XQA:|or|))
                   :test #'string-equal))
      (xml-error 'undefined-function :name op)))

(defConstructor |Variable-Constructor| (qname)
  ;; a variable has the form '$ QName', which means it arrives here
  ;; as a qname s-expression. that is here transformed into an interned
  ;; symbol amenable to lambda binding
  (case (first qname)
    (XQL:qname (apply #'intern-variable (rest qname)))
    (t (xml-error "variable syntax error: ~s." qname))))

(defConstructor |WhereClause-Constructor| (expr)
  expr)

(defConstructor |NameTestPrefix-Constructor| (ncname wild-name)
  (if ncname `(prefix-value ,ncname) wild-name))

(defConstructor |Wildcard-Constructor| (name-prefix ncname)
  (cond (ncname
         `(xql:qname xql:* ,ncname))
        (name-prefix
         `(xql:qname ,name-prefix xql:*))
        (t
         `(xql:qname xql:* xql:*))))

(defConstructor |WildName-Constructor| (structure)
  (declare (ignore structure))
  'xql:*)

:EOF  

  
