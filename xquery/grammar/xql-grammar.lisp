
(IN-PACKAGE "ATN-PARSER") 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-IntersectExceptOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-NamePrefix|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-SortOrder|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-BeforeAfterOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-EqualityOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-RelationalOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-OnlyOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-AdditiveOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-MultiplicativeOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-UnaryOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-UnionOrOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-IntersectOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-ExceptOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-SingleSlash|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-DoubleSlash|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-AtOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-Dot|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-DotDot|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-WildName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-CastOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-TreatOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IS-EntityOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|QueryModuleList|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|QueryModule|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ContextDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|NamespaceDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|SchemaDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|SchemaName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|FunctionDefn|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ParamList|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Param|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Expr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|SortExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|SortSpecList|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|SortSpec|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|OrExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ExprArg2|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AndExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|BeforeAfterExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|FlwrExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|FlwrExprForLet|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ForClause|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|FlwrForBinding|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|LetClause|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|FlwrLetBinding|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|WhereClause|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ReturnClause|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IfExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IfThenExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IfElseExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|SomeExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|EveryExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ExprTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|TypeSwitchExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|DefaultExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|CaseClause|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|EqualityExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|RelationalExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|InstanceofExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|RangeExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AdditiveExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|MultiplicativeExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|UnaryExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|UnionExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|IntersectExceptExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|PathExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|RelativePathExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|RelatedStep|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|StepExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AxisStepExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|OtherStepExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|StepQualifier|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|PredicateExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|TargetExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Axis|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|PrimaryExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Literal|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|NodeTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|NameTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|NameTestPrefix|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|KindTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|PITest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|CommentTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|TextTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AnyKindTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ParenthesizedExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ExprSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|FunctionCall|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|CastExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Datatype|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ElementConstructor|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|StartTag|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|EndTag|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|NameSpec|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AttributeList|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Attribute|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AttributeValue|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|ElementContent|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|AttributeValueContent|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|CDataSection|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|EnclosedExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|CommentConstructor|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|PIConstructor|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|StringLiteral|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Wildcard|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|Variable|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|PredefinedEntityRef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|CharRef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|QName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|QNamePrefix|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-QUERY::|QueryModuleList-Parser|)) 
(DEFUN XML-QUERY::|IS-IntersectExceptOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (XML-QUERY::|IS-IntersectOp| ITEM) (XML-QUERY::|IS-ExceptOp| ITEM)))))
(DEFUN XML-QUERY::|IS-NamePrefix| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (XML-QUERY::|IS-NCName| ITEM)))))
(DEFUN XML-QUERY::|IS-SortOrder| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::|ascending|) (STRING-EQUAL ITEM '|xml|::|descending|)))))
(DEFUN XML-QUERY::|IS-BeforeAfterOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::|before|) (STRING-EQUAL ITEM '|xml|::|after|)))))
(DEFUN XML-QUERY::|IS-EqualityOp| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM
         (OR (STRING-EQUAL ITEM '|xml|:=)
             (STRING-EQUAL ITEM '|xml|:!=)
             (STRING-EQUAL ITEM '|xml|:==)
             (STRING-EQUAL ITEM '|xml|:!==)))))
(DEFUN XML-QUERY::|IS-RelationalOp| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM
         (OR (STRING-EQUAL ITEM '|xml|:<)
             (STRING-EQUAL ITEM '|xml|:<=)
             (STRING-EQUAL ITEM '|xml|:>)
             (STRING-EQUAL ITEM '|xml|:>=)))))
(DEFUN XML-QUERY::|IS-OnlyOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::|only|)))))
(DEFUN XML-QUERY::|IS-AdditiveOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:+) (STRING-EQUAL ITEM '|xml|:-)))))
(DEFUN XML-QUERY::|IS-MultiplicativeOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:*) (STRING-EQUAL ITEM '|xml|:|div|) (STRING-EQUAL ITEM '|xml|:|mod|)))))
(DEFUN XML-QUERY::|IS-UnaryOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:+) (STRING-EQUAL ITEM '|xml|:-)))))
(DEFUN XML-QUERY::|IS-UnionOrOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:|union|) (STRING-EQUAL ITEM '|xml|:\|)))))
(DEFUN XML-QUERY::|IS-IntersectOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::|intersect|)))))
(DEFUN XML-QUERY::|IS-ExceptOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::|except|)))))
(DEFUN XML-QUERY::|IS-SingleSlash| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:/)))))
(DEFUN XML-QUERY::|IS-DoubleSlash| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|://)))))
(DEFUN XML-QUERY::|IS-AtOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:@)))))
(DEFUN XML-QUERY::|IS-Dot| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:\.)))))
(DEFUN XML-QUERY::|IS-DotDot| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:\..)))))
(DEFUN XML-QUERY::|IS-WildName| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|:*)))))
(DEFUN XML-QUERY::|IS-CastOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::CAST)))))
(DEFUN XML-QUERY::|IS-TreatOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (STRING-EQUAL ITEM '|xml|::TREAT)))))
(DEFUN XML-QUERY::|IS-EntityOp| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM
         (OR (STRING-EQUAL ITEM '|xml|::|lt|)
             (STRING-EQUAL ITEM '|xml|::|gt|)
             (STRING-EQUAL ITEM '|xml|::|amp|)
             (STRING-EQUAL ITEM '|xml|::|quot|)
             (STRING-EQUAL ITEM '|xml|::|apos|)))))
(DEFUN XML-QUERY::|QueryModuleList| (INDEX &AUX (XML-QUERY::|QueryModule| NIL))
  "{1 } QueryModuleList ::= QueryModule (';' QueryModule)*
(|QueryModule|)"
  (DECLARE (SPECIAL XML-QUERY::|QueryModuleList-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|QueryModuleList-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|QueryModuleList-INDEX| INDEX)
      (LET ((XML-QUERY::|QueryModuleList-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|QueryModuleList| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|QueryModuleList-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|QueryModuleList|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|QueryModuleList|)
                                 (RETURN-FROM XML-QUERY::|QueryModuleList| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|QueryModuleList| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|QueryModuleList.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModuleList.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|QueryModuleList|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|QueryModuleList|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|QueryModuleList|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|QueryModule| XML-QUERY::|QueryModule|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|QueryModuleList-Constructor| XML-QUERY::|QueryModule|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|QueryModuleList|
                                                            (DELETE NIL (LIST XML-QUERY::|QueryModule|)))
                                                      'XML-QUERY::|QueryModuleList|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|QueryModuleList.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModuleList.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|QueryModuleList/QueryModuleList.5.6|)
                                     (XML-QUERY::|QueryModuleList/QueryModuleList.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|QueryModuleList.2|) (XML-QUERY::|QueryModuleList.2| INDEX))))
                               (XML-QUERY::|QueryModuleList/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|QueryModuleList/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|QueryModuleList/QueryModuleList.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModuleList/QueryModuleList.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|QueryModuleList/QueryModuleList.5.6|)
                                     (XML-QUERY::|QueryModuleList/QueryModuleList.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|QueryModuleList.2|) (XML-QUERY::|QueryModuleList.2| INDEX))))
                               (XML-QUERY::|QueryModuleList/QueryModuleList.5.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModuleList/QueryModuleList.5.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((STRING-EQUAL |item| '|xml|:\;)
                                            (SETF *ATN-TERM* '|xml|:\;)
                                            (XML-QUERY::|QueryModuleList/QueryModuleList.5.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) NIL)))))
                               (XML-QUERY::|QueryModuleList/QueryModuleList.5.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModuleList/QueryModuleList.5.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QueryModule|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QueryModule| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QueryModule| (CONS RESULT XML-QUERY::|QueryModule|)))
                                              (XML-QUERY::|QueryModuleList.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|QueryModule|) NIL))))))
                               (XML-QUERY::|QueryModuleList/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModuleList/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QueryModule|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QueryModule| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QueryModule| (CONS RESULT XML-QUERY::|QueryModule|)))
                                              (XML-QUERY::|QueryModuleList/QueryModuleList.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|QueryModule|)
                                              (XML-QUERY::|QueryModuleList/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|QueryModuleList.2| XML-QUERY::|QueryModuleList.5|
                                  XML-QUERY::|QueryModuleList/fail.3| XML-QUERY::|QueryModuleList/QueryModuleList.2.4|
                                  XML-QUERY::|QueryModuleList/QueryModuleList.5.6| XML-QUERY::|QueryModuleList/QueryModuleList.5.7|
                                  XML-QUERY::|QueryModuleList/start.1|))
                        (XML-QUERY::|QueryModuleList/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|QueryModule| (INDEX &AUX (XML-QUERY::|ContextDecl| NIL) (XML-QUERY::|ExprSequence| NIL)
                                 (XML-QUERY::|FunctionDefn| NIL))
  "{2 } QueryModule ::= ContextDecl* FunctionDefn* ExprSequence?
(|ContextDecl| |ExprSequence| |FunctionDefn|)"
  (DECLARE (SPECIAL XML-QUERY::|QueryModule-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|QueryModule-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|QueryModule-INDEX| INDEX)
      (LET ((XML-QUERY::|QueryModule-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|QueryModule| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|QueryModule-Parsetable|)
            (XML-QUERY::*QUOTE-TOKEN* NIL))
        (DECLARE (SPECIAL XML-QUERY::|QueryModule-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|QueryModule|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|QueryModule|)
                                 (RETURN-FROM XML-QUERY::|QueryModule| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|QueryModule| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|QueryModule.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModule.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|QueryModule|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|QueryModule|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|QueryModule|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|ContextDecl|
                                                         XML-QUERY::|ContextDecl|
                                                         'XML-QUERY::|ExprSequence|
                                                         XML-QUERY::|ExprSequence|
                                                         'XML-QUERY::|FunctionDefn|
                                                         XML-QUERY::|FunctionDefn|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|QueryModule-Constructor|
                                                    XML-QUERY::|ContextDecl|
                                                    XML-QUERY::|ExprSequence|
                                                    XML-QUERY::|FunctionDefn|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|QueryModule|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|ContextDecl|
                                                                          XML-QUERY::|ExprSequence|
                                                                          XML-QUERY::|FunctionDefn|)))
                                                      'XML-QUERY::|QueryModule|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|QueryModule.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModule.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ContextDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ContextDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ContextDecl| (CONS RESULT XML-QUERY::|ContextDecl|)))
                                              (XML-QUERY::|QueryModule.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ContextDecl|)
                                              (XML-QUERY::|QueryModule/QueryModule.2.4| INDEX)))))))
                               (XML-QUERY::|QueryModule.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModule.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FunctionDefn|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FunctionDefn| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FunctionDefn| (CONS RESULT XML-QUERY::|FunctionDefn|)))
                                              (XML-QUERY::|QueryModule.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|FunctionDefn|)
                                              (XML-QUERY::|QueryModule/QueryModule.2.5| INDEX)))))))
                               (XML-QUERY::|QueryModule/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|QueryModule/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|QueryModule/QueryModule.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModule/QueryModule.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FunctionDefn|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FunctionDefn| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FunctionDefn| (CONS RESULT XML-QUERY::|FunctionDefn|)))
                                              (XML-QUERY::|QueryModule.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|FunctionDefn|)
                                              (XML-QUERY::|QueryModule/QueryModule.2.5| INDEX)))))))
                               (XML-QUERY::|QueryModule/QueryModule.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModule/QueryModule.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprSequence| RESULT))
                                              (XML-QUERY::|QueryModule.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprSequence|)
                                              (XML-QUERY::|QueryModule.2| INDEX)))))))
                               (XML-QUERY::|QueryModule/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QueryModule/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ContextDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ContextDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ContextDecl| (CONS RESULT XML-QUERY::|ContextDecl|)))
                                              (XML-QUERY::|QueryModule.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ContextDecl|)
                                              (XML-QUERY::|QueryModule/QueryModule.2.4| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|QueryModule.2| XML-QUERY::|QueryModule.6|
                                  XML-QUERY::|QueryModule.7| XML-QUERY::|QueryModule/fail.3|
                                  XML-QUERY::|QueryModule/QueryModule.2.4| XML-QUERY::|QueryModule/QueryModule.2.5|
                                  XML-QUERY::|QueryModule/start.1|))
                        (XML-QUERY::|QueryModule/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ContextDecl| (INDEX &AUX (XML-QUERY::|NamespaceDecl| NIL) (XML-QUERY::|SchemaDecl| NIL))
  "{3 } ContextDecl ::= (NamespaceDecl | SchemaDecl)
(|NamespaceDecl| |SchemaDecl|)"
  (DECLARE (SPECIAL XML-QUERY::|ContextDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ContextDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ContextDecl-INDEX| INDEX)
      (LET ((XML-QUERY::|ContextDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ContextDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ContextDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ContextDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ContextDecl|)
                                 (RETURN-FROM XML-QUERY::|ContextDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ContextDecl| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ContextDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ContextDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ContextDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ContextDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ContextDecl|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NamespaceDecl|
                                                         XML-QUERY::|NamespaceDecl|
                                                         'XML-QUERY::|SchemaDecl|
                                                         XML-QUERY::|SchemaDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ContextDecl-Constructor|
                                                    XML-QUERY::|NamespaceDecl|
                                                    XML-QUERY::|SchemaDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ContextDecl|
                                                            (DELETE NIL (LIST XML-QUERY::|NamespaceDecl| XML-QUERY::|SchemaDecl|)))
                                                      'XML-QUERY::|ContextDecl|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ContextDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ContextDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ContextDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ContextDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|NamespaceDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NamespaceDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|NamespaceDecl| RESULT))
                                                    (XML-QUERY::|ContextDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|NamespaceDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|SchemaDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SchemaDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|SchemaDecl| RESULT))
                                                    (XML-QUERY::|ContextDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|SchemaDecl|) NIL))))
                                         (XML-QUERY::|ContextDecl/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ContextDecl.2| XML-QUERY::|ContextDecl/fail.3|
                                  XML-QUERY::|ContextDecl/start.1|))
                        (XML-QUERY::|ContextDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|NamespaceDecl| (INDEX &AUX (XML-QUERY::|NCName| NIL) (XML-QUERY::|StringLiteral| NIL))
  "NamespaceDecl ::= (('namespace' NCName '=' StringLiteral) | ('default'
                                                                  'namespace'
                                                                  '='
                                                                  StringLiteral))
(|NCName| |StringLiteral|)"
  (DECLARE (SPECIAL XML-QUERY::|NamespaceDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|NamespaceDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|NamespaceDecl-INDEX| INDEX)
      (LET ((XML-QUERY::|NamespaceDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|NamespaceDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|NamespaceDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|NamespaceDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|NamespaceDecl|)
                                 (RETURN-FROM XML-QUERY::|NamespaceDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|NamespaceDecl| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|NamespaceDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|NamespaceDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|NamespaceDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|NamespaceDecl|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|
                                                         'XML-QUERY::|StringLiteral|
                                                         XML-QUERY::|StringLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|NamespaceDecl-Constructor|
                                                    XML-QUERY::|NCName|
                                                    XML-QUERY::|StringLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|NamespaceDecl|
                                                            (DELETE NIL (LIST XML-QUERY::|NCName| XML-QUERY::|StringLiteral|)))
                                                      'XML-QUERY::|NamespaceDecl|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|NamespaceDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|NamespaceDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:=)
                                     (COND ((STRING-EQUAL |item| '|xml|:=)
                                            (SETF *ATN-TERM* '|xml|:=)
                                            (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:=) NIL)))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StringLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StringLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StringLiteral| RESULT))
                                              (XML-QUERY::|NamespaceDecl.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteral|) NIL))))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|namespace|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|namespace|)
                                            (SETF *ATN-TERM* '|xml|:|namespace|)
                                            (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|namespace|) NIL)))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|NCName|)
                                     (COND ((XML-QUERY::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                            (SETF XML-QUERY::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NCName| |item|)
                                                          'XML-QUERY::|NCName|)))
                                            (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) NIL)))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:=)
                                     (COND ((STRING-EQUAL |item| '|xml|:=)
                                            (SETF *ATN-TERM* '|xml|:=)
                                            (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:=) NIL)))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StringLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StringLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StringLiteral| RESULT))
                                              (XML-QUERY::|NamespaceDecl.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteral|) NIL))))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|default|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|default|)
                                            (SETF *ATN-TERM* '|xml|::|default|)
                                            (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|default|) NIL)))))
                               (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/NamespaceDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|namespace|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|namespace|)
                                            (SETF *ATN-TERM* '|xml|:|namespace|)
                                            (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|namespace|) NIL)))))
                               (XML-QUERY::|NamespaceDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NamespaceDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|NamespaceDecl/NamespaceDecl.2.4|)
                                           (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|NamespaceDecl/NamespaceDecl.2.8|)
                                           (XML-QUERY::|NamespaceDecl/NamespaceDecl.2.8| INDEX))
                                         (XML-QUERY::|NamespaceDecl/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|NamespaceDecl.2| XML-QUERY::|NamespaceDecl/fail.3|
                                  XML-QUERY::|NamespaceDecl/NamespaceDecl.2.10| XML-QUERY::|NamespaceDecl/NamespaceDecl.2.11|
                                  XML-QUERY::|NamespaceDecl/NamespaceDecl.2.4| XML-QUERY::|NamespaceDecl/NamespaceDecl.2.5|
                                  XML-QUERY::|NamespaceDecl/NamespaceDecl.2.6| XML-QUERY::|NamespaceDecl/NamespaceDecl.2.7|
                                  XML-QUERY::|NamespaceDecl/NamespaceDecl.2.8| XML-QUERY::|NamespaceDecl/NamespaceDecl.2.9|
                                  XML-QUERY::|NamespaceDecl/start.1|))
                        (XML-QUERY::|NamespaceDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|SchemaDecl| (INDEX &AUX (XML-QUERY::|SchemaName| NIL) (XML-QUERY::|StringLiteral| NIL))
  "SchemaDecl ::= 'schema' SchemaName StringLiteral
(|SchemaName| |StringLiteral|)"
  (DECLARE (SPECIAL XML-QUERY::|SchemaDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|SchemaDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|SchemaDecl-INDEX| INDEX)
      (LET ((XML-QUERY::|SchemaDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|SchemaDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|SchemaDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|SchemaDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|SchemaDecl|)
                                 (RETURN-FROM XML-QUERY::|SchemaDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|SchemaDecl| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|SchemaDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SchemaDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|SchemaDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|SchemaDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|SchemaDecl|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|SchemaName|
                                                         XML-QUERY::|SchemaName|
                                                         'XML-QUERY::|StringLiteral|
                                                         XML-QUERY::|StringLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|SchemaDecl-Constructor|
                                                    XML-QUERY::|SchemaName|
                                                    XML-QUERY::|StringLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|SchemaDecl|
                                                            (DELETE NIL (LIST XML-QUERY::|SchemaName| XML-QUERY::|StringLiteral|)))
                                                      'XML-QUERY::|SchemaDecl|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|SchemaDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|SchemaDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|SchemaDecl/SchemaDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SchemaDecl/SchemaDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|SchemaName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SchemaName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|SchemaName| RESULT))
                                              (XML-QUERY::|SchemaDecl/SchemaDecl.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|SchemaName|)
                                              (XML-QUERY::|SchemaDecl/fail.3| INDEX)))))))
                               (XML-QUERY::|SchemaDecl/SchemaDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SchemaDecl/SchemaDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StringLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StringLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StringLiteral| RESULT))
                                              (XML-QUERY::|SchemaDecl.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteral|)
                                              (XML-QUERY::|SchemaDecl/fail.3| INDEX)))))))
                               (XML-QUERY::|SchemaDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SchemaDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|schema|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|schema|)
                                            (SETF *ATN-TERM* '|xml|::|schema|)
                                            (XML-QUERY::|SchemaDecl/SchemaDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|schema|) (XML-QUERY::|SchemaDecl/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|SchemaDecl.2| XML-QUERY::|SchemaDecl/fail.3|
                                  XML-QUERY::|SchemaDecl/SchemaDecl.2.4| XML-QUERY::|SchemaDecl/SchemaDecl.2.5|
                                  XML-QUERY::|SchemaDecl/start.1|))
                        (XML-QUERY::|SchemaDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|SchemaName| (INDEX &AUX (XML-QUERY::|StringLiteral| NIL))
  "SchemaName ::= StringLiteral
(|StringLiteral|)"
  (DECLARE (SPECIAL XML-QUERY::|SchemaName-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|SchemaName-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|SchemaName-INDEX| INDEX)
      (LET ((XML-QUERY::|SchemaName-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|SchemaName| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|SchemaName-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|SchemaName|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|SchemaName|)
                                 (RETURN-FROM XML-QUERY::|SchemaName| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|SchemaName| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|SchemaName.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SchemaName.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|SchemaName|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|SchemaName|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|SchemaName|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|StringLiteral| XML-QUERY::|StringLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|SchemaName-Constructor| XML-QUERY::|StringLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|SchemaName|
                                                            (DELETE NIL (LIST XML-QUERY::|StringLiteral|)))
                                                      'XML-QUERY::|SchemaName|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|SchemaName/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|SchemaName/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|SchemaName/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SchemaName/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StringLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StringLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StringLiteral| RESULT))
                                              (XML-QUERY::|SchemaName.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteral|)
                                              (XML-QUERY::|SchemaName/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|SchemaName.2| XML-QUERY::|SchemaName/fail.3|
                                  XML-QUERY::|SchemaName/start.1|))
                        (XML-QUERY::|SchemaName/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|FunctionDefn| (INDEX &AUX (XML-QUERY::|Datatype| NIL) (XML-QUERY::|EnclosedExpr| NIL)
                                  (XML-QUERY::|ParamList| NIL) (XML-QUERY::|QName| NIL))
  "{4 } FunctionDefn ::= 'define' 'function' QName '(' ParamList? ')' ('returns'
                                                                    Datatype)? EnclosedExpr
(|Datatype| |EnclosedExpr| |ParamList| |QName|)"
  (DECLARE (SPECIAL XML-QUERY::|FunctionDefn-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|FunctionDefn-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|FunctionDefn-INDEX| INDEX)
      (LET ((XML-QUERY::|FunctionDefn-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|FunctionDefn| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|FunctionDefn-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|FunctionDefn|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|FunctionDefn|)
                                 (RETURN-FROM XML-QUERY::|FunctionDefn| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|FunctionDefn| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|FunctionDefn.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|FunctionDefn|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|FunctionDefn|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|FunctionDefn|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Datatype|
                                                         XML-QUERY::|Datatype|
                                                         'XML-QUERY::|EnclosedExpr|
                                                         XML-QUERY::|EnclosedExpr|
                                                         'XML-QUERY::|ParamList|
                                                         XML-QUERY::|ParamList|
                                                         'XML-QUERY::|QName|
                                                         XML-QUERY::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|FunctionDefn-Constructor|
                                                    XML-QUERY::|Datatype|
                                                    XML-QUERY::|EnclosedExpr|
                                                    XML-QUERY::|ParamList|
                                                    XML-QUERY::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|FunctionDefn|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Datatype|
                                                                          XML-QUERY::|EnclosedExpr|
                                                                          XML-QUERY::|ParamList|
                                                                          XML-QUERY::|QName|)))
                                                      'XML-QUERY::|FunctionDefn|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|FunctionDefn/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|FunctionDefn/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|EnclosedExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EnclosedExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|EnclosedExpr| RESULT))
                                              (XML-QUERY::|FunctionDefn.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|EnclosedExpr|)
                                              (XML-QUERY::|FunctionDefn/fail.3| INDEX)))))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|function|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|function|)
                                            (SETF *ATN-TERM* '|xml|::|function|)
                                            (XML-QUERY::|FunctionDefn/FunctionDefn.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|function|) (XML-QUERY::|FunctionDefn/fail.3| INDEX))))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QName| RESULT))
                                              (XML-QUERY::|FunctionDefn/FunctionDefn.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|QName|)
                                              (XML-QUERY::|FunctionDefn/fail.3| INDEX)))))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|FunctionDefn/FunctionDefn.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|FunctionDefn/fail.3| INDEX))))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ParamList|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ParamList| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ParamList| RESULT))
                                              (XML-QUERY::|FunctionDefn/FunctionDefn.2.8| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ParamList|)
                                              (XML-QUERY::|FunctionDefn/FunctionDefn.2.8| INDEX)))))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|FunctionDefn/FunctionDefn.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|FunctionDefn/fail.3| INDEX))))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.11|)
                                     (XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.11| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionDefn/FunctionDefn.2.10|)
                                     (XML-QUERY::|FunctionDefn/FunctionDefn.2.10| INDEX))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.11|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|returns|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|returns|)
                                            (SETF *ATN-TERM* '|xml|::|returns|)
                                            (XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|returns|) NIL)))))
                               (XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.12|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Datatype|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Datatype| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Datatype| RESULT))
                                              (XML-QUERY::|FunctionDefn/FunctionDefn.2.10| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Datatype|) NIL))))))
                               (XML-QUERY::|FunctionDefn/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionDefn/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|define|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|define|)
                                            (SETF *ATN-TERM* '|xml|::|define|)
                                            (XML-QUERY::|FunctionDefn/FunctionDefn.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|define|) (XML-QUERY::|FunctionDefn/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|FunctionDefn.2| XML-QUERY::|FunctionDefn/fail.3|
                                  XML-QUERY::|FunctionDefn/FunctionDefn.2.10| XML-QUERY::|FunctionDefn/FunctionDefn.2.4|
                                  XML-QUERY::|FunctionDefn/FunctionDefn.2.5| XML-QUERY::|FunctionDefn/FunctionDefn.2.6|
                                  XML-QUERY::|FunctionDefn/FunctionDefn.2.7| XML-QUERY::|FunctionDefn/FunctionDefn.2.8|
                                  XML-QUERY::|FunctionDefn/FunctionDefn.2.9|
                                  XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.11|
                                  XML-QUERY::|FunctionDefn/FunctionDefn/FunctionDefn.2.10.12| XML-QUERY::|FunctionDefn/start.1|))
                        (XML-QUERY::|FunctionDefn/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ParamList| (INDEX &AUX (XML-QUERY::|Param| NIL))
  "{5 } ParamList ::= Param (',' Param)*
(|Param|)"
  (DECLARE (SPECIAL XML-QUERY::|ParamList-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ParamList-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ParamList-INDEX| INDEX)
      (LET ((XML-QUERY::|ParamList-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ParamList| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ParamList-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ParamList|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ParamList|)
                                 (RETURN-FROM XML-QUERY::|ParamList| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ParamList| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ParamList.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParamList.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ParamList|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ParamList|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ParamList|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Param| XML-QUERY::|Param|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ParamList-Constructor| XML-QUERY::|Param|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ParamList| (DELETE NIL (LIST XML-QUERY::|Param|)))
                                                      'XML-QUERY::|ParamList|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ParamList.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParamList.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ParamList/ParamList.5.6|)
                                     (XML-QUERY::|ParamList/ParamList.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|ParamList.2|) (XML-QUERY::|ParamList.2| INDEX))))
                               (XML-QUERY::|ParamList/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ParamList/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ParamList/ParamList.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParamList/ParamList.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ParamList/ParamList.5.6|)
                                     (XML-QUERY::|ParamList/ParamList.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|ParamList.2|) (XML-QUERY::|ParamList.2| INDEX))))
                               (XML-QUERY::|ParamList/ParamList.5.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParamList/ParamList.5.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((STRING-EQUAL |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-QUERY::|ParamList/ParamList.5.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-QUERY::|ParamList/ParamList.5.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParamList/ParamList.5.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Param|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Param| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Param| (CONS RESULT XML-QUERY::|Param|)))
                                              (XML-QUERY::|ParamList.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Param|) NIL))))))
                               (XML-QUERY::|ParamList/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParamList/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Param|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Param| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Param| (CONS RESULT XML-QUERY::|Param|)))
                                              (XML-QUERY::|ParamList/ParamList.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Param|) (XML-QUERY::|ParamList/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ParamList.2| XML-QUERY::|ParamList.5|
                                  XML-QUERY::|ParamList/fail.3| XML-QUERY::|ParamList/ParamList.2.4|
                                  XML-QUERY::|ParamList/ParamList.5.6| XML-QUERY::|ParamList/ParamList.5.7|
                                  XML-QUERY::|ParamList/start.1|))
                        (XML-QUERY::|ParamList/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Param| (INDEX &AUX (XML-QUERY::|Datatype| NIL) (XML-QUERY::|Variable| NIL))
  "{6 } Param ::= Datatype? Variable
(|Datatype| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|Param-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Param-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Param-INDEX| INDEX)
      (LET ((XML-QUERY::|Param-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|Param| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|Param-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Param|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Param|)
                                 (RETURN-FROM XML-QUERY::|Param| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Param| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Param.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Param.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Param|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Param|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Param|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Datatype|
                                                         XML-QUERY::|Datatype|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Param-Constructor| XML-QUERY::|Datatype| XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Param|
                                                            (DELETE NIL (LIST XML-QUERY::|Datatype| XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|Param|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Param/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-QUERY::|Param/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Param/Param.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Param/Param.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Variable|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                              (XML-QUERY::|Param.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Variable|) (XML-QUERY::|Param/fail.3| INDEX)))))))
                               (XML-QUERY::|Param/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Param/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Datatype|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Datatype| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Datatype| RESULT))
                                              (XML-QUERY::|Param/Param.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Datatype|)
                                              (XML-QUERY::|Param/Param.2.4| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Param.2| XML-QUERY::|Param/fail.3| XML-QUERY::|Param/Param.2.4|
                                  XML-QUERY::|Param/start.1|))
                        (XML-QUERY::|Param/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Expr| (INDEX &AUX (XML-QUERY::|AdditiveExpr| NIL) (XML-QUERY::|AndExpr| NIL) (XML-QUERY::|BeforeAfterExpr| NIL)
                          (XML-QUERY::|EqualityExpr| NIL) (XML-QUERY::|EveryExpr| NIL) (XML-QUERY::|FlwrExpr| NIL)
                          (XML-QUERY::|IfExpr| NIL) (XML-QUERY::|InstanceofExpr| NIL) (XML-QUERY::|IntersectExceptExpr| NIL)
                          (XML-QUERY::|MultiplicativeExpr| NIL) (XML-QUERY::|OrExpr| NIL) (XML-QUERY::|PathExpr| NIL)
                          (XML-QUERY::|RangeExpr| NIL) (XML-QUERY::|RelationalExpr| NIL) (XML-QUERY::|SomeExpr| NIL)
                          (XML-QUERY::|SortExpr| NIL) (XML-QUERY::|TypeSwitchExpr| NIL) (XML-QUERY::|UnaryExpr| NIL)
                          (XML-QUERY::|UnionExpr| NIL))
  "{7 } Expr ::= (SortExpr | OrExpr | AndExpr | BeforeAfterExpr | FlwrExpr | IfExpr | SomeExpr | EveryExpr | TypeSwitchExpr | EqualityExpr | RelationalExpr | InstanceofExpr | RangeExpr | AdditiveExpr | MultiplicativeExpr | UnaryExpr | UnionExpr | IntersectExceptExpr | PathExpr)
(|AdditiveExpr| |AndExpr| |BeforeAfterExpr| |EqualityExpr| |EveryExpr| |FlwrExpr| |IfExpr| |InstanceofExpr| |IntersectExceptExpr| |MultiplicativeExpr| |OrExpr| |PathExpr| |RangeExpr| |RelationalExpr| |SomeExpr| |SortExpr| |TypeSwitchExpr| |UnaryExpr| |UnionExpr|)"
  (DECLARE (SPECIAL XML-QUERY::|Expr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Expr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF T
      (LET ((XML-QUERY::|Expr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|Expr| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|Expr-Parsetable|)
            (XML-QUERY::*QUOTE-TOKEN* NIL))
        (DECLARE (SPECIAL XML-QUERY::|Expr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Expr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Expr|)
                                 (RETURN-FROM XML-QUERY::|Expr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Expr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Expr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Expr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Expr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Expr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Expr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AdditiveExpr|
                                                         XML-QUERY::|AdditiveExpr|
                                                         'XML-QUERY::|AndExpr|
                                                         XML-QUERY::|AndExpr|
                                                         'XML-QUERY::|BeforeAfterExpr|
                                                         XML-QUERY::|BeforeAfterExpr|
                                                         'XML-QUERY::|EqualityExpr|
                                                         XML-QUERY::|EqualityExpr|
                                                         'XML-QUERY::|EveryExpr|
                                                         XML-QUERY::|EveryExpr|
                                                         'XML-QUERY::|FlwrExpr|
                                                         XML-QUERY::|FlwrExpr|
                                                         'XML-QUERY::|IfExpr|
                                                         XML-QUERY::|IfExpr|
                                                         'XML-QUERY::|InstanceofExpr|
                                                         XML-QUERY::|InstanceofExpr|
                                                         'XML-QUERY::|IntersectExceptExpr|
                                                         XML-QUERY::|IntersectExceptExpr|
                                                         'XML-QUERY::|MultiplicativeExpr|
                                                         XML-QUERY::|MultiplicativeExpr|
                                                         'XML-QUERY::|OrExpr|
                                                         XML-QUERY::|OrExpr|
                                                         'XML-QUERY::|PathExpr|
                                                         XML-QUERY::|PathExpr|
                                                         'XML-QUERY::|RangeExpr|
                                                         XML-QUERY::|RangeExpr|
                                                         'XML-QUERY::|RelationalExpr|
                                                         XML-QUERY::|RelationalExpr|
                                                         'XML-QUERY::|SomeExpr|
                                                         XML-QUERY::|SomeExpr|
                                                         'XML-QUERY::|SortExpr|
                                                         XML-QUERY::|SortExpr|
                                                         'XML-QUERY::|TypeSwitchExpr|
                                                         XML-QUERY::|TypeSwitchExpr|
                                                         'XML-QUERY::|UnaryExpr|
                                                         XML-QUERY::|UnaryExpr|
                                                         'XML-QUERY::|UnionExpr|
                                                         XML-QUERY::|UnionExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Expr-Constructor|
                                                    XML-QUERY::|AdditiveExpr|
                                                    XML-QUERY::|AndExpr|
                                                    XML-QUERY::|BeforeAfterExpr|
                                                    XML-QUERY::|EqualityExpr|
                                                    XML-QUERY::|EveryExpr|
                                                    XML-QUERY::|FlwrExpr|
                                                    XML-QUERY::|IfExpr|
                                                    XML-QUERY::|InstanceofExpr|
                                                    XML-QUERY::|IntersectExceptExpr|
                                                    XML-QUERY::|MultiplicativeExpr|
                                                    XML-QUERY::|OrExpr|
                                                    XML-QUERY::|PathExpr|
                                                    XML-QUERY::|RangeExpr|
                                                    XML-QUERY::|RelationalExpr|
                                                    XML-QUERY::|SomeExpr|
                                                    XML-QUERY::|SortExpr|
                                                    XML-QUERY::|TypeSwitchExpr|
                                                    XML-QUERY::|UnaryExpr|
                                                    XML-QUERY::|UnionExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Expr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|AdditiveExpr|
                                                                          XML-QUERY::|AndExpr|
                                                                          XML-QUERY::|BeforeAfterExpr|
                                                                          XML-QUERY::|EqualityExpr|
                                                                          XML-QUERY::|EveryExpr|
                                                                          XML-QUERY::|FlwrExpr|
                                                                          XML-QUERY::|IfExpr|
                                                                          XML-QUERY::|InstanceofExpr|
                                                                          XML-QUERY::|IntersectExceptExpr|
                                                                          XML-QUERY::|MultiplicativeExpr|
                                                                          XML-QUERY::|OrExpr|
                                                                          XML-QUERY::|PathExpr|
                                                                          XML-QUERY::|RangeExpr|
                                                                          XML-QUERY::|RelationalExpr|
                                                                          XML-QUERY::|SomeExpr|
                                                                          XML-QUERY::|SortExpr|
                                                                          XML-QUERY::|TypeSwitchExpr|
                                                                          XML-QUERY::|UnaryExpr|
                                                                          XML-QUERY::|UnionExpr|)))
                                                      'XML-QUERY::|Expr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Expr/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-QUERY::|Expr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Expr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Expr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|SortExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SortExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|SortExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|SortExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|OrExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|OrExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|OrExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|OrExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|AndExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AndExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|AndExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|AndExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|BeforeAfterExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|BeforeAfterExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|BeforeAfterExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|BeforeAfterExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|FlwrExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|FlwrExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|FlwrExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|IfExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|IfExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|IfExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|IfExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|SomeExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SomeExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|SomeExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|SomeExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|EveryExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EveryExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|EveryExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|EveryExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|TypeSwitchExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|TypeSwitchExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|TypeSwitchExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|TypeSwitchExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|EqualityExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EqualityExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|EqualityExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|EqualityExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|RelationalExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RelationalExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|RelationalExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|RelationalExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|InstanceofExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|InstanceofExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|InstanceofExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|InstanceofExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|RangeExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RangeExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|RangeExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|RangeExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|AdditiveExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AdditiveExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|AdditiveExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|AdditiveExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|MultiplicativeExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|MultiplicativeExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|MultiplicativeExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|MultiplicativeExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|UnaryExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|UnaryExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|UnaryExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|UnaryExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|UnionExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|UnionExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|UnionExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|UnionExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|IntersectExceptExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|IntersectExceptExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|IntersectExceptExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|IntersectExceptExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PathExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PathExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PathExpr| RESULT))
                                                    (XML-QUERY::|Expr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PathExpr|) NIL))))
                                         (XML-QUERY::|Expr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Expr.2| XML-QUERY::|Expr/fail.3| XML-QUERY::|Expr/start.1|))
                        (XML-QUERY::|Expr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|SortExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|SortSpecList| NIL))
  "{8 } SortExpr ::= Expr 'sortby' '(' SortSpecList ')'
(|Expr| |SortSpecList|)"
  (DECLARE (SPECIAL XML-QUERY::|SortExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|SortExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|SortExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|SortExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|SortExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|SortExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|SortExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|SortExpr|)
                                 (RETURN-FROM XML-QUERY::|SortExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|SortExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|SortExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|SortExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|SortExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|SortExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|SortSpecList|
                                                         XML-QUERY::|SortSpecList|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|SortExpr-Constructor| XML-QUERY::|Expr| XML-QUERY::|SortSpecList|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|SortExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|SortSpecList|)))
                                                      'XML-QUERY::|SortExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|SortExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|SortExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|SortExpr/SortExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortExpr/SortExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|sortby|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|sortby|)
                                            (SETF *ATN-TERM* '|xml|::|sortby|)
                                            (XML-QUERY::|SortExpr/SortExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|sortby|) (XML-QUERY::|SortExpr/fail.3| INDEX))))))
                               (XML-QUERY::|SortExpr/SortExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortExpr/SortExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|SortExpr/SortExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|SortExpr/fail.3| INDEX))))))
                               (XML-QUERY::|SortExpr/SortExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortExpr/SortExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|SortSpecList|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SortSpecList| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|SortSpecList| RESULT))
                                              (XML-QUERY::|SortExpr/SortExpr.2.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|SortSpecList|)
                                              (XML-QUERY::|SortExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|SortExpr/SortExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortExpr/SortExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|SortExpr.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|SortExpr/fail.3| INDEX))))))
                               (XML-QUERY::|SortExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|SortExpr/SortExpr.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|SortExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|SortExpr.2| XML-QUERY::|SortExpr/fail.3|
                                  XML-QUERY::|SortExpr/SortExpr.2.4| XML-QUERY::|SortExpr/SortExpr.2.5|
                                  XML-QUERY::|SortExpr/SortExpr.2.6| XML-QUERY::|SortExpr/SortExpr.2.7|
                                  XML-QUERY::|SortExpr/start.1|))
                        (XML-QUERY::|SortExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|SortSpecList| (INDEX &AUX (XML-QUERY::|SortSpec| NIL))
  "{9 } SortSpecList ::= SortSpec (',' SortSpec)*
(|SortSpec|)"
  (DECLARE (SPECIAL XML-QUERY::|SortSpecList-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|SortSpecList-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|SortSpecList-INDEX| INDEX)
      (LET ((XML-QUERY::|SortSpecList-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|SortSpecList| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|SortSpecList-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|SortSpecList|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|SortSpecList|)
                                 (RETURN-FROM XML-QUERY::|SortSpecList| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|SortSpecList| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|SortSpecList.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpecList.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|SortSpecList|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|SortSpecList|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|SortSpecList|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|SortSpec| XML-QUERY::|SortSpec|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|SortSpecList-Constructor| XML-QUERY::|SortSpec|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|SortSpecList| (DELETE NIL (LIST XML-QUERY::|SortSpec|)))
                                                      'XML-QUERY::|SortSpecList|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|SortSpecList.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpecList.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|SortSpecList/SortSpecList.5.6|)
                                     (XML-QUERY::|SortSpecList/SortSpecList.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|SortSpecList.2|) (XML-QUERY::|SortSpecList.2| INDEX))))
                               (XML-QUERY::|SortSpecList/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|SortSpecList/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|SortSpecList/SortSpecList.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpecList/SortSpecList.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|SortSpecList/SortSpecList.5.6|)
                                     (XML-QUERY::|SortSpecList/SortSpecList.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|SortSpecList.2|) (XML-QUERY::|SortSpecList.2| INDEX))))
                               (XML-QUERY::|SortSpecList/SortSpecList.5.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpecList/SortSpecList.5.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((STRING-EQUAL |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-QUERY::|SortSpecList/SortSpecList.5.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-QUERY::|SortSpecList/SortSpecList.5.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpecList/SortSpecList.5.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|SortSpec|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SortSpec| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|SortSpec| (CONS RESULT XML-QUERY::|SortSpec|)))
                                              (XML-QUERY::|SortSpecList.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|SortSpec|) NIL))))))
                               (XML-QUERY::|SortSpecList/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpecList/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|SortSpec|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|SortSpec| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|SortSpec| (CONS RESULT XML-QUERY::|SortSpec|)))
                                              (XML-QUERY::|SortSpecList/SortSpecList.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|SortSpec|)
                                              (XML-QUERY::|SortSpecList/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|SortSpecList.2| XML-QUERY::|SortSpecList.5|
                                  XML-QUERY::|SortSpecList/fail.3| XML-QUERY::|SortSpecList/SortSpecList.2.4|
                                  XML-QUERY::|SortSpecList/SortSpecList.5.6| XML-QUERY::|SortSpecList/SortSpecList.5.7|
                                  XML-QUERY::|SortSpecList/start.1|))
                        (XML-QUERY::|SortSpecList/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|SortSpec| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|SortOrder| NIL))
  "SortSpec ::= Expr SortOrder?
(|Expr| |SortOrder|)"
  (DECLARE (SPECIAL XML-QUERY::|SortSpec-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|SortSpec-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|SortSpec-INDEX| INDEX)
      (LET ((XML-QUERY::|SortSpec-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|SortSpec| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|SortSpec-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|SortSpec|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|SortSpec|)
                                 (RETURN-FROM XML-QUERY::|SortSpec| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|SortSpec| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|SortSpec.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpec.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|SortSpec|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|SortSpec|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|SortSpec|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|SortOrder|
                                                         XML-QUERY::|SortOrder|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|SortSpec-Constructor| XML-QUERY::|Expr| XML-QUERY::|SortOrder|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|SortSpec|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|SortOrder|)))
                                                      'XML-QUERY::|SortSpec|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|SortSpec/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|SortSpec/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|SortSpec/SortSpec.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpec/SortSpec.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|SortOrder|)
                                     (COND ((XML-QUERY::|IS-SortOrder| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|SortOrder|)
                                            (SETF XML-QUERY::|SortOrder|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|SortOrder-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|SortOrder| |item|)
                                                          'XML-QUERY::|SortOrder|)))
                                            (XML-QUERY::|SortSpec.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|SortOrder|) (XML-QUERY::|SortSpec.2| INDEX))))))
                               (XML-QUERY::|SortSpec/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SortSpec/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|SortSpec/SortSpec.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|SortSpec/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|SortSpec.2| XML-QUERY::|SortSpec/fail.3|
                                  XML-QUERY::|SortSpec/SortSpec.2.4| XML-QUERY::|SortSpec/start.1|))
                        (XML-QUERY::|SortSpec/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|OrExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL))
  "{10} OrExpr ::= Expr 'or' ExprArg2
(|Expr| |ExprArg2|)"
  (DECLARE (SPECIAL XML-QUERY::|OrExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|OrExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|OrExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|OrExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|OrExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|OrExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|OrExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|OrExpr|)
                                 (RETURN-FROM XML-QUERY::|OrExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|OrExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|OrExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OrExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|OrExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|OrExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|OrExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|OrExpr-Constructor| XML-QUERY::|Expr| XML-QUERY::|ExprArg2|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|OrExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|ExprArg2|)))
                                                      'XML-QUERY::|OrExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|OrExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|OrExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|OrExpr/OrExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OrExpr/OrExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|or|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|or|)
                                            (SETF *ATN-TERM* '|xml|:|or|)
                                            (XML-QUERY::|OrExpr/OrExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|or|) (XML-QUERY::|OrExpr/fail.3| INDEX))))))
                               (XML-QUERY::|OrExpr/OrExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OrExpr/OrExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|OrExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|) (XML-QUERY::|OrExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|OrExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OrExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|OrExpr/OrExpr.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|OrExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|OrExpr.2| XML-QUERY::|OrExpr/fail.3|
                                  XML-QUERY::|OrExpr/OrExpr.2.4| XML-QUERY::|OrExpr/OrExpr.2.5| XML-QUERY::|OrExpr/start.1|))
                        (XML-QUERY::|OrExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ExprArg2| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "ExprArg2 ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|ExprArg2-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ExprArg2-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ExprArg2-INDEX| INDEX)
      (LET ((XML-QUERY::|ExprArg2-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|ExprArg2| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ExprArg2-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ExprArg2|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ExprArg2|)
                                 (RETURN-FROM XML-QUERY::|ExprArg2| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ExprArg2| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ExprArg2.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprArg2.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ExprArg2|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ExprArg2|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ExprArg2|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ExprArg2-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ExprArg2| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|ExprArg2|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ExprArg2/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ExprArg2/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ExprArg2/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprArg2/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|ExprArg2.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|ExprArg2/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ExprArg2.2| XML-QUERY::|ExprArg2/fail.3|
                                  XML-QUERY::|ExprArg2/start.1|))
                        (XML-QUERY::|ExprArg2/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AndExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL))
  "{11} AndExpr ::= Expr 'and' ExprArg2
(|Expr| |ExprArg2|)"
  (DECLARE (SPECIAL XML-QUERY::|AndExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AndExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AndExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|AndExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|AndExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|AndExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AndExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AndExpr|)
                                 (RETURN-FROM XML-QUERY::|AndExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AndExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AndExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AndExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AndExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AndExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|AndExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AndExpr-Constructor| XML-QUERY::|Expr| XML-QUERY::|ExprArg2|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AndExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|ExprArg2|)))
                                                      'XML-QUERY::|AndExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AndExpr/AndExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AndExpr/AndExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|and|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|and|)
                                            (SETF *ATN-TERM* '|xml|:|and|)
                                            (XML-QUERY::|AndExpr/AndExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|and|) (XML-QUERY::|AndExpr/fail.3| INDEX))))))
                               (XML-QUERY::|AndExpr/AndExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AndExpr/AndExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|AndExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|) (XML-QUERY::|AndExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|AndExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AndExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AndExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AndExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|AndExpr/AndExpr.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|AndExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AndExpr.2| XML-QUERY::|AndExpr/AndExpr.2.4|
                                  XML-QUERY::|AndExpr/AndExpr.2.5| XML-QUERY::|AndExpr/fail.3| XML-QUERY::|AndExpr/start.1|))
                        (XML-QUERY::|AndExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|BeforeAfterExpr| (INDEX &AUX (XML-QUERY::|BeforeAfterOp| NIL) (XML-QUERY::|Expr| NIL)
                                     (XML-QUERY::|ExprArg2| NIL))
  "{12} BeforeAfterExpr ::= Expr BeforeAfterOp ExprArg2
(|BeforeAfterOp| |Expr| |ExprArg2|)"
  (DECLARE (SPECIAL XML-QUERY::|BeforeAfterExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|BeforeAfterExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|BeforeAfterExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|BeforeAfterExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|BeforeAfterExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|BeforeAfterExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|BeforeAfterExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|BeforeAfterExpr|)
                                 (RETURN-FROM XML-QUERY::|BeforeAfterExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|BeforeAfterExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|BeforeAfterExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|BeforeAfterExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|BeforeAfterExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|BeforeAfterExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|BeforeAfterExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|BeforeAfterOp|
                                                         XML-QUERY::|BeforeAfterOp|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|BeforeAfterExpr-Constructor|
                                                    XML-QUERY::|BeforeAfterOp|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|BeforeAfterExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|BeforeAfterOp|
                                                                          XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|)))
                                                      'XML-QUERY::|BeforeAfterExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|BeforeAfterOp|)
                                     (COND ((XML-QUERY::|IS-BeforeAfterOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|BeforeAfterOp|)
                                            (SETF XML-QUERY::|BeforeAfterOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|BeforeAfterOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|BeforeAfterOp| |item|)
                                                          'XML-QUERY::|BeforeAfterOp|)))
                                            (XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|BeforeAfterOp|)
                                            (XML-QUERY::|BeforeAfterExpr/fail.3| INDEX))))))
                               (XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|BeforeAfterExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|BeforeAfterExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|BeforeAfterExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|BeforeAfterExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|BeforeAfterExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|BeforeAfterExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|BeforeAfterExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|BeforeAfterExpr.2|
                                  XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.4| XML-QUERY::|BeforeAfterExpr/BeforeAfterExpr.2.5|
                                  XML-QUERY::|BeforeAfterExpr/fail.3| XML-QUERY::|BeforeAfterExpr/start.1|))
                        (XML-QUERY::|BeforeAfterExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|FlwrExpr| (INDEX &AUX (XML-QUERY::|FlwrExprForLet| NIL) (XML-QUERY::|ReturnClause| NIL)
                              (XML-QUERY::|WhereClause| NIL))
  "{13} FlwrExpr ::= FlwrExprForLet+ WhereClause? ReturnClause
(|FlwrExprForLet| |ReturnClause| |WhereClause|)"
  (DECLARE (SPECIAL XML-QUERY::|FlwrExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|FlwrExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|FlwrExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|FlwrExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|FlwrExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|FlwrExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|FlwrExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|FlwrExpr|)
                                 (RETURN-FROM XML-QUERY::|FlwrExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|FlwrExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|FlwrExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|FlwrExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|FlwrExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|FlwrExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|FlwrExprForLet|
                                                         XML-QUERY::|FlwrExprForLet|
                                                         'XML-QUERY::|ReturnClause|
                                                         XML-QUERY::|ReturnClause|
                                                         'XML-QUERY::|WhereClause|
                                                         XML-QUERY::|WhereClause|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|FlwrExpr-Constructor|
                                                    XML-QUERY::|FlwrExprForLet|
                                                    XML-QUERY::|ReturnClause|
                                                    XML-QUERY::|WhereClause|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|FlwrExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|FlwrExprForLet|
                                                                          XML-QUERY::|ReturnClause|
                                                                          XML-QUERY::|WhereClause|)))
                                                      'XML-QUERY::|FlwrExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|FlwrExpr.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExpr.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FlwrExprForLet|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrExprForLet| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FlwrExprForLet| (CONS RESULT XML-QUERY::|FlwrExprForLet|)))
                                              (XML-QUERY::|FlwrExpr.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|FlwrExprForLet|)
                                              (XML-QUERY::|FlwrExpr/FlwrExpr.2.4| INDEX)))))))
                               (XML-QUERY::|FlwrExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|FlwrExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|FlwrExpr/FlwrExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExpr/FlwrExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|WhereClause|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|WhereClause| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|WhereClause| RESULT))
                                              (XML-QUERY::|FlwrExpr/FlwrExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|WhereClause|)
                                              (XML-QUERY::|FlwrExpr/FlwrExpr.2.5| INDEX)))))))
                               (XML-QUERY::|FlwrExpr/FlwrExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExpr/FlwrExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ReturnClause|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ReturnClause| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ReturnClause| RESULT))
                                              (XML-QUERY::|FlwrExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ReturnClause|)
                                              (XML-QUERY::|FlwrExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|FlwrExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FlwrExprForLet|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrExprForLet| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FlwrExprForLet| (CONS RESULT XML-QUERY::|FlwrExprForLet|)))
                                              (XML-QUERY::|FlwrExpr.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|FlwrExprForLet|)
                                              (XML-QUERY::|FlwrExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|FlwrExpr.2| XML-QUERY::|FlwrExpr.6| XML-QUERY::|FlwrExpr/fail.3|
                                  XML-QUERY::|FlwrExpr/FlwrExpr.2.4| XML-QUERY::|FlwrExpr/FlwrExpr.2.5|
                                  XML-QUERY::|FlwrExpr/start.1|))
                        (XML-QUERY::|FlwrExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|FlwrExprForLet| (INDEX &AUX (XML-QUERY::|ForClause| NIL) (XML-QUERY::|LetClause| NIL))
  "FlwrExprForLet ::= (ForClause | LetClause)
(|ForClause| |LetClause|)"
  (DECLARE (SPECIAL XML-QUERY::|FlwrExprForLet-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|FlwrExprForLet-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|FlwrExprForLet-INDEX| INDEX)
      (LET ((XML-QUERY::|FlwrExprForLet-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|FlwrExprForLet| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|FlwrExprForLet-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|FlwrExprForLet|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|FlwrExprForLet|)
                                 (RETURN-FROM XML-QUERY::|FlwrExprForLet| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|FlwrExprForLet| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|FlwrExprForLet.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExprForLet.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|FlwrExprForLet|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|FlwrExprForLet|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|FlwrExprForLet|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|ForClause|
                                                         XML-QUERY::|ForClause|
                                                         'XML-QUERY::|LetClause|
                                                         XML-QUERY::|LetClause|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|FlwrExprForLet-Constructor|
                                                    XML-QUERY::|ForClause|
                                                    XML-QUERY::|LetClause|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|FlwrExprForLet|
                                                            (DELETE NIL (LIST XML-QUERY::|ForClause| XML-QUERY::|LetClause|)))
                                                      'XML-QUERY::|FlwrExprForLet|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|FlwrExprForLet/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|FlwrExprForLet/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|FlwrExprForLet/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrExprForLet/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|ForClause|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ForClause| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|ForClause| RESULT))
                                                    (XML-QUERY::|FlwrExprForLet.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|ForClause|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|LetClause|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|LetClause| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|LetClause| RESULT))
                                                    (XML-QUERY::|FlwrExprForLet.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|LetClause|) NIL))))
                                         (XML-QUERY::|FlwrExprForLet/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|FlwrExprForLet.2| XML-QUERY::|FlwrExprForLet/fail.3|
                                  XML-QUERY::|FlwrExprForLet/start.1|))
                        (XML-QUERY::|FlwrExprForLet/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ForClause| (INDEX &AUX (XML-QUERY::|FlwrForBinding| NIL))
  "{14} ForClause ::= 'for' FlwrForBinding (',' FlwrForBinding)*
(|FlwrForBinding|)"
  (DECLARE (SPECIAL XML-QUERY::|ForClause-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ForClause-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ForClause-INDEX| INDEX)
      (LET ((XML-QUERY::|ForClause-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ForClause| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ForClause-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ForClause|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ForClause|)
                                 (RETURN-FROM XML-QUERY::|ForClause| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ForClause| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ForClause.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ForClause|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ForClause|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ForClause|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|FlwrForBinding| XML-QUERY::|FlwrForBinding|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ForClause-Constructor| XML-QUERY::|FlwrForBinding|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ForClause|
                                                            (DELETE NIL (LIST XML-QUERY::|FlwrForBinding|)))
                                                      'XML-QUERY::|ForClause|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ForClause.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause.6|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ForClause/ForClause.6.7|)
                                     (XML-QUERY::|ForClause/ForClause.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|ForClause.2|) (XML-QUERY::|ForClause.2| INDEX))))
                               (XML-QUERY::|ForClause/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ForClause/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ForClause/ForClause.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause/ForClause.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FlwrForBinding|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrForBinding| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FlwrForBinding| (CONS RESULT XML-QUERY::|FlwrForBinding|)))
                                              (XML-QUERY::|ForClause/ForClause.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|FlwrForBinding|)
                                              (XML-QUERY::|ForClause/fail.3| INDEX)))))))
                               (XML-QUERY::|ForClause/ForClause.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause/ForClause.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ForClause/ForClause.6.7|)
                                     (XML-QUERY::|ForClause/ForClause.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|ForClause.2|) (XML-QUERY::|ForClause.2| INDEX))))
                               (XML-QUERY::|ForClause/ForClause.6.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause/ForClause.6.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((STRING-EQUAL |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-QUERY::|ForClause/ForClause.6.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-QUERY::|ForClause/ForClause.6.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause/ForClause.6.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FlwrForBinding|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrForBinding| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FlwrForBinding| (CONS RESULT XML-QUERY::|FlwrForBinding|)))
                                              (XML-QUERY::|ForClause.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|FlwrForBinding|) NIL))))))
                               (XML-QUERY::|ForClause/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ForClause/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|for|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|for|)
                                            (SETF *ATN-TERM* '|xml|::|for|)
                                            (XML-QUERY::|ForClause/ForClause.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|for|) (XML-QUERY::|ForClause/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ForClause.2| XML-QUERY::|ForClause.6|
                                  XML-QUERY::|ForClause/fail.3| XML-QUERY::|ForClause/ForClause.2.4|
                                  XML-QUERY::|ForClause/ForClause.2.5| XML-QUERY::|ForClause/ForClause.6.7|
                                  XML-QUERY::|ForClause/ForClause.6.8| XML-QUERY::|ForClause/start.1|))
                        (XML-QUERY::|ForClause/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|FlwrForBinding| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|Variable| NIL))
  "FlwrForBinding ::= Variable 'in' Expr
(|Expr| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|FlwrForBinding-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|FlwrForBinding-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|FlwrForBinding-INDEX| INDEX)
      (LET ((XML-QUERY::|FlwrForBinding-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|FlwrForBinding| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|FlwrForBinding-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|FlwrForBinding|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|FlwrForBinding|)
                                 (RETURN-FROM XML-QUERY::|FlwrForBinding| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|FlwrForBinding| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|FlwrForBinding.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrForBinding.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|FlwrForBinding|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|FlwrForBinding|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|FlwrForBinding|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|FlwrForBinding-Constructor| XML-QUERY::|Expr| XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|FlwrForBinding|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|FlwrForBinding|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|FlwrForBinding/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|FlwrForBinding/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|FlwrForBinding/FlwrForBinding.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrForBinding/FlwrForBinding.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|in|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|in|)
                                            (SETF *ATN-TERM* '|xml|::|in|)
                                            (XML-QUERY::|FlwrForBinding/FlwrForBinding.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|in|) (XML-QUERY::|FlwrForBinding/fail.3| INDEX))))))
                               (XML-QUERY::|FlwrForBinding/FlwrForBinding.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrForBinding/FlwrForBinding.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|FlwrForBinding.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|FlwrForBinding/fail.3| INDEX)))))))
                               (XML-QUERY::|FlwrForBinding/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrForBinding/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Variable|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                              (XML-QUERY::|FlwrForBinding/FlwrForBinding.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Variable|)
                                              (XML-QUERY::|FlwrForBinding/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|FlwrForBinding.2| XML-QUERY::|FlwrForBinding/fail.3|
                                  XML-QUERY::|FlwrForBinding/FlwrForBinding.2.4| XML-QUERY::|FlwrForBinding/FlwrForBinding.2.5|
                                  XML-QUERY::|FlwrForBinding/start.1|))
                        (XML-QUERY::|FlwrForBinding/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|LetClause| (INDEX &AUX (XML-QUERY::|FlwrLetBinding| NIL))
  "{15} LetClause ::= 'let' FlwrLetBinding (',' FlwrLetBinding)*
(|FlwrLetBinding|)"
  (DECLARE (SPECIAL XML-QUERY::|LetClause-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|LetClause-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|LetClause-INDEX| INDEX)
      (LET ((XML-QUERY::|LetClause-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|LetClause| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|LetClause-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|LetClause|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|LetClause|)
                                 (RETURN-FROM XML-QUERY::|LetClause| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|LetClause| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|LetClause.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|LetClause|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|LetClause|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|LetClause|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|FlwrLetBinding| XML-QUERY::|FlwrLetBinding|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|LetClause-Constructor| XML-QUERY::|FlwrLetBinding|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|LetClause|
                                                            (DELETE NIL (LIST XML-QUERY::|FlwrLetBinding|)))
                                                      'XML-QUERY::|LetClause|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|LetClause.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause.6|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|LetClause/LetClause.6.7|)
                                     (XML-QUERY::|LetClause/LetClause.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|LetClause.2|) (XML-QUERY::|LetClause.2| INDEX))))
                               (XML-QUERY::|LetClause/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|LetClause/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|LetClause/LetClause.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause/LetClause.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FlwrLetBinding|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrLetBinding| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FlwrLetBinding| (CONS RESULT XML-QUERY::|FlwrLetBinding|)))
                                              (XML-QUERY::|LetClause/LetClause.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|FlwrLetBinding|)
                                              (XML-QUERY::|LetClause/fail.3| INDEX)))))))
                               (XML-QUERY::|LetClause/LetClause.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause/LetClause.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|LetClause/LetClause.6.7|)
                                     (XML-QUERY::|LetClause/LetClause.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|LetClause.2|) (XML-QUERY::|LetClause.2| INDEX))))
                               (XML-QUERY::|LetClause/LetClause.6.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause/LetClause.6.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((STRING-EQUAL |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-QUERY::|LetClause/LetClause.6.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-QUERY::|LetClause/LetClause.6.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause/LetClause.6.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|FlwrLetBinding|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FlwrLetBinding| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|FlwrLetBinding| (CONS RESULT XML-QUERY::|FlwrLetBinding|)))
                                              (XML-QUERY::|LetClause.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|FlwrLetBinding|) NIL))))))
                               (XML-QUERY::|LetClause/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|LetClause/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|let|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|let|)
                                            (SETF *ATN-TERM* '|xml|::|let|)
                                            (XML-QUERY::|LetClause/LetClause.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|let|) (XML-QUERY::|LetClause/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|LetClause.2| XML-QUERY::|LetClause.6|
                                  XML-QUERY::|LetClause/fail.3| XML-QUERY::|LetClause/LetClause.2.4|
                                  XML-QUERY::|LetClause/LetClause.2.5| XML-QUERY::|LetClause/LetClause.6.7|
                                  XML-QUERY::|LetClause/LetClause.6.8| XML-QUERY::|LetClause/start.1|))
                        (XML-QUERY::|LetClause/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|FlwrLetBinding| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|Variable| NIL))
  "FlwrLetBinding ::= Variable ':=' Expr
(|Expr| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|FlwrLetBinding-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|FlwrLetBinding-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|FlwrLetBinding-INDEX| INDEX)
      (LET ((XML-QUERY::|FlwrLetBinding-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|FlwrLetBinding| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|FlwrLetBinding-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|FlwrLetBinding|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|FlwrLetBinding|)
                                 (RETURN-FROM XML-QUERY::|FlwrLetBinding| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|FlwrLetBinding| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|FlwrLetBinding.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrLetBinding.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|FlwrLetBinding|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|FlwrLetBinding|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|FlwrLetBinding|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|FlwrLetBinding-Constructor| XML-QUERY::|Expr| XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|FlwrLetBinding|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|FlwrLetBinding|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|FlwrLetBinding/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|FlwrLetBinding/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\:=)
                                     (COND ((STRING-EQUAL |item| '|xml|:\:=)
                                            (SETF *ATN-TERM* '|xml|:\:=)
                                            (XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\:=) (XML-QUERY::|FlwrLetBinding/fail.3| INDEX))))))
                               (XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|FlwrLetBinding.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|FlwrLetBinding/fail.3| INDEX)))))))
                               (XML-QUERY::|FlwrLetBinding/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FlwrLetBinding/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Variable|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                              (XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Variable|)
                                              (XML-QUERY::|FlwrLetBinding/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|FlwrLetBinding.2| XML-QUERY::|FlwrLetBinding/fail.3|
                                  XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.4| XML-QUERY::|FlwrLetBinding/FlwrLetBinding.2.5|
                                  XML-QUERY::|FlwrLetBinding/start.1|))
                        (XML-QUERY::|FlwrLetBinding/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|WhereClause| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "{16} WhereClause ::= 'where' Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|WhereClause-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|WhereClause-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|WhereClause-INDEX| INDEX)
      (LET ((XML-QUERY::|WhereClause-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|WhereClause| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|WhereClause-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|WhereClause|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|WhereClause|)
                                 (RETURN-FROM XML-QUERY::|WhereClause| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|WhereClause| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|WhereClause.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|WhereClause.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|WhereClause|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|WhereClause|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|WhereClause|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|WhereClause-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|WhereClause| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|WhereClause|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|WhereClause/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|WhereClause/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|WhereClause/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|WhereClause/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|where|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|where|)
                                            (SETF *ATN-TERM* '|xml|::|where|)
                                            (XML-QUERY::|WhereClause/WhereClause.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|where|) (XML-QUERY::|WhereClause/fail.3| INDEX))))))
                               (XML-QUERY::|WhereClause/WhereClause.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|WhereClause/WhereClause.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|WhereClause.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|WhereClause/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|WhereClause.2| XML-QUERY::|WhereClause/fail.3|
                                  XML-QUERY::|WhereClause/start.1| XML-QUERY::|WhereClause/WhereClause.2.4|))
                        (XML-QUERY::|WhereClause/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ReturnClause| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "ReturnClause ::= 'return' Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|ReturnClause-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ReturnClause-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ReturnClause-INDEX| INDEX)
      (LET ((XML-QUERY::|ReturnClause-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ReturnClause| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ReturnClause-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ReturnClause|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ReturnClause|)
                                 (RETURN-FROM XML-QUERY::|ReturnClause| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ReturnClause| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ReturnClause.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ReturnClause.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ReturnClause|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ReturnClause|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ReturnClause|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ReturnClause-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ReturnClause| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|ReturnClause|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ReturnClause/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ReturnClause/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ReturnClause/ReturnClause.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ReturnClause/ReturnClause.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|ReturnClause.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|ReturnClause/fail.3| INDEX)))))))
                               (XML-QUERY::|ReturnClause/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ReturnClause/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|return|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|return|)
                                            (SETF *ATN-TERM* '|xml|::|return|)
                                            (XML-QUERY::|ReturnClause/ReturnClause.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|return|) (XML-QUERY::|ReturnClause/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ReturnClause.2| XML-QUERY::|ReturnClause/fail.3|
                                  XML-QUERY::|ReturnClause/ReturnClause.2.4| XML-QUERY::|ReturnClause/start.1|))
                        (XML-QUERY::|ReturnClause/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|IfExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|IfElseExpr| NIL) (XML-QUERY::|IfThenExpr| NIL))
  "{17} IfExpr ::= 'if' '(' Expr ')' 'then' IfThenExpr 'else' IfElseExpr
(|Expr| |IfElseExpr| |IfThenExpr|)"
  (DECLARE (SPECIAL XML-QUERY::|IfExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|IfExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|IfExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|IfExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|IfExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|IfExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|IfExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|IfExpr|)
                                 (RETURN-FROM XML-QUERY::|IfExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|IfExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|IfExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|IfExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|IfExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|IfExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|IfElseExpr|
                                                         XML-QUERY::|IfElseExpr|
                                                         'XML-QUERY::|IfThenExpr|
                                                         XML-QUERY::|IfThenExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|IfExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|IfElseExpr|
                                                    XML-QUERY::|IfThenExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|IfExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|IfElseExpr|
                                                                          XML-QUERY::|IfThenExpr|)))
                                                      'XML-QUERY::|IfExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|IfExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|IfExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|IfExpr/IfExpr.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|IfElseExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|IfElseExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|IfElseExpr| RESULT))
                                              (XML-QUERY::|IfExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|IfElseExpr|)
                                              (XML-QUERY::|IfExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|IfExpr/IfExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|IfExpr/IfExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|IfExpr/fail.3| INDEX))))))
                               (XML-QUERY::|IfExpr/IfExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|IfExpr/IfExpr.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|IfExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|IfExpr/IfExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|IfExpr/IfExpr.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|IfExpr/fail.3| INDEX))))))
                               (XML-QUERY::|IfExpr/IfExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|then|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|then|)
                                            (SETF *ATN-TERM* '|xml|::|then|)
                                            (XML-QUERY::|IfExpr/IfExpr.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|then|) (XML-QUERY::|IfExpr/fail.3| INDEX))))))
                               (XML-QUERY::|IfExpr/IfExpr.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|IfThenExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|IfThenExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|IfThenExpr| RESULT))
                                              (XML-QUERY::|IfExpr/IfExpr.2.9| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|IfThenExpr|)
                                              (XML-QUERY::|IfExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|IfExpr/IfExpr.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/IfExpr.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|else|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|else|)
                                            (SETF *ATN-TERM* '|xml|::|else|)
                                            (XML-QUERY::|IfExpr/IfExpr.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|else|) (XML-QUERY::|IfExpr/fail.3| INDEX))))))
                               (XML-QUERY::|IfExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|if|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|if|)
                                            (SETF *ATN-TERM* '|xml|::|if|)
                                            (XML-QUERY::|IfExpr/IfExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|if|) (XML-QUERY::|IfExpr/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|IfExpr.2| XML-QUERY::|IfExpr/fail.3|
                                  XML-QUERY::|IfExpr/IfExpr.2.10| XML-QUERY::|IfExpr/IfExpr.2.4| XML-QUERY::|IfExpr/IfExpr.2.5|
                                  XML-QUERY::|IfExpr/IfExpr.2.6| XML-QUERY::|IfExpr/IfExpr.2.7| XML-QUERY::|IfExpr/IfExpr.2.8|
                                  XML-QUERY::|IfExpr/IfExpr.2.9| XML-QUERY::|IfExpr/start.1|))
                        (XML-QUERY::|IfExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|IfThenExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "IfThenExpr ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|IfThenExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|IfThenExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|IfThenExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|IfThenExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|IfThenExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|IfThenExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|IfThenExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|IfThenExpr|)
                                 (RETURN-FROM XML-QUERY::|IfThenExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|IfThenExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|IfThenExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfThenExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|IfThenExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|IfThenExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|IfThenExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|IfThenExpr-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|IfThenExpr| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|IfThenExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|IfThenExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|IfThenExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|IfThenExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfThenExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|IfThenExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|IfThenExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|IfThenExpr.2| XML-QUERY::|IfThenExpr/fail.3|
                                  XML-QUERY::|IfThenExpr/start.1|))
                        (XML-QUERY::|IfThenExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|IfElseExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "IfElseExpr ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|IfElseExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|IfElseExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|IfElseExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|IfElseExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|IfElseExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|IfElseExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|IfElseExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|IfElseExpr|)
                                 (RETURN-FROM XML-QUERY::|IfElseExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|IfElseExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|IfElseExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfElseExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|IfElseExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|IfElseExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|IfElseExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|IfElseExpr-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|IfElseExpr| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|IfElseExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|IfElseExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|IfElseExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|IfElseExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IfElseExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|IfElseExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|IfElseExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|IfElseExpr.2| XML-QUERY::|IfElseExpr/fail.3|
                                  XML-QUERY::|IfElseExpr/start.1|))
                        (XML-QUERY::|IfElseExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|SomeExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprTest| NIL) (XML-QUERY::|Variable| NIL))
  "{18} SomeExpr ::= 'some' Variable 'in' Expr 'satisfies' ExprTest
(|Expr| |ExprTest| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|SomeExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|SomeExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|SomeExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|SomeExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|SomeExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|SomeExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|SomeExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|SomeExpr|)
                                 (RETURN-FROM XML-QUERY::|SomeExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|SomeExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|SomeExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|SomeExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|SomeExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|SomeExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprTest|
                                                         XML-QUERY::|ExprTest|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|SomeExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprTest|
                                                    XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|SomeExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprTest|
                                                                          XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|SomeExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|SomeExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|SomeExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|SomeExpr/SomeExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr/SomeExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Variable|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                              (XML-QUERY::|SomeExpr/SomeExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Variable|)
                                              (XML-QUERY::|SomeExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|SomeExpr/SomeExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr/SomeExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|in|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|in|)
                                            (SETF *ATN-TERM* '|xml|::|in|)
                                            (XML-QUERY::|SomeExpr/SomeExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|in|) (XML-QUERY::|SomeExpr/fail.3| INDEX))))))
                               (XML-QUERY::|SomeExpr/SomeExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr/SomeExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|SomeExpr/SomeExpr.2.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|SomeExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|SomeExpr/SomeExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr/SomeExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|satisfies|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|satisfies|)
                                            (SETF *ATN-TERM* '|xml|::|satisfies|)
                                            (XML-QUERY::|SomeExpr/SomeExpr.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|satisfies|) (XML-QUERY::|SomeExpr/fail.3| INDEX))))))
                               (XML-QUERY::|SomeExpr/SomeExpr.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr/SomeExpr.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprTest| RESULT))
                                              (XML-QUERY::|SomeExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprTest|)
                                              (XML-QUERY::|SomeExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|SomeExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|SomeExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|some|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|some|)
                                            (SETF *ATN-TERM* '|xml|::|some|)
                                            (XML-QUERY::|SomeExpr/SomeExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|some|) (XML-QUERY::|SomeExpr/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|SomeExpr.2| XML-QUERY::|SomeExpr/fail.3|
                                  XML-QUERY::|SomeExpr/SomeExpr.2.4| XML-QUERY::|SomeExpr/SomeExpr.2.5|
                                  XML-QUERY::|SomeExpr/SomeExpr.2.6| XML-QUERY::|SomeExpr/SomeExpr.2.7|
                                  XML-QUERY::|SomeExpr/SomeExpr.2.8| XML-QUERY::|SomeExpr/start.1|))
                        (XML-QUERY::|SomeExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|EveryExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprTest| NIL) (XML-QUERY::|Variable| NIL))
  "{19} EveryExpr ::= 'every' Variable 'in' Expr 'satisfies' ExprTest
(|Expr| |ExprTest| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|EveryExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|EveryExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|EveryExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|EveryExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|EveryExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|EveryExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|EveryExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|EveryExpr|)
                                 (RETURN-FROM XML-QUERY::|EveryExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|EveryExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|EveryExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|EveryExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|EveryExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|EveryExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprTest|
                                                         XML-QUERY::|ExprTest|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|EveryExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprTest|
                                                    XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|EveryExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprTest|
                                                                          XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|EveryExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|EveryExpr/EveryExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr/EveryExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Variable|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                              (XML-QUERY::|EveryExpr/EveryExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Variable|)
                                              (XML-QUERY::|EveryExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|EveryExpr/EveryExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr/EveryExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|in|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|in|)
                                            (SETF *ATN-TERM* '|xml|::|in|)
                                            (XML-QUERY::|EveryExpr/EveryExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|in|) (XML-QUERY::|EveryExpr/fail.3| INDEX))))))
                               (XML-QUERY::|EveryExpr/EveryExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr/EveryExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|EveryExpr/EveryExpr.2.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|EveryExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|EveryExpr/EveryExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr/EveryExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|satisfies|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|satisfies|)
                                            (SETF *ATN-TERM* '|xml|::|satisfies|)
                                            (XML-QUERY::|EveryExpr/EveryExpr.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|satisfies|) (XML-QUERY::|EveryExpr/fail.3| INDEX))))))
                               (XML-QUERY::|EveryExpr/EveryExpr.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr/EveryExpr.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprTest| RESULT))
                                              (XML-QUERY::|EveryExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprTest|)
                                              (XML-QUERY::|EveryExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|EveryExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|EveryExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|EveryExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EveryExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|every|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|every|)
                                            (SETF *ATN-TERM* '|xml|::|every|)
                                            (XML-QUERY::|EveryExpr/EveryExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|every|) (XML-QUERY::|EveryExpr/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|EveryExpr.2| XML-QUERY::|EveryExpr/EveryExpr.2.4|
                                  XML-QUERY::|EveryExpr/EveryExpr.2.5| XML-QUERY::|EveryExpr/EveryExpr.2.6|
                                  XML-QUERY::|EveryExpr/EveryExpr.2.7| XML-QUERY::|EveryExpr/EveryExpr.2.8|
                                  XML-QUERY::|EveryExpr/fail.3| XML-QUERY::|EveryExpr/start.1|))
                        (XML-QUERY::|EveryExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ExprTest| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "ExprTest ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|ExprTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ExprTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ExprTest-INDEX| INDEX)
      (LET ((XML-QUERY::|ExprTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|ExprTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ExprTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ExprTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ExprTest|)
                                 (RETURN-FROM XML-QUERY::|ExprTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ExprTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ExprTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ExprTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ExprTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ExprTest|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ExprTest-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ExprTest| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|ExprTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ExprTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ExprTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ExprTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|ExprTest.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|ExprTest/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ExprTest.2| XML-QUERY::|ExprTest/fail.3|
                                  XML-QUERY::|ExprTest/start.1|))
                        (XML-QUERY::|ExprTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|TypeSwitchExpr| (INDEX &AUX (XML-QUERY::|CaseClause| NIL) (XML-QUERY::|DefaultExpr| NIL) (XML-QUERY::|Expr| NIL)
                                    (XML-QUERY::|Variable| NIL))
  "{20} TypeSwitchExpr ::= 'typeswitch' '(' Expr ')' ('as'
                                                   Variable)? CaseClause+ 'default' 'return' DefaultExpr
(|CaseClause| |DefaultExpr| |Expr| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|TypeSwitchExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|TypeSwitchExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|TypeSwitchExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|TypeSwitchExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|TypeSwitchExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|TypeSwitchExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|TypeSwitchExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|TypeSwitchExpr|)
                                 (RETURN-FROM XML-QUERY::|TypeSwitchExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|TypeSwitchExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|TypeSwitchExpr.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr.14|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|CaseClause|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CaseClause| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|CaseClause| (CONS RESULT XML-QUERY::|CaseClause|)))
                                              (XML-QUERY::|TypeSwitchExpr.14| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|CaseClause|)
                                              (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.9| INDEX)))))))
                               (XML-QUERY::|TypeSwitchExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|TypeSwitchExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|TypeSwitchExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|TypeSwitchExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CaseClause|
                                                         XML-QUERY::|CaseClause|
                                                         'XML-QUERY::|DefaultExpr|
                                                         XML-QUERY::|DefaultExpr|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|TypeSwitchExpr-Constructor|
                                                    XML-QUERY::|CaseClause|
                                                    XML-QUERY::|DefaultExpr|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|TypeSwitchExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|CaseClause|
                                                                          XML-QUERY::|DefaultExpr|
                                                                          XML-QUERY::|Expr|
                                                                          XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|TypeSwitchExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|TypeSwitchExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|TypeSwitchExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|TypeSwitchExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|typeswitch|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|typeswitch|)
                                            (SETF *ATN-TERM* '|xml|::|typeswitch|)
                                            (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.4| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* '|xml|::|typeswitch|)
                                            (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|return|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|return|)
                                            (SETF *ATN-TERM* '|xml|::|return|)
                                            (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|return|) (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|DefaultExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|DefaultExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|DefaultExpr| RESULT))
                                              (XML-QUERY::|TypeSwitchExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|DefaultExpr|)
                                              (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.12|)
                                     (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.12| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.8|)
                                     (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.8| INDEX))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|CaseClause|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CaseClause| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|CaseClause| (CONS RESULT XML-QUERY::|CaseClause|)))
                                              (XML-QUERY::|TypeSwitchExpr.14| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|CaseClause|)
                                              (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|default|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|default|)
                                            (SETF *ATN-TERM* '|xml|::|default|)
                                            (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|default|) (XML-QUERY::|TypeSwitchExpr/fail.3| INDEX))))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.12|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|as|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|as|)
                                            (SETF *ATN-TERM* '|xml|::|as|)
                                            (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|as|) NIL)))))
                               (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.13|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Variable|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                              (XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.8| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Variable|) NIL)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|TypeSwitchExpr.14| XML-QUERY::|TypeSwitchExpr.2|
                                  XML-QUERY::|TypeSwitchExpr/fail.3| XML-QUERY::|TypeSwitchExpr/start.1|
                                  XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.10| XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.11|
                                  XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.4| XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.5|
                                  XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.6| XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.7|
                                  XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.8| XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr.2.9|
                                  XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.12|
                                  XML-QUERY::|TypeSwitchExpr/TypeSwitchExpr/TypeSwitchExpr.2.8.13|))
                        (XML-QUERY::|TypeSwitchExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|DefaultExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "DefaultExpr ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|DefaultExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|DefaultExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|DefaultExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|DefaultExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|DefaultExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|DefaultExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|DefaultExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|DefaultExpr|)
                                 (RETURN-FROM XML-QUERY::|DefaultExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|DefaultExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|DefaultExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|DefaultExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|DefaultExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|DefaultExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|DefaultExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|DefaultExpr-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|DefaultExpr| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|DefaultExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|DefaultExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|DefaultExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|DefaultExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|DefaultExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|DefaultExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|DefaultExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|DefaultExpr.2| XML-QUERY::|DefaultExpr/fail.3|
                                  XML-QUERY::|DefaultExpr/start.1|))
                        (XML-QUERY::|DefaultExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|CaseClause| (INDEX &AUX (XML-QUERY::|Datatype| NIL) (XML-QUERY::|Expr| NIL))
  "{21} CaseClause ::= 'case' Datatype 'return' Expr
(|Datatype| |Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|CaseClause-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|CaseClause-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|CaseClause-INDEX| INDEX)
      (LET ((XML-QUERY::|CaseClause-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|CaseClause| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|CaseClause-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|CaseClause|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|CaseClause|)
                                 (RETURN-FROM XML-QUERY::|CaseClause| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|CaseClause| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|CaseClause.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CaseClause.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|CaseClause|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|CaseClause|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|CaseClause|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Datatype|
                                                         XML-QUERY::|Datatype|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|CaseClause-Constructor| XML-QUERY::|Datatype| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|CaseClause|
                                                            (DELETE NIL (LIST XML-QUERY::|Datatype| XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|CaseClause|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|CaseClause/CaseClause.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CaseClause/CaseClause.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Datatype|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Datatype| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Datatype| RESULT))
                                              (XML-QUERY::|CaseClause/CaseClause.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Datatype|)
                                              (XML-QUERY::|CaseClause/fail.3| INDEX)))))))
                               (XML-QUERY::|CaseClause/CaseClause.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CaseClause/CaseClause.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|return|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|return|)
                                            (SETF *ATN-TERM* '|xml|::|return|)
                                            (XML-QUERY::|CaseClause/CaseClause.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|return|) (XML-QUERY::|CaseClause/fail.3| INDEX))))))
                               (XML-QUERY::|CaseClause/CaseClause.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CaseClause/CaseClause.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|CaseClause.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|CaseClause/fail.3| INDEX)))))))
                               (XML-QUERY::|CaseClause/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|CaseClause/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|CaseClause/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CaseClause/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|case|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|case|)
                                            (SETF *ATN-TERM* '|xml|::|case|)
                                            (XML-QUERY::|CaseClause/CaseClause.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|case|) (XML-QUERY::|CaseClause/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|CaseClause.2| XML-QUERY::|CaseClause/CaseClause.2.4|
                                  XML-QUERY::|CaseClause/CaseClause.2.5| XML-QUERY::|CaseClause/CaseClause.2.6|
                                  XML-QUERY::|CaseClause/fail.3| XML-QUERY::|CaseClause/start.1|))
                        (XML-QUERY::|CaseClause/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|EqualityExpr| (INDEX &AUX (XML-QUERY::|EqualityOp| NIL) (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL))
  "{22} EqualityExpr ::= Expr EqualityOp ExprArg2
(|EqualityOp| |Expr| |ExprArg2|)"
  (DECLARE (SPECIAL XML-QUERY::|EqualityExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|EqualityExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|EqualityExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|EqualityExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|EqualityExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|EqualityExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|EqualityExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|EqualityExpr|)
                                 (RETURN-FROM XML-QUERY::|EqualityExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|EqualityExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|EqualityExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EqualityExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|EqualityExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|EqualityExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|EqualityExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|EqualityOp|
                                                         XML-QUERY::|EqualityOp|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|EqualityExpr-Constructor|
                                                    XML-QUERY::|EqualityOp|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|EqualityExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|EqualityOp|
                                                                          XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|)))
                                                      'XML-QUERY::|EqualityExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|EqualityExpr/EqualityExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EqualityExpr/EqualityExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|EqualityOp|)
                                     (COND ((XML-QUERY::|IS-EqualityOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|EqualityOp|)
                                            (SETF XML-QUERY::|EqualityOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|EqualityOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|EqualityOp| |item|)
                                                          'XML-QUERY::|EqualityOp|)))
                                            (XML-QUERY::|EqualityExpr/EqualityExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|EqualityOp|)
                                            (XML-QUERY::|EqualityExpr/fail.3| INDEX))))))
                               (XML-QUERY::|EqualityExpr/EqualityExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EqualityExpr/EqualityExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|EqualityExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|EqualityExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|EqualityExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|EqualityExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|EqualityExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EqualityExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|EqualityExpr/EqualityExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|EqualityExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|EqualityExpr.2| XML-QUERY::|EqualityExpr/EqualityExpr.2.4|
                                  XML-QUERY::|EqualityExpr/EqualityExpr.2.5| XML-QUERY::|EqualityExpr/fail.3|
                                  XML-QUERY::|EqualityExpr/start.1|))
                        (XML-QUERY::|EqualityExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|RelationalExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL) (XML-QUERY::|RelationalOp| NIL))
  "{23} RelationalExpr ::= Expr RelationalOp ExprArg2
(|Expr| |ExprArg2| |RelationalOp|)"
  (DECLARE (SPECIAL XML-QUERY::|RelationalExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|RelationalExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|RelationalExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|RelationalExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|RelationalExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|RelationalExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|RelationalExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|RelationalExpr|)
                                 (RETURN-FROM XML-QUERY::|RelationalExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|RelationalExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|RelationalExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelationalExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|RelationalExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|RelationalExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|RelationalExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|
                                                         'XML-QUERY::|RelationalOp|
                                                         XML-QUERY::|RelationalOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|RelationalExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|
                                                    XML-QUERY::|RelationalOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|RelationalExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|
                                                                          XML-QUERY::|RelationalOp|)))
                                                      'XML-QUERY::|RelationalExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|RelationalExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|RelationalExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|RelationalExpr/RelationalExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelationalExpr/RelationalExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|RelationalOp|)
                                     (COND ((XML-QUERY::|IS-RelationalOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|RelationalOp|)
                                            (SETF XML-QUERY::|RelationalOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|RelationalOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|RelationalOp| |item|)
                                                          'XML-QUERY::|RelationalOp|)))
                                            (XML-QUERY::|RelationalExpr/RelationalExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|RelationalOp|)
                                            (XML-QUERY::|RelationalExpr/fail.3| INDEX))))))
                               (XML-QUERY::|RelationalExpr/RelationalExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelationalExpr/RelationalExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|RelationalExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|RelationalExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|RelationalExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelationalExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|RelationalExpr/RelationalExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|RelationalExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|RelationalExpr.2| XML-QUERY::|RelationalExpr/fail.3|
                                  XML-QUERY::|RelationalExpr/RelationalExpr.2.4| XML-QUERY::|RelationalExpr/RelationalExpr.2.5|
                                  XML-QUERY::|RelationalExpr/start.1|))
                        (XML-QUERY::|RelationalExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|InstanceofExpr| (INDEX &AUX (XML-QUERY::|Datatype| NIL) (XML-QUERY::|Expr| NIL) (XML-QUERY::|OnlyOp| NIL))
  "{24} InstanceofExpr ::= Expr 'instanceof' OnlyOp? Datatype
(|Datatype| |Expr| |OnlyOp|)"
  (DECLARE (SPECIAL XML-QUERY::|InstanceofExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|InstanceofExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|InstanceofExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|InstanceofExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|InstanceofExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|InstanceofExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|InstanceofExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|InstanceofExpr|)
                                 (RETURN-FROM XML-QUERY::|InstanceofExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|InstanceofExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|InstanceofExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|InstanceofExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|InstanceofExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|InstanceofExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|InstanceofExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Datatype|
                                                         XML-QUERY::|Datatype|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|OnlyOp|
                                                         XML-QUERY::|OnlyOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|InstanceofExpr-Constructor|
                                                    XML-QUERY::|Datatype|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|OnlyOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|InstanceofExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Datatype|
                                                                          XML-QUERY::|Expr|
                                                                          XML-QUERY::|OnlyOp|)))
                                                      'XML-QUERY::|InstanceofExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|InstanceofExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|InstanceofExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|InstanceofExpr/InstanceofExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|instanceof|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|instanceof|)
                                            (SETF *ATN-TERM* '|xml|::|instanceof|)
                                            (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* '|xml|::|instanceof|)
                                            (XML-QUERY::|InstanceofExpr/fail.3| INDEX))))))
                               (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|InstanceofExpr/InstanceofExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|OnlyOp|)
                                     (COND ((XML-QUERY::|IS-OnlyOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|OnlyOp|)
                                            (SETF XML-QUERY::|OnlyOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|OnlyOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|OnlyOp| |item|)
                                                          'XML-QUERY::|OnlyOp|)))
                                            (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.6| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|OnlyOp|)
                                            (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.6| INDEX))))))
                               (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|InstanceofExpr/InstanceofExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Datatype|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Datatype| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Datatype| RESULT))
                                              (XML-QUERY::|InstanceofExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Datatype|)
                                              (XML-QUERY::|InstanceofExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|InstanceofExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|InstanceofExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|InstanceofExpr/InstanceofExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|InstanceofExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|InstanceofExpr.2| XML-QUERY::|InstanceofExpr/fail.3|
                                  XML-QUERY::|InstanceofExpr/InstanceofExpr.2.4| XML-QUERY::|InstanceofExpr/InstanceofExpr.2.5|
                                  XML-QUERY::|InstanceofExpr/InstanceofExpr.2.6| XML-QUERY::|InstanceofExpr/start.1|))
                        (XML-QUERY::|InstanceofExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|RangeExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL))
  "{25} RangeExpr ::= Expr 'to' ExprArg2
(|Expr| |ExprArg2|)"
  (DECLARE (SPECIAL XML-QUERY::|RangeExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|RangeExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|RangeExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|RangeExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|RangeExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|RangeExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|RangeExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|RangeExpr|)
                                 (RETURN-FROM XML-QUERY::|RangeExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|RangeExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|RangeExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RangeExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|RangeExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|RangeExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|RangeExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|RangeExpr-Constructor| XML-QUERY::|Expr| XML-QUERY::|ExprArg2|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|RangeExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|ExprArg2|)))
                                                      'XML-QUERY::|RangeExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|RangeExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|RangeExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|RangeExpr/RangeExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RangeExpr/RangeExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|to|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|to|)
                                            (SETF *ATN-TERM* '|xml|::|to|)
                                            (XML-QUERY::|RangeExpr/RangeExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|to|) (XML-QUERY::|RangeExpr/fail.3| INDEX))))))
                               (XML-QUERY::|RangeExpr/RangeExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RangeExpr/RangeExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|RangeExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|RangeExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|RangeExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RangeExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|RangeExpr/RangeExpr.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|RangeExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|RangeExpr.2| XML-QUERY::|RangeExpr/fail.3|
                                  XML-QUERY::|RangeExpr/RangeExpr.2.4| XML-QUERY::|RangeExpr/RangeExpr.2.5|
                                  XML-QUERY::|RangeExpr/start.1|))
                        (XML-QUERY::|RangeExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AdditiveExpr| (INDEX &AUX (XML-QUERY::|AdditiveOp| NIL) (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL))
  "{26} AdditiveExpr ::= Expr AdditiveOp ExprArg2
(|AdditiveOp| |Expr| |ExprArg2|)"
  (DECLARE (SPECIAL XML-QUERY::|AdditiveExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AdditiveExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AdditiveExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|AdditiveExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|AdditiveExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|AdditiveExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AdditiveExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AdditiveExpr|)
                                 (RETURN-FROM XML-QUERY::|AdditiveExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AdditiveExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AdditiveExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AdditiveExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AdditiveExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AdditiveExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|AdditiveExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AdditiveOp|
                                                         XML-QUERY::|AdditiveOp|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AdditiveExpr-Constructor|
                                                    XML-QUERY::|AdditiveOp|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AdditiveExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|AdditiveOp|
                                                                          XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|)))
                                                      'XML-QUERY::|AdditiveExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AdditiveExpr/AdditiveExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AdditiveExpr/AdditiveExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|AdditiveOp|)
                                     (COND ((XML-QUERY::|IS-AdditiveOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|AdditiveOp|)
                                            (SETF XML-QUERY::|AdditiveOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|AdditiveOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|AdditiveOp| |item|)
                                                          'XML-QUERY::|AdditiveOp|)))
                                            (XML-QUERY::|AdditiveExpr/AdditiveExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|AdditiveOp|)
                                            (XML-QUERY::|AdditiveExpr/fail.3| INDEX))))))
                               (XML-QUERY::|AdditiveExpr/AdditiveExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AdditiveExpr/AdditiveExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|AdditiveExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|AdditiveExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|AdditiveExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AdditiveExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AdditiveExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AdditiveExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|AdditiveExpr/AdditiveExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|AdditiveExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AdditiveExpr.2| XML-QUERY::|AdditiveExpr/AdditiveExpr.2.4|
                                  XML-QUERY::|AdditiveExpr/AdditiveExpr.2.5| XML-QUERY::|AdditiveExpr/fail.3|
                                  XML-QUERY::|AdditiveExpr/start.1|))
                        (XML-QUERY::|AdditiveExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|MultiplicativeExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL)
                                        (XML-QUERY::|MultiplicativeOp| NIL))
  "{27} MultiplicativeExpr ::= Expr MultiplicativeOp ExprArg2
(|Expr| |ExprArg2| |MultiplicativeOp|)"
  (DECLARE (SPECIAL XML-QUERY::|MultiplicativeExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|MultiplicativeExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|MultiplicativeExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|MultiplicativeExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|MultiplicativeExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|MultiplicativeExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|MultiplicativeExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|MultiplicativeExpr|)
                                 (RETURN-FROM XML-QUERY::|MultiplicativeExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|MultiplicativeExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|MultiplicativeExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|MultiplicativeExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|MultiplicativeExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|MultiplicativeExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|MultiplicativeExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|
                                                         'XML-QUERY::|MultiplicativeOp|
                                                         XML-QUERY::|MultiplicativeOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|MultiplicativeExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|
                                                    XML-QUERY::|MultiplicativeOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|MultiplicativeExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|
                                                                          XML-QUERY::|MultiplicativeOp|)))
                                                      'XML-QUERY::|MultiplicativeExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|MultiplicativeExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|MultiplicativeExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|MultiplicativeOp|)
                                     (COND ((XML-QUERY::|IS-MultiplicativeOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|MultiplicativeOp|)
                                            (SETF XML-QUERY::|MultiplicativeOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|MultiplicativeOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|MultiplicativeOp| |item|)
                                                          'XML-QUERY::|MultiplicativeOp|)))
                                            (XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|MultiplicativeOp|)
                                            (XML-QUERY::|MultiplicativeExpr/fail.3| INDEX))))))
                               (XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|MultiplicativeExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|MultiplicativeExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|MultiplicativeExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|MultiplicativeExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|MultiplicativeExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|MultiplicativeExpr.2| XML-QUERY::|MultiplicativeExpr/fail.3|
                                  XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.4|
                                  XML-QUERY::|MultiplicativeExpr/MultiplicativeExpr.2.5| XML-QUERY::|MultiplicativeExpr/start.1|))
                        (XML-QUERY::|MultiplicativeExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|UnaryExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|UnaryOp| NIL))
  "{28} UnaryExpr ::= UnaryOp Expr
(|Expr| |UnaryOp|)"
  (DECLARE (SPECIAL XML-QUERY::|UnaryExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|UnaryExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|UnaryExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|UnaryExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|UnaryExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|UnaryExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|UnaryExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|UnaryExpr|)
                                 (RETURN-FROM XML-QUERY::|UnaryExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|UnaryExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|UnaryExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnaryExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|UnaryExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|UnaryExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|UnaryExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|UnaryOp|
                                                         XML-QUERY::|UnaryOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|UnaryExpr-Constructor| XML-QUERY::|Expr| XML-QUERY::|UnaryOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|UnaryExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|UnaryOp|)))
                                                      'XML-QUERY::|UnaryExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|UnaryExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|UnaryExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|UnaryExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnaryExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|UnaryOp|)
                                     (COND ((XML-QUERY::|IS-UnaryOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|UnaryOp|)
                                            (SETF XML-QUERY::|UnaryOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|UnaryOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|UnaryOp| |item|)
                                                          'XML-QUERY::|UnaryOp|)))
                                            (XML-QUERY::|UnaryExpr/UnaryExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|UnaryOp|) (XML-QUERY::|UnaryExpr/fail.3| INDEX))))))
                               (XML-QUERY::|UnaryExpr/UnaryExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnaryExpr/UnaryExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|UnaryExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|UnaryExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|UnaryExpr.2| XML-QUERY::|UnaryExpr/fail.3|
                                  XML-QUERY::|UnaryExpr/start.1| XML-QUERY::|UnaryExpr/UnaryExpr.2.4|))
                        (XML-QUERY::|UnaryExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|UnionExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL) (XML-QUERY::|UnionOrOp| NIL))
  "{29} UnionExpr ::= Expr UnionOrOp ExprArg2
(|Expr| |ExprArg2| |UnionOrOp|)"
  (DECLARE (SPECIAL XML-QUERY::|UnionExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|UnionExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|UnionExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|UnionExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|UnionExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|UnionExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|UnionExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|UnionExpr|)
                                 (RETURN-FROM XML-QUERY::|UnionExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|UnionExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|UnionExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnionExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|UnionExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|UnionExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|UnionExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|
                                                         'XML-QUERY::|UnionOrOp|
                                                         XML-QUERY::|UnionOrOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|UnionExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|
                                                    XML-QUERY::|UnionOrOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|UnionExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|
                                                                          XML-QUERY::|UnionOrOp|)))
                                                      'XML-QUERY::|UnionExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|UnionExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|UnionExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|UnionExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnionExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|UnionExpr/UnionExpr.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|UnionExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|UnionExpr/UnionExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnionExpr/UnionExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|UnionOrOp|)
                                     (COND ((XML-QUERY::|IS-UnionOrOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|UnionOrOp|)
                                            (SETF XML-QUERY::|UnionOrOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|UnionOrOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|UnionOrOp| |item|)
                                                          'XML-QUERY::|UnionOrOp|)))
                                            (XML-QUERY::|UnionExpr/UnionExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|UnionOrOp|) (XML-QUERY::|UnionExpr/fail.3| INDEX))))))
                               (XML-QUERY::|UnionExpr/UnionExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|UnionExpr/UnionExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|UnionExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|UnionExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|UnionExpr.2| XML-QUERY::|UnionExpr/fail.3|
                                  XML-QUERY::|UnionExpr/start.1| XML-QUERY::|UnionExpr/UnionExpr.2.4|
                                  XML-QUERY::|UnionExpr/UnionExpr.2.5|))
                        (XML-QUERY::|UnionExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|IntersectExceptExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|ExprArg2| NIL)
                                         (XML-QUERY::|IntersectExceptOp| NIL))
  "{30} IntersectExceptExpr ::= Expr IntersectExceptOp ExprArg2
(|Expr| |ExprArg2| |IntersectExceptOp|)"
  (DECLARE (SPECIAL XML-QUERY::|IntersectExceptExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|IntersectExceptExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|IntersectExceptExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|IntersectExceptExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|IntersectExceptExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|IntersectExceptExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|IntersectExceptExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|IntersectExceptExpr|)
                                 (RETURN-FROM XML-QUERY::|IntersectExceptExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|IntersectExceptExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|IntersectExceptExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IntersectExceptExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|IntersectExceptExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|IntersectExceptExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|IntersectExceptExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|ExprArg2|
                                                         XML-QUERY::|ExprArg2|
                                                         'XML-QUERY::|IntersectExceptOp|
                                                         XML-QUERY::|IntersectExceptOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|IntersectExceptExpr-Constructor|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|ExprArg2|
                                                    XML-QUERY::|IntersectExceptOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|IntersectExceptExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Expr|
                                                                          XML-QUERY::|ExprArg2|
                                                                          XML-QUERY::|IntersectExceptOp|)))
                                                      'XML-QUERY::|IntersectExceptExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|IntersectExceptExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|IntersectExceptExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|IntersectExceptOp|)
                                     (COND ((XML-QUERY::|IS-IntersectExceptOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|IntersectExceptOp|)
                                            (SETF XML-QUERY::|IntersectExceptOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|IntersectExceptOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|IntersectExceptOp| |item|)
                                                          'XML-QUERY::|IntersectExceptOp|)))
                                            (XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|IntersectExceptOp|)
                                            (XML-QUERY::|IntersectExceptExpr/fail.3| INDEX))))))
                               (XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprArg2|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprArg2| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprArg2| RESULT))
                                              (XML-QUERY::|IntersectExceptExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprArg2|)
                                              (XML-QUERY::|IntersectExceptExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|IntersectExceptExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|IntersectExceptExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|IntersectExceptExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|IntersectExceptExpr.2| XML-QUERY::|IntersectExceptExpr/fail.3|
                                  XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.4|
                                  XML-QUERY::|IntersectExceptExpr/IntersectExceptExpr.2.5|
                                  XML-QUERY::|IntersectExceptExpr/start.1|))
                        (XML-QUERY::|IntersectExceptExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|PathExpr| (INDEX &AUX (XML-QUERY::|DoubleSlash| NIL) (XML-QUERY::|RelativePathExpr| NIL)
                              (XML-QUERY::|SingleSlash| NIL))
  "{31} PathExpr ::= (RelativePathExpr | (SingleSlash
                                       RelativePathExpr?) | (DoubleSlash
                                                             RelativePathExpr?))
(|DoubleSlash| |RelativePathExpr| |SingleSlash|)"
  (DECLARE (SPECIAL XML-QUERY::|PathExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|PathExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|PathExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|PathExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|PathExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|PathExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|PathExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|PathExpr|)
                                 (RETURN-FROM XML-QUERY::|PathExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|PathExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|PathExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PathExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|PathExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|PathExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|PathExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|DoubleSlash|
                                                         XML-QUERY::|DoubleSlash|
                                                         'XML-QUERY::|RelativePathExpr|
                                                         XML-QUERY::|RelativePathExpr|
                                                         'XML-QUERY::|SingleSlash|
                                                         XML-QUERY::|SingleSlash|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|PathExpr-Constructor|
                                                    XML-QUERY::|DoubleSlash|
                                                    XML-QUERY::|RelativePathExpr|
                                                    XML-QUERY::|SingleSlash|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|PathExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|DoubleSlash|
                                                                          XML-QUERY::|RelativePathExpr|
                                                                          XML-QUERY::|SingleSlash|)))
                                                      'XML-QUERY::|PathExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|PathExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|PathExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|PathExpr/PathExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PathExpr/PathExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|SingleSlash|)
                                     (COND ((XML-QUERY::|IS-SingleSlash| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|SingleSlash|)
                                            (SETF XML-QUERY::|SingleSlash|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|SingleSlash-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|SingleSlash| |item|)
                                                          'XML-QUERY::|SingleSlash|)))
                                            (XML-QUERY::|PathExpr/PathExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|SingleSlash|) NIL)))))
                               (XML-QUERY::|PathExpr/PathExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PathExpr/PathExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|RelativePathExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RelativePathExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|RelativePathExpr| RESULT))
                                              (XML-QUERY::|PathExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|RelativePathExpr|)
                                              (XML-QUERY::|PathExpr.2| INDEX)))))))
                               (XML-QUERY::|PathExpr/PathExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PathExpr/PathExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|DoubleSlash|)
                                     (COND ((XML-QUERY::|IS-DoubleSlash| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|DoubleSlash|)
                                            (SETF XML-QUERY::|DoubleSlash|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|DoubleSlash-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|DoubleSlash| |item|)
                                                          'XML-QUERY::|DoubleSlash|)))
                                            (XML-QUERY::|PathExpr/PathExpr.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|DoubleSlash|) NIL)))))
                               (XML-QUERY::|PathExpr/PathExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PathExpr/PathExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|RelativePathExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RelativePathExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|RelativePathExpr| RESULT))
                                              (XML-QUERY::|PathExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|RelativePathExpr|)
                                              (XML-QUERY::|PathExpr.2| INDEX)))))))
                               (XML-QUERY::|PathExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PathExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|RelativePathExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RelativePathExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|RelativePathExpr| RESULT))
                                                    (XML-QUERY::|PathExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|RelativePathExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|PathExpr/PathExpr.2.4|)
                                           (XML-QUERY::|PathExpr/PathExpr.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|PathExpr/PathExpr.2.6|)
                                           (XML-QUERY::|PathExpr/PathExpr.2.6| INDEX))
                                         (XML-QUERY::|PathExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|PathExpr.2| XML-QUERY::|PathExpr/fail.3|
                                  XML-QUERY::|PathExpr/PathExpr.2.4| XML-QUERY::|PathExpr/PathExpr.2.5|
                                  XML-QUERY::|PathExpr/PathExpr.2.6| XML-QUERY::|PathExpr/PathExpr.2.7|
                                  XML-QUERY::|PathExpr/start.1|))
                        (XML-QUERY::|PathExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|RelativePathExpr| (INDEX &AUX (XML-QUERY::|RelatedStep| NIL) (XML-QUERY::|StepExpr| NIL))
  "{32} RelativePathExpr ::= StepExpr RelatedStep*
(|RelatedStep| |StepExpr|)"
  (DECLARE (SPECIAL XML-QUERY::|RelativePathExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|RelativePathExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|RelativePathExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|RelativePathExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|RelativePathExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|RelativePathExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|RelativePathExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|RelativePathExpr|)
                                 (RETURN-FROM XML-QUERY::|RelativePathExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|RelativePathExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|RelativePathExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelativePathExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|RelativePathExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|RelativePathExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|RelativePathExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|RelatedStep|
                                                         XML-QUERY::|RelatedStep|
                                                         'XML-QUERY::|StepExpr|
                                                         XML-QUERY::|StepExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|RelativePathExpr-Constructor|
                                                    XML-QUERY::|RelatedStep|
                                                    XML-QUERY::|StepExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|RelativePathExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|RelatedStep| XML-QUERY::|StepExpr|)))
                                                      'XML-QUERY::|RelativePathExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|RelativePathExpr.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelativePathExpr.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|RelatedStep|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RelatedStep| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|RelatedStep| (CONS RESULT XML-QUERY::|RelatedStep|)))
                                              (XML-QUERY::|RelativePathExpr.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|RelatedStep|)
                                              (XML-QUERY::|RelativePathExpr.2| INDEX)))))))
                               (XML-QUERY::|RelativePathExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|RelativePathExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|RelativePathExpr/RelativePathExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelativePathExpr/RelativePathExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|RelatedStep|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|RelatedStep| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|RelatedStep| (CONS RESULT XML-QUERY::|RelatedStep|)))
                                              (XML-QUERY::|RelativePathExpr.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|RelatedStep|)
                                              (XML-QUERY::|RelativePathExpr.2| INDEX)))))))
                               (XML-QUERY::|RelativePathExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelativePathExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StepExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StepExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StepExpr| RESULT))
                                              (XML-QUERY::|RelativePathExpr/RelativePathExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StepExpr|)
                                              (XML-QUERY::|RelativePathExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|RelativePathExpr.2| XML-QUERY::|RelativePathExpr.5|
                                  XML-QUERY::|RelativePathExpr/fail.3| XML-QUERY::|RelativePathExpr/RelativePathExpr.2.4|
                                  XML-QUERY::|RelativePathExpr/start.1|))
                        (XML-QUERY::|RelativePathExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|RelatedStep| (INDEX &AUX (XML-QUERY::|DoubleSlash| NIL) (XML-QUERY::|SingleSlash| NIL)
                                 (XML-QUERY::|StepExpr| NIL))
  "RelatedStep ::= ((SingleSlash | DoubleSlash)) StepExpr
(|DoubleSlash| |SingleSlash| |StepExpr|)"
  (DECLARE (SPECIAL XML-QUERY::|RelatedStep-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|RelatedStep-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|RelatedStep-INDEX| INDEX)
      (LET ((XML-QUERY::|RelatedStep-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|RelatedStep| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|RelatedStep-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|RelatedStep|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|RelatedStep|)
                                 (RETURN-FROM XML-QUERY::|RelatedStep| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|RelatedStep| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|RelatedStep.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelatedStep.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|RelatedStep|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|RelatedStep|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|RelatedStep|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|DoubleSlash|
                                                         XML-QUERY::|DoubleSlash|
                                                         'XML-QUERY::|SingleSlash|
                                                         XML-QUERY::|SingleSlash|
                                                         'XML-QUERY::|StepExpr|
                                                         XML-QUERY::|StepExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|RelatedStep-Constructor|
                                                    XML-QUERY::|DoubleSlash|
                                                    XML-QUERY::|SingleSlash|
                                                    XML-QUERY::|StepExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|RelatedStep|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|DoubleSlash|
                                                                          XML-QUERY::|SingleSlash|
                                                                          XML-QUERY::|StepExpr|)))
                                                      'XML-QUERY::|RelatedStep|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|RelatedStep/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|RelatedStep/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|RelatedStep/RelatedStep.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelatedStep/RelatedStep.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StepExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StepExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StepExpr| RESULT))
                                              (XML-QUERY::|RelatedStep.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StepExpr|)
                                              (XML-QUERY::|RelatedStep/fail.3| INDEX)))))))
                               (XML-QUERY::|RelatedStep/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|RelatedStep/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|SingleSlash|)
                                           (COND ((XML-QUERY::|IS-SingleSlash| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|SingleSlash|)
                                                  (SETF XML-QUERY::|SingleSlash|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|SingleSlash-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|SingleSlash| |item|)
                                                                'XML-QUERY::|SingleSlash|)))
                                                  (XML-QUERY::|RelatedStep/RelatedStep.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|SingleSlash|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|DoubleSlash|)
                                           (COND ((XML-QUERY::|IS-DoubleSlash| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|DoubleSlash|)
                                                  (SETF XML-QUERY::|DoubleSlash|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|DoubleSlash-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|DoubleSlash| |item|)
                                                                'XML-QUERY::|DoubleSlash|)))
                                                  (XML-QUERY::|RelatedStep/RelatedStep.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|DoubleSlash|) NIL)))
                                         (XML-QUERY::|RelatedStep/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|RelatedStep.2| XML-QUERY::|RelatedStep/fail.3|
                                  XML-QUERY::|RelatedStep/RelatedStep.2.4| XML-QUERY::|RelatedStep/start.1|))
                        (XML-QUERY::|RelatedStep/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|StepExpr| (INDEX &AUX (XML-QUERY::|AxisStepExpr| NIL) (XML-QUERY::|OtherStepExpr| NIL))
  "{33} StepExpr ::= (AxisStepExpr | OtherStepExpr)
(|AxisStepExpr| |OtherStepExpr|)"
  (DECLARE (SPECIAL XML-QUERY::|StepExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|StepExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|StepExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|StepExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|StepExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|StepExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|StepExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|StepExpr|)
                                 (RETURN-FROM XML-QUERY::|StepExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|StepExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|StepExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StepExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|StepExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|StepExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|StepExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AxisStepExpr|
                                                         XML-QUERY::|AxisStepExpr|
                                                         'XML-QUERY::|OtherStepExpr|
                                                         XML-QUERY::|OtherStepExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|StepExpr-Constructor|
                                                    XML-QUERY::|AxisStepExpr|
                                                    XML-QUERY::|OtherStepExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|StepExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|AxisStepExpr| XML-QUERY::|OtherStepExpr|)))
                                                      'XML-QUERY::|StepExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|StepExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|StepExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|StepExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StepExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|AxisStepExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AxisStepExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|AxisStepExpr| RESULT))
                                                    (XML-QUERY::|StepExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|AxisStepExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|OtherStepExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|OtherStepExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|OtherStepExpr| RESULT))
                                                    (XML-QUERY::|StepExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|OtherStepExpr|) NIL))))
                                         (XML-QUERY::|StepExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|StepExpr.2| XML-QUERY::|StepExpr/fail.3|
                                  XML-QUERY::|StepExpr/start.1|))
                        (XML-QUERY::|StepExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AxisStepExpr| (INDEX &AUX (XML-QUERY::|Axis| NIL) (XML-QUERY::|NodeTest| NIL) (XML-QUERY::|StepQualifier| NIL))
  "{34} AxisStepExpr ::= Axis NodeTest StepQualifier*
(|Axis| |NodeTest| |StepQualifier|)"
  (DECLARE (SPECIAL XML-QUERY::|AxisStepExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AxisStepExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AxisStepExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|AxisStepExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|AxisStepExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|AxisStepExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AxisStepExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AxisStepExpr|)
                                 (RETURN-FROM XML-QUERY::|AxisStepExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AxisStepExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AxisStepExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AxisStepExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AxisStepExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AxisStepExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|AxisStepExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Axis|
                                                         XML-QUERY::|Axis|
                                                         'XML-QUERY::|NodeTest|
                                                         XML-QUERY::|NodeTest|
                                                         'XML-QUERY::|StepQualifier|
                                                         XML-QUERY::|StepQualifier|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AxisStepExpr-Constructor|
                                                    XML-QUERY::|Axis|
                                                    XML-QUERY::|NodeTest|
                                                    XML-QUERY::|StepQualifier|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AxisStepExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|Axis|
                                                                          XML-QUERY::|NodeTest|
                                                                          XML-QUERY::|StepQualifier|)))
                                                      'XML-QUERY::|AxisStepExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AxisStepExpr.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AxisStepExpr.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StepQualifier|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StepQualifier| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|StepQualifier| (CONS RESULT XML-QUERY::|StepQualifier|)))
                                              (XML-QUERY::|AxisStepExpr.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StepQualifier|)
                                              (XML-QUERY::|AxisStepExpr.2| INDEX)))))))
                               (XML-QUERY::|AxisStepExpr/AxisStepExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AxisStepExpr/AxisStepExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|NodeTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NodeTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|NodeTest| RESULT))
                                              (XML-QUERY::|AxisStepExpr/AxisStepExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|NodeTest|)
                                              (XML-QUERY::|AxisStepExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|AxisStepExpr/AxisStepExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AxisStepExpr/AxisStepExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StepQualifier|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StepQualifier| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|StepQualifier| (CONS RESULT XML-QUERY::|StepQualifier|)))
                                              (XML-QUERY::|AxisStepExpr.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StepQualifier|)
                                              (XML-QUERY::|AxisStepExpr.2| INDEX)))))))
                               (XML-QUERY::|AxisStepExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AxisStepExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AxisStepExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AxisStepExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Axis|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Axis| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Axis| RESULT))
                                              (XML-QUERY::|AxisStepExpr/AxisStepExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Axis|)
                                              (XML-QUERY::|AxisStepExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AxisStepExpr.2| XML-QUERY::|AxisStepExpr.6|
                                  XML-QUERY::|AxisStepExpr/AxisStepExpr.2.4| XML-QUERY::|AxisStepExpr/AxisStepExpr.2.5|
                                  XML-QUERY::|AxisStepExpr/fail.3| XML-QUERY::|AxisStepExpr/start.1|))
                        (XML-QUERY::|AxisStepExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|OtherStepExpr| (INDEX &AUX (XML-QUERY::|PrimaryExpr| NIL) (XML-QUERY::|StepQualifier| NIL))
  "{35} OtherStepExpr ::= PrimaryExpr StepQualifier*
(|PrimaryExpr| |StepQualifier|)"
  (DECLARE (SPECIAL XML-QUERY::|OtherStepExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|OtherStepExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|OtherStepExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|OtherStepExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|OtherStepExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|OtherStepExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|OtherStepExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|OtherStepExpr|)
                                 (RETURN-FROM XML-QUERY::|OtherStepExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|OtherStepExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|OtherStepExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OtherStepExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|OtherStepExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|OtherStepExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|OtherStepExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|PrimaryExpr|
                                                         XML-QUERY::|PrimaryExpr|
                                                         'XML-QUERY::|StepQualifier|
                                                         XML-QUERY::|StepQualifier|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|OtherStepExpr-Constructor|
                                                    XML-QUERY::|PrimaryExpr|
                                                    XML-QUERY::|StepQualifier|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|OtherStepExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|PrimaryExpr| XML-QUERY::|StepQualifier|)))
                                                      'XML-QUERY::|OtherStepExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|OtherStepExpr.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OtherStepExpr.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StepQualifier|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StepQualifier| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|StepQualifier| (CONS RESULT XML-QUERY::|StepQualifier|)))
                                              (XML-QUERY::|OtherStepExpr.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StepQualifier|)
                                              (XML-QUERY::|OtherStepExpr.2| INDEX)))))))
                               (XML-QUERY::|OtherStepExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|OtherStepExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|OtherStepExpr/OtherStepExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OtherStepExpr/OtherStepExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StepQualifier|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StepQualifier| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|StepQualifier| (CONS RESULT XML-QUERY::|StepQualifier|)))
                                              (XML-QUERY::|OtherStepExpr.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StepQualifier|)
                                              (XML-QUERY::|OtherStepExpr.2| INDEX)))))))
                               (XML-QUERY::|OtherStepExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|OtherStepExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|PrimaryExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PrimaryExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|PrimaryExpr| RESULT))
                                              (XML-QUERY::|OtherStepExpr/OtherStepExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|PrimaryExpr|)
                                              (XML-QUERY::|OtherStepExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|OtherStepExpr.2| XML-QUERY::|OtherStepExpr.5|
                                  XML-QUERY::|OtherStepExpr/fail.3| XML-QUERY::|OtherStepExpr/OtherStepExpr.2.4|
                                  XML-QUERY::|OtherStepExpr/start.1|))
                        (XML-QUERY::|OtherStepExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|StepQualifier| (INDEX &AUX (XML-QUERY::|PredicateExpr| NIL) (XML-QUERY::|TargetExpr| NIL))
  "{36} StepQualifier ::= (PredicateExpr | TargetExpr)
(|PredicateExpr| |TargetExpr|)"
  (DECLARE (SPECIAL XML-QUERY::|StepQualifier-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|StepQualifier-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|StepQualifier-INDEX| INDEX)
      (LET ((XML-QUERY::|StepQualifier-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|StepQualifier| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|StepQualifier-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|StepQualifier|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|StepQualifier|)
                                 (RETURN-FROM XML-QUERY::|StepQualifier| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|StepQualifier| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|StepQualifier.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StepQualifier.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|StepQualifier|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|StepQualifier|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|StepQualifier|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|PredicateExpr|
                                                         XML-QUERY::|PredicateExpr|
                                                         'XML-QUERY::|TargetExpr|
                                                         XML-QUERY::|TargetExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|StepQualifier-Constructor|
                                                    XML-QUERY::|PredicateExpr|
                                                    XML-QUERY::|TargetExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|StepQualifier|
                                                            (DELETE NIL (LIST XML-QUERY::|PredicateExpr| XML-QUERY::|TargetExpr|)))
                                                      'XML-QUERY::|StepQualifier|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|StepQualifier/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|StepQualifier/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|StepQualifier/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StepQualifier/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PredicateExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PredicateExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PredicateExpr| RESULT))
                                                    (XML-QUERY::|StepQualifier.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PredicateExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|TargetExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|TargetExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|TargetExpr| RESULT))
                                                    (XML-QUERY::|StepQualifier.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|TargetExpr|) NIL))))
                                         (XML-QUERY::|StepQualifier/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|StepQualifier.2| XML-QUERY::|StepQualifier/fail.3|
                                  XML-QUERY::|StepQualifier/start.1|))
                        (XML-QUERY::|StepQualifier/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|PredicateExpr| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "PredicateExpr ::= '[' Expr ']'
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|PredicateExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|PredicateExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|PredicateExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|PredicateExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|PredicateExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|PredicateExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|PredicateExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|PredicateExpr|)
                                 (RETURN-FROM XML-QUERY::|PredicateExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|PredicateExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|PredicateExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredicateExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|PredicateExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|PredicateExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|PredicateExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|PredicateExpr-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|PredicateExpr| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|PredicateExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|PredicateExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|PredicateExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|PredicateExpr/PredicateExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredicateExpr/PredicateExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|PredicateExpr/PredicateExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|PredicateExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|PredicateExpr/PredicateExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredicateExpr/PredicateExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:])
                                     (COND ((STRING-EQUAL |item| '|xml|:])
                                            (SETF *ATN-TERM* '|xml|:])
                                            (XML-QUERY::|PredicateExpr.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]) (XML-QUERY::|PredicateExpr/fail.3| INDEX))))))
                               (XML-QUERY::|PredicateExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredicateExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:[)
                                     (COND ((STRING-EQUAL |item| '|xml|:[)
                                            (SETF *ATN-TERM* '|xml|:[)
                                            (XML-QUERY::|PredicateExpr/PredicateExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:[) (XML-QUERY::|PredicateExpr/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|PredicateExpr.2| XML-QUERY::|PredicateExpr/fail.3|
                                  XML-QUERY::|PredicateExpr/PredicateExpr.2.4| XML-QUERY::|PredicateExpr/PredicateExpr.2.5|
                                  XML-QUERY::|PredicateExpr/start.1|))
                        (XML-QUERY::|PredicateExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|TargetExpr| (INDEX &AUX (XML-QUERY::|NameTest| NIL))
  "TargetExpr ::= '=>' NameTest
(|NameTest|)"
  (DECLARE (SPECIAL XML-QUERY::|TargetExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|TargetExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|TargetExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|TargetExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|TargetExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|TargetExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|TargetExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|TargetExpr|)
                                 (RETURN-FROM XML-QUERY::|TargetExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|TargetExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|TargetExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TargetExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|TargetExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|TargetExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|TargetExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NameTest| XML-QUERY::|NameTest|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|TargetExpr-Constructor| XML-QUERY::|NameTest|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|TargetExpr| (DELETE NIL (LIST XML-QUERY::|NameTest|)))
                                                      'XML-QUERY::|TargetExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|TargetExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|TargetExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|TargetExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TargetExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::=>)
                                     (COND ((STRING-EQUAL |item| '|xml|::=>)
                                            (SETF *ATN-TERM* '|xml|::=>)
                                            (XML-QUERY::|TargetExpr/TargetExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::=>) (XML-QUERY::|TargetExpr/fail.3| INDEX))))))
                               (XML-QUERY::|TargetExpr/TargetExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TargetExpr/TargetExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|NameTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NameTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|NameTest| RESULT))
                                              (XML-QUERY::|TargetExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|NameTest|)
                                              (XML-QUERY::|TargetExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|TargetExpr.2| XML-QUERY::|TargetExpr/fail.3|
                                  XML-QUERY::|TargetExpr/start.1| XML-QUERY::|TargetExpr/TargetExpr.2.4|))
                        (XML-QUERY::|TargetExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Axis| (INDEX &AUX (XML-QUERY::|AtOp| NIL) (XML-QUERY::|NCName| NIL))
  "{37} Axis ::= ((NCName '::') | AtOp)
(|AtOp| |NCName|)"
  (DECLARE (SPECIAL XML-QUERY::|Axis-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Axis-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Axis-INDEX| INDEX)
      (LET ((XML-QUERY::|Axis-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|Axis| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|Axis-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Axis|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Axis|)
                                 (RETURN-FROM XML-QUERY::|Axis| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Axis| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Axis.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Axis.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Axis|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Axis|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Axis|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AtOp|
                                                         XML-QUERY::|AtOp|
                                                         'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Axis-Constructor| XML-QUERY::|AtOp| XML-QUERY::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Axis|
                                                            (DELETE NIL (LIST XML-QUERY::|AtOp| XML-QUERY::|NCName|)))
                                                      'XML-QUERY::|Axis|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Axis/Axis.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Axis/Axis.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|NCName|)
                                     (COND ((XML-QUERY::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                            (SETF XML-QUERY::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NCName| |item|)
                                                          'XML-QUERY::|NCName|)))
                                            (XML-QUERY::|Axis/Axis.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) NIL)))))
                               (XML-QUERY::|Axis/Axis.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Axis/Axis.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|::|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|::|)
                                            (SETF *ATN-TERM* '|xml|:|::|)
                                            (XML-QUERY::|Axis.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|::|) NIL)))))
                               (XML-QUERY::|Axis/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-QUERY::|Axis/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Axis/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Axis/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|Axis/Axis.2.4|) (XML-QUERY::|Axis/Axis.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|AtOp|)
                                           (COND ((XML-QUERY::|IS-AtOp| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|AtOp|)
                                                  (SETF XML-QUERY::|AtOp|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|AtOp-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|AtOp| |item|)
                                                                'XML-QUERY::|AtOp|)))
                                                  (XML-QUERY::|Axis.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|AtOp|) NIL)))
                                         (XML-QUERY::|Axis/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Axis.2| XML-QUERY::|Axis/Axis.2.4| XML-QUERY::|Axis/Axis.2.5|
                                  XML-QUERY::|Axis/fail.3| XML-QUERY::|Axis/start.1|))
                        (XML-QUERY::|Axis/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|PrimaryExpr| (INDEX &AUX (XML-QUERY::|CastExpr| NIL) (XML-QUERY::|CommentConstructor| NIL)
                                 (XML-QUERY::|Dot| NIL) (XML-QUERY::|DotDot| NIL) (XML-QUERY::|ElementConstructor| NIL)
                                 (XML-QUERY::|FunctionCall| NIL) (XML-QUERY::|KindTest| NIL) (XML-QUERY::|Literal| NIL)
                                 (XML-QUERY::|NameTest| NIL) (XML-QUERY::|ParenthesizedExpr| NIL) (XML-QUERY::|PIConstructor| NIL)
                                 (XML-QUERY::|Variable| NIL))
  "{38} PrimaryExpr ::= (Dot | DotDot | KindTest | Variable | Literal | FunctionCall | NameTest | ParenthesizedExpr | CastExpr | ElementConstructor | CommentConstructor | PIConstructor)
(|CastExpr| |CommentConstructor| |Dot| |DotDot| |ElementConstructor| |FunctionCall| |KindTest| |Literal| |NameTest| |ParenthesizedExpr| |PIConstructor| |Variable|)"
  (DECLARE (SPECIAL XML-QUERY::|PrimaryExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|PrimaryExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|PrimaryExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|PrimaryExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|PrimaryExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|PrimaryExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|PrimaryExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|PrimaryExpr|)
                                 (RETURN-FROM XML-QUERY::|PrimaryExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|PrimaryExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|PrimaryExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PrimaryExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|PrimaryExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|PrimaryExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|PrimaryExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CastExpr|
                                                         XML-QUERY::|CastExpr|
                                                         'XML-QUERY::|CommentConstructor|
                                                         XML-QUERY::|CommentConstructor|
                                                         'XML-QUERY::|Dot|
                                                         XML-QUERY::|Dot|
                                                         'XML-QUERY::|DotDot|
                                                         XML-QUERY::|DotDot|
                                                         'XML-QUERY::|ElementConstructor|
                                                         XML-QUERY::|ElementConstructor|
                                                         'XML-QUERY::|FunctionCall|
                                                         XML-QUERY::|FunctionCall|
                                                         'XML-QUERY::|KindTest|
                                                         XML-QUERY::|KindTest|
                                                         'XML-QUERY::|Literal|
                                                         XML-QUERY::|Literal|
                                                         'XML-QUERY::|NameTest|
                                                         XML-QUERY::|NameTest|
                                                         'XML-QUERY::|ParenthesizedExpr|
                                                         XML-QUERY::|ParenthesizedExpr|
                                                         'XML-QUERY::|PIConstructor|
                                                         XML-QUERY::|PIConstructor|
                                                         'XML-QUERY::|Variable|
                                                         XML-QUERY::|Variable|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|PrimaryExpr-Constructor|
                                                    XML-QUERY::|CastExpr|
                                                    XML-QUERY::|CommentConstructor|
                                                    XML-QUERY::|Dot|
                                                    XML-QUERY::|DotDot|
                                                    XML-QUERY::|ElementConstructor|
                                                    XML-QUERY::|FunctionCall|
                                                    XML-QUERY::|KindTest|
                                                    XML-QUERY::|Literal|
                                                    XML-QUERY::|NameTest|
                                                    XML-QUERY::|ParenthesizedExpr|
                                                    XML-QUERY::|PIConstructor|
                                                    XML-QUERY::|Variable|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|PrimaryExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|CastExpr|
                                                                          XML-QUERY::|CommentConstructor|
                                                                          XML-QUERY::|Dot|
                                                                          XML-QUERY::|DotDot|
                                                                          XML-QUERY::|ElementConstructor|
                                                                          XML-QUERY::|FunctionCall|
                                                                          XML-QUERY::|KindTest|
                                                                          XML-QUERY::|Literal|
                                                                          XML-QUERY::|NameTest|
                                                                          XML-QUERY::|ParenthesizedExpr|
                                                                          XML-QUERY::|PIConstructor|
                                                                          XML-QUERY::|Variable|)))
                                                      'XML-QUERY::|PrimaryExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|PrimaryExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|PrimaryExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|PrimaryExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PrimaryExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|Dot|)
                                           (COND ((XML-QUERY::|IS-Dot| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|Dot|)
                                                  (SETF XML-QUERY::|Dot|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|Dot-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|Dot| |item|)
                                                                'XML-QUERY::|Dot|)))
                                                  (XML-QUERY::|PrimaryExpr.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|Dot|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|DotDot|)
                                           (COND ((XML-QUERY::|IS-DotDot| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|DotDot|)
                                                  (SETF XML-QUERY::|DotDot|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|DotDot-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|DotDot| |item|)
                                                                'XML-QUERY::|DotDot|)))
                                                  (XML-QUERY::|PrimaryExpr.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|DotDot|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|KindTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|KindTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|KindTest| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|KindTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|Variable|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Variable| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|Variable| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|Variable|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|Literal|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Literal| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|Literal| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|Literal|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|FunctionCall|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|FunctionCall| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|FunctionCall| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|FunctionCall|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|NameTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NameTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|NameTest| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|NameTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|ParenthesizedExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ParenthesizedExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|ParenthesizedExpr| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|ParenthesizedExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CastExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CastExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CastExpr| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CastExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|ElementConstructor|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ElementConstructor| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|ElementConstructor| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|ElementConstructor|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CommentConstructor|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CommentConstructor| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CommentConstructor| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CommentConstructor|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PIConstructor|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PIConstructor| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PIConstructor| RESULT))
                                                    (XML-QUERY::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PIConstructor|) NIL))))
                                         (XML-QUERY::|PrimaryExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|PrimaryExpr.2| XML-QUERY::|PrimaryExpr/fail.3|
                                  XML-QUERY::|PrimaryExpr/start.1|))
                        (XML-QUERY::|PrimaryExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Literal| (INDEX &AUX (XML-QUERY::|NumericLiteral| NIL) (XML-QUERY::|StringLiteral| NIL))
  "{39} Literal ::= (NumericLiteral | StringLiteral)
(|NumericLiteral| |StringLiteral|)"
  (DECLARE (SPECIAL XML-QUERY::|Literal-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Literal-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Literal-INDEX| INDEX)
      (LET ((XML-QUERY::|Literal-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|Literal| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|Literal-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Literal|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Literal|)
                                 (RETURN-FROM XML-QUERY::|Literal| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Literal| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Literal.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Literal.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Literal|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Literal|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Literal|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NumericLiteral|
                                                         XML-QUERY::|NumericLiteral|
                                                         'XML-QUERY::|StringLiteral|
                                                         XML-QUERY::|StringLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Literal-Constructor|
                                                    XML-QUERY::|NumericLiteral|
                                                    XML-QUERY::|StringLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Literal|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|NumericLiteral| XML-QUERY::|StringLiteral|)))
                                                      'XML-QUERY::|Literal|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Literal/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|Literal/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Literal/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Literal/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-QUERY::|NumericLiteral|)
                                           (COND ((XML-QUERY::|IS-NumericLiteral| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|NumericLiteral|)
                                                  (SETF XML-QUERY::|NumericLiteral|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|NumericLiteral-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|NumericLiteral| |item|)
                                                                'XML-QUERY::|NumericLiteral|)))
                                                  (XML-QUERY::|Literal.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-QUERY::|NumericLiteral|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|StringLiteral|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StringLiteral| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|StringLiteral| RESULT))
                                                    (XML-QUERY::|Literal.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteral|) NIL))))
                                         (XML-QUERY::|Literal/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Literal.2| XML-QUERY::|Literal/fail.3|
                                  XML-QUERY::|Literal/start.1|))
                        (XML-QUERY::|Literal/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|NodeTest| (INDEX &AUX (XML-QUERY::|KindTest| NIL) (XML-QUERY::|NameTest| NIL))
  "{40} NodeTest ::= (NameTest | KindTest)
(|KindTest| |NameTest|)"
  (DECLARE (SPECIAL XML-QUERY::|NodeTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|NodeTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|NodeTest-INDEX| INDEX)
      (LET ((XML-QUERY::|NodeTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|NodeTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|NodeTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|NodeTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|NodeTest|)
                                 (RETURN-FROM XML-QUERY::|NodeTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|NodeTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|NodeTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NodeTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|NodeTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|NodeTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|NodeTest|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|KindTest|
                                                         XML-QUERY::|KindTest|
                                                         'XML-QUERY::|NameTest|
                                                         XML-QUERY::|NameTest|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|NodeTest-Constructor| XML-QUERY::|KindTest| XML-QUERY::|NameTest|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|NodeTest|
                                                            (DELETE NIL (LIST XML-QUERY::|KindTest| XML-QUERY::|NameTest|)))
                                                      'XML-QUERY::|NodeTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|NodeTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|NodeTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|NodeTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NodeTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|NameTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NameTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|NameTest| RESULT))
                                                    (XML-QUERY::|NodeTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|NameTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|KindTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|KindTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|KindTest| RESULT))
                                                    (XML-QUERY::|NodeTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|KindTest|) NIL))))
                                         (XML-QUERY::|NodeTest/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|NodeTest.2| XML-QUERY::|NodeTest/fail.3|
                                  XML-QUERY::|NodeTest/start.1|))
                        (XML-QUERY::|NodeTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|NameTest| (INDEX &AUX (XML-QUERY::|NameTestPrefix| NIL) (XML-QUERY::|NCName| NIL) (XML-QUERY::|WildName| NIL))
  "{41} NameTest ::= NameTestPrefix? ((NCName | WildName))
(|NameTestPrefix| |NCName| |WildName|)"
  (DECLARE (SPECIAL XML-QUERY::|NameTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|NameTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|NameTest-INDEX| INDEX)
      (LET ((XML-QUERY::|NameTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|NameTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|NameTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|NameTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|NameTest|)
                                 (RETURN-FROM XML-QUERY::|NameTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|NameTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|NameTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|NameTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|NameTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|NameTest|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NameTestPrefix|
                                                         XML-QUERY::|NameTestPrefix|
                                                         'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|
                                                         'XML-QUERY::|WildName|
                                                         XML-QUERY::|WildName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|NameTest-Constructor|
                                                    XML-QUERY::|NameTestPrefix|
                                                    XML-QUERY::|NCName|
                                                    XML-QUERY::|WildName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|NameTest|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|NameTestPrefix|
                                                                          XML-QUERY::|NCName|
                                                                          XML-QUERY::|WildName|)))
                                                      'XML-QUERY::|NameTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|NameTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|NameTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|NameTest/NameTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameTest/NameTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-QUERY::|NCName|)
                                           (COND ((XML-QUERY::|IS-NCName| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                                  (SETF XML-QUERY::|NCName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|NCName| |item|)
                                                                'XML-QUERY::|NCName|)))
                                                  (XML-QUERY::|NameTest.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|WildName|)
                                           (COND ((XML-QUERY::|IS-WildName| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|WildName|)
                                                  (SETF XML-QUERY::|WildName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|WildName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|WildName| |item|)
                                                                'XML-QUERY::|WildName|)))
                                                  (XML-QUERY::|NameTest.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|WildName|) NIL)))
                                         (XML-QUERY::|NameTest/fail.3| INDEX)))))
                               (XML-QUERY::|NameTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|NameTestPrefix|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NameTestPrefix| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|NameTestPrefix| RESULT))
                                              (XML-QUERY::|NameTest/NameTest.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|NameTestPrefix|)
                                              (XML-QUERY::|NameTest/NameTest.2.4| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|NameTest.2| XML-QUERY::|NameTest/fail.3|
                                  XML-QUERY::|NameTest/NameTest.2.4| XML-QUERY::|NameTest/start.1|))
                        (XML-QUERY::|NameTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|NameTestPrefix| (INDEX &AUX (XML-QUERY::|NCName| NIL) (XML-QUERY::|WildName| NIL))
  "NameTestPrefix ::= ((NCName | WildName)) ':'
(|NCName| |WildName|)"
  (DECLARE (SPECIAL XML-QUERY::|NameTestPrefix-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|NameTestPrefix-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|NameTestPrefix-INDEX| INDEX)
      (LET ((XML-QUERY::|NameTestPrefix-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|NameTestPrefix| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|NameTestPrefix-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|NameTestPrefix|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|NameTestPrefix|)
                                 (RETURN-FROM XML-QUERY::|NameTestPrefix| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|NameTestPrefix| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|NameTestPrefix.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameTestPrefix.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|NameTestPrefix|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|NameTestPrefix|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|NameTestPrefix|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|
                                                         'XML-QUERY::|WildName|
                                                         XML-QUERY::|WildName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|NameTestPrefix-Constructor|
                                                    XML-QUERY::|NCName|
                                                    XML-QUERY::|WildName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|NameTestPrefix|
                                                            (DELETE NIL (LIST XML-QUERY::|NCName| XML-QUERY::|WildName|)))
                                                      'XML-QUERY::|NameTestPrefix|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|NameTestPrefix/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|NameTestPrefix/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|NameTestPrefix/NameTestPrefix.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameTestPrefix/NameTestPrefix.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\:)
                                     (COND ((STRING-EQUAL |item| '|xml|:\:)
                                            (SETF *ATN-TERM* '|xml|:\:)
                                            (XML-QUERY::|NameTestPrefix.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\:) (XML-QUERY::|NameTestPrefix/fail.3| INDEX))))))
                               (XML-QUERY::|NameTestPrefix/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameTestPrefix/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-QUERY::|NCName|)
                                           (COND ((XML-QUERY::|IS-NCName| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                                  (SETF XML-QUERY::|NCName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|NCName| |item|)
                                                                'XML-QUERY::|NCName|)))
                                                  (XML-QUERY::|NameTestPrefix/NameTestPrefix.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-QUERY::|WildName|)
                                           (COND ((XML-QUERY::|IS-WildName| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|WildName|)
                                                  (SETF XML-QUERY::|WildName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|WildName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|WildName| |item|)
                                                                'XML-QUERY::|WildName|)))
                                                  (XML-QUERY::|NameTestPrefix/NameTestPrefix.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-QUERY::|WildName|) NIL)))
                                         (XML-QUERY::|NameTestPrefix/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|NameTestPrefix.2| XML-QUERY::|NameTestPrefix/fail.3|
                                  XML-QUERY::|NameTestPrefix/NameTestPrefix.2.4| XML-QUERY::|NameTestPrefix/start.1|))
                        (XML-QUERY::|NameTestPrefix/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|KindTest| (INDEX &AUX (XML-QUERY::|AnyKindTest| NIL) (XML-QUERY::|CommentTest| NIL) (XML-QUERY::|PITest| NIL)
                              (XML-QUERY::|TextTest| NIL))
  "{42} KindTest ::= (PITest | CommentTest | TextTest | AnyKindTest)
(|AnyKindTest| |CommentTest| |PITest| |TextTest|)"
  (DECLARE (SPECIAL XML-QUERY::|KindTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|KindTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|KindTest-INDEX| INDEX)
      (LET ((XML-QUERY::|KindTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|KindTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|KindTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|KindTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|KindTest|)
                                 (RETURN-FROM XML-QUERY::|KindTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|KindTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|KindTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|KindTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|KindTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|KindTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|KindTest|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AnyKindTest|
                                                         XML-QUERY::|AnyKindTest|
                                                         'XML-QUERY::|CommentTest|
                                                         XML-QUERY::|CommentTest|
                                                         'XML-QUERY::|PITest|
                                                         XML-QUERY::|PITest|
                                                         'XML-QUERY::|TextTest|
                                                         XML-QUERY::|TextTest|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|KindTest-Constructor|
                                                    XML-QUERY::|AnyKindTest|
                                                    XML-QUERY::|CommentTest|
                                                    XML-QUERY::|PITest|
                                                    XML-QUERY::|TextTest|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|KindTest|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|AnyKindTest|
                                                                          XML-QUERY::|CommentTest|
                                                                          XML-QUERY::|PITest|
                                                                          XML-QUERY::|TextTest|)))
                                                      'XML-QUERY::|KindTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|KindTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|KindTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|KindTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|KindTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PITest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PITest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PITest| RESULT))
                                                    (XML-QUERY::|KindTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PITest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CommentTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CommentTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CommentTest| RESULT))
                                                    (XML-QUERY::|KindTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CommentTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|TextTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|TextTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|TextTest| RESULT))
                                                    (XML-QUERY::|KindTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|TextTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|AnyKindTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AnyKindTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|AnyKindTest| RESULT))
                                                    (XML-QUERY::|KindTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|AnyKindTest|) NIL))))
                                         (XML-QUERY::|KindTest/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|KindTest.2| XML-QUERY::|KindTest/fail.3|
                                  XML-QUERY::|KindTest/start.1|))
                        (XML-QUERY::|KindTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|PITest| (INDEX &AUX (XML-QUERY::|StringLiteral| NIL))
  "{43} PITest ::= 'processing-instruction' '(' StringLiteral? ')'
(|StringLiteral|)"
  (DECLARE (SPECIAL XML-QUERY::|PITest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|PITest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|PITest-INDEX| INDEX)
      (LET ((XML-QUERY::|PITest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|PITest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|PITest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|PITest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|PITest|)
                                 (RETURN-FROM XML-QUERY::|PITest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|PITest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|PITest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PITest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|PITest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|PITest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|PITest|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|StringLiteral| XML-QUERY::|StringLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|PITest-Constructor| XML-QUERY::|StringLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|PITest| (DELETE NIL (LIST XML-QUERY::|StringLiteral|)))
                                                      'XML-QUERY::|PITest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|PITest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|PITest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|PITest/PITest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PITest/PITest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|PITest/PITest.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|PITest/fail.3| INDEX))))))
                               (XML-QUERY::|PITest/PITest.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PITest/PITest.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StringLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StringLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StringLiteral| RESULT))
                                              (XML-QUERY::|PITest/PITest.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteral|)
                                              (XML-QUERY::|PITest/PITest.2.6| INDEX)))))))
                               (XML-QUERY::|PITest/PITest.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PITest/PITest.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|PITest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|PITest/fail.3| INDEX))))))
                               (XML-QUERY::|PITest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PITest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|processing-instruction|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|processing-instruction|)
                                            (SETF *ATN-TERM* '|xml|:|processing-instruction|)
                                            (XML-QUERY::|PITest/PITest.2.4| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* '|xml|:|processing-instruction|)
                                            (XML-QUERY::|PITest/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|PITest.2| XML-QUERY::|PITest/fail.3|
                                  XML-QUERY::|PITest/PITest.2.4| XML-QUERY::|PITest/PITest.2.5| XML-QUERY::|PITest/PITest.2.6|
                                  XML-QUERY::|PITest/start.1|))
                        (XML-QUERY::|PITest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|CommentTest| (INDEX &AUX)
  "{44} CommentTest ::= 'comment' '(' ')'
NIL"
  (DECLARE (SPECIAL XML-QUERY::|CommentTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|CommentTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|CommentTest-INDEX| INDEX)
      (LET ((XML-QUERY::|CommentTest-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|CommentTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|CommentTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|CommentTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|CommentTest|)
                                 (RETURN-FROM XML-QUERY::|CommentTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|CommentTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|CommentTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|CommentTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|CommentTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" 'XML-QUERY::|CommentTest| INDEX (LIST))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|CommentTest-Constructor|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|CommentTest| (DELETE NIL (LIST)))
                                                      'XML-QUERY::|CommentTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|CommentTest/CommentTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentTest/CommentTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|CommentTest/CommentTest.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|CommentTest/fail.3| INDEX))))))
                               (XML-QUERY::|CommentTest/CommentTest.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentTest/CommentTest.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|CommentTest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|CommentTest/fail.3| INDEX))))))
                               (XML-QUERY::|CommentTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|CommentTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|CommentTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|comment|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|comment|)
                                            (SETF *ATN-TERM* '|xml|:|comment|)
                                            (XML-QUERY::|CommentTest/CommentTest.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|comment|) (XML-QUERY::|CommentTest/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|CommentTest.2| XML-QUERY::|CommentTest/CommentTest.2.4|
                                  XML-QUERY::|CommentTest/CommentTest.2.5| XML-QUERY::|CommentTest/fail.3|
                                  XML-QUERY::|CommentTest/start.1|))
                        (XML-QUERY::|CommentTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|TextTest| (INDEX &AUX)
  "{45} TextTest ::= 'text' '(' ')'
NIL"
  (DECLARE (SPECIAL XML-QUERY::|TextTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|TextTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|TextTest-INDEX| INDEX)
      (LET ((XML-QUERY::|TextTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|TextTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|TextTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|TextTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|TextTest|)
                                 (RETURN-FROM XML-QUERY::|TextTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|TextTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|TextTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TextTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|TextTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|TextTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" 'XML-QUERY::|TextTest| INDEX (LIST))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|TextTest-Constructor|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|TextTest| (DELETE NIL (LIST)))
                                                      'XML-QUERY::|TextTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|TextTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|TextTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|TextTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TextTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|text|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|text|)
                                            (SETF *ATN-TERM* '|xml|:|text|)
                                            (XML-QUERY::|TextTest/TextTest.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|text|) (XML-QUERY::|TextTest/fail.3| INDEX))))))
                               (XML-QUERY::|TextTest/TextTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TextTest/TextTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|TextTest/TextTest.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|TextTest/fail.3| INDEX))))))
                               (XML-QUERY::|TextTest/TextTest.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|TextTest/TextTest.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|TextTest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|TextTest/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|TextTest.2| XML-QUERY::|TextTest/fail.3|
                                  XML-QUERY::|TextTest/start.1| XML-QUERY::|TextTest/TextTest.2.4|
                                  XML-QUERY::|TextTest/TextTest.2.5|))
                        (XML-QUERY::|TextTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AnyKindTest| (INDEX &AUX)
  "{46} AnyKindTest ::= 'node' '(' ')'
NIL"
  (DECLARE (SPECIAL XML-QUERY::|AnyKindTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AnyKindTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AnyKindTest-INDEX| INDEX)
      (LET ((XML-QUERY::|AnyKindTest-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|AnyKindTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|AnyKindTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AnyKindTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AnyKindTest|)
                                 (RETURN-FROM XML-QUERY::|AnyKindTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AnyKindTest| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AnyKindTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AnyKindTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AnyKindTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AnyKindTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" 'XML-QUERY::|AnyKindTest| INDEX (LIST))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AnyKindTest-Constructor|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AnyKindTest| (DELETE NIL (LIST)))
                                                      'XML-QUERY::|AnyKindTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AnyKindTest/AnyKindTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AnyKindTest/AnyKindTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|AnyKindTest/AnyKindTest.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|AnyKindTest/fail.3| INDEX))))))
                               (XML-QUERY::|AnyKindTest/AnyKindTest.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AnyKindTest/AnyKindTest.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|AnyKindTest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|AnyKindTest/fail.3| INDEX))))))
                               (XML-QUERY::|AnyKindTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AnyKindTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AnyKindTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AnyKindTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|node|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|node|)
                                            (SETF *ATN-TERM* '|xml|:|node|)
                                            (XML-QUERY::|AnyKindTest/AnyKindTest.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|node|) (XML-QUERY::|AnyKindTest/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AnyKindTest.2| XML-QUERY::|AnyKindTest/AnyKindTest.2.4|
                                  XML-QUERY::|AnyKindTest/AnyKindTest.2.5| XML-QUERY::|AnyKindTest/fail.3|
                                  XML-QUERY::|AnyKindTest/start.1|))
                        (XML-QUERY::|AnyKindTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ParenthesizedExpr| (INDEX &AUX (XML-QUERY::|ExprSequence| NIL))
  "{47} ParenthesizedExpr ::= '(' ExprSequence? ')'
(|ExprSequence|)"
  (DECLARE (SPECIAL XML-QUERY::|ParenthesizedExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ParenthesizedExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ParenthesizedExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|ParenthesizedExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ParenthesizedExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ParenthesizedExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ParenthesizedExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ParenthesizedExpr|)
                                 (RETURN-FROM XML-QUERY::|ParenthesizedExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ParenthesizedExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ParenthesizedExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParenthesizedExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ParenthesizedExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ParenthesizedExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ParenthesizedExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|ExprSequence| XML-QUERY::|ExprSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ParenthesizedExpr-Constructor| XML-QUERY::|ExprSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ParenthesizedExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|ExprSequence|)))
                                                      'XML-QUERY::|ParenthesizedExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ParenthesizedExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ParenthesizedExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprSequence| RESULT))
                                              (XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprSequence|)
                                              (XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.5| INDEX)))))))
                               (XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|ParenthesizedExpr.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|ParenthesizedExpr/fail.3| INDEX))))))
                               (XML-QUERY::|ParenthesizedExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ParenthesizedExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|ParenthesizedExpr/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ParenthesizedExpr.2| XML-QUERY::|ParenthesizedExpr/fail.3|
                                  XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.4|
                                  XML-QUERY::|ParenthesizedExpr/ParenthesizedExpr.2.5| XML-QUERY::|ParenthesizedExpr/start.1|))
                        (XML-QUERY::|ParenthesizedExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ExprSequence| (INDEX &AUX (XML-QUERY::|Expr| NIL))
  "{48} ExprSequence ::= Expr (',' Expr)*
(|Expr|)"
  (DECLARE (SPECIAL XML-QUERY::|ExprSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ExprSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ExprSequence-INDEX| INDEX)
      (LET ((XML-QUERY::|ExprSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ExprSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ExprSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ExprSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ExprSequence|)
                                 (RETURN-FROM XML-QUERY::|ExprSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ExprSequence| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ExprSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ExprSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ExprSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ExprSequence|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr| XML-QUERY::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ExprSequence-Constructor| XML-QUERY::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ExprSequence| (DELETE NIL (LIST XML-QUERY::|Expr|)))
                                                      'XML-QUERY::|ExprSequence|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ExprSequence.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprSequence.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ExprSequence/ExprSequence.5.6|)
                                     (XML-QUERY::|ExprSequence/ExprSequence.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|ExprSequence.2|) (XML-QUERY::|ExprSequence.2| INDEX))))
                               (XML-QUERY::|ExprSequence/ExprSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprSequence/ExprSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ExprSequence/ExprSequence.5.6|)
                                     (XML-QUERY::|ExprSequence/ExprSequence.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|ExprSequence.2|) (XML-QUERY::|ExprSequence.2| INDEX))))
                               (XML-QUERY::|ExprSequence/ExprSequence.5.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprSequence/ExprSequence.5.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((STRING-EQUAL |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-QUERY::|ExprSequence/ExprSequence.5.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-QUERY::|ExprSequence/ExprSequence.5.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprSequence/ExprSequence.5.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| (CONS RESULT XML-QUERY::|Expr|)))
                                              (XML-QUERY::|ExprSequence.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) NIL))))))
                               (XML-QUERY::|ExprSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ExprSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ExprSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ExprSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| (CONS RESULT XML-QUERY::|Expr|)))
                                              (XML-QUERY::|ExprSequence/ExprSequence.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Expr|)
                                              (XML-QUERY::|ExprSequence/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ExprSequence.2| XML-QUERY::|ExprSequence.5|
                                  XML-QUERY::|ExprSequence/ExprSequence.2.4| XML-QUERY::|ExprSequence/ExprSequence.5.6|
                                  XML-QUERY::|ExprSequence/ExprSequence.5.7| XML-QUERY::|ExprSequence/fail.3|
                                  XML-QUERY::|ExprSequence/start.1|))
                        (XML-QUERY::|ExprSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|FunctionCall| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|QName| NIL))
  "{49} FunctionCall ::= QName '(' (Expr (',' Expr)*)? ')'
(|Expr| |QName|)"
  (DECLARE (SPECIAL XML-QUERY::|FunctionCall-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|FunctionCall-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|FunctionCall-INDEX| INDEX)
      (LET ((XML-QUERY::|FunctionCall-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|FunctionCall| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|FunctionCall-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|FunctionCall|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|FunctionCall|)
                                 (RETURN-FROM XML-QUERY::|FunctionCall| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|FunctionCall| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|FunctionCall.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|FunctionCall|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|FunctionCall|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|FunctionCall|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|QName|
                                                         XML-QUERY::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|FunctionCall-Constructor| XML-QUERY::|Expr| XML-QUERY::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|FunctionCall|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|QName|)))
                                                      'XML-QUERY::|FunctionCall|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|FunctionCall.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall.9|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionCall/FunctionCall.9.10|)
                                     (XML-QUERY::|FunctionCall/FunctionCall.9.10| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionCall/FunctionCall.2.6|)
                                     (XML-QUERY::|FunctionCall/FunctionCall.2.6| INDEX))))
                               (XML-QUERY::|FunctionCall/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|FunctionCall/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|FunctionCall/FunctionCall.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|FunctionCall/FunctionCall.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|FunctionCall/fail.3| INDEX))))))
                               (XML-QUERY::|FunctionCall/FunctionCall.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.7|)
                                     (XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionCall/FunctionCall.2.6|)
                                     (XML-QUERY::|FunctionCall/FunctionCall.2.6| INDEX))))
                               (XML-QUERY::|FunctionCall/FunctionCall.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|FunctionCall.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|FunctionCall/fail.3| INDEX))))))
                               (XML-QUERY::|FunctionCall/FunctionCall.9.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall.9.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((STRING-EQUAL |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-QUERY::|FunctionCall/FunctionCall.9.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-QUERY::|FunctionCall/FunctionCall.9.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall.9.11|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| (CONS RESULT XML-QUERY::|Expr|)))
                                              (XML-QUERY::|FunctionCall.9| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) NIL))))))
                               (XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| (CONS RESULT XML-QUERY::|Expr|)))
                                              (XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.8| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) NIL))))))
                               (XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.8|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionCall/FunctionCall.9.10|)
                                     (XML-QUERY::|FunctionCall/FunctionCall.9.10| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|FunctionCall/FunctionCall.2.6|)
                                     (XML-QUERY::|FunctionCall/FunctionCall.2.6| INDEX))))
                               (XML-QUERY::|FunctionCall/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|FunctionCall/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QName| RESULT))
                                              (XML-QUERY::|FunctionCall/FunctionCall.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|QName|)
                                              (XML-QUERY::|FunctionCall/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|FunctionCall.2| XML-QUERY::|FunctionCall.9|
                                  XML-QUERY::|FunctionCall/fail.3| XML-QUERY::|FunctionCall/FunctionCall.2.4|
                                  XML-QUERY::|FunctionCall/FunctionCall.2.5| XML-QUERY::|FunctionCall/FunctionCall.2.6|
                                  XML-QUERY::|FunctionCall/FunctionCall.9.10| XML-QUERY::|FunctionCall/FunctionCall.9.11|
                                  XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.7|
                                  XML-QUERY::|FunctionCall/FunctionCall/FunctionCall.2.6.8| XML-QUERY::|FunctionCall/start.1|))
                        (XML-QUERY::|FunctionCall/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|CastExpr| (INDEX &AUX (XML-QUERY::|CastOp| NIL) (XML-QUERY::|Datatype| NIL) (XML-QUERY::|Expr| NIL)
                              (XML-QUERY::|TreatOp| NIL))
  "{50} CastExpr ::= (((CastOp 'as') | (TreatOp 'as'))) Datatype '(' Expr ')'
(|CastOp| |Datatype| |Expr| |TreatOp|)"
  (DECLARE (SPECIAL XML-QUERY::|CastExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|CastExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|CastExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|CastExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|CastExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|CastExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|CastExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|CastExpr|)
                                 (RETURN-FROM XML-QUERY::|CastExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|CastExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|CastExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|CastExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|CastExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|CastExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CastOp|
                                                         XML-QUERY::|CastOp|
                                                         'XML-QUERY::|Datatype|
                                                         XML-QUERY::|Datatype|
                                                         'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|TreatOp|
                                                         XML-QUERY::|TreatOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|CastExpr-Constructor|
                                                    XML-QUERY::|CastOp|
                                                    XML-QUERY::|Datatype|
                                                    XML-QUERY::|Expr|
                                                    XML-QUERY::|TreatOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|CastExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|CastOp|
                                                                          XML-QUERY::|Datatype|
                                                                          XML-QUERY::|Expr|
                                                                          XML-QUERY::|TreatOp|)))
                                                      'XML-QUERY::|CastExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|CastExpr/CastExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Datatype|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Datatype| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Datatype| RESULT))
                                              (XML-QUERY::|CastExpr/CastExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Datatype|)
                                              (XML-QUERY::|CastExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|CastExpr/CastExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((STRING-EQUAL |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-QUERY::|CastExpr/CastExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-QUERY::|CastExpr/fail.3| INDEX))))))
                               (XML-QUERY::|CastExpr/CastExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|CastExpr/CastExpr.2.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) (XML-QUERY::|CastExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|CastExpr/CastExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((STRING-EQUAL |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-QUERY::|CastExpr.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-QUERY::|CastExpr/fail.3| INDEX))))))
                               (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.10|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|TreatOp|)
                                     (COND ((XML-QUERY::|IS-TreatOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|TreatOp|)
                                            (SETF XML-QUERY::|TreatOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|TreatOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|TreatOp| |item|)
                                                          'XML-QUERY::|TreatOp|)))
                                            (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|TreatOp|) NIL)))))
                               (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.11|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|as|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|as|)
                                            (SETF *ATN-TERM* '|xml|::|as|)
                                            (XML-QUERY::|CastExpr/CastExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|as|) NIL)))))
                               (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.8|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|CastOp|)
                                     (COND ((XML-QUERY::|IS-CastOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|CastOp|)
                                            (SETF XML-QUERY::|CastOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|CastOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|CastOp| |item|)
                                                          'XML-QUERY::|CastOp|)))
                                            (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|CastOp|) NIL)))))
                               (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|::|as|)
                                     (COND ((STRING-EQUAL |item| '|xml|::|as|)
                                            (SETF *ATN-TERM* '|xml|::|as|)
                                            (XML-QUERY::|CastExpr/CastExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|::|as|) NIL)))))
                               (XML-QUERY::|CastExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|CastExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|CastExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CastExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.8|)
                                           (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.8| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.10|)
                                           (XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.10| INDEX))
                                         (XML-QUERY::|CastExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|CastExpr.2| XML-QUERY::|CastExpr/CastExpr.2.4|
                                  XML-QUERY::|CastExpr/CastExpr.2.5| XML-QUERY::|CastExpr/CastExpr.2.6|
                                  XML-QUERY::|CastExpr/CastExpr.2.7| XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.10|
                                  XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.11| XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.8|
                                  XML-QUERY::|CastExpr/CastExpr/CastExpr.2.4.9| XML-QUERY::|CastExpr/fail.3|
                                  XML-QUERY::|CastExpr/start.1|))
                        (XML-QUERY::|CastExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Datatype| (INDEX &AUX (XML-QUERY::|QName| NIL))
  "{51} Datatype ::= QName
(|QName|)"
  (DECLARE (SPECIAL XML-QUERY::|Datatype-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Datatype-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Datatype-INDEX| INDEX)
      (LET ((XML-QUERY::|Datatype-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|Datatype| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|Datatype-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Datatype|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Datatype|)
                                 (RETURN-FROM XML-QUERY::|Datatype| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Datatype| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Datatype.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Datatype.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Datatype|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Datatype|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Datatype|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|QName| XML-QUERY::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Datatype-Constructor| XML-QUERY::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Datatype| (DELETE NIL (LIST XML-QUERY::|QName|)))
                                                      'XML-QUERY::|Datatype|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Datatype/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|Datatype/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Datatype/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Datatype/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QName| RESULT))
                                              (XML-QUERY::|Datatype.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|QName|) (XML-QUERY::|Datatype/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Datatype.2| XML-QUERY::|Datatype/fail.3|
                                  XML-QUERY::|Datatype/start.1|))
                        (XML-QUERY::|Datatype/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ElementConstructor| (INDEX &AUX (XML-QUERY::|ElementContent| NIL) (XML-QUERY::|EndTag| NIL)
                                        (XML-QUERY::|StartTag| NIL))
  "{52} ElementConstructor ::= ('<'
                             StartTag) (('/>' | ('>' ElementContent* EndTag)))
(|ElementContent| |EndTag| |StartTag|)"
  (DECLARE (SPECIAL XML-QUERY::|ElementConstructor-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ElementConstructor-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ElementConstructor-INDEX| INDEX)
      (LET ((XML-QUERY::|ElementConstructor-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ElementConstructor| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|ElementConstructor-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ElementConstructor|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ElementConstructor|)
                                 (RETURN-FROM XML-QUERY::|ElementConstructor| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ElementConstructor| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ElementConstructor.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor.10|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ElementContent|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ElementContent| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|ElementContent| (CONS RESULT XML-QUERY::|ElementContent|)))
                                              (XML-QUERY::|ElementConstructor.10| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ElementContent|)
                                              (XML-QUERY::|ElementConstructor/ElementConstructor.2.9| INDEX)))))))
                               (XML-QUERY::|ElementConstructor.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ElementConstructor|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ElementConstructor|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ElementConstructor|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|ElementContent|
                                                         XML-QUERY::|ElementContent|
                                                         'XML-QUERY::|EndTag|
                                                         XML-QUERY::|EndTag|
                                                         'XML-QUERY::|StartTag|
                                                         XML-QUERY::|StartTag|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ElementConstructor-Constructor|
                                                    XML-QUERY::|ElementContent|
                                                    XML-QUERY::|EndTag|
                                                    XML-QUERY::|StartTag|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ElementConstructor|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|ElementContent|
                                                                          XML-QUERY::|EndTag|
                                                                          XML-QUERY::|StartTag|)))
                                                      'XML-QUERY::|ElementConstructor|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ElementConstructor/ElementConstructor.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/ElementConstructor.2.4|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (WORD |xml|:/>)
                                           (COND ((STRING-EQUAL |item| '|xml|:/>)
                                                  (SETF *ATN-TERM* '|xml|:/>)
                                                  (XML-QUERY::|ElementConstructor.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* '|xml|:/>) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|ElementConstructor/ElementConstructor.2.7|)
                                           (XML-QUERY::|ElementConstructor/ElementConstructor.2.7| INDEX))
                                         (XML-QUERY::|ElementConstructor/fail.3| INDEX)))))
                               (XML-QUERY::|ElementConstructor/ElementConstructor.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/ElementConstructor.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((STRING-EQUAL |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-QUERY::|ElementConstructor/ElementConstructor.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) NIL)))))
                               (XML-QUERY::|ElementConstructor/ElementConstructor.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/ElementConstructor.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ElementContent|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ElementContent| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|ElementContent| (CONS RESULT XML-QUERY::|ElementContent|)))
                                              (XML-QUERY::|ElementConstructor.10| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ElementContent|)
                                              (XML-QUERY::|ElementConstructor/ElementConstructor.2.9| INDEX)))))))
                               (XML-QUERY::|ElementConstructor/ElementConstructor.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/ElementConstructor.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|EndTag|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EndTag| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|EndTag| RESULT))
                                              (XML-QUERY::|ElementConstructor.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|EndTag|) NIL))))))
                               (XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<)
                                     (COND ((STRING-EQUAL |item| '|xml|:<)
                                            (SETF *ATN-TERM* '|xml|:<)
                                            (XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.6|
                                             (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<) NIL)))))
                               (XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|StartTag|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|StartTag| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|StartTag| RESULT))
                                              (XML-QUERY::|ElementConstructor/ElementConstructor.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|StartTag|) NIL))))))
                               (XML-QUERY::|ElementConstructor/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ElementConstructor/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ElementConstructor/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementConstructor/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.5|)
                                     (XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.5| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|ElementConstructor/fail.3|)
                                     (XML-QUERY::|ElementConstructor/fail.3| INDEX)))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ElementConstructor.10| XML-QUERY::|ElementConstructor.2|
                                  XML-QUERY::|ElementConstructor/ElementConstructor.2.4|
                                  XML-QUERY::|ElementConstructor/ElementConstructor.2.7|
                                  XML-QUERY::|ElementConstructor/ElementConstructor.2.8|
                                  XML-QUERY::|ElementConstructor/ElementConstructor.2.9|
                                  XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.5|
                                  XML-QUERY::|ElementConstructor/ElementConstructor/ElementConstructor.2.4.6|
                                  XML-QUERY::|ElementConstructor/fail.3| XML-QUERY::|ElementConstructor/start.1|))
                        (XML-QUERY::|ElementConstructor/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|StartTag| (INDEX &AUX (XML-QUERY::|AttributeList| NIL) (XML-QUERY::|NameSpec| NIL))
  "StartTag ::= NameSpec AttributeList? S*
(|AttributeList| |NameSpec|)"
  (DECLARE (SPECIAL XML-QUERY::|StartTag-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|StartTag-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|StartTag-INDEX| INDEX)
      (LET ((XML-QUERY::|StartTag-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|StartTag| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|StartTag-Parsetable|))
        (DECLARE (SPECIAL XML-QUERY::|StartTag-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|StartTag|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|StartTag|)
                                 (RETURN-FROM XML-QUERY::|StartTag| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|StartTag| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|StartTag.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StartTag.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|StartTag|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|StartTag|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|StartTag|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AttributeList|
                                                         XML-QUERY::|AttributeList|
                                                         'XML-QUERY::|NameSpec|
                                                         XML-QUERY::|NameSpec|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|StartTag-Constructor|
                                                    XML-QUERY::|AttributeList|
                                                    XML-QUERY::|NameSpec|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|StartTag|
                                                            (DELETE NIL (LIST XML-QUERY::|AttributeList| XML-QUERY::|NameSpec|)))
                                                      'XML-QUERY::|StartTag|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|StartTag.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StartTag.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|StartTag.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|StartTag.2| INDEX))))))
                               (XML-QUERY::|StartTag/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|StartTag/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|StartTag/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StartTag/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|NameSpec|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NameSpec| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|NameSpec| RESULT))
                                              (XML-QUERY::|StartTag/StartTag.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|NameSpec|)
                                              (XML-QUERY::|StartTag/fail.3| INDEX)))))))
                               (XML-QUERY::|StartTag/StartTag.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StartTag/StartTag.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|AttributeList|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AttributeList| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|AttributeList| RESULT))
                                              (XML-QUERY::|StartTag/StartTag.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|AttributeList|)
                                              (XML-QUERY::|StartTag/StartTag.2.5| INDEX)))))))
                               (XML-QUERY::|StartTag/StartTag.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StartTag/StartTag.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|StartTag.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|StartTag.2| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|StartTag.2| XML-QUERY::|StartTag.6| XML-QUERY::|StartTag/fail.3|
                                  XML-QUERY::|StartTag/start.1| XML-QUERY::|StartTag/StartTag.2.4|
                                  XML-QUERY::|StartTag/StartTag.2.5|))
                        (XML-QUERY::|StartTag/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|EndTag| (INDEX &AUX (XML-QUERY::|QName| NIL))
  "EndTag ::= '</' (QName S?)? '>'
(|QName|)"
  (DECLARE (SPECIAL XML-QUERY::|EndTag-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|EndTag-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|EndTag-INDEX| INDEX)
      (LET ((XML-QUERY::|EndTag-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|EndTag| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|EndTag-Parsetable|))
        (DECLARE (SPECIAL XML-QUERY::|EndTag-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|EndTag|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|EndTag|)
                                 (RETURN-FROM XML-QUERY::|EndTag| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|EndTag| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|EndTag.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EndTag.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|EndTag|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|EndTag|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|EndTag|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|QName| XML-QUERY::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|EndTag-Constructor| XML-QUERY::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|EndTag| (DELETE NIL (LIST XML-QUERY::|QName|)))
                                                      'XML-QUERY::|EndTag|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|EndTag/EndTag.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EndTag/EndTag.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-QUERY::|EndTag/EndTag/EndTag.2.5.6|)
                                     (XML-QUERY::|EndTag/EndTag/EndTag.2.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-QUERY::|EndTag/EndTag.2.5|) (XML-QUERY::|EndTag/EndTag.2.5| INDEX))))
                               (XML-QUERY::|EndTag/EndTag.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EndTag/EndTag.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((STRING-EQUAL |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-QUERY::|EndTag.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-QUERY::|EndTag/fail.3| INDEX))))))
                               (XML-QUERY::|EndTag/EndTag/EndTag.2.5.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EndTag/EndTag/EndTag.2.5.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QName| RESULT))
                                              (XML-QUERY::|EndTag/EndTag/EndTag.2.5.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|QName|) NIL))))))
                               (XML-QUERY::|EndTag/EndTag/EndTag.2.5.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EndTag/EndTag/EndTag.2.5.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|EndTag/EndTag.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|EndTag/EndTag.2.5| INDEX))))))
                               (XML-QUERY::|EndTag/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|EndTag/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|EndTag/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EndTag/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:</)
                                     (COND ((STRING-EQUAL |item| '|xml|:</)
                                            (SETF *ATN-TERM* '|xml|:</)
                                            (XML-QUERY::|EndTag/EndTag.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:</) (XML-QUERY::|EndTag/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|EndTag.2| XML-QUERY::|EndTag/EndTag.2.4|
                                  XML-QUERY::|EndTag/EndTag.2.5| XML-QUERY::|EndTag/EndTag/EndTag.2.5.6|
                                  XML-QUERY::|EndTag/EndTag/EndTag.2.5.7| XML-QUERY::|EndTag/fail.3| XML-QUERY::|EndTag/start.1|))
                        (XML-QUERY::|EndTag/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|NameSpec| (INDEX &AUX (XML-QUERY::|Expr| NIL) (XML-QUERY::|QName| NIL))
  "{53} NameSpec ::= (QName | ('{' Expr '}'))
(|Expr| |QName|)"
  (DECLARE (SPECIAL XML-QUERY::|NameSpec-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|NameSpec-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|NameSpec-INDEX| INDEX)
      (LET ((XML-QUERY::|NameSpec-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|NameSpec| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|NameSpec-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|NameSpec|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|NameSpec|)
                                 (RETURN-FROM XML-QUERY::|NameSpec| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|NameSpec| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|NameSpec.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameSpec.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|NameSpec|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|NameSpec|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|NameSpec|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Expr|
                                                         XML-QUERY::|Expr|
                                                         'XML-QUERY::|QName|
                                                         XML-QUERY::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|NameSpec-Constructor| XML-QUERY::|Expr| XML-QUERY::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|NameSpec|
                                                            (DELETE NIL (LIST XML-QUERY::|Expr| XML-QUERY::|QName|)))
                                                      'XML-QUERY::|NameSpec|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|NameSpec/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|NameSpec/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|NameSpec/NameSpec.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameSpec/NameSpec.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:{)
                                     (COND ((STRING-EQUAL |item| '|xml|:{)
                                            (SETF *ATN-TERM* '|xml|:{)
                                            (XML-QUERY::|NameSpec/NameSpec.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:{) NIL)))))
                               (XML-QUERY::|NameSpec/NameSpec.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameSpec/NameSpec.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Expr| RESULT))
                                              (XML-QUERY::|NameSpec/NameSpec.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|Expr|) NIL))))))
                               (XML-QUERY::|NameSpec/NameSpec.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameSpec/NameSpec.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:})
                                     (COND ((STRING-EQUAL |item| '|xml|:})
                                            (SETF *ATN-TERM* '|xml|:})
                                            (XML-QUERY::|NameSpec.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:}) NIL)))))
                               (XML-QUERY::|NameSpec/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|NameSpec/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|QName|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QName| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|QName| RESULT))
                                                    (XML-QUERY::|NameSpec.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|QName|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|NameSpec/NameSpec.2.4|)
                                           (XML-QUERY::|NameSpec/NameSpec.2.4| INDEX))
                                         (XML-QUERY::|NameSpec/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|NameSpec.2| XML-QUERY::|NameSpec/fail.3|
                                  XML-QUERY::|NameSpec/NameSpec.2.4| XML-QUERY::|NameSpec/NameSpec.2.5|
                                  XML-QUERY::|NameSpec/NameSpec.2.6| XML-QUERY::|NameSpec/start.1|))
                        (XML-QUERY::|NameSpec/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AttributeList| (INDEX &AUX (XML-QUERY::|Attribute| NIL))
  "{54} AttributeList ::= Attribute+
(|Attribute|)"
  (DECLARE (SPECIAL XML-QUERY::|AttributeList-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AttributeList-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AttributeList-INDEX| INDEX)
      (LET ((XML-QUERY::|AttributeList-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|AttributeList| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|AttributeList-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AttributeList|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AttributeList|)
                                 (RETURN-FROM XML-QUERY::|AttributeList| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AttributeList| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AttributeList.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeList.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AttributeList|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AttributeList|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|AttributeList|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|Attribute| XML-QUERY::|Attribute|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AttributeList-Constructor| XML-QUERY::|Attribute|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AttributeList| (DELETE NIL (LIST XML-QUERY::|Attribute|)))
                                                      'XML-QUERY::|AttributeList|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AttributeList.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeList.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Attribute|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Attribute| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Attribute| (CONS RESULT XML-QUERY::|Attribute|)))
                                              (XML-QUERY::|AttributeList.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Attribute|)
                                              (XML-QUERY::|AttributeList.2| INDEX)))))))
                               (XML-QUERY::|AttributeList/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AttributeList/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AttributeList/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeList/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|Attribute|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|Attribute| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|Attribute| (CONS RESULT XML-QUERY::|Attribute|)))
                                              (XML-QUERY::|AttributeList.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|Attribute|)
                                              (XML-QUERY::|AttributeList/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AttributeList.2| XML-QUERY::|AttributeList.4|
                                  XML-QUERY::|AttributeList/fail.3| XML-QUERY::|AttributeList/start.1|))
                        (XML-QUERY::|AttributeList/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Attribute| (INDEX &AUX (XML-QUERY::|AttributeValue| NIL) (XML-QUERY::|EnclosedExpr| NIL)
                               (XML-QUERY::|NameSpec| NIL))
  "Attribute ::= S+ NameSpec S? '=' S? ((AttributeValue | EnclosedExpr))
(|AttributeValue| |EnclosedExpr| |NameSpec|)"
  (DECLARE (SPECIAL XML-QUERY::|Attribute-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Attribute-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Attribute-INDEX| INDEX)
      (LET ((XML-QUERY::|Attribute-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|Attribute| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|Attribute-Parsetable|)
            (XML-QUERY::*QUOTE-TOKEN* NIL))
        (DECLARE (SPECIAL XML-QUERY::|Attribute-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Attribute|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Attribute|)
                                 (RETURN-FROM XML-QUERY::|Attribute| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Attribute| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Attribute.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Attribute|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Attribute|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Attribute|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AttributeValue|
                                                         XML-QUERY::|AttributeValue|
                                                         'XML-QUERY::|EnclosedExpr|
                                                         XML-QUERY::|EnclosedExpr|
                                                         'XML-QUERY::|NameSpec|
                                                         XML-QUERY::|NameSpec|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Attribute-Constructor|
                                                    XML-QUERY::|AttributeValue|
                                                    XML-QUERY::|EnclosedExpr|
                                                    XML-QUERY::|NameSpec|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Attribute|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|AttributeValue|
                                                                          XML-QUERY::|EnclosedExpr|
                                                                          XML-QUERY::|NameSpec|)))
                                                      'XML-QUERY::|Attribute|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Attribute.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|Attribute.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|Attribute/Attribute.2.4| INDEX))))))
                               (XML-QUERY::|Attribute/Attribute.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute/Attribute.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|NameSpec|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|NameSpec| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|NameSpec| RESULT))
                                              (XML-QUERY::|Attribute/Attribute.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|NameSpec|)
                                              (XML-QUERY::|Attribute/fail.3| INDEX)))))))
                               (XML-QUERY::|Attribute/Attribute.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute/Attribute.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|Attribute/Attribute.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|Attribute/Attribute.2.6| INDEX))))))
                               (XML-QUERY::|Attribute/Attribute.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute/Attribute.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:=)
                                     (COND ((STRING-EQUAL |item| '|xml|:=)
                                            (SETF *ATN-TERM* '|xml|:=)
                                            (XML-QUERY::|Attribute/Attribute.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:=) (XML-QUERY::|Attribute/fail.3| INDEX))))))
                               (XML-QUERY::|Attribute/Attribute.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute/Attribute.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|Attribute/Attribute.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|Attribute/Attribute.2.8| INDEX))))))
                               (XML-QUERY::|Attribute/Attribute.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute/Attribute.2.8|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|AttributeValue|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AttributeValue| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|AttributeValue| RESULT))
                                                    (XML-QUERY::|Attribute.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|AttributeValue|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|EnclosedExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EnclosedExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|EnclosedExpr| RESULT))
                                                    (XML-QUERY::|Attribute.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|EnclosedExpr|) NIL))))
                                         (XML-QUERY::|Attribute/fail.3| INDEX)))))
                               (XML-QUERY::|Attribute/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|Attribute/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Attribute/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Attribute/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|Attribute.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::S) (XML-QUERY::|Attribute/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Attribute.2| XML-QUERY::|Attribute.9|
                                  XML-QUERY::|Attribute/Attribute.2.4| XML-QUERY::|Attribute/Attribute.2.5|
                                  XML-QUERY::|Attribute/Attribute.2.6| XML-QUERY::|Attribute/Attribute.2.7|
                                  XML-QUERY::|Attribute/Attribute.2.8| XML-QUERY::|Attribute/fail.3|
                                  XML-QUERY::|Attribute/start.1|))
                        (XML-QUERY::|Attribute/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AttributeValue| (INDEX &AUX (XML-QUERY::|AttributeValueContent| NIL))
  "{55} AttributeValue ::= (('\"' AttributeValueContent* '\"') | ('''
                                                             AttributeValueContent*
                                                             '''))
(|AttributeValueContent|)"
  (DECLARE (SPECIAL XML-QUERY::|AttributeValue-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AttributeValue-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AttributeValue-INDEX| INDEX)
      (LET ((XML-QUERY::|AttributeValue-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|AttributeValue| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|AttributeValue-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AttributeValue|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AttributeValue|)
                                 (RETURN-FROM XML-QUERY::|AttributeValue| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AttributeValue| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AttributeValue.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue.11|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|AttributeValueContent|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AttributeValueContent| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|AttributeValueContent|
                                                      (CONS RESULT XML-QUERY::|AttributeValueContent|)))
                                              (XML-QUERY::|AttributeValue.11| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|AttributeValueContent|)
                                              (XML-QUERY::|AttributeValue/AttributeValue.2.10| INDEX)))))))
                               (XML-QUERY::|AttributeValue.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AttributeValue|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AttributeValue|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|AttributeValue|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|AttributeValueContent| XML-QUERY::|AttributeValueContent|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AttributeValue-Constructor| XML-QUERY::|AttributeValueContent|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AttributeValue|
                                                            (DELETE NIL (LIST XML-QUERY::|AttributeValueContent|)))
                                                      'XML-QUERY::|AttributeValue|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AttributeValue.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|AttributeValueContent|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AttributeValueContent| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|AttributeValueContent|
                                                      (CONS RESULT XML-QUERY::|AttributeValueContent|)))
                                              (XML-QUERY::|AttributeValue.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|AttributeValueContent|)
                                              (XML-QUERY::|AttributeValue/AttributeValue.2.6| INDEX)))))))
                               (XML-QUERY::|AttributeValue/AttributeValue.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/AttributeValue.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((STRING-EQUAL |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-QUERY::|AttributeValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-QUERY::|AttributeValue/AttributeValue.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/AttributeValue.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((STRING-EQUAL |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-QUERY::|AttributeValue/AttributeValue.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-QUERY::|AttributeValue/AttributeValue.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/AttributeValue.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|AttributeValueContent|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AttributeValueContent| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|AttributeValueContent|
                                                      (CONS RESULT XML-QUERY::|AttributeValueContent|)))
                                              (XML-QUERY::|AttributeValue.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|AttributeValueContent|)
                                              (XML-QUERY::|AttributeValue/AttributeValue.2.6| INDEX)))))))
                               (XML-QUERY::|AttributeValue/AttributeValue.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/AttributeValue.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((STRING-EQUAL |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-QUERY::|AttributeValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-QUERY::|AttributeValue/AttributeValue.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/AttributeValue.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((STRING-EQUAL |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-QUERY::|AttributeValue/AttributeValue.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-QUERY::|AttributeValue/AttributeValue.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/AttributeValue.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|AttributeValueContent|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|AttributeValueContent| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-QUERY::|AttributeValueContent|
                                                      (CONS RESULT XML-QUERY::|AttributeValueContent|)))
                                              (XML-QUERY::|AttributeValue.11| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|AttributeValueContent|)
                                              (XML-QUERY::|AttributeValue/AttributeValue.2.10| INDEX)))))))
                               (XML-QUERY::|AttributeValue/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AttributeValue/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AttributeValue/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValue/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|AttributeValue/AttributeValue.2.4|)
                                           (XML-QUERY::|AttributeValue/AttributeValue.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|AttributeValue/AttributeValue.2.8|)
                                           (XML-QUERY::|AttributeValue/AttributeValue.2.8| INDEX))
                                         (XML-QUERY::|AttributeValue/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AttributeValue.11| XML-QUERY::|AttributeValue.2|
                                  XML-QUERY::|AttributeValue.7| XML-QUERY::|AttributeValue/AttributeValue.2.10|
                                  XML-QUERY::|AttributeValue/AttributeValue.2.4| XML-QUERY::|AttributeValue/AttributeValue.2.5|
                                  XML-QUERY::|AttributeValue/AttributeValue.2.6| XML-QUERY::|AttributeValue/AttributeValue.2.8|
                                  XML-QUERY::|AttributeValue/AttributeValue.2.9| XML-QUERY::|AttributeValue/fail.3|
                                  XML-QUERY::|AttributeValue/start.1|))
                        (XML-QUERY::|AttributeValue/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|ElementContent| (INDEX &AUX (XML-QUERY::|CDataSection| NIL) (XML-QUERY::|CharData| NIL)
                                    (XML-QUERY::|CharRef| NIL) (XML-QUERY::|CommentConstructor| NIL)
                                    (XML-QUERY::|ElementConstructor| NIL) (XML-QUERY::|EnclosedExpr| NIL)
                                    (XML-QUERY::|PIConstructor| NIL) (XML-QUERY::|PredefinedEntityRef| NIL))
  "{56} ElementContent ::= (CharData | ElementConstructor | EnclosedExpr | CDataSection | CharRef | PredefinedEntityRef | CommentConstructor | PIConstructor)
(|CDataSection| |CharData| |CharRef| |CommentConstructor| |ElementConstructor| |EnclosedExpr| |PIConstructor| |PredefinedEntityRef|)"
  (DECLARE (SPECIAL XML-QUERY::|ElementContent-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|ElementContent-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|ElementContent-INDEX| INDEX)
      (LET ((XML-QUERY::|ElementContent-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|ElementContent| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|ElementContent-Parsetable|))
        (DECLARE (SPECIAL XML-QUERY::|ElementContent-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|ElementContent|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|ElementContent|)
                                 (RETURN-FROM XML-QUERY::|ElementContent| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|ElementContent| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|ElementContent.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementContent.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|ElementContent|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|ElementContent|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|ElementContent|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CDataSection|
                                                         XML-QUERY::|CDataSection|
                                                         'XML-QUERY::|CharData|
                                                         XML-QUERY::|CharData|
                                                         'XML-QUERY::|CharRef|
                                                         XML-QUERY::|CharRef|
                                                         'XML-QUERY::|CommentConstructor|
                                                         XML-QUERY::|CommentConstructor|
                                                         'XML-QUERY::|ElementConstructor|
                                                         XML-QUERY::|ElementConstructor|
                                                         'XML-QUERY::|EnclosedExpr|
                                                         XML-QUERY::|EnclosedExpr|
                                                         'XML-QUERY::|PIConstructor|
                                                         XML-QUERY::|PIConstructor|
                                                         'XML-QUERY::|PredefinedEntityRef|
                                                         XML-QUERY::|PredefinedEntityRef|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|ElementContent-Constructor|
                                                    XML-QUERY::|CDataSection|
                                                    XML-QUERY::|CharData|
                                                    XML-QUERY::|CharRef|
                                                    XML-QUERY::|CommentConstructor|
                                                    XML-QUERY::|ElementConstructor|
                                                    XML-QUERY::|EnclosedExpr|
                                                    XML-QUERY::|PIConstructor|
                                                    XML-QUERY::|PredefinedEntityRef|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|ElementContent|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|CDataSection|
                                                                          XML-QUERY::|CharData|
                                                                          XML-QUERY::|CharRef|
                                                                          XML-QUERY::|CommentConstructor|
                                                                          XML-QUERY::|ElementConstructor|
                                                                          XML-QUERY::|EnclosedExpr|
                                                                          XML-QUERY::|PIConstructor|
                                                                          XML-QUERY::|PredefinedEntityRef|)))
                                                      'XML-QUERY::|ElementContent|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|ElementContent/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|ElementContent/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|ElementContent/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|ElementContent/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-QUERY::|CharData|)
                                           (COND ((XML-QUERY::|IS-CharData| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|CharData|)
                                                  (SETF XML-QUERY::|CharData|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|CharData-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|CharData| |item|)
                                                                'XML-QUERY::|CharData|)))
                                                  (XML-QUERY::|ElementContent.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-QUERY::|CharData|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|ElementConstructor|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ElementConstructor| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|ElementConstructor| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|ElementConstructor|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|EnclosedExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EnclosedExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|EnclosedExpr| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|EnclosedExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CDataSection|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CDataSection| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CDataSection| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CDataSection|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CharRef|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CharRef| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CharRef| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CharRef|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PredefinedEntityRef|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PredefinedEntityRef| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PredefinedEntityRef| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PredefinedEntityRef|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CommentConstructor|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CommentConstructor| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CommentConstructor| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CommentConstructor|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PIConstructor|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PIConstructor| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PIConstructor| RESULT))
                                                    (XML-QUERY::|ElementContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PIConstructor|) NIL))))
                                         (XML-QUERY::|ElementContent/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|ElementContent.2| XML-QUERY::|ElementContent/fail.3|
                                  XML-QUERY::|ElementContent/start.1|))
                        (XML-QUERY::|ElementContent/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|AttributeValueContent| (INDEX &AUX (XML-QUERY::|CharData| NIL) (XML-QUERY::|CharRef| NIL)
                                           (XML-QUERY::|EnclosedExpr| NIL) (XML-QUERY::|PredefinedEntityRef| NIL))
  "{57} AttributeValueContent ::= (CharData | CharRef | EnclosedExpr | PredefinedEntityRef)
(|CharData| |CharRef| |EnclosedExpr| |PredefinedEntityRef|)"
  (DECLARE (SPECIAL XML-QUERY::|AttributeValueContent-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|AttributeValueContent-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|AttributeValueContent-INDEX| INDEX)
      (LET ((XML-QUERY::|AttributeValueContent-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|AttributeValueContent| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|AttributeValueContent-Parsetable|)
            (XML-QUERY::*QUOTE-TOKEN* NIL))
        (DECLARE (SPECIAL XML-QUERY::|AttributeValueContent-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|AttributeValueContent|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|AttributeValueContent|)
                                 (RETURN-FROM XML-QUERY::|AttributeValueContent| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|AttributeValueContent| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|AttributeValueContent.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValueContent.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|AttributeValueContent|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|AttributeValueContent|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|AttributeValueContent|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CharData|
                                                         XML-QUERY::|CharData|
                                                         'XML-QUERY::|CharRef|
                                                         XML-QUERY::|CharRef|
                                                         'XML-QUERY::|EnclosedExpr|
                                                         XML-QUERY::|EnclosedExpr|
                                                         'XML-QUERY::|PredefinedEntityRef|
                                                         XML-QUERY::|PredefinedEntityRef|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|AttributeValueContent-Constructor|
                                                    XML-QUERY::|CharData|
                                                    XML-QUERY::|CharRef|
                                                    XML-QUERY::|EnclosedExpr|
                                                    XML-QUERY::|PredefinedEntityRef|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|AttributeValueContent|
                                                            (DELETE NIL
                                                                    (LIST XML-QUERY::|CharData|
                                                                          XML-QUERY::|CharRef|
                                                                          XML-QUERY::|EnclosedExpr|
                                                                          XML-QUERY::|PredefinedEntityRef|)))
                                                      'XML-QUERY::|AttributeValueContent|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|AttributeValueContent/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|AttributeValueContent/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|AttributeValueContent/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|AttributeValueContent/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-QUERY::|CharData|)
                                           (COND ((XML-QUERY::|IS-CharData| |item|)
                                                  (SETF *ATN-TERM* 'XML-QUERY::|CharData|)
                                                  (SETF XML-QUERY::|CharData|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-QUERY::|CharData-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-QUERY::|CharData| |item|)
                                                                'XML-QUERY::|CharData|)))
                                                  (XML-QUERY::|AttributeValueContent.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-QUERY::|CharData|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|CharRef|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|CharRef| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|CharRef| RESULT))
                                                    (XML-QUERY::|AttributeValueContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|CharRef|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|EnclosedExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|EnclosedExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|EnclosedExpr| RESULT))
                                                    (XML-QUERY::|AttributeValueContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|EnclosedExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-QUERY::|PredefinedEntityRef|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|PredefinedEntityRef| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-QUERY::|PredefinedEntityRef| RESULT))
                                                    (XML-QUERY::|AttributeValueContent.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-QUERY::|PredefinedEntityRef|) NIL))))
                                         (XML-QUERY::|AttributeValueContent/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|AttributeValueContent.2|
                                  XML-QUERY::|AttributeValueContent/fail.3| XML-QUERY::|AttributeValueContent/start.1|))
                        (XML-QUERY::|AttributeValueContent/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|CDataSection| (INDEX &AUX (XML-QUERY::|CDataCharData| NIL))
  "{58} CDataSection ::= '<![CDATA[' CDataCharData ']]>'
(|CDataCharData|)"
  (DECLARE (SPECIAL XML-QUERY::|CDataSection-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|CDataSection-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|CDataSection-INDEX| INDEX)
      (LET ((XML-QUERY::|CDataSection-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|CDataSection| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|CDataSection-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|CDataSection|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|CDataSection|)
                                 (RETURN-FROM XML-QUERY::|CDataSection| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|CDataSection| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|CDataSection.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CDataSection.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|CDataSection|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|CDataSection|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|CDataSection|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CDataCharData| XML-QUERY::|CDataCharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|CDataSection-Constructor| XML-QUERY::|CDataCharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|CDataSection|
                                                            (DELETE NIL (LIST XML-QUERY::|CDataCharData|)))
                                                      'XML-QUERY::|CDataSection|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|CDataSection/CDataSection.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CDataSection/CDataSection.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|CDataCharData|)
                                     (COND ((XML-QUERY::|IS-CDataCharData| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|CDataCharData|)
                                            (SETF XML-QUERY::|CDataCharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|CDataCharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|CDataCharData| |item|)
                                                          'XML-QUERY::|CDataCharData|)))
                                            (XML-QUERY::|CDataSection/CDataSection.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-QUERY::|CDataCharData|)
                                            (XML-QUERY::|CDataSection/fail.3| INDEX))))))
                               (XML-QUERY::|CDataSection/CDataSection.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CDataSection/CDataSection.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:]]>)
                                     (COND ((STRING-EQUAL |item| '|xml|:]]>)
                                            (SETF *ATN-TERM* '|xml|:]]>)
                                            (XML-QUERY::|CDataSection.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]]>) (XML-QUERY::|CDataSection/fail.3| INDEX))))))
                               (XML-QUERY::|CDataSection/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|CDataSection/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|CDataSection/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CDataSection/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<![CDATA[)
                                     (COND ((STRING-EQUAL |item| '|xml|:<![CDATA[)
                                            (SETF *ATN-TERM* '|xml|:<![CDATA[)
                                            (XML-QUERY::|CDataSection/CDataSection.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<![CDATA[) (XML-QUERY::|CDataSection/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|CDataSection.2| XML-QUERY::|CDataSection/CDataSection.2.4|
                                  XML-QUERY::|CDataSection/CDataSection.2.5| XML-QUERY::|CDataSection/fail.3|
                                  XML-QUERY::|CDataSection/start.1|))
                        (XML-QUERY::|CDataSection/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|EnclosedExpr| (INDEX &AUX (XML-QUERY::|ExprSequence| NIL))
  "{59} EnclosedExpr ::= '{' ExprSequence '}'
(|ExprSequence|)"
  (DECLARE (SPECIAL XML-QUERY::|EnclosedExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|EnclosedExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|EnclosedExpr-INDEX| INDEX)
      (LET ((XML-QUERY::|EnclosedExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|EnclosedExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|EnclosedExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|EnclosedExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|EnclosedExpr|)
                                 (RETURN-FROM XML-QUERY::|EnclosedExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|EnclosedExpr| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|EnclosedExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EnclosedExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|EnclosedExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|EnclosedExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|EnclosedExpr|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|ExprSequence| XML-QUERY::|ExprSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|EnclosedExpr-Constructor| XML-QUERY::|ExprSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|EnclosedExpr|
                                                            (DELETE NIL (LIST XML-QUERY::|ExprSequence|)))
                                                      'XML-QUERY::|EnclosedExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|EnclosedExpr/EnclosedExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EnclosedExpr/EnclosedExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|ExprSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|ExprSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|ExprSequence| RESULT))
                                              (XML-QUERY::|EnclosedExpr/EnclosedExpr.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|ExprSequence|)
                                              (XML-QUERY::|EnclosedExpr/fail.3| INDEX)))))))
                               (XML-QUERY::|EnclosedExpr/EnclosedExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EnclosedExpr/EnclosedExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:})
                                     (COND ((STRING-EQUAL |item| '|xml|:})
                                            (SETF *ATN-TERM* '|xml|:})
                                            (XML-QUERY::|EnclosedExpr.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:}) (XML-QUERY::|EnclosedExpr/fail.3| INDEX))))))
                               (XML-QUERY::|EnclosedExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|EnclosedExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|EnclosedExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|EnclosedExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:{)
                                     (COND ((STRING-EQUAL |item| '|xml|:{)
                                            (SETF *ATN-TERM* '|xml|:{)
                                            (XML-QUERY::|EnclosedExpr/EnclosedExpr.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:{) (XML-QUERY::|EnclosedExpr/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|EnclosedExpr.2| XML-QUERY::|EnclosedExpr/EnclosedExpr.2.4|
                                  XML-QUERY::|EnclosedExpr/EnclosedExpr.2.5| XML-QUERY::|EnclosedExpr/fail.3|
                                  XML-QUERY::|EnclosedExpr/start.1|))
                        (XML-QUERY::|EnclosedExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|CommentConstructor| (INDEX &AUX (XML-QUERY::|CharData| NIL))
  "CommentConstructor ::= '<!--' CharData '-->'
(|CharData|)"
  (DECLARE (SPECIAL XML-QUERY::|CommentConstructor-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|CommentConstructor-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|CommentConstructor-INDEX| INDEX)
      (LET ((XML-QUERY::|CommentConstructor-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|CommentConstructor| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-QUERY::|CommentConstructor-Parsetable|))
        (DECLARE (SPECIAL XML-QUERY::|CommentConstructor-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|CommentConstructor|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|CommentConstructor|)
                                 (RETURN-FROM XML-QUERY::|CommentConstructor| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|CommentConstructor| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|CommentConstructor.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentConstructor.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|CommentConstructor|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|CommentConstructor|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|CommentConstructor|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CharData| XML-QUERY::|CharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|CommentConstructor-Constructor| XML-QUERY::|CharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|CommentConstructor|
                                                            (DELETE NIL (LIST XML-QUERY::|CharData|)))
                                                      'XML-QUERY::|CommentConstructor|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|CommentConstructor/CommentConstructor.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentConstructor/CommentConstructor.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|CharData|)
                                     (COND ((XML-QUERY::|IS-CharData| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|CharData|)
                                            (SETF XML-QUERY::|CharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|CharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|CharData| |item|)
                                                          'XML-QUERY::|CharData|)))
                                            (XML-QUERY::|CommentConstructor/CommentConstructor.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-QUERY::|CharData|)
                                            (XML-QUERY::|CommentConstructor/fail.3| INDEX))))))
                               (XML-QUERY::|CommentConstructor/CommentConstructor.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentConstructor/CommentConstructor.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:-->)
                                     (COND ((STRING-EQUAL |item| '|xml|:-->)
                                            (SETF *ATN-TERM* '|xml|:-->)
                                            (XML-QUERY::|CommentConstructor.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:-->) (XML-QUERY::|CommentConstructor/fail.3| INDEX))))))
                               (XML-QUERY::|CommentConstructor/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|CommentConstructor/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|CommentConstructor/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CommentConstructor/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!--)
                                     (COND ((STRING-EQUAL |item| '|xml|:<!--)
                                            (SETF *ATN-TERM* '|xml|:<!--)
                                            (XML-QUERY::|CommentConstructor/CommentConstructor.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!--) (XML-QUERY::|CommentConstructor/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|CommentConstructor.2|
                                  XML-QUERY::|CommentConstructor/CommentConstructor.2.4|
                                  XML-QUERY::|CommentConstructor/CommentConstructor.2.5| XML-QUERY::|CommentConstructor/fail.3|
                                  XML-QUERY::|CommentConstructor/start.1|))
                        (XML-QUERY::|CommentConstructor/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|PIConstructor| (INDEX &AUX (XML-QUERY::|CharData| NIL) (XML-QUERY::|NCName| NIL))
  "PIConstructor ::= '<?' NCName S? CharData '?>'
(|CharData| |NCName|)"
  (DECLARE (SPECIAL XML-QUERY::|PIConstructor-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|PIConstructor-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|PIConstructor-INDEX| INDEX)
      (LET ((XML-QUERY::|PIConstructor-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|PIConstructor| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|PIConstructor-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|PIConstructor|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|PIConstructor|)
                                 (RETURN-FROM XML-QUERY::|PIConstructor| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|PIConstructor| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|PIConstructor.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PIConstructor.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|PIConstructor|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|PIConstructor|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|PIConstructor|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CharData|
                                                         XML-QUERY::|CharData|
                                                         'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|PIConstructor-Constructor|
                                                    XML-QUERY::|CharData|
                                                    XML-QUERY::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|PIConstructor|
                                                            (DELETE NIL (LIST XML-QUERY::|CharData| XML-QUERY::|NCName|)))
                                                      'XML-QUERY::|PIConstructor|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|PIConstructor/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|PIConstructor/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|PIConstructor/PIConstructor.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PIConstructor/PIConstructor.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|NCName|)
                                     (COND ((XML-QUERY::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                            (SETF XML-QUERY::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NCName| |item|)
                                                          'XML-QUERY::|NCName|)))
                                            (XML-QUERY::|PIConstructor/PIConstructor.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-QUERY::|NCName|)
                                            (XML-QUERY::|PIConstructor/fail.3| INDEX))))))
                               (XML-QUERY::|PIConstructor/PIConstructor.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PIConstructor/PIConstructor.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::S)
                                     (COND ((XML-QUERY::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::S)
                                            (XML-QUERY::|PIConstructor/PIConstructor.2.6| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-QUERY::S)
                                            (XML-QUERY::|PIConstructor/PIConstructor.2.6| INDEX))))))
                               (XML-QUERY::|PIConstructor/PIConstructor.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PIConstructor/PIConstructor.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|CharData|)
                                     (COND ((XML-QUERY::|IS-CharData| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|CharData|)
                                            (SETF XML-QUERY::|CharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|CharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|CharData| |item|)
                                                          'XML-QUERY::|CharData|)))
                                            (XML-QUERY::|PIConstructor/PIConstructor.2.7| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-QUERY::|CharData|)
                                            (XML-QUERY::|PIConstructor/fail.3| INDEX))))))
                               (XML-QUERY::|PIConstructor/PIConstructor.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PIConstructor/PIConstructor.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:?>)
                                     (COND ((STRING-EQUAL |item| '|xml|:?>)
                                            (SETF *ATN-TERM* '|xml|:?>)
                                            (XML-QUERY::|PIConstructor.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:?>) (XML-QUERY::|PIConstructor/fail.3| INDEX))))))
                               (XML-QUERY::|PIConstructor/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PIConstructor/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<?)
                                     (COND ((STRING-EQUAL |item| '|xml|:<?)
                                            (SETF *ATN-TERM* '|xml|:<?)
                                            (XML-QUERY::|PIConstructor/PIConstructor.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<?) (XML-QUERY::|PIConstructor/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|PIConstructor.2| XML-QUERY::|PIConstructor/fail.3|
                                  XML-QUERY::|PIConstructor/PIConstructor.2.4| XML-QUERY::|PIConstructor/PIConstructor.2.5|
                                  XML-QUERY::|PIConstructor/PIConstructor.2.6| XML-QUERY::|PIConstructor/PIConstructor.2.7|
                                  XML-QUERY::|PIConstructor/start.1|))
                        (XML-QUERY::|PIConstructor/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|StringLiteral| (INDEX &AUX (XML-QUERY::|StringLiteralData| NIL))
  "{60} StringLiteral ::= (('\"' StringLiteralData '\"') | ('''
                                                       StringLiteralData
                                                       '''))
(|StringLiteralData|)"
  (DECLARE (SPECIAL XML-QUERY::|StringLiteral-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|StringLiteral-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|StringLiteral-INDEX| INDEX)
      (LET ((XML-QUERY::|StringLiteral-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|StringLiteral| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|StringLiteral-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|StringLiteral|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|StringLiteral|)
                                 (RETURN-FROM XML-QUERY::|StringLiteral| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|StringLiteral| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|StringLiteral.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|StringLiteral|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|StringLiteral|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|StringLiteral|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|StringLiteralData| XML-QUERY::|StringLiteralData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|StringLiteral-Constructor| XML-QUERY::|StringLiteralData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|StringLiteral|
                                                            (DELETE NIL (LIST XML-QUERY::|StringLiteralData|)))
                                                      'XML-QUERY::|StringLiteral|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|StringLiteral/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|StringLiteral/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|StringLiteral/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|StringLiteral/StringLiteral.2.4|)
                                           (XML-QUERY::|StringLiteral/StringLiteral.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|StringLiteral/StringLiteral.2.7|)
                                           (XML-QUERY::|StringLiteral/StringLiteral.2.7| INDEX))
                                         (XML-QUERY::|StringLiteral/fail.3| INDEX)))))
                               (XML-QUERY::|StringLiteral/StringLiteral.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/StringLiteral.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((STRING-EQUAL |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-QUERY::|StringLiteral/StringLiteral.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-QUERY::|StringLiteral/StringLiteral.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/StringLiteral.2.5|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-QUERY::|StringLiteralData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-QUERY::|StringLiteralData|)
                                       (COND ((XML-QUERY::|IS-StringLiteralData| |item|)
                                              (SETF *ATN-TERM* 'XML-QUERY::|StringLiteralData|)
                                              (SETF XML-QUERY::|StringLiteralData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-QUERY::|StringLiteralData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-QUERY::|StringLiteralData| |item|)
                                                            'XML-QUERY::|StringLiteralData|)))
                                              (XML-QUERY::|StringLiteral/StringLiteral.2.6| (1+ INDEX)))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteralData|) NIL))))))
                               (XML-QUERY::|StringLiteral/StringLiteral.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/StringLiteral.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((STRING-EQUAL |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-QUERY::|StringLiteral.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-QUERY::|StringLiteral/StringLiteral.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/StringLiteral.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((STRING-EQUAL |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-QUERY::|StringLiteral/StringLiteral.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-QUERY::|StringLiteral/StringLiteral.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/StringLiteral.2.8|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-QUERY::|StringLiteralData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-QUERY::|StringLiteralData|)
                                       (COND ((XML-QUERY::|IS-StringLiteralData| |item|)
                                              (SETF *ATN-TERM* 'XML-QUERY::|StringLiteralData|)
                                              (SETF XML-QUERY::|StringLiteralData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-QUERY::|StringLiteralData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-QUERY::|StringLiteralData| |item|)
                                                            'XML-QUERY::|StringLiteralData|)))
                                              (XML-QUERY::|StringLiteral/StringLiteral.2.9| (1+ INDEX)))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|StringLiteralData|) NIL))))))
                               (XML-QUERY::|StringLiteral/StringLiteral.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|StringLiteral/StringLiteral.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((STRING-EQUAL |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-QUERY::|StringLiteral.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|StringLiteral.2| XML-QUERY::|StringLiteral/fail.3|
                                  XML-QUERY::|StringLiteral/start.1| XML-QUERY::|StringLiteral/StringLiteral.2.4|
                                  XML-QUERY::|StringLiteral/StringLiteral.2.5| XML-QUERY::|StringLiteral/StringLiteral.2.6|
                                  XML-QUERY::|StringLiteral/StringLiteral.2.7| XML-QUERY::|StringLiteral/StringLiteral.2.8|
                                  XML-QUERY::|StringLiteral/StringLiteral.2.9|))
                        (XML-QUERY::|StringLiteral/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Wildcard| (INDEX &AUX (XML-QUERY::|NamePrefix| NIL) (XML-QUERY::|NCName| NIL))
  "{62} Wildcard ::= ('*' | (NamePrefix ':*') | ('*:' NCName))
(|NamePrefix| |NCName|)"
  (DECLARE (SPECIAL XML-QUERY::|Wildcard-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Wildcard-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Wildcard-INDEX| INDEX)
      (LET ((XML-QUERY::|Wildcard-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|Wildcard| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|Wildcard-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Wildcard|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Wildcard|)
                                 (RETURN-FROM XML-QUERY::|Wildcard| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Wildcard| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Wildcard.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Wildcard.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Wildcard|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Wildcard|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Wildcard|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NamePrefix|
                                                         XML-QUERY::|NamePrefix|
                                                         'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Wildcard-Constructor| XML-QUERY::|NamePrefix| XML-QUERY::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Wildcard|
                                                            (DELETE NIL (LIST XML-QUERY::|NamePrefix| XML-QUERY::|NCName|)))
                                                      'XML-QUERY::|Wildcard|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Wildcard/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|Wildcard/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Wildcard/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Wildcard/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (WORD |xml|:*)
                                           (COND ((STRING-EQUAL |item| '|xml|:*)
                                                  (SETF *ATN-TERM* '|xml|:*)
                                                  (XML-QUERY::|Wildcard.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* '|xml|:*) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|Wildcard/Wildcard.2.4|)
                                           (XML-QUERY::|Wildcard/Wildcard.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-QUERY::|Wildcard/Wildcard.2.6|)
                                           (XML-QUERY::|Wildcard/Wildcard.2.6| INDEX))
                                         (XML-QUERY::|Wildcard/fail.3| INDEX)))))
                               (XML-QUERY::|Wildcard/Wildcard.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Wildcard/Wildcard.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|NamePrefix|)
                                     (COND ((XML-QUERY::|IS-NamePrefix| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NamePrefix|)
                                            (SETF XML-QUERY::|NamePrefix|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NamePrefix-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NamePrefix| |item|)
                                                          'XML-QUERY::|NamePrefix|)))
                                            (XML-QUERY::|Wildcard/Wildcard.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-QUERY::|NamePrefix|) NIL)))))
                               (XML-QUERY::|Wildcard/Wildcard.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Wildcard/Wildcard.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\:*)
                                     (COND ((STRING-EQUAL |item| '|xml|:\:*)
                                            (SETF *ATN-TERM* '|xml|:\:*)
                                            (XML-QUERY::|Wildcard.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\:*) NIL)))))
                               (XML-QUERY::|Wildcard/Wildcard.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Wildcard/Wildcard.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|*:|)
                                     (COND ((STRING-EQUAL |item| '|xml|:|*:|)
                                            (SETF *ATN-TERM* '|xml|:|*:|)
                                            (XML-QUERY::|Wildcard/Wildcard.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|*:|) NIL)))))
                               (XML-QUERY::|Wildcard/Wildcard.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Wildcard/Wildcard.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|NCName|)
                                     (COND ((XML-QUERY::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                            (SETF XML-QUERY::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NCName| |item|)
                                                          'XML-QUERY::|NCName|)))
                                            (XML-QUERY::|Wildcard.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) NIL))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Wildcard.2| XML-QUERY::|Wildcard/fail.3|
                                  XML-QUERY::|Wildcard/start.1| XML-QUERY::|Wildcard/Wildcard.2.4|
                                  XML-QUERY::|Wildcard/Wildcard.2.5| XML-QUERY::|Wildcard/Wildcard.2.6|
                                  XML-QUERY::|Wildcard/Wildcard.2.7|))
                        (XML-QUERY::|Wildcard/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|Variable| (INDEX &AUX (XML-QUERY::|QName| NIL))
  "{63} Variable ::= '$' QName
(|QName|)"
  (DECLARE (SPECIAL XML-QUERY::|Variable-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|Variable-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|Variable-INDEX| INDEX)
      (LET ((XML-QUERY::|Variable-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|Variable| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|Variable-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|Variable|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|Variable|)
                                 (RETURN-FROM XML-QUERY::|Variable| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|Variable| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|Variable.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Variable.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|Variable|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|Variable|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|Variable|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|QName| XML-QUERY::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|Variable-Constructor| XML-QUERY::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|Variable| (DELETE NIL (LIST XML-QUERY::|QName|)))
                                                      'XML-QUERY::|Variable|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|Variable/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|Variable/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|Variable/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Variable/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:$)
                                     (COND ((STRING-EQUAL |item| '|xml|:$)
                                            (SETF *ATN-TERM* '|xml|:$)
                                            (XML-QUERY::|Variable/Variable.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:$) (XML-QUERY::|Variable/fail.3| INDEX))))))
                               (XML-QUERY::|Variable/Variable.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|Variable/Variable.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QName| RESULT))
                                              (XML-QUERY::|Variable.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-QUERY::|QName|) (XML-QUERY::|Variable/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|Variable.2| XML-QUERY::|Variable/fail.3|
                                  XML-QUERY::|Variable/start.1| XML-QUERY::|Variable/Variable.2.4|))
                        (XML-QUERY::|Variable/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|PredefinedEntityRef| (INDEX &AUX (XML-QUERY::|EntityOp| NIL))
  "{64} PredefinedEntityRef ::= '&' EntityOp ';'
(|EntityOp|)"
  (DECLARE (SPECIAL XML-QUERY::|PredefinedEntityRef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|PredefinedEntityRef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|PredefinedEntityRef-INDEX| INDEX)
      (LET ((XML-QUERY::|PredefinedEntityRef-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|PredefinedEntityRef| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|PredefinedEntityRef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|PredefinedEntityRef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|PredefinedEntityRef|)
                                 (RETURN-FROM XML-QUERY::|PredefinedEntityRef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|PredefinedEntityRef| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|PredefinedEntityRef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredefinedEntityRef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|PredefinedEntityRef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|PredefinedEntityRef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|PredefinedEntityRef|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|EntityOp| XML-QUERY::|EntityOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|PredefinedEntityRef-Constructor| XML-QUERY::|EntityOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|PredefinedEntityRef|
                                                            (DELETE NIL (LIST XML-QUERY::|EntityOp|)))
                                                      'XML-QUERY::|PredefinedEntityRef|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|PredefinedEntityRef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|PredefinedEntityRef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-QUERY::|EntityOp|)
                                     (COND ((XML-QUERY::|IS-EntityOp| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|EntityOp|)
                                            (SETF XML-QUERY::|EntityOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|EntityOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|EntityOp| |item|)
                                                          'XML-QUERY::|EntityOp|)))
                                            (XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-QUERY::|EntityOp|)
                                            (XML-QUERY::|PredefinedEntityRef/fail.3| INDEX))))))
                               (XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((STRING-EQUAL |item| '|xml|:\;)
                                            (SETF *ATN-TERM* '|xml|:\;)
                                            (XML-QUERY::|PredefinedEntityRef.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) (XML-QUERY::|PredefinedEntityRef/fail.3| INDEX))))))
                               (XML-QUERY::|PredefinedEntityRef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|PredefinedEntityRef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:&)
                                     (COND ((STRING-EQUAL |item| '|xml|:&)
                                            (SETF *ATN-TERM* '|xml|:&)
                                            (XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:&) (XML-QUERY::|PredefinedEntityRef/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|PredefinedEntityRef.2| XML-QUERY::|PredefinedEntityRef/fail.3|
                                  XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.4|
                                  XML-QUERY::|PredefinedEntityRef/PredefinedEntityRef.2.5|
                                  XML-QUERY::|PredefinedEntityRef/start.1|))
                        (XML-QUERY::|PredefinedEntityRef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|CharRef| (INDEX &AUX (XML-QUERY::|CharRefData| NIL))
  "{65} CharRef ::= '&#' CharRefData ';'
(|CharRefData|)"
  (DECLARE (SPECIAL XML-QUERY::|CharRef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|CharRef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|CharRef-INDEX| INDEX)
      (LET ((XML-QUERY::|CharRef-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|CharRef| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|CharRef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|CharRef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|CharRef|)
                                 (RETURN-FROM XML-QUERY::|CharRef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|CharRef| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|CharRef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CharRef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|CharRef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|CharRef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|CharRef|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|CharRefData| XML-QUERY::|CharRefData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|CharRef-Constructor| XML-QUERY::|CharRefData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|CharRef| (DELETE NIL (LIST XML-QUERY::|CharRefData|)))
                                                      'XML-QUERY::|CharRef|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|CharRef/CharRef.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CharRef/CharRef.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|CharRefData|)
                                     (COND ((XML-QUERY::|IS-CharRefData| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|CharRefData|)
                                            (SETF XML-QUERY::|CharRefData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|CharRefData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|CharRefData| |item|)
                                                          'XML-QUERY::|CharRefData|)))
                                            (XML-QUERY::|CharRef/CharRef.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::|CharRefData|) (XML-QUERY::|CharRef/fail.3| INDEX))))))
                               (XML-QUERY::|CharRef/CharRef.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CharRef/CharRef.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((STRING-EQUAL |item| '|xml|:\;)
                                            (SETF *ATN-TERM* '|xml|:\;)
                                            (XML-QUERY::|CharRef.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) (XML-QUERY::|CharRef/fail.3| INDEX))))))
                               (XML-QUERY::|CharRef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|CharRef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|CharRef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|CharRef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:&#)
                                     (COND ((STRING-EQUAL |item| '|xml|:&#)
                                            (SETF *ATN-TERM* '|xml|:&#)
                                            (XML-QUERY::|CharRef/CharRef.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:&#) (XML-QUERY::|CharRef/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|CharRef.2| XML-QUERY::|CharRef/CharRef.2.4|
                                  XML-QUERY::|CharRef/CharRef.2.5| XML-QUERY::|CharRef/fail.3| XML-QUERY::|CharRef/start.1|))
                        (XML-QUERY::|CharRef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|QName| (INDEX &AUX (XML-QUERY::|NCName| NIL) (XML-QUERY::|QNamePrefix| NIL))
  "QName ::= QNamePrefix? NCName
(|NCName| |QNamePrefix|)"
  (DECLARE (SPECIAL XML-QUERY::|QName-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|QName-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|QName-INDEX| INDEX)
      (LET ((XML-QUERY::|QName-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-QUERY::|QName| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|QName-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|QName|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|QName|)
                                 (RETURN-FROM XML-QUERY::|QName| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|QName| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|QName.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QName.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|QName|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|QName|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|QName|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NCName|
                                                         XML-QUERY::|NCName|
                                                         'XML-QUERY::|QNamePrefix|
                                                         XML-QUERY::|QNamePrefix|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|QName-Constructor| XML-QUERY::|NCName| XML-QUERY::|QNamePrefix|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|QName|
                                                            (DELETE NIL (LIST XML-QUERY::|NCName| XML-QUERY::|QNamePrefix|)))
                                                      'XML-QUERY::|QName|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|QName/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-QUERY::|QName/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|QName/QName.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QName/QName.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|NCName|)
                                     (COND ((XML-QUERY::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                            (SETF XML-QUERY::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NCName| |item|)
                                                          'XML-QUERY::|NCName|)))
                                            (XML-QUERY::|QName.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) (XML-QUERY::|QName/fail.3| INDEX))))))
                               (XML-QUERY::|QName/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QName/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-QUERY::|QNamePrefix|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-QUERY::|QNamePrefix| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-QUERY::|QNamePrefix| RESULT))
                                              (XML-QUERY::|QName/QName.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-QUERY::|QNamePrefix|)
                                              (XML-QUERY::|QName/QName.2.4| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|QName.2| XML-QUERY::|QName/fail.3| XML-QUERY::|QName/QName.2.4|
                                  XML-QUERY::|QName/start.1|))
                        (XML-QUERY::|QName/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(DEFUN XML-QUERY::|QNamePrefix| (INDEX &AUX (XML-QUERY::|NCName| NIL))
  "QNamePrefix ::= NCName ':'
(|NCName|)"
  (DECLARE (SPECIAL XML-QUERY::|QNamePrefix-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-QUERY::|QNamePrefix-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-QUERY::|QNamePrefix-INDEX| INDEX)
      (LET ((XML-QUERY::|QNamePrefix-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-QUERY::|QNamePrefix| *ATN-STACK)))
        (DECLARE (SPECIAL XML-QUERY::|QNamePrefix-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-QUERY::|QNamePrefix|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-QUERY::|QNamePrefix|)
                                 (RETURN-FROM XML-QUERY::|QNamePrefix| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-QUERY::|QNamePrefix| (VALUES NIL INDEX NIL)))
                               (XML-QUERY::|QNamePrefix.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QNamePrefix.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-QUERY::|QNamePrefix|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-QUERY::|QNamePrefix|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-QUERY::|QNamePrefix|
                                                   INDEX
                                                   (LIST 'XML-QUERY::|NCName| XML-QUERY::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-QUERY::|QNamePrefix-Constructor| XML-QUERY::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-QUERY::|QNamePrefix| (DELETE NIL (LIST XML-QUERY::|NCName|)))
                                                      'XML-QUERY::|QNamePrefix|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-QUERY::|QNamePrefix/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-QUERY::|QNamePrefix/fail.3| (PROGN (FAIL INDEX))))
                               (XML-QUERY::|QNamePrefix/QNamePrefix.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QNamePrefix/QNamePrefix.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\:)
                                     (COND ((STRING-EQUAL |item| '|xml|:\:)
                                            (SETF *ATN-TERM* '|xml|:\:)
                                            (XML-QUERY::|QNamePrefix.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\:) (XML-QUERY::|QNamePrefix/fail.3| INDEX))))))
                               (XML-QUERY::|QNamePrefix/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-QUERY::|QNamePrefix/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY::|NCName|)
                                     (COND ((XML-QUERY::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY::|NCName|)
                                            (SETF XML-QUERY::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-QUERY::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-QUERY::|NCName| |item|)
                                                          'XML-QUERY::|NCName|)))
                                            (XML-QUERY::|QNamePrefix/QNamePrefix.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-QUERY::|NCName|) (XML-QUERY::|QNamePrefix/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-QUERY::|QNamePrefix.2| XML-QUERY::|QNamePrefix/fail.3|
                                  XML-QUERY::|QNamePrefix/QNamePrefix.2.4| XML-QUERY::|QNamePrefix/start.1|))
                        (XML-QUERY::|QNamePrefix/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      NIL))
(SETF (GET 'XML-QUERY::|QueryModuleList| :PRODUCTION) "
{1 } QueryModuleList ::= QueryModule (';' QueryModule)*")
(SETF (GET 'XML-QUERY::|QueryModule| :PRODUCTION) "
{2 } QueryModule ::= ContextDecl* FunctionDefn* ExprSequence?")
(SETF (GET 'XML-QUERY::|ContextDecl| :PRODUCTION) "
{3 } ContextDecl ::= (NamespaceDecl | SchemaDecl)")
(SETF (GET 'XML-QUERY::|NamespaceDecl| :PRODUCTION) "
     NamespaceDecl ::= (('namespace' NCName '=' StringLiteral) | ('default'
                                                                  'namespace'
                                                                  '='
                                                                  StringLiteral))")
(SETF (GET 'XML-QUERY::|SchemaDecl| :PRODUCTION) "
     SchemaDecl ::= 'schema' SchemaName StringLiteral")
(SETF (GET 'XML-QUERY::|SchemaName| :PRODUCTION) "
     SchemaName ::= StringLiteral")
(SETF (GET 'XML-QUERY::|FunctionDefn| :PRODUCTION) "
{4 } FunctionDefn ::= 'define' 'function' QName '(' ParamList? ')' ('returns'
                                                                    Datatype)? EnclosedExpr")
(SETF (GET 'XML-QUERY::|ParamList| :PRODUCTION) "
{5 } ParamList ::= Param (',' Param)*")
(SETF (GET 'XML-QUERY::|Param| :PRODUCTION) "
{6 } Param ::= Datatype? Variable")
(SETF (GET 'XML-QUERY::|Expr| :PRODUCTION) "
{7 } Expr ::= (SortExpr | OrExpr | AndExpr | BeforeAfterExpr | FlwrExpr | IfExpr | SomeExpr | EveryExpr | TypeSwitchExpr | EqualityExpr | RelationalExpr | InstanceofExpr | RangeExpr | AdditiveExpr | MultiplicativeExpr | UnaryExpr | UnionExpr | IntersectExceptExpr | PathExpr)")
(SETF (GET 'XML-QUERY::|SortExpr| :PRODUCTION) "
{8 } SortExpr ::= Expr 'sortby' '(' SortSpecList ')'")
(SETF (GET 'XML-QUERY::|SortSpecList| :PRODUCTION) "
{9 } SortSpecList ::= SortSpec (',' SortSpec)*")
(SETF (GET 'XML-QUERY::|SortSpec| :PRODUCTION) "
     SortSpec ::= Expr SortOrder?")
(SETF (GET 'XML-QUERY::|OrExpr| :PRODUCTION) "
{10} OrExpr ::= Expr 'or' ExprArg2")
(SETF (GET 'XML-QUERY::|ExprArg2| :PRODUCTION) "
     ExprArg2 ::= Expr")
(SETF (GET 'XML-QUERY::|AndExpr| :PRODUCTION) "
{11} AndExpr ::= Expr 'and' ExprArg2")
(SETF (GET 'XML-QUERY::|BeforeAfterExpr| :PRODUCTION) "
{12} BeforeAfterExpr ::= Expr BeforeAfterOp ExprArg2")
(SETF (GET 'XML-QUERY::|FlwrExpr| :PRODUCTION) "
{13} FlwrExpr ::= FlwrExprForLet+ WhereClause? ReturnClause")
(SETF (GET 'XML-QUERY::|FlwrExprForLet| :PRODUCTION) "
     FlwrExprForLet ::= (ForClause | LetClause)")
(SETF (GET 'XML-QUERY::|ForClause| :PRODUCTION) "
{14} ForClause ::= 'for' FlwrForBinding (',' FlwrForBinding)*")
(SETF (GET 'XML-QUERY::|FlwrForBinding| :PRODUCTION) "
     FlwrForBinding ::= Variable 'in' Expr")
(SETF (GET 'XML-QUERY::|LetClause| :PRODUCTION) "
{15} LetClause ::= 'let' FlwrLetBinding (',' FlwrLetBinding)*")
(SETF (GET 'XML-QUERY::|FlwrLetBinding| :PRODUCTION) "
     FlwrLetBinding ::= Variable ':=' Expr")
(SETF (GET 'XML-QUERY::|WhereClause| :PRODUCTION) "
{16} WhereClause ::= 'where' Expr")
(SETF (GET 'XML-QUERY::|ReturnClause| :PRODUCTION) "
     ReturnClause ::= 'return' Expr")
(SETF (GET 'XML-QUERY::|IfExpr| :PRODUCTION) "
{17} IfExpr ::= 'if' '(' Expr ')' 'then' IfThenExpr 'else' IfElseExpr")
(SETF (GET 'XML-QUERY::|IfThenExpr| :PRODUCTION) "
     IfThenExpr ::= Expr")
(SETF (GET 'XML-QUERY::|IfElseExpr| :PRODUCTION) "
     IfElseExpr ::= Expr")
(SETF (GET 'XML-QUERY::|SomeExpr| :PRODUCTION) "
{18} SomeExpr ::= 'some' Variable 'in' Expr 'satisfies' ExprTest")
(SETF (GET 'XML-QUERY::|EveryExpr| :PRODUCTION) "
{19} EveryExpr ::= 'every' Variable 'in' Expr 'satisfies' ExprTest")
(SETF (GET 'XML-QUERY::|ExprTest| :PRODUCTION) "
     ExprTest ::= Expr")
(SETF (GET 'XML-QUERY::|TypeSwitchExpr| :PRODUCTION) "
{20} TypeSwitchExpr ::= 'typeswitch' '(' Expr ')' ('as'
                                                   Variable)? CaseClause+ 'default' 'return' DefaultExpr")
(SETF (GET 'XML-QUERY::|DefaultExpr| :PRODUCTION) "
     DefaultExpr ::= Expr")
(SETF (GET 'XML-QUERY::|CaseClause| :PRODUCTION) "
{21} CaseClause ::= 'case' Datatype 'return' Expr")
(SETF (GET 'XML-QUERY::|EqualityExpr| :PRODUCTION) "
{22} EqualityExpr ::= Expr EqualityOp ExprArg2")
(SETF (GET 'XML-QUERY::|RelationalExpr| :PRODUCTION) "
{23} RelationalExpr ::= Expr RelationalOp ExprArg2")
(SETF (GET 'XML-QUERY::|InstanceofExpr| :PRODUCTION) "
{24} InstanceofExpr ::= Expr 'instanceof' OnlyOp? Datatype")
(SETF (GET 'XML-QUERY::|RangeExpr| :PRODUCTION) "
{25} RangeExpr ::= Expr 'to' ExprArg2")
(SETF (GET 'XML-QUERY::|AdditiveExpr| :PRODUCTION) "
{26} AdditiveExpr ::= Expr AdditiveOp ExprArg2")
(SETF (GET 'XML-QUERY::|MultiplicativeExpr| :PRODUCTION) "
{27} MultiplicativeExpr ::= Expr MultiplicativeOp ExprArg2")
(SETF (GET 'XML-QUERY::|UnaryExpr| :PRODUCTION) "
{28} UnaryExpr ::= UnaryOp Expr")
(SETF (GET 'XML-QUERY::|UnionExpr| :PRODUCTION) "
{29} UnionExpr ::= Expr UnionOrOp ExprArg2")
(SETF (GET 'XML-QUERY::|IntersectExceptExpr| :PRODUCTION) "
{30} IntersectExceptExpr ::= Expr IntersectExceptOp ExprArg2")
(SETF (GET 'XML-QUERY::|PathExpr| :PRODUCTION) "
{31} PathExpr ::= (RelativePathExpr | (SingleSlash
                                       RelativePathExpr?) | (DoubleSlash
                                                             RelativePathExpr?))")
(SETF (GET 'XML-QUERY::|RelativePathExpr| :PRODUCTION) "
{32} RelativePathExpr ::= StepExpr RelatedStep*")
(SETF (GET 'XML-QUERY::|RelatedStep| :PRODUCTION) "
     RelatedStep ::= ((SingleSlash | DoubleSlash)) StepExpr")
(SETF (GET 'XML-QUERY::|StepExpr| :PRODUCTION) "
{33} StepExpr ::= (AxisStepExpr | OtherStepExpr)")
(SETF (GET 'XML-QUERY::|AxisStepExpr| :PRODUCTION) "
{34} AxisStepExpr ::= Axis NodeTest StepQualifier*")
(SETF (GET 'XML-QUERY::|OtherStepExpr| :PRODUCTION) "
{35} OtherStepExpr ::= PrimaryExpr StepQualifier*")
(SETF (GET 'XML-QUERY::|StepQualifier| :PRODUCTION) "
{36} StepQualifier ::= (PredicateExpr | TargetExpr)")
(SETF (GET 'XML-QUERY::|PredicateExpr| :PRODUCTION) "
     PredicateExpr ::= '[' Expr ']'")
(SETF (GET 'XML-QUERY::|TargetExpr| :PRODUCTION) "
     TargetExpr ::= '=>' NameTest")
(SETF (GET 'XML-QUERY::|Axis| :PRODUCTION) "
{37} Axis ::= ((NCName '::') | AtOp)")
(SETF (GET 'XML-QUERY::|PrimaryExpr| :PRODUCTION) "
{38} PrimaryExpr ::= (Dot | DotDot | KindTest | Variable | Literal | FunctionCall | NameTest | ParenthesizedExpr | CastExpr | ElementConstructor | CommentConstructor | PIConstructor)")
(SETF (GET 'XML-QUERY::|Literal| :PRODUCTION) "
{39} Literal ::= (NumericLiteral | StringLiteral)")
(SETF (GET 'XML-QUERY::|NodeTest| :PRODUCTION) "
{40} NodeTest ::= (NameTest | KindTest)")
(SETF (GET 'XML-QUERY::|NameTest| :PRODUCTION) "
{41} NameTest ::= NameTestPrefix? ((NCName | WildName))")
(SETF (GET 'XML-QUERY::|NameTestPrefix| :PRODUCTION) "
     NameTestPrefix ::= ((NCName | WildName)) ':'")
(SETF (GET 'XML-QUERY::|KindTest| :PRODUCTION) "
{42} KindTest ::= (PITest | CommentTest | TextTest | AnyKindTest)")
(SETF (GET 'XML-QUERY::|PITest| :PRODUCTION) "
{43} PITest ::= 'processing-instruction' '(' StringLiteral? ')'")
(SETF (GET 'XML-QUERY::|CommentTest| :PRODUCTION) "
{44} CommentTest ::= 'comment' '(' ')'")
(SETF (GET 'XML-QUERY::|TextTest| :PRODUCTION) "
{45} TextTest ::= 'text' '(' ')'")
(SETF (GET 'XML-QUERY::|AnyKindTest| :PRODUCTION) "
{46} AnyKindTest ::= 'node' '(' ')'")
(SETF (GET 'XML-QUERY::|ParenthesizedExpr| :PRODUCTION) "
{47} ParenthesizedExpr ::= '(' ExprSequence? ')'")
(SETF (GET 'XML-QUERY::|ExprSequence| :PRODUCTION) "
{48} ExprSequence ::= Expr (',' Expr)*")
(SETF (GET 'XML-QUERY::|FunctionCall| :PRODUCTION) "
{49} FunctionCall ::= QName '(' (Expr (',' Expr)*)? ')'")
(SETF (GET 'XML-QUERY::|CastExpr| :PRODUCTION) "
{50} CastExpr ::= (((CastOp 'as') | (TreatOp 'as'))) Datatype '(' Expr ')'")
(SETF (GET 'XML-QUERY::|Datatype| :PRODUCTION) "
{51} Datatype ::= QName")
(SETF (GET 'XML-QUERY::|ElementConstructor| :PRODUCTION) "
{52} ElementConstructor ::= ('<'
                             StartTag) (('/>' | ('>' ElementContent* EndTag)))")
(SETF (GET 'XML-QUERY::|StartTag| :PRODUCTION) "
     StartTag ::= NameSpec AttributeList? S*")
(SETF (GET 'XML-QUERY::|EndTag| :PRODUCTION) "
     EndTag ::= '</' (QName S?)? '>'")
(SETF (GET 'XML-QUERY::|NameSpec| :PRODUCTION) "
{53} NameSpec ::= (QName | ('{' Expr '}'))")
(SETF (GET 'XML-QUERY::|AttributeList| :PRODUCTION) "
{54} AttributeList ::= Attribute+")
(SETF (GET 'XML-QUERY::|Attribute| :PRODUCTION) "
     Attribute ::= S+ NameSpec S? '=' S? ((AttributeValue | EnclosedExpr))")
(SETF (GET 'XML-QUERY::|AttributeValue| :PRODUCTION) "
{55} AttributeValue ::= (('\"' AttributeValueContent* '\"') | ('''
                                                             AttributeValueContent*
                                                             '''))")
(SETF (GET 'XML-QUERY::|ElementContent| :PRODUCTION) "
{56} ElementContent ::= (CharData | ElementConstructor | EnclosedExpr | CDataSection | CharRef | PredefinedEntityRef | CommentConstructor | PIConstructor)")
(SETF (GET 'XML-QUERY::|AttributeValueContent| :PRODUCTION) "
{57} AttributeValueContent ::= (CharData | CharRef | EnclosedExpr | PredefinedEntityRef)")
(SETF (GET 'XML-QUERY::|CDataSection| :PRODUCTION) "
{58} CDataSection ::= '<![CDATA[' CDataCharData ']]>'")
(SETF (GET 'XML-QUERY::|EnclosedExpr| :PRODUCTION) "
{59} EnclosedExpr ::= '{' ExprSequence '}'")
(SETF (GET 'XML-QUERY::|CommentConstructor| :PRODUCTION) "
     CommentConstructor ::= '<!--' CharData '-->'")
(SETF (GET 'XML-QUERY::|PIConstructor| :PRODUCTION) "
     PIConstructor ::= '<?' NCName S? CharData '?>'")
(SETF (GET 'XML-QUERY::|StringLiteral| :PRODUCTION) "
{60} StringLiteral ::= (('\"' StringLiteralData '\"') | ('''
                                                       StringLiteralData
                                                       '''))")
(SETF (GET 'XML-QUERY::|Wildcard| :PRODUCTION) "
{62} Wildcard ::= ('*' | (NamePrefix ':*') | ('*:' NCName))")
(SETF (GET 'XML-QUERY::|Variable| :PRODUCTION) "
{63} Variable ::= '$' QName")
(SETF (GET 'XML-QUERY::|PredefinedEntityRef| :PRODUCTION) "
{64} PredefinedEntityRef ::= '&' EntityOp ';'")
(SETF (GET 'XML-QUERY::|CharRef| :PRODUCTION) "
{65} CharRef ::= '&#' CharRefData ';'")
(SETF (GET 'XML-QUERY::|QName| :PRODUCTION) "
     QName ::= QNamePrefix? NCName")
(SETF (GET 'XML-QUERY::|QNamePrefix| :PRODUCTION) "
     QNamePrefix ::= NCName ':'")
(DEFUN XML-QUERY::|QueryModuleList-Parser| (*ATN-INPUT &KEY ((:TRACE *ATN-TRACE*) *ATN-TRACE*)
                                            ((:TRACE-NETS *ATN-TRACE-NETS*) *ATN-TRACE-NETS*)
                                            ((:START-NAME *ATN-START-NAME) 'XML-QUERY::|QueryModuleList|)
                                            ((:MODE *ATN-MODE) :MULTIPLE) ((:REDUCE *ATN-REDUCE*) T)
                                            ((:REGISTER-WORDS *ATN-REGISTER-WORDS) NIL) &ALLOW-OTHER-KEYS &AUX)
  "// generated 2009.03.23T01:50:40 based on \"xml:bnf;xql-grammar.bnf\" from 2006.08.09T22:18:05.
//
// this is adapted from the bnf from the WD as of 20010607.
//
//  ------------------------------------------------------------------
/*
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this is the BNF for XML-QUERY.
  it is derived from <a href='http://www.w3.org/TR/2001/WD-xquery-20010607'>WD-xquery-20010607</a>.
  it is the input bnf for <a href='file://xml/code/xquery/xql-parser.lisp'>xql-parser.lisp</a>.
  </p>
  <p>
  nb. the production numbers correspond to those present in the recommendation.
  this formulation differs from the literal text of the recommendation in numerous regards.
  none of these differences is believed to affect the conformance of the resulting parser.
  <ul>
  <li>some phrases have been reformulated in order to permit the parser to
      disambiguate constituent terms.</li>
  </ul></p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='&copy'
            href='file://xml/sysdcl.lisp' />
 <COPYRIGHT YEAR='2001' AUTHOR='w3c' MARK='&copy'
            smtp='site-policy@w3.org'
            href='file://xml/W3C-copyrightsoft-19980720.html'>
  Copyright &copy; 2001 <a href='http://www.w3.org/'>World Wide Web Consortium</a>,
   (<a href='http://www.lcs.mit.edu/'>Massachusetts Institute of Technology</a>,
    <a href='http://www.inria.fr/'>Institut National de Recherche en Informatique et en Automatique</a>,
    <a href='http://www.keio.ac.jp/'>Keio University</a>).
   All Rights Reserved. http://www.w3.org/Consortium/Legal/
  </COPYRIGHT>
 <CHRONOLOGY>
  <DELTA DATE='20010913'>changed the name test production to make it unambiguous - more like
   the previous spec version. otherwise the sequence NCName ':*' parses to an initial QName w/o
   prefix and fails on the colon.</DELTA>
  <CHRONOLOGY>
 </DOCUMENTATION>
*/

[[01]]  QueryModuleList    ::= QueryModule ( ';' QueryModule)*
[[02]]  QueryModule        ::= ContextDecl* FunctionDefn* ExprSequence?
[[03]]  ContextDecl        ::= NamespaceDecl | SchemaDecl
        NamespaceDecl      ::= ('namespace' NCName '=' StringLiteral)
                             | ('default' 'namespace' '=' StringLiteral)
        SchemaDecl         ::= 'schema' SchemaName StringLiteral
        SchemaName         ::= StringLiteral
[[04]]  FunctionDefn       ::= 'define' 'function' QName '(' ParamList? ')'
                               ('returns' Datatype)? EnclosedExpr
[[05]]  ParamList          ::= Param (',' Param)*
[[06]]  Param              ::= Datatype? Variable
[[07]]  Expr               ::= SortExpr
                             | OrExpr
                             | AndExpr
                             | BeforeAfterExpr
                             | FlwrExpr
                             | IfExpr
                             | SomeExpr
                             | EveryExpr
                             | TypeSwitchExpr
                             | EqualityExpr
                             | RelationalExpr
                             | InstanceofExpr
                             | RangeExpr
                             | AdditiveExpr
                             | MultiplicativeExpr
                             | UnaryExpr
                             | UnionExpr
                             | IntersectExceptExpr
                             | PathExpr
[[08]]  SortExpr           ::= Expr 'sortby' '(' SortSpecList ')'
[[09]]  SortSpecList       ::= SortSpec (',' SortSpec)*
        SortSpec           ::= Expr SortOrder?
        SortOrder          ::= 'ascending' | 'descending'
[[10]]  OrExpr             ::= Expr 'or' ExprArg2
        ExprArg2           ::= Expr
[[11]]  AndExpr            ::= Expr 'and' ExprArg2
[[12]]  BeforeAfterExpr    ::= Expr BeforeAfterOp ExprArg2
        BeforeAfterOp      ::= 'before' | 'after'
[[13]]  FlwrExpr           ::= FlwrExprForLet+ WhereClause? ReturnClause
        FlwrExprForLet     ::= ForClause | LetClause
[[14]]  ForClause          ::= 'for' FlwrForBinding (',' FlwrForBinding)*
        FlwrForBinding     ::= Variable 'in' Expr 
[[15]]  LetClause          ::= 'let' FlwrLetBinding (',' FlwrLetBinding)*
        FlwrLetBinding     ::= Variable ':=' Expr
[[16]]  WhereClause        ::= 'where' Expr
        ReturnClause       ::= 'return' Expr
[[17]]  IfExpr             ::= 'if' '(' Expr ')' 'then' IfThenExpr 'else' IfElseExpr
        IfThenExpr         ::= Expr
        IfElseExpr         ::= Expr
[[18]]  SomeExpr           ::= 'some' Variable 'in' Expr 'satisfies' ExprTest
[[19]]  EveryExpr          ::= 'every' Variable 'in' Expr 'satisfies' ExprTest
        ExprTest           ::= Expr
[[20]]  TypeSwitchExpr     ::= 'typeswitch' '(' Expr ')' ('as' Variable)?
                                CaseClause+ 'default' 'return' DefaultExpr
        DefaultExpr        ::= Expr
[[21]]  CaseClause         ::= 'case' Datatype 'return' Expr
[[22]]  EqualityExpr       ::= Expr EqualityOp ExprArg2
        EqualityOp         ::= '=' | '!=' | '==' | '!=='
[[23]]  RelationalExpr     ::= Expr RelationalOp ExprArg2
        RelationalOp       ::= '<' | '<=' | '>' | '>='
[[24]]  InstanceofExpr     ::= Expr 'instanceof' OnlyOp? Datatype
        OnlyOp             ::= 'only'
[[25]]  RangeExpr          ::= Expr 'to' ExprArg2
[[26]]  AdditiveExpr       ::= Expr AdditiveOp ExprArg2
        AdditiveOp         ::= '+' | '-'
[[27]]  MultiplicativeExpr ::= Expr MultiplicativeOp ExprArg2
        MultiplicativeOp   ::= '*' | 'div' | 'mod'
[[28]]  UnaryExpr          ::= UnaryOp Expr
        UnaryOp            ::= '+' | '-'
[[29]]  UnionExpr          ::= Expr UnionOrOp ExprArg2
        UnionOrOp          ::= 'union' | '|'
[[30]]  IntersectExceptExpr ::= Expr IntersectExceptOp ExprArg2
        IntersectExceptOp ::= IntersectOp | ExceptOp
        IntersectOp        ::= 'intersect'
        ExceptOp           ::= 'except'
[[31]]  PathExpr           ::= RelativePathExpr
                             | (SingleSlash RelativePathExpr?)
                             | (DoubleSlash RelativePathExpr?)
        SingleSlash        ::= '/'
        DoubleSlash        ::= '//'
[[32]]  RelativePathExpr   ::= StepExpr RelatedStep*
        RelatedStep        ::= (SingleSlash | DoubleSlash) StepExpr
[[33]]  StepExpr           ::= AxisStepExpr | OtherStepExpr
[[34]]  AxisStepExpr       ::= Axis NodeTest StepQualifier*
[[35]]  OtherStepExpr      ::= PrimaryExpr StepQualifier*
[[36]]  StepQualifier      ::= PredicateExpr | TargetExpr
        PredicateExpr      ::= '[' Expr ']'
        TargetExpr         ::= '=>' NameTest
[[37]]  Axis               ::= (NCName '::') | AtOp
        AtOp               ::= '@'
[[38]]  PrimaryExpr        ::= Dot
                             | DotDot
                            // | NodeTest
                             | KindTest
                             | Variable
                             | Literal
                             | FunctionCall
                             | NameTest
                             | ParenthesizedExpr
                             | CastExpr
                             | ElementConstructor
                             | CommentConstructor
                             | PIConstructor
        Dot                ::= '.'
        DotDot             ::= '..'
[[39]]  Literal            ::= NumericLiteral | StringLiteral
[[40]]  NodeTest           ::= NameTest | KindTest
// [[41]]  NameTest           ::= QName | Wildcard
[[41]]  NameTest           ::= NameTestPrefix? ( NCName | WildName )
        NameTestPrefix     ::= ( NCName | WildName ) ':'
        WildName           ::= '*'
[[42]]  KindTest           ::= PITest | CommentTest | TextTest | AnyKindTest
[[43]]  PITest             ::= 'processing-instruction' '(' StringLiteral? ')'
[[44]]  CommentTest        ::= 'comment' '(' ')'
[[45]]  TextTest           ::= 'text' '(' ')'
[[46]]  AnyKindTest        ::= 'node' '(' ')'
[[47]]  ParenthesizedExpr  ::= '(' ExprSequence? ')' 
[[48]]  ExprSequence       ::= Expr (',' Expr)*
[[49]]  FunctionCall       ::= QName '(' (Expr (',' Expr)*)? ')'
[[50]]  CastExpr           ::= ((CastOp 'as') | (TreatOp 'as')) Datatype '(' Expr ')'
        CastOp             ::= 'CAST'
        TreatOp            ::= 'TREAT'
[[51]]  Datatype           ::= QName
[[52]]  ElementConstructor ::= ( '<' StartTag ) ( '/>' | ( '>' ElementContent* EndTag ) )
        StartTag           ::= NameSpec AttributeList? S*
        EndTag             ::= '</' (QName S?)? '>'
[[53]]  NameSpec           ::= QName | ( '{' Expr '}' )
[[54]]  AttributeList      ::= Attribute+
        Attribute          ::= S+ NameSpec S? '=' S? (AttributeValue | EnclosedExpr)
[[55]]  AttributeValue     ::= ( '\"' AttributeValueContent* '\"' )
                             | ( '\\'' AttributeValueContent* '\\'' )
[[56]]  ElementContent     ::= CharData
                             | ElementConstructor
                             | EnclosedExpr
                             | CDataSection
                             | CharRef
                             | PredefinedEntityRef
                             | CommentConstructor
                             | PIConstructor
[[57]]  AttributeValueContent ::=   CharData
                                | CharRef
                                | EnclosedExpr
                                | PredefinedEntityRef
[[58]]  CDataSection       ::= '<![CDATA[' CDataCharData ']]>'
[[59]]  EnclosedExpr       ::= '{' ExprSequence '}'

// extra's noted in WD, but not present in BNF
        CommentConstructor ::= '<!--' CharData '-->'
        PIConstructor      ::= '<?' NCName S? CharData '?>'

//    Precedence order of expressions, from highest precedence to lowest precedence
//    (within each precedence level, operators are applied from left to right):
//
// PathExpr
// IntersectExceptExpr
// UnionExpr
// UnaryExpr
// MultiplicativeExpr
// AdditiveExpr
// RangeExpr
// RelationalExpr, InstanceofExpr
// EqualityExpr
// FLWRExpr, IfExpr, SomeExpr, EveryExpr, TypeswitchExpr
// BeforeAfterExpr
// AndExpr
// OrExpr
// SortExpr
//
//    Lexical structure
//
[[60]]  StringLiteral     ::= ('\"' StringLiteralData '\"') | ('\\'' StringLiteralData '\\'')
// [[61]]  NumericLiteral    ::= ((\".\" [0-9]+) | ([0-9]+ (\".\" [0-9]+?)?)) ([eE] [+-]? [0-9]+)?
[[62]]  Wildcard          ::= '*' | ( NamePrefix ':*' ) | ( '*:' NCName )
        NamePrefix        ::= NCName
[[63]]  Variable          ::= '$' QName
[[64]]  PredefinedEntityRef    ::=  '&' EntityOp ';'
        EntityOp          ::= 'lt' | 'gt' | 'amp' | 'quot' | 'apos'
[[65]]  CharRef           ::= '&#' CharRefData ';'
//      CharRef           ::= '&#' ([0-9]+ | ('x' [0-9a-fA-F]+)) ';'

// additional terms

QName               ::= QNamePrefix? NCName
QNamePrefix         ::= NCName ':'


"
  (DECLARE (SPECIAL *ATN-REDUCE* *ATN-MODE *ATN-INPUT))
  (LET ((*ATN-LEVEL 0)
        (*ATN-WFST (|wfst-initialize| (|wfst-pop| *ATN-START-NAME)))
        (*ATN-STACK '(XML-QUERY::|QueryModuleList-Parser|))
        (*ATN-NODE NIL)
        (*ATN-PROPERTIES NIL)
        (*ATN-CLASS NIL)
        (XML-QUERY::|QueryModuleList-INDEX| -1)
        (XML-QUERY::|QueryModule-INDEX| -1)
        (XML-QUERY::|ContextDecl-INDEX| -1)
        (XML-QUERY::|NamespaceDecl-INDEX| -1)
        (XML-QUERY::|SchemaDecl-INDEX| -1)
        (XML-QUERY::|SchemaName-INDEX| -1)
        (XML-QUERY::|FunctionDefn-INDEX| -1)
        (XML-QUERY::|ParamList-INDEX| -1)
        (XML-QUERY::|Param-INDEX| -1)
        (XML-QUERY::|Expr-INDEX| -1)
        (XML-QUERY::|SortExpr-INDEX| -1)
        (XML-QUERY::|SortSpecList-INDEX| -1)
        (XML-QUERY::|SortSpec-INDEX| -1)
        (XML-QUERY::|OrExpr-INDEX| -1)
        (XML-QUERY::|ExprArg2-INDEX| -1)
        (XML-QUERY::|AndExpr-INDEX| -1)
        (XML-QUERY::|BeforeAfterExpr-INDEX| -1)
        (XML-QUERY::|FlwrExpr-INDEX| -1)
        (XML-QUERY::|FlwrExprForLet-INDEX| -1)
        (XML-QUERY::|ForClause-INDEX| -1)
        (XML-QUERY::|FlwrForBinding-INDEX| -1)
        (XML-QUERY::|LetClause-INDEX| -1)
        (XML-QUERY::|FlwrLetBinding-INDEX| -1)
        (XML-QUERY::|WhereClause-INDEX| -1)
        (XML-QUERY::|ReturnClause-INDEX| -1)
        (XML-QUERY::|IfExpr-INDEX| -1)
        (XML-QUERY::|IfThenExpr-INDEX| -1)
        (XML-QUERY::|IfElseExpr-INDEX| -1)
        (XML-QUERY::|SomeExpr-INDEX| -1)
        (XML-QUERY::|EveryExpr-INDEX| -1)
        (XML-QUERY::|ExprTest-INDEX| -1)
        (XML-QUERY::|TypeSwitchExpr-INDEX| -1)
        (XML-QUERY::|DefaultExpr-INDEX| -1)
        (XML-QUERY::|CaseClause-INDEX| -1)
        (XML-QUERY::|EqualityExpr-INDEX| -1)
        (XML-QUERY::|RelationalExpr-INDEX| -1)
        (XML-QUERY::|InstanceofExpr-INDEX| -1)
        (XML-QUERY::|RangeExpr-INDEX| -1)
        (XML-QUERY::|AdditiveExpr-INDEX| -1)
        (XML-QUERY::|MultiplicativeExpr-INDEX| -1)
        (XML-QUERY::|UnaryExpr-INDEX| -1)
        (XML-QUERY::|UnionExpr-INDEX| -1)
        (XML-QUERY::|IntersectExceptExpr-INDEX| -1)
        (XML-QUERY::|PathExpr-INDEX| -1)
        (XML-QUERY::|RelativePathExpr-INDEX| -1)
        (XML-QUERY::|RelatedStep-INDEX| -1)
        (XML-QUERY::|StepExpr-INDEX| -1)
        (XML-QUERY::|AxisStepExpr-INDEX| -1)
        (XML-QUERY::|OtherStepExpr-INDEX| -1)
        (XML-QUERY::|StepQualifier-INDEX| -1)
        (XML-QUERY::|PredicateExpr-INDEX| -1)
        (XML-QUERY::|TargetExpr-INDEX| -1)
        (XML-QUERY::|Axis-INDEX| -1)
        (XML-QUERY::|PrimaryExpr-INDEX| -1)
        (XML-QUERY::|Literal-INDEX| -1)
        (XML-QUERY::|NodeTest-INDEX| -1)
        (XML-QUERY::|NameTest-INDEX| -1)
        (XML-QUERY::|NameTestPrefix-INDEX| -1)
        (XML-QUERY::|KindTest-INDEX| -1)
        (XML-QUERY::|PITest-INDEX| -1)
        (XML-QUERY::|CommentTest-INDEX| -1)
        (XML-QUERY::|TextTest-INDEX| -1)
        (XML-QUERY::|AnyKindTest-INDEX| -1)
        (XML-QUERY::|ParenthesizedExpr-INDEX| -1)
        (XML-QUERY::|ExprSequence-INDEX| -1)
        (XML-QUERY::|FunctionCall-INDEX| -1)
        (XML-QUERY::|CastExpr-INDEX| -1)
        (XML-QUERY::|Datatype-INDEX| -1)
        (XML-QUERY::|ElementConstructor-INDEX| -1)
        (XML-QUERY::|StartTag-INDEX| -1)
        (XML-QUERY::|EndTag-INDEX| -1)
        (XML-QUERY::|NameSpec-INDEX| -1)
        (XML-QUERY::|AttributeList-INDEX| -1)
        (XML-QUERY::|Attribute-INDEX| -1)
        (XML-QUERY::|AttributeValue-INDEX| -1)
        (XML-QUERY::|ElementContent-INDEX| -1)
        (XML-QUERY::|AttributeValueContent-INDEX| -1)
        (XML-QUERY::|CDataSection-INDEX| -1)
        (XML-QUERY::|EnclosedExpr-INDEX| -1)
        (XML-QUERY::|CommentConstructor-INDEX| -1)
        (XML-QUERY::|PIConstructor-INDEX| -1)
        (XML-QUERY::|StringLiteral-INDEX| -1)
        (XML-QUERY::|Wildcard-INDEX| -1)
        (XML-QUERY::|Variable-INDEX| -1)
        (XML-QUERY::|PredefinedEntityRef-INDEX| -1)
        (XML-QUERY::|CharRef-INDEX| -1)
        (XML-QUERY::|QName-INDEX| -1)
        (XML-QUERY::|QNamePrefix-INDEX| -1)
        (ATN-NET-NAMES
         '(XML-QUERY::|QueryModuleList| XML-QUERY::|QueryModule| XML-QUERY::|ContextDecl| XML-QUERY::|NamespaceDecl|
           XML-QUERY::|SchemaDecl| XML-QUERY::|SchemaName| XML-QUERY::|FunctionDefn| XML-QUERY::|ParamList| XML-QUERY::|Param|
           XML-QUERY::|Expr| XML-QUERY::|SortExpr| XML-QUERY::|SortSpecList| XML-QUERY::|SortSpec| XML-QUERY::|OrExpr|
           XML-QUERY::|ExprArg2| XML-QUERY::|AndExpr| XML-QUERY::|BeforeAfterExpr| XML-QUERY::|FlwrExpr|
           XML-QUERY::|FlwrExprForLet| XML-QUERY::|ForClause| XML-QUERY::|FlwrForBinding| XML-QUERY::|LetClause|
           XML-QUERY::|FlwrLetBinding| XML-QUERY::|WhereClause| XML-QUERY::|ReturnClause| XML-QUERY::|IfExpr|
           XML-QUERY::|IfThenExpr| XML-QUERY::|IfElseExpr| XML-QUERY::|SomeExpr| XML-QUERY::|EveryExpr| XML-QUERY::|ExprTest|
           XML-QUERY::|TypeSwitchExpr| XML-QUERY::|DefaultExpr| XML-QUERY::|CaseClause| XML-QUERY::|EqualityExpr|
           XML-QUERY::|RelationalExpr| XML-QUERY::|InstanceofExpr| XML-QUERY::|RangeExpr| XML-QUERY::|AdditiveExpr|
           XML-QUERY::|MultiplicativeExpr| XML-QUERY::|UnaryExpr| XML-QUERY::|UnionExpr| XML-QUERY::|IntersectExceptExpr|
           XML-QUERY::|PathExpr| XML-QUERY::|RelativePathExpr| XML-QUERY::|RelatedStep| XML-QUERY::|StepExpr|
           XML-QUERY::|AxisStepExpr| XML-QUERY::|OtherStepExpr| XML-QUERY::|StepQualifier| XML-QUERY::|PredicateExpr|
           XML-QUERY::|TargetExpr| XML-QUERY::|Axis| XML-QUERY::|PrimaryExpr| XML-QUERY::|Literal| XML-QUERY::|NodeTest|
           XML-QUERY::|NameTest| XML-QUERY::|NameTestPrefix| XML-QUERY::|KindTest| XML-QUERY::|PITest| XML-QUERY::|CommentTest|
           XML-QUERY::|TextTest| XML-QUERY::|AnyKindTest| XML-QUERY::|ParenthesizedExpr| XML-QUERY::|ExprSequence|
           XML-QUERY::|FunctionCall| XML-QUERY::|CastExpr| XML-QUERY::|Datatype| XML-QUERY::|ElementConstructor|
           XML-QUERY::|StartTag| XML-QUERY::|EndTag| XML-QUERY::|NameSpec| XML-QUERY::|AttributeList| XML-QUERY::|Attribute|
           XML-QUERY::|AttributeValue| XML-QUERY::|ElementContent| XML-QUERY::|AttributeValueContent| XML-QUERY::|CDataSection|
           XML-QUERY::|EnclosedExpr| XML-QUERY::|CommentConstructor| XML-QUERY::|PIConstructor| XML-QUERY::|StringLiteral|
           XML-QUERY::|Wildcard| XML-QUERY::|Variable| XML-QUERY::|PredefinedEntityRef| XML-QUERY::|CharRef| XML-QUERY::|QName|
           XML-QUERY::|QNamePrefix|)))
    (DECLARE (SPECIAL XML-QUERY::|QueryModuleList-INDEX| XML-QUERY::|QueryModule-INDEX| XML-QUERY::|ContextDecl-INDEX|
              XML-QUERY::|NamespaceDecl-INDEX| XML-QUERY::|SchemaDecl-INDEX| XML-QUERY::|SchemaName-INDEX|
              XML-QUERY::|FunctionDefn-INDEX| XML-QUERY::|ParamList-INDEX| XML-QUERY::|Param-INDEX| XML-QUERY::|Expr-INDEX|
              XML-QUERY::|SortExpr-INDEX| XML-QUERY::|SortSpecList-INDEX| XML-QUERY::|SortSpec-INDEX| XML-QUERY::|OrExpr-INDEX|
              XML-QUERY::|ExprArg2-INDEX| XML-QUERY::|AndExpr-INDEX| XML-QUERY::|BeforeAfterExpr-INDEX| XML-QUERY::|FlwrExpr-INDEX|
              XML-QUERY::|FlwrExprForLet-INDEX| XML-QUERY::|ForClause-INDEX| XML-QUERY::|FlwrForBinding-INDEX|
              XML-QUERY::|LetClause-INDEX| XML-QUERY::|FlwrLetBinding-INDEX| XML-QUERY::|WhereClause-INDEX|
              XML-QUERY::|ReturnClause-INDEX| XML-QUERY::|IfExpr-INDEX| XML-QUERY::|IfThenExpr-INDEX| XML-QUERY::|IfElseExpr-INDEX|
              XML-QUERY::|SomeExpr-INDEX| XML-QUERY::|EveryExpr-INDEX| XML-QUERY::|ExprTest-INDEX|
              XML-QUERY::|TypeSwitchExpr-INDEX| XML-QUERY::|DefaultExpr-INDEX| XML-QUERY::|CaseClause-INDEX|
              XML-QUERY::|EqualityExpr-INDEX| XML-QUERY::|RelationalExpr-INDEX| XML-QUERY::|InstanceofExpr-INDEX|
              XML-QUERY::|RangeExpr-INDEX| XML-QUERY::|AdditiveExpr-INDEX| XML-QUERY::|MultiplicativeExpr-INDEX|
              XML-QUERY::|UnaryExpr-INDEX| XML-QUERY::|UnionExpr-INDEX| XML-QUERY::|IntersectExceptExpr-INDEX|
              XML-QUERY::|PathExpr-INDEX| XML-QUERY::|RelativePathExpr-INDEX| XML-QUERY::|RelatedStep-INDEX|
              XML-QUERY::|StepExpr-INDEX| XML-QUERY::|AxisStepExpr-INDEX| XML-QUERY::|OtherStepExpr-INDEX|
              XML-QUERY::|StepQualifier-INDEX| XML-QUERY::|PredicateExpr-INDEX| XML-QUERY::|TargetExpr-INDEX|
              XML-QUERY::|Axis-INDEX| XML-QUERY::|PrimaryExpr-INDEX| XML-QUERY::|Literal-INDEX| XML-QUERY::|NodeTest-INDEX|
              XML-QUERY::|NameTest-INDEX| XML-QUERY::|NameTestPrefix-INDEX| XML-QUERY::|KindTest-INDEX| XML-QUERY::|PITest-INDEX|
              XML-QUERY::|CommentTest-INDEX| XML-QUERY::|TextTest-INDEX| XML-QUERY::|AnyKindTest-INDEX|
              XML-QUERY::|ParenthesizedExpr-INDEX| XML-QUERY::|ExprSequence-INDEX| XML-QUERY::|FunctionCall-INDEX|
              XML-QUERY::|CastExpr-INDEX| XML-QUERY::|Datatype-INDEX| XML-QUERY::|ElementConstructor-INDEX|
              XML-QUERY::|StartTag-INDEX| XML-QUERY::|EndTag-INDEX| XML-QUERY::|NameSpec-INDEX| XML-QUERY::|AttributeList-INDEX|
              XML-QUERY::|Attribute-INDEX| XML-QUERY::|AttributeValue-INDEX| XML-QUERY::|ElementContent-INDEX|
              XML-QUERY::|AttributeValueContent-INDEX| XML-QUERY::|CDataSection-INDEX| XML-QUERY::|EnclosedExpr-INDEX|
              XML-QUERY::|CommentConstructor-INDEX| XML-QUERY::|PIConstructor-INDEX| XML-QUERY::|StringLiteral-INDEX|
              XML-QUERY::|Wildcard-INDEX| XML-QUERY::|Variable-INDEX| XML-QUERY::|PredefinedEntityRef-INDEX|
              XML-QUERY::|CharRef-INDEX| XML-QUERY::|QName-INDEX| XML-QUERY::|QNamePrefix-INDEX|))
    (UNLESS (FIND *ATN-START-NAME ATN-NET-NAMES)
      (ERROR "production not defined in system: ~s: ~s." *ATN-START-NAME 'XML-QUERY::|QueryModuleList-Parser|))
    (UNLESS (FBOUNDP *ATN-START-NAME)
      (ERROR "parse function missing: ~s: ~s." *ATN-START-NAME 'XML-QUERY::|QueryModuleList-Parser|))
    (HANDLER-BIND ((CONTINUABLE-PARSER-ERROR #'(LAMBDA (CONDITION) (SIGNAL CONDITION)))
                   (TERMINAL-PARSER-ERROR
                    #'(LAMBDA (CONDITION &AUX (ACTION (CONDITION-ACTION CONDITION)))
                        (ETYPECASE ACTION
                          (NULL)
                          (KEYWORD
                           (ECASE ACTION
                             (:ABORT
                              (WHEN *ATN-TRACE* (WARN "terminating parse on condition: ~a: Context ~s." CONDITION *ATN-INPUT))
                              (RETURN-FROM XML-QUERY::|QueryModuleList-Parser| (VALUES NIL CONDITION NIL)))
                             (:CONTINUE
                              (WHEN *ATN-TRACE* (WARN "continuing parse with condition: ~a: Context ~s." CONDITION *ATN-INPUT))
                              (CONTINUE CONDITION))
                             (:SIGNAL (WHEN *ATN-TRACE* (WARN "signaling parse condition: ~a: Context ~s." CONDITION *ATN-INPUT))
                              (SIGNAL CONDITION)
                              (WHEN *ATN-TRACE* (WARN "continuing parse with condition: ~a: Context ~s." CONDITION *ATN-INPUT))
                              (CONTINUE CONDITION))))
                          #'(FUNCALL ACTION))))
                   (ERROR #'(LAMBDA (CONDITION) (WHEN *ATN-TRACE* (WARN "parse raised condition: ~a." CONDITION)) NIL)))
                  (MULTIPLE-VALUE-BIND (RESULT INDEX SUCCESS)
                      (ATN-PARSE-SUBSTRUCTURE *ATN-START-NAME 0)
                    (|wfst-push| *ATN-START-NAME *ATN-WFST)
                    (COND (SUCCESS
                           (RETURN-FROM XML-QUERY::|QueryModuleList-Parser| (VALUES RESULT INDEX (|input.is-at-end| INDEX))))
                          (T (RETURN-FROM XML-QUERY::|QueryModuleList-Parser| (VALUES NIL INDEX NIL))))))))