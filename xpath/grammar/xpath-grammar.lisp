
(IN-PACKAGE "ATN-PARSER") 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-AbbreviatedStep|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-EqualityOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-RelationalOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-AdditiveOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-MultiplicativeOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-LocalPart|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-AxisName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-AbbreviatedAxisSpecifier|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-SingleDot|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-DoubleDot|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-SingleSlash|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-DoubleSlash|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-unionOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-plusOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-minusOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-eqOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-neqOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-ltOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-gtOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-leOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-geOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-andOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-orOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-modOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-divOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-timesOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-notOp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-WildName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|IS-NodeType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|LocationPath|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|AbsoluteLocationPath|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|RelativeLocationPath|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|Step|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|AxisSpecifier|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|NodeTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|TypeTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|PiTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|Predicate|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|PredicateExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|AbbreviatedAbsoluteLocationPath|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|Expr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|PrimaryExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|FunctionCall|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|Argument|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|UnionExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|PathExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|FilterExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|OrExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|AndExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|EqualityExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|RelationalExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|AdditiveExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|MultiplicativeExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|UnaryExpr|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|AdditiveInverse|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|FunctionName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|VariableReference|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|NameTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|PrefixTest|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|QName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|Prefix|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PATH::|LocationPath-Parser|)) 
(DEFUN XML-PATH::|IS-AbbreviatedStep| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (XML-PATH::|IS-SingleDot| ITEM) (XML-PATH::|IS-DoubleDot| ITEM)))))
(DEFUN XML-PATH::|IS-EqualityOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (XML-PATH::|IS-eqOp| ITEM) (XML-PATH::|IS-neqOp| ITEM)))))
(DEFUN XML-PATH::|IS-RelationalOp| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM (OR (XML-PATH::|IS-ltOp| ITEM) (XML-PATH::|IS-gtOp| ITEM) (XML-PATH::|IS-leOp| ITEM) (XML-PATH::|IS-geOp| ITEM)))))
(DEFUN XML-PATH::|IS-AdditiveOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (XML-PATH::|IS-plusOp| ITEM) (XML-PATH::|IS-minusOp| ITEM)))))
(DEFUN XML-PATH::|IS-MultiplicativeOp| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (XML-PATH::|IS-timesOp| ITEM) (XML-PATH::|IS-divOp| ITEM) (XML-PATH::|IS-modOp| ITEM)))))
(DEFUN XML-PATH::|IS-LocalPart| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (XML-PATH::|IS-NCName| ITEM)))))
(DEFUN XML-PATH::|IS-AxisName| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM
         (OR (EQ ITEM '|xml|:|ancestor|)
             (EQ ITEM '|xml|:|ancestor-or-self|)
             (EQ ITEM '|xml|:|attribute|)
             (EQ ITEM '|xml|:|child|)
             (EQ ITEM '|xml|:|descendant|)
             (EQ ITEM '|xml|:|descendant-or-self|)
             (EQ ITEM '|xml|:|following|)
             (EQ ITEM '|xml|:|following-sibling|)
             (EQ ITEM '|xml|:|namespace|)
             (EQ ITEM '|xml|:|parent|)
             (EQ ITEM '|xml|:|preceding|)
             (EQ ITEM '|xml|:|preceding-sibling|)
             (EQ ITEM '|xml|:|self|)))))
(DEFUN XML-PATH::|IS-AbbreviatedAxisSpecifier| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:@)))))
(DEFUN XML-PATH::|IS-SingleDot| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:\.)))))
(DEFUN XML-PATH::|IS-DoubleDot| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:\..)))))
(DEFUN XML-PATH::|IS-SingleSlash| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:/)))))
(DEFUN XML-PATH::|IS-DoubleSlash| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|://)))))
(DEFUN XML-PATH::|IS-unionOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:\|)))))
(DEFUN XML-PATH::|IS-plusOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:+)))))
(DEFUN XML-PATH::|IS-minusOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:-)))))
(DEFUN XML-PATH::|IS-eqOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:=)))))
(DEFUN XML-PATH::|IS-neqOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:!=)))))
(DEFUN XML-PATH::|IS-ltOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:<)))))
(DEFUN XML-PATH::|IS-gtOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:>)))))
(DEFUN XML-PATH::|IS-leOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:<=)))))
(DEFUN XML-PATH::|IS-geOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:>=)))))
(DEFUN XML-PATH::|IS-andOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:|and|)))))
(DEFUN XML-PATH::|IS-orOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:|or|)))))
(DEFUN XML-PATH::|IS-modOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:|mod|)))))
(DEFUN XML-PATH::|IS-divOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:|div|)))))
(DEFUN XML-PATH::|IS-timesOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:*)))))
(DEFUN XML-PATH::|IS-notOp| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:|not|)))))
(DEFUN XML-PATH::|IS-WildName| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:*)))))
(DEFUN XML-PATH::|IS-NodeType| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM
         (OR (EQ ITEM '|xml|:|comment|)
             (EQ ITEM '|xml|:|text|)
             (EQ ITEM '|xml|:|processing-instruction|)
             (EQ ITEM '|xml|:|node|)))))
(DEFUN XML-PATH::|LocationPath| (INDEX &AUX (XML-PATH::|AbsoluteLocationPath| NIL) (XML-PATH::|RelativeLocationPath| NIL))
  "{1 } LocationPath ::= (RelativeLocationPath | AbsoluteLocationPath)
(|AbsoluteLocationPath| |RelativeLocationPath|)"
  (DECLARE (SPECIAL XML-PATH::|LocationPath-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|LocationPath-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|LocationPath-INDEX| INDEX)
      (LET ((XML-PATH::|LocationPath-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|LocationPath| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|LocationPath-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|LocationPath|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|LocationPath|)
                                 (RETURN-FROM XML-PATH::|LocationPath| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|LocationPath| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|LocationPath.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|LocationPath.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|LocationPath|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|LocationPath|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|LocationPath|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AbsoluteLocationPath|
                                                         XML-PATH::|AbsoluteLocationPath|
                                                         'XML-PATH::|RelativeLocationPath|
                                                         XML-PATH::|RelativeLocationPath|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|LocationPath-Constructor|
                                                    XML-PATH::|AbsoluteLocationPath|
                                                    XML-PATH::|RelativeLocationPath|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|LocationPath|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AbsoluteLocationPath|
                                                                          XML-PATH::|RelativeLocationPath|)))
                                                      'XML-PATH::|LocationPath|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|LocationPath/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|LocationPath/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|LocationPath/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|LocationPath/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|RelativeLocationPath|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|RelativeLocationPath| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|RelativeLocationPath| RESULT))
                                                    (XML-PATH::|LocationPath.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|RelativeLocationPath|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|AbsoluteLocationPath|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|AbsoluteLocationPath| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|AbsoluteLocationPath| RESULT))
                                                    (XML-PATH::|LocationPath.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|AbsoluteLocationPath|) NIL))))
                                         (XML-PATH::|LocationPath/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|LocationPath.2| XML-PATH::|LocationPath/fail.3|
                                  XML-PATH::|LocationPath/start.1|))
                        (XML-PATH::|LocationPath/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|LocationPath| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|AbsoluteLocationPath| (INDEX &AUX (XML-PATH::|AbbreviatedAbsoluteLocationPath| NIL)
                                         (XML-PATH::|RelativeLocationPath| NIL) (XML-PATH::|SingleSlash| NIL))
  "{2 } AbsoluteLocationPath ::= ((SingleSlash
                                RelativeLocationPath?) | AbbreviatedAbsoluteLocationPath)
(|AbbreviatedAbsoluteLocationPath| |RelativeLocationPath| |SingleSlash|)"
  (DECLARE (SPECIAL XML-PATH::|AbsoluteLocationPath-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|AbsoluteLocationPath-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|AbsoluteLocationPath-INDEX| INDEX)
      (LET ((XML-PATH::|AbsoluteLocationPath-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|AbsoluteLocationPath| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|AbsoluteLocationPath-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|AbsoluteLocationPath|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|AbsoluteLocationPath|)
                                 (RETURN-FROM XML-PATH::|AbsoluteLocationPath| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|AbsoluteLocationPath| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|AbsoluteLocationPath.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbsoluteLocationPath.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|AbsoluteLocationPath|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|AbsoluteLocationPath|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|AbsoluteLocationPath|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AbbreviatedAbsoluteLocationPath|
                                                         XML-PATH::|AbbreviatedAbsoluteLocationPath|
                                                         'XML-PATH::|RelativeLocationPath|
                                                         XML-PATH::|RelativeLocationPath|
                                                         'XML-PATH::|SingleSlash|
                                                         XML-PATH::|SingleSlash|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|AbsoluteLocationPath-Constructor|
                                                    XML-PATH::|AbbreviatedAbsoluteLocationPath|
                                                    XML-PATH::|RelativeLocationPath|
                                                    XML-PATH::|SingleSlash|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|AbsoluteLocationPath|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AbbreviatedAbsoluteLocationPath|
                                                                          XML-PATH::|RelativeLocationPath|
                                                                          XML-PATH::|SingleSlash|)))
                                                      'XML-PATH::|AbsoluteLocationPath|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|SingleSlash|)
                                     (COND ((XML-PATH::|IS-SingleSlash| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|SingleSlash|)
                                            (SETF XML-PATH::|SingleSlash|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|SingleSlash-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|SingleSlash| |item|)
                                                          'XML-PATH::|SingleSlash|)))
                                            (XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|SingleSlash|) NIL)))))
                               (XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|RelativeLocationPath|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|RelativeLocationPath| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|RelativeLocationPath| RESULT))
                                              (XML-PATH::|AbsoluteLocationPath.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|RelativeLocationPath|)
                                              (XML-PATH::|AbsoluteLocationPath.2| INDEX)))))))
                               (XML-PATH::|AbsoluteLocationPath/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|AbsoluteLocationPath/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|AbsoluteLocationPath/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbsoluteLocationPath/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.4|)
                                           (XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|AbbreviatedAbsoluteLocationPath|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|AbbreviatedAbsoluteLocationPath| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|AbbreviatedAbsoluteLocationPath| RESULT))
                                                    (XML-PATH::|AbsoluteLocationPath.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|AbbreviatedAbsoluteLocationPath|) NIL))))
                                         (XML-PATH::|AbsoluteLocationPath/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|AbsoluteLocationPath.2|
                                  XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.4|
                                  XML-PATH::|AbsoluteLocationPath/AbsoluteLocationPath.2.5| XML-PATH::|AbsoluteLocationPath/fail.3|
                                  XML-PATH::|AbsoluteLocationPath/start.1|))
                        (XML-PATH::|AbsoluteLocationPath/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|AbsoluteLocationPath| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|RelativeLocationPath| (INDEX &AUX (XML-PATH::|DoubleSlash| NIL) (XML-PATH::|RelativeLocationPath| NIL)
                                         (XML-PATH::|SingleSlash| NIL) (XML-PATH::|Step| NIL))
  "{3 } RelativeLocationPath ::= Step (((SingleSlash | DoubleSlash))
                                    RelativeLocationPath)?
(|DoubleSlash| |RelativeLocationPath| |SingleSlash| |Step|)"
  (DECLARE (SPECIAL XML-PATH::|RelativeLocationPath-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|RelativeLocationPath-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|RelativeLocationPath-INDEX| INDEX)
      (LET ((XML-PATH::|RelativeLocationPath-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|RelativeLocationPath| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|RelativeLocationPath-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|RelativeLocationPath|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|RelativeLocationPath|)
                                 (RETURN-FROM XML-PATH::|RelativeLocationPath| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|RelativeLocationPath| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|RelativeLocationPath.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelativeLocationPath.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|RelativeLocationPath|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|RelativeLocationPath|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|RelativeLocationPath|
                                                   INDEX
                                                   (LIST 'XML-PATH::|DoubleSlash|
                                                         XML-PATH::|DoubleSlash|
                                                         'XML-PATH::|RelativeLocationPath|
                                                         XML-PATH::|RelativeLocationPath|
                                                         'XML-PATH::|SingleSlash|
                                                         XML-PATH::|SingleSlash|
                                                         'XML-PATH::|Step|
                                                         XML-PATH::|Step|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|RelativeLocationPath-Constructor|
                                                    XML-PATH::|DoubleSlash|
                                                    XML-PATH::|RelativeLocationPath|
                                                    XML-PATH::|SingleSlash|
                                                    XML-PATH::|Step|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|RelativeLocationPath|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|DoubleSlash|
                                                                          XML-PATH::|RelativeLocationPath|
                                                                          XML-PATH::|SingleSlash|
                                                                          XML-PATH::|Step|)))
                                                      'XML-PATH::|RelativeLocationPath|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|RelativeLocationPath/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|RelativeLocationPath/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.5|)
                                     (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|RelativeLocationPath.2|)
                                     (XML-PATH::|RelativeLocationPath.2| INDEX))))
                               (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.5|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|SingleSlash|)
                                           (COND ((XML-PATH::|IS-SingleSlash| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|SingleSlash|)
                                                  (SETF XML-PATH::|SingleSlash|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|SingleSlash-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|SingleSlash| |item|)
                                                                'XML-PATH::|SingleSlash|)))
                                                  (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.6| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|SingleSlash|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|DoubleSlash|)
                                           (COND ((XML-PATH::|IS-DoubleSlash| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|DoubleSlash|)
                                                  (SETF XML-PATH::|DoubleSlash|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|DoubleSlash-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|DoubleSlash| |item|)
                                                                'XML-PATH::|DoubleSlash|)))
                                                  (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.6| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|DoubleSlash|) NIL)))
                                         NIL))))
                               (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|RelativeLocationPath|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|RelativeLocationPath| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|RelativeLocationPath| RESULT))
                                              (XML-PATH::|RelativeLocationPath.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|RelativeLocationPath|) NIL))))))
                               (XML-PATH::|RelativeLocationPath/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelativeLocationPath/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Step|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Step| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Step| RESULT))
                                              (XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|Step|)
                                              (XML-PATH::|RelativeLocationPath/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|RelativeLocationPath.2| XML-PATH::|RelativeLocationPath/fail.3|
                                  XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.4|
                                  XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.5|
                                  XML-PATH::|RelativeLocationPath/RelativeLocationPath.2.6|
                                  XML-PATH::|RelativeLocationPath/start.1|))
                        (XML-PATH::|RelativeLocationPath/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|RelativeLocationPath| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|Step| (INDEX &AUX (XML-PATH::|AbbreviatedStep| NIL) (XML-PATH::|AxisSpecifier| NIL) (XML-PATH::|NodeTest| NIL)
                         (XML-PATH::|Predicate| NIL))
  "{4 } Step ::= ((AxisSpecifier NodeTest Predicate*) | (NodeTest
                                                      Predicate*) | AbbreviatedStep)
(|AbbreviatedStep| |AxisSpecifier| |NodeTest| |Predicate|)"
  (DECLARE (SPECIAL XML-PATH::|Step-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|Step-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|Step-INDEX| INDEX)
      (LET ((XML-PATH::|Step-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|Step| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|Step-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|Step|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|Step|)
                                 (RETURN-FROM XML-PATH::|Step| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|Step| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|Step.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step.10|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Predicate|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Predicate| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Predicate| (CONS RESULT XML-PATH::|Predicate|)))
                                              (XML-PATH::|Step.10| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Predicate|) (XML-PATH::|Step.2| INDEX)))))))
                               (XML-PATH::|Step.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|Step|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|Step|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|Step|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AbbreviatedStep|
                                                         XML-PATH::|AbbreviatedStep|
                                                         'XML-PATH::|AxisSpecifier|
                                                         XML-PATH::|AxisSpecifier|
                                                         'XML-PATH::|NodeTest|
                                                         XML-PATH::|NodeTest|
                                                         'XML-PATH::|Predicate|
                                                         XML-PATH::|Predicate|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|Step-Constructor|
                                                    XML-PATH::|AbbreviatedStep|
                                                    XML-PATH::|AxisSpecifier|
                                                    XML-PATH::|NodeTest|
                                                    XML-PATH::|Predicate|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|Step|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AbbreviatedStep|
                                                                          XML-PATH::|AxisSpecifier|
                                                                          XML-PATH::|NodeTest|
                                                                          XML-PATH::|Predicate|)))
                                                      'XML-PATH::|Step|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|Step.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Predicate|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Predicate| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Predicate| (CONS RESULT XML-PATH::|Predicate|)))
                                              (XML-PATH::|Step.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Predicate|) (XML-PATH::|Step.2| INDEX)))))))
                               (XML-PATH::|Step/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PATH::|Step/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|Step/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK (JUMP XML-PATH::|Step/Step.2.4|) (XML-PATH::|Step/Step.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK (JUMP XML-PATH::|Step/Step.2.8|) (XML-PATH::|Step/Step.2.8| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|AbbreviatedStep|)
                                           (COND ((XML-PATH::|IS-AbbreviatedStep| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|AbbreviatedStep|)
                                                  (SETF XML-PATH::|AbbreviatedStep|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|AbbreviatedStep-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|AbbreviatedStep| |item|)
                                                                'XML-PATH::|AbbreviatedStep|)))
                                                  (XML-PATH::|Step.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|AbbreviatedStep|) NIL)))
                                         (XML-PATH::|Step/fail.3| INDEX)))))
                               (XML-PATH::|Step/Step.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step/Step.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|AxisSpecifier|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|AxisSpecifier| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|AxisSpecifier| RESULT))
                                              (XML-PATH::|Step/Step.2.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|AxisSpecifier|) NIL))))))
                               (XML-PATH::|Step/Step.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step/Step.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|NodeTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|NodeTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|NodeTest| RESULT))
                                              (XML-PATH::|Step/Step.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|NodeTest|) NIL))))))
                               (XML-PATH::|Step/Step.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step/Step.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Predicate|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Predicate| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Predicate| (CONS RESULT XML-PATH::|Predicate|)))
                                              (XML-PATH::|Step.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Predicate|) (XML-PATH::|Step.2| INDEX)))))))
                               (XML-PATH::|Step/Step.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step/Step.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|NodeTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|NodeTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|NodeTest| RESULT))
                                              (XML-PATH::|Step/Step.2.9| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|NodeTest|) NIL))))))
                               (XML-PATH::|Step/Step.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Step/Step.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Predicate|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Predicate| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Predicate| (CONS RESULT XML-PATH::|Predicate|)))
                                              (XML-PATH::|Step.10| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Predicate|) (XML-PATH::|Step.2| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|Step.10| XML-PATH::|Step.2| XML-PATH::|Step.7|
                                  XML-PATH::|Step/fail.3| XML-PATH::|Step/start.1| XML-PATH::|Step/Step.2.4|
                                  XML-PATH::|Step/Step.2.5| XML-PATH::|Step/Step.2.6| XML-PATH::|Step/Step.2.8|
                                  XML-PATH::|Step/Step.2.9|))
                        (XML-PATH::|Step/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|Step| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|AxisSpecifier| (INDEX &AUX (XML-PATH::|AbbreviatedAxisSpecifier| NIL) (XML-PATH::|AxisName| NIL))
  "{5 } AxisSpecifier ::= ((AxisName '::') | AbbreviatedAxisSpecifier)
(|AbbreviatedAxisSpecifier| |AxisName|)"
  (DECLARE (SPECIAL XML-PATH::|AxisSpecifier-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|AxisSpecifier-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|AxisSpecifier-INDEX| INDEX)
      (LET ((XML-PATH::|AxisSpecifier-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|AxisSpecifier| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|AxisSpecifier-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|AxisSpecifier|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|AxisSpecifier|)
                                 (RETURN-FROM XML-PATH::|AxisSpecifier| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|AxisSpecifier| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|AxisSpecifier.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AxisSpecifier.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|AxisSpecifier|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|AxisSpecifier|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|AxisSpecifier|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AbbreviatedAxisSpecifier|
                                                         XML-PATH::|AbbreviatedAxisSpecifier|
                                                         'XML-PATH::|AxisName|
                                                         XML-PATH::|AxisName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|AxisSpecifier-Constructor|
                                                    XML-PATH::|AbbreviatedAxisSpecifier|
                                                    XML-PATH::|AxisName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|AxisSpecifier|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AbbreviatedAxisSpecifier|
                                                                          XML-PATH::|AxisName|)))
                                                      'XML-PATH::|AxisSpecifier|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|AxisSpecifier/AxisSpecifier.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AxisSpecifier/AxisSpecifier.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|AxisName|)
                                     (COND ((XML-PATH::|IS-AxisName| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|AxisName|)
                                            (SETF XML-PATH::|AxisName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|AxisName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|AxisName| |item|)
                                                          'XML-PATH::|AxisName|)))
                                            (XML-PATH::|AxisSpecifier/AxisSpecifier.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|AxisName|) NIL)))))
                               (XML-PATH::|AxisSpecifier/AxisSpecifier.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AxisSpecifier/AxisSpecifier.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|::|)
                                     (COND ((EQ |item| '|xml|:|::|)
                                            (SETF *ATN-TERM* '|xml|:|::|)
                                            (XML-PATH::|AxisSpecifier.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|::|) NIL)))))
                               (XML-PATH::|AxisSpecifier/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|AxisSpecifier/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|AxisSpecifier/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AxisSpecifier/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PATH::|AxisSpecifier/AxisSpecifier.2.4|)
                                           (XML-PATH::|AxisSpecifier/AxisSpecifier.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|AbbreviatedAxisSpecifier|)
                                           (COND ((XML-PATH::|IS-AbbreviatedAxisSpecifier| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|AbbreviatedAxisSpecifier|)
                                                  (SETF XML-PATH::|AbbreviatedAxisSpecifier|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM
                                                              #'XML-PATH::|AbbreviatedAxisSpecifier-Constructor|
                                                              |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|AbbreviatedAxisSpecifier| |item|)
                                                                'XML-PATH::|AbbreviatedAxisSpecifier|)))
                                                  (XML-PATH::|AxisSpecifier.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|AbbreviatedAxisSpecifier|) NIL)))
                                         (XML-PATH::|AxisSpecifier/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|AxisSpecifier.2| XML-PATH::|AxisSpecifier/AxisSpecifier.2.4|
                                  XML-PATH::|AxisSpecifier/AxisSpecifier.2.5| XML-PATH::|AxisSpecifier/fail.3|
                                  XML-PATH::|AxisSpecifier/start.1|))
                        (XML-PATH::|AxisSpecifier/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|AxisSpecifier| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|NodeTest| (INDEX &AUX (XML-PATH::|NameTest| NIL) (XML-PATH::|PiTest| NIL) (XML-PATH::|TypeTest| NIL))
  "{7 } NodeTest ::= (NameTest | TypeTest | PiTest)
(|NameTest| |PiTest| |TypeTest|)"
  (DECLARE (SPECIAL XML-PATH::|NodeTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|NodeTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|NodeTest-INDEX| INDEX)
      (LET ((XML-PATH::|NodeTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|NodeTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|NodeTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|NodeTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|NodeTest|)
                                 (RETURN-FROM XML-PATH::|NodeTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|NodeTest| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|NodeTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|NodeTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|NodeTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|NodeTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|NodeTest|
                                                   INDEX
                                                   (LIST 'XML-PATH::|NameTest|
                                                         XML-PATH::|NameTest|
                                                         'XML-PATH::|PiTest|
                                                         XML-PATH::|PiTest|
                                                         'XML-PATH::|TypeTest|
                                                         XML-PATH::|TypeTest|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|NodeTest-Constructor|
                                                    XML-PATH::|NameTest|
                                                    XML-PATH::|PiTest|
                                                    XML-PATH::|TypeTest|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|NodeTest|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|NameTest|
                                                                          XML-PATH::|PiTest|
                                                                          XML-PATH::|TypeTest|)))
                                                      'XML-PATH::|NodeTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|NodeTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|NodeTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|NodeTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|NodeTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|NameTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|NameTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|NameTest| RESULT))
                                                    (XML-PATH::|NodeTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|NameTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|TypeTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|TypeTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|TypeTest| RESULT))
                                                    (XML-PATH::|NodeTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|TypeTest|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|PiTest|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|PiTest| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|PiTest| RESULT))
                                                    (XML-PATH::|NodeTest.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|PiTest|) NIL))))
                                         (XML-PATH::|NodeTest/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|NodeTest.2| XML-PATH::|NodeTest/fail.3|
                                  XML-PATH::|NodeTest/start.1|))
                        (XML-PATH::|NodeTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|NodeTest| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|TypeTest| (INDEX &AUX (XML-PATH::|NodeType| NIL))
  "TypeTest ::= NodeType '(' ')'
(|NodeType|)"
  (DECLARE (SPECIAL XML-PATH::|TypeTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|TypeTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|TypeTest-INDEX| INDEX)
      (LET ((XML-PATH::|TypeTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|TypeTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|TypeTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|TypeTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|TypeTest|)
                                 (RETURN-FROM XML-PATH::|TypeTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|TypeTest| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|TypeTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|TypeTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|TypeTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|TypeTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|TypeTest|
                                                   INDEX
                                                   (LIST 'XML-PATH::|NodeType| XML-PATH::|NodeType|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|TypeTest-Constructor| XML-PATH::|NodeType|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|TypeTest| (DELETE NIL (LIST XML-PATH::|NodeType|)))
                                                      'XML-PATH::|TypeTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|TypeTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|TypeTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|TypeTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|TypeTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|NodeType|)
                                     (COND ((XML-PATH::|IS-NodeType| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|NodeType|)
                                            (SETF XML-PATH::|NodeType|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|NodeType-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|NodeType| |item|)
                                                          'XML-PATH::|NodeType|)))
                                            (XML-PATH::|TypeTest/TypeTest.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|NodeType|) (XML-PATH::|TypeTest/fail.3| INDEX))))))
                               (XML-PATH::|TypeTest/TypeTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|TypeTest/TypeTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PATH::|TypeTest/TypeTest.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-PATH::|TypeTest/fail.3| INDEX))))))
                               (XML-PATH::|TypeTest/TypeTest.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|TypeTest/TypeTest.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\)) (SETF *ATN-TERM* '|xml|:\)) (XML-PATH::|TypeTest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-PATH::|TypeTest/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|TypeTest.2| XML-PATH::|TypeTest/fail.3|
                                  XML-PATH::|TypeTest/start.1| XML-PATH::|TypeTest/TypeTest.2.4|
                                  XML-PATH::|TypeTest/TypeTest.2.5|))
                        (XML-PATH::|TypeTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|TypeTest| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|PiTest| (INDEX &AUX (XML-PATH::|Literal| NIL))
  "PiTest ::= 'processing-instruction' '(' Literal ')'
(|Literal|)"
  (DECLARE (SPECIAL XML-PATH::|PiTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|PiTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|PiTest-INDEX| INDEX)
      (LET ((XML-PATH::|PiTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|PiTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|PiTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|PiTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|PiTest|)
                                 (RETURN-FROM XML-PATH::|PiTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|PiTest| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|PiTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PiTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|PiTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|PiTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|PiTest|
                                                   INDEX
                                                   (LIST 'XML-PATH::|Literal| XML-PATH::|Literal|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|PiTest-Constructor| XML-PATH::|Literal|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|PiTest| (DELETE NIL (LIST XML-PATH::|Literal|)))
                                                      'XML-PATH::|PiTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|PiTest/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PATH::|PiTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|PiTest/PiTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PiTest/PiTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PATH::|PiTest/PiTest.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-PATH::|PiTest/fail.3| INDEX))))))
                               (XML-PATH::|PiTest/PiTest.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PiTest/PiTest.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PATH::|Literal|)
                                     (COND ((XML-PATH::|IS-Literal| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|Literal|)
                                            (SETF XML-PATH::|Literal|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|Literal-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|Literal| |item|)
                                                          'XML-PATH::|Literal|)))
                                            (XML-PATH::|PiTest/PiTest.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PATH::|Literal|) (XML-PATH::|PiTest/fail.3| INDEX))))))
                               (XML-PATH::|PiTest/PiTest.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PiTest/PiTest.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\)) (SETF *ATN-TERM* '|xml|:\)) (XML-PATH::|PiTest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-PATH::|PiTest/fail.3| INDEX))))))
                               (XML-PATH::|PiTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PiTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|processing-instruction|)
                                     (COND ((EQ |item| '|xml|:|processing-instruction|)
                                            (SETF *ATN-TERM* '|xml|:|processing-instruction|)
                                            (XML-PATH::|PiTest/PiTest.2.4| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* '|xml|:|processing-instruction|)
                                            (XML-PATH::|PiTest/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|PiTest.2| XML-PATH::|PiTest/fail.3| XML-PATH::|PiTest/PiTest.2.4|
                                  XML-PATH::|PiTest/PiTest.2.5| XML-PATH::|PiTest/PiTest.2.6| XML-PATH::|PiTest/start.1|))
                        (XML-PATH::|PiTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|PiTest| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|Predicate| (INDEX &AUX (XML-PATH::|PredicateExpr| NIL))
  "{8 } Predicate ::= '[' PredicateExpr ']'
(|PredicateExpr|)"
  (DECLARE (SPECIAL XML-PATH::|Predicate-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|Predicate-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|Predicate-INDEX| INDEX)
      (LET ((XML-PATH::|Predicate-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|Predicate| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|Predicate-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|Predicate|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|Predicate|)
                                 (RETURN-FROM XML-PATH::|Predicate| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|Predicate| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|Predicate.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Predicate.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|Predicate|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|Predicate|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|Predicate|
                                                   INDEX
                                                   (LIST 'XML-PATH::|PredicateExpr| XML-PATH::|PredicateExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|Predicate-Constructor| XML-PATH::|PredicateExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|Predicate| (DELETE NIL (LIST XML-PATH::|PredicateExpr|)))
                                                      'XML-PATH::|Predicate|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|Predicate/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|Predicate/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|Predicate/Predicate.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Predicate/Predicate.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|PredicateExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|PredicateExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|PredicateExpr| RESULT))
                                              (XML-PATH::|Predicate/Predicate.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|PredicateExpr|)
                                              (XML-PATH::|Predicate/fail.3| INDEX)))))))
                               (XML-PATH::|Predicate/Predicate.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Predicate/Predicate.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:])
                                     (COND ((EQ |item| '|xml|:]) (SETF *ATN-TERM* '|xml|:]) (XML-PATH::|Predicate.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]) (XML-PATH::|Predicate/fail.3| INDEX))))))
                               (XML-PATH::|Predicate/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Predicate/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:[)
                                     (COND ((EQ |item| '|xml|:[)
                                            (SETF *ATN-TERM* '|xml|:[)
                                            (XML-PATH::|Predicate/Predicate.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:[) (XML-PATH::|Predicate/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|Predicate.2| XML-PATH::|Predicate/fail.3|
                                  XML-PATH::|Predicate/Predicate.2.4| XML-PATH::|Predicate/Predicate.2.5|
                                  XML-PATH::|Predicate/start.1|))
                        (XML-PATH::|Predicate/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|Predicate| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|PredicateExpr| (INDEX &AUX (XML-PATH::|Expr| NIL))
  "{9 } PredicateExpr ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-PATH::|PredicateExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|PredicateExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|PredicateExpr-INDEX| INDEX)
      (LET ((XML-PATH::|PredicateExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|PredicateExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|PredicateExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|PredicateExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|PredicateExpr|)
                                 (RETURN-FROM XML-PATH::|PredicateExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|PredicateExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|PredicateExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PredicateExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|PredicateExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|PredicateExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|PredicateExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|Expr| XML-PATH::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|PredicateExpr-Constructor| XML-PATH::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|PredicateExpr| (DELETE NIL (LIST XML-PATH::|Expr|)))
                                                      'XML-PATH::|PredicateExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|PredicateExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|PredicateExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|PredicateExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PredicateExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Expr| RESULT))
                                              (XML-PATH::|PredicateExpr.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|Expr|)
                                              (XML-PATH::|PredicateExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|PredicateExpr.2| XML-PATH::|PredicateExpr/fail.3|
                                  XML-PATH::|PredicateExpr/start.1|))
                        (XML-PATH::|PredicateExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|PredicateExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|AbbreviatedAbsoluteLocationPath| (INDEX &AUX (XML-PATH::|DoubleSlash| NIL)
                                                    (XML-PATH::|RelativeLocationPath| NIL))
  "{10} AbbreviatedAbsoluteLocationPath ::= DoubleSlash RelativeLocationPath
(|DoubleSlash| |RelativeLocationPath|)"
  (DECLARE (SPECIAL XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX| INDEX)
      (LET ((XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|AbbreviatedAbsoluteLocationPath| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|AbbreviatedAbsoluteLocationPath|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|AbbreviatedAbsoluteLocationPath|)
                                 (RETURN-FROM XML-PATH::|AbbreviatedAbsoluteLocationPath| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|AbbreviatedAbsoluteLocationPath| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|AbbreviatedAbsoluteLocationPath.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbbreviatedAbsoluteLocationPath.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|AbbreviatedAbsoluteLocationPath|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|AbbreviatedAbsoluteLocationPath|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|AbbreviatedAbsoluteLocationPath|
                                                   INDEX
                                                   (LIST 'XML-PATH::|DoubleSlash|
                                                         XML-PATH::|DoubleSlash|
                                                         'XML-PATH::|RelativeLocationPath|
                                                         XML-PATH::|RelativeLocationPath|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|AbbreviatedAbsoluteLocationPath-Constructor|
                                                    XML-PATH::|DoubleSlash|
                                                    XML-PATH::|RelativeLocationPath|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|AbbreviatedAbsoluteLocationPath|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|DoubleSlash|
                                                                          XML-PATH::|RelativeLocationPath|)))
                                                      'XML-PATH::|AbbreviatedAbsoluteLocationPath|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|AbbreviatedAbsoluteLocationPath/AbbreviatedAbsoluteLocationPath.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbbreviatedAbsoluteLocationPath/AbbreviatedAbsoluteLocationPath.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|RelativeLocationPath|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|RelativeLocationPath| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|RelativeLocationPath| RESULT))
                                              (XML-PATH::|AbbreviatedAbsoluteLocationPath.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|RelativeLocationPath|)
                                              (XML-PATH::|AbbreviatedAbsoluteLocationPath/fail.3| INDEX)))))))
                               (XML-PATH::|AbbreviatedAbsoluteLocationPath/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|AbbreviatedAbsoluteLocationPath/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|AbbreviatedAbsoluteLocationPath/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AbbreviatedAbsoluteLocationPath/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|DoubleSlash|)
                                     (COND ((XML-PATH::|IS-DoubleSlash| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|DoubleSlash|)
                                            (SETF XML-PATH::|DoubleSlash|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|DoubleSlash-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|DoubleSlash| |item|)
                                                          'XML-PATH::|DoubleSlash|)))
                                            (XML-PATH::|AbbreviatedAbsoluteLocationPath/AbbreviatedAbsoluteLocationPath.2.4|
                                             (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-PATH::|DoubleSlash|)
                                            (XML-PATH::|AbbreviatedAbsoluteLocationPath/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|AbbreviatedAbsoluteLocationPath.2|
                                  XML-PATH::|AbbreviatedAbsoluteLocationPath/AbbreviatedAbsoluteLocationPath.2.4|
                                  XML-PATH::|AbbreviatedAbsoluteLocationPath/fail.3|
                                  XML-PATH::|AbbreviatedAbsoluteLocationPath/start.1|))
                        (XML-PATH::|AbbreviatedAbsoluteLocationPath/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|AbbreviatedAbsoluteLocationPath| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|Expr| (INDEX &AUX (XML-PATH::|OrExpr| NIL))
  "{14} Expr ::= OrExpr
(|OrExpr|)"
  (DECLARE (SPECIAL XML-PATH::|Expr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|Expr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|Expr-INDEX| INDEX)
      (LET ((XML-PATH::|Expr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|Expr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|Expr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|Expr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|Expr|)
                                 (RETURN-FROM XML-PATH::|Expr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|Expr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|Expr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Expr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|Expr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|Expr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|Expr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|OrExpr| XML-PATH::|OrExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|Expr-Constructor| XML-PATH::|OrExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|Expr| (DELETE NIL (LIST XML-PATH::|OrExpr|)))
                                                      'XML-PATH::|Expr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|Expr/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PATH::|Expr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|Expr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Expr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|OrExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|OrExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|OrExpr| RESULT))
                                              (XML-PATH::|Expr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|OrExpr|) (XML-PATH::|Expr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|Expr.2| XML-PATH::|Expr/fail.3| XML-PATH::|Expr/start.1|))
                        (XML-PATH::|Expr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|Expr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|PrimaryExpr| (INDEX &AUX (XML-PATH::|Expr| NIL) (XML-PATH::|FunctionCall| NIL) (XML-PATH::|Literal| NIL)
                                (XML-PATH::|Number| NIL) (XML-PATH::|VariableReference| NIL))
  "{15} PrimaryExpr ::= (Literal | Number | VariableReference | FunctionCall | ('('
                                                                             Expr
                                                                             ')'))
(|Expr| |FunctionCall| |Literal| |Number| |VariableReference|)"
  (DECLARE (SPECIAL XML-PATH::|PrimaryExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|PrimaryExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|PrimaryExpr-INDEX| INDEX)
      (LET ((XML-PATH::|PrimaryExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|PrimaryExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|PrimaryExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|PrimaryExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|PrimaryExpr|)
                                 (RETURN-FROM XML-PATH::|PrimaryExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|PrimaryExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|PrimaryExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrimaryExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|PrimaryExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|PrimaryExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|PrimaryExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|Expr|
                                                         XML-PATH::|Expr|
                                                         'XML-PATH::|FunctionCall|
                                                         XML-PATH::|FunctionCall|
                                                         'XML-PATH::|Literal|
                                                         XML-PATH::|Literal|
                                                         'XML-PATH::|Number|
                                                         XML-PATH::|Number|
                                                         'XML-PATH::|VariableReference|
                                                         XML-PATH::|VariableReference|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|PrimaryExpr-Constructor|
                                                    XML-PATH::|Expr|
                                                    XML-PATH::|FunctionCall|
                                                    XML-PATH::|Literal|
                                                    XML-PATH::|Number|
                                                    XML-PATH::|VariableReference|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|PrimaryExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|Expr|
                                                                          XML-PATH::|FunctionCall|
                                                                          XML-PATH::|Literal|
                                                                          XML-PATH::|Number|
                                                                          XML-PATH::|VariableReference|)))
                                                      'XML-PATH::|PrimaryExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|PrimaryExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|PrimaryExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|PrimaryExpr/PrimaryExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrimaryExpr/PrimaryExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PATH::|PrimaryExpr/PrimaryExpr.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() NIL)))))
                               (XML-PATH::|PrimaryExpr/PrimaryExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrimaryExpr/PrimaryExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Expr| RESULT))
                                              (XML-PATH::|PrimaryExpr/PrimaryExpr.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Expr|) NIL))))))
                               (XML-PATH::|PrimaryExpr/PrimaryExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrimaryExpr/PrimaryExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-PATH::|PrimaryExpr.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) NIL)))))
                               (XML-PATH::|PrimaryExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrimaryExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PATH::|Literal|)
                                           (COND ((XML-PATH::|IS-Literal| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|Literal|)
                                                  (SETF XML-PATH::|Literal|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|Literal-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|Literal| |item|)
                                                                'XML-PATH::|Literal|)))
                                                  (XML-PATH::|PrimaryExpr.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PATH::|Literal|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PATH::|Number|)
                                           (COND ((XML-PATH::|IS-Number| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|Number|)
                                                  (SETF XML-PATH::|Number|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|Number-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|Number| |item|)
                                                                'XML-PATH::|Number|)))
                                                  (XML-PATH::|PrimaryExpr.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PATH::|Number|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|VariableReference|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|VariableReference| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|VariableReference| RESULT))
                                                    (XML-PATH::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|VariableReference|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|FunctionCall|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|FunctionCall| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|FunctionCall| RESULT))
                                                    (XML-PATH::|PrimaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|FunctionCall|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PATH::|PrimaryExpr/PrimaryExpr.2.4|)
                                           (XML-PATH::|PrimaryExpr/PrimaryExpr.2.4| INDEX))
                                         (XML-PATH::|PrimaryExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|PrimaryExpr.2| XML-PATH::|PrimaryExpr/fail.3|
                                  XML-PATH::|PrimaryExpr/PrimaryExpr.2.4| XML-PATH::|PrimaryExpr/PrimaryExpr.2.5|
                                  XML-PATH::|PrimaryExpr/PrimaryExpr.2.6| XML-PATH::|PrimaryExpr/start.1|))
                        (XML-PATH::|PrimaryExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|PrimaryExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|FunctionCall| (INDEX &AUX (XML-PATH::|Argument| NIL) (XML-PATH::|FunctionName| NIL))
  "{16} FunctionCall ::= FunctionName '(' (Argument (',' Argument)*)? ')'
(|Argument| |FunctionName|)"
  (DECLARE (SPECIAL XML-PATH::|FunctionCall-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|FunctionCall-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|FunctionCall-INDEX| INDEX)
      (LET ((XML-PATH::|FunctionCall-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|FunctionCall| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|FunctionCall-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|FunctionCall|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|FunctionCall|)
                                 (RETURN-FROM XML-PATH::|FunctionCall| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|FunctionCall| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|FunctionCall.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|FunctionCall|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|FunctionCall|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|FunctionCall|
                                                   INDEX
                                                   (LIST 'XML-PATH::|Argument|
                                                         XML-PATH::|Argument|
                                                         'XML-PATH::|FunctionName|
                                                         XML-PATH::|FunctionName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|FunctionCall-Constructor|
                                                    XML-PATH::|Argument|
                                                    XML-PATH::|FunctionName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|FunctionCall|
                                                            (DELETE NIL (LIST XML-PATH::|Argument| XML-PATH::|FunctionName|)))
                                                      'XML-PATH::|FunctionCall|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|FunctionCall.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall.9|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|FunctionCall/FunctionCall.9.10|)
                                     (XML-PATH::|FunctionCall/FunctionCall.9.10| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|FunctionCall/FunctionCall.2.6|)
                                     (XML-PATH::|FunctionCall/FunctionCall.2.6| INDEX))))
                               (XML-PATH::|FunctionCall/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|FunctionCall/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|FunctionCall/FunctionCall.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PATH::|FunctionCall/FunctionCall.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-PATH::|FunctionCall/fail.3| INDEX))))))
                               (XML-PATH::|FunctionCall/FunctionCall.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.7|)
                                     (XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|FunctionCall/FunctionCall.2.6|)
                                     (XML-PATH::|FunctionCall/FunctionCall.2.6| INDEX))))
                               (XML-PATH::|FunctionCall/FunctionCall.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-PATH::|FunctionCall.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-PATH::|FunctionCall/fail.3| INDEX))))))
                               (XML-PATH::|FunctionCall/FunctionCall.9.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall.9.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((EQ |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-PATH::|FunctionCall/FunctionCall.9.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-PATH::|FunctionCall/FunctionCall.9.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall.9.11|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Argument|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Argument| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Argument| (CONS RESULT XML-PATH::|Argument|)))
                                              (XML-PATH::|FunctionCall.9| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Argument|) NIL))))))
                               (XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Argument|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Argument| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Argument| (CONS RESULT XML-PATH::|Argument|)))
                                              (XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.8| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Argument|) NIL))))))
                               (XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.8|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|FunctionCall/FunctionCall.9.10|)
                                     (XML-PATH::|FunctionCall/FunctionCall.9.10| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|FunctionCall/FunctionCall.2.6|)
                                     (XML-PATH::|FunctionCall/FunctionCall.2.6| INDEX))))
                               (XML-PATH::|FunctionCall/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionCall/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|FunctionName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|FunctionName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|FunctionName| RESULT))
                                              (XML-PATH::|FunctionCall/FunctionCall.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|FunctionName|)
                                              (XML-PATH::|FunctionCall/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|FunctionCall.2| XML-PATH::|FunctionCall.9|
                                  XML-PATH::|FunctionCall/fail.3| XML-PATH::|FunctionCall/FunctionCall.2.4|
                                  XML-PATH::|FunctionCall/FunctionCall.2.5| XML-PATH::|FunctionCall/FunctionCall.2.6|
                                  XML-PATH::|FunctionCall/FunctionCall.9.10| XML-PATH::|FunctionCall/FunctionCall.9.11|
                                  XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.7|
                                  XML-PATH::|FunctionCall/FunctionCall/FunctionCall.2.6.8| XML-PATH::|FunctionCall/start.1|))
                        (XML-PATH::|FunctionCall/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|FunctionCall| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|Argument| (INDEX &AUX (XML-PATH::|Expr| NIL))
  "{17} Argument ::= Expr
(|Expr|)"
  (DECLARE (SPECIAL XML-PATH::|Argument-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|Argument-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|Argument-INDEX| INDEX)
      (LET ((XML-PATH::|Argument-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|Argument| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|Argument-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|Argument|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|Argument|)
                                 (RETURN-FROM XML-PATH::|Argument| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|Argument| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|Argument.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Argument.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|Argument|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|Argument|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|Argument|
                                                   INDEX
                                                   (LIST 'XML-PATH::|Expr| XML-PATH::|Expr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|Argument-Constructor| XML-PATH::|Expr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|Argument| (DELETE NIL (LIST XML-PATH::|Expr|)))
                                                      'XML-PATH::|Argument|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|Argument/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|Argument/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|Argument/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Argument/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Expr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Expr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Expr| RESULT))
                                              (XML-PATH::|Argument.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Expr|) (XML-PATH::|Argument/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|Argument.2| XML-PATH::|Argument/fail.3|
                                  XML-PATH::|Argument/start.1|))
                        (XML-PATH::|Argument/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|Argument| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|UnionExpr| (INDEX &AUX (XML-PATH::|PathExpr| NIL) (XML-PATH::|UnionExpr| NIL) (XML-PATH::|unionOp| NIL))
  "{18} UnionExpr ::= (PathExpr | (PathExpr unionOp UnionExpr))
(|PathExpr| |UnionExpr| |unionOp|)"
  (DECLARE (SPECIAL XML-PATH::|UnionExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|UnionExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|UnionExpr-INDEX| INDEX)
      (LET ((XML-PATH::|UnionExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|UnionExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|UnionExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|UnionExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|UnionExpr|)
                                 (RETURN-FROM XML-PATH::|UnionExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|UnionExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|UnionExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnionExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|UnionExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|UnionExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|UnionExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|PathExpr|
                                                         XML-PATH::|PathExpr|
                                                         'XML-PATH::|UnionExpr|
                                                         XML-PATH::|UnionExpr|
                                                         'XML-PATH::|unionOp|
                                                         XML-PATH::|unionOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|UnionExpr-Constructor|
                                                    XML-PATH::|PathExpr|
                                                    XML-PATH::|UnionExpr|
                                                    XML-PATH::|unionOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|UnionExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|PathExpr|
                                                                          XML-PATH::|UnionExpr|
                                                                          XML-PATH::|unionOp|)))
                                                      'XML-PATH::|UnionExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|UnionExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|UnionExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|UnionExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnionExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|PathExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|PathExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|PathExpr| RESULT))
                                                    (XML-PATH::|UnionExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|PathExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PATH::|UnionExpr/UnionExpr.2.4|)
                                           (XML-PATH::|UnionExpr/UnionExpr.2.4| INDEX))
                                         (XML-PATH::|UnionExpr/fail.3| INDEX)))))
                               (XML-PATH::|UnionExpr/UnionExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnionExpr/UnionExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|PathExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|PathExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|PathExpr| RESULT))
                                              (XML-PATH::|UnionExpr/UnionExpr.2.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|PathExpr|) NIL))))))
                               (XML-PATH::|UnionExpr/UnionExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnionExpr/UnionExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|unionOp|)
                                     (COND ((XML-PATH::|IS-unionOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|unionOp|)
                                            (SETF XML-PATH::|unionOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|unionOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|unionOp| |item|)
                                                          'XML-PATH::|unionOp|)))
                                            (XML-PATH::|UnionExpr/UnionExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|unionOp|) NIL)))))
                               (XML-PATH::|UnionExpr/UnionExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnionExpr/UnionExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|UnionExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|UnionExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|UnionExpr| RESULT))
                                              (XML-PATH::|UnionExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|UnionExpr|) NIL)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|UnionExpr.2| XML-PATH::|UnionExpr/fail.3|
                                  XML-PATH::|UnionExpr/start.1| XML-PATH::|UnionExpr/UnionExpr.2.4|
                                  XML-PATH::|UnionExpr/UnionExpr.2.5| XML-PATH::|UnionExpr/UnionExpr.2.6|))
                        (XML-PATH::|UnionExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|UnionExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|PathExpr| (INDEX &AUX (XML-PATH::|DoubleSlash| NIL) (XML-PATH::|FilterExpr| NIL) (XML-PATH::|LocationPath| NIL)
                             (XML-PATH::|RelativeLocationPath| NIL) (XML-PATH::|SingleSlash| NIL))
  "{19} PathExpr ::= ((FilterExpr
                    (((SingleSlash | DoubleSlash))
                     RelativeLocationPath)?) | LocationPath)
(|DoubleSlash| |FilterExpr| |LocationPath| |RelativeLocationPath| |SingleSlash|)"
  (DECLARE (SPECIAL XML-PATH::|PathExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|PathExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|PathExpr-INDEX| INDEX)
      (LET ((XML-PATH::|PathExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|PathExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|PathExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|PathExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|PathExpr|)
                                 (RETURN-FROM XML-PATH::|PathExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|PathExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|PathExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PathExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|PathExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|PathExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|PathExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|DoubleSlash|
                                                         XML-PATH::|DoubleSlash|
                                                         'XML-PATH::|FilterExpr|
                                                         XML-PATH::|FilterExpr|
                                                         'XML-PATH::|LocationPath|
                                                         XML-PATH::|LocationPath|
                                                         'XML-PATH::|RelativeLocationPath|
                                                         XML-PATH::|RelativeLocationPath|
                                                         'XML-PATH::|SingleSlash|
                                                         XML-PATH::|SingleSlash|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|PathExpr-Constructor|
                                                    XML-PATH::|DoubleSlash|
                                                    XML-PATH::|FilterExpr|
                                                    XML-PATH::|LocationPath|
                                                    XML-PATH::|RelativeLocationPath|
                                                    XML-PATH::|SingleSlash|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|PathExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|DoubleSlash|
                                                                          XML-PATH::|FilterExpr|
                                                                          XML-PATH::|LocationPath|
                                                                          XML-PATH::|RelativeLocationPath|
                                                                          XML-PATH::|SingleSlash|)))
                                                      'XML-PATH::|PathExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|PathExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|PathExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|PathExpr/PathExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PathExpr/PathExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|FilterExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|FilterExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|FilterExpr| RESULT))
                                              (XML-PATH::|PathExpr/PathExpr.2.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|FilterExpr|) NIL))))))
                               (XML-PATH::|PathExpr/PathExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PathExpr/PathExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|PathExpr/PathExpr.2.6|)
                                     (XML-PATH::|PathExpr/PathExpr.2.6| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|PathExpr.2|) (XML-PATH::|PathExpr.2| INDEX))))
                               (XML-PATH::|PathExpr/PathExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PathExpr/PathExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|SingleSlash|)
                                           (COND ((XML-PATH::|IS-SingleSlash| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|SingleSlash|)
                                                  (SETF XML-PATH::|SingleSlash|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|SingleSlash-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|SingleSlash| |item|)
                                                                'XML-PATH::|SingleSlash|)))
                                                  (XML-PATH::|PathExpr/PathExpr.2.7| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|SingleSlash|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|DoubleSlash|)
                                           (COND ((XML-PATH::|IS-DoubleSlash| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|DoubleSlash|)
                                                  (SETF XML-PATH::|DoubleSlash|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|DoubleSlash-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|DoubleSlash| |item|)
                                                                'XML-PATH::|DoubleSlash|)))
                                                  (XML-PATH::|PathExpr/PathExpr.2.7| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|DoubleSlash|) NIL)))
                                         NIL))))
                               (XML-PATH::|PathExpr/PathExpr.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PathExpr/PathExpr.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|RelativeLocationPath|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|RelativeLocationPath| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|RelativeLocationPath| RESULT))
                                              (XML-PATH::|PathExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|RelativeLocationPath|) NIL))))))
                               (XML-PATH::|PathExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PathExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PATH::|PathExpr/PathExpr.2.4|)
                                           (XML-PATH::|PathExpr/PathExpr.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|LocationPath|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|LocationPath| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|LocationPath| RESULT))
                                                    (XML-PATH::|PathExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|LocationPath|) NIL))))
                                         (XML-PATH::|PathExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|PathExpr.2| XML-PATH::|PathExpr/fail.3|
                                  XML-PATH::|PathExpr/PathExpr.2.4| XML-PATH::|PathExpr/PathExpr.2.5|
                                  XML-PATH::|PathExpr/PathExpr.2.6| XML-PATH::|PathExpr/PathExpr.2.7|
                                  XML-PATH::|PathExpr/start.1|))
                        (XML-PATH::|PathExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|PathExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|FilterExpr| (INDEX &AUX (XML-PATH::|FilterExpr| NIL) (XML-PATH::|Predicate| NIL) (XML-PATH::|PrimaryExpr| NIL))
  "{20} FilterExpr ::= (PrimaryExpr | (Predicate FilterExpr))
(|FilterExpr| |Predicate| |PrimaryExpr|)"
  (DECLARE (SPECIAL XML-PATH::|FilterExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|FilterExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|FilterExpr-INDEX| INDEX)
      (LET ((XML-PATH::|FilterExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|FilterExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|FilterExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|FilterExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|FilterExpr|)
                                 (RETURN-FROM XML-PATH::|FilterExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|FilterExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|FilterExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FilterExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|FilterExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|FilterExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|FilterExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|FilterExpr|
                                                         XML-PATH::|FilterExpr|
                                                         'XML-PATH::|Predicate|
                                                         XML-PATH::|Predicate|
                                                         'XML-PATH::|PrimaryExpr|
                                                         XML-PATH::|PrimaryExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|FilterExpr-Constructor|
                                                    XML-PATH::|FilterExpr|
                                                    XML-PATH::|Predicate|
                                                    XML-PATH::|PrimaryExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|FilterExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|FilterExpr|
                                                                          XML-PATH::|Predicate|
                                                                          XML-PATH::|PrimaryExpr|)))
                                                      'XML-PATH::|FilterExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|FilterExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|FilterExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|FilterExpr/FilterExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FilterExpr/FilterExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Predicate|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Predicate| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Predicate| RESULT))
                                              (XML-PATH::|FilterExpr/FilterExpr.2.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Predicate|) NIL))))))
                               (XML-PATH::|FilterExpr/FilterExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FilterExpr/FilterExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|FilterExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|FilterExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|FilterExpr| RESULT))
                                              (XML-PATH::|FilterExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|FilterExpr|) NIL))))))
                               (XML-PATH::|FilterExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FilterExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|PrimaryExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|PrimaryExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|PrimaryExpr| RESULT))
                                                    (XML-PATH::|FilterExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|PrimaryExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PATH::|FilterExpr/FilterExpr.2.4|)
                                           (XML-PATH::|FilterExpr/FilterExpr.2.4| INDEX))
                                         (XML-PATH::|FilterExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|FilterExpr.2| XML-PATH::|FilterExpr/fail.3|
                                  XML-PATH::|FilterExpr/FilterExpr.2.4| XML-PATH::|FilterExpr/FilterExpr.2.5|
                                  XML-PATH::|FilterExpr/start.1|))
                        (XML-PATH::|FilterExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|FilterExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|OrExpr| (INDEX &AUX (XML-PATH::|AndExpr| NIL) (XML-PATH::|OrExpr| NIL) (XML-PATH::|orOp| NIL))
  "{21} OrExpr ::= AndExpr (orOp OrExpr)?
(|AndExpr| |OrExpr| |orOp|)"
  (DECLARE (SPECIAL XML-PATH::|OrExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|OrExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|OrExpr-INDEX| INDEX)
      (LET ((XML-PATH::|OrExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|OrExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|OrExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|OrExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|OrExpr|)
                                 (RETURN-FROM XML-PATH::|OrExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|OrExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|OrExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|OrExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|OrExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|OrExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|OrExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AndExpr|
                                                         XML-PATH::|AndExpr|
                                                         'XML-PATH::|OrExpr|
                                                         XML-PATH::|OrExpr|
                                                         'XML-PATH::|orOp|
                                                         XML-PATH::|orOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|OrExpr-Constructor|
                                                    XML-PATH::|AndExpr|
                                                    XML-PATH::|OrExpr|
                                                    XML-PATH::|orOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|OrExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AndExpr|
                                                                          XML-PATH::|OrExpr|
                                                                          XML-PATH::|orOp|)))
                                                      'XML-PATH::|OrExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|OrExpr/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PATH::|OrExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|OrExpr/OrExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|OrExpr/OrExpr.2.4|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|OrExpr/OrExpr.2.5|) (XML-PATH::|OrExpr/OrExpr.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|OrExpr.2|) (XML-PATH::|OrExpr.2| INDEX))))
                               (XML-PATH::|OrExpr/OrExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|OrExpr/OrExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|orOp|)
                                     (COND ((XML-PATH::|IS-orOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|orOp|)
                                            (SETF XML-PATH::|orOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|orOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|orOp| |item|)
                                                          'XML-PATH::|orOp|)))
                                            (XML-PATH::|OrExpr/OrExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|orOp|) NIL)))))
                               (XML-PATH::|OrExpr/OrExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|OrExpr/OrExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|OrExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|OrExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|OrExpr| RESULT))
                                              (XML-PATH::|OrExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|OrExpr|) NIL))))))
                               (XML-PATH::|OrExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|OrExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|AndExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|AndExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|AndExpr| RESULT))
                                              (XML-PATH::|OrExpr/OrExpr.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|AndExpr|) (XML-PATH::|OrExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|OrExpr.2| XML-PATH::|OrExpr/fail.3| XML-PATH::|OrExpr/OrExpr.2.4|
                                  XML-PATH::|OrExpr/OrExpr.2.5| XML-PATH::|OrExpr/OrExpr.2.6| XML-PATH::|OrExpr/start.1|))
                        (XML-PATH::|OrExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|OrExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|AndExpr| (INDEX &AUX (XML-PATH::|AndExpr| NIL) (XML-PATH::|andOp| NIL) (XML-PATH::|EqualityExpr| NIL))
  "{22} AndExpr ::= EqualityExpr (andOp AndExpr)?
(|AndExpr| |andOp| |EqualityExpr|)"
  (DECLARE (SPECIAL XML-PATH::|AndExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|AndExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|AndExpr-INDEX| INDEX)
      (LET ((XML-PATH::|AndExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|AndExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|AndExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|AndExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|AndExpr|)
                                 (RETURN-FROM XML-PATH::|AndExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|AndExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|AndExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AndExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|AndExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|AndExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|AndExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AndExpr|
                                                         XML-PATH::|AndExpr|
                                                         'XML-PATH::|andOp|
                                                         XML-PATH::|andOp|
                                                         'XML-PATH::|EqualityExpr|
                                                         XML-PATH::|EqualityExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|AndExpr-Constructor|
                                                    XML-PATH::|AndExpr|
                                                    XML-PATH::|andOp|
                                                    XML-PATH::|EqualityExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|AndExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AndExpr|
                                                                          XML-PATH::|andOp|
                                                                          XML-PATH::|EqualityExpr|)))
                                                      'XML-PATH::|AndExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|AndExpr/AndExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AndExpr/AndExpr.2.4|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|AndExpr/AndExpr.2.5|) (XML-PATH::|AndExpr/AndExpr.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|AndExpr.2|) (XML-PATH::|AndExpr.2| INDEX))))
                               (XML-PATH::|AndExpr/AndExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AndExpr/AndExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|andOp|)
                                     (COND ((XML-PATH::|IS-andOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|andOp|)
                                            (SETF XML-PATH::|andOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|andOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|andOp| |item|)
                                                          'XML-PATH::|andOp|)))
                                            (XML-PATH::|AndExpr/AndExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|andOp|) NIL)))))
                               (XML-PATH::|AndExpr/AndExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AndExpr/AndExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|AndExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|AndExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|AndExpr| RESULT))
                                              (XML-PATH::|AndExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|AndExpr|) NIL))))))
                               (XML-PATH::|AndExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|AndExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|AndExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AndExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|EqualityExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|EqualityExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|EqualityExpr| RESULT))
                                              (XML-PATH::|AndExpr/AndExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|EqualityExpr|)
                                              (XML-PATH::|AndExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|AndExpr.2| XML-PATH::|AndExpr/AndExpr.2.4|
                                  XML-PATH::|AndExpr/AndExpr.2.5| XML-PATH::|AndExpr/AndExpr.2.6| XML-PATH::|AndExpr/fail.3|
                                  XML-PATH::|AndExpr/start.1|))
                        (XML-PATH::|AndExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|AndExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|EqualityExpr| (INDEX &AUX (XML-PATH::|EqualityExpr| NIL) (XML-PATH::|EqualityOp| NIL)
                                 (XML-PATH::|RelationalExpr| NIL))
  "{23} EqualityExpr ::= RelationalExpr (EqualityOp EqualityExpr)?
(|EqualityExpr| |EqualityOp| |RelationalExpr|)"
  (DECLARE (SPECIAL XML-PATH::|EqualityExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|EqualityExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|EqualityExpr-INDEX| INDEX)
      (LET ((XML-PATH::|EqualityExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|EqualityExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|EqualityExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|EqualityExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|EqualityExpr|)
                                 (RETURN-FROM XML-PATH::|EqualityExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|EqualityExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|EqualityExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|EqualityExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|EqualityExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|EqualityExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|EqualityExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|EqualityExpr|
                                                         XML-PATH::|EqualityExpr|
                                                         'XML-PATH::|EqualityOp|
                                                         XML-PATH::|EqualityOp|
                                                         'XML-PATH::|RelationalExpr|
                                                         XML-PATH::|RelationalExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|EqualityExpr-Constructor|
                                                    XML-PATH::|EqualityExpr|
                                                    XML-PATH::|EqualityOp|
                                                    XML-PATH::|RelationalExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|EqualityExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|EqualityExpr|
                                                                          XML-PATH::|EqualityOp|
                                                                          XML-PATH::|RelationalExpr|)))
                                                      'XML-PATH::|EqualityExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|EqualityExpr/EqualityExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|EqualityExpr/EqualityExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|EqualityExpr/EqualityExpr.2.5|)
                                     (XML-PATH::|EqualityExpr/EqualityExpr.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|EqualityExpr.2|) (XML-PATH::|EqualityExpr.2| INDEX))))
                               (XML-PATH::|EqualityExpr/EqualityExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|EqualityExpr/EqualityExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|EqualityOp|)
                                     (COND ((XML-PATH::|IS-EqualityOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|EqualityOp|)
                                            (SETF XML-PATH::|EqualityOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|EqualityOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|EqualityOp| |item|)
                                                          'XML-PATH::|EqualityOp|)))
                                            (XML-PATH::|EqualityExpr/EqualityExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|EqualityOp|) NIL)))))
                               (XML-PATH::|EqualityExpr/EqualityExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|EqualityExpr/EqualityExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|EqualityExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|EqualityExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|EqualityExpr| RESULT))
                                              (XML-PATH::|EqualityExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|EqualityExpr|) NIL))))))
                               (XML-PATH::|EqualityExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|EqualityExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|EqualityExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|EqualityExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|RelationalExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|RelationalExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|RelationalExpr| RESULT))
                                              (XML-PATH::|EqualityExpr/EqualityExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|RelationalExpr|)
                                              (XML-PATH::|EqualityExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|EqualityExpr.2| XML-PATH::|EqualityExpr/EqualityExpr.2.4|
                                  XML-PATH::|EqualityExpr/EqualityExpr.2.5| XML-PATH::|EqualityExpr/EqualityExpr.2.6|
                                  XML-PATH::|EqualityExpr/fail.3| XML-PATH::|EqualityExpr/start.1|))
                        (XML-PATH::|EqualityExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|EqualityExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|RelationalExpr| (INDEX &AUX (XML-PATH::|AdditiveExpr| NIL) (XML-PATH::|RelationalExpr| NIL)
                                   (XML-PATH::|RelationalOp| NIL))
  "{24} RelationalExpr ::= AdditiveExpr (RelationalOp RelationalExpr)?
(|AdditiveExpr| |RelationalExpr| |RelationalOp|)"
  (DECLARE (SPECIAL XML-PATH::|RelationalExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|RelationalExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|RelationalExpr-INDEX| INDEX)
      (LET ((XML-PATH::|RelationalExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|RelationalExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|RelationalExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|RelationalExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|RelationalExpr|)
                                 (RETURN-FROM XML-PATH::|RelationalExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|RelationalExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|RelationalExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelationalExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|RelationalExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|RelationalExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|RelationalExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AdditiveExpr|
                                                         XML-PATH::|AdditiveExpr|
                                                         'XML-PATH::|RelationalExpr|
                                                         XML-PATH::|RelationalExpr|
                                                         'XML-PATH::|RelationalOp|
                                                         XML-PATH::|RelationalOp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|RelationalExpr-Constructor|
                                                    XML-PATH::|AdditiveExpr|
                                                    XML-PATH::|RelationalExpr|
                                                    XML-PATH::|RelationalOp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|RelationalExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AdditiveExpr|
                                                                          XML-PATH::|RelationalExpr|
                                                                          XML-PATH::|RelationalOp|)))
                                                      'XML-PATH::|RelationalExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|RelationalExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|RelationalExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|RelationalExpr/RelationalExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelationalExpr/RelationalExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|RelationalExpr/RelationalExpr.2.5|)
                                     (XML-PATH::|RelationalExpr/RelationalExpr.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|RelationalExpr.2|) (XML-PATH::|RelationalExpr.2| INDEX))))
                               (XML-PATH::|RelationalExpr/RelationalExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelationalExpr/RelationalExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|RelationalOp|)
                                     (COND ((XML-PATH::|IS-RelationalOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|RelationalOp|)
                                            (SETF XML-PATH::|RelationalOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|RelationalOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|RelationalOp| |item|)
                                                          'XML-PATH::|RelationalOp|)))
                                            (XML-PATH::|RelationalExpr/RelationalExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|RelationalOp|) NIL)))))
                               (XML-PATH::|RelationalExpr/RelationalExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelationalExpr/RelationalExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|RelationalExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|RelationalExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|RelationalExpr| RESULT))
                                              (XML-PATH::|RelationalExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|RelationalExpr|) NIL))))))
                               (XML-PATH::|RelationalExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|RelationalExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|AdditiveExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|AdditiveExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|AdditiveExpr| RESULT))
                                              (XML-PATH::|RelationalExpr/RelationalExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|AdditiveExpr|)
                                              (XML-PATH::|RelationalExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|RelationalExpr.2| XML-PATH::|RelationalExpr/fail.3|
                                  XML-PATH::|RelationalExpr/RelationalExpr.2.4| XML-PATH::|RelationalExpr/RelationalExpr.2.5|
                                  XML-PATH::|RelationalExpr/RelationalExpr.2.6| XML-PATH::|RelationalExpr/start.1|))
                        (XML-PATH::|RelationalExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|RelationalExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|AdditiveExpr| (INDEX &AUX (XML-PATH::|AdditiveExpr| NIL) (XML-PATH::|AdditiveOp| NIL)
                                 (XML-PATH::|MultiplicativeExpr| NIL))
  "{25} AdditiveExpr ::= MultiplicativeExpr (AdditiveOp AdditiveExpr)?
(|AdditiveExpr| |AdditiveOp| |MultiplicativeExpr|)"
  (DECLARE (SPECIAL XML-PATH::|AdditiveExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|AdditiveExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|AdditiveExpr-INDEX| INDEX)
      (LET ((XML-PATH::|AdditiveExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|AdditiveExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|AdditiveExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|AdditiveExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|AdditiveExpr|)
                                 (RETURN-FROM XML-PATH::|AdditiveExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|AdditiveExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|AdditiveExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|AdditiveExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|AdditiveExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|AdditiveExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AdditiveExpr|
                                                         XML-PATH::|AdditiveExpr|
                                                         'XML-PATH::|AdditiveOp|
                                                         XML-PATH::|AdditiveOp|
                                                         'XML-PATH::|MultiplicativeExpr|
                                                         XML-PATH::|MultiplicativeExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|AdditiveExpr-Constructor|
                                                    XML-PATH::|AdditiveExpr|
                                                    XML-PATH::|AdditiveOp|
                                                    XML-PATH::|MultiplicativeExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|AdditiveExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|AdditiveExpr|
                                                                          XML-PATH::|AdditiveOp|
                                                                          XML-PATH::|MultiplicativeExpr|)))
                                                      'XML-PATH::|AdditiveExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|AdditiveExpr/AdditiveExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveExpr/AdditiveExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|AdditiveExpr/AdditiveExpr.2.5|)
                                     (XML-PATH::|AdditiveExpr/AdditiveExpr.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PATH::|AdditiveExpr.2|) (XML-PATH::|AdditiveExpr.2| INDEX))))
                               (XML-PATH::|AdditiveExpr/AdditiveExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveExpr/AdditiveExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|AdditiveOp|)
                                     (COND ((XML-PATH::|IS-AdditiveOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|AdditiveOp|)
                                            (SETF XML-PATH::|AdditiveOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|AdditiveOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|AdditiveOp| |item|)
                                                          'XML-PATH::|AdditiveOp|)))
                                            (XML-PATH::|AdditiveExpr/AdditiveExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|AdditiveOp|) NIL)))))
                               (XML-PATH::|AdditiveExpr/AdditiveExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveExpr/AdditiveExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|AdditiveExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|AdditiveExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|AdditiveExpr| RESULT))
                                              (XML-PATH::|AdditiveExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|AdditiveExpr|) NIL))))))
                               (XML-PATH::|AdditiveExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|AdditiveExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|AdditiveExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|MultiplicativeExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|MultiplicativeExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|MultiplicativeExpr| RESULT))
                                              (XML-PATH::|AdditiveExpr/AdditiveExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|MultiplicativeExpr|)
                                              (XML-PATH::|AdditiveExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|AdditiveExpr.2| XML-PATH::|AdditiveExpr/AdditiveExpr.2.4|
                                  XML-PATH::|AdditiveExpr/AdditiveExpr.2.5| XML-PATH::|AdditiveExpr/AdditiveExpr.2.6|
                                  XML-PATH::|AdditiveExpr/fail.3| XML-PATH::|AdditiveExpr/start.1|))
                        (XML-PATH::|AdditiveExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|AdditiveExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|MultiplicativeExpr| (INDEX &AUX (XML-PATH::|MultiplicativeExpr| NIL) (XML-PATH::|MultiplicativeOp| NIL)
                                       (XML-PATH::|UnaryExpr| NIL))
  "{26} MultiplicativeExpr ::= UnaryExpr (MultiplicativeOp MultiplicativeExpr)?
(|MultiplicativeExpr| |MultiplicativeOp| |UnaryExpr|)"
  (DECLARE (SPECIAL XML-PATH::|MultiplicativeExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|MultiplicativeExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|MultiplicativeExpr-INDEX| INDEX)
      (LET ((XML-PATH::|MultiplicativeExpr-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|MultiplicativeExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|MultiplicativeExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|MultiplicativeExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|MultiplicativeExpr|)
                                 (RETURN-FROM XML-PATH::|MultiplicativeExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|MultiplicativeExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|MultiplicativeExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|MultiplicativeExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|MultiplicativeExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|MultiplicativeExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|MultiplicativeExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|MultiplicativeExpr|
                                                         XML-PATH::|MultiplicativeExpr|
                                                         'XML-PATH::|MultiplicativeOp|
                                                         XML-PATH::|MultiplicativeOp|
                                                         'XML-PATH::|UnaryExpr|
                                                         XML-PATH::|UnaryExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|MultiplicativeExpr-Constructor|
                                                    XML-PATH::|MultiplicativeExpr|
                                                    XML-PATH::|MultiplicativeOp|
                                                    XML-PATH::|UnaryExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|MultiplicativeExpr|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|MultiplicativeExpr|
                                                                          XML-PATH::|MultiplicativeOp|
                                                                          XML-PATH::|UnaryExpr|)))
                                                      'XML-PATH::|MultiplicativeExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|MultiplicativeExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|MultiplicativeExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.5|)
                                     (XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PATH::|MultiplicativeExpr.2|)
                                     (XML-PATH::|MultiplicativeExpr.2| INDEX))))
                               (XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|MultiplicativeOp|)
                                     (COND ((XML-PATH::|IS-MultiplicativeOp| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|MultiplicativeOp|)
                                            (SETF XML-PATH::|MultiplicativeOp|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|MultiplicativeOp-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|MultiplicativeOp| |item|)
                                                          'XML-PATH::|MultiplicativeOp|)))
                                            (XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|MultiplicativeOp|) NIL)))))
                               (XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|MultiplicativeExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|MultiplicativeExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|MultiplicativeExpr| RESULT))
                                              (XML-PATH::|MultiplicativeExpr.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|MultiplicativeExpr|) NIL))))))
                               (XML-PATH::|MultiplicativeExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|MultiplicativeExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|UnaryExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|UnaryExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|UnaryExpr| RESULT))
                                              (XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|UnaryExpr|)
                                              (XML-PATH::|MultiplicativeExpr/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|MultiplicativeExpr.2| XML-PATH::|MultiplicativeExpr/fail.3|
                                  XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.4|
                                  XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.5|
                                  XML-PATH::|MultiplicativeExpr/MultiplicativeExpr.2.6| XML-PATH::|MultiplicativeExpr/start.1|))
                        (XML-PATH::|MultiplicativeExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|MultiplicativeExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|UnaryExpr| (INDEX &AUX (XML-PATH::|AdditiveInverse| NIL) (XML-PATH::|UnionExpr| NIL))
  "{27} UnaryExpr ::= (UnionExpr | AdditiveInverse)
(|AdditiveInverse| |UnionExpr|)"
  (DECLARE (SPECIAL XML-PATH::|UnaryExpr-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|UnaryExpr-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|UnaryExpr-INDEX| INDEX)
      (LET ((XML-PATH::|UnaryExpr-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|UnaryExpr| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|UnaryExpr-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|UnaryExpr|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|UnaryExpr|)
                                 (RETURN-FROM XML-PATH::|UnaryExpr| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|UnaryExpr| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|UnaryExpr.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnaryExpr.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|UnaryExpr|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|UnaryExpr|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|UnaryExpr|
                                                   INDEX
                                                   (LIST 'XML-PATH::|AdditiveInverse|
                                                         XML-PATH::|AdditiveInverse|
                                                         'XML-PATH::|UnionExpr|
                                                         XML-PATH::|UnionExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|UnaryExpr-Constructor|
                                                    XML-PATH::|AdditiveInverse|
                                                    XML-PATH::|UnionExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|UnaryExpr|
                                                            (DELETE NIL (LIST XML-PATH::|AdditiveInverse| XML-PATH::|UnionExpr|)))
                                                      'XML-PATH::|UnaryExpr|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|UnaryExpr/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|UnaryExpr/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|UnaryExpr/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|UnaryExpr/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|UnionExpr|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|UnionExpr| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|UnionExpr| RESULT))
                                                    (XML-PATH::|UnaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|UnionExpr|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PATH::|AdditiveInverse|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (XML-PATH::|AdditiveInverse| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PATH::|AdditiveInverse| RESULT))
                                                    (XML-PATH::|UnaryExpr.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PATH::|AdditiveInverse|) NIL))))
                                         (XML-PATH::|UnaryExpr/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|UnaryExpr.2| XML-PATH::|UnaryExpr/fail.3|
                                  XML-PATH::|UnaryExpr/start.1|))
                        (XML-PATH::|UnaryExpr/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|UnaryExpr| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|AdditiveInverse| (INDEX &AUX (XML-PATH::|UnaryExpr| NIL))
  "AdditiveInverse ::= '-' UnaryExpr
(|UnaryExpr|)"
  (DECLARE (SPECIAL XML-PATH::|AdditiveInverse-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|AdditiveInverse-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|AdditiveInverse-INDEX| INDEX)
      (LET ((XML-PATH::|AdditiveInverse-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|AdditiveInverse| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|AdditiveInverse-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|AdditiveInverse|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|AdditiveInverse|)
                                 (RETURN-FROM XML-PATH::|AdditiveInverse| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|AdditiveInverse| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|AdditiveInverse.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveInverse.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|AdditiveInverse|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|AdditiveInverse|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|AdditiveInverse|
                                                   INDEX
                                                   (LIST 'XML-PATH::|UnaryExpr| XML-PATH::|UnaryExpr|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|AdditiveInverse-Constructor| XML-PATH::|UnaryExpr|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|AdditiveInverse| (DELETE NIL (LIST XML-PATH::|UnaryExpr|)))
                                                      'XML-PATH::|AdditiveInverse|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|AdditiveInverse/AdditiveInverse.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveInverse/AdditiveInverse.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|UnaryExpr|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|UnaryExpr| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|UnaryExpr| RESULT))
                                              (XML-PATH::|AdditiveInverse.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|UnaryExpr|)
                                              (XML-PATH::|AdditiveInverse/fail.3| INDEX)))))))
                               (XML-PATH::|AdditiveInverse/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|AdditiveInverse/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|AdditiveInverse/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|AdditiveInverse/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:-)
                                     (COND ((EQ |item| '|xml|:-)
                                            (SETF *ATN-TERM* '|xml|:-)
                                            (XML-PATH::|AdditiveInverse/AdditiveInverse.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:-) (XML-PATH::|AdditiveInverse/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|AdditiveInverse.2| XML-PATH::|AdditiveInverse/AdditiveInverse.2.4|
                                  XML-PATH::|AdditiveInverse/fail.3| XML-PATH::|AdditiveInverse/start.1|))
                        (XML-PATH::|AdditiveInverse/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|AdditiveInverse| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|FunctionName| (INDEX &AUX (XML-PATH::|QName| NIL))
  "{35} FunctionName ::= QName
(|QName|)"
  (DECLARE (SPECIAL XML-PATH::|FunctionName-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|FunctionName-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|FunctionName-INDEX| INDEX)
      (LET ((XML-PATH::|FunctionName-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|FunctionName| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|FunctionName-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|FunctionName|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|FunctionName|)
                                 (RETURN-FROM XML-PATH::|FunctionName| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|FunctionName| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|FunctionName.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionName.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|FunctionName|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|FunctionName|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|FunctionName|
                                                   INDEX
                                                   (LIST 'XML-PATH::|QName| XML-PATH::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|FunctionName-Constructor| XML-PATH::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|FunctionName| (DELETE NIL (LIST XML-PATH::|QName|)))
                                                      'XML-PATH::|FunctionName|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|FunctionName/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|FunctionName/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|FunctionName/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|FunctionName/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|QName| RESULT))
                                              (XML-PATH::|FunctionName.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|QName|)
                                              (XML-PATH::|FunctionName/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|FunctionName.2| XML-PATH::|FunctionName/fail.3|
                                  XML-PATH::|FunctionName/start.1|))
                        (XML-PATH::|FunctionName/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|FunctionName| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|VariableReference| (INDEX &AUX (XML-PATH::|QName| NIL))
  "{36} VariableReference ::= '$' QName
(|QName|)"
  (DECLARE (SPECIAL XML-PATH::|VariableReference-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|VariableReference-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|VariableReference-INDEX| INDEX)
      (LET ((XML-PATH::|VariableReference-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|VariableReference| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|VariableReference-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|VariableReference|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|VariableReference|)
                                 (RETURN-FROM XML-PATH::|VariableReference| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|VariableReference| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|VariableReference.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|VariableReference.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|VariableReference|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|VariableReference|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|VariableReference|
                                                   INDEX
                                                   (LIST 'XML-PATH::|QName| XML-PATH::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|VariableReference-Constructor| XML-PATH::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|VariableReference| (DELETE NIL (LIST XML-PATH::|QName|)))
                                                      'XML-PATH::|VariableReference|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|VariableReference/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|VariableReference/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|VariableReference/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|VariableReference/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:$)
                                     (COND ((EQ |item| '|xml|:$)
                                            (SETF *ATN-TERM* '|xml|:$)
                                            (XML-PATH::|VariableReference/VariableReference.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:$) (XML-PATH::|VariableReference/fail.3| INDEX))))))
                               (XML-PATH::|VariableReference/VariableReference.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|VariableReference/VariableReference.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|QName|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|QName| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|QName| RESULT))
                                              (XML-PATH::|VariableReference.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|QName|)
                                              (XML-PATH::|VariableReference/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|VariableReference.2| XML-PATH::|VariableReference/fail.3|
                                  XML-PATH::|VariableReference/start.1| XML-PATH::|VariableReference/VariableReference.2.4|))
                        (XML-PATH::|VariableReference/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|VariableReference| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|NameTest| (INDEX &AUX (XML-PATH::|LocalPart| NIL) (XML-PATH::|PrefixTest| NIL) (XML-PATH::|WildName| NIL))
  "{37} NameTest ::= PrefixTest? ((WildName | LocalPart))
(|LocalPart| |PrefixTest| |WildName|)"
  (DECLARE (SPECIAL XML-PATH::|NameTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|NameTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|NameTest-INDEX| INDEX)
      (LET ((XML-PATH::|NameTest-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|NameTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|NameTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|NameTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|NameTest|)
                                 (RETURN-FROM XML-PATH::|NameTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|NameTest| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|NameTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|NameTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|NameTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|NameTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|NameTest|
                                                   INDEX
                                                   (LIST 'XML-PATH::|LocalPart|
                                                         XML-PATH::|LocalPart|
                                                         'XML-PATH::|PrefixTest|
                                                         XML-PATH::|PrefixTest|
                                                         'XML-PATH::|WildName|
                                                         XML-PATH::|WildName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|NameTest-Constructor|
                                                    XML-PATH::|LocalPart|
                                                    XML-PATH::|PrefixTest|
                                                    XML-PATH::|WildName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|NameTest|
                                                            (DELETE NIL
                                                                    (LIST XML-PATH::|LocalPart|
                                                                          XML-PATH::|PrefixTest|
                                                                          XML-PATH::|WildName|)))
                                                      'XML-PATH::|NameTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|NameTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|NameTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|NameTest/NameTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|NameTest/NameTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|WildName|)
                                           (COND ((XML-PATH::|IS-WildName| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|WildName|)
                                                  (SETF XML-PATH::|WildName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|WildName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|WildName| |item|)
                                                                'XML-PATH::|WildName|)))
                                                  (XML-PATH::|NameTest.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|WildName|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|LocalPart|)
                                           (COND ((XML-PATH::|IS-LocalPart| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|LocalPart|)
                                                  (SETF XML-PATH::|LocalPart|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|LocalPart-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|LocalPart| |item|)
                                                                'XML-PATH::|LocalPart|)))
                                                  (XML-PATH::|NameTest.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|LocalPart|) NIL)))
                                         (XML-PATH::|NameTest/fail.3| INDEX)))))
                               (XML-PATH::|NameTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|NameTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|PrefixTest|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|PrefixTest| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|PrefixTest| RESULT))
                                              (XML-PATH::|NameTest/NameTest.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PATH::|PrefixTest|)
                                              (XML-PATH::|NameTest/NameTest.2.4| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|NameTest.2| XML-PATH::|NameTest/fail.3|
                                  XML-PATH::|NameTest/NameTest.2.4| XML-PATH::|NameTest/start.1|))
                        (XML-PATH::|NameTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|NameTest| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|PrefixTest| (INDEX &AUX (XML-PATH::|NCName| NIL) (XML-PATH::|WildName| NIL))
  "PrefixTest ::= ((WildName | NCName)) ':'
(|NCName| |WildName|)"
  (DECLARE (SPECIAL XML-PATH::|PrefixTest-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|PrefixTest-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|PrefixTest-INDEX| INDEX)
      (LET ((XML-PATH::|PrefixTest-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PATH::|PrefixTest| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|PrefixTest-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|PrefixTest|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|PrefixTest|)
                                 (RETURN-FROM XML-PATH::|PrefixTest| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|PrefixTest| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|PrefixTest.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrefixTest.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|PrefixTest|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|PrefixTest|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|PrefixTest|
                                                   INDEX
                                                   (LIST 'XML-PATH::|NCName|
                                                         XML-PATH::|NCName|
                                                         'XML-PATH::|WildName|
                                                         XML-PATH::|WildName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|PrefixTest-Constructor| XML-PATH::|NCName| XML-PATH::|WildName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|PrefixTest|
                                                            (DELETE NIL (LIST XML-PATH::|NCName| XML-PATH::|WildName|)))
                                                      'XML-PATH::|PrefixTest|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|PrefixTest/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PATH::|PrefixTest/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|PrefixTest/PrefixTest.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrefixTest/PrefixTest.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\:)
                                     (COND ((EQ |item| '|xml|:\:)
                                            (SETF *ATN-TERM* '|xml|:\:)
                                            (XML-PATH::|PrefixTest.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\:) (XML-PATH::|PrefixTest/fail.3| INDEX))))))
                               (XML-PATH::|PrefixTest/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|PrefixTest/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-PATH::|WildName|)
                                           (COND ((XML-PATH::|IS-WildName| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|WildName|)
                                                  (SETF XML-PATH::|WildName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|WildName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|WildName| |item|)
                                                                'XML-PATH::|WildName|)))
                                                  (XML-PATH::|PrefixTest/PrefixTest.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PATH::|WildName|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PATH::|NCName|)
                                           (COND ((XML-PATH::|IS-NCName| |item|)
                                                  (SETF *ATN-TERM* 'XML-PATH::|NCName|)
                                                  (SETF XML-PATH::|NCName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PATH::|NCName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PATH::|NCName| |item|)
                                                                'XML-PATH::|NCName|)))
                                                  (XML-PATH::|PrefixTest/PrefixTest.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PATH::|NCName|) NIL)))
                                         (XML-PATH::|PrefixTest/fail.3| INDEX))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|PrefixTest.2| XML-PATH::|PrefixTest/fail.3|
                                  XML-PATH::|PrefixTest/PrefixTest.2.4| XML-PATH::|PrefixTest/start.1|))
                        (XML-PATH::|PrefixTest/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|PrefixTest| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|QName| (INDEX &AUX (XML-PATH::|LocalPart| NIL) (XML-PATH::|Prefix| NIL))
  "QName ::= Prefix? LocalPart
(|LocalPart| |Prefix|)"
  (DECLARE (SPECIAL XML-PATH::|QName-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|QName-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|QName-INDEX| INDEX)
      (LET ((XML-PATH::|QName-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|QName| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|QName-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|QName|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|QName|)
                                 (RETURN-FROM XML-PATH::|QName| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|QName| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|QName.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|QName.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|QName|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|QName|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|QName|
                                                   INDEX
                                                   (LIST 'XML-PATH::|LocalPart|
                                                         XML-PATH::|LocalPart|
                                                         'XML-PATH::|Prefix|
                                                         XML-PATH::|Prefix|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|QName-Constructor| XML-PATH::|LocalPart| XML-PATH::|Prefix|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|QName|
                                                            (DELETE NIL (LIST XML-PATH::|LocalPart| XML-PATH::|Prefix|)))
                                                      'XML-PATH::|QName|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|QName/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PATH::|QName/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|QName/QName.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|QName/QName.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PATH::|LocalPart|)
                                     (COND ((XML-PATH::|IS-LocalPart| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|LocalPart|)
                                            (SETF XML-PATH::|LocalPart|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|LocalPart-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|LocalPart| |item|)
                                                          'XML-PATH::|LocalPart|)))
                                            (XML-PATH::|QName.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PATH::|LocalPart|) (XML-PATH::|QName/fail.3| INDEX))))))
                               (XML-PATH::|QName/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|QName/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PATH::|Prefix|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (XML-PATH::|Prefix| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PATH::|Prefix| RESULT))
                                              (XML-PATH::|QName/QName.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PATH::|Prefix|) (XML-PATH::|QName/QName.2.4| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|QName.2| XML-PATH::|QName/fail.3| XML-PATH::|QName/QName.2.4|
                                  XML-PATH::|QName/start.1|))
                        (XML-PATH::|QName/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|QName| INDEX *ATN-STACK)))
(DEFUN XML-PATH::|Prefix| (INDEX &AUX (XML-PATH::|NCName| NIL))
  "Prefix ::= NCName ':'
(|NCName|)"
  (DECLARE (SPECIAL XML-PATH::|Prefix-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PATH::|Prefix-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 3) (SAFETY 0)))
  (IF (< XML-PATH::|Prefix-INDEX| INDEX)
      (LET ((XML-PATH::|Prefix-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PATH::|Prefix| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PATH::|Prefix-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (|input.item| INDEX)))
          (%ATN-BLOCK XML-PATH::|Prefix|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PATH::|Prefix|)
                                 (RETURN-FROM XML-PATH::|Prefix| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PATH::|Prefix| (VALUES NIL INDEX NIL)))
                               (XML-PATH::|Prefix.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Prefix.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PATH::|Prefix|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PATH::|Prefix|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PATH::|Prefix|
                                                   INDEX
                                                   (LIST 'XML-PATH::|NCName| XML-PATH::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (XML-PATH::|Prefix-Constructor| XML-PATH::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PATH::|Prefix| (DELETE NIL (LIST XML-PATH::|NCName|)))
                                                      'XML-PATH::|Prefix|))))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PATH::|Prefix/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PATH::|Prefix/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PATH::|Prefix/Prefix.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Prefix/Prefix.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\:)
                                     (COND ((EQ |item| '|xml|:\:) (SETF *ATN-TERM* '|xml|:\:) (XML-PATH::|Prefix.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\:) (XML-PATH::|Prefix/fail.3| INDEX))))))
                               (XML-PATH::|Prefix/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PATH::|Prefix/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PATH::|NCName|)
                                     (COND ((XML-PATH::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PATH::|NCName|)
                                            (SETF XML-PATH::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PATH::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PATH::|NCName| |item|)
                                                          'XML-PATH::|NCName|)))
                                            (XML-PATH::|Prefix/Prefix.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PATH::|NCName|) (XML-PATH::|Prefix/fail.3| INDEX)))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PATH::|Prefix.2| XML-PATH::|Prefix/fail.3| XML-PATH::|Prefix/Prefix.2.4|
                                  XML-PATH::|Prefix/start.1|))
                        (XML-PATH::|Prefix/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        NIL
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PATH::|Prefix| INDEX *ATN-STACK)))
(SETF (GET 'XML-PATH::|LocationPath| :PRODUCTION) "
{1 } LocationPath ::= (RelativeLocationPath | AbsoluteLocationPath)")
(SETF (GET 'XML-PATH::|AbsoluteLocationPath| :PRODUCTION) "
{2 } AbsoluteLocationPath ::= ((SingleSlash
                                RelativeLocationPath?) | AbbreviatedAbsoluteLocationPath)")
(SETF (GET 'XML-PATH::|RelativeLocationPath| :PRODUCTION) "
{3 } RelativeLocationPath ::= Step (((SingleSlash | DoubleSlash))
                                    RelativeLocationPath)?")
(SETF (GET 'XML-PATH::|Step| :PRODUCTION) "
{4 } Step ::= ((AxisSpecifier NodeTest Predicate*) | (NodeTest
                                                      Predicate*) | AbbreviatedStep)")
(SETF (GET 'XML-PATH::|AxisSpecifier| :PRODUCTION) "
{5 } AxisSpecifier ::= ((AxisName '::') | AbbreviatedAxisSpecifier)")
(SETF (GET 'XML-PATH::|NodeTest| :PRODUCTION) "
{7 } NodeTest ::= (NameTest | TypeTest | PiTest)")
(SETF (GET 'XML-PATH::|TypeTest| :PRODUCTION) "
     TypeTest ::= NodeType '(' ')'")
(SETF (GET 'XML-PATH::|PiTest| :PRODUCTION) "
     PiTest ::= 'processing-instruction' '(' Literal ')'")
(SETF (GET 'XML-PATH::|Predicate| :PRODUCTION) "
{8 } Predicate ::= '[' PredicateExpr ']'")
(SETF (GET 'XML-PATH::|PredicateExpr| :PRODUCTION) "
{9 } PredicateExpr ::= Expr")
(SETF (GET 'XML-PATH::|AbbreviatedAbsoluteLocationPath| :PRODUCTION) "
{10} AbbreviatedAbsoluteLocationPath ::= DoubleSlash RelativeLocationPath")
(SETF (GET 'XML-PATH::|Expr| :PRODUCTION) "
{14} Expr ::= OrExpr")
(SETF (GET 'XML-PATH::|PrimaryExpr| :PRODUCTION) "
{15} PrimaryExpr ::= (Literal | Number | VariableReference | FunctionCall | ('('
                                                                             Expr
                                                                             ')'))")
(SETF (GET 'XML-PATH::|FunctionCall| :PRODUCTION) "
{16} FunctionCall ::= FunctionName '(' (Argument (',' Argument)*)? ')'")
(SETF (GET 'XML-PATH::|Argument| :PRODUCTION) "
{17} Argument ::= Expr")
(SETF (GET 'XML-PATH::|UnionExpr| :PRODUCTION) "
{18} UnionExpr ::= (PathExpr | (PathExpr unionOp UnionExpr))")
(SETF (GET 'XML-PATH::|PathExpr| :PRODUCTION) "
{19} PathExpr ::= ((FilterExpr
                    (((SingleSlash | DoubleSlash))
                     RelativeLocationPath)?) | LocationPath)")
(SETF (GET 'XML-PATH::|FilterExpr| :PRODUCTION) "
{20} FilterExpr ::= (PrimaryExpr | (Predicate FilterExpr))")
(SETF (GET 'XML-PATH::|OrExpr| :PRODUCTION) "
{21} OrExpr ::= AndExpr (orOp OrExpr)?")
(SETF (GET 'XML-PATH::|AndExpr| :PRODUCTION) "
{22} AndExpr ::= EqualityExpr (andOp AndExpr)?")
(SETF (GET 'XML-PATH::|EqualityExpr| :PRODUCTION) "
{23} EqualityExpr ::= RelationalExpr (EqualityOp EqualityExpr)?")
(SETF (GET 'XML-PATH::|RelationalExpr| :PRODUCTION) "
{24} RelationalExpr ::= AdditiveExpr (RelationalOp RelationalExpr)?")
(SETF (GET 'XML-PATH::|AdditiveExpr| :PRODUCTION) "
{25} AdditiveExpr ::= MultiplicativeExpr (AdditiveOp AdditiveExpr)?")
(SETF (GET 'XML-PATH::|MultiplicativeExpr| :PRODUCTION) "
{26} MultiplicativeExpr ::= UnaryExpr (MultiplicativeOp MultiplicativeExpr)?")
(SETF (GET 'XML-PATH::|UnaryExpr| :PRODUCTION) "
{27} UnaryExpr ::= (UnionExpr | AdditiveInverse)")
(SETF (GET 'XML-PATH::|AdditiveInverse| :PRODUCTION) "
     AdditiveInverse ::= '-' UnaryExpr")
(SETF (GET 'XML-PATH::|FunctionName| :PRODUCTION) "
{35} FunctionName ::= QName")
(SETF (GET 'XML-PATH::|VariableReference| :PRODUCTION) "
{36} VariableReference ::= '$' QName")
(SETF (GET 'XML-PATH::|NameTest| :PRODUCTION) "
{37} NameTest ::= PrefixTest? ((WildName | LocalPart))")
(SETF (GET 'XML-PATH::|PrefixTest| :PRODUCTION) "
     PrefixTest ::= ((WildName | NCName)) ':'")
(SETF (GET 'XML-PATH::|QName| :PRODUCTION) "
     QName ::= Prefix? LocalPart")
(SETF (GET 'XML-PATH::|Prefix| :PRODUCTION) "
     Prefix ::= NCName ':'")
(DEFUN XML-PATH::|LocationPath-Parser| (*ATN-INPUT &KEY ((:TRACE *ATN-TRACE*) *ATN-TRACE*)
                                        ((:TRACE-NETS *ATN-TRACE-NETS*) *ATN-TRACE-NETS*)
                                        ((:START-NAME *ATN-START-NAME) 'XML-PATH::|Expr|) ((:MODE *ATN-MODE) :MULTIPLE)
                                        ((:REDUCE *ATN-REDUCE*) T) ((:REGISTER-WORDS *ATN-REGISTER-WORDS) NIL) &ALLOW-OTHER-KEYS
                                        &AUX)
  "// generated 2009.03.23T01:49:19 based on \"xml:bnf;xpath-grammar.bnf\" from 2006.08.09T22:18:05.
/*
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this is the BNF for XML-PATH expressions.
  it is derived from the <a href='http://www.w3.org/TR/1999/REC-xpath-19991116'>REC-xpath-19991116</a>.
  it is the input bnf for <a href='file://xml/code/xpath/xpath-parser.lisp'>xml-parser.lisp</a>.
  </p>
  <p>
  nb. the numbers are as noted for the productions in that document.
  this formulation differs from the literal text of the recommendation in numerous regards.
  none of these differences is believed to affect the conformance of the resulting parser.
  expressions were reformulated because
  <ul>
  <li>the reader is inflexible with regard to delimiters</li>
  <li>the parser requires that grouping be explicit.</li>
  <li>the nonterminals from the xml recommendation are present.</li>
  <li>[35] specified a constraint which is just as well covered by the disambiguation
      rules for lexical structure (3.7)</li>
  <li>the atn is more effective if recursions are the last things to try and if
      alternatives are the first.</li>
  <li>tokens which need to be marked as part of phrase rules (as opposed to
      categories) are given their own production. this applies to expression operators
      and to abbreviations which must be distinguished. this includes necesarily
      '@', '.', and '..'. the marking was also done for '/' and '//' as it is necessary
      with in the PathExpr substructure.
      step separators, as they are already in their own productions.</li>
  <li>the original formulation put unary expressions ten layers down in the parse tree.</li>
  </ul></p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='&copy'
            href='file://xml/sysdcl.lisp' />
 <COPYRIGHT YEAR='1999' AUTHOR='w3c' MARK='&copy'
            smtp='site-policy@w3.org'
            href='file://xml/W3C-copyrightsoft-19980720.html'>
  Copyright &copy; 1999 <a href='http://www.w3.org/'>World Wide Web Consortium</a>,
   (<a href='http://www.lcs.mit.edu/'>Massachusetts Institute of Technology</a>,
    <a href='http://www.inria.fr/'>Institut National de Recherche en Informatique et en Automatique</a>,
    <a href='http://www.keio.ac.jp/'>Keio University</a>).
   All Rights Reserved. http://www.w3.org/Consortium/Legal/
  </COPYRIGHT>
 </DOCUMENTATION>
*/   



[[1]] LocationPath ::= RelativeLocationPath | AbsoluteLocationPath

[[2]] AbsoluteLocationPath ::= (SingleSlash RelativeLocationPath? )
   //                        | (Anchor SingleSlash RelativeLocationPath? )
                             | AbbreviatedAbsoluteLocationPath

//[[3]] RelativeLocationPath ::= ( Step SingleSlash RelativeLocationPath )
//                             | Step
//                             | AbbreviatedRelativeLocationPath

[[3]] RelativeLocationPath ::= Step ( ( SingleSlash | DoubleSlash ) RelativeLocationPath )?


[[4]] Step ::= ( AxisSpecifier NodeTest Predicate*)
             | ( NodeTest Predicate*)
             | AbbreviatedStep

[[5]] AxisSpecifier ::= (AxisName '::')  // no need to mark the '::'
                      | AbbreviatedAxisSpecifier 

// [[5.1]] from WD-xslt1.1-20001212
// Anchor ::= IdAnchor | KeyAnchor
// IdAnchor ::= 'id' '(' Literal ')'
// KeyAnchor ::= 'key' '(' Literal ',' Literal ')'

[[6]] AxisName ::= 'ancestor' | 'ancestor-or-self' | 'attribute' | 'child' | 'descendant'
                 | 'descendant-or-self' | 'following' | 'following-sibling' | 'namespace'
                 | 'parent' | 'preceding' | 'preceding-sibling' | 'self'

[[7]] NodeTest ::=  NameTest | TypeTest | PiTest
      TypeTest ::= NodeType '(' ')'
      PiTest ::= 'processing-instruction' '(' Literal ')'

[[8]] Predicate ::= '[' PredicateExpr ']'

[[9]] PredicateExpr ::= Expr

[[10]] AbbreviatedAbsoluteLocationPath ::= DoubleSlash RelativeLocationPath

// [[11]] AbbreviatedRelativeLocationPath ::= Step DoubleSlash RelativeLocationPath

[[12]] AbbreviatedStep ::= SingleDot | DoubleDot

[[13]] AbbreviatedAxisSpecifier ::= '@' 
// was   '@'? is more clearly expressed in the alternatives to step


[[14]] Expr ::= OrExpr
// a test Expr ::= QName | PrimaryExpr | OrExpr
   

[[15]] PrimaryExpr ::= Literal | Number | VariableReference | FunctionCall
                     | ( '(' Expr ')' )
// [[15.1]]
//                   | QName
                
[[16]] FunctionCall ::= FunctionName '(' ( Argument ( ',' Argument )* )? ')'
[[17]] Argument ::= Expr
//   FunctionCall ::= FunctionName '(' ArgumentSequence? ')'
//   ArgumentSequence ::= Argument (',' ArgumentSequence )?
   


[[18]] UnionExpr ::= PathExpr | (PathExpr unionOp UnionExpr)

[[19]] PathExpr ::= ( FilterExpr ( ( SingleSlash | DoubleSlash ) RelativeLocationPath )? ) 
                  | LocationPath  // as last in order to prefer simpler forms

[[20]] FilterExpr ::= PrimaryExpr | ( Predicate FilterExpr ) 

[[21]] OrExpr ::= AndExpr ( orOp OrExpr )?

[[22]] AndExpr ::= EqualityExpr ( andOp AndExpr )?

[[23]] EqualityExpr ::= RelationalExpr ( EqualityOp EqualityExpr )?
       EqualityOp ::= eqOp | neqOp

[[24]] RelationalExpr ::= AdditiveExpr ( RelationalOp RelationalExpr )?
       RelationalOp ::= ltOp | gtOp | leOp | geOp

[[25]] AdditiveExpr ::= MultiplicativeExpr ( AdditiveOp AdditiveExpr )?
       AdditiveOp ::= plusOp | minusOp

[[26]] MultiplicativeExpr ::= UnaryExpr ( MultiplicativeOp MultiplicativeExpr )?
       MultiplicativeOp ::= timesOp | divOp | modOp

[[27]] UnaryExpr ::= UnionExpr | AdditiveInverse
       AdditiveInverse ::= '-' UnaryExpr  // no need to mark the '-'

//[[28]]   
// ExprToken ::= '(' | ')' | '[' | ']' | '.' | '..' | '@' | ',' | '::'
//             | NameTest | NodeType | Operator | FunctionName | AxisName
//             | Literal | Number | VariableReference
//[[29]]   
//   Literal ::=   
//   ( DoubleQuote NotDoubleQuote* DoubleQuote )  | ( SingleQuote NotSingleQuote* SingleQuote )
//   SingleQuote ::= #x27
//   DoubleQuote ::= #x22
//   NotSingleQuote ::= [^#x27]
//   NotDoubleQuote ::= [^#x22]
//[[30]]   
//   Number ::=   
//   ( Digits ('.' Digits?)? ) | ( '.' Digits )
//   Digits ::= Digit+
//   Digit ::= [0-9]
//[[31]]   
//   Digits ::= Digit+
//   Digit ::= [0-9]
//[[32]]  
// Operator ::=   
// OperatorName | MultiplyOperator |
// '/' | '//' | '|' | '+' | '-' | '=' | '!=' | '<' | '<=' | '>' | '>='
//[[33]]  
// OperatorName ::=   
// 'and' | 'or' | 'mod' | 'div'
//[[34]]  
// MultiplyOperator ::=   
// '*'

   SingleDot ::= '.'
   DoubleDot ::= '..'
   SingleSlash ::= '/'
   DoubleSlash ::= '//'
   unionOp ::= '|'
   plusOp ::= '+'
   minusOp ::= '-'
   eqOp ::= '='
   neqOp ::= '!='
   ltOp ::= '<'
   gtOp ::= '>'
   leOp ::= '<='
   geOp ::= '>='
   andOp ::= 'and'
   orOp ::= 'or'
   modOp ::= 'mod'
   divOp ::= 'div'
   timesOp ::= '*'
   notOp ::= 'not'

  
// the literal bnf was 'QName - NodeType', which is not accepted by this parser
// it is sufficient to neglect it while constructing the parse tree and to
// enforce it as a semantic rule when generating the path processor
[[35]] FunctionName ::= QName

[[36]] VariableReference ::= '$' QName

// NameTest ::= '*' | ( NCName ':' '*' ) | QName
[[37]] NameTest ::= PrefixTest? ( WildName | LocalPart )
       PrefixTest ::= ( WildName | NCName ) ':'
       WildName ::= '*'

[[38]] NodeType ::= 'comment' | 'text' | 'processing-instruction' | 'node'

// [[39]]   
// this non-terminal is implied in the spec, but doesn't appear in the grammar.
// the lexical reader strips whitespace anyway, since it's based on the cl reader
//  ExprWhitespace ::=   
//   S


// additionals
   QName ::= Prefix? LocalPart

   Prefix ::= NCName ':'
   LocalPart ::= NCName

//
//
// NCName ::= NC*
//
// the 'name character' categorization is implicit in the lexical reader
// NC ::= [a-z] | [A-Z] | '.' | '-' | '_'
//
// S ::= #x09 | #x0a | #x0d | #x20

// EOF

"
  (DECLARE (SPECIAL *ATN-REDUCE* *ATN-MODE *ATN-INPUT))
  (LET ((*ATN-LEVEL 0)
        (*ATN-STACK '(XML-PATH::|LocationPath-Parser|))
        (*ATN-NODE NIL)
        (*ATN-PROPERTIES NIL)
        (*ATN-CLASS NIL)
        (XML-PATH::|LocationPath-INDEX| -1)
        (XML-PATH::|AbsoluteLocationPath-INDEX| -1)
        (XML-PATH::|RelativeLocationPath-INDEX| -1)
        (XML-PATH::|Step-INDEX| -1)
        (XML-PATH::|AxisSpecifier-INDEX| -1)
        (XML-PATH::|NodeTest-INDEX| -1)
        (XML-PATH::|TypeTest-INDEX| -1)
        (XML-PATH::|PiTest-INDEX| -1)
        (XML-PATH::|Predicate-INDEX| -1)
        (XML-PATH::|PredicateExpr-INDEX| -1)
        (XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX| -1)
        (XML-PATH::|Expr-INDEX| -1)
        (XML-PATH::|PrimaryExpr-INDEX| -1)
        (XML-PATH::|FunctionCall-INDEX| -1)
        (XML-PATH::|Argument-INDEX| -1)
        (XML-PATH::|UnionExpr-INDEX| -1)
        (XML-PATH::|PathExpr-INDEX| -1)
        (XML-PATH::|FilterExpr-INDEX| -1)
        (XML-PATH::|OrExpr-INDEX| -1)
        (XML-PATH::|AndExpr-INDEX| -1)
        (XML-PATH::|EqualityExpr-INDEX| -1)
        (XML-PATH::|RelationalExpr-INDEX| -1)
        (XML-PATH::|AdditiveExpr-INDEX| -1)
        (XML-PATH::|MultiplicativeExpr-INDEX| -1)
        (XML-PATH::|UnaryExpr-INDEX| -1)
        (XML-PATH::|AdditiveInverse-INDEX| -1)
        (XML-PATH::|FunctionName-INDEX| -1)
        (XML-PATH::|VariableReference-INDEX| -1)
        (XML-PATH::|NameTest-INDEX| -1)
        (XML-PATH::|PrefixTest-INDEX| -1)
        (XML-PATH::|QName-INDEX| -1)
        (XML-PATH::|Prefix-INDEX| -1)
        (ATN-NET-NAMES
         '(XML-PATH::|LocationPath| XML-PATH::|AbsoluteLocationPath| XML-PATH::|RelativeLocationPath| XML-PATH::|Step|
           XML-PATH::|AxisSpecifier| XML-PATH::|NodeTest| XML-PATH::|TypeTest| XML-PATH::|PiTest| XML-PATH::|Predicate|
           XML-PATH::|PredicateExpr| XML-PATH::|AbbreviatedAbsoluteLocationPath| XML-PATH::|Expr| XML-PATH::|PrimaryExpr|
           XML-PATH::|FunctionCall| XML-PATH::|Argument| XML-PATH::|UnionExpr| XML-PATH::|PathExpr| XML-PATH::|FilterExpr|
           XML-PATH::|OrExpr| XML-PATH::|AndExpr| XML-PATH::|EqualityExpr| XML-PATH::|RelationalExpr| XML-PATH::|AdditiveExpr|
           XML-PATH::|MultiplicativeExpr| XML-PATH::|UnaryExpr| XML-PATH::|AdditiveInverse| XML-PATH::|FunctionName|
           XML-PATH::|VariableReference| XML-PATH::|NameTest| XML-PATH::|PrefixTest| XML-PATH::|QName| XML-PATH::|Prefix|)))
    (DECLARE (SPECIAL XML-PATH::|LocationPath-INDEX| XML-PATH::|AbsoluteLocationPath-INDEX| XML-PATH::|RelativeLocationPath-INDEX|
              XML-PATH::|Step-INDEX| XML-PATH::|AxisSpecifier-INDEX| XML-PATH::|NodeTest-INDEX| XML-PATH::|TypeTest-INDEX|
              XML-PATH::|PiTest-INDEX| XML-PATH::|Predicate-INDEX| XML-PATH::|PredicateExpr-INDEX|
              XML-PATH::|AbbreviatedAbsoluteLocationPath-INDEX| XML-PATH::|Expr-INDEX| XML-PATH::|PrimaryExpr-INDEX|
              XML-PATH::|FunctionCall-INDEX| XML-PATH::|Argument-INDEX| XML-PATH::|UnionExpr-INDEX| XML-PATH::|PathExpr-INDEX|
              XML-PATH::|FilterExpr-INDEX| XML-PATH::|OrExpr-INDEX| XML-PATH::|AndExpr-INDEX| XML-PATH::|EqualityExpr-INDEX|
              XML-PATH::|RelationalExpr-INDEX| XML-PATH::|AdditiveExpr-INDEX| XML-PATH::|MultiplicativeExpr-INDEX|
              XML-PATH::|UnaryExpr-INDEX| XML-PATH::|AdditiveInverse-INDEX| XML-PATH::|FunctionName-INDEX|
              XML-PATH::|VariableReference-INDEX| XML-PATH::|NameTest-INDEX| XML-PATH::|PrefixTest-INDEX| XML-PATH::|QName-INDEX|
              XML-PATH::|Prefix-INDEX|))
    (UNLESS (FIND *ATN-START-NAME ATN-NET-NAMES)
      (ERROR "production not defined in system: ~s: ~s." *ATN-START-NAME 'XML-PATH::|LocationPath-Parser|))
    (UNLESS (FBOUNDP *ATN-START-NAME) (ERROR "parse function missing: ~s: ~s." *ATN-START-NAME 'XML-PATH::|LocationPath-Parser|))
    (HANDLER-BIND ((CONTINUABLE-PARSER-ERROR #'(LAMBDA (CONDITION) (SIGNAL CONDITION)))
                   (TERMINAL-PARSER-ERROR
                    #'(LAMBDA (CONDITION &AUX (ACTION (CONDITION-ACTION CONDITION)))
                        (ETYPECASE ACTION
                          (NULL)
                          (KEYWORD
                           (ECASE ACTION
                             (:ABORT
                              (WHEN *ATN-TRACE* (WARN "terminating parse on condition: ~a: Context ~s." CONDITION *ATN-INPUT))
                              (RETURN-FROM XML-PATH::|LocationPath-Parser| (VALUES NIL CONDITION NIL)))
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
                      (FUNCALL *ATN-START-NAME 0)
                    (COND (SUCCESS (RETURN-FROM XML-PATH::|LocationPath-Parser| (VALUES RESULT INDEX (|input.is-at-end| INDEX))))
                          (T (RETURN-FROM XML-PATH::|LocationPath-Parser| (VALUES NIL INDEX NIL))))))))