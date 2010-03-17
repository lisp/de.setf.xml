
(IN-PACKAGE "ATN-PARSER") 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-QName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-Nmtoken|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-YesOrNo|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-StringType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-TokenizedType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-CDStart|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-CDEnd|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-Cardinality|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IS-MixedCardinality|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Document|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Root|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Names|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Nmtokens|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EntityValue|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttValue|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttChildSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttChild|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DefaultAttValue|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DefaultAttChildSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DefaultAttChild|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|SystemLiteral|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|PubidLiteral|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Comment|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Pi|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|CDSect|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Prolog|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DoctypeProlog|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|XMLDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|VersionInfo|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Eq|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|MiscSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Misc|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DoctypeDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IntSubsetDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DeclSep|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|MarkupDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ExtSubset|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ExtSubsetDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|SDDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Element|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|STag|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttributeSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Attribute|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ETag|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Content|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ElementDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ContentSpec|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Children|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Cp|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ChoiceOrSeq|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Choice|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Seq|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Mixed|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttlistDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttDefSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttDef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|AttType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EnumeratedType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|NotationType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|NotationTypeSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Enumeration|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EnumerationSequence|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|DefaultDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ConditionalSect|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IncludeSect|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IgnoreSect|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|IgnoreSectContents|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Ignore|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|NamedConditionalSect|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|CharRef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Reference|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EntityRef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|PEReference|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EntityDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|GEDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|PEDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EntityDef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|PEDef|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ExternalID|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|NDataDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|TextDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|ExtParsedEnt|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|EncodingDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|NotationDecl|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|PublicID|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) XML-PARSER::|Document-Parser|)) 
(DEFUN XML-PARSER::|IS-QName| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (XML-PARSER::|IS-QNameCharData| ITEM)))))
(DEFUN XML-PARSER::|IS-Nmtoken| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (XML-PARSER::|IS-NameCharData| ITEM)))))
(DEFUN XML-PARSER::|IS-YesOrNo| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (XML-PARSER::|IS-yesToken| ITEM) (XML-PARSER::|IS-noToken| ITEM)))))
(DEFUN XML-PARSER::|IS-StringType| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (XML-PARSER::|IS-CDATAToken| ITEM)))))
(DEFUN XML-PARSER::|IS-TokenizedType| (ITEM)
  (%ATN-TRACE-FORM
    (AND ITEM
         (OR (XML-PARSER::|IS-IDToken| ITEM)
             (XML-PARSER::|IS-IDREFToken| ITEM)
             (XML-PARSER::|IS-IDREFSToken| ITEM)
             (XML-PARSER::|IS-ENTITYToken| ITEM)
             (XML-PARSER::|IS-ENTITIESToken| ITEM)
             (XML-PARSER::|IS-NMTOKENToken| ITEM)
             (XML-PARSER::|IS-NMTOKENSToken| ITEM)))))
(DEFUN XML-PARSER::|IS-CDStart| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:<![CDATA[)))))
(DEFUN XML-PARSER::|IS-CDEnd| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:]]>)))))
(DEFUN XML-PARSER::|IS-Cardinality| (ITEM)
  (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:?) (EQ ITEM '|xml|:+) (EQ ITEM '|xml|:*)))))
(DEFUN XML-PARSER::|IS-MixedCardinality| (ITEM) (%ATN-TRACE-FORM (AND ITEM (OR (EQ ITEM '|xml|:*)))))
(DEFUN XML-PARSER::|Document| (INDEX &AUX (XML-PARSER::|MiscSequence| NIL) (XML-PARSER::|Prolog| NIL) (XML-PARSER::|Root| NIL))
  "{1 } Document ::= Prolog Root MiscSequence?
(|MiscSequence| |Prolog| |Root|)"
  (DECLARE (SPECIAL XML-PARSER::|Document-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Document-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Document-INDEX| INDEX)
      (LET ((XML-PARSER::|Document-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Document| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|Document-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|Document-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Document|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Document|)
                                 (RETURN-FROM XML-PARSER::|Document| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Document| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Document.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Document.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Document|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Document|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Document|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|MiscSequence|
                                                         XML-PARSER::|MiscSequence|
                                                         'XML-PARSER::|Prolog|
                                                         XML-PARSER::|Prolog|
                                                         'XML-PARSER::|Root|
                                                         XML-PARSER::|Root|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|Document-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|MiscSequence|
                                                    XML-PARSER::|Prolog|
                                                    XML-PARSER::|Root|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Document|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|MiscSequence|
                                                                          XML-PARSER::|Prolog|
                                                                          XML-PARSER::|Root|)))
                                                      'XML-PARSER::|Document|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Document| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Document/Document.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Document/Document.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Root|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Root| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Root| RESULT))
                                              (XML-PARSER::|Document/Document.2.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Root|) (XML-PARSER::|Document/fail.3| INDEX)))))))
                               (XML-PARSER::|Document/Document.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Document/Document.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|MiscSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|MiscSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|MiscSequence| RESULT))
                                              (XML-PARSER::|Document.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|MiscSequence|)
                                              (XML-PARSER::|Document.2| INDEX)))))))
                               (XML-PARSER::|Document/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Document/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Document/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Document/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Prolog|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Prolog| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Prolog| RESULT))
                                              (XML-PARSER::|Document/Document.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Prolog|)
                                              (XML-PARSER::|Document/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Document.2| XML-PARSER::|Document/Document.2.4|
                          XML-PARSER::|Document/Document.2.5| XML-PARSER::|Document/fail.3| XML-PARSER::|Document/start.1|))
                        (XML-PARSER::|Document/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Document| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Document| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Root| (INDEX &AUX (XML-PARSER::|Element| NIL))
  "Root ::= Element
(|Element|)"
  (DECLARE (SPECIAL XML-PARSER::|Root-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Root-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Root-INDEX| INDEX)
      (LET ((XML-PARSER::|Root-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Root| *ATN-STACK))
            (XML-QUERY-DATA-MODEL:*NAMESPACE-BINDINGS* (XML-QUERY-DATA-MODEL:MAKE-DOCUMENT-NAMESPACE-BINDINGS)))
        (DECLARE (SPECIAL XML-PARSER::|Root-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Root|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Root|)
                                 (RETURN-FROM XML-PARSER::|Root| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Root| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Root.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Root.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Root|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Root|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Root|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Element| XML-PARSER::|Element|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|Root-Constructor| XML-PARSER::|Element|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Root| (DELETE NIL (LIST XML-PARSER::|Element|)))
                                                      'XML-PARSER::|Root|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Root| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Root/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|Root/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Root/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Root/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Element|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Element| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Element| RESULT))
                                              (XML-PARSER::|Root.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Element|) (XML-PARSER::|Root/fail.3| INDEX))))))))
                        (DECLARE (INLINE SUCCEED FAIL XML-PARSER::|Root.2| XML-PARSER::|Root/fail.3| XML-PARSER::|Root/start.1|))
                        (XML-PARSER::|Root/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Root| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Root| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Names| (INDEX &AUX (XML-PARSER::|Names| NIL) (XML-PARSER::|NCName| NIL))
  "{6 } Names ::= NCName (S Names)?
(|Names| |NCName|)"
  (DECLARE (SPECIAL XML-PARSER::|Names-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Names-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Names-INDEX| INDEX)
      (LET ((XML-PARSER::|Names-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Names| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Names-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Names|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Names|)
                                 (RETURN-FROM XML-PARSER::|Names| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Names| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Names.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Names.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Names|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Names|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Names|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Names|
                                                         XML-PARSER::|Names|
                                                         'XML-PARSER::|NCName|
                                                         XML-PARSER::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Names-Constructor|
                                                    XML-PARSER::|Names|
                                                    XML-PARSER::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Names|
                                                            (DELETE NIL (LIST XML-PARSER::|Names| XML-PARSER::|NCName|)))
                                                      'XML-PARSER::|Names|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Names| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Names/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Names/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Names/Names.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Names/Names.2.4|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Names/Names.2.5|) (XML-PARSER::|Names/Names.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Names.2|) (XML-PARSER::|Names.2| INDEX))))
                               (XML-PARSER::|Names/Names.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Names/Names.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Names/Names.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|Names/Names.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Names/Names.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Names|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Names| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Names| RESULT))
                                              (XML-PARSER::|Names.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Names|) NIL))))))
                               (XML-PARSER::|Names/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Names/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|Names/Names.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|NCName|) (XML-PARSER::|Names/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Names.2| XML-PARSER::|Names/fail.3| XML-PARSER::|Names/Names.2.4|
                          XML-PARSER::|Names/Names.2.5| XML-PARSER::|Names/Names.2.6| XML-PARSER::|Names/start.1|))
                        (XML-PARSER::|Names/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Names| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Names| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Nmtokens| (INDEX &AUX (XML-PARSER::|Nmtoken| NIL) (XML-PARSER::|Nmtokens| NIL))
  "{8 } Nmtokens ::= Nmtoken (S Nmtokens)?
(|Nmtoken| |Nmtokens|)"
  (DECLARE (SPECIAL XML-PARSER::|Nmtokens-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Nmtokens-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Nmtokens-INDEX| INDEX)
      (LET ((XML-PARSER::|Nmtokens-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Nmtokens| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Nmtokens-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Nmtokens|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Nmtokens|)
                                 (RETURN-FROM XML-PARSER::|Nmtokens| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Nmtokens| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Nmtokens.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Nmtokens.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Nmtokens|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Nmtokens|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Nmtokens|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Nmtoken|
                                                         XML-PARSER::|Nmtoken|
                                                         'XML-PARSER::|Nmtokens|
                                                         XML-PARSER::|Nmtokens|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Nmtokens-Constructor|
                                                    XML-PARSER::|Nmtoken|
                                                    XML-PARSER::|Nmtokens|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Nmtokens|
                                                            (DELETE NIL (LIST XML-PARSER::|Nmtoken| XML-PARSER::|Nmtokens|)))
                                                      'XML-PARSER::|Nmtokens|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Nmtokens| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Nmtokens/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Nmtokens/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Nmtokens/Nmtokens.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Nmtokens/Nmtokens.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|Nmtokens/Nmtokens.2.5|)
                                     (XML-PARSER::|Nmtokens/Nmtokens.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Nmtokens.2|) (XML-PARSER::|Nmtokens.2| INDEX))))
                               (XML-PARSER::|Nmtokens/Nmtokens.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Nmtokens/Nmtokens.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Nmtokens/Nmtokens.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|Nmtokens/Nmtokens.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Nmtokens/Nmtokens.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Nmtokens|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Nmtokens| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Nmtokens| RESULT))
                                              (XML-PARSER::|Nmtokens.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Nmtokens|) NIL))))))
                               (XML-PARSER::|Nmtokens/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Nmtokens/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|Nmtoken|)
                                     (COND ((XML-PARSER::|IS-Nmtoken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|Nmtoken|)
                                            (SETF XML-PARSER::|Nmtoken|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|Nmtoken-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|Nmtoken| |item|)
                                                          'XML-PARSER::|Nmtoken|)))
                                            (XML-PARSER::|Nmtokens/Nmtokens.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|Nmtoken|) (XML-PARSER::|Nmtokens/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Nmtokens.2| XML-PARSER::|Nmtokens/fail.3|
                          XML-PARSER::|Nmtokens/Nmtokens.2.4| XML-PARSER::|Nmtokens/Nmtokens.2.5|
                          XML-PARSER::|Nmtokens/Nmtokens.2.6| XML-PARSER::|Nmtokens/start.1|))
                        (XML-PARSER::|Nmtokens/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Nmtokens| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Nmtokens| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EntityValue| (INDEX &AUX (XML-PARSER::|EntityData| NIL))
  "{9 } EntityValue ::= (('\"' EntityData? '\"') | (''' EntityData? '''))
(|EntityData|)"
  (DECLARE (SPECIAL XML-PARSER::|EntityValue-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EntityValue-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EntityValue-INDEX| INDEX)
      (LET ((XML-PARSER::|EntityValue-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EntityValue| *ATN-STACK))
            (XML-PARSER::*IN-ENTITY-VALUE* T)
            (XML-UTILS:*PARSETABLE* XML-PARSER::|EntityValue-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|EntityValue-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EntityValue|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EntityValue|)
                                 (RETURN-FROM XML-PARSER::|EntityValue| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EntityValue| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EntityValue.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EntityValue|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EntityValue|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EntityValue|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EntityData| XML-PARSER::|EntityData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|EntityValue-Constructor|
                                                    XML-PARSER::|EntityData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EntityValue|
                                                            (DELETE NIL (LIST XML-PARSER::|EntityData|)))
                                                      'XML-PARSER::|EntityValue|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|EntityValue| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EntityValue/EntityValue.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/EntityValue.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|EntityValue/EntityValue.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|EntityValue/EntityValue.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/EntityValue.2.5|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|EntityData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|EntityData|)
                                       (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                                       (COND ((XML-PARSER::|IS-EntityData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|EntityData|)
                                              (SETF XML-PARSER::|EntityData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|EntityData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|EntityData| |item|)
                                                            'XML-PARSER::|EntityData|)))
                                              (XML-PARSER::|EntityValue/EntityValue.2.6| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|EntityData|)
                                              (XML-PARSER::|EntityValue/EntityValue.2.6| INDEX)))))))
                               (XML-PARSER::|EntityValue/EntityValue.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/EntityValue.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|EntityValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|EntityValue/EntityValue.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/EntityValue.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|EntityValue/EntityValue.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|EntityValue/EntityValue.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/EntityValue.2.8|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|EntityData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|EntityData|)
                                       (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                                       (COND ((XML-PARSER::|IS-EntityData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|EntityData|)
                                              (SETF XML-PARSER::|EntityData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|EntityData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|EntityData| |item|)
                                                            'XML-PARSER::|EntityData|)))
                                              (XML-PARSER::|EntityValue/EntityValue.2.9| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|EntityData|)
                                              (XML-PARSER::|EntityValue/EntityValue.2.9| INDEX)))))))
                               (XML-PARSER::|EntityValue/EntityValue.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/EntityValue.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|EntityValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|EntityValue/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EntityValue/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EntityValue/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityValue/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|EntityValue/EntityValue.2.4|)
                                           (XML-PARSER::|EntityValue/EntityValue.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|EntityValue/EntityValue.2.7|)
                                           (XML-PARSER::|EntityValue/EntityValue.2.7| INDEX))
                                         (XML-PARSER::|EntityValue/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EntityValue.2| XML-PARSER::|EntityValue/EntityValue.2.4|
                          XML-PARSER::|EntityValue/EntityValue.2.5| XML-PARSER::|EntityValue/EntityValue.2.6|
                          XML-PARSER::|EntityValue/EntityValue.2.7| XML-PARSER::|EntityValue/EntityValue.2.8|
                          XML-PARSER::|EntityValue/EntityValue.2.9| XML-PARSER::|EntityValue/fail.3|
                          XML-PARSER::|EntityValue/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|EntityValue/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EntityValue| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EntityValue| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttValue| (INDEX &AUX (XML-PARSER::|AttChildSequence| NIL))
  "{10} AttValue ::= (('\"' AttChildSequence? '\"') | (''' AttChildSequence? '''))
(|AttChildSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|AttValue-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttValue-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttValue-INDEX| INDEX)
      (LET ((XML-PARSER::|AttValue-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttValue| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|AttValue-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|AttValue-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttValue|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttValue|)
                                 (RETURN-FROM XML-PARSER::|AttValue| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttValue| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttValue.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttValue|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttValue|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttValue|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttChildSequence| XML-PARSER::|AttChildSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttValue-Constructor|
                                                    XML-PARSER::|AttChildSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttValue|
                                                            (DELETE NIL (LIST XML-PARSER::|AttChildSequence|)))
                                                      'XML-PARSER::|AttValue|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttValue| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttValue/AttValue.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/AttValue.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|AttValue/AttValue.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|AttValue/AttValue.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/AttValue.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttChildSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttChildSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttChildSequence| RESULT))
                                              (XML-PARSER::|AttValue/AttValue.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttChildSequence|)
                                              (XML-PARSER::|AttValue/AttValue.2.6| INDEX)))))))
                               (XML-PARSER::|AttValue/AttValue.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/AttValue.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|AttValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|AttValue/AttValue.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/AttValue.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|AttValue/AttValue.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|AttValue/AttValue.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/AttValue.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttChildSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttChildSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttChildSequence| RESULT))
                                              (XML-PARSER::|AttValue/AttValue.2.9| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttChildSequence|)
                                              (XML-PARSER::|AttValue/AttValue.2.9| INDEX)))))))
                               (XML-PARSER::|AttValue/AttValue.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/AttValue.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|AttValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|AttValue/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttValue/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttValue/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttValue/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|AttValue/AttValue.2.4|)
                                           (XML-PARSER::|AttValue/AttValue.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|AttValue/AttValue.2.7|)
                                           (XML-PARSER::|AttValue/AttValue.2.7| INDEX))
                                         (XML-PARSER::|AttValue/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttValue.2| XML-PARSER::|AttValue/AttValue.2.4|
                          XML-PARSER::|AttValue/AttValue.2.5| XML-PARSER::|AttValue/AttValue.2.6|
                          XML-PARSER::|AttValue/AttValue.2.7| XML-PARSER::|AttValue/AttValue.2.8|
                          XML-PARSER::|AttValue/AttValue.2.9| XML-PARSER::|AttValue/fail.3| XML-PARSER::|AttValue/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|AttValue/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttValue| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttValue| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttChildSequence| (INDEX &AUX (XML-PARSER::|AttChild| NIL) (XML-PARSER::|AttChildSequence| NIL))
  "AttChildSequence ::= AttChild AttChildSequence?
(|AttChild| |AttChildSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|AttChildSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttChildSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttChildSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|AttChildSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttChildSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|AttChildSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttChildSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttChildSequence|)
                                 (RETURN-FROM XML-PARSER::|AttChildSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttChildSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttChildSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttChildSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttChildSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttChildSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttChildSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttChild|
                                                         XML-PARSER::|AttChild|
                                                         'XML-PARSER::|AttChildSequence|
                                                         XML-PARSER::|AttChildSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttChildSequence-Constructor|
                                                    XML-PARSER::|AttChild|
                                                    XML-PARSER::|AttChildSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttChildSequence|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|AttChild| XML-PARSER::|AttChildSequence|)))
                                                      'XML-PARSER::|AttChildSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttChildSequence| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttChildSequence/AttChildSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttChildSequence/AttChildSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttChildSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttChildSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttChildSequence| RESULT))
                                              (XML-PARSER::|AttChildSequence.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttChildSequence|)
                                              (XML-PARSER::|AttChildSequence.2| INDEX)))))))
                               (XML-PARSER::|AttChildSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttChildSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttChildSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttChildSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttChild|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttChild| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttChild| RESULT))
                                              (XML-PARSER::|AttChildSequence/AttChildSequence.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttChild|)
                                              (XML-PARSER::|AttChildSequence/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttChildSequence.2| XML-PARSER::|AttChildSequence/AttChildSequence.2.4|
                          XML-PARSER::|AttChildSequence/fail.3| XML-PARSER::|AttChildSequence/start.1|))
                        (XML-PARSER::|AttChildSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttChildSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttChildSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttChild| (INDEX &AUX (XML-PARSER::|AttCharData| NIL) (XML-PARSER::|ParsedReference| NIL)
                               (XML-PARSER::|Reference| NIL))
  "AttChild ::= (AttCharData | Reference | ParsedReference)
(|AttCharData| |ParsedReference| |Reference|)"
  (DECLARE (SPECIAL XML-PARSER::|AttChild-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttChild-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttChild-INDEX| INDEX)
      (LET ((XML-PARSER::|AttChild-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttChild| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|AttChild-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|AttChild-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttChild|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttChild|)
                                 (RETURN-FROM XML-PARSER::|AttChild| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttChild| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttChild.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttChild.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttChild|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttChild|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttChild|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttCharData|
                                                         XML-PARSER::|AttCharData|
                                                         'XML-PARSER::|ParsedReference|
                                                         XML-PARSER::|ParsedReference|
                                                         'XML-PARSER::|Reference|
                                                         XML-PARSER::|Reference|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttChild-Constructor|
                                                    XML-PARSER::|AttCharData|
                                                    XML-PARSER::|ParsedReference|
                                                    XML-PARSER::|Reference|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttChild|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|AttCharData|
                                                                          XML-PARSER::|ParsedReference|
                                                                          XML-PARSER::|Reference|)))
                                                      'XML-PARSER::|AttChild|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttChild| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttChild/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttChild/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttChild/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttChild/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|AttCharData|)
                                           (COND ((XML-PARSER::|IS-AttCharData| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|AttCharData|)
                                                  (SETF XML-PARSER::|AttCharData|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM-WITH-CONTEXT
                                                              #'XML-PARSER:|AttCharData-Constructor|
                                                              XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                              |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|AttCharData| |item|)
                                                                'XML-PARSER::|AttCharData|)))
                                                  (XML-PARSER::|AttChild.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|AttCharData|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Reference|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Reference| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Reference| RESULT))
                                                    (XML-PARSER::|AttChild.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Reference|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|ParsedReference|)
                                           (COND ((XML-PARSER::|IS-ParsedReference| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|ParsedReference|)
                                                  (SETF XML-PARSER::|ParsedReference|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|ParsedReference-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|ParsedReference| |item|)
                                                                'XML-PARSER::|ParsedReference|)))
                                                  (XML-PARSER::|AttChild.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|ParsedReference|) NIL)))
                                         (XML-PARSER::|AttChild/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttChild.2| XML-PARSER::|AttChild/fail.3|
                          XML-PARSER::|AttChild/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|AttChild/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttChild| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttChild| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DefaultAttValue| (INDEX &AUX (XML-PARSER::|DefaultAttChildSequence| NIL))
  "DefaultAttValue ::= (('\"' DefaultAttChildSequence? '\"') | ('''
                                                                DefaultAttChildSequence?
                                                                '''))
(|DefaultAttChildSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|DefaultAttValue-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DefaultAttValue-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DefaultAttValue-INDEX| INDEX)
      (LET ((XML-PARSER::|DefaultAttValue-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DefaultAttValue| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|DefaultAttValue-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|DefaultAttValue-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DefaultAttValue|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttValue|)
                                 (RETURN-FROM XML-PARSER::|DefaultAttValue| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DefaultAttValue| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DefaultAttValue.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DefaultAttValue|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttValue|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DefaultAttValue|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DefaultAttChildSequence|
                                                         XML-PARSER::|DefaultAttChildSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DefaultAttValue-Constructor|
                                                    XML-PARSER::|DefaultAttChildSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DefaultAttValue|
                                                            (DELETE NIL (LIST XML-PARSER::|DefaultAttChildSequence|)))
                                                      'XML-PARSER::|DefaultAttValue|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|DefaultAttValue| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/DefaultAttValue.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/DefaultAttValue.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DefaultAttChildSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DefaultAttChildSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DefaultAttChildSequence| RESULT))
                                              (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DefaultAttChildSequence|)
                                              (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.6| INDEX)))))))
                               (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/DefaultAttValue.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|DefaultAttValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/DefaultAttValue.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/DefaultAttValue.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DefaultAttChildSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DefaultAttChildSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DefaultAttChildSequence| RESULT))
                                              (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.9| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DefaultAttChildSequence|)
                                              (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.9| INDEX)))))))
                               (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/DefaultAttValue.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|DefaultAttValue.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|DefaultAttValue/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DefaultAttValue/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DefaultAttValue/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttValue/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|DefaultAttValue/DefaultAttValue.2.4|)
                                           (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|DefaultAttValue/DefaultAttValue.2.7|)
                                           (XML-PARSER::|DefaultAttValue/DefaultAttValue.2.7| INDEX))
                                         (XML-PARSER::|DefaultAttValue/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DefaultAttValue.2| XML-PARSER::|DefaultAttValue/DefaultAttValue.2.4|
                          XML-PARSER::|DefaultAttValue/DefaultAttValue.2.5| XML-PARSER::|DefaultAttValue/DefaultAttValue.2.6|
                          XML-PARSER::|DefaultAttValue/DefaultAttValue.2.7| XML-PARSER::|DefaultAttValue/DefaultAttValue.2.8|
                          XML-PARSER::|DefaultAttValue/DefaultAttValue.2.9| XML-PARSER::|DefaultAttValue/fail.3|
                          XML-PARSER::|DefaultAttValue/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|DefaultAttValue/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DefaultAttValue| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DefaultAttValue| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DefaultAttChildSequence| (INDEX &AUX (XML-PARSER::|DefaultAttChild| NIL)
                                              (XML-PARSER::|DefaultAttChildSequence| NIL))
  "DefaultAttChildSequence ::= DefaultAttChild DefaultAttChildSequence?
(|DefaultAttChild| |DefaultAttChildSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|DefaultAttChildSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DefaultAttChildSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DefaultAttChildSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|DefaultAttChildSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DefaultAttChildSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|DefaultAttChildSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DefaultAttChildSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttChildSequence|)
                                 (RETURN-FROM XML-PARSER::|DefaultAttChildSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DefaultAttChildSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DefaultAttChildSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttChildSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DefaultAttChildSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttChildSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DefaultAttChildSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DefaultAttChild|
                                                         XML-PARSER::|DefaultAttChild|
                                                         'XML-PARSER::|DefaultAttChildSequence|
                                                         XML-PARSER::|DefaultAttChildSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DefaultAttChildSequence-Constructor|
                                                    XML-PARSER::|DefaultAttChild|
                                                    XML-PARSER::|DefaultAttChildSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DefaultAttChildSequence|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|DefaultAttChild|
                                                                          XML-PARSER::|DefaultAttChildSequence|)))
                                                      'XML-PARSER::|DefaultAttChildSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT*
                                                   " -> ~a: ~s"
                                                   'XML-PARSER::|DefaultAttChildSequence|
                                                   RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DefaultAttChildSequence/DefaultAttChildSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttChildSequence/DefaultAttChildSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DefaultAttChildSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DefaultAttChildSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DefaultAttChildSequence| RESULT))
                                              (XML-PARSER::|DefaultAttChildSequence.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DefaultAttChildSequence|)
                                              (XML-PARSER::|DefaultAttChildSequence.2| INDEX)))))))
                               (XML-PARSER::|DefaultAttChildSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DefaultAttChildSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DefaultAttChildSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttChildSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DefaultAttChild|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DefaultAttChild| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DefaultAttChild| RESULT))
                                              (XML-PARSER::|DefaultAttChildSequence/DefaultAttChildSequence.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DefaultAttChild|)
                                              (XML-PARSER::|DefaultAttChildSequence/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DefaultAttChildSequence.2|
                          XML-PARSER::|DefaultAttChildSequence/DefaultAttChildSequence.2.4|
                          XML-PARSER::|DefaultAttChildSequence/fail.3| XML-PARSER::|DefaultAttChildSequence/start.1|))
                        (XML-PARSER::|DefaultAttChildSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DefaultAttChildSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DefaultAttChildSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DefaultAttChild| (INDEX &AUX (XML-PARSER::|DefaultAttCharData| NIL) (XML-PARSER::|ParsedReference| NIL)
                                      (XML-PARSER::|Reference| NIL))
  "DefaultAttChild ::= (DefaultAttCharData | Reference | ParsedReference)
(|DefaultAttCharData| |ParsedReference| |Reference|)"
  (DECLARE (SPECIAL XML-PARSER::|DefaultAttChild-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DefaultAttChild-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DefaultAttChild-INDEX| INDEX)
      (LET ((XML-PARSER::|DefaultAttChild-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DefaultAttChild| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|DefaultAttChild-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|DefaultAttChild-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DefaultAttChild|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttChild|)
                                 (RETURN-FROM XML-PARSER::|DefaultAttChild| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DefaultAttChild| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DefaultAttChild.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttChild.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DefaultAttChild|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttChild|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DefaultAttChild|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DefaultAttCharData|
                                                         XML-PARSER::|DefaultAttCharData|
                                                         'XML-PARSER::|ParsedReference|
                                                         XML-PARSER::|ParsedReference|
                                                         'XML-PARSER::|Reference|
                                                         XML-PARSER::|Reference|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DefaultAttChild-Constructor|
                                                    XML-PARSER::|DefaultAttCharData|
                                                    XML-PARSER::|ParsedReference|
                                                    XML-PARSER::|Reference|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DefaultAttChild|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|DefaultAttCharData|
                                                                          XML-PARSER::|ParsedReference|
                                                                          XML-PARSER::|Reference|)))
                                                      'XML-PARSER::|DefaultAttChild|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|DefaultAttChild| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DefaultAttChild/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DefaultAttChild/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DefaultAttChild/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultAttChild/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|DefaultAttCharData|)
                                           (COND ((XML-PARSER::|IS-DefaultAttCharData| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|DefaultAttCharData|)
                                                  (SETF XML-PARSER::|DefaultAttCharData|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM-WITH-CONTEXT
                                                              #'XML-PARSER::|DefaultAttCharData-Constructor|
                                                              XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                              |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|DefaultAttCharData| |item|)
                                                                'XML-PARSER::|DefaultAttCharData|)))
                                                  (XML-PARSER::|DefaultAttChild.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|DefaultAttCharData|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Reference|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Reference| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Reference| RESULT))
                                                    (XML-PARSER::|DefaultAttChild.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Reference|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|ParsedReference|)
                                           (COND ((XML-PARSER::|IS-ParsedReference| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|ParsedReference|)
                                                  (SETF XML-PARSER::|ParsedReference|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|ParsedReference-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|ParsedReference| |item|)
                                                                'XML-PARSER::|ParsedReference|)))
                                                  (XML-PARSER::|DefaultAttChild.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|ParsedReference|) NIL)))
                                         (XML-PARSER::|DefaultAttChild/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DefaultAttChild.2| XML-PARSER::|DefaultAttChild/fail.3|
                          XML-PARSER::|DefaultAttChild/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|DefaultAttChild/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DefaultAttChild| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DefaultAttChild| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|SystemLiteral| (INDEX &AUX (XML-PARSER::|SystemCharData| NIL))
  "{11} SystemLiteral ::= (('\"' SystemCharData? '\"') | (''' SystemCharData? '''))
(|SystemCharData|)"
  (DECLARE (SPECIAL XML-PARSER::|SystemLiteral-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|SystemLiteral-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|SystemLiteral-INDEX| INDEX)
      (LET ((XML-PARSER::|SystemLiteral-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|SystemLiteral| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|SystemLiteral-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|SystemLiteral|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|SystemLiteral|)
                                 (RETURN-FROM XML-PARSER::|SystemLiteral| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|SystemLiteral| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|SystemLiteral.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|SystemLiteral|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|SystemLiteral|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|SystemLiteral|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|SystemCharData| XML-PARSER::|SystemCharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|SystemLiteral-Constructor|
                                                    XML-PARSER::|SystemCharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|SystemLiteral|
                                                            (DELETE NIL (LIST XML-PARSER::|SystemCharData|)))
                                                      'XML-PARSER::|SystemLiteral|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|SystemLiteral| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|SystemLiteral/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|SystemLiteral/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|SystemLiteral/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|SystemLiteral/SystemLiteral.2.4|)
                                           (XML-PARSER::|SystemLiteral/SystemLiteral.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|SystemLiteral/SystemLiteral.2.7|)
                                           (XML-PARSER::|SystemLiteral/SystemLiteral.2.7| INDEX))
                                         (XML-PARSER::|SystemLiteral/fail.3| INDEX)))))
                               (XML-PARSER::|SystemLiteral/SystemLiteral.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/SystemLiteral.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|SystemLiteral/SystemLiteral.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|SystemLiteral/SystemLiteral.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/SystemLiteral.2.5|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|SystemCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|SystemCharData|)
                                       (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                                       (COND ((XML-PARSER::|IS-SystemCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|SystemCharData|)
                                              (SETF XML-PARSER::|SystemCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|SystemCharData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|SystemCharData| |item|)
                                                            'XML-PARSER::|SystemCharData|)))
                                              (XML-PARSER::|SystemLiteral/SystemLiteral.2.6| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|SystemCharData|)
                                              (XML-PARSER::|SystemLiteral/SystemLiteral.2.6| INDEX)))))))
                               (XML-PARSER::|SystemLiteral/SystemLiteral.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/SystemLiteral.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|SystemLiteral.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|SystemLiteral/SystemLiteral.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/SystemLiteral.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|SystemLiteral/SystemLiteral.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|SystemLiteral/SystemLiteral.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/SystemLiteral.2.8|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|SystemCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|SystemCharData|)
                                       (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                                       (COND ((XML-PARSER::|IS-SystemCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|SystemCharData|)
                                              (SETF XML-PARSER::|SystemCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|SystemCharData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|SystemCharData| |item|)
                                                            'XML-PARSER::|SystemCharData|)))
                                              (XML-PARSER::|SystemLiteral/SystemLiteral.2.9| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|SystemCharData|)
                                              (XML-PARSER::|SystemLiteral/SystemLiteral.2.9| INDEX)))))))
                               (XML-PARSER::|SystemLiteral/SystemLiteral.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SystemLiteral/SystemLiteral.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|SystemLiteral.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|SystemLiteral.2| XML-PARSER::|SystemLiteral/fail.3|
                          XML-PARSER::|SystemLiteral/start.1| XML-PARSER::|SystemLiteral/SystemLiteral.2.4|
                          XML-PARSER::|SystemLiteral/SystemLiteral.2.5| XML-PARSER::|SystemLiteral/SystemLiteral.2.6|
                          XML-PARSER::|SystemLiteral/SystemLiteral.2.7| XML-PARSER::|SystemLiteral/SystemLiteral.2.8|
                          XML-PARSER::|SystemLiteral/SystemLiteral.2.9|))
                        (XML-PARSER::|SystemLiteral/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|SystemLiteral| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|SystemLiteral| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|PubidLiteral| (INDEX &AUX (XML-PARSER::|PubidCharData| NIL))
  "{12} PubidLiteral ::= (('\"' PubidCharData? '\"') | (''' PubidCharData? '''))
(|PubidCharData|)"
  (DECLARE (SPECIAL XML-PARSER::|PubidLiteral-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|PubidLiteral-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|PubidLiteral-INDEX| INDEX)
      (LET ((XML-PARSER::|PubidLiteral-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|PubidLiteral| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|PubidLiteral-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|PubidLiteral|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|PubidLiteral|)
                                 (RETURN-FROM XML-PARSER::|PubidLiteral| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|PubidLiteral| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|PubidLiteral.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|PubidLiteral|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|PubidLiteral|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|PubidLiteral|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|PubidCharData| XML-PARSER::|PubidCharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|PubidLiteral-Constructor|
                                                    XML-PARSER::|PubidCharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|PubidLiteral|
                                                            (DELETE NIL (LIST XML-PARSER::|PubidCharData|)))
                                                      'XML-PARSER::|PubidLiteral|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|PubidLiteral| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|PubidLiteral/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|PubidLiteral/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|PubidLiteral/PubidLiteral.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/PubidLiteral.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|PubidLiteral/PubidLiteral.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|PubidLiteral/PubidLiteral.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/PubidLiteral.2.5|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|PubidCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|PubidCharData|)
                                       (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                                       (COND ((XML-PARSER::|IS-PubidCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|PubidCharData|)
                                              (SETF XML-PARSER::|PubidCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|PubidCharData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|PubidCharData| |item|)
                                                            'XML-PARSER::|PubidCharData|)))
                                              (XML-PARSER::|PubidLiteral/PubidLiteral.2.6| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|PubidCharData|)
                                              (XML-PARSER::|PubidLiteral/PubidLiteral.2.6| INDEX)))))))
                               (XML-PARSER::|PubidLiteral/PubidLiteral.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/PubidLiteral.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|PubidLiteral.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|PubidLiteral/PubidLiteral.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/PubidLiteral.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|PubidLiteral/PubidLiteral.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|PubidLiteral/PubidLiteral.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/PubidLiteral.2.8|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|PubidCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|PubidCharData|)
                                       (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                                       (COND ((XML-PARSER::|IS-PubidCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|PubidCharData|)
                                              (SETF XML-PARSER::|PubidCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|PubidCharData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|PubidCharData| |item|)
                                                            'XML-PARSER::|PubidCharData|)))
                                              (XML-PARSER::|PubidLiteral/PubidLiteral.2.9| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|PubidCharData|)
                                              (XML-PARSER::|PubidLiteral/PubidLiteral.2.9| INDEX)))))))
                               (XML-PARSER::|PubidLiteral/PubidLiteral.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/PubidLiteral.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|PubidLiteral.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|PubidLiteral/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PubidLiteral/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|PubidLiteral/PubidLiteral.2.4|)
                                           (XML-PARSER::|PubidLiteral/PubidLiteral.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|PubidLiteral/PubidLiteral.2.7|)
                                           (XML-PARSER::|PubidLiteral/PubidLiteral.2.7| INDEX))
                                         (XML-PARSER::|PubidLiteral/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|PubidLiteral.2| XML-PARSER::|PubidLiteral/fail.3|
                          XML-PARSER::|PubidLiteral/PubidLiteral.2.4| XML-PARSER::|PubidLiteral/PubidLiteral.2.5|
                          XML-PARSER::|PubidLiteral/PubidLiteral.2.6| XML-PARSER::|PubidLiteral/PubidLiteral.2.7|
                          XML-PARSER::|PubidLiteral/PubidLiteral.2.8| XML-PARSER::|PubidLiteral/PubidLiteral.2.9|
                          XML-PARSER::|PubidLiteral/start.1|))
                        (XML-PARSER::|PubidLiteral/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|PubidLiteral| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|PubidLiteral| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Comment| (INDEX &AUX (XML-PARSER::|CommentCharData| NIL))
  "{15} Comment ::= '<!--' CommentCharData? '-->'
(|CommentCharData|)"
  (DECLARE (SPECIAL XML-PARSER::|Comment-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Comment-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Comment-INDEX| INDEX)
      (LET ((XML-PARSER::|Comment-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Comment| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Comment-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Comment|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Comment|)
                                 (RETURN-FROM XML-PARSER::|Comment| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Comment| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Comment.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Comment.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Comment|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Comment|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Comment|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|CommentCharData| XML-PARSER::|CommentCharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|Comment-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|CommentCharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Comment|
                                                            (DELETE NIL (LIST XML-PARSER::|CommentCharData|)))
                                                      'XML-PARSER::|Comment|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Comment| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Comment/Comment.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Comment/Comment.2.4|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|CommentCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|CommentCharData|)
                                       (COND ((XML-PARSER::|IS-CommentCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|CommentCharData|)
                                              (SETF XML-PARSER::|CommentCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|CommentCharData-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|CommentCharData| |item|)
                                                            'XML-PARSER::|CommentCharData|)))
                                              (XML-PARSER::|Comment/Comment.2.5| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|CommentCharData|)
                                              (XML-PARSER::|Comment/Comment.2.5| INDEX)))))))
                               (XML-PARSER::|Comment/Comment.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Comment/Comment.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:-->)
                                     (COND ((EQ |item| '|xml|:-->)
                                            (SETF *ATN-TERM* '|xml|:-->)
                                            (XML-PARSER::|Comment.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:-->) (XML-PARSER::|Comment/fail.3| INDEX))))))
                               (XML-PARSER::|Comment/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Comment/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Comment/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Comment/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!--)
                                     (COND ((EQ |item| '|xml|:<!--)
                                            (SETF *ATN-TERM* '|xml|:<!--)
                                            (XML-PARSER::|Comment/Comment.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!--) (XML-PARSER::|Comment/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Comment.2| XML-PARSER::|Comment/Comment.2.4|
                          XML-PARSER::|Comment/Comment.2.5| XML-PARSER::|Comment/fail.3| XML-PARSER::|Comment/start.1|))
                        (XML-PARSER::|Comment/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Comment| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Comment| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Pi| (INDEX &AUX (XML-PARSER::|PiCharData| NIL) (XML-PARSER::|PiTarget| NIL))
  "{16} Pi ::= '<?' PiTarget (S PiCharData?)? '?>'
(|PiCharData| |PiTarget|)"
  (DECLARE (SPECIAL XML-PARSER::|Pi-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Pi-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Pi-INDEX| INDEX)
      (LET ((XML-PARSER::|Pi-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Pi| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|Pi-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|Pi-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Pi|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Pi|)
                                 (RETURN-FROM XML-PARSER::|Pi| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Pi| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Pi.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Pi|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Pi|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Pi|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|PiCharData|
                                                         XML-PARSER::|PiCharData|
                                                         'XML-PARSER::|PiTarget|
                                                         XML-PARSER::|PiTarget|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|Pi-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|PiCharData|
                                                    XML-PARSER::|PiTarget|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Pi|
                                                            (DELETE NIL (LIST XML-PARSER::|PiCharData| XML-PARSER::|PiTarget|)))
                                                      'XML-PARSER::|Pi|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Pi| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Pi/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|Pi/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Pi/Pi.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi/Pi.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|PiTarget|)
                                     (COND ((XML-PARSER::|IS-PiTarget| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|PiTarget|)
                                            (SETF XML-PARSER::|PiTarget|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|PiTarget-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|PiTarget| |item|)
                                                          'XML-PARSER::|PiTarget|)))
                                            (XML-PARSER::|Pi/Pi.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|PiTarget|) (XML-PARSER::|Pi/fail.3| INDEX))))))
                               (XML-PARSER::|Pi/Pi.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi/Pi.2.5|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Pi/Pi/Pi.2.6.7|) (XML-PARSER::|Pi/Pi/Pi.2.6.7| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Pi/Pi.2.6|) (XML-PARSER::|Pi/Pi.2.6| INDEX))))
                               (XML-PARSER::|Pi/Pi.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi/Pi.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:?>)
                                     (COND ((EQ |item| '|xml|:?>) (SETF *ATN-TERM* '|xml|:?>) (XML-PARSER::|Pi.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:?>) (XML-PARSER::|Pi/fail.3| INDEX))))))
                               (XML-PARSER::|Pi/Pi/Pi.2.6.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi/Pi/Pi.2.6.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Pi/Pi/Pi.2.6.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|Pi/Pi/Pi.2.6.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi/Pi/Pi.2.6.8|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|PiCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|PiCharData|)
                                       (COND ((XML-PARSER::|IS-PiCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|PiCharData|)
                                              (SETF XML-PARSER::|PiCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM-WITH-CONTEXT
                                                          #'XML-PARSER:|PiCharData-Constructor|
                                                          XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                          |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|PiCharData| |item|)
                                                            'XML-PARSER::|PiCharData|)))
                                              (XML-PARSER::|Pi/Pi.2.6| (1+ INDEX)))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|PiCharData|) (XML-PARSER::|Pi/Pi.2.6| INDEX)))))))
                               (XML-PARSER::|Pi/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Pi/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<?)
                                     (COND ((EQ |item| '|xml|:<?) (SETF *ATN-TERM* '|xml|:<?) (XML-PARSER::|Pi/Pi.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<?) (XML-PARSER::|Pi/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Pi.2| XML-PARSER::|Pi/fail.3| XML-PARSER::|Pi/Pi.2.4|
                          XML-PARSER::|Pi/Pi.2.5| XML-PARSER::|Pi/Pi.2.6| XML-PARSER::|Pi/Pi/Pi.2.6.7| XML-PARSER::|Pi/Pi/Pi.2.6.8|
                          XML-PARSER::|Pi/start.1|))
                        (XML-PARSER::|Pi/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Pi| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Pi| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|CDSect| (INDEX &AUX (XML-PARSER::|CDataCharData| NIL) (XML-PARSER::|CDEnd| NIL) (XML-PARSER::|CDStart| NIL))
  "{18} CDSect ::= CDStart CDataCharData? CDEnd
(|CDataCharData| |CDEnd| |CDStart|)"
  (DECLARE (SPECIAL XML-PARSER::|CDSect-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|CDSect-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|CDSect-INDEX| INDEX)
      (LET ((XML-PARSER::|CDSect-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|CDSect| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|CDSect-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|CDSect|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|CDSect|)
                                 (RETURN-FROM XML-PARSER::|CDSect| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|CDSect| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|CDSect.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CDSect.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|CDSect|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|CDSect|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|CDSect|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|CDataCharData|
                                                         XML-PARSER::|CDataCharData|
                                                         'XML-PARSER::|CDEnd|
                                                         XML-PARSER::|CDEnd|
                                                         'XML-PARSER::|CDStart|
                                                         XML-PARSER::|CDStart|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|CDSect-Constructor|
                                                    XML-PARSER::|CDataCharData|
                                                    XML-PARSER::|CDEnd|
                                                    XML-PARSER::|CDStart|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|CDSect|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|CDataCharData|
                                                                          XML-PARSER::|CDEnd|
                                                                          XML-PARSER::|CDStart|)))
                                                      'XML-PARSER::|CDSect|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|CDSect| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|CDSect/CDSect.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CDSect/CDSect.2.4|
                                   (LET ((XML-UTILS:*PARSETABLE* XML-PARSER::|CDataCharData-Parsetable|))
                                     (%ATN-EDGE-BLOCK
                                       (TEST XML-PARSER::|CDataCharData|)
                                       (COND ((XML-PARSER::|IS-CDataCharData| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|CDataCharData|)
                                              (SETF XML-PARSER::|CDataCharData|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM-WITH-CONTEXT
                                                          #'XML-PARSER:|CDataCharData-Constructor|
                                                          XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                          |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|CDataCharData| |item|)
                                                            'XML-PARSER::|CDataCharData|)))
                                              (XML-PARSER::|CDSect/CDSect.2.5| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|CDataCharData|)
                                              (XML-PARSER::|CDSect/CDSect.2.5| INDEX)))))))
                               (XML-PARSER::|CDSect/CDSect.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CDSect/CDSect.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|CDEnd|)
                                     (COND ((XML-PARSER::|IS-CDEnd| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|CDEnd|)
                                            (SETF XML-PARSER::|CDEnd|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|CDEnd-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|CDEnd| |item|)
                                                          'XML-PARSER::|CDEnd|)))
                                            (XML-PARSER::|CDSect.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|CDEnd|) (XML-PARSER::|CDSect/fail.3| INDEX))))))
                               (XML-PARSER::|CDSect/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|CDSect/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|CDSect/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CDSect/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|CDStart|)
                                     (COND ((XML-PARSER::|IS-CDStart| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|CDStart|)
                                            (SETF XML-PARSER::|CDStart|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|CDStart-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|CDStart| |item|)
                                                          'XML-PARSER::|CDStart|)))
                                            (XML-PARSER::|CDSect/CDSect.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|CDStart|) (XML-PARSER::|CDSect/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|CDSect.2| XML-PARSER::|CDSect/CDSect.2.4|
                          XML-PARSER::|CDSect/CDSect.2.5| XML-PARSER::|CDSect/fail.3| XML-PARSER::|CDSect/start.1|))
                        (XML-PARSER::|CDSect/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|CDSect| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|CDSect| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Prolog| (INDEX &AUX (XML-PARSER::|DoctypeProlog| NIL) (XML-PARSER::|MiscSequence| NIL)
                             (XML-PARSER::|XMLDecl| NIL))
  "{22} Prolog ::= XMLDecl? MiscSequence? DoctypeProlog?
(|DoctypeProlog| |MiscSequence| |XMLDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|Prolog-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Prolog-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Prolog-INDEX| INDEX)
      (LET ((XML-PARSER::|Prolog-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Prolog| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Prolog-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Prolog|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Prolog|)
                                 (RETURN-FROM XML-PARSER::|Prolog| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Prolog| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Prolog.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Prolog.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Prolog|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Prolog|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Prolog|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DoctypeProlog|
                                                         XML-PARSER::|DoctypeProlog|
                                                         'XML-PARSER::|MiscSequence|
                                                         XML-PARSER::|MiscSequence|
                                                         'XML-PARSER::|XMLDecl|
                                                         XML-PARSER::|XMLDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Prolog-Constructor|
                                                    XML-PARSER::|DoctypeProlog|
                                                    XML-PARSER::|MiscSequence|
                                                    XML-PARSER::|XMLDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Prolog|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|DoctypeProlog|
                                                                          XML-PARSER::|MiscSequence|
                                                                          XML-PARSER::|XMLDecl|)))
                                                      'XML-PARSER::|Prolog|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Prolog| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Prolog/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Prolog/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Prolog/Prolog.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Prolog/Prolog.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|MiscSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|MiscSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|MiscSequence| RESULT))
                                              (XML-PARSER::|Prolog/Prolog.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|MiscSequence|)
                                              (XML-PARSER::|Prolog/Prolog.2.5| INDEX)))))))
                               (XML-PARSER::|Prolog/Prolog.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Prolog/Prolog.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DoctypeProlog|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DoctypeProlog| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DoctypeProlog| RESULT))
                                              (XML-PARSER::|Prolog.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DoctypeProlog|)
                                              (XML-PARSER::|Prolog.2| INDEX)))))))
                               (XML-PARSER::|Prolog/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Prolog/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|XMLDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|XMLDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|XMLDecl| RESULT))
                                              (XML-PARSER::|Prolog/Prolog.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|XMLDecl|)
                                              (XML-PARSER::|Prolog/Prolog.2.4| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Prolog.2| XML-PARSER::|Prolog/fail.3| XML-PARSER::|Prolog/Prolog.2.4|
                          XML-PARSER::|Prolog/Prolog.2.5| XML-PARSER::|Prolog/start.1|))
                        (XML-PARSER::|Prolog/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Prolog| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Prolog| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DoctypeProlog| (INDEX &AUX (XML-PARSER::|DoctypeDecl| NIL) (XML-PARSER::|MiscSequence| NIL))
  "DoctypeProlog ::= DoctypeDecl MiscSequence?
(|DoctypeDecl| |MiscSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|DoctypeProlog-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DoctypeProlog-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DoctypeProlog-INDEX| INDEX)
      (LET ((XML-PARSER::|DoctypeProlog-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DoctypeProlog| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|DoctypeProlog-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DoctypeProlog|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DoctypeProlog|)
                                 (RETURN-FROM XML-PARSER::|DoctypeProlog| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DoctypeProlog| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DoctypeProlog.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeProlog.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DoctypeProlog|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DoctypeProlog|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DoctypeProlog|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DoctypeDecl|
                                                         XML-PARSER::|DoctypeDecl|
                                                         'XML-PARSER::|MiscSequence|
                                                         XML-PARSER::|MiscSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DoctypeProlog-Constructor|
                                                    XML-PARSER::|DoctypeDecl|
                                                    XML-PARSER::|MiscSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DoctypeProlog|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|DoctypeDecl| XML-PARSER::|MiscSequence|)))
                                                      'XML-PARSER::|DoctypeProlog|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|DoctypeProlog| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DoctypeProlog/DoctypeProlog.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeProlog/DoctypeProlog.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|MiscSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|MiscSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|MiscSequence| RESULT))
                                              (XML-PARSER::|DoctypeProlog.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|MiscSequence|)
                                              (XML-PARSER::|DoctypeProlog.2| INDEX)))))))
                               (XML-PARSER::|DoctypeProlog/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DoctypeProlog/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DoctypeProlog/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeProlog/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DoctypeDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DoctypeDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DoctypeDecl| RESULT))
                                              (XML-PARSER::|DoctypeProlog/DoctypeProlog.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DoctypeDecl|)
                                              (XML-PARSER::|DoctypeProlog/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DoctypeProlog.2| XML-PARSER::|DoctypeProlog/DoctypeProlog.2.4|
                          XML-PARSER::|DoctypeProlog/fail.3| XML-PARSER::|DoctypeProlog/start.1|))
                        (XML-PARSER::|DoctypeProlog/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DoctypeProlog| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DoctypeProlog| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|XMLDecl| (INDEX &AUX (XML-PARSER::|EncodingDecl| NIL) (XML-PARSER::|SDDecl| NIL)
                              (XML-PARSER::|VersionInfo| NIL))
  "{23} XMLDecl ::= '<?xml' VersionInfo EncodingDecl? SDDecl? S* '?>'
(|EncodingDecl| |SDDecl| |VersionInfo|)"
  (DECLARE (SPECIAL XML-PARSER::|XMLDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|XMLDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|XMLDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|XMLDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|XMLDecl| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|XMLDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|XMLDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|XMLDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|XMLDecl|)
                                 (RETURN-FROM XML-PARSER::|XMLDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|XMLDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|XMLDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|XMLDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|XMLDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|XMLDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EncodingDecl|
                                                         XML-PARSER::|EncodingDecl|
                                                         'XML-PARSER::|SDDecl|
                                                         XML-PARSER::|SDDecl|
                                                         'XML-PARSER::|VersionInfo|
                                                         XML-PARSER::|VersionInfo|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|XMLDecl-Constructor|
                                                    XML-PARSER::|EncodingDecl|
                                                    XML-PARSER::|SDDecl|
                                                    XML-PARSER::|VersionInfo|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|XMLDecl|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|EncodingDecl|
                                                                          XML-PARSER::|SDDecl|
                                                                          XML-PARSER::|VersionInfo|)))
                                                      'XML-PARSER::|XMLDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|XMLDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|XMLDecl.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|XMLDecl.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|XMLDecl/XMLDecl.2.8| INDEX))))))
                               (XML-PARSER::|XMLDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|XMLDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|XMLDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|<?xml|)
                                     (COND ((EQ |item| '|xml|:|<?xml|)
                                            (SETF *ATN-TERM* '|xml|:|<?xml|)
                                            (XML-PARSER::|XMLDecl/XMLDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|<?xml|) (XML-PARSER::|XMLDecl/fail.3| INDEX))))))
                               (XML-PARSER::|XMLDecl/XMLDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl/XMLDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|VersionInfo|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|VersionInfo| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|VersionInfo| RESULT))
                                              (XML-PARSER::|XMLDecl/XMLDecl.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|VersionInfo|)
                                              (XML-PARSER::|XMLDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|XMLDecl/XMLDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl/XMLDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|EncodingDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EncodingDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|EncodingDecl| RESULT))
                                              (XML-PARSER::|XMLDecl/XMLDecl.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|EncodingDecl|)
                                              (XML-PARSER::|XMLDecl/XMLDecl.2.6| INDEX)))))))
                               (XML-PARSER::|XMLDecl/XMLDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl/XMLDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|SDDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|SDDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|SDDecl| RESULT))
                                              (XML-PARSER::|XMLDecl/XMLDecl.2.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|SDDecl|)
                                              (XML-PARSER::|XMLDecl/XMLDecl.2.7| INDEX)))))))
                               (XML-PARSER::|XMLDecl/XMLDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl/XMLDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|XMLDecl.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|XMLDecl/XMLDecl.2.8| INDEX))))))
                               (XML-PARSER::|XMLDecl/XMLDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|XMLDecl/XMLDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:?>)
                                     (COND ((EQ |item| '|xml|:?>) (SETF *ATN-TERM* '|xml|:?>) (XML-PARSER::|XMLDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:?>) (XML-PARSER::|XMLDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|XMLDecl.2| XML-PARSER::|XMLDecl.9| XML-PARSER::|XMLDecl/fail.3|
                          XML-PARSER::|XMLDecl/start.1| XML-PARSER::|XMLDecl/XMLDecl.2.4| XML-PARSER::|XMLDecl/XMLDecl.2.5|
                          XML-PARSER::|XMLDecl/XMLDecl.2.6| XML-PARSER::|XMLDecl/XMLDecl.2.7| XML-PARSER::|XMLDecl/XMLDecl.2.8|))
                        (XML-PARSER::|XMLDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|XMLDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|XMLDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|VersionInfo| (INDEX &AUX (XML-PARSER::|VersionNumCharData| NIL))
  "{24} VersionInfo ::= S+ version Eq ((('\"' VersionNumCharData '\"') | ('''
                                                                     VersionNumCharData
                                                                     ''')))
(|VersionNumCharData|)"
  (DECLARE (SPECIAL XML-PARSER::|VersionInfo-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|VersionInfo-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|VersionInfo-INDEX| INDEX)
      (LET ((XML-PARSER::|VersionInfo-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|VersionInfo| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|VersionInfo-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|VersionInfo-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|VersionInfo|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|VersionInfo|)
                                 (RETURN-FROM XML-PARSER::|VersionInfo| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|VersionInfo| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|VersionInfo.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|VersionInfo|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|VersionInfo|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|VersionInfo|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|VersionNumCharData| XML-PARSER::|VersionNumCharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|VersionInfo-Constructor|
                                                    XML-PARSER::|VersionNumCharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|VersionInfo|
                                                            (DELETE NIL (LIST XML-PARSER::|VersionNumCharData|)))
                                                      'XML-PARSER::|VersionInfo|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|VersionInfo| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|VersionInfo.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|VersionInfo.7| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|VersionInfo/VersionInfo.2.4| INDEX))))))
                               (XML-PARSER::|VersionInfo/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|VersionInfo/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|VersionInfo/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|VersionInfo.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|VersionInfo/fail.3| INDEX))))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|VersionInfo.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|VersionInfo/VersionInfo.2.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|VersionNumCharData|)
                                     (COND ((XML-PARSER::|IS-VersionNumCharData| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|VersionNumCharData|)
                                            (SETF XML-PARSER::|VersionNumCharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|VersionNumCharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|VersionNumCharData| |item|)
                                                          'XML-PARSER::|VersionNumCharData|)))
                                            (XML-PARSER::|VersionInfo/VersionInfo.2.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|VersionNumCharData|) NIL)))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.13|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|VersionInfo.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|version|)
                                     (COND ((XML-PARSER::|IS-versionToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|version|)
                                            (XML-PARSER::|VersionInfo/VersionInfo.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::|version|)
                                            (XML-PARSER::|VersionInfo/fail.3| INDEX))))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Eq|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Eq| INDEX)
                                       (COND (SUCCESS
                                              (SETF RESULT RESULT)
                                              (XML-PARSER::|VersionInfo/VersionInfo.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Eq|) (XML-PARSER::|VersionInfo/fail.3| INDEX)))))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.6|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|VersionInfo/VersionInfo.2.8|)
                                           (XML-PARSER::|VersionInfo/VersionInfo.2.8| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|VersionInfo/VersionInfo.2.11|)
                                           (XML-PARSER::|VersionInfo/VersionInfo.2.11| INDEX))
                                         (XML-PARSER::|VersionInfo/fail.3| INDEX)))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|VersionInfo/VersionInfo.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|VersionInfo/VersionInfo.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|VersionInfo/VersionInfo.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|VersionNumCharData|)
                                     (COND ((XML-PARSER::|IS-VersionNumCharData| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|VersionNumCharData|)
                                            (SETF XML-PARSER::|VersionNumCharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|VersionNumCharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|VersionNumCharData| |item|)
                                                          'XML-PARSER::|VersionNumCharData|)))
                                            (XML-PARSER::|VersionInfo/VersionInfo.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|VersionNumCharData|) NIL))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|VersionInfo.2| XML-PARSER::|VersionInfo.7|
                          XML-PARSER::|VersionInfo/fail.3| XML-PARSER::|VersionInfo/start.1|
                          XML-PARSER::|VersionInfo/VersionInfo.2.10| XML-PARSER::|VersionInfo/VersionInfo.2.11|
                          XML-PARSER::|VersionInfo/VersionInfo.2.12| XML-PARSER::|VersionInfo/VersionInfo.2.13|
                          XML-PARSER::|VersionInfo/VersionInfo.2.4| XML-PARSER::|VersionInfo/VersionInfo.2.5|
                          XML-PARSER::|VersionInfo/VersionInfo.2.6| XML-PARSER::|VersionInfo/VersionInfo.2.8|
                          XML-PARSER::|VersionInfo/VersionInfo.2.9|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|VersionInfo/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|VersionInfo| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|VersionInfo| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Eq| (INDEX &AUX)
  "{25} Eq ::= S* '=' S*
NIL"
  (DECLARE (SPECIAL XML-PARSER::|Eq-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Eq-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Eq-INDEX| INDEX)
      (LET ((XML-PARSER::|Eq-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Eq| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|Eq-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|Eq-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Eq|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Eq|)
                                 (RETURN-FROM XML-PARSER::|Eq| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Eq| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Eq.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Eq.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Eq|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Eq|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" 'XML-PARSER::|Eq| INDEX (LIST))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|Eq-Constructor|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Eq| (DELETE NIL (LIST)))
                                                      'XML-PARSER::|Eq|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Eq| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Eq.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Eq.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Eq.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Eq/Eq.2.4| INDEX))))))
                               (XML-PARSER::|Eq.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Eq.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Eq.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Eq.2| INDEX))))))
                               (XML-PARSER::|Eq/Eq.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Eq/Eq.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:=)
                                     (COND ((EQ |item| '|xml|:=) (SETF *ATN-TERM* '|xml|:=) (XML-PARSER::|Eq/Eq.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:=) (XML-PARSER::|Eq/fail.3| INDEX))))))
                               (XML-PARSER::|Eq/Eq.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Eq/Eq.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Eq.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Eq.2| INDEX))))))
                               (XML-PARSER::|Eq/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|Eq/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Eq/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Eq/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Eq.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Eq/Eq.2.4| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Eq.2| XML-PARSER::|Eq.6| XML-PARSER::|Eq.7| XML-PARSER::|Eq/Eq.2.4|
                          XML-PARSER::|Eq/Eq.2.5| XML-PARSER::|Eq/fail.3| XML-PARSER::|Eq/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|Eq/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Eq| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Eq| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|MiscSequence| (INDEX &AUX (XML-PARSER::|Misc| NIL) (XML-PARSER::|MiscSequence| NIL))
  "MiscSequence ::= Misc MiscSequence?
(|Misc| |MiscSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|MiscSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|MiscSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|MiscSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|MiscSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|MiscSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|MiscSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|MiscSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|MiscSequence|)
                                 (RETURN-FROM XML-PARSER::|MiscSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|MiscSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|MiscSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|MiscSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|MiscSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|MiscSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|MiscSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Misc|
                                                         XML-PARSER::|Misc|
                                                         'XML-PARSER::|MiscSequence|
                                                         XML-PARSER::|MiscSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|MiscSequence-Constructor|
                                                    XML-PARSER::|Misc|
                                                    XML-PARSER::|MiscSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|MiscSequence|
                                                            (DELETE NIL (LIST XML-PARSER::|Misc| XML-PARSER::|MiscSequence|)))
                                                      'XML-PARSER::|MiscSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|MiscSequence| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|MiscSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|MiscSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|MiscSequence/MiscSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|MiscSequence/MiscSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|MiscSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|MiscSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|MiscSequence| RESULT))
                                              (XML-PARSER::|MiscSequence.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|MiscSequence|)
                                              (XML-PARSER::|MiscSequence.2| INDEX)))))))
                               (XML-PARSER::|MiscSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|MiscSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Misc|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Misc| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Misc| RESULT))
                                              (XML-PARSER::|MiscSequence/MiscSequence.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Misc|)
                                              (XML-PARSER::|MiscSequence/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|MiscSequence.2| XML-PARSER::|MiscSequence/fail.3|
                          XML-PARSER::|MiscSequence/MiscSequence.2.4| XML-PARSER::|MiscSequence/start.1|))
                        (XML-PARSER::|MiscSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|MiscSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|MiscSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Misc| (INDEX &AUX (XML-PARSER::|Comment| NIL) (XML-PARSER::|Pi| NIL))
  "{27} Misc ::= (Comment | Pi | S+)
(|Comment| |Pi|)"
  (DECLARE (SPECIAL XML-PARSER::|Misc-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Misc-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Misc-INDEX| INDEX)
      (LET ((XML-PARSER::|Misc-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Misc| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Misc-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Misc|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Misc|)
                                 (RETURN-FROM XML-PARSER::|Misc| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Misc| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Misc.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Misc.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Misc|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Misc|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Misc|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Comment|
                                                         XML-PARSER::|Comment|
                                                         'XML-PARSER::|Pi|
                                                         XML-PARSER::|Pi|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Misc-Constructor|
                                                    XML-PARSER::|Comment|
                                                    XML-PARSER::|Pi|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Misc|
                                                            (DELETE NIL (LIST XML-PARSER::|Comment| XML-PARSER::|Pi|)))
                                                      'XML-PARSER::|Misc|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Misc| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Misc.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Misc.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Misc.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Misc.2| INDEX))))))
                               (XML-PARSER::|Misc/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|Misc/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Misc/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Misc/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Comment|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Comment| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Comment| RESULT))
                                                    (XML-PARSER::|Misc.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Comment|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Pi|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Pi| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Pi| RESULT))
                                                    (XML-PARSER::|Misc.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Pi|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::S)
                                           (COND ((XML-PARSER::IS-S |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::S)
                                                  (XML-PARSER::|Misc.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))
                                         (XML-PARSER::|Misc/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Misc.2| XML-PARSER::|Misc.4| XML-PARSER::|Misc/fail.3|
                          XML-PARSER::|Misc/start.1|))
                        (XML-PARSER::|Misc/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Misc| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Misc| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DoctypeDecl| (INDEX &AUX (XML-PARSER::|ExternalID| NIL) (XML-PARSER::|IntSubsetDecl| NIL)
                                  (XML-PARSER::|QName| NIL))
  "{28} DoctypeDecl ::= '<!DOCTYPE' S+ QName (S
                                           ExternalID)? S* ('['
                                                            IntSubsetDecl*
                                                            ']'
                                                            S*)? '>'
(|ExternalID| |IntSubsetDecl| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|DoctypeDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DoctypeDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DoctypeDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|DoctypeDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DoctypeDecl| *ATN-STACK))
            (XML-PARSER::*IN-DTD* T)
            (XML-UTILS:*PARSETABLE* XML-PARSER::|DoctypeDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|DoctypeDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DoctypeDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DoctypeDecl|)
                                 (RETURN-FROM XML-PARSER::|DoctypeDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DoctypeDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DoctypeDecl.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.5| INDEX))))))
                               (XML-PARSER::|DoctypeDecl.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl.13|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl.13| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.8| INDEX))))))
                               (XML-PARSER::|DoctypeDecl.18| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl.18|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|IntSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IntSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|IntSubsetDecl| (CONS RESULT XML-PARSER::|IntSubsetDecl|)))
                                              (XML-PARSER::|DoctypeDecl.18| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|IntSubsetDecl|)
                                              (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16| INDEX)))))))
                               (XML-PARSER::|DoctypeDecl.19| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl.19|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl.19| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9| INDEX))))))
                               (XML-PARSER::|DoctypeDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DoctypeDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DoctypeDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DoctypeDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ExternalID|
                                                         XML-PARSER::|ExternalID|
                                                         'XML-PARSER::|IntSubsetDecl|
                                                         XML-PARSER::|IntSubsetDecl|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DoctypeDecl-Constructor|
                                                    XML-PARSER::|ExternalID|
                                                    XML-PARSER::|IntSubsetDecl|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DoctypeDecl|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|ExternalID|
                                                                          XML-PARSER::|IntSubsetDecl|
                                                                          XML-PARSER::|QName|)))
                                                      'XML-PARSER::|DoctypeDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|DoctypeDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|DoctypeDecl/fail.3| INDEX))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl.2.5|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.6| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (XML-PARSER::|DoctypeDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|)
                                     (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|DoctypeDecl/DoctypeDecl.2.7|)
                                     (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.7| INDEX))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl.13| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.8| INDEX))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|)
                                     (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9|)
                                     (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9| INDEX))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-PARSER::|DoctypeDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|DoctypeDecl/fail.3| INDEX))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExternalID|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExternalID| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|ExternalID| RESULT))
                                              (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|ExternalID|) NIL))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:[)
                                     (COND ((EQ |item| '|xml|:[)
                                            (SETF *ATN-TERM* '|xml|:[)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:[) NIL)))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|IntSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IntSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|IntSubsetDecl| (CONS RESULT XML-PARSER::|IntSubsetDecl|)))
                                              (XML-PARSER::|DoctypeDecl.18| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|IntSubsetDecl|)
                                              (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16| INDEX)))))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:])
                                     (COND ((EQ |item| '|xml|:])
                                            (SETF *ATN-TERM* '|xml|:])
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]) NIL)))))
                               (XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl.19| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9| INDEX))))))
                               (XML-PARSER::|DoctypeDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DoctypeDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DoctypeDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DoctypeDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!DOCTYPE)
                                     (COND ((EQ |item| '|xml|:<!DOCTYPE)
                                            (SETF *ATN-TERM* '|xml|:<!DOCTYPE)
                                            (XML-PARSER::|DoctypeDecl/DoctypeDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!DOCTYPE) (XML-PARSER::|DoctypeDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DoctypeDecl.10| XML-PARSER::|DoctypeDecl.13|
                          XML-PARSER::|DoctypeDecl.18| XML-PARSER::|DoctypeDecl.19| XML-PARSER::|DoctypeDecl.2|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl.2.4| XML-PARSER::|DoctypeDecl/DoctypeDecl.2.5|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl.2.6| XML-PARSER::|DoctypeDecl/DoctypeDecl.2.7|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl.2.8| XML-PARSER::|DoctypeDecl/DoctypeDecl.2.9|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16|
                          XML-PARSER::|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17| XML-PARSER::|DoctypeDecl/fail.3|
                          XML-PARSER::|DoctypeDecl/start.1|))
                        (XML-PARSER::|DoctypeDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DoctypeDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DoctypeDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|IntSubsetDecl| (INDEX &AUX (XML-PARSER::|DeclSep| NIL) (XML-PARSER::|MarkupDecl| NIL))
  "IntSubsetDecl ::= (DeclSep | MarkupDecl)
(|DeclSep| |MarkupDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|IntSubsetDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|IntSubsetDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|IntSubsetDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|IntSubsetDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|IntSubsetDecl| *ATN-STACK))
            (XML-PARSER::*IN-INTERNAL-SUBSET* T)
            (XML-UTILS:*PARSETABLE* XML-PARSER::|IntSubsetDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|IntSubsetDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|IntSubsetDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|IntSubsetDecl|)
                                 (RETURN-FROM XML-PARSER::|IntSubsetDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|IntSubsetDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|IntSubsetDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IntSubsetDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|IntSubsetDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|IntSubsetDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|IntSubsetDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DeclSep|
                                                         XML-PARSER::|DeclSep|
                                                         'XML-PARSER::|MarkupDecl|
                                                         XML-PARSER::|MarkupDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|IntSubsetDecl-Constructor|
                                                    XML-PARSER::|DeclSep|
                                                    XML-PARSER::|MarkupDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|IntSubsetDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|DeclSep| XML-PARSER::|MarkupDecl|)))
                                                      'XML-PARSER::|IntSubsetDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|IntSubsetDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|IntSubsetDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|IntSubsetDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|IntSubsetDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IntSubsetDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|DeclSep|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DeclSep| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|DeclSep| RESULT))
                                                    (XML-PARSER::|IntSubsetDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|DeclSep|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|MarkupDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|MarkupDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|MarkupDecl| RESULT))
                                                    (XML-PARSER::|IntSubsetDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|MarkupDecl|) NIL))))
                                         (XML-PARSER::|IntSubsetDecl/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|IntSubsetDecl.2| XML-PARSER::|IntSubsetDecl/fail.3|
                          XML-PARSER::|IntSubsetDecl/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|IntSubsetDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|IntSubsetDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|IntSubsetDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DeclSep| (INDEX &AUX (XML-PARSER::|ParsedExtSubset| NIL) (XML-PARSER::|PEReference| NIL))
  "{28a} DeclSep ::= (S+ | PEReference | ParsedExtSubset)
(|ParsedExtSubset| |PEReference|)"
  (DECLARE (SPECIAL XML-PARSER::|DeclSep-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DeclSep-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DeclSep-INDEX| INDEX)
      (LET ((XML-PARSER::|DeclSep-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DeclSep| *ATN-STACK))
            (XML-PARSER::*IN-DECL-SEP* T))
        (DECLARE (SPECIAL XML-PARSER::|DeclSep-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DeclSep|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DeclSep|)
                                 (RETURN-FROM XML-PARSER::|DeclSep| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DeclSep| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DeclSep.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DeclSep.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DeclSep|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DeclSep|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DeclSep|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ParsedExtSubset|
                                                         XML-PARSER::|ParsedExtSubset|
                                                         'XML-PARSER::|PEReference|
                                                         XML-PARSER::|PEReference|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DeclSep-Constructor|
                                                    XML-PARSER::|ParsedExtSubset|
                                                    XML-PARSER::|PEReference|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DeclSep|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|ParsedExtSubset|
                                                                          XML-PARSER::|PEReference|)))
                                                      'XML-PARSER::|DeclSep|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|DeclSep| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DeclSep.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DeclSep.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DeclSep.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|DeclSep.2| INDEX))))))
                               (XML-PARSER::|DeclSep/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DeclSep/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DeclSep/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DeclSep/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::S)
                                           (COND ((XML-PARSER::IS-S |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::S)
                                                  (XML-PARSER::|DeclSep.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|PEReference|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PEReference| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|PEReference| RESULT))
                                                    (XML-PARSER::|DeclSep.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|PEReference|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|ParsedExtSubset|)
                                           (COND ((XML-PARSER::|IS-ParsedExtSubset| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|ParsedExtSubset|)
                                                  (SETF XML-PARSER::|ParsedExtSubset|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|ParsedExtSubset-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|ParsedExtSubset| |item|)
                                                                'XML-PARSER::|ParsedExtSubset|)))
                                                  (XML-PARSER::|DeclSep.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|ParsedExtSubset|) NIL)))
                                         (XML-PARSER::|DeclSep/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DeclSep.2| XML-PARSER::|DeclSep.4| XML-PARSER::|DeclSep/fail.3|
                          XML-PARSER::|DeclSep/start.1|))
                        (XML-PARSER::|DeclSep/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DeclSep| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DeclSep| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|MarkupDecl| (INDEX &AUX (XML-PARSER::|AttlistDecl| NIL) (XML-PARSER::|Comment| NIL)
                                 (XML-PARSER::|ElementDecl| NIL) (XML-PARSER::|EntityDecl| NIL) (XML-PARSER::|NotationDecl| NIL)
                                 (XML-PARSER::|Pi| NIL))
  "{29} MarkupDecl ::= (ElementDecl | AttlistDecl | EntityDecl | NotationDecl | Pi | Comment)
(|AttlistDecl| |Comment| |ElementDecl| |EntityDecl| |NotationDecl| |Pi|)"
  (DECLARE (SPECIAL XML-PARSER::|MarkupDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|MarkupDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|MarkupDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|MarkupDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|MarkupDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|MarkupDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|MarkupDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|MarkupDecl|)
                                 (RETURN-FROM XML-PARSER::|MarkupDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|MarkupDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|MarkupDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|MarkupDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|MarkupDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|MarkupDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|MarkupDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttlistDecl|
                                                         XML-PARSER::|AttlistDecl|
                                                         'XML-PARSER::|Comment|
                                                         XML-PARSER::|Comment|
                                                         'XML-PARSER::|ElementDecl|
                                                         XML-PARSER::|ElementDecl|
                                                         'XML-PARSER::|EntityDecl|
                                                         XML-PARSER::|EntityDecl|
                                                         'XML-PARSER::|NotationDecl|
                                                         XML-PARSER::|NotationDecl|
                                                         'XML-PARSER::|Pi|
                                                         XML-PARSER::|Pi|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|MarkupDecl-Constructor|
                                                    XML-PARSER::|AttlistDecl|
                                                    XML-PARSER::|Comment|
                                                    XML-PARSER::|ElementDecl|
                                                    XML-PARSER::|EntityDecl|
                                                    XML-PARSER::|NotationDecl|
                                                    XML-PARSER::|Pi|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|MarkupDecl|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|AttlistDecl|
                                                                          XML-PARSER::|Comment|
                                                                          XML-PARSER::|ElementDecl|
                                                                          XML-PARSER::|EntityDecl|
                                                                          XML-PARSER::|NotationDecl|
                                                                          XML-PARSER::|Pi|)))
                                                      'XML-PARSER::|MarkupDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|MarkupDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|MarkupDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|MarkupDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|MarkupDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|MarkupDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|ElementDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ElementDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|ElementDecl| RESULT))
                                                    (XML-PARSER::|MarkupDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|ElementDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|AttlistDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttlistDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|AttlistDecl| RESULT))
                                                    (XML-PARSER::|MarkupDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|AttlistDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|EntityDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EntityDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|EntityDecl| RESULT))
                                                    (XML-PARSER::|MarkupDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|EntityDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|NotationDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|NotationDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|NotationDecl| RESULT))
                                                    (XML-PARSER::|MarkupDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|NotationDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Pi|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Pi| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Pi| RESULT))
                                                    (XML-PARSER::|MarkupDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Pi|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Comment|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Comment| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Comment| RESULT))
                                                    (XML-PARSER::|MarkupDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Comment|) NIL))))
                                         (XML-PARSER::|MarkupDecl/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|MarkupDecl.2| XML-PARSER::|MarkupDecl/fail.3|
                          XML-PARSER::|MarkupDecl/start.1|))
                        (XML-PARSER::|MarkupDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|MarkupDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|MarkupDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ExtSubset| (INDEX &AUX (XML-PARSER::|ExtSubsetDecl| NIL) (XML-PARSER::|TextDecl| NIL))
  "{30} ExtSubset ::= TextDecl? ExtSubsetDecl*
(|ExtSubsetDecl| |TextDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|ExtSubset-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ExtSubset-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ExtSubset-INDEX| INDEX)
      (LET ((XML-PARSER::|ExtSubset-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ExtSubset| *ATN-STACK))
            (XML-PARSER::*IN-DTD* T))
        (DECLARE (SPECIAL XML-PARSER::|ExtSubset-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ExtSubset|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ExtSubset|)
                                 (RETURN-FROM XML-PARSER::|ExtSubset| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ExtSubset| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ExtSubset.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtSubset.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ExtSubset|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ExtSubset|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ExtSubset|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ExtSubsetDecl|
                                                         XML-PARSER::|ExtSubsetDecl|
                                                         'XML-PARSER::|TextDecl|
                                                         XML-PARSER::|TextDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ExtSubset-Constructor|
                                                    XML-PARSER::|ExtSubsetDecl|
                                                    XML-PARSER::|TextDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ExtSubset|
                                                            (DELETE NIL (LIST XML-PARSER::|ExtSubsetDecl| XML-PARSER::|TextDecl|)))
                                                      'XML-PARSER::|ExtSubset|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ExtSubset| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ExtSubset.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtSubset.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExtSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExtSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|ExtSubsetDecl| (CONS RESULT XML-PARSER::|ExtSubsetDecl|)))
                                              (XML-PARSER::|ExtSubset.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ExtSubsetDecl|)
                                              (XML-PARSER::|ExtSubset.2| INDEX)))))))
                               (XML-PARSER::|ExtSubset/ExtSubset.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtSubset/ExtSubset.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExtSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExtSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|ExtSubsetDecl| (CONS RESULT XML-PARSER::|ExtSubsetDecl|)))
                                              (XML-PARSER::|ExtSubset.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ExtSubsetDecl|)
                                              (XML-PARSER::|ExtSubset.2| INDEX)))))))
                               (XML-PARSER::|ExtSubset/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ExtSubset/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ExtSubset/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtSubset/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|TextDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|TextDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|TextDecl| RESULT))
                                              (XML-PARSER::|ExtSubset/ExtSubset.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|TextDecl|)
                                              (XML-PARSER::|ExtSubset/ExtSubset.2.4| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ExtSubset.2| XML-PARSER::|ExtSubset.5|
                          XML-PARSER::|ExtSubset/ExtSubset.2.4| XML-PARSER::|ExtSubset/fail.3| XML-PARSER::|ExtSubset/start.1|))
                        (XML-PARSER::|ExtSubset/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ExtSubset| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ExtSubset| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ExtSubsetDecl| (INDEX &AUX (XML-PARSER::|ConditionalSect| NIL) (XML-PARSER::|DeclSep| NIL)
                                    (XML-PARSER::|MarkupDecl| NIL))
  "{31} ExtSubsetDecl ::= (MarkupDecl | ConditionalSect | DeclSep)
(|ConditionalSect| |DeclSep| |MarkupDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|ExtSubsetDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ExtSubsetDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ExtSubsetDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|ExtSubsetDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ExtSubsetDecl| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|ExtSubsetDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|ExtSubsetDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ExtSubsetDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ExtSubsetDecl|)
                                 (RETURN-FROM XML-PARSER::|ExtSubsetDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ExtSubsetDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ExtSubsetDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtSubsetDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ExtSubsetDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ExtSubsetDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ExtSubsetDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ConditionalSect|
                                                         XML-PARSER::|ConditionalSect|
                                                         'XML-PARSER::|DeclSep|
                                                         XML-PARSER::|DeclSep|
                                                         'XML-PARSER::|MarkupDecl|
                                                         XML-PARSER::|MarkupDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ExtSubsetDecl-Constructor|
                                                    XML-PARSER::|ConditionalSect|
                                                    XML-PARSER::|DeclSep|
                                                    XML-PARSER::|MarkupDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ExtSubsetDecl|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|ConditionalSect|
                                                                          XML-PARSER::|DeclSep|
                                                                          XML-PARSER::|MarkupDecl|)))
                                                      'XML-PARSER::|ExtSubsetDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ExtSubsetDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ExtSubsetDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ExtSubsetDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ExtSubsetDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtSubsetDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|MarkupDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|MarkupDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|MarkupDecl| RESULT))
                                                    (XML-PARSER::|ExtSubsetDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|MarkupDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|ConditionalSect|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ConditionalSect| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|ConditionalSect| RESULT))
                                                    (XML-PARSER::|ExtSubsetDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|ConditionalSect|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|DeclSep|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DeclSep| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|DeclSep| RESULT))
                                                    (XML-PARSER::|ExtSubsetDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|DeclSep|) NIL))))
                                         (XML-PARSER::|ExtSubsetDecl/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ExtSubsetDecl.2| XML-PARSER::|ExtSubsetDecl/fail.3|
                          XML-PARSER::|ExtSubsetDecl/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|ExtSubsetDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ExtSubsetDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ExtSubsetDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|SDDecl| (INDEX &AUX (XML-PARSER::|YesOrNo| NIL))
  "{32} SDDecl ::= S+ standalone Eq ((('\"' YesOrNo '\"') | (''' YesOrNo ''')))
(|YesOrNo|)"
  (DECLARE (SPECIAL XML-PARSER::|SDDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|SDDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|SDDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|SDDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|SDDecl| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|SDDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|SDDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|SDDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|SDDecl|)
                                 (RETURN-FROM XML-PARSER::|SDDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|SDDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|SDDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|SDDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|SDDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|SDDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|YesOrNo| XML-PARSER::|YesOrNo|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|SDDecl-Constructor| XML-PARSER::|YesOrNo|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|SDDecl| (DELETE NIL (LIST XML-PARSER::|YesOrNo|)))
                                                      'XML-PARSER::|SDDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|SDDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|SDDecl.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|SDDecl.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|SDDecl/SDDecl.2.4| INDEX))))))
                               (XML-PARSER::|SDDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|SDDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|SDDecl/SDDecl.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\") (SETF *ATN-TERM* '|xml|:\") (XML-PARSER::|SDDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|SDDecl/SDDecl.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|SDDecl/SDDecl.2.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|SDDecl/SDDecl.2.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.12|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|YesOrNo|)
                                     (COND ((XML-PARSER::|IS-YesOrNo| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|YesOrNo|)
                                            (SETF XML-PARSER::|YesOrNo|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|YesOrNo-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|YesOrNo| |item|)
                                                          'XML-PARSER::|YesOrNo|)))
                                            (XML-PARSER::|SDDecl/SDDecl.2.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|YesOrNo|) NIL)))))
                               (XML-PARSER::|SDDecl/SDDecl.2.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.13|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\') (SETF *ATN-TERM* '|xml|:\') (XML-PARSER::|SDDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|SDDecl/SDDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|standalone|)
                                     (COND ((XML-PARSER::|IS-standaloneToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|standalone|)
                                            (XML-PARSER::|SDDecl/SDDecl.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|standalone|) (XML-PARSER::|SDDecl/fail.3| INDEX))))))
                               (XML-PARSER::|SDDecl/SDDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Eq|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Eq| INDEX)
                                       (COND (SUCCESS (SETF RESULT RESULT) (XML-PARSER::|SDDecl/SDDecl.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Eq|) (XML-PARSER::|SDDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|SDDecl/SDDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|SDDecl/SDDecl.2.8|)
                                           (XML-PARSER::|SDDecl/SDDecl.2.8| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|SDDecl/SDDecl.2.11|)
                                           (XML-PARSER::|SDDecl/SDDecl.2.11| INDEX))
                                         (XML-PARSER::|SDDecl/fail.3| INDEX)))))
                               (XML-PARSER::|SDDecl/SDDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|SDDecl/SDDecl.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|SDDecl/SDDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/SDDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|YesOrNo|)
                                     (COND ((XML-PARSER::|IS-YesOrNo| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|YesOrNo|)
                                            (SETF XML-PARSER::|YesOrNo|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|YesOrNo-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|YesOrNo| |item|)
                                                          'XML-PARSER::|YesOrNo|)))
                                            (XML-PARSER::|SDDecl/SDDecl.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|YesOrNo|) NIL)))))
                               (XML-PARSER::|SDDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|SDDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|SDDecl.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|SDDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|SDDecl.2| XML-PARSER::|SDDecl.7| XML-PARSER::|SDDecl/fail.3|
                          XML-PARSER::|SDDecl/SDDecl.2.10| XML-PARSER::|SDDecl/SDDecl.2.11| XML-PARSER::|SDDecl/SDDecl.2.12|
                          XML-PARSER::|SDDecl/SDDecl.2.13| XML-PARSER::|SDDecl/SDDecl.2.4| XML-PARSER::|SDDecl/SDDecl.2.5|
                          XML-PARSER::|SDDecl/SDDecl.2.6| XML-PARSER::|SDDecl/SDDecl.2.8| XML-PARSER::|SDDecl/SDDecl.2.9|
                          XML-PARSER::|SDDecl/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|SDDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|SDDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|SDDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Element| (INDEX &AUX (XML-PARSER::|Content| NIL) (XML-PARSER::|ETag| NIL) (XML-PARSER::|STag| NIL))
  "{39} Element ::= STag (('/>' | ('>' Content* ETag)))
(|Content| |ETag| |STag|)"
  (DECLARE (SPECIAL XML-PARSER::|Element-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Element-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Element-INDEX| INDEX)
      (LET ((XML-PARSER::|Element-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Element| *ATN-STACK))
            (XML-QUERY-DATA-MODEL:*NAMESPACE-BINDINGS* XML-QUERY-DATA-MODEL:*NAMESPACE-BINDINGS*)
            (XML-QUERY-DATA-MODEL:*DEFAULT-NAMESPACE* XML-QUERY-DATA-MODEL:*DEFAULT-NAMESPACE*)
            (XML-PARSER:*CONSTRUCTION-CONTEXT* XML-PARSER:*CONSTRUCTION-CONTEXT*))
        (DECLARE (SPECIAL XML-PARSER::|Element-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Element|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Element|)
                                 (RETURN-FROM XML-PARSER::|Element| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Element| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Element.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Element|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Element|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Element|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Content|
                                                         XML-PARSER::|Content|
                                                         'XML-PARSER::|ETag|
                                                         XML-PARSER::|ETag|
                                                         'XML-PARSER::|STag|
                                                         XML-PARSER::|STag|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|Element-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|Content|
                                                    XML-PARSER::|ETag|
                                                    XML-PARSER::|STag|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Element|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Content|
                                                                          XML-PARSER::|ETag|
                                                                          XML-PARSER::|STag|)))
                                                      'XML-PARSER::|Element|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Element| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Element.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Content|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Content| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Content| (CONS RESULT XML-PARSER::|Content|)))
                                              (XML-PARSER::|Element.8| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Content|)
                                              (XML-PARSER::|Element/Element.2.7| INDEX)))))))
                               (XML-PARSER::|Element/Element.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element/Element.2.4|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (WORD |xml|:/>)
                                           (COND ((EQ |item| '|xml|:/>)
                                                  (SETF *ATN-TERM* '|xml|:/>)
                                                  (XML-PARSER::|Element.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* '|xml|:/>) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|Element/Element.2.5|)
                                           (XML-PARSER::|Element/Element.2.5| INDEX))
                                         (XML-PARSER::|Element/fail.3| INDEX)))))
                               (XML-PARSER::|Element/Element.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element/Element.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-PARSER::|Element/Element.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) NIL)))))
                               (XML-PARSER::|Element/Element.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element/Element.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Content|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Content| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Content| (CONS RESULT XML-PARSER::|Content|)))
                                              (XML-PARSER::|Element.8| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Content|)
                                              (XML-PARSER::|Element/Element.2.7| INDEX)))))))
                               (XML-PARSER::|Element/Element.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element/Element.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ETag|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ETag| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|ETag| RESULT))
                                              (XML-PARSER::|Element.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|ETag|) NIL))))))
                               (XML-PARSER::|Element/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Element/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Element/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Element/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|STag|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|STag| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|STag| RESULT))
                                              (XML-PARSER::|Element/Element.2.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|STag|) (XML-PARSER::|Element/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Element.2| XML-PARSER::|Element.8| XML-PARSER::|Element/Element.2.4|
                          XML-PARSER::|Element/Element.2.5| XML-PARSER::|Element/Element.2.6| XML-PARSER::|Element/Element.2.7|
                          XML-PARSER::|Element/fail.3| XML-PARSER::|Element/start.1|))
                        (XML-PARSER::|Element/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Element| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Element| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|STag| (INDEX &AUX (XML-PARSER::|AttributeSequence| NIL) (XML-PARSER::|QName| NIL))
  "{40} STag ::= '<' QName AttributeSequence? S*
(|AttributeSequence| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|STag-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|STag-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|STag-INDEX| INDEX)
      (LET ((XML-PARSER::|STag-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|STag| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|STag-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|STag-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|STag|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|STag|)
                                 (RETURN-FROM XML-PARSER::|STag| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|STag| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|STag.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|STag.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|STag|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|STag|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|STag|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttributeSequence|
                                                         XML-PARSER::|AttributeSequence|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|STag-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|AttributeSequence|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|STag|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|AttributeSequence| XML-PARSER::|QName|)))
                                                      'XML-PARSER::|STag|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|STag| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|STag.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|STag.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|STag.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|STag.2| INDEX))))))
                               (XML-PARSER::|STag/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|STag/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|STag/STag.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|STag/STag.2.4|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|STag/STag.2.5| (1+ INDEX)))
                                             (T (SETF *ATN-TERM* 'XML-PARSER::|QName|) (XML-PARSER::|STag/fail.3| INDEX)))))))
                               (XML-PARSER::|STag/STag.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|STag/STag.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttributeSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttributeSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttributeSequence| RESULT))
                                              (XML-PARSER::|STag/STag.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttributeSequence|)
                                              (XML-PARSER::|STag/STag.2.6| INDEX)))))))
                               (XML-PARSER::|STag/STag.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|STag/STag.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|STag.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|STag.2| INDEX))))))
                               (XML-PARSER::|STag/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|STag/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<)
                                     (COND ((EQ |item| '|xml|:<)
                                            (SETF *ATN-TERM* '|xml|:<)
                                            (XML-PARSER::|STag/STag.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<) (XML-PARSER::|STag/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|STag.2| XML-PARSER::|STag.7| XML-PARSER::|STag/fail.3|
                          XML-PARSER::|STag/STag.2.4| XML-PARSER::|STag/STag.2.5| XML-PARSER::|STag/STag.2.6|
                          XML-PARSER::|STag/start.1|))
                        (XML-PARSER::|STag/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|STag| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|STag| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttributeSequence| (INDEX &AUX (XML-PARSER::|Attribute| NIL) (XML-PARSER::|AttributeSequence| NIL))
  "AttributeSequence ::= Attribute AttributeSequence?
(|Attribute| |AttributeSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|AttributeSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttributeSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttributeSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|AttributeSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttributeSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|AttributeSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttributeSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttributeSequence|)
                                 (RETURN-FROM XML-PARSER::|AttributeSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttributeSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttributeSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttributeSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttributeSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttributeSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttributeSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Attribute|
                                                         XML-PARSER::|Attribute|
                                                         'XML-PARSER::|AttributeSequence|
                                                         XML-PARSER::|AttributeSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttributeSequence-Constructor|
                                                    XML-PARSER::|Attribute|
                                                    XML-PARSER::|AttributeSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttributeSequence|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Attribute|
                                                                          XML-PARSER::|AttributeSequence|)))
                                                      'XML-PARSER::|AttributeSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttributeSequence| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttributeSequence/AttributeSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttributeSequence/AttributeSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttributeSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttributeSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttributeSequence| RESULT))
                                              (XML-PARSER::|AttributeSequence.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttributeSequence|)
                                              (XML-PARSER::|AttributeSequence.2| INDEX)))))))
                               (XML-PARSER::|AttributeSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttributeSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttributeSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttributeSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Attribute|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Attribute| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Attribute| RESULT))
                                              (XML-PARSER::|AttributeSequence/AttributeSequence.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Attribute|)
                                              (XML-PARSER::|AttributeSequence/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttributeSequence.2|
                          XML-PARSER::|AttributeSequence/AttributeSequence.2.4| XML-PARSER::|AttributeSequence/fail.3|
                          XML-PARSER::|AttributeSequence/start.1|))
                        (XML-PARSER::|AttributeSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttributeSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttributeSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Attribute| (INDEX &AUX (XML-PARSER::|AttValue| NIL) (XML-PARSER::|QName| NIL))
  "{41} Attribute ::= S+ QName Eq AttValue
(|AttValue| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|Attribute-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Attribute-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Attribute-INDEX| INDEX)
      (LET ((XML-PARSER::|Attribute-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Attribute| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|Attribute-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|Attribute-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Attribute|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Attribute|)
                                 (RETURN-FROM XML-PARSER::|Attribute| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Attribute| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Attribute.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Attribute.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Attribute|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Attribute|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Attribute|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttValue|
                                                         XML-PARSER::|AttValue|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|Attribute-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|AttValue|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Attribute|
                                                            (DELETE NIL (LIST XML-PARSER::|AttValue| XML-PARSER::|QName|)))
                                                      'XML-PARSER::|Attribute|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Attribute| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Attribute.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Attribute.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Attribute.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Attribute/Attribute.2.4| INDEX))))))
                               (XML-PARSER::|Attribute/Attribute.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Attribute/Attribute.2.4|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|Attribute/Attribute.2.5| (1+ INDEX)))
                                             (T (SETF *ATN-TERM* 'XML-PARSER::|QName|) (XML-PARSER::|Attribute/fail.3| INDEX)))))))
                               (XML-PARSER::|Attribute/Attribute.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Attribute/Attribute.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Eq|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Eq| INDEX)
                                       (COND (SUCCESS (SETF RESULT RESULT) (XML-PARSER::|Attribute/Attribute.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Eq|) (XML-PARSER::|Attribute/fail.3| INDEX)))))))
                               (XML-PARSER::|Attribute/Attribute.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Attribute/Attribute.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttValue|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttValue| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttValue| RESULT))
                                              (XML-PARSER::|Attribute.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttValue|)
                                              (XML-PARSER::|Attribute/fail.3| INDEX)))))))
                               (XML-PARSER::|Attribute/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Attribute/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Attribute/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Attribute/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Attribute.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Attribute/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Attribute.2| XML-PARSER::|Attribute.7|
                          XML-PARSER::|Attribute/Attribute.2.4| XML-PARSER::|Attribute/Attribute.2.5|
                          XML-PARSER::|Attribute/Attribute.2.6| XML-PARSER::|Attribute/fail.3| XML-PARSER::|Attribute/start.1|))
                        (XML-PARSER::|Attribute/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Attribute| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Attribute| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ETag| (INDEX &AUX (XML-PARSER::|QName| NIL))
  "{42} ETag ::= '</' QName S* '>'
(|QName|)"
  (DECLARE (SPECIAL XML-PARSER::|ETag-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ETag-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ETag-INDEX| INDEX)
      (LET ((XML-PARSER::|ETag-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ETag| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|ETag-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|ETag-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ETag|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ETag|)
                                 (RETURN-FROM XML-PARSER::|ETag| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ETag| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ETag.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ETag.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ETag|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ETag|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ETag|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|QName| XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|ETag-Constructor| XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ETag| (DELETE NIL (LIST XML-PARSER::|QName|)))
                                                      'XML-PARSER::|ETag|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ETag| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ETag.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ETag.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ETag.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|ETag/ETag.2.6| INDEX))))))
                               (XML-PARSER::|ETag/ETag.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ETag/ETag.2.4|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|ETag/ETag.2.5| (1+ INDEX)))
                                             (T (SETF *ATN-TERM* 'XML-PARSER::|QName|) (XML-PARSER::|ETag/fail.3| INDEX)))))))
                               (XML-PARSER::|ETag/ETag.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ETag/ETag.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ETag.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|ETag/ETag.2.6| INDEX))))))
                               (XML-PARSER::|ETag/ETag.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ETag/ETag.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>) (XML-PARSER::|ETag.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|ETag/fail.3| INDEX))))))
                               (XML-PARSER::|ETag/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|ETag/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ETag/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ETag/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:</)
                                     (COND ((EQ |item| '|xml|:</)
                                            (SETF *ATN-TERM* '|xml|:</)
                                            (XML-PARSER::|ETag/ETag.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:</) (XML-PARSER::|ETag/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ETag.2| XML-PARSER::|ETag.7| XML-PARSER::|ETag/ETag.2.4|
                          XML-PARSER::|ETag/ETag.2.5| XML-PARSER::|ETag/ETag.2.6| XML-PARSER::|ETag/fail.3|
                          XML-PARSER::|ETag/start.1|))
                        (XML-PARSER::|ETag/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ETag| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ETag| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Content| (INDEX &AUX (XML-PARSER::|CDSect| NIL) (XML-PARSER::|CharData| NIL) (XML-PARSER::|Comment| NIL)
                              (XML-PARSER::|Element| NIL) (XML-PARSER::|ParsedReference| NIL) (XML-PARSER::|Pi| NIL)
                              (XML-PARSER::|Reference| NIL))
  "{43} Content ::= (CharData | Element | Comment | Pi | CDSect | Reference | ParsedReference)
(|CDSect| |CharData| |Comment| |Element| |ParsedReference| |Pi| |Reference|)"
  (DECLARE (SPECIAL XML-PARSER::|Content-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Content-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Content-INDEX| INDEX)
      (LET ((XML-PARSER::|Content-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Content| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|Content-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|Content-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Content|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Content|)
                                 (RETURN-FROM XML-PARSER::|Content| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Content| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Content.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Content.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Content|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Content|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Content|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|CDSect|
                                                         XML-PARSER::|CDSect|
                                                         'XML-PARSER::|CharData|
                                                         XML-PARSER::|CharData|
                                                         'XML-PARSER::|Comment|
                                                         XML-PARSER::|Comment|
                                                         'XML-PARSER::|Element|
                                                         XML-PARSER::|Element|
                                                         'XML-PARSER::|ParsedReference|
                                                         XML-PARSER::|ParsedReference|
                                                         'XML-PARSER::|Pi|
                                                         XML-PARSER::|Pi|
                                                         'XML-PARSER::|Reference|
                                                         XML-PARSER::|Reference|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|Content-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|CDSect|
                                                    XML-PARSER::|CharData|
                                                    XML-PARSER::|Comment|
                                                    XML-PARSER::|Element|
                                                    XML-PARSER::|ParsedReference|
                                                    XML-PARSER::|Pi|
                                                    XML-PARSER::|Reference|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Content|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|CDSect|
                                                                          XML-PARSER::|CharData|
                                                                          XML-PARSER::|Comment|
                                                                          XML-PARSER::|Element|
                                                                          XML-PARSER::|ParsedReference|
                                                                          XML-PARSER::|Pi|
                                                                          XML-PARSER::|Reference|)))
                                                      'XML-PARSER::|Content|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Content| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Content/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Content/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Content/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Content/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|CharData|)
                                           (COND ((XML-PARSER::|IS-CharData| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|CharData|)
                                                  (SETF XML-PARSER::|CharData|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM-WITH-CONTEXT
                                                              #'XML-PARSER:|CharData-Constructor|
                                                              XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                              |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|CharData| |item|)
                                                                'XML-PARSER::|CharData|)))
                                                  (XML-PARSER::|Content.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|CharData|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Element|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Element| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Element| RESULT))
                                                    (XML-PARSER::|Content.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Element|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Comment|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Comment| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Comment| RESULT))
                                                    (XML-PARSER::|Content.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Comment|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Pi|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Pi| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Pi| RESULT))
                                                    (XML-PARSER::|Content.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Pi|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|CDSect|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|CDSect| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|CDSect| RESULT))
                                                    (XML-PARSER::|Content.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|CDSect|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Reference|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Reference| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Reference| RESULT))
                                                    (XML-PARSER::|Content.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Reference|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|ParsedReference|)
                                           (COND ((XML-PARSER::|IS-ParsedReference| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|ParsedReference|)
                                                  (SETF XML-PARSER::|ParsedReference|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|ParsedReference-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|ParsedReference| |item|)
                                                                'XML-PARSER::|ParsedReference|)))
                                                  (XML-PARSER::|Content.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|ParsedReference|) NIL)))
                                         (XML-PARSER::|Content/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Content.2| XML-PARSER::|Content/fail.3| XML-PARSER::|Content/start.1|))
                        (XML-PARSER::|Content/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Content| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Content| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ElementDecl| (INDEX &AUX (XML-PARSER::|ContentSpec| NIL) (XML-PARSER::|QName| NIL))
  "{45} ElementDecl ::= '<!ELEMENT' S+ QName S+ ContentSpec S* '>'
(|ContentSpec| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|ElementDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ElementDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ElementDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|ElementDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ElementDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|ElementDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ElementDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ElementDecl|)
                                 (RETURN-FROM XML-PARSER::|ElementDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ElementDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ElementDecl.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl/ElementDecl.2.5| INDEX))))))
                               (XML-PARSER::|ElementDecl.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl/ElementDecl.2.7| INDEX))))))
                               (XML-PARSER::|ElementDecl.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl.12| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl/ElementDecl.2.9| INDEX))))))
                               (XML-PARSER::|ElementDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ElementDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ElementDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ElementDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ContentSpec|
                                                         XML-PARSER::|ContentSpec|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ElementDecl-Constructor|
                                                    XML-PARSER::|ContentSpec|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ElementDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|ContentSpec| XML-PARSER::|QName|)))
                                                      'XML-PARSER::|ElementDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ElementDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ElementDecl/ElementDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/ElementDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|ElementDecl/fail.3| INDEX))))))
                               (XML-PARSER::|ElementDecl/ElementDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/ElementDecl.2.5|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|ElementDecl/ElementDecl.2.6| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (XML-PARSER::|ElementDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|ElementDecl/ElementDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/ElementDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|ElementDecl/fail.3| INDEX))))))
                               (XML-PARSER::|ElementDecl/ElementDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/ElementDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ContentSpec|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ContentSpec| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|ContentSpec| RESULT))
                                              (XML-PARSER::|ElementDecl/ElementDecl.2.8| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ContentSpec|)
                                              (XML-PARSER::|ElementDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|ElementDecl/ElementDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/ElementDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl.12| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ElementDecl/ElementDecl.2.9| INDEX))))))
                               (XML-PARSER::|ElementDecl/ElementDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/ElementDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-PARSER::|ElementDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|ElementDecl/fail.3| INDEX))))))
                               (XML-PARSER::|ElementDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ElementDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ElementDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ElementDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!ELEMENT)
                                     (COND ((EQ |item| '|xml|:<!ELEMENT)
                                            (SETF *ATN-TERM* '|xml|:<!ELEMENT)
                                            (XML-PARSER::|ElementDecl/ElementDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!ELEMENT) (XML-PARSER::|ElementDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ElementDecl.10| XML-PARSER::|ElementDecl.11|
                          XML-PARSER::|ElementDecl.12| XML-PARSER::|ElementDecl.2| XML-PARSER::|ElementDecl/ElementDecl.2.4|
                          XML-PARSER::|ElementDecl/ElementDecl.2.5| XML-PARSER::|ElementDecl/ElementDecl.2.6|
                          XML-PARSER::|ElementDecl/ElementDecl.2.7| XML-PARSER::|ElementDecl/ElementDecl.2.8|
                          XML-PARSER::|ElementDecl/ElementDecl.2.9| XML-PARSER::|ElementDecl/fail.3|
                          XML-PARSER::|ElementDecl/start.1|))
                        (XML-PARSER::|ElementDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ElementDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ElementDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ContentSpec| (INDEX &AUX (XML-PARSER::ANY NIL) (XML-PARSER::|Children| NIL) (XML-PARSER::EMPTY NIL)
                                  (XML-PARSER::|Mixed| NIL))
  "{46} ContentSpec ::= (EMPTY | ANY | Mixed | Children)
(ANY |Children| EMPTY |Mixed|)"
  (DECLARE (SPECIAL XML-PARSER::|ContentSpec-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ContentSpec-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ContentSpec-INDEX| INDEX)
      (LET ((XML-PARSER::|ContentSpec-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ContentSpec| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|ContentSpec-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|ContentSpec-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ContentSpec|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ContentSpec|)
                                 (RETURN-FROM XML-PARSER::|ContentSpec| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ContentSpec| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ContentSpec.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ContentSpec.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ContentSpec|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ContentSpec|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ContentSpec|
                                                   INDEX
                                                   (LIST 'XML-PARSER::ANY
                                                         XML-PARSER::ANY
                                                         'XML-PARSER::|Children|
                                                         XML-PARSER::|Children|
                                                         'XML-PARSER::EMPTY
                                                         XML-PARSER::EMPTY
                                                         'XML-PARSER::|Mixed|
                                                         XML-PARSER::|Mixed|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ContentSpec-Constructor|
                                                    XML-PARSER::ANY
                                                    XML-PARSER::|Children|
                                                    XML-PARSER::EMPTY
                                                    XML-PARSER::|Mixed|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ContentSpec|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::ANY
                                                                          XML-PARSER::|Children|
                                                                          XML-PARSER::EMPTY
                                                                          XML-PARSER::|Mixed|)))
                                                      'XML-PARSER::|ContentSpec|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ContentSpec| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ContentSpec/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ContentSpec/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ContentSpec/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ContentSpec/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::EMPTY)
                                           (COND ((XML-PARSER::|IS-EMPTYToken| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::EMPTY)
                                                  (SETF XML-PARSER::EMPTY
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|EMPTY-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::EMPTY |item|)
                                                                'XML-PARSER::EMPTY)))
                                                  (XML-PARSER::|ContentSpec.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::EMPTY) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::ANY)
                                           (COND ((XML-PARSER::|IS-ANYToken| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::ANY)
                                                  (SETF XML-PARSER::ANY
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|ANY-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::ANY |item|)
                                                                'XML-PARSER::ANY)))
                                                  (XML-PARSER::|ContentSpec.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::ANY) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Mixed|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Mixed| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Mixed| RESULT))
                                                    (XML-PARSER::|ContentSpec.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Mixed|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Children|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Children| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Children| RESULT))
                                                    (XML-PARSER::|ContentSpec.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Children|) NIL))))
                                         (XML-PARSER::|ContentSpec/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ContentSpec.2| XML-PARSER::|ContentSpec/fail.3|
                          XML-PARSER::|ContentSpec/start.1|))
                        (XML-PARSER::|ContentSpec/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ContentSpec| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ContentSpec| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Children| (INDEX &AUX (XML-PARSER::|Cardinality| NIL) (XML-PARSER::|ChoiceOrSeq| NIL))
  "{47} Children ::= ChoiceOrSeq Cardinality?
(|Cardinality| |ChoiceOrSeq|)"
  (DECLARE (SPECIAL XML-PARSER::|Children-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Children-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Children-INDEX| INDEX)
      (LET ((XML-PARSER::|Children-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Children| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Children-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Children|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Children|)
                                 (RETURN-FROM XML-PARSER::|Children| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Children| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Children.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Children.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Children|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Children|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Children|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Cardinality|
                                                         XML-PARSER::|Cardinality|
                                                         'XML-PARSER::|ChoiceOrSeq|
                                                         XML-PARSER::|ChoiceOrSeq|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Children-Constructor|
                                                    XML-PARSER::|Cardinality|
                                                    XML-PARSER::|ChoiceOrSeq|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Children|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Cardinality| XML-PARSER::|ChoiceOrSeq|)))
                                                      'XML-PARSER::|Children|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Children| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Children/Children.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Children/Children.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|Cardinality|)
                                     (COND ((XML-PARSER::|IS-Cardinality| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|Cardinality|)
                                            (SETF XML-PARSER::|Cardinality|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|Cardinality-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|Cardinality| |item|)
                                                          'XML-PARSER::|Cardinality|)))
                                            (XML-PARSER::|Children.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|Cardinality|) (XML-PARSER::|Children.2| INDEX))))))
                               (XML-PARSER::|Children/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Children/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Children/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Children/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ChoiceOrSeq|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ChoiceOrSeq| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|ChoiceOrSeq| RESULT))
                                              (XML-PARSER::|Children/Children.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ChoiceOrSeq|)
                                              (XML-PARSER::|Children/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Children.2| XML-PARSER::|Children/Children.2.4|
                          XML-PARSER::|Children/fail.3| XML-PARSER::|Children/start.1|))
                        (XML-PARSER::|Children/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Children| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Children| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Cp| (INDEX &AUX (XML-PARSER::|Cardinality| NIL) (XML-PARSER::|ChoiceOrSeq| NIL) (XML-PARSER::|QName| NIL))
  "{48} Cp ::= ((QName | ChoiceOrSeq)) Cardinality?
(|Cardinality| |ChoiceOrSeq| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|Cp-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Cp-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Cp-INDEX| INDEX)
      (LET ((XML-PARSER::|Cp-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Cp| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Cp-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Cp|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Cp|)
                                 (RETURN-FROM XML-PARSER::|Cp| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Cp| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Cp.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Cp.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Cp|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Cp|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Cp|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Cardinality|
                                                         XML-PARSER::|Cardinality|
                                                         'XML-PARSER::|ChoiceOrSeq|
                                                         XML-PARSER::|ChoiceOrSeq|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Cp-Constructor|
                                                    XML-PARSER::|Cardinality|
                                                    XML-PARSER::|ChoiceOrSeq|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Cp|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Cardinality|
                                                                          XML-PARSER::|ChoiceOrSeq|
                                                                          XML-PARSER::|QName|)))
                                                      'XML-PARSER::|Cp|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Cp| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Cp/Cp.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Cp/Cp.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|Cardinality|)
                                     (COND ((XML-PARSER::|IS-Cardinality| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|Cardinality|)
                                            (SETF XML-PARSER::|Cardinality|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|Cardinality-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|Cardinality| |item|)
                                                          'XML-PARSER::|Cardinality|)))
                                            (XML-PARSER::|Cp.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|Cardinality|) (XML-PARSER::|Cp.2| INDEX))))))
                               (XML-PARSER::|Cp/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|Cp/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Cp/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Cp/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-PARSER::|QName|)
                                           (COND ((XML-PARSER::|IS-QName| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                                  (SETF XML-PARSER::|QName|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|QName| |item|)
                                                                'XML-PARSER::|QName|)))
                                                  (XML-PARSER::|Cp/Cp.2.4| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PARSER::|QName|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|ChoiceOrSeq|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ChoiceOrSeq| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|ChoiceOrSeq| RESULT))
                                                    (XML-PARSER::|Cp/Cp.2.4| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|ChoiceOrSeq|) NIL))))
                                         (XML-PARSER::|Cp/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Cp.2| XML-PARSER::|Cp/Cp.2.4| XML-PARSER::|Cp/fail.3|
                          XML-PARSER::|Cp/start.1|))
                        (XML-PARSER::|Cp/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Cp| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Cp| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ChoiceOrSeq| (INDEX &AUX (XML-PARSER::|Choice| NIL) (XML-PARSER::|Cp| NIL) (XML-PARSER::|Seq| NIL))
  "ChoiceOrSeq ::= '(' S* Cp ((Choice | Seq))? S* ')'
(|Choice| |Cp| |Seq|)"
  (DECLARE (SPECIAL XML-PARSER::|ChoiceOrSeq-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ChoiceOrSeq-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ChoiceOrSeq-INDEX| INDEX)
      (LET ((XML-PARSER::|ChoiceOrSeq-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ChoiceOrSeq| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|ChoiceOrSeq-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ChoiceOrSeq|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ChoiceOrSeq|)
                                 (RETURN-FROM XML-PARSER::|ChoiceOrSeq| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ChoiceOrSeq| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ChoiceOrSeq.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.8| INDEX))))))
                               (XML-PARSER::|ChoiceOrSeq.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ChoiceOrSeq|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ChoiceOrSeq|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ChoiceOrSeq|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Choice|
                                                         XML-PARSER::|Choice|
                                                         'XML-PARSER::|Cp|
                                                         XML-PARSER::|Cp|
                                                         'XML-PARSER::|Seq|
                                                         XML-PARSER::|Seq|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ChoiceOrSeq-Constructor|
                                                    XML-PARSER::|Choice|
                                                    XML-PARSER::|Cp|
                                                    XML-PARSER::|Seq|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ChoiceOrSeq|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Choice|
                                                                          XML-PARSER::|Cp|
                                                                          XML-PARSER::|Seq|)))
                                                      'XML-PARSER::|ChoiceOrSeq|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ChoiceOrSeq| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ChoiceOrSeq.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq.9| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.5| INDEX))))))
                               (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq.9| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.5| INDEX))))))
                               (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Cp|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Cp| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Cp| RESULT))
                                              (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.6| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Cp|) (XML-PARSER::|ChoiceOrSeq/fail.3| INDEX)))))))
                               (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.6|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Choice|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Choice| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Choice| RESULT))
                                                    (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.7| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Choice|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Seq|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Seq| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Seq| RESULT))
                                                    (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.7| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Seq|) NIL))))
                                         (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.7| INDEX)))))
                               (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.8| INDEX))))))
                               (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-PARSER::|ChoiceOrSeq.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-PARSER::|ChoiceOrSeq/fail.3| INDEX))))))
                               (XML-PARSER::|ChoiceOrSeq/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ChoiceOrSeq/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ChoiceOrSeq/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ChoiceOrSeq/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-PARSER::|ChoiceOrSeq/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ChoiceOrSeq.10| XML-PARSER::|ChoiceOrSeq.2| XML-PARSER::|ChoiceOrSeq.9|
                          XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.4| XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.5|
                          XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.6| XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.7|
                          XML-PARSER::|ChoiceOrSeq/ChoiceOrSeq.2.8| XML-PARSER::|ChoiceOrSeq/fail.3|
                          XML-PARSER::|ChoiceOrSeq/start.1|))
                        (XML-PARSER::|ChoiceOrSeq/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ChoiceOrSeq| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ChoiceOrSeq| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Choice| (INDEX &AUX (XML-PARSER::|Cp| NIL))
  "{49} Choice ::= (S* '|' S* Cp)+
(|Cp|)"
  (DECLARE (SPECIAL XML-PARSER::|Choice-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Choice-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Choice-INDEX| INDEX)
      (LET ((XML-PARSER::|Choice-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Choice| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Choice-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Choice|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Choice|)
                                 (RETURN-FROM XML-PARSER::|Choice| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Choice| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Choice.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.8| INDEX))))))
                               (XML-PARSER::|Choice.15| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice.15|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.12| INDEX))))))
                               (XML-PARSER::|Choice.16| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice.16|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.16| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.14| INDEX))))))
                               (XML-PARSER::|Choice.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Choice|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Choice|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Choice|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Cp| XML-PARSER::|Cp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|Choice-Constructor| XML-PARSER::|Cp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Choice| (DELETE NIL (LIST XML-PARSER::|Cp|)))
                                                      'XML-PARSER::|Choice|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Choice| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Choice.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice.4|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Choice/Choice.4.5|) (XML-PARSER::|Choice/Choice.4.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Choice.2|) (XML-PARSER::|Choice.2| INDEX))))
                               (XML-PARSER::|Choice.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.6| INDEX))))))
                               (XML-PARSER::|Choice/Choice.4.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.12| INDEX))))))
                               (XML-PARSER::|Choice/Choice.4.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.12|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\|)
                                     (COND ((EQ |item| '|xml|:\|)
                                            (SETF *ATN-TERM* '|xml|:\|)
                                            (XML-PARSER::|Choice/Choice.4.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\|) NIL)))))
                               (XML-PARSER::|Choice/Choice.4.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.13|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.16| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.14| INDEX))))))
                               (XML-PARSER::|Choice/Choice.4.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.14|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Cp|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Cp| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Cp| (CONS RESULT XML-PARSER::|Cp|)))
                                              (XML-PARSER::|Choice.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Cp|) NIL))))))
                               (XML-PARSER::|Choice/Choice.4.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.6| INDEX))))))
                               (XML-PARSER::|Choice/Choice.4.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\|)
                                     (COND ((EQ |item| '|xml|:\|)
                                            (SETF *ATN-TERM* '|xml|:\|)
                                            (XML-PARSER::|Choice/Choice.4.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\|) NIL)))))
                               (XML-PARSER::|Choice/Choice.4.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Choice.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Choice/Choice.4.8| INDEX))))))
                               (XML-PARSER::|Choice/Choice.4.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/Choice.4.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Cp|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Cp| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Cp| (CONS RESULT XML-PARSER::|Cp|)))
                                              (XML-PARSER::|Choice.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Cp|) NIL))))))
                               (XML-PARSER::|Choice/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Choice/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Choice/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Choice/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|Choice/Choice.4.11|)
                                     (XML-PARSER::|Choice/Choice.4.11| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Choice/fail.3|) (XML-PARSER::|Choice/fail.3| INDEX)))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Choice.10| XML-PARSER::|Choice.15| XML-PARSER::|Choice.16|
                          XML-PARSER::|Choice.2| XML-PARSER::|Choice.4| XML-PARSER::|Choice.9| XML-PARSER::|Choice/Choice.4.11|
                          XML-PARSER::|Choice/Choice.4.12| XML-PARSER::|Choice/Choice.4.13| XML-PARSER::|Choice/Choice.4.14|
                          XML-PARSER::|Choice/Choice.4.5| XML-PARSER::|Choice/Choice.4.6| XML-PARSER::|Choice/Choice.4.7|
                          XML-PARSER::|Choice/Choice.4.8| XML-PARSER::|Choice/fail.3| XML-PARSER::|Choice/start.1|))
                        (XML-PARSER::|Choice/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Choice| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Choice| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Seq| (INDEX &AUX (XML-PARSER::|Cp| NIL))
  "{50} Seq ::= (S* ',' S* Cp)+
(|Cp|)"
  (DECLARE (SPECIAL XML-PARSER::|Seq-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Seq-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Seq-INDEX| INDEX)
      (LET ((XML-PARSER::|Seq-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Seq| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Seq-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Seq|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Seq|)
                                 (RETURN-FROM XML-PARSER::|Seq| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Seq| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Seq.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.8| INDEX))))))
                               (XML-PARSER::|Seq.15| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq.15|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.12| INDEX))))))
                               (XML-PARSER::|Seq.16| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq.16|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.16| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.14| INDEX))))))
                               (XML-PARSER::|Seq.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Seq|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Seq|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Seq|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Cp| XML-PARSER::|Cp|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|Seq-Constructor| XML-PARSER::|Cp|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Seq| (DELETE NIL (LIST XML-PARSER::|Cp|)))
                                                      'XML-PARSER::|Seq|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Seq| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Seq.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq.4|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Seq/Seq.4.5|) (XML-PARSER::|Seq/Seq.4.5| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Seq.2|) (XML-PARSER::|Seq.2| INDEX))))
                               (XML-PARSER::|Seq.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.6| INDEX))))))
                               (XML-PARSER::|Seq/fail.3| (INDEX) (%ATN-NODE-BLOCK XML-PARSER::|Seq/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Seq/Seq.4.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.12| INDEX))))))
                               (XML-PARSER::|Seq/Seq.4.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.12|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((EQ |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-PARSER::|Seq/Seq.4.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-PARSER::|Seq/Seq.4.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.13|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.16| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.14| INDEX))))))
                               (XML-PARSER::|Seq/Seq.4.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.14|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Cp|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Cp| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Cp| (CONS RESULT XML-PARSER::|Cp|)))
                                              (XML-PARSER::|Seq.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Cp|) NIL))))))
                               (XML-PARSER::|Seq/Seq.4.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.6| INDEX))))))
                               (XML-PARSER::|Seq/Seq.4.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\,)
                                     (COND ((EQ |item| '|xml|:\,)
                                            (SETF *ATN-TERM* '|xml|:\,)
                                            (XML-PARSER::|Seq/Seq.4.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\,) NIL)))))
                               (XML-PARSER::|Seq/Seq.4.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Seq.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Seq/Seq.4.8| INDEX))))))
                               (XML-PARSER::|Seq/Seq.4.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/Seq.4.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Cp|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Cp| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Cp| (CONS RESULT XML-PARSER::|Cp|)))
                                              (XML-PARSER::|Seq.4| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|Cp|) NIL))))))
                               (XML-PARSER::|Seq/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Seq/start.1|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Seq/Seq.4.11|) (XML-PARSER::|Seq/Seq.4.11| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Seq/fail.3|) (XML-PARSER::|Seq/fail.3| INDEX)))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Seq.10| XML-PARSER::|Seq.15| XML-PARSER::|Seq.16| XML-PARSER::|Seq.2|
                          XML-PARSER::|Seq.4| XML-PARSER::|Seq.9| XML-PARSER::|Seq/fail.3| XML-PARSER::|Seq/Seq.4.11|
                          XML-PARSER::|Seq/Seq.4.12| XML-PARSER::|Seq/Seq.4.13| XML-PARSER::|Seq/Seq.4.14|
                          XML-PARSER::|Seq/Seq.4.5| XML-PARSER::|Seq/Seq.4.6| XML-PARSER::|Seq/Seq.4.7| XML-PARSER::|Seq/Seq.4.8|
                          XML-PARSER::|Seq/start.1|))
                        (XML-PARSER::|Seq/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Seq| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Seq| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Mixed| (INDEX &AUX (XML-PARSER::|QName| NIL))
  "{51} Mixed ::= (('(' S* PCDATA (S* '|' S* QName)* S* ')'
                 MixedCardinality) | ('(' S* PCDATA S* ')'))
(|QName|)"
  (DECLARE (SPECIAL XML-PARSER::|Mixed-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Mixed-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Mixed-INDEX| INDEX)
      (LET ((XML-PARSER::|Mixed-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Mixed| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Mixed-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Mixed|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Mixed|)
                                 (RETURN-FROM XML-PARSER::|Mixed| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Mixed| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Mixed.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.6| INDEX))))))
                               (XML-PARSER::|Mixed.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.12|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Mixed/Mixed.12.13|) (XML-PARSER::|Mixed/Mixed.12.13| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Mixed/Mixed.2.8|) (XML-PARSER::|Mixed/Mixed.2.8| INDEX))))
                               (XML-PARSER::|Mixed.17| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.17|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.17| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.12.14| INDEX))))))
                               (XML-PARSER::|Mixed.18| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.18|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.18| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.12.16| INDEX))))))
                               (XML-PARSER::|Mixed.19| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.19|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.19| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.9| INDEX))))))
                               (XML-PARSER::|Mixed.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Mixed|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Mixed|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Mixed|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|QName| XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|Mixed-Constructor| XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Mixed| (DELETE NIL (LIST XML-PARSER::|QName|)))
                                                      'XML-PARSER::|Mixed|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Mixed| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Mixed.25| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.25|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.25| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.22| INDEX))))))
                               (XML-PARSER::|Mixed.26| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed.26|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.26| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.24| INDEX))))))
                               (XML-PARSER::|Mixed/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Mixed/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Mixed/Mixed.12.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.12.13|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.17| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.12.14| INDEX))))))
                               (XML-PARSER::|Mixed/Mixed.12.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.12.14|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\|)
                                     (COND ((EQ |item| '|xml|:\|)
                                            (SETF *ATN-TERM* '|xml|:\|)
                                            (XML-PARSER::|Mixed/Mixed.12.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\|) NIL)))))
                               (XML-PARSER::|Mixed/Mixed.12.15| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.12.15|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.18| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.12.16| INDEX))))))
                               (XML-PARSER::|Mixed/Mixed.12.16| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.12.16|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (CONS (IF (EQ *ATN-REDUCE* T)
                                                              (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                              (IF (EQ *ATN-REDUCE* 'CONS)
                                                                  (LIST 'XML-PARSER::|QName| |item|)
                                                                  'XML-PARSER::|QName|))
                                                          XML-PARSER::|QName|))
                                              (XML-PARSER::|Mixed.12| (1+ INDEX)))
                                             (T (SETF *ATN-TERM* 'XML-PARSER::|QName|) NIL))))))
                               (XML-PARSER::|Mixed/Mixed.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|MixedCardinality|)
                                     (COND ((XML-PARSER::|IS-MixedCardinality| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|MixedCardinality|)
                                            (XML-PARSER::|Mixed.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM* 'XML-PARSER::|MixedCardinality|) NIL)))))
                               (XML-PARSER::|Mixed/Mixed.2.20| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.20|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PARSER::|Mixed/Mixed.2.21| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() NIL)))))
                               (XML-PARSER::|Mixed/Mixed.2.21| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.21|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.25| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.22| INDEX))))))
                               (XML-PARSER::|Mixed/Mixed.2.22| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.22|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::PCDATA)
                                     (COND ((XML-PARSER::|IS-PCDATAToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::PCDATA)
                                            (XML-PARSER::|Mixed/Mixed.2.23| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::PCDATA) NIL)))))
                               (XML-PARSER::|Mixed/Mixed.2.23| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.23|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.26| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.24| INDEX))))))
                               (XML-PARSER::|Mixed/Mixed.2.24| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.24|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\)) (SETF *ATN-TERM* '|xml|:\)) (XML-PARSER::|Mixed.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) NIL)))))
                               (XML-PARSER::|Mixed/Mixed.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PARSER::|Mixed/Mixed.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() NIL)))))
                               (XML-PARSER::|Mixed/Mixed.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.6| INDEX))))))
                               (XML-PARSER::|Mixed/Mixed.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::PCDATA)
                                     (COND ((XML-PARSER::|IS-PCDATAToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::PCDATA)
                                            (XML-PARSER::|Mixed/Mixed.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::PCDATA) NIL)))))
                               (XML-PARSER::|Mixed/Mixed.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.7|
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Mixed/Mixed.12.13|) (XML-PARSER::|Mixed/Mixed.12.13| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|Mixed/Mixed.2.8|) (XML-PARSER::|Mixed/Mixed.2.8| INDEX))))
                               (XML-PARSER::|Mixed/Mixed.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Mixed.19| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|Mixed/Mixed.2.9| INDEX))))))
                               (XML-PARSER::|Mixed/Mixed.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/Mixed.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-PARSER::|Mixed/Mixed.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) NIL)))))
                               (XML-PARSER::|Mixed/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Mixed/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|Mixed/Mixed.2.4|)
                                           (XML-PARSER::|Mixed/Mixed.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|Mixed/Mixed.2.20|)
                                           (XML-PARSER::|Mixed/Mixed.2.20| INDEX))
                                         (XML-PARSER::|Mixed/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Mixed.11| XML-PARSER::|Mixed.12| XML-PARSER::|Mixed.17|
                          XML-PARSER::|Mixed.18| XML-PARSER::|Mixed.19| XML-PARSER::|Mixed.2| XML-PARSER::|Mixed.25|
                          XML-PARSER::|Mixed.26| XML-PARSER::|Mixed/fail.3| XML-PARSER::|Mixed/Mixed.12.13|
                          XML-PARSER::|Mixed/Mixed.12.14| XML-PARSER::|Mixed/Mixed.12.15| XML-PARSER::|Mixed/Mixed.12.16|
                          XML-PARSER::|Mixed/Mixed.2.10| XML-PARSER::|Mixed/Mixed.2.20| XML-PARSER::|Mixed/Mixed.2.21|
                          XML-PARSER::|Mixed/Mixed.2.22| XML-PARSER::|Mixed/Mixed.2.23| XML-PARSER::|Mixed/Mixed.2.24|
                          XML-PARSER::|Mixed/Mixed.2.4| XML-PARSER::|Mixed/Mixed.2.5| XML-PARSER::|Mixed/Mixed.2.6|
                          XML-PARSER::|Mixed/Mixed.2.7| XML-PARSER::|Mixed/Mixed.2.8| XML-PARSER::|Mixed/Mixed.2.9|
                          XML-PARSER::|Mixed/start.1|))
                        (XML-PARSER::|Mixed/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Mixed| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Mixed| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttlistDecl| (INDEX &AUX (XML-PARSER::|AttDefSequence| NIL) (XML-PARSER::|QName| NIL))
  "{52} AttlistDecl ::= '<!ATTLIST' S+ QName AttDefSequence? S* '>'
(|AttDefSequence| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|AttlistDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttlistDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttlistDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|AttlistDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttlistDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|AttlistDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttlistDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttlistDecl|)
                                 (RETURN-FROM XML-PARSER::|AttlistDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttlistDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttlistDecl.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl/AttlistDecl.2.8| INDEX))))))
                               (XML-PARSER::|AttlistDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttlistDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttlistDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttlistDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttDefSequence|
                                                         XML-PARSER::|AttDefSequence|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttlistDecl-Constructor|
                                                    XML-PARSER::|AttDefSequence|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttlistDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|AttDefSequence| XML-PARSER::|QName|)))
                                                      'XML-PARSER::|AttlistDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttlistDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttlistDecl.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl.9| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl/AttlistDecl.2.5| INDEX))))))
                               (XML-PARSER::|AttlistDecl/AttlistDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl/AttlistDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttlistDecl/fail.3| INDEX))))))
                               (XML-PARSER::|AttlistDecl/AttlistDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl/AttlistDecl.2.5|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|AttlistDecl/AttlistDecl.2.6| (1+ INDEX)))
                                             (T
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (XML-PARSER::|AttlistDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|AttlistDecl/AttlistDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl/AttlistDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttDefSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttDefSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttDefSequence| RESULT))
                                              (XML-PARSER::|AttlistDecl/AttlistDecl.2.7| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttDefSequence|)
                                              (XML-PARSER::|AttlistDecl/AttlistDecl.2.7| INDEX)))))))
                               (XML-PARSER::|AttlistDecl/AttlistDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl/AttlistDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|AttlistDecl/AttlistDecl.2.8| INDEX))))))
                               (XML-PARSER::|AttlistDecl/AttlistDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl/AttlistDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-PARSER::|AttlistDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|AttlistDecl/fail.3| INDEX))))))
                               (XML-PARSER::|AttlistDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttlistDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttlistDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttlistDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!ATTLIST)
                                     (COND ((EQ |item| '|xml|:<!ATTLIST)
                                            (SETF *ATN-TERM* '|xml|:<!ATTLIST)
                                            (XML-PARSER::|AttlistDecl/AttlistDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!ATTLIST) (XML-PARSER::|AttlistDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttlistDecl.10| XML-PARSER::|AttlistDecl.2| XML-PARSER::|AttlistDecl.9|
                          XML-PARSER::|AttlistDecl/AttlistDecl.2.4| XML-PARSER::|AttlistDecl/AttlistDecl.2.5|
                          XML-PARSER::|AttlistDecl/AttlistDecl.2.6| XML-PARSER::|AttlistDecl/AttlistDecl.2.7|
                          XML-PARSER::|AttlistDecl/AttlistDecl.2.8| XML-PARSER::|AttlistDecl/fail.3|
                          XML-PARSER::|AttlistDecl/start.1|))
                        (XML-PARSER::|AttlistDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttlistDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttlistDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttDefSequence| (INDEX &AUX (XML-PARSER::|AttDef| NIL) (XML-PARSER::|AttDefSequence| NIL))
  "AttDefSequence ::= AttDef AttDefSequence?
(|AttDef| |AttDefSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|AttDefSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttDefSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttDefSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|AttDefSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttDefSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|AttDefSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttDefSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttDefSequence|)
                                 (RETURN-FROM XML-PARSER::|AttDefSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttDefSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttDefSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDefSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttDefSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttDefSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttDefSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttDef|
                                                         XML-PARSER::|AttDef|
                                                         'XML-PARSER::|AttDefSequence|
                                                         XML-PARSER::|AttDefSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttDefSequence-Constructor|
                                                    XML-PARSER::|AttDef|
                                                    XML-PARSER::|AttDefSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttDefSequence|
                                                            (DELETE NIL (LIST XML-PARSER::|AttDef| XML-PARSER::|AttDefSequence|)))
                                                      'XML-PARSER::|AttDefSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttDefSequence| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttDefSequence/AttDefSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDefSequence/AttDefSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttDefSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttDefSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttDefSequence| RESULT))
                                              (XML-PARSER::|AttDefSequence.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttDefSequence|)
                                              (XML-PARSER::|AttDefSequence.2| INDEX)))))))
                               (XML-PARSER::|AttDefSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttDefSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttDefSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDefSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttDef|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttDef| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttDef| RESULT))
                                              (XML-PARSER::|AttDefSequence/AttDefSequence.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|AttDef|)
                                              (XML-PARSER::|AttDefSequence/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttDefSequence.2| XML-PARSER::|AttDefSequence/AttDefSequence.2.4|
                          XML-PARSER::|AttDefSequence/fail.3| XML-PARSER::|AttDefSequence/start.1|))
                        (XML-PARSER::|AttDefSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttDefSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttDefSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttDef| (INDEX &AUX (XML-PARSER::|AttType| NIL) (XML-PARSER::|DefaultDecl| NIL) (XML-PARSER::|QName| NIL))
  "{53} AttDef ::= S+ QName S+ AttType S+ DefaultDecl
(|AttType| |DefaultDecl| |QName|)"
  (DECLARE (SPECIAL XML-PARSER::|AttDef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttDef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttDef-INDEX| INDEX)
      (LET ((XML-PARSER::|AttDef-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|AttDef| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|AttDef-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|AttDef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttDef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttDef|)
                                 (RETURN-FROM XML-PARSER::|AttDef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttDef| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttDef.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttDef.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttDef/AttDef.2.6| INDEX))))))
                               (XML-PARSER::|AttDef.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttDef.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttDef/AttDef.2.8| INDEX))))))
                               (XML-PARSER::|AttDef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttDef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttDef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttDef|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|AttType|
                                                         XML-PARSER::|AttType|
                                                         'XML-PARSER::|DefaultDecl|
                                                         XML-PARSER::|DefaultDecl|
                                                         'XML-PARSER::|QName|
                                                         XML-PARSER::|QName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttDef-Constructor|
                                                    XML-PARSER::|AttType|
                                                    XML-PARSER::|DefaultDecl|
                                                    XML-PARSER::|QName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttDef|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|AttType|
                                                                          XML-PARSER::|DefaultDecl|
                                                                          XML-PARSER::|QName|)))
                                                      'XML-PARSER::|AttDef|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttDef| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttDef.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttDef.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttDef/AttDef.2.4| INDEX))))))
                               (XML-PARSER::|AttDef/AttDef.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef/AttDef.2.4|
                                   (LET ((XML-PARSER::*IN-NAME-TOKEN* T))
                                     (%ATN-EDGE-BLOCK
                                       (CAT XML-PARSER::|QName|)
                                       (COND ((XML-PARSER::|IS-QName| |item|)
                                              (SETF *ATN-TERM* 'XML-PARSER::|QName|)
                                              (SETF XML-PARSER::|QName|
                                                    (IF (EQ *ATN-REDUCE* T)
                                                        (ATN-REDUCE-ITEM #'XML-PARSER::|QName-Constructor| |item|)
                                                        (IF (EQ *ATN-REDUCE* 'CONS)
                                                            (LIST 'XML-PARSER::|QName| |item|)
                                                            'XML-PARSER::|QName|)))
                                              (XML-PARSER::|AttDef/AttDef.2.5| (1+ INDEX)))
                                             (T (SETF *ATN-TERM* 'XML-PARSER::|QName|) (XML-PARSER::|AttDef/fail.3| INDEX)))))))
                               (XML-PARSER::|AttDef/AttDef.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef/AttDef.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttDef.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttDef/fail.3| INDEX))))))
                               (XML-PARSER::|AttDef/AttDef.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef/AttDef.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|AttType|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|AttType| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|AttType| RESULT))
                                              (XML-PARSER::|AttDef/AttDef.2.7| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|AttType|) (XML-PARSER::|AttDef/fail.3| INDEX)))))))
                               (XML-PARSER::|AttDef/AttDef.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef/AttDef.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttDef.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttDef/fail.3| INDEX))))))
                               (XML-PARSER::|AttDef/AttDef.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef/AttDef.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DefaultDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DefaultDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DefaultDecl| RESULT))
                                              (XML-PARSER::|AttDef.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|DefaultDecl|)
                                              (XML-PARSER::|AttDef/fail.3| INDEX)))))))
                               (XML-PARSER::|AttDef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttDef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttDef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttDef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|AttDef.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|AttDef/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttDef.10| XML-PARSER::|AttDef.11| XML-PARSER::|AttDef.2|
                          XML-PARSER::|AttDef.9| XML-PARSER::|AttDef/AttDef.2.4| XML-PARSER::|AttDef/AttDef.2.5|
                          XML-PARSER::|AttDef/AttDef.2.6| XML-PARSER::|AttDef/AttDef.2.7| XML-PARSER::|AttDef/AttDef.2.8|
                          XML-PARSER::|AttDef/fail.3| XML-PARSER::|AttDef/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|AttDef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttDef| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttDef| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|AttType| (INDEX &AUX (XML-PARSER::|EnumeratedType| NIL) (XML-PARSER::|StringType| NIL)
                              (XML-PARSER::|TokenizedType| NIL))
  "{54} AttType ::= (StringType | TokenizedType | EnumeratedType)
(|EnumeratedType| |StringType| |TokenizedType|)"
  (DECLARE (SPECIAL XML-PARSER::|AttType-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|AttType-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|AttType-INDEX| INDEX)
      (LET ((XML-PARSER::|AttType-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|AttType| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|AttType-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|AttType|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|AttType|)
                                 (RETURN-FROM XML-PARSER::|AttType| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|AttType| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|AttType.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttType.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|AttType|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|AttType|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|AttType|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EnumeratedType|
                                                         XML-PARSER::|EnumeratedType|
                                                         'XML-PARSER::|StringType|
                                                         XML-PARSER::|StringType|
                                                         'XML-PARSER::|TokenizedType|
                                                         XML-PARSER::|TokenizedType|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|AttType-Constructor|
                                                    XML-PARSER::|EnumeratedType|
                                                    XML-PARSER::|StringType|
                                                    XML-PARSER::|TokenizedType|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|AttType|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|EnumeratedType|
                                                                          XML-PARSER::|StringType|
                                                                          XML-PARSER::|TokenizedType|)))
                                                      'XML-PARSER::|AttType|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|AttType| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|AttType/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|AttType/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|AttType/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|AttType/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (CAT XML-PARSER::|StringType|)
                                           (COND ((XML-PARSER::|IS-StringType| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|StringType|)
                                                  (SETF XML-PARSER::|StringType|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|StringType-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|StringType| |item|)
                                                                'XML-PARSER::|StringType|)))
                                                  (XML-PARSER::|AttType.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PARSER::|StringType|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (CAT XML-PARSER::|TokenizedType|)
                                           (COND ((XML-PARSER::|IS-TokenizedType| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|TokenizedType|)
                                                  (SETF XML-PARSER::|TokenizedType|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|TokenizedType-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|TokenizedType| |item|)
                                                                'XML-PARSER::|TokenizedType|)))
                                                  (XML-PARSER::|AttType.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM* 'XML-PARSER::|TokenizedType|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|EnumeratedType|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EnumeratedType| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|EnumeratedType| RESULT))
                                                    (XML-PARSER::|AttType.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|EnumeratedType|) NIL))))
                                         (XML-PARSER::|AttType/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|AttType.2| XML-PARSER::|AttType/fail.3| XML-PARSER::|AttType/start.1|))
                        (XML-PARSER::|AttType/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|AttType| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|AttType| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EnumeratedType| (INDEX &AUX (XML-PARSER::|Enumeration| NIL) (XML-PARSER::|NotationType| NIL))
  "{57} EnumeratedType ::= (NotationType | Enumeration)
(|Enumeration| |NotationType|)"
  (DECLARE (SPECIAL XML-PARSER::|EnumeratedType-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EnumeratedType-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EnumeratedType-INDEX| INDEX)
      (LET ((XML-PARSER::|EnumeratedType-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EnumeratedType| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|EnumeratedType-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EnumeratedType|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EnumeratedType|)
                                 (RETURN-FROM XML-PARSER::|EnumeratedType| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EnumeratedType| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EnumeratedType.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumeratedType.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EnumeratedType|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EnumeratedType|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EnumeratedType|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Enumeration|
                                                         XML-PARSER::|Enumeration|
                                                         'XML-PARSER::|NotationType|
                                                         XML-PARSER::|NotationType|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|EnumeratedType-Constructor|
                                                    XML-PARSER::|Enumeration|
                                                    XML-PARSER::|NotationType|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EnumeratedType|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Enumeration| XML-PARSER::|NotationType|)))
                                                      'XML-PARSER::|EnumeratedType|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|EnumeratedType| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EnumeratedType/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EnumeratedType/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EnumeratedType/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumeratedType/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|NotationType|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|NotationType| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|NotationType| RESULT))
                                                    (XML-PARSER::|EnumeratedType.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|NotationType|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|Enumeration|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Enumeration| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|Enumeration| RESULT))
                                                    (XML-PARSER::|EnumeratedType.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|Enumeration|) NIL))))
                                         (XML-PARSER::|EnumeratedType/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EnumeratedType.2| XML-PARSER::|EnumeratedType/fail.3|
                          XML-PARSER::|EnumeratedType/start.1|))
                        (XML-PARSER::|EnumeratedType/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EnumeratedType| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EnumeratedType| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|NotationType| (INDEX &AUX (XML-PARSER::|NotationTypeSequence| NIL))
  "{58} NotationType ::= NOTATION S+ '(' S* NotationTypeSequence S* ')'
(|NotationTypeSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|NotationType-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|NotationType-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|NotationType-INDEX| INDEX)
      (LET ((XML-PARSER::|NotationType-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|NotationType| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|NotationType-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|NotationType|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|NotationType|)
                                 (RETURN-FROM XML-PARSER::|NotationType| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|NotationType| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|NotationType.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType/NotationType.2.5| INDEX))))))
                               (XML-PARSER::|NotationType.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType/NotationType.2.7| INDEX))))))
                               (XML-PARSER::|NotationType.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType.12| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType/NotationType.2.9| INDEX))))))
                               (XML-PARSER::|NotationType.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|NotationType|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|NotationType|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|NotationType|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NotationTypeSequence| XML-PARSER::|NotationTypeSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|NotationType-Constructor|
                                                    XML-PARSER::|NotationTypeSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|NotationType|
                                                            (DELETE NIL (LIST XML-PARSER::|NotationTypeSequence|)))
                                                      'XML-PARSER::|NotationType|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|NotationType| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|NotationType/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|NotationType/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|NotationType/NotationType.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/NotationType.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NotationType/fail.3| INDEX))))))
                               (XML-PARSER::|NotationType/NotationType.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/NotationType.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PARSER::|NotationType/NotationType.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-PARSER::|NotationType/fail.3| INDEX))))))
                               (XML-PARSER::|NotationType/NotationType.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/NotationType.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType/NotationType.2.7| INDEX))))))
                               (XML-PARSER::|NotationType/NotationType.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/NotationType.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|NotationTypeSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|NotationTypeSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|NotationTypeSequence| RESULT))
                                              (XML-PARSER::|NotationType/NotationType.2.8| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|NotationTypeSequence|)
                                              (XML-PARSER::|NotationType/fail.3| INDEX)))))))
                               (XML-PARSER::|NotationType/NotationType.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/NotationType.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType.12| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationType/NotationType.2.9| INDEX))))))
                               (XML-PARSER::|NotationType/NotationType.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/NotationType.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-PARSER::|NotationType.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-PARSER::|NotationType/fail.3| INDEX))))))
                               (XML-PARSER::|NotationType/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationType/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-QUERY-DATA-MODEL:NOTATION)
                                     (COND ((XML-PARSER::|IS-NOTATIONToken| |item|)
                                            (SETF *ATN-TERM* 'XML-QUERY-DATA-MODEL:NOTATION)
                                            (XML-PARSER::|NotationType/NotationType.2.4| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-QUERY-DATA-MODEL:NOTATION)
                                            (XML-PARSER::|NotationType/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|NotationType.10| XML-PARSER::|NotationType.11|
                          XML-PARSER::|NotationType.12| XML-PARSER::|NotationType.2| XML-PARSER::|NotationType/fail.3|
                          XML-PARSER::|NotationType/NotationType.2.4| XML-PARSER::|NotationType/NotationType.2.5|
                          XML-PARSER::|NotationType/NotationType.2.6| XML-PARSER::|NotationType/NotationType.2.7|
                          XML-PARSER::|NotationType/NotationType.2.8| XML-PARSER::|NotationType/NotationType.2.9|
                          XML-PARSER::|NotationType/start.1|))
                        (XML-PARSER::|NotationType/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|NotationType| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|NotationType| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|NotationTypeSequence| (INDEX &AUX (XML-PARSER::|NCName| NIL) (XML-PARSER::|NotationTypeSequence| NIL))
  "NotationTypeSequence ::= NCName (S* '|' S* NotationTypeSequence)?
(|NCName| |NotationTypeSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|NotationTypeSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|NotationTypeSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|NotationTypeSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|NotationTypeSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|NotationTypeSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|NotationTypeSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|NotationTypeSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|NotationTypeSequence|)
                                 (RETURN-FROM XML-PARSER::|NotationTypeSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|NotationTypeSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|NotationTypeSequence.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.8| INDEX))))))
                               (XML-PARSER::|NotationTypeSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|NotationTypeSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|NotationTypeSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|NotationTypeSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NCName|
                                                         XML-PARSER::|NCName|
                                                         'XML-PARSER::|NotationTypeSequence|
                                                         XML-PARSER::|NotationTypeSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|NotationTypeSequence-Constructor|
                                                    XML-PARSER::|NCName|
                                                    XML-PARSER::|NotationTypeSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|NotationTypeSequence|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|NCName|
                                                                          XML-PARSER::|NotationTypeSequence|)))
                                                      'XML-PARSER::|NotationTypeSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT*
                                                   " -> ~a: ~s"
                                                   'XML-PARSER::|NotationTypeSequence|
                                                   RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|NotationTypeSequence.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence.9| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.6| INDEX))))))
                               (XML-PARSER::|NotationTypeSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|NotationTypeSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.5|)
                                     (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.5| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|NotationTypeSequence.2|)
                                     (XML-PARSER::|NotationTypeSequence.2| INDEX))))
                               (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence.9| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.6| INDEX))))))
                               (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\|)
                                     (COND ((EQ |item| '|xml|:\|)
                                            (SETF *ATN-TERM* '|xml|:\|)
                                            (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\|) NIL)))))
                               (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.8| INDEX))))))
                               (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|NotationTypeSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|NotationTypeSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|NotationTypeSequence| RESULT))
                                              (XML-PARSER::|NotationTypeSequence.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|NotationTypeSequence|) NIL))))))
                               (XML-PARSER::|NotationTypeSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationTypeSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.4| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::|NCName|)
                                            (XML-PARSER::|NotationTypeSequence/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|NotationTypeSequence.10| XML-PARSER::|NotationTypeSequence.2|
                          XML-PARSER::|NotationTypeSequence.9| XML-PARSER::|NotationTypeSequence/fail.3|
                          XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.4|
                          XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.5|
                          XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.6|
                          XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.7|
                          XML-PARSER::|NotationTypeSequence/NotationTypeSequence.2.8| XML-PARSER::|NotationTypeSequence/start.1|))
                        (XML-PARSER::|NotationTypeSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|NotationTypeSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|NotationTypeSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Enumeration| (INDEX &AUX (XML-PARSER::|EnumerationSequence| NIL))
  "{59} Enumeration ::= '(' EnumerationSequence S* ')'
(|EnumerationSequence|)"
  (DECLARE (SPECIAL XML-PARSER::|Enumeration-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Enumeration-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Enumeration-INDEX| INDEX)
      (LET ((XML-PARSER::|Enumeration-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Enumeration| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Enumeration-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Enumeration|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Enumeration|)
                                 (RETURN-FROM XML-PARSER::|Enumeration| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Enumeration| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Enumeration.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Enumeration.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Enumeration|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Enumeration|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Enumeration|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EnumerationSequence| XML-PARSER::|EnumerationSequence|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Enumeration-Constructor|
                                                    XML-PARSER::|EnumerationSequence|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Enumeration|
                                                            (DELETE NIL (LIST XML-PARSER::|EnumerationSequence|)))
                                                      'XML-PARSER::|Enumeration|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Enumeration| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Enumeration.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Enumeration.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Enumeration.7| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|Enumeration/Enumeration.2.6| INDEX))))))
                               (XML-PARSER::|Enumeration/Enumeration.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Enumeration/Enumeration.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|EnumerationSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EnumerationSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|EnumerationSequence| RESULT))
                                              (XML-PARSER::|Enumeration/Enumeration.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|EnumerationSequence|)
                                              (XML-PARSER::|Enumeration/fail.3| INDEX)))))))
                               (XML-PARSER::|Enumeration/Enumeration.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Enumeration/Enumeration.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|Enumeration.7| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|Enumeration/Enumeration.2.6| INDEX))))))
                               (XML-PARSER::|Enumeration/Enumeration.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Enumeration/Enumeration.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\))
                                     (COND ((EQ |item| '|xml|:\))
                                            (SETF *ATN-TERM* '|xml|:\))
                                            (XML-PARSER::|Enumeration.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\)) (XML-PARSER::|Enumeration/fail.3| INDEX))))))
                               (XML-PARSER::|Enumeration/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Enumeration/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Enumeration/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Enumeration/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\()
                                     (COND ((EQ |item| '|xml|:\()
                                            (SETF *ATN-TERM* '|xml|:\()
                                            (XML-PARSER::|Enumeration/Enumeration.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\() (XML-PARSER::|Enumeration/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Enumeration.2| XML-PARSER::|Enumeration.7|
                          XML-PARSER::|Enumeration/Enumeration.2.4| XML-PARSER::|Enumeration/Enumeration.2.5|
                          XML-PARSER::|Enumeration/Enumeration.2.6| XML-PARSER::|Enumeration/fail.3|
                          XML-PARSER::|Enumeration/start.1|))
                        (XML-PARSER::|Enumeration/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Enumeration| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Enumeration| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EnumerationSequence| (INDEX &AUX (XML-PARSER::|EnumerationSequence| NIL) (XML-PARSER::|Nmtoken| NIL))
  "EnumerationSequence ::= S* Nmtoken (S* '|' EnumerationSequence)?
(|EnumerationSequence| |Nmtoken|)"
  (DECLARE (SPECIAL XML-PARSER::|EnumerationSequence-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EnumerationSequence-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EnumerationSequence-INDEX| INDEX)
      (LET ((XML-PARSER::|EnumerationSequence-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EnumerationSequence| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|EnumerationSequence-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EnumerationSequence|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EnumerationSequence|)
                                 (RETURN-FROM XML-PARSER::|EnumerationSequence| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EnumerationSequence| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EnumerationSequence.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.8| INDEX))))))
                               (XML-PARSER::|EnumerationSequence.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EnumerationSequence|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EnumerationSequence|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EnumerationSequence|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EnumerationSequence|
                                                         XML-PARSER::|EnumerationSequence|
                                                         'XML-PARSER::|Nmtoken|
                                                         XML-PARSER::|Nmtoken|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|EnumerationSequence-Constructor|
                                                    XML-PARSER::|EnumerationSequence|
                                                    XML-PARSER::|Nmtoken|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EnumerationSequence|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|EnumerationSequence|
                                                                          XML-PARSER::|Nmtoken|)))
                                                      'XML-PARSER::|EnumerationSequence|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT*
                                                   " -> ~a: ~s"
                                                   'XML-PARSER::|EnumerationSequence|
                                                   RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EnumerationSequence.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence.6| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.4| INDEX))))))
                               (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence/EnumerationSequence.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (CAT XML-PARSER::|Nmtoken|)
                                     (COND ((XML-PARSER::|IS-Nmtoken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|Nmtoken|)
                                            (SETF XML-PARSER::|Nmtoken|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|Nmtoken-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|Nmtoken| |item|)
                                                          'XML-PARSER::|Nmtoken|)))
                                            (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM* 'XML-PARSER::|Nmtoken|)
                                            (XML-PARSER::|EnumerationSequence/fail.3| INDEX))))))
                               (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence/EnumerationSequence.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|EnumerationSequence/EnumerationSequence.2.7|)
                                     (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.7| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|EnumerationSequence.2|)
                                     (XML-PARSER::|EnumerationSequence.2| INDEX))))
                               (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence/EnumerationSequence.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.8| INDEX))))))
                               (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence/EnumerationSequence.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\|)
                                     (COND ((EQ |item| '|xml|:\|)
                                            (SETF *ATN-TERM* '|xml|:\|)
                                            (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\|) NIL)))))
                               (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence/EnumerationSequence.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|EnumerationSequence|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EnumerationSequence| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|EnumerationSequence| RESULT))
                                              (XML-PARSER::|EnumerationSequence.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|EnumerationSequence|) NIL))))))
                               (XML-PARSER::|EnumerationSequence/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EnumerationSequence/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EnumerationSequence/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EnumerationSequence/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence.6| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|EnumerationSequence/EnumerationSequence.2.4| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EnumerationSequence.10| XML-PARSER::|EnumerationSequence.2|
                          XML-PARSER::|EnumerationSequence.6| XML-PARSER::|EnumerationSequence/EnumerationSequence.2.4|
                          XML-PARSER::|EnumerationSequence/EnumerationSequence.2.5|
                          XML-PARSER::|EnumerationSequence/EnumerationSequence.2.7|
                          XML-PARSER::|EnumerationSequence/EnumerationSequence.2.8|
                          XML-PARSER::|EnumerationSequence/EnumerationSequence.2.9| XML-PARSER::|EnumerationSequence/fail.3|
                          XML-PARSER::|EnumerationSequence/start.1|))
                        (XML-PARSER::|EnumerationSequence/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EnumerationSequence| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EnumerationSequence| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|DefaultDecl| (INDEX &AUX (XML-PARSER::|DefaultAttValue| NIL) (XML-PARSER::FIXED NIL) (XML-PARSER::IMPLIED NIL)
                                  (XML-PARSER::REQUIRED NIL))
  "{60} DefaultDecl ::= (REQUIRED | IMPLIED | ((FIXED S)? DefaultAttValue))
(|DefaultAttValue| FIXED IMPLIED REQUIRED)"
  (DECLARE (SPECIAL XML-PARSER::|DefaultDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|DefaultDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|DefaultDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|DefaultDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|DefaultDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|DefaultDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|DefaultDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|DefaultDecl|)
                                 (RETURN-FROM XML-PARSER::|DefaultDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|DefaultDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|DefaultDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|DefaultDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|DefaultDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|DefaultDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|DefaultAttValue|
                                                         XML-PARSER::|DefaultAttValue|
                                                         'XML-PARSER::FIXED
                                                         XML-PARSER::FIXED
                                                         'XML-PARSER::IMPLIED
                                                         XML-PARSER::IMPLIED
                                                         'XML-PARSER::REQUIRED
                                                         XML-PARSER::REQUIRED))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|DefaultDecl-Constructor|
                                                    XML-PARSER::|DefaultAttValue|
                                                    XML-PARSER::FIXED
                                                    XML-PARSER::IMPLIED
                                                    XML-PARSER::REQUIRED)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|DefaultDecl|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|DefaultAttValue|
                                                                          XML-PARSER::FIXED
                                                                          XML-PARSER::IMPLIED
                                                                          XML-PARSER::REQUIRED)))
                                                      'XML-PARSER::|DefaultDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|DefaultDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|DefaultDecl/DefaultDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultDecl/DefaultDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|)
                                     (XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6| INDEX))
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|DefaultDecl/DefaultDecl.2.5|)
                                     (XML-PARSER::|DefaultDecl/DefaultDecl.2.5| INDEX))))
                               (XML-PARSER::|DefaultDecl/DefaultDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultDecl/DefaultDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|DefaultAttValue|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|DefaultAttValue| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|DefaultAttValue| RESULT))
                                              (XML-PARSER::|DefaultDecl.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|DefaultAttValue|) NIL))))))
                               (XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::FIXED)
                                     (COND ((XML-PARSER::|IS-FIXEDToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::FIXED)
                                            (SETF XML-PARSER::FIXED
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|FIXED-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::FIXED |item|)
                                                          'XML-PARSER::FIXED)))
                                            (XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::FIXED) NIL)))))
                               (XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|DefaultDecl/DefaultDecl.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|DefaultDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|DefaultDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|DefaultDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|DefaultDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::REQUIRED)
                                           (COND ((XML-PARSER::|IS-REQUIREDToken| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::REQUIRED)
                                                  (SETF XML-PARSER::REQUIRED
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|REQUIRED-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::REQUIRED |item|)
                                                                'XML-PARSER::REQUIRED)))
                                                  (XML-PARSER::|DefaultDecl.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::REQUIRED) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::IMPLIED)
                                           (COND ((XML-PARSER::|IS-IMPLIEDToken| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::IMPLIED)
                                                  (SETF XML-PARSER::IMPLIED
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|IMPLIED-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::IMPLIED |item|)
                                                                'XML-PARSER::IMPLIED)))
                                                  (XML-PARSER::|DefaultDecl.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::IMPLIED) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|DefaultDecl/DefaultDecl.2.4|)
                                           (XML-PARSER::|DefaultDecl/DefaultDecl.2.4| INDEX))
                                         (XML-PARSER::|DefaultDecl/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|DefaultDecl.2| XML-PARSER::|DefaultDecl/DefaultDecl.2.4|
                          XML-PARSER::|DefaultDecl/DefaultDecl.2.5| XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|
                          XML-PARSER::|DefaultDecl/DefaultDecl/DefaultDecl.2.5.7| XML-PARSER::|DefaultDecl/fail.3|
                          XML-PARSER::|DefaultDecl/start.1|))
                        (XML-PARSER::|DefaultDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|DefaultDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|DefaultDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ConditionalSect| (INDEX &AUX (XML-PARSER::|IgnoreSect| NIL) (XML-PARSER::|IncludeSect| NIL)
                                      (XML-PARSER::|NamedConditionalSect| NIL))
  "{61} ConditionalSect ::= (IncludeSect | IgnoreSect | NamedConditionalSect)
(|IgnoreSect| |IncludeSect| |NamedConditionalSect|)"
  (DECLARE (SPECIAL XML-PARSER::|ConditionalSect-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ConditionalSect-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ConditionalSect-INDEX| INDEX)
      (LET ((XML-PARSER::|ConditionalSect-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ConditionalSect| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|ConditionalSect-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ConditionalSect|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ConditionalSect|)
                                 (RETURN-FROM XML-PARSER::|ConditionalSect| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ConditionalSect| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ConditionalSect.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ConditionalSect.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ConditionalSect|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ConditionalSect|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ConditionalSect|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|IgnoreSect|
                                                         XML-PARSER::|IgnoreSect|
                                                         'XML-PARSER::|IncludeSect|
                                                         XML-PARSER::|IncludeSect|
                                                         'XML-PARSER::|NamedConditionalSect|
                                                         XML-PARSER::|NamedConditionalSect|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ConditionalSect-Constructor|
                                                    XML-PARSER::|IgnoreSect|
                                                    XML-PARSER::|IncludeSect|
                                                    XML-PARSER::|NamedConditionalSect|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ConditionalSect|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|IgnoreSect|
                                                                          XML-PARSER::|IncludeSect|
                                                                          XML-PARSER::|NamedConditionalSect|)))
                                                      'XML-PARSER::|ConditionalSect|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ConditionalSect| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ConditionalSect/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ConditionalSect/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ConditionalSect/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ConditionalSect/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|IncludeSect|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IncludeSect| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|IncludeSect| RESULT))
                                                    (XML-PARSER::|ConditionalSect.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|IncludeSect|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|IgnoreSect|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IgnoreSect| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|IgnoreSect| RESULT))
                                                    (XML-PARSER::|ConditionalSect.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|IgnoreSect|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|NamedConditionalSect|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|NamedConditionalSect| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|NamedConditionalSect| RESULT))
                                                    (XML-PARSER::|ConditionalSect.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|NamedConditionalSect|) NIL))))
                                         (XML-PARSER::|ConditionalSect/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ConditionalSect.2| XML-PARSER::|ConditionalSect/fail.3|
                          XML-PARSER::|ConditionalSect/start.1|))
                        (XML-PARSER::|ConditionalSect/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ConditionalSect| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ConditionalSect| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|IncludeSect| (INDEX &AUX (XML-PARSER::|ExtSubsetDecl| NIL))
  "{62} IncludeSect ::= '<![' S* INCLUDE S* '[' ExtSubsetDecl* ']]>'
(|ExtSubsetDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|IncludeSect-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|IncludeSect-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|IncludeSect-INDEX| INDEX)
      (LET ((XML-PARSER::|IncludeSect-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|IncludeSect| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|IncludeSect-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|IncludeSect|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|IncludeSect|)
                                 (RETURN-FROM XML-PARSER::|IncludeSect| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|IncludeSect| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|IncludeSect.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.5| INDEX))))))
                               (XML-PARSER::|IncludeSect.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.7| INDEX))))))
                               (XML-PARSER::|IncludeSect.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect.12|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExtSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExtSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|ExtSubsetDecl| (CONS RESULT XML-PARSER::|ExtSubsetDecl|)))
                                              (XML-PARSER::|IncludeSect.12| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ExtSubsetDecl|)
                                              (XML-PARSER::|IncludeSect/IncludeSect.2.9| INDEX)))))))
                               (XML-PARSER::|IncludeSect.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|IncludeSect|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|IncludeSect|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|IncludeSect|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ExtSubsetDecl| XML-PARSER::|ExtSubsetDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|IncludeSect-Constructor|
                                                    XML-PARSER::|ExtSubsetDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|IncludeSect|
                                                            (DELETE NIL (LIST XML-PARSER::|ExtSubsetDecl|)))
                                                      'XML-PARSER::|IncludeSect|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|IncludeSect| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|IncludeSect/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|IncludeSect/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|IncludeSect/IncludeSect.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/IncludeSect.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.5| INDEX))))))
                               (XML-PARSER::|IncludeSect/IncludeSect.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/IncludeSect.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::INCLUDE)
                                     (COND ((XML-PARSER::|IS-INCLUDEToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::INCLUDE)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::INCLUDE) (XML-PARSER::|IncludeSect/fail.3| INDEX))))))
                               (XML-PARSER::|IncludeSect/IncludeSect.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/IncludeSect.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.7| INDEX))))))
                               (XML-PARSER::|IncludeSect/IncludeSect.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/IncludeSect.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:[)
                                     (COND ((EQ |item| '|xml|:[)
                                            (SETF *ATN-TERM* '|xml|:[)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:[) (XML-PARSER::|IncludeSect/fail.3| INDEX))))))
                               (XML-PARSER::|IncludeSect/IncludeSect.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/IncludeSect.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExtSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExtSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|ExtSubsetDecl| (CONS RESULT XML-PARSER::|ExtSubsetDecl|)))
                                              (XML-PARSER::|IncludeSect.12| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ExtSubsetDecl|)
                                              (XML-PARSER::|IncludeSect/IncludeSect.2.9| INDEX)))))))
                               (XML-PARSER::|IncludeSect/IncludeSect.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/IncludeSect.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:]]>)
                                     (COND ((EQ |item| '|xml|:]]>)
                                            (SETF *ATN-TERM* '|xml|:]]>)
                                            (XML-PARSER::|IncludeSect.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]]>) (XML-PARSER::|IncludeSect/fail.3| INDEX))))))
                               (XML-PARSER::|IncludeSect/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IncludeSect/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<![)
                                     (COND ((EQ |item| '|xml|:<![)
                                            (SETF *ATN-TERM* '|xml|:<![)
                                            (XML-PARSER::|IncludeSect/IncludeSect.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<![) (XML-PARSER::|IncludeSect/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|IncludeSect.10| XML-PARSER::|IncludeSect.11|
                          XML-PARSER::|IncludeSect.12| XML-PARSER::|IncludeSect.2| XML-PARSER::|IncludeSect/fail.3|
                          XML-PARSER::|IncludeSect/IncludeSect.2.4| XML-PARSER::|IncludeSect/IncludeSect.2.5|
                          XML-PARSER::|IncludeSect/IncludeSect.2.6| XML-PARSER::|IncludeSect/IncludeSect.2.7|
                          XML-PARSER::|IncludeSect/IncludeSect.2.8| XML-PARSER::|IncludeSect/IncludeSect.2.9|
                          XML-PARSER::|IncludeSect/start.1|))
                        (XML-PARSER::|IncludeSect/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|IncludeSect| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|IncludeSect| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|IgnoreSect| (INDEX &AUX (XML-PARSER::|IgnoreSectContents| NIL))
  "{63} IgnoreSect ::= '<![' S* IGNORE S* '[' IgnoreSectContents? ']]>'
(|IgnoreSectContents|)"
  (DECLARE (SPECIAL XML-PARSER::|IgnoreSect-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|IgnoreSect-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|IgnoreSect-INDEX| INDEX)
      (LET ((XML-PARSER::|IgnoreSect-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|IgnoreSect| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|IgnoreSect-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|IgnoreSect|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|IgnoreSect|)
                                 (RETURN-FROM XML-PARSER::|IgnoreSect| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|IgnoreSect| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|IgnoreSect.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.5| INDEX))))))
                               (XML-PARSER::|IgnoreSect.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.7| INDEX))))))
                               (XML-PARSER::|IgnoreSect.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|IgnoreSect|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|IgnoreSect|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|IgnoreSect|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|IgnoreSectContents| XML-PARSER::|IgnoreSectContents|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|IgnoreSect-Constructor|
                                                    XML-PARSER::|IgnoreSectContents|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|IgnoreSect|
                                                            (DELETE NIL (LIST XML-PARSER::|IgnoreSectContents|)))
                                                      'XML-PARSER::|IgnoreSect|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|IgnoreSect| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|IgnoreSect/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|IgnoreSect/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|IgnoreSect/IgnoreSect.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/IgnoreSect.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.5| INDEX))))))
                               (XML-PARSER::|IgnoreSect/IgnoreSect.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/IgnoreSect.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST IGNORE)
                                     (COND ((XML-PARSER::|IS-IGNOREToken| |item|)
                                            (SETF *ATN-TERM* 'IGNORE)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'IGNORE) (XML-PARSER::|IgnoreSect/fail.3| INDEX))))))
                               (XML-PARSER::|IgnoreSect/IgnoreSect.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/IgnoreSect.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.7| INDEX))))))
                               (XML-PARSER::|IgnoreSect/IgnoreSect.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/IgnoreSect.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:[)
                                     (COND ((EQ |item| '|xml|:[)
                                            (SETF *ATN-TERM* '|xml|:[)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:[) (XML-PARSER::|IgnoreSect/fail.3| INDEX))))))
                               (XML-PARSER::|IgnoreSect/IgnoreSect.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/IgnoreSect.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|IgnoreSectContents|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IgnoreSectContents| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|IgnoreSectContents| RESULT))
                                              (XML-PARSER::|IgnoreSect/IgnoreSect.2.9| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|IgnoreSectContents|)
                                              (XML-PARSER::|IgnoreSect/IgnoreSect.2.9| INDEX)))))))
                               (XML-PARSER::|IgnoreSect/IgnoreSect.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/IgnoreSect.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:]]>)
                                     (COND ((EQ |item| '|xml|:]]>)
                                            (SETF *ATN-TERM* '|xml|:]]>)
                                            (XML-PARSER::|IgnoreSect.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]]>) (XML-PARSER::|IgnoreSect/fail.3| INDEX))))))
                               (XML-PARSER::|IgnoreSect/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSect/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<![)
                                     (COND ((EQ |item| '|xml|:<![)
                                            (SETF *ATN-TERM* '|xml|:<![)
                                            (XML-PARSER::|IgnoreSect/IgnoreSect.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<![) (XML-PARSER::|IgnoreSect/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|IgnoreSect.10| XML-PARSER::|IgnoreSect.11| XML-PARSER::|IgnoreSect.2|
                          XML-PARSER::|IgnoreSect/fail.3| XML-PARSER::|IgnoreSect/IgnoreSect.2.4|
                          XML-PARSER::|IgnoreSect/IgnoreSect.2.5| XML-PARSER::|IgnoreSect/IgnoreSect.2.6|
                          XML-PARSER::|IgnoreSect/IgnoreSect.2.7| XML-PARSER::|IgnoreSect/IgnoreSect.2.8|
                          XML-PARSER::|IgnoreSect/IgnoreSect.2.9| XML-PARSER::|IgnoreSect/start.1|))
                        (XML-PARSER::|IgnoreSect/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|IgnoreSect| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|IgnoreSect| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|IgnoreSectContents| (INDEX &AUX (XML-PARSER::|Ignore| NIL) (XML-PARSER::|IgnoreSectContents| NIL))
  "{64} IgnoreSectContents ::= Ignore IgnoreSectContents?
(|Ignore| |IgnoreSectContents|)"
  (DECLARE (SPECIAL XML-PARSER::|IgnoreSectContents-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|IgnoreSectContents-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|IgnoreSectContents-INDEX| INDEX)
      (LET ((XML-PARSER::|IgnoreSectContents-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|IgnoreSectContents| *ATN-STACK))
            (*ATN-REDUCE* NIL)
            (XML-UTILS:*PARSETABLE* XML-PARSER::|IgnoreSectContents-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|IgnoreSectContents-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|IgnoreSectContents|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|IgnoreSectContents|)
                                 (RETURN-FROM XML-PARSER::|IgnoreSectContents| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|IgnoreSectContents| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|IgnoreSectContents.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSectContents.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|IgnoreSectContents|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|IgnoreSectContents|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|IgnoreSectContents|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Ignore|
                                                         XML-PARSER::|Ignore|
                                                         'XML-PARSER::|IgnoreSectContents|
                                                         XML-PARSER::|IgnoreSectContents|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|IgnoreSectContents-Constructor|
                                                    XML-PARSER::|Ignore|
                                                    XML-PARSER::|IgnoreSectContents|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|IgnoreSectContents|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|Ignore| XML-PARSER::|IgnoreSectContents|)))
                                                      'XML-PARSER::|IgnoreSectContents|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|IgnoreSectContents| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|IgnoreSectContents/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|IgnoreSectContents/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|IgnoreSectContents/IgnoreSectContents.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSectContents/IgnoreSectContents.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|IgnoreSectContents|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IgnoreSectContents| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|IgnoreSectContents| RESULT))
                                              (XML-PARSER::|IgnoreSectContents.2| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|IgnoreSectContents|)
                                              (XML-PARSER::|IgnoreSectContents.2| INDEX)))))))
                               (XML-PARSER::|IgnoreSectContents/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|IgnoreSectContents/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Ignore|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Ignore| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Ignore| RESULT))
                                              (XML-PARSER::|IgnoreSectContents/IgnoreSectContents.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Ignore|)
                                              (XML-PARSER::|IgnoreSectContents/fail.3| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|IgnoreSectContents.2| XML-PARSER::|IgnoreSectContents/fail.3|
                          XML-PARSER::|IgnoreSectContents/IgnoreSectContents.2.4| XML-PARSER::|IgnoreSectContents/start.1|))
                        (XML-PARSER::|IgnoreSectContents/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|IgnoreSectContents| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|IgnoreSectContents| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Ignore| (INDEX &AUX (XML-PARSER::|IgnoreCData| NIL) (XML-PARSER::|IgnoreSectContents| NIL))
  "{65} Ignore ::= (IgnoreCData | ('<![' IgnoreSectContents? ']]>'))
(|IgnoreCData| |IgnoreSectContents|)"
  (DECLARE (SPECIAL XML-PARSER::|Ignore-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Ignore-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Ignore-INDEX| INDEX)
      (LET ((XML-PARSER::|Ignore-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|Ignore| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Ignore-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Ignore|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Ignore|)
                                 (RETURN-FROM XML-PARSER::|Ignore| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Ignore| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Ignore.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Ignore.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Ignore|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Ignore|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Ignore|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|IgnoreCData|
                                                         XML-PARSER::|IgnoreCData|
                                                         'XML-PARSER::|IgnoreSectContents|
                                                         XML-PARSER::|IgnoreSectContents|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Ignore-Constructor|
                                                    XML-PARSER::|IgnoreCData|
                                                    XML-PARSER::|IgnoreSectContents|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Ignore|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|IgnoreCData|
                                                                          XML-PARSER::|IgnoreSectContents|)))
                                                      'XML-PARSER::|Ignore|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Ignore| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Ignore/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Ignore/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Ignore/Ignore.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Ignore/Ignore.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<![)
                                     (COND ((EQ |item| '|xml|:<![)
                                            (SETF *ATN-TERM* '|xml|:<![)
                                            (XML-PARSER::|Ignore/Ignore.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<![) NIL)))))
                               (XML-PARSER::|Ignore/Ignore.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Ignore/Ignore.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|IgnoreSectContents|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|IgnoreSectContents| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|IgnoreSectContents| RESULT))
                                              (XML-PARSER::|Ignore/Ignore.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|IgnoreSectContents|)
                                              (XML-PARSER::|Ignore/Ignore.2.6| INDEX)))))))
                               (XML-PARSER::|Ignore/Ignore.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Ignore/Ignore.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:]]>)
                                     (COND ((EQ |item| '|xml|:]]>)
                                            (SETF *ATN-TERM* '|xml|:]]>)
                                            (XML-PARSER::|Ignore.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]]>) NIL)))))
                               (XML-PARSER::|Ignore/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Ignore/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (TEST XML-PARSER::|IgnoreCData|)
                                           (COND ((XML-PARSER::|IS-IgnoreCData| |item|)
                                                  (SETF *ATN-TERM* 'XML-PARSER::|IgnoreCData|)
                                                  (SETF XML-PARSER::|IgnoreCData|
                                                        (IF (EQ *ATN-REDUCE* T)
                                                            (ATN-REDUCE-ITEM #'XML-PARSER::|IgnoreCData-Constructor| |item|)
                                                            (IF (EQ *ATN-REDUCE* 'CONS)
                                                                (LIST 'XML-PARSER::|IgnoreCData| |item|)
                                                                'XML-PARSER::|IgnoreCData|)))
                                                  (XML-PARSER::|Ignore.2| (1+ INDEX)))
                                                 (T (SETF *ATN-TERM?* 'XML-PARSER::|IgnoreCData|) NIL)))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|Ignore/Ignore.2.4|)
                                           (XML-PARSER::|Ignore/Ignore.2.4| INDEX))
                                         (XML-PARSER::|Ignore/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Ignore.2| XML-PARSER::|Ignore/fail.3| XML-PARSER::|Ignore/Ignore.2.4|
                          XML-PARSER::|Ignore/Ignore.2.5| XML-PARSER::|Ignore/Ignore.2.6| XML-PARSER::|Ignore/start.1|))
                        (XML-PARSER::|Ignore/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Ignore| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Ignore| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|NamedConditionalSect| (INDEX &AUX (XML-PARSER::|ExtSubsetDecl| NIL) (XML-PARSER::|PEReference| NIL))
  "NamedConditionalSect ::= '<![' S* PEReference S* '[' ExtSubsetDecl* ']]>'
(|ExtSubsetDecl| |PEReference|)"
  (DECLARE (SPECIAL XML-PARSER::|NamedConditionalSect-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|NamedConditionalSect-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|NamedConditionalSect-INDEX| INDEX)
      (LET ((XML-PARSER::|NamedConditionalSect-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|NamedConditionalSect| *ATN-STACK))
            (*ATN-REDUCE* NIL))
        (DECLARE (SPECIAL XML-PARSER::|NamedConditionalSect-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|NamedConditionalSect|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|NamedConditionalSect|)
                                 (RETURN-FROM XML-PARSER::|NamedConditionalSect| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|NamedConditionalSect| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|NamedConditionalSect.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.5| INDEX))))))
                               (XML-PARSER::|NamedConditionalSect.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.7| INDEX))))))
                               (XML-PARSER::|NamedConditionalSect.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect.12|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExtSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExtSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|ExtSubsetDecl| (CONS RESULT XML-PARSER::|ExtSubsetDecl|)))
                                              (XML-PARSER::|NamedConditionalSect.12| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ExtSubsetDecl|)
                                              (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.9| INDEX)))))))
                               (XML-PARSER::|NamedConditionalSect.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|NamedConditionalSect|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|NamedConditionalSect|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|NamedConditionalSect|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|ExtSubsetDecl|
                                                         XML-PARSER::|ExtSubsetDecl|
                                                         'XML-PARSER::|PEReference|
                                                         XML-PARSER::|PEReference|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|NamedConditionalSect-Constructor|
                                                    XML-PARSER::|ExtSubsetDecl|
                                                    XML-PARSER::|PEReference|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|NamedConditionalSect|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|ExtSubsetDecl| XML-PARSER::|PEReference|)))
                                                      'XML-PARSER::|NamedConditionalSect|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT*
                                                   " -> ~a: ~s"
                                                   'XML-PARSER::|NamedConditionalSect|
                                                   RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|NamedConditionalSect/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|NamedConditionalSect/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.5| INDEX))))))
                               (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|PEReference|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PEReference| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|PEReference| RESULT))
                                              (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|PEReference|)
                                              (XML-PARSER::|NamedConditionalSect/fail.3| INDEX)))))))
                               (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.7| INDEX))))))
                               (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:[)
                                     (COND ((EQ |item| '|xml|:[)
                                            (SETF *ATN-TERM* '|xml|:[)
                                            (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:[) (XML-PARSER::|NamedConditionalSect/fail.3| INDEX))))))
                               (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExtSubsetDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExtSubsetDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT
                                                (SETF XML-PARSER::|ExtSubsetDecl| (CONS RESULT XML-PARSER::|ExtSubsetDecl|)))
                                              (XML-PARSER::|NamedConditionalSect.12| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|ExtSubsetDecl|)
                                              (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.9| INDEX)))))))
                               (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:]]>)
                                     (COND ((EQ |item| '|xml|:]]>)
                                            (SETF *ATN-TERM* '|xml|:]]>)
                                            (XML-PARSER::|NamedConditionalSect.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:]]>) (XML-PARSER::|NamedConditionalSect/fail.3| INDEX))))))
                               (XML-PARSER::|NamedConditionalSect/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NamedConditionalSect/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<![)
                                     (COND ((EQ |item| '|xml|:<![)
                                            (SETF *ATN-TERM* '|xml|:<![)
                                            (XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<![) (XML-PARSER::|NamedConditionalSect/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|NamedConditionalSect.10| XML-PARSER::|NamedConditionalSect.11|
                          XML-PARSER::|NamedConditionalSect.12| XML-PARSER::|NamedConditionalSect.2|
                          XML-PARSER::|NamedConditionalSect/fail.3| XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.4|
                          XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.5|
                          XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.6|
                          XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.7|
                          XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.8|
                          XML-PARSER::|NamedConditionalSect/NamedConditionalSect.2.9| XML-PARSER::|NamedConditionalSect/start.1|))
                        (XML-PARSER::|NamedConditionalSect/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|NamedConditionalSect| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|NamedConditionalSect| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|CharRef| (INDEX &AUX (XML-PARSER::|HexNumber| NIL) (XML-PARSER::|Number| NIL))
  "{66} CharRef ::= (('&#' Number ';') | ('&#x' HexNumber ';'))
(|HexNumber| |Number|)"
  (DECLARE (SPECIAL XML-PARSER::|CharRef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|CharRef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|CharRef-INDEX| INDEX)
      (LET ((XML-PARSER::|CharRef-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|CharRef| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|CharRef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|CharRef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|CharRef|)
                                 (RETURN-FROM XML-PARSER::|CharRef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|CharRef| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|CharRef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|CharRef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|CharRef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|CharRef|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|HexNumber|
                                                         XML-PARSER::|HexNumber|
                                                         'XML-PARSER::|Number|
                                                         XML-PARSER::|Number|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|CharRef-Constructor|
                                                    XML-PARSER::|HexNumber|
                                                    XML-PARSER::|Number|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|CharRef|
                                                            (DELETE NIL (LIST XML-PARSER::|HexNumber| XML-PARSER::|Number|)))
                                                      'XML-PARSER::|CharRef|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|CharRef| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|CharRef/CharRef.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/CharRef.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:&#)
                                     (COND ((EQ |item| '|xml|:&#)
                                            (SETF *ATN-TERM* '|xml|:&#)
                                            (XML-PARSER::|CharRef/CharRef.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:&#) NIL)))))
                               (XML-PARSER::|CharRef/CharRef.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/CharRef.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|Number|)
                                     (COND ((XML-PARSER::|IS-Number| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|Number|)
                                            (SETF XML-PARSER::|Number|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|Number-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|Number| |item|)
                                                          'XML-PARSER::|Number|)))
                                            (XML-PARSER::|CharRef/CharRef.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|Number|) NIL)))))
                               (XML-PARSER::|CharRef/CharRef.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/CharRef.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((EQ |item| '|xml|:\;) (SETF *ATN-TERM* '|xml|:\;) (XML-PARSER::|CharRef.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) NIL)))))
                               (XML-PARSER::|CharRef/CharRef.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/CharRef.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:&#\x)
                                     (COND ((EQ |item| '|xml|:&#\x)
                                            (SETF *ATN-TERM* '|xml|:&#\x)
                                            (XML-PARSER::|CharRef/CharRef.2.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:&#\x) NIL)))))
                               (XML-PARSER::|CharRef/CharRef.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/CharRef.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|HexNumber|)
                                     (COND ((XML-PARSER::|IS-HexNumber| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|HexNumber|)
                                            (SETF XML-PARSER::|HexNumber|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|HexNumber-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|HexNumber| |item|)
                                                          'XML-PARSER::|HexNumber|)))
                                            (XML-PARSER::|CharRef/CharRef.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|HexNumber|) NIL)))))
                               (XML-PARSER::|CharRef/CharRef.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/CharRef.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((EQ |item| '|xml|:\;) (SETF *ATN-TERM* '|xml|:\;) (XML-PARSER::|CharRef.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) NIL)))))
                               (XML-PARSER::|CharRef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|CharRef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|CharRef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|CharRef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|CharRef/CharRef.2.4|)
                                           (XML-PARSER::|CharRef/CharRef.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|CharRef/CharRef.2.7|)
                                           (XML-PARSER::|CharRef/CharRef.2.7| INDEX))
                                         (XML-PARSER::|CharRef/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|CharRef.2| XML-PARSER::|CharRef/CharRef.2.4|
                          XML-PARSER::|CharRef/CharRef.2.5| XML-PARSER::|CharRef/CharRef.2.6| XML-PARSER::|CharRef/CharRef.2.7|
                          XML-PARSER::|CharRef/CharRef.2.8| XML-PARSER::|CharRef/CharRef.2.9| XML-PARSER::|CharRef/fail.3|
                          XML-PARSER::|CharRef/start.1|))
                        (XML-PARSER::|CharRef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|CharRef| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|CharRef| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|Reference| (INDEX &AUX (XML-PARSER::|CharRef| NIL) (XML-PARSER::|EntityRef| NIL))
  "{67} Reference ::= (EntityRef | CharRef)
(|CharRef| |EntityRef|)"
  (DECLARE (SPECIAL XML-PARSER::|Reference-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|Reference-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|Reference-INDEX| INDEX)
      (LET ((XML-PARSER::|Reference-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|Reference| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|Reference-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|Reference|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|Reference|)
                                 (RETURN-FROM XML-PARSER::|Reference| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|Reference| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|Reference.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Reference.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|Reference|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|Reference|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|Reference|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|CharRef|
                                                         XML-PARSER::|CharRef|
                                                         'XML-PARSER::|EntityRef|
                                                         XML-PARSER::|EntityRef|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|Reference-Constructor|
                                                    XML-PARSER::|CharRef|
                                                    XML-PARSER::|EntityRef|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|Reference|
                                                            (DELETE NIL (LIST XML-PARSER::|CharRef| XML-PARSER::|EntityRef|)))
                                                      'XML-PARSER::|Reference|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|Reference| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|Reference/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|Reference/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|Reference/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|Reference/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|EntityRef|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EntityRef| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|EntityRef| RESULT))
                                                    (XML-PARSER::|Reference.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|EntityRef|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|CharRef|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|CharRef| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|CharRef| RESULT))
                                                    (XML-PARSER::|Reference.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|CharRef|) NIL))))
                                         (XML-PARSER::|Reference/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|Reference.2| XML-PARSER::|Reference/fail.3|
                          XML-PARSER::|Reference/start.1|))
                        (XML-PARSER::|Reference/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|Reference| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|Reference| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EntityRef| (INDEX &AUX (XML-PARSER::|NCName| NIL))
  "{68} EntityRef ::= '&' NCName ';'
(|NCName|)"
  (DECLARE (SPECIAL XML-PARSER::|EntityRef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EntityRef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EntityRef-INDEX| INDEX)
      (LET ((XML-PARSER::|EntityRef-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EntityRef| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|EntityRef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EntityRef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EntityRef|)
                                 (RETURN-FROM XML-PARSER::|EntityRef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EntityRef| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EntityRef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityRef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EntityRef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EntityRef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EntityRef|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NCName| XML-PARSER::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|EntityRef-Constructor| XML-PARSER::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EntityRef| (DELETE NIL (LIST XML-PARSER::|NCName|)))
                                                      'XML-PARSER::|EntityRef|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|EntityRef| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EntityRef/EntityRef.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityRef/EntityRef.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|EntityRef/EntityRef.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|NCName|) (XML-PARSER::|EntityRef/fail.3| INDEX))))))
                               (XML-PARSER::|EntityRef/EntityRef.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityRef/EntityRef.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((EQ |item| '|xml|:\;)
                                            (SETF *ATN-TERM* '|xml|:\;)
                                            (XML-PARSER::|EntityRef.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) (XML-PARSER::|EntityRef/fail.3| INDEX))))))
                               (XML-PARSER::|EntityRef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EntityRef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EntityRef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityRef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:&)
                                     (COND ((EQ |item| '|xml|:&)
                                            (SETF *ATN-TERM* '|xml|:&)
                                            (XML-PARSER::|EntityRef/EntityRef.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:&) (XML-PARSER::|EntityRef/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EntityRef.2| XML-PARSER::|EntityRef/EntityRef.2.4|
                          XML-PARSER::|EntityRef/EntityRef.2.5| XML-PARSER::|EntityRef/fail.3| XML-PARSER::|EntityRef/start.1|))
                        (XML-PARSER::|EntityRef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EntityRef| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EntityRef| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|PEReference| (INDEX &AUX (XML-PARSER::|NCName| NIL))
  "{69} PEReference ::= '%' NCName ';'
(|NCName|)"
  (DECLARE (SPECIAL XML-PARSER::|PEReference-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|PEReference-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|PEReference-INDEX| INDEX)
      (LET ((XML-PARSER::|PEReference-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|PEReference| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|PEReference-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|PEReference|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|PEReference|)
                                 (RETURN-FROM XML-PARSER::|PEReference| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|PEReference| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|PEReference.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEReference.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|PEReference|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|PEReference|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|PEReference|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NCName| XML-PARSER::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|PEReference-Constructor|
                                                    XML-PARSER::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|PEReference| (DELETE NIL (LIST XML-PARSER::|NCName|)))
                                                      'XML-PARSER::|PEReference|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|PEReference| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|PEReference/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|PEReference/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|PEReference/PEReference.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEReference/PEReference.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|PEReference/PEReference.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::|NCName|)
                                            (XML-PARSER::|PEReference/fail.3| INDEX))))))
                               (XML-PARSER::|PEReference/PEReference.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEReference/PEReference.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\;)
                                     (COND ((EQ |item| '|xml|:\;)
                                            (SETF *ATN-TERM* '|xml|:\;)
                                            (XML-PARSER::|PEReference.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\;) (XML-PARSER::|PEReference/fail.3| INDEX))))))
                               (XML-PARSER::|PEReference/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEReference/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:%)
                                     (COND ((EQ |item| '|xml|:%)
                                            (SETF *ATN-TERM* '|xml|:%)
                                            (XML-PARSER::|PEReference/PEReference.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:%) (XML-PARSER::|PEReference/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|PEReference.2| XML-PARSER::|PEReference/fail.3|
                          XML-PARSER::|PEReference/PEReference.2.4| XML-PARSER::|PEReference/PEReference.2.5|
                          XML-PARSER::|PEReference/start.1|))
                        (XML-PARSER::|PEReference/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|PEReference| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|PEReference| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EntityDecl| (INDEX &AUX (XML-PARSER::|GEDecl| NIL) (XML-PARSER::|PEDecl| NIL))
  "{70} EntityDecl ::= '<!ENTITY' S+ ((GEDecl | PEDecl))
(|GEDecl| |PEDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|EntityDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EntityDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EntityDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|EntityDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EntityDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|EntityDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EntityDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EntityDecl|)
                                 (RETURN-FROM XML-PARSER::|EntityDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EntityDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EntityDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EntityDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EntityDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EntityDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|GEDecl|
                                                         XML-PARSER::|GEDecl|
                                                         'XML-PARSER::|PEDecl|
                                                         XML-PARSER::|PEDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|EntityDecl-Constructor|
                                                    XML-PARSER::|GEDecl|
                                                    XML-PARSER::|PEDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EntityDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|GEDecl| XML-PARSER::|PEDecl|)))
                                                      'XML-PARSER::|EntityDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|EntityDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EntityDecl.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDecl.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EntityDecl.6| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|EntityDecl/EntityDecl.2.5| INDEX))))))
                               (XML-PARSER::|EntityDecl/EntityDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDecl/EntityDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EntityDecl.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|EntityDecl/fail.3| INDEX))))))
                               (XML-PARSER::|EntityDecl/EntityDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDecl/EntityDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|GEDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|GEDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|GEDecl| RESULT))
                                                    (XML-PARSER::|EntityDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|GEDecl|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|PEDecl|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PEDecl| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|PEDecl| RESULT))
                                                    (XML-PARSER::|EntityDecl.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|PEDecl|) NIL))))
                                         (XML-PARSER::|EntityDecl/fail.3| INDEX)))))
                               (XML-PARSER::|EntityDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EntityDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EntityDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!ENTITY)
                                     (COND ((EQ |item| '|xml|:<!ENTITY)
                                            (SETF *ATN-TERM* '|xml|:<!ENTITY)
                                            (XML-PARSER::|EntityDecl/EntityDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!ENTITY) (XML-PARSER::|EntityDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EntityDecl.2| XML-PARSER::|EntityDecl.6|
                          XML-PARSER::|EntityDecl/EntityDecl.2.4| XML-PARSER::|EntityDecl/EntityDecl.2.5|
                          XML-PARSER::|EntityDecl/fail.3| XML-PARSER::|EntityDecl/start.1|))
                        (XML-PARSER::|EntityDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EntityDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EntityDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|GEDecl| (INDEX &AUX (XML-PARSER::|EntityDef| NIL) (XML-PARSER::|NCName| NIL))
  "{71} GEDecl ::= NCName S+ EntityDef S* '>'
(|EntityDef| |NCName|)"
  (DECLARE (SPECIAL XML-PARSER::|GEDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|GEDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|GEDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|GEDecl-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|GEDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|GEDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|GEDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|GEDecl|)
                                 (RETURN-FROM XML-PARSER::|GEDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|GEDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|GEDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|GEDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|GEDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|GEDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EntityDef|
                                                         XML-PARSER::|EntityDef|
                                                         'XML-PARSER::|NCName|
                                                         XML-PARSER::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|GEDecl-Constructor|
                                                    XML-PARSER::|EntityDef|
                                                    XML-PARSER::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|GEDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|EntityDef| XML-PARSER::|NCName|)))
                                                      'XML-PARSER::|GEDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|GEDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|GEDecl.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|GEDecl.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|GEDecl/GEDecl.2.5| INDEX))))))
                               (XML-PARSER::|GEDecl.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|GEDecl.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|GEDecl/GEDecl.2.7| INDEX))))))
                               (XML-PARSER::|GEDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|GEDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|GEDecl/GEDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl/GEDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|GEDecl.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|GEDecl/fail.3| INDEX))))))
                               (XML-PARSER::|GEDecl/GEDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl/GEDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|EntityDef|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EntityDef| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|EntityDef| RESULT))
                                              (XML-PARSER::|GEDecl/GEDecl.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|EntityDef|)
                                              (XML-PARSER::|GEDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|GEDecl/GEDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl/GEDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|GEDecl.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|GEDecl/GEDecl.2.7| INDEX))))))
                               (XML-PARSER::|GEDecl/GEDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl/GEDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>) (XML-PARSER::|GEDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|GEDecl/fail.3| INDEX))))))
                               (XML-PARSER::|GEDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|GEDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|GEDecl/GEDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|NCName|) (XML-PARSER::|GEDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|GEDecl.2| XML-PARSER::|GEDecl.8| XML-PARSER::|GEDecl.9|
                          XML-PARSER::|GEDecl/fail.3| XML-PARSER::|GEDecl/GEDecl.2.4| XML-PARSER::|GEDecl/GEDecl.2.5|
                          XML-PARSER::|GEDecl/GEDecl.2.6| XML-PARSER::|GEDecl/GEDecl.2.7| XML-PARSER::|GEDecl/start.1|))
                        (XML-PARSER::|GEDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|GEDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|GEDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|PEDecl| (INDEX &AUX (XML-PARSER::|NCName| NIL) (XML-PARSER::|PEDef| NIL))
  "{72} PEDecl ::= '%' S+ NCName S+ PEDef S* '>'
(|NCName| |PEDef|)"
  (DECLARE (SPECIAL XML-PARSER::|PEDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|PEDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|PEDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|PEDecl-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|PEDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|PEDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|PEDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|PEDecl|)
                                 (RETURN-FROM XML-PARSER::|PEDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|PEDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|PEDecl.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PEDecl.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PEDecl/PEDecl.2.5| INDEX))))))
                               (XML-PARSER::|PEDecl.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PEDecl.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PEDecl/PEDecl.2.7| INDEX))))))
                               (XML-PARSER::|PEDecl.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PEDecl.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PEDecl/PEDecl.2.9| INDEX))))))
                               (XML-PARSER::|PEDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|PEDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|PEDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|PEDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NCName|
                                                         XML-PARSER::|NCName|
                                                         'XML-PARSER::|PEDef|
                                                         XML-PARSER::|PEDef|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|PEDecl-Constructor|
                                                    XML-PARSER::|NCName|
                                                    XML-PARSER::|PEDef|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|PEDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|NCName| XML-PARSER::|PEDef|)))
                                                      'XML-PARSER::|PEDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|PEDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|PEDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|PEDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|PEDecl/PEDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/PEDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PEDecl.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PEDecl/fail.3| INDEX))))))
                               (XML-PARSER::|PEDecl/PEDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/PEDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|PEDecl/PEDecl.2.6| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|NCName|) (XML-PARSER::|PEDecl/fail.3| INDEX))))))
                               (XML-PARSER::|PEDecl/PEDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/PEDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PEDecl.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PEDecl/fail.3| INDEX))))))
                               (XML-PARSER::|PEDecl/PEDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/PEDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|PEDef|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PEDef| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|PEDef| RESULT))
                                              (XML-PARSER::|PEDecl/PEDecl.2.8| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|PEDef|) (XML-PARSER::|PEDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|PEDecl/PEDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/PEDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PEDecl.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PEDecl/PEDecl.2.9| INDEX))))))
                               (XML-PARSER::|PEDecl/PEDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/PEDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>) (XML-PARSER::|PEDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|PEDecl/fail.3| INDEX))))))
                               (XML-PARSER::|PEDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:%)
                                     (COND ((EQ |item| '|xml|:%)
                                            (SETF *ATN-TERM* '|xml|:%)
                                            (XML-PARSER::|PEDecl/PEDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:%) (XML-PARSER::|PEDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|PEDecl.10| XML-PARSER::|PEDecl.11| XML-PARSER::|PEDecl.12|
                          XML-PARSER::|PEDecl.2| XML-PARSER::|PEDecl/fail.3| XML-PARSER::|PEDecl/PEDecl.2.4|
                          XML-PARSER::|PEDecl/PEDecl.2.5| XML-PARSER::|PEDecl/PEDecl.2.6| XML-PARSER::|PEDecl/PEDecl.2.7|
                          XML-PARSER::|PEDecl/PEDecl.2.8| XML-PARSER::|PEDecl/PEDecl.2.9| XML-PARSER::|PEDecl/start.1|))
                        (XML-PARSER::|PEDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|PEDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|PEDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EntityDef| (INDEX &AUX (XML-PARSER::|EntityValue| NIL) (XML-PARSER::|ExternalID| NIL)
                                (XML-PARSER::|NDataDecl| NIL))
  "{73} EntityDef ::= (EntityValue | (ExternalID NDataDecl?))
(|EntityValue| |ExternalID| |NDataDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|EntityDef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EntityDef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EntityDef-INDEX| INDEX)
      (LET ((XML-PARSER::|EntityDef-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EntityDef| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|EntityDef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EntityDef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EntityDef|)
                                 (RETURN-FROM XML-PARSER::|EntityDef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EntityDef| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EntityDef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EntityDef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EntityDef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EntityDef|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EntityValue|
                                                         XML-PARSER::|EntityValue|
                                                         'XML-PARSER::|ExternalID|
                                                         XML-PARSER::|ExternalID|
                                                         'XML-PARSER::|NDataDecl|
                                                         XML-PARSER::|NDataDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|EntityDef-Constructor|
                                                    XML-PARSER::|EntityValue|
                                                    XML-PARSER::|ExternalID|
                                                    XML-PARSER::|NDataDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EntityDef|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|EntityValue|
                                                                          XML-PARSER::|ExternalID|
                                                                          XML-PARSER::|NDataDecl|)))
                                                      'XML-PARSER::|EntityDef|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|EntityDef| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EntityDef/EntityDef.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDef/EntityDef.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|ExternalID|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExternalID| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|ExternalID| RESULT))
                                              (XML-PARSER::|EntityDef/EntityDef.2.5| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|ExternalID|) NIL))))))
                               (XML-PARSER::|EntityDef/EntityDef.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDef/EntityDef.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|NDataDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|NDataDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|NDataDecl| RESULT))
                                              (XML-PARSER::|EntityDef.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|NDataDecl|) (XML-PARSER::|EntityDef.2| INDEX)))))))
                               (XML-PARSER::|EntityDef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EntityDef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EntityDef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EntityDef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|EntityValue|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EntityValue| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|EntityValue| RESULT))
                                                    (XML-PARSER::|EntityDef.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|EntityValue|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|EntityDef/EntityDef.2.4|)
                                           (XML-PARSER::|EntityDef/EntityDef.2.4| INDEX))
                                         (XML-PARSER::|EntityDef/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EntityDef.2| XML-PARSER::|EntityDef/EntityDef.2.4|
                          XML-PARSER::|EntityDef/EntityDef.2.5| XML-PARSER::|EntityDef/fail.3| XML-PARSER::|EntityDef/start.1|))
                        (XML-PARSER::|EntityDef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EntityDef| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EntityDef| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|PEDef| (INDEX &AUX (XML-PARSER::|EntityValue| NIL) (XML-PARSER::|ExternalID| NIL))
  "{74} PEDef ::= (EntityValue | ExternalID)
(|EntityValue| |ExternalID|)"
  (DECLARE (SPECIAL XML-PARSER::|PEDef-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|PEDef-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|PEDef-INDEX| INDEX)
      (LET ((XML-PARSER::|PEDef-INDEX| INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS 'XML-PARSER::|PEDef| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|PEDef-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|PEDef|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|PEDef|)
                                 (RETURN-FROM XML-PARSER::|PEDef| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|PEDef| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|PEDef.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDef.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|PEDef|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|PEDef|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|PEDef|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EntityValue|
                                                         XML-PARSER::|EntityValue|
                                                         'XML-PARSER::|ExternalID|
                                                         XML-PARSER::|ExternalID|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|PEDef-Constructor|
                                                    XML-PARSER::|EntityValue|
                                                    XML-PARSER::|ExternalID|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|PEDef|
                                                            (DELETE NIL (LIST XML-PARSER::|EntityValue| XML-PARSER::|ExternalID|)))
                                                      'XML-PARSER::|PEDef|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|PEDef| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|PEDef/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|PEDef/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|PEDef/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PEDef/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|EntityValue|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EntityValue| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|EntityValue| RESULT))
                                                    (XML-PARSER::|PEDef.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|EntityValue|) NIL))))
                                         (%ATN-EDGE-BLOCK
                                           (PUSH XML-PARSER::|ExternalID|)
                                           (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                               (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|ExternalID| INDEX)
                                             (COND (SUCCESS
                                                    (WHEN RESULT (SETF XML-PARSER::|ExternalID| RESULT))
                                                    (XML-PARSER::|PEDef.2| RESULT-INDEX))
                                                   (T (SETF *ATN-TERM?* 'XML-PARSER::|ExternalID|) NIL))))
                                         (XML-PARSER::|PEDef/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|PEDef.2| XML-PARSER::|PEDef/fail.3| XML-PARSER::|PEDef/start.1|))
                        (XML-PARSER::|PEDef/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|PEDef| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|PEDef| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ExternalID| (INDEX &AUX (XML-PARSER::|PubidLiteral| NIL) (XML-PARSER::|SystemLiteral| NIL))
  "{75} ExternalID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC
                                                  S+
                                                  PubidLiteral
                                                  S+
                                                  SystemLiteral))
(|PubidLiteral| |SystemLiteral|)"
  (DECLARE (SPECIAL XML-PARSER::|ExternalID-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ExternalID-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ExternalID-INDEX| INDEX)
      (LET ((XML-PARSER::|ExternalID-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ExternalID| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|ExternalID-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|ExternalID-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ExternalID|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ExternalID|)
                                 (RETURN-FROM XML-PARSER::|ExternalID| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ExternalID| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ExternalID.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID.13|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID.13| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID/ExternalID.2.10| INDEX))))))
                               (XML-PARSER::|ExternalID.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID.14|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID.14| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID/ExternalID.2.12| INDEX))))))
                               (XML-PARSER::|ExternalID.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ExternalID|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ExternalID|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ExternalID|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|PubidLiteral|
                                                         XML-PARSER::|PubidLiteral|
                                                         'XML-PARSER::|SystemLiteral|
                                                         XML-PARSER::|SystemLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|ExternalID-Constructor|
                                                    XML-PARSER::|PubidLiteral|
                                                    XML-PARSER::|SystemLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ExternalID|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|PubidLiteral| XML-PARSER::|SystemLiteral|)))
                                                      'XML-PARSER::|ExternalID|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ExternalID| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ExternalID.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID.7| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID/ExternalID.2.6| INDEX))))))
                               (XML-PARSER::|ExternalID/ExternalID.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|PubidLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PubidLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|PubidLiteral| RESULT))
                                              (XML-PARSER::|ExternalID/ExternalID.2.11| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|PubidLiteral|) NIL))))))
                               (XML-PARSER::|ExternalID/ExternalID.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID.14| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|ExternalID/ExternalID.2.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.12|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|SystemLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|SystemLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|SystemLiteral| RESULT))
                                              (XML-PARSER::|ExternalID.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|SystemLiteral|) NIL))))))
                               (XML-PARSER::|ExternalID/ExternalID.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST SYSTEM)
                                     (COND ((XML-PARSER::|IS-SYSTEMToken| |item|)
                                            (SETF *ATN-TERM* 'SYSTEM)
                                            (XML-PARSER::|ExternalID/ExternalID.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'SYSTEM) NIL)))))
                               (XML-PARSER::|ExternalID/ExternalID.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|ExternalID/ExternalID.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|SystemLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|SystemLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|SystemLiteral| RESULT))
                                              (XML-PARSER::|ExternalID.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|SystemLiteral|) NIL))))))
                               (XML-PARSER::|ExternalID/ExternalID.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::PUBLIC)
                                     (COND ((XML-PARSER::|IS-PUBLICToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::PUBLIC)
                                            (XML-PARSER::|ExternalID/ExternalID.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::PUBLIC) NIL)))))
                               (XML-PARSER::|ExternalID/ExternalID.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/ExternalID.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|ExternalID.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|ExternalID/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ExternalID/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ExternalID/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExternalID/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|ExternalID/ExternalID.2.4|)
                                           (XML-PARSER::|ExternalID/ExternalID.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|ExternalID/ExternalID.2.8|)
                                           (XML-PARSER::|ExternalID/ExternalID.2.8| INDEX))
                                         (XML-PARSER::|ExternalID/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ExternalID.13| XML-PARSER::|ExternalID.14| XML-PARSER::|ExternalID.2|
                          XML-PARSER::|ExternalID.7| XML-PARSER::|ExternalID/ExternalID.2.10|
                          XML-PARSER::|ExternalID/ExternalID.2.11| XML-PARSER::|ExternalID/ExternalID.2.12|
                          XML-PARSER::|ExternalID/ExternalID.2.4| XML-PARSER::|ExternalID/ExternalID.2.5|
                          XML-PARSER::|ExternalID/ExternalID.2.6| XML-PARSER::|ExternalID/ExternalID.2.8|
                          XML-PARSER::|ExternalID/ExternalID.2.9| XML-PARSER::|ExternalID/fail.3|
                          XML-PARSER::|ExternalID/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|ExternalID/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ExternalID| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ExternalID| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|NDataDecl| (INDEX &AUX (XML-PARSER::|NCName| NIL))
  "{76} NDataDecl ::= S+ NDATA S+ NCName
(|NCName|)"
  (DECLARE (SPECIAL XML-PARSER::|NDataDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|NDataDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|NDataDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|NDataDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|NDataDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|NDataDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|NDataDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|NDataDecl|)
                                 (RETURN-FROM XML-PARSER::|NDataDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|NDataDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|NDataDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|NDataDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|NDataDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|NDataDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NCName| XML-PARSER::|NCName|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE #'XML-PARSER::|NDataDecl-Constructor| XML-PARSER::|NCName|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|NDataDecl| (DELETE NIL (LIST XML-PARSER::|NCName|)))
                                                      'XML-PARSER::|NDataDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|NDataDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|NDataDecl.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NDataDecl.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NDataDecl/NDataDecl.2.4| INDEX))))))
                               (XML-PARSER::|NDataDecl.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NDataDecl.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NDataDecl/NDataDecl.2.6| INDEX))))))
                               (XML-PARSER::|NDataDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|NDataDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|NDataDecl/NDataDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl/NDataDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::NDATA)
                                     (COND ((XML-PARSER::|IS-NDATAToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::NDATA)
                                            (XML-PARSER::|NDataDecl/NDataDecl.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::NDATA) (XML-PARSER::|NDataDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NDataDecl/NDataDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl/NDataDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NDataDecl.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NDataDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NDataDecl/NDataDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl/NDataDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|NDataDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|NCName|) (XML-PARSER::|NDataDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NDataDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NDataDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NDataDecl.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NDataDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|NDataDecl.2| XML-PARSER::|NDataDecl.7| XML-PARSER::|NDataDecl.8|
                          XML-PARSER::|NDataDecl/fail.3| XML-PARSER::|NDataDecl/NDataDecl.2.4|
                          XML-PARSER::|NDataDecl/NDataDecl.2.5| XML-PARSER::|NDataDecl/NDataDecl.2.6|
                          XML-PARSER::|NDataDecl/start.1|))
                        (XML-PARSER::|NDataDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|NDataDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|NDataDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|TextDecl| (INDEX &AUX (XML-PARSER::|EncodingDecl| NIL) (XML-PARSER::|VersionInfo| NIL))
  "{77} TextDecl ::= '<?xml' VersionInfo? EncodingDecl S* '?>'
(|EncodingDecl| |VersionInfo|)"
  (DECLARE (SPECIAL XML-PARSER::|TextDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|TextDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|TextDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|TextDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|TextDecl| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|TextDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|TextDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|TextDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|TextDecl|)
                                 (RETURN-FROM XML-PARSER::|TextDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|TextDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|TextDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|TextDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|TextDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|TextDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EncodingDecl|
                                                         XML-PARSER::|EncodingDecl|
                                                         'XML-PARSER::|VersionInfo|
                                                         XML-PARSER::|VersionInfo|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|TextDecl-Constructor|
                                                    XML-PARSER::|EncodingDecl|
                                                    XML-PARSER::|VersionInfo|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|TextDecl|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|EncodingDecl| XML-PARSER::|VersionInfo|)))
                                                      'XML-PARSER::|TextDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|TextDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|TextDecl.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|TextDecl.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|TextDecl/TextDecl.2.7| INDEX))))))
                               (XML-PARSER::|TextDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|TextDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|TextDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:|<?xml|)
                                     (COND ((EQ |item| '|xml|:|<?xml|)
                                            (SETF *ATN-TERM* '|xml|:|<?xml|)
                                            (XML-PARSER::|TextDecl/TextDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:|<?xml|) (XML-PARSER::|TextDecl/fail.3| INDEX))))))
                               (XML-PARSER::|TextDecl/TextDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl/TextDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|VersionInfo|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|VersionInfo| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|VersionInfo| RESULT))
                                              (XML-PARSER::|TextDecl/TextDecl.2.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|VersionInfo|)
                                              (XML-PARSER::|TextDecl/TextDecl.2.5| INDEX)))))))
                               (XML-PARSER::|TextDecl/TextDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl/TextDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|EncodingDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|EncodingDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|EncodingDecl| RESULT))
                                              (XML-PARSER::|TextDecl/TextDecl.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|EncodingDecl|)
                                              (XML-PARSER::|TextDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|TextDecl/TextDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl/TextDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|TextDecl.8| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|TextDecl/TextDecl.2.7| INDEX))))))
                               (XML-PARSER::|TextDecl/TextDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|TextDecl/TextDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:?>)
                                     (COND ((EQ |item| '|xml|:?>)
                                            (SETF *ATN-TERM* '|xml|:?>)
                                            (XML-PARSER::|TextDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:?>) (XML-PARSER::|TextDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|TextDecl.2| XML-PARSER::|TextDecl.8| XML-PARSER::|TextDecl/fail.3|
                          XML-PARSER::|TextDecl/start.1| XML-PARSER::|TextDecl/TextDecl.2.4| XML-PARSER::|TextDecl/TextDecl.2.5|
                          XML-PARSER::|TextDecl/TextDecl.2.6| XML-PARSER::|TextDecl/TextDecl.2.7|))
                        (XML-PARSER::|TextDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|TextDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|TextDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|ExtParsedEnt| (INDEX &AUX (XML-PARSER::|Content| NIL) (XML-PARSER::|TextDecl| NIL))
  "{78} ExtParsedEnt ::= TextDecl? Content*
(|Content| |TextDecl|)"
  (DECLARE (SPECIAL XML-PARSER::|ExtParsedEnt-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|ExtParsedEnt-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|ExtParsedEnt-INDEX| INDEX)
      (LET ((XML-PARSER::|ExtParsedEnt-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|ExtParsedEnt| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|ExtParsedEnt-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|ExtParsedEnt-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|ExtParsedEnt|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|ExtParsedEnt|)
                                 (RETURN-FROM XML-PARSER::|ExtParsedEnt| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|ExtParsedEnt| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|ExtParsedEnt.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtParsedEnt.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|ExtParsedEnt|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|ExtParsedEnt|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|ExtParsedEnt|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|Content|
                                                         XML-PARSER::|Content|
                                                         'XML-PARSER::|TextDecl|
                                                         XML-PARSER::|TextDecl|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                    #'XML-PARSER:|ExtParsedEnt-Constructor|
                                                    XML-PARSER:*CONSTRUCTION-CONTEXT*
                                                    XML-PARSER::|Content|
                                                    XML-PARSER::|TextDecl|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|ExtParsedEnt|
                                                            (DELETE NIL (LIST XML-PARSER::|Content| XML-PARSER::|TextDecl|)))
                                                      'XML-PARSER::|ExtParsedEnt|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|ExtParsedEnt| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|ExtParsedEnt.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtParsedEnt.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Content|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Content| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Content| (CONS RESULT XML-PARSER::|Content|)))
                                              (XML-PARSER::|ExtParsedEnt.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Content|)
                                              (XML-PARSER::|ExtParsedEnt.2| INDEX)))))))
                               (XML-PARSER::|ExtParsedEnt/ExtParsedEnt.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtParsedEnt/ExtParsedEnt.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Content|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Content| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|Content| (CONS RESULT XML-PARSER::|Content|)))
                                              (XML-PARSER::|ExtParsedEnt.5| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Content|)
                                              (XML-PARSER::|ExtParsedEnt.2| INDEX)))))))
                               (XML-PARSER::|ExtParsedEnt/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|ExtParsedEnt/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|ExtParsedEnt/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|ExtParsedEnt/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|TextDecl|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|TextDecl| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|TextDecl| RESULT))
                                              (XML-PARSER::|ExtParsedEnt/ExtParsedEnt.2.4| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|TextDecl|)
                                              (XML-PARSER::|ExtParsedEnt/ExtParsedEnt.2.4| INDEX))))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|ExtParsedEnt.2| XML-PARSER::|ExtParsedEnt.5|
                          XML-PARSER::|ExtParsedEnt/ExtParsedEnt.2.4| XML-PARSER::|ExtParsedEnt/fail.3|
                          XML-PARSER::|ExtParsedEnt/start.1|))
                        (XML-PARSER::|ExtParsedEnt/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|ExtParsedEnt| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|ExtParsedEnt| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|EncodingDecl| (INDEX &AUX (XML-PARSER::|EncNameCharData| NIL))
  "{80} EncodingDecl ::= S+ encoding Eq ((('\"'
                                        EncNameCharData
                                        '\"') | (''' EncNameCharData ''')))
(|EncNameCharData|)"
  (DECLARE (SPECIAL XML-PARSER::|EncodingDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|EncodingDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|EncodingDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|EncodingDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|EncodingDecl| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|EncodingDecl-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|EncodingDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|EncodingDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|EncodingDecl|)
                                 (RETURN-FROM XML-PARSER::|EncodingDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|EncodingDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|EncodingDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|EncodingDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|EncodingDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|EncodingDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|EncNameCharData| XML-PARSER::|EncNameCharData|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|EncodingDecl-Constructor|
                                                    XML-PARSER::|EncNameCharData|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|EncodingDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|EncNameCharData|)))
                                                      'XML-PARSER::|EncodingDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|EncodingDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|EncodingDecl.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EncodingDecl.7| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|EncodingDecl/EncodingDecl.2.4| INDEX))))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|EncodingDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|EncodingDecl/EncodingDecl.2.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|EncNameCharData|)
                                     (COND ((XML-PARSER::|IS-EncNameCharData| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|EncNameCharData|)
                                            (SETF XML-PARSER::|EncNameCharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|EncNameCharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|EncNameCharData| |item|)
                                                          'XML-PARSER::|EncNameCharData|)))
                                            (XML-PARSER::|EncodingDecl/EncodingDecl.2.13| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|EncNameCharData|) NIL)))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.13|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\')
                                     (COND ((EQ |item| '|xml|:\')
                                            (SETF *ATN-TERM* '|xml|:\')
                                            (XML-PARSER::|EncodingDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\') NIL)))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|encoding|)
                                     (COND ((XML-PARSER::|IS-encodingToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|encoding|)
                                            (XML-PARSER::|EncodingDecl/EncodingDecl.2.5| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::|encoding|)
                                            (XML-PARSER::|EncodingDecl/fail.3| INDEX))))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|Eq|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|Eq| INDEX)
                                       (COND (SUCCESS
                                              (SETF RESULT RESULT)
                                              (XML-PARSER::|EncodingDecl/EncodingDecl.2.6| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|Eq|)
                                              (XML-PARSER::|EncodingDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|EncodingDecl/EncodingDecl.2.8|)
                                           (XML-PARSER::|EncodingDecl/EncodingDecl.2.8| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|EncodingDecl/EncodingDecl.2.11|)
                                           (XML-PARSER::|EncodingDecl/EncodingDecl.2.11| INDEX))
                                         (XML-PARSER::|EncodingDecl/fail.3| INDEX)))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:\")
                                     (COND ((EQ |item| '|xml|:\")
                                            (SETF *ATN-TERM* '|xml|:\")
                                            (XML-PARSER::|EncodingDecl/EncodingDecl.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:\") NIL)))))
                               (XML-PARSER::|EncodingDecl/EncodingDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/EncodingDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|EncNameCharData|)
                                     (COND ((XML-PARSER::|IS-EncNameCharData| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|EncNameCharData|)
                                            (SETF XML-PARSER::|EncNameCharData|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|EncNameCharData-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|EncNameCharData| |item|)
                                                          'XML-PARSER::|EncNameCharData|)))
                                            (XML-PARSER::|EncodingDecl/EncodingDecl.2.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::|EncNameCharData|) NIL)))))
                               (XML-PARSER::|EncodingDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|EncodingDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|EncodingDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|EncodingDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|EncodingDecl.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|EncodingDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|EncodingDecl.2| XML-PARSER::|EncodingDecl.7|
                          XML-PARSER::|EncodingDecl/EncodingDecl.2.10| XML-PARSER::|EncodingDecl/EncodingDecl.2.11|
                          XML-PARSER::|EncodingDecl/EncodingDecl.2.12| XML-PARSER::|EncodingDecl/EncodingDecl.2.13|
                          XML-PARSER::|EncodingDecl/EncodingDecl.2.4| XML-PARSER::|EncodingDecl/EncodingDecl.2.5|
                          XML-PARSER::|EncodingDecl/EncodingDecl.2.6| XML-PARSER::|EncodingDecl/EncodingDecl.2.8|
                          XML-PARSER::|EncodingDecl/EncodingDecl.2.9| XML-PARSER::|EncodingDecl/fail.3|
                          XML-PARSER::|EncodingDecl/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|EncodingDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|EncodingDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|EncodingDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|NotationDecl| (INDEX &AUX (XML-PARSER::|NCName| NIL) (XML-PARSER::|PublicID| NIL))
  "{82} NotationDecl ::= '<!NOTATION' S+ NCName S+ PublicID S* '>'
(|NCName| |PublicID|)"
  (DECLARE (SPECIAL XML-PARSER::|NotationDecl-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|NotationDecl-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|NotationDecl-INDEX| INDEX)
      (LET ((XML-PARSER::|NotationDecl-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|NotationDecl| *ATN-STACK)))
        (DECLARE (SPECIAL XML-PARSER::|NotationDecl-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|NotationDecl|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|NotationDecl|)
                                 (RETURN-FROM XML-PARSER::|NotationDecl| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|NotationDecl| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|NotationDecl.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl.10|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl.10| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl/NotationDecl.2.5| INDEX))))))
                               (XML-PARSER::|NotationDecl.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl.11|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl.11| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl/NotationDecl.2.7| INDEX))))))
                               (XML-PARSER::|NotationDecl.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl.12| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl/NotationDecl.2.9| INDEX))))))
                               (XML-PARSER::|NotationDecl.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|NotationDecl|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|NotationDecl|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|NotationDecl|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|NCName|
                                                         XML-PARSER::|NCName|
                                                         'XML-PARSER::|PublicID|
                                                         XML-PARSER::|PublicID|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|NotationDecl-Constructor|
                                                    XML-PARSER::|NCName|
                                                    XML-PARSER::|PublicID|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|NotationDecl|
                                                            (DELETE NIL (LIST XML-PARSER::|NCName| XML-PARSER::|PublicID|)))
                                                      'XML-PARSER::|NotationDecl|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|NotationDecl| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|NotationDecl/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|NotationDecl/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|NotationDecl/NotationDecl.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/NotationDecl.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl.10| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NotationDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NotationDecl/NotationDecl.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/NotationDecl.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::|NCName|)
                                     (COND ((XML-PARSER::|IS-NCName| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::|NCName|)
                                            (SETF XML-PARSER::|NCName|
                                                  (IF (EQ *ATN-REDUCE* T)
                                                      (ATN-REDUCE-ITEM #'XML-PARSER::|NCName-Constructor| |item|)
                                                      (IF (EQ *ATN-REDUCE* 'CONS)
                                                          (LIST 'XML-PARSER::|NCName| |item|)
                                                          'XML-PARSER::|NCName|)))
                                            (XML-PARSER::|NotationDecl/NotationDecl.2.6| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::|NCName|)
                                            (XML-PARSER::|NotationDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NotationDecl/NotationDecl.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/NotationDecl.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl.11| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|NotationDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NotationDecl/NotationDecl.2.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/NotationDecl.2.7|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|PublicID|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PublicID| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|PublicID| RESULT))
                                              (XML-PARSER::|NotationDecl/NotationDecl.2.8| RESULT-INDEX))
                                             (T
                                              (SETF *ATN-TERM?* 'XML-PARSER::|PublicID|)
                                              (XML-PARSER::|NotationDecl/fail.3| INDEX)))))))
                               (XML-PARSER::|NotationDecl/NotationDecl.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/NotationDecl.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl.12| (1+ INDEX)))
                                           (T
                                            (SETF *ATN-TERM?* 'XML-PARSER::S)
                                            (XML-PARSER::|NotationDecl/NotationDecl.2.9| INDEX))))))
                               (XML-PARSER::|NotationDecl/NotationDecl.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/NotationDecl.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:>)
                                     (COND ((EQ |item| '|xml|:>)
                                            (SETF *ATN-TERM* '|xml|:>)
                                            (XML-PARSER::|NotationDecl.2| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:>) (XML-PARSER::|NotationDecl/fail.3| INDEX))))))
                               (XML-PARSER::|NotationDecl/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|NotationDecl/start.1|
                                   (%ATN-EDGE-BLOCK
                                     (WORD |xml|:<!NOTATION)
                                     (COND ((EQ |item| '|xml|:<!NOTATION)
                                            (SETF *ATN-TERM* '|xml|:<!NOTATION)
                                            (XML-PARSER::|NotationDecl/NotationDecl.2.4| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* '|xml|:<!NOTATION) (XML-PARSER::|NotationDecl/fail.3| INDEX)))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|NotationDecl.10| XML-PARSER::|NotationDecl.11|
                          XML-PARSER::|NotationDecl.12| XML-PARSER::|NotationDecl.2| XML-PARSER::|NotationDecl/fail.3|
                          XML-PARSER::|NotationDecl/NotationDecl.2.4| XML-PARSER::|NotationDecl/NotationDecl.2.5|
                          XML-PARSER::|NotationDecl/NotationDecl.2.6| XML-PARSER::|NotationDecl/NotationDecl.2.7|
                          XML-PARSER::|NotationDecl/NotationDecl.2.8| XML-PARSER::|NotationDecl/NotationDecl.2.9|
                          XML-PARSER::|NotationDecl/start.1|))
                        (XML-PARSER::|NotationDecl/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|NotationDecl| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|NotationDecl| INDEX *ATN-STACK)))
(DEFUN XML-PARSER::|PublicID| (INDEX &AUX (XML-PARSER::|PubidLiteral| NIL) (XML-PARSER::|SystemLiteral| NIL))
  "{83} PublicID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC
                                                S+
                                                PubidLiteral
                                                (S+ SystemLiteral)?))
(|PubidLiteral| |SystemLiteral|)"
  (DECLARE (SPECIAL XML-PARSER::|PublicID-INDEX|))
  (DECLARE (TYPE FIXNUM INDEX XML-PARSER::|PublicID-INDEX| *ATN-LEVEL))
  (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
  (IF (< XML-PARSER::|PublicID-INDEX| INDEX)
      (LET ((XML-PARSER::|PublicID-INDEX| INDEX)
            (*ATN-LEVEL (1+ *ATN-LEVEL))
            (*ATN-STACK (CONS 'XML-PARSER::|PublicID| *ATN-STACK))
            (XML-UTILS:*PARSETABLE* XML-PARSER::|PublicID-Parsetable|))
        (DECLARE (SPECIAL XML-PARSER::|PublicID-INDEX|))
        (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
        (DECLARE (TYPE CONS *ATN-STACK))
        (SYMBOL-MACROLET
          ((|item| (XML-PARSER::INPUT-REFERENCE INDEX)))
          (%ATN-BLOCK XML-PARSER::|PublicID|
                      (LABELS ((SUCCEED (INDEX RESULT)
                                 (SETF *ATN-TERM* 'XML-PARSER::|PublicID|)
                                 (RETURN-FROM XML-PARSER::|PublicID| (VALUES RESULT INDEX T)))
                               (FAIL (INDEX) (RETURN-FROM XML-PARSER::|PublicID| (VALUES NIL INDEX NIL)))
                               (XML-PARSER::|PublicID.12| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID.12|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PublicID.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PublicID/PublicID.2.10| INDEX))))))
                               (XML-PARSER::|PublicID.15| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID.15|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PublicID.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PublicID/PublicID.2.14| INDEX))))))
                               (XML-PARSER::|PublicID.2| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID.2|
                                   (%ATN-EDGE-BLOCK
                                     (POP XML-PARSER::|PublicID|)
                                     (WHEN T
                                       (SETF *ATN-TERM* 'XML-PARSER::|PublicID|)
                                       (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                   'XML-PARSER::|PublicID|
                                                   INDEX
                                                   (LIST 'XML-PARSER::|PubidLiteral|
                                                         XML-PARSER::|PubidLiteral|
                                                         'XML-PARSER::|SystemLiteral|
                                                         XML-PARSER::|SystemLiteral|))
                                       (LET ((RESULT-STRUCTURE
                                              (IF (EQ *ATN-REDUCE* T)
                                                  (ATN-REDUCE-STRUCTURE
                                                    #'XML-PARSER::|PublicID-Constructor|
                                                    XML-PARSER::|PubidLiteral|
                                                    XML-PARSER::|SystemLiteral|)
                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                      (CONS 'XML-PARSER::|PublicID|
                                                            (DELETE NIL
                                                                    (LIST XML-PARSER::|PubidLiteral| XML-PARSER::|SystemLiteral|)))
                                                      'XML-PARSER::|PublicID|))))
                                         (WHEN (IS-ATN-TRACE)
                                           (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" 'XML-PARSER::|PublicID| RESULT-STRUCTURE))
                                         (SUCCEED INDEX RESULT-STRUCTURE))))))
                               (XML-PARSER::|PublicID.7| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID.7|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PublicID.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) (XML-PARSER::|PublicID/PublicID.2.6| INDEX))))))
                               (XML-PARSER::|PublicID/fail.3| (INDEX)
                                 (%ATN-NODE-BLOCK XML-PARSER::|PublicID/fail.3| (PROGN (FAIL INDEX))))
                               (XML-PARSER::|PublicID/PublicID.2.10| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.10|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|PubidLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|PubidLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|PubidLiteral| RESULT))
                                              (XML-PARSER::|PublicID/PublicID.2.11| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|PubidLiteral|) NIL))))))
                               (XML-PARSER::|PublicID/PublicID.2.11| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.11|
                                   (%ATN-EDGE-BLOCK
                                     (JUMP XML-PARSER::|PublicID/PublicID.2.13|)
                                     (XML-PARSER::|PublicID/PublicID.2.13| INDEX))
                                   (%ATN-EDGE-BLOCK (JUMP XML-PARSER::|PublicID.2|) (XML-PARSER::|PublicID.2| INDEX))))
                               (XML-PARSER::|PublicID/PublicID.2.13| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.13|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PublicID.15| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|PublicID/PublicID.2.14| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.14|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|SystemLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|SystemLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|SystemLiteral| RESULT))
                                              (XML-PARSER::|PublicID.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|SystemLiteral|) NIL))))))
                               (XML-PARSER::|PublicID/PublicID.2.4| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.4|
                                   (%ATN-EDGE-BLOCK
                                     (TEST SYSTEM)
                                     (COND ((XML-PARSER::|IS-SYSTEMToken| |item|)
                                            (SETF *ATN-TERM* 'SYSTEM)
                                            (XML-PARSER::|PublicID/PublicID.2.5| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'SYSTEM) NIL)))))
                               (XML-PARSER::|PublicID/PublicID.2.5| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.5|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PublicID.7| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|PublicID/PublicID.2.6| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.6|
                                   (%ATN-EDGE-BLOCK
                                     (PUSH XML-PARSER::|SystemLiteral|)
                                     (MULTIPLE-VALUE-BIND (RESULT RESULT-INDEX SUCCESS)
                                         (ATN-PARSE-SUBSTRUCTURE 'XML-PARSER::|SystemLiteral| INDEX)
                                       (COND (SUCCESS
                                              (WHEN RESULT (SETF XML-PARSER::|SystemLiteral| RESULT))
                                              (XML-PARSER::|PublicID.2| RESULT-INDEX))
                                             (T (SETF *ATN-TERM?* 'XML-PARSER::|SystemLiteral|) NIL))))))
                               (XML-PARSER::|PublicID/PublicID.2.8| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.8|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::PUBLIC)
                                     (COND ((XML-PARSER::|IS-PUBLICToken| |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::PUBLIC)
                                            (XML-PARSER::|PublicID/PublicID.2.9| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::PUBLIC) NIL)))))
                               (XML-PARSER::|PublicID/PublicID.2.9| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/PublicID.2.9|
                                   (%ATN-EDGE-BLOCK
                                     (TEST XML-PARSER::S)
                                     (COND ((XML-PARSER::IS-S |item|)
                                            (SETF *ATN-TERM* 'XML-PARSER::S)
                                            (XML-PARSER::|PublicID.12| (1+ INDEX)))
                                           (T (SETF *ATN-TERM?* 'XML-PARSER::S) NIL)))))
                               (XML-PARSER::|PublicID/start.1| (INDEX)
                                 (%ATN-NODE-BLOCK
                                   XML-PARSER::|PublicID/start.1|
                                   (%ATN-EDGE-BLOCK
                                     OR
                                     (OR (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|PublicID/PublicID.2.4|)
                                           (XML-PARSER::|PublicID/PublicID.2.4| INDEX))
                                         (%ATN-EDGE-BLOCK
                                           (JUMP XML-PARSER::|PublicID/PublicID.2.8|)
                                           (XML-PARSER::|PublicID/PublicID.2.8| INDEX))
                                         (XML-PARSER::|PublicID/fail.3| INDEX))))))
                        (DECLARE
                         (INLINE SUCCEED FAIL XML-PARSER::|PublicID.12| XML-PARSER::|PublicID.15| XML-PARSER::|PublicID.2|
                          XML-PARSER::|PublicID.7| XML-PARSER::|PublicID/fail.3| XML-PARSER::|PublicID/PublicID.2.10|
                          XML-PARSER::|PublicID/PublicID.2.11| XML-PARSER::|PublicID/PublicID.2.13|
                          XML-PARSER::|PublicID/PublicID.2.14| XML-PARSER::|PublicID/PublicID.2.4|
                          XML-PARSER::|PublicID/PublicID.2.5| XML-PARSER::|PublicID/PublicID.2.6|
                          XML-PARSER::|PublicID/PublicID.2.8| XML-PARSER::|PublicID/PublicID.2.9| XML-PARSER::|PublicID/start.1|))
                        (SETF XML-PARSER::*QUOTE-TOKEN* (OR XML-PARSER::*QUOTE-TOKEN* T))
                        (XML-PARSER::|PublicID/start.1| INDEX)
                        (SETF *ATN-NODE NIL)
                        (%ATN-TRACE " [***/~a failed @ ~s." 'XML-PARSER::|PublicID| INDEX)
                        (FAIL INDEX)))))
      (WARN "recursive grammar: ~s @ position ~s: ~s" 'XML-PARSER::|PublicID| INDEX *ATN-STACK)))
(SETF (GET 'XML-PARSER::|Document| :PRODUCTION) "
{1 } Document ::= Prolog Root MiscSequence?")
(SETF (GET 'XML-PARSER::|Root| :PRODUCTION) "
     Root ::= Element")
(SETF (GET 'XML-PARSER::|Names| :PRODUCTION) "
{6 } Names ::= NCName (S Names)?")
(SETF (GET 'XML-PARSER::|Nmtokens| :PRODUCTION) "
{8 } Nmtokens ::= Nmtoken (S Nmtokens)?")
(SETF (GET 'XML-PARSER::|EntityValue| :PRODUCTION) "
{9 } EntityValue ::= (('\"' EntityData? '\"') | (''' EntityData? '''))")
(SETF (GET 'XML-PARSER::|AttValue| :PRODUCTION) "
{10} AttValue ::= (('\"' AttChildSequence? '\"') | (''' AttChildSequence? '''))")
(SETF (GET 'XML-PARSER::|AttChildSequence| :PRODUCTION) "
     AttChildSequence ::= AttChild AttChildSequence?")
(SETF (GET 'XML-PARSER::|AttChild| :PRODUCTION) "
     AttChild ::= (AttCharData | Reference | ParsedReference)")
(SETF (GET 'XML-PARSER::|DefaultAttValue| :PRODUCTION) "
     DefaultAttValue ::= (('\"' DefaultAttChildSequence? '\"') | ('''
                                                                DefaultAttChildSequence?
                                                                '''))")
(SETF (GET 'XML-PARSER::|DefaultAttChildSequence| :PRODUCTION) "
     DefaultAttChildSequence ::= DefaultAttChild DefaultAttChildSequence?")
(SETF (GET 'XML-PARSER::|DefaultAttChild| :PRODUCTION) "
     DefaultAttChild ::= (DefaultAttCharData | Reference | ParsedReference)")
(SETF (GET 'XML-PARSER::|SystemLiteral| :PRODUCTION) "
{11} SystemLiteral ::= (('\"' SystemCharData? '\"') | (''' SystemCharData? '''))")
(SETF (GET 'XML-PARSER::|PubidLiteral| :PRODUCTION) "
{12} PubidLiteral ::= (('\"' PubidCharData? '\"') | (''' PubidCharData? '''))")
(SETF (GET 'XML-PARSER::|Comment| :PRODUCTION) "
{15} Comment ::= '<!--' CommentCharData? '-->'")
(SETF (GET 'XML-PARSER::|Pi| :PRODUCTION) "
{16} Pi ::= '<?' PiTarget (S PiCharData?)? '?>'")
(SETF (GET 'XML-PARSER::|CDSect| :PRODUCTION) "
{18} CDSect ::= CDStart CDataCharData? CDEnd")
(SETF (GET 'XML-PARSER::|Prolog| :PRODUCTION) "
{22} Prolog ::= XMLDecl? MiscSequence? DoctypeProlog?")
(SETF (GET 'XML-PARSER::|DoctypeProlog| :PRODUCTION) "
     DoctypeProlog ::= DoctypeDecl MiscSequence?")
(SETF (GET 'XML-PARSER::|XMLDecl| :PRODUCTION) "
{23} XMLDecl ::= '<?xml' VersionInfo EncodingDecl? SDDecl? S* '?>'")
(SETF (GET 'XML-PARSER::|VersionInfo| :PRODUCTION) "
{24} VersionInfo ::= S+ version Eq ((('\"' VersionNumCharData '\"') | ('''
                                                                     VersionNumCharData
                                                                     ''')))")
(SETF (GET 'XML-PARSER::|Eq| :PRODUCTION) "
{25} Eq ::= S* '=' S*")
(SETF (GET 'XML-PARSER::|MiscSequence| :PRODUCTION) "
     MiscSequence ::= Misc MiscSequence?")
(SETF (GET 'XML-PARSER::|Misc| :PRODUCTION) "
{27} Misc ::= (Comment | Pi | S+)")
(SETF (GET 'XML-PARSER::|DoctypeDecl| :PRODUCTION) "
{28} DoctypeDecl ::= '<!DOCTYPE' S+ QName (S
                                           ExternalID)? S* ('['
                                                            IntSubsetDecl*
                                                            ']'
                                                            S*)? '>'")
(SETF (GET 'XML-PARSER::|IntSubsetDecl| :PRODUCTION) "
     IntSubsetDecl ::= (DeclSep | MarkupDecl)")
(SETF (GET 'XML-PARSER::|DeclSep| :PRODUCTION) "
{28a} DeclSep ::= (S+ | PEReference | ParsedExtSubset)")
(SETF (GET 'XML-PARSER::|MarkupDecl| :PRODUCTION) "
{29} MarkupDecl ::= (ElementDecl | AttlistDecl | EntityDecl | NotationDecl | Pi | Comment)")
(SETF (GET 'XML-PARSER::|ExtSubset| :PRODUCTION) "
{30} ExtSubset ::= TextDecl? ExtSubsetDecl*")
(SETF (GET 'XML-PARSER::|ExtSubsetDecl| :PRODUCTION) "
{31} ExtSubsetDecl ::= (MarkupDecl | ConditionalSect | DeclSep)")
(SETF (GET 'XML-PARSER::|SDDecl| :PRODUCTION) "
{32} SDDecl ::= S+ standalone Eq ((('\"' YesOrNo '\"') | (''' YesOrNo ''')))")
(SETF (GET 'XML-PARSER::|Element| :PRODUCTION) "
{39} Element ::= STag (('/>' | ('>' Content* ETag)))")
(SETF (GET 'XML-PARSER::|STag| :PRODUCTION) "
{40} STag ::= '<' QName AttributeSequence? S*")
(SETF (GET 'XML-PARSER::|AttributeSequence| :PRODUCTION) "
     AttributeSequence ::= Attribute AttributeSequence?")
(SETF (GET 'XML-PARSER::|Attribute| :PRODUCTION) "
{41} Attribute ::= S+ QName Eq AttValue")
(SETF (GET 'XML-PARSER::|ETag| :PRODUCTION) "
{42} ETag ::= '</' QName S* '>'")
(SETF (GET 'XML-PARSER::|Content| :PRODUCTION) "
{43} Content ::= (CharData | Element | Comment | Pi | CDSect | Reference | ParsedReference)")
(SETF (GET 'XML-PARSER::|ElementDecl| :PRODUCTION) "
{45} ElementDecl ::= '<!ELEMENT' S+ QName S+ ContentSpec S* '>'")
(SETF (GET 'XML-PARSER::|ContentSpec| :PRODUCTION) "
{46} ContentSpec ::= (EMPTY | ANY | Mixed | Children)")
(SETF (GET 'XML-PARSER::|Children| :PRODUCTION) "
{47} Children ::= ChoiceOrSeq Cardinality?")
(SETF (GET 'XML-PARSER::|Cp| :PRODUCTION) "
{48} Cp ::= ((QName | ChoiceOrSeq)) Cardinality?")
(SETF (GET 'XML-PARSER::|ChoiceOrSeq| :PRODUCTION) "
     ChoiceOrSeq ::= '(' S* Cp ((Choice | Seq))? S* ')'")
(SETF (GET 'XML-PARSER::|Choice| :PRODUCTION) "
{49} Choice ::= (S* '|' S* Cp)+")
(SETF (GET 'XML-PARSER::|Seq| :PRODUCTION) "
{50} Seq ::= (S* ',' S* Cp)+")
(SETF (GET 'XML-PARSER::|Mixed| :PRODUCTION) "
{51} Mixed ::= (('(' S* PCDATA (S* '|' S* QName)* S* ')'
                 MixedCardinality) | ('(' S* PCDATA S* ')'))")
(SETF (GET 'XML-PARSER::|AttlistDecl| :PRODUCTION) "
{52} AttlistDecl ::= '<!ATTLIST' S+ QName AttDefSequence? S* '>'")
(SETF (GET 'XML-PARSER::|AttDefSequence| :PRODUCTION) "
     AttDefSequence ::= AttDef AttDefSequence?")
(SETF (GET 'XML-PARSER::|AttDef| :PRODUCTION) "
{53} AttDef ::= S+ QName S+ AttType S+ DefaultDecl")
(SETF (GET 'XML-PARSER::|AttType| :PRODUCTION) "
{54} AttType ::= (StringType | TokenizedType | EnumeratedType)")
(SETF (GET 'XML-PARSER::|EnumeratedType| :PRODUCTION) "
{57} EnumeratedType ::= (NotationType | Enumeration)")
(SETF (GET 'XML-PARSER::|NotationType| :PRODUCTION) "
{58} NotationType ::= NOTATION S+ '(' S* NotationTypeSequence S* ')'")
(SETF (GET 'XML-PARSER::|NotationTypeSequence| :PRODUCTION) "
     NotationTypeSequence ::= NCName (S* '|' S* NotationTypeSequence)?")
(SETF (GET 'XML-PARSER::|Enumeration| :PRODUCTION) "
{59} Enumeration ::= '(' EnumerationSequence S* ')'")
(SETF (GET 'XML-PARSER::|EnumerationSequence| :PRODUCTION) "
     EnumerationSequence ::= S* Nmtoken (S* '|' EnumerationSequence)?")
(SETF (GET 'XML-PARSER::|DefaultDecl| :PRODUCTION) "
{60} DefaultDecl ::= (REQUIRED | IMPLIED | ((FIXED S)? DefaultAttValue))")
(SETF (GET 'XML-PARSER::|ConditionalSect| :PRODUCTION) "
{61} ConditionalSect ::= (IncludeSect | IgnoreSect | NamedConditionalSect)")
(SETF (GET 'XML-PARSER::|IncludeSect| :PRODUCTION) "
{62} IncludeSect ::= '<![' S* INCLUDE S* '[' ExtSubsetDecl* ']]>'")
(SETF (GET 'XML-PARSER::|IgnoreSect| :PRODUCTION) "
{63} IgnoreSect ::= '<![' S* IGNORE S* '[' IgnoreSectContents? ']]>'")
(SETF (GET 'XML-PARSER::|IgnoreSectContents| :PRODUCTION) "
{64} IgnoreSectContents ::= Ignore IgnoreSectContents?")
(SETF (GET 'XML-PARSER::|Ignore| :PRODUCTION) "
{65} Ignore ::= (IgnoreCData | ('<![' IgnoreSectContents? ']]>'))")
(SETF (GET 'XML-PARSER::|NamedConditionalSect| :PRODUCTION) "
     NamedConditionalSect ::= '<![' S* PEReference S* '[' ExtSubsetDecl* ']]>'")
(SETF (GET 'XML-PARSER::|CharRef| :PRODUCTION) "
{66} CharRef ::= (('&#' Number ';') | ('&#x' HexNumber ';'))")
(SETF (GET 'XML-PARSER::|Reference| :PRODUCTION) "
{67} Reference ::= (EntityRef | CharRef)")
(SETF (GET 'XML-PARSER::|EntityRef| :PRODUCTION) "
{68} EntityRef ::= '&' NCName ';'")
(SETF (GET 'XML-PARSER::|PEReference| :PRODUCTION) "
{69} PEReference ::= '%' NCName ';'")
(SETF (GET 'XML-PARSER::|EntityDecl| :PRODUCTION) "
{70} EntityDecl ::= '<!ENTITY' S+ ((GEDecl | PEDecl))")
(SETF (GET 'XML-PARSER::|GEDecl| :PRODUCTION) "
{71} GEDecl ::= NCName S+ EntityDef S* '>'")
(SETF (GET 'XML-PARSER::|PEDecl| :PRODUCTION) "
{72} PEDecl ::= '%' S+ NCName S+ PEDef S* '>'")
(SETF (GET 'XML-PARSER::|EntityDef| :PRODUCTION) "
{73} EntityDef ::= (EntityValue | (ExternalID NDataDecl?))")
(SETF (GET 'XML-PARSER::|PEDef| :PRODUCTION) "
{74} PEDef ::= (EntityValue | ExternalID)")
(SETF (GET 'XML-PARSER::|ExternalID| :PRODUCTION) "
{75} ExternalID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC
                                                  S+
                                                  PubidLiteral
                                                  S+
                                                  SystemLiteral))")
(SETF (GET 'XML-PARSER::|NDataDecl| :PRODUCTION) "
{76} NDataDecl ::= S+ NDATA S+ NCName")
(SETF (GET 'XML-PARSER::|TextDecl| :PRODUCTION) "
{77} TextDecl ::= '<?xml' VersionInfo? EncodingDecl S* '?>'")
(SETF (GET 'XML-PARSER::|ExtParsedEnt| :PRODUCTION) "
{78} ExtParsedEnt ::= TextDecl? Content*")
(SETF (GET 'XML-PARSER::|EncodingDecl| :PRODUCTION) "
{80} EncodingDecl ::= S+ encoding Eq ((('\"'
                                        EncNameCharData
                                        '\"') | (''' EncNameCharData ''')))")
(SETF (GET 'XML-PARSER::|NotationDecl| :PRODUCTION) "
{82} NotationDecl ::= '<!NOTATION' S+ NCName S+ PublicID S* '>'")
(SETF (GET 'XML-PARSER::|PublicID| :PRODUCTION) "
{83} PublicID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC
                                                S+
                                                PubidLiteral
                                                (S+ SystemLiteral)?))")
(DEFUN XML-PARSER::|Document-Parser| (*ATN-INPUT &KEY ((:TRACE *ATN-TRACE*) *ATN-TRACE*)
                                      ((:TRACE-NETS *ATN-TRACE-NETS*) *ATN-TRACE-NETS*)
                                      ((:START-NAME *ATN-START-NAME) 'XML-PARSER::|Document|) ((:MODE *ATN-MODE) :MULTIPLE)
                                      ((:REDUCE *ATN-REDUCE*) T) ((:REGISTER-WORDS *ATN-REGISTER-WORDS) NIL) &ALLOW-OTHER-KEYS
                                      &AUX)
  "// generated 2010.03.07T23:43:13 based on \"xml:bnf;xml-grammar.bnf\" from 2006.08.09T22:18:05.
/*
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this is the BNF for XML
  it is derived from <a href='http://www.w3.org/TR/2000/REC-xml-20001006'>REC-xml-20001006</a>.
  it is the input bnf for <a href='file://xml/code/xparser/xml-parser.lisp'>xml-parser.lisp</a>.
  </p>
  <p>
  nb. the production numbers correspond to those present in the recommendation.
  this formulation differs from the literal text of the recommendation in numerous regards.
  none of these differences is believed to affect the conformance of the resulting parser.
  <ul>
  <li>the grammar is modified to accommodate namespaces.</li>
  <li>the grammar is <em>not</em> complete. numerous terms, for example 'NCName' are not
      defined. the parser treats these terms as categories, for which predicates are to be
      defined.</li>
  <li>names have been edited (wrt capitalization).
      for example, PI -> Pi as the former is a constant in lisp.</li>
  <li>some productions have been reordered, and some non-terminals and terminals have been
      reclassified to ease the parsing.
      in particular, by extending tokens and rewriting entity definition and notation
      rules, it was possible to eliminate the need to backup - eg the Element production -
      this could well be pushed further</li>
  <li>the productions are, for the most part, 'post-entity-expansion'. where references
      are includes, note that the parser has been tested where these are placeholders for
      expanded references.</li>
  <li>some repeated/optional components have been reconstructed as sequences. eg:
      Misc* ==>  MiscSequence and MiscSequence ::= Misc MiscSequence?.</li>
  <li>some of the character data productions do not distinguish content by
      name (eg. CharData) for both element and cdata character content. this because
      the lexical readers already terminate tokens where appropriate.</li>
  <li>the distinction between NCName, Qname, and NameCharData.</li>
  <li>S == whitespace is a lexical token in itself, which may appear multiply when crossing an
      entity border, thus the formulations S+ and S*.</li>
  </ul></p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='&copy'
            href='file://xml/sysdcl.lisp' />
 <COPYRIGHT YEAR='2000' AUTHOR='w3c' MARK='&copy'
            smtp='site-policy@w3.org'
            href='file://xml/W3C-copyrightsoft-19980720.html'>
  Copyright &copy; 2000 <a href='http://www.w3.org/'>World Wide Web Consortium</a>,
   (<a href='http://www.lcs.mit.edu/'>Massachusetts Institute of Technology</a>,
    <a href='http://www.inria.fr/'>Institut National de Recherche en Informatique et en Automatique</a>,
    <a href='http://www.keio.ac.jp/'>Keio University</a>).
   All Rights Reserved. http://www.w3.org/Consortium/Legal/
  </COPYRIGHT>
 </DOCUMENTATION>
*/

[[1]]  Document ::= Prolog Root MiscSequence?
       Root ::= Element
//     implemented as category predicates
//     [[2]]  Char ::=  #x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF]
//     [[3]]  S ::= (#x20 | #x9 | #xD | #xA)+
//     [[4]]  NameChar ::=Letter | Digit | '.' | '-' | '_' | ':' | CombiningChar | Extender
//     [[5]]  Name ::= (Letter | '_' | ':') (NameChar)*
//     QNames data is implemented as categories in order to avoid ambiguous parses,
//     they exist as production in order to get an entry in the wfst.
//     Prefix ::= NCName
//     LocalPart ::= NCName
//     QName ::= ( Prefix ':') ? LocalPart
       QName ::= QNameCharData
[[6]]  Names ::= NCName (S Names)?
[[7]]  Nmtoken ::= NameCharData
[[8]]  Nmtokens ::= Nmtoken (S Nmtokens)?
[[9]]  EntityValue ::= ('\"' EntityData? '\"') | ('\\'' EntityData? '\\'')
       // as the entity references are expanded, the data only is left to parse.
       // EntityValue ::= ('\"' EntityChildSequence? '\"') | ('\\'' EntityChildSequence? '\\'')
       // EntityChildSequence ::= EntityChild EntityChildSequence?
       // EntityChild ::= EntityCharData | PEReference | Reference
[[10]] AttValue ::= ('\"' AttChildSequence? '\"' ) | ('\\'' AttChildSequence? '\\'')
       AttChildSequence ::= AttChild AttChildSequence?
       AttChild ::= AttCharData | Reference | ParsedReference
       DefaultAttValue ::= ('\"' DefaultAttChildSequence? '\"' ) | ('\\'' DefaultAttChildSequence? '\\'')
       DefaultAttChildSequence ::= DefaultAttChild DefaultAttChildSequence?
       DefaultAttChild ::= DefaultAttCharData | Reference | ParsedReference
[[11]] SystemLiteral ::= ('\"' SystemCharData? '\"') | ('\\'' SystemCharData? '\\'')
[[12]] PubidLiteral ::= ('\"' PubidCharData? '\"') | ('\\'' PubidCharData? '\\'')
//     [[13]] PubidChar ::= #x20 | #xD | #xA | [a-zA-Z0-9] | [-'()+,./:=?;!*#@$_%]
//     [[14]] CharData ::= [^<&]* - ([^<&]* ']]>' [^<&]*)
[[15]] Comment ::= '<!--' CommentCharData? '-->'
//     when data appears, then with a preceeding space. note that just space is ok.
[[16]] Pi ::= '<?' PiTarget (S PiCharData? )? '?>'
//     [[17]] PITarget ::= NCName - (('X' | 'x') ('M' | 'm') ('L' | 'l'))
[[18]] CDSect ::= CDStart CDataCharData? CDEnd
[[19]] CDStart ::= '<![CDATA['
//     [[20]] CData ::= (Char* - (Char* ']]>' Char*)
[[21]] CDEnd ::= ']]>'
[[22]] Prolog ::= XMLDecl? MiscSequence? DoctypeProlog?
       DoctypeProlog ::= DoctypeDecl MiscSequence?
[[23]] XMLDecl ::= '<?xml' VersionInfo EncodingDecl? SDDecl? S* '?>'
[[24]] VersionInfo ::= S+ version Eq ( ('\"' VersionNumCharData '\"') | ('\\'' VersionNumCharData '\\'') )
[[25]] Eq ::= S* '=' S*
//     [[26]] VersionNum ::= ([a-zA-Z0-9_.:] | '-')+
       MiscSequence ::= Misc MiscSequence?
[[27]] Misc ::= Comment | Pi | S+
[[28]] DoctypeDecl ::= '<!DOCTYPE' S+ QName (S ExternalID)? S* ('[' IntSubsetDecl* ']' S* )? '>'
       // IntSubsetDeclSequence ::= IntSubsetDecl+
       IntSubsetDecl ::= DeclSep | MarkupDecl
[[28a]] DeclSep ::= S+ | PEReference | ParsedExtSubset
[[29]] MarkupDecl ::= ElementDecl | AttlistDecl | EntityDecl | NotationDecl | Pi | Comment
[[30]] ExtSubset ::= TextDecl? ExtSubsetDecl*
       // ExtSubset ::= TextDecl? ExtSubsetDeclSequence?
       // ExtSubsetDeclSequence ::= ExtSubsetDecl ExtSubsetDeclSequence?
       // ExtSubsetDeclSequence ::= ExtSubsetDecl+
[[31]] ExtSubsetDecl ::= MarkupDecl | ConditionalSect | DeclSep
[[32]] SDDecl ::= S+ standalone Eq ( ('\"' YesOrNo '\"') | ('\\'' YesOrNo '\\'') )
       YesOrNo ::= yes | no
//     [[33]] ... [[38]] ?
[[39]] Element ::= STag ( '/>' | ( '>' Content* ETag ) )
       // this formulation overflows the stack for large content. for example, the xml rec
       // with reduction disabled generates an 800+ sequence for the character table.
       // Element ::= STag ( '/>' | ( '>' ContentSequence? ETag ) )
       // ContentSequence ::= Content ContentSequence?
       // the original formulation intriduced ambiguity which required unrestricted look-ahead
       // over the tag content
       // Element ::= EmptyElemTag | ( STag ContentSequence? ETag )
[[40]] STag ::= '<' QName AttributeSequence? S*
       AttributeSequence ::= Attribute AttributeSequence?
       // STag ::= '<' QName AttributeSequence? S* '>'
[[41]] Attribute ::= S+ QName Eq AttValue
[[42]] ETag ::= '</' QName S* '>'
//     in content, try to parse CharData first so that tag parsers are active
//     only once the tag start has been recognized. 
[[43]] Content ::= CharData | Element | Comment | Pi | CDSect | Reference | ParsedReference
       // Content ::= CharData | Element | Reference | CDSect | Pi | Comment
       // Element does not now require this
//     [[44]] EmptyElemTag ::= '<' QName AttributeSequence? S* '/>'
[[45]] ElementDecl ::= '<!ELEMENT' S+ QName S+ ContentSpec S* '>'
       //   the content spec is expressed without whitespace since it is stripped there
[[46]] ContentSpec ::= EMPTY | ANY | Mixed | Children
       // rewritten to eliminate otherwise unbounded look-ahead
[[47]] Children ::= ChoiceOrSeq Cardinality?
[[48]] Cp ::= ( QName | ChoiceOrSeq ) Cardinality?
       ChoiceOrSeq ::= '(' S* Cp ( Choice | Seq )? S* ')'
[[49]] Choice ::= ( S* '|' S* Cp )+
[[50]] Seq    ::= ( S* ',' S* Cp )+
       // Children ::= (Choice | Seq) Cardinality?
       // Cp ::= ( QName | Choice | Seq) Cardinality?
       // Choice ::= '(' S* Cp ( S* '|' S* Cp )+ S* ')'
       // Seq    ::= '(' S* Cp ( S* ',' S* Cp )* S* ')'
[[51]] Mixed ::= ( '(' S* PCDATA ( S* '|' S* QName )* S* ')' MixedCardinality )
               | ( '(' S* PCDATA S* ')' )
       Cardinality ::= '?' | '+' | '*'
       MixedCardinality ::= '*'
[[52]] AttlistDecl ::= '<!ATTLIST' S+ QName AttDefSequence? S* '>'
       AttDefSequence ::= AttDef AttDefSequence?
[[53]] AttDef ::= S+ QName S+ AttType S+ DefaultDecl
[[54]] AttType ::= StringType | TokenizedType | EnumeratedType
[[55]] StringType ::= CDATA
[[56]] TokenizedType ::= ID | IDREF | IDREFS | ENTITY | ENTITIES | NMTOKEN | NMTOKENS
[[57]] EnumeratedType ::= NotationType | Enumeration
[[58]] NotationType ::= NOTATION S+ '(' S* NotationTypeSequence S* ')' 
       NotationTypeSequence ::= NCName (S*  '|' S* NotationTypeSequence )?
//     the spec says Nmtoken, but the conformance tests say character sequence
//     Enumeration ::= '(' Nmtoken ( '|' Nmtoken)* ')'
[[59]] Enumeration ::= '(' EnumerationSequence S* ')'
       EnumerationSequence ::= S* Nmtoken ( S* '|' EnumerationSequence )?
[[60]] DefaultDecl ::= REQUIRED | IMPLIED | (( FIXED S)? DefaultAttValue)
[[61]] ConditionalSect ::= IncludeSect | IgnoreSect | NamedConditionalSect
       // ConditionalSect ::= IncludeSect | IgnoreSect
[[62]] IncludeSect ::= '<![' S* INCLUDE S* '[' ExtSubsetDecl* ']]>'
       // IncludeSect ::= '<![' S* INCLUDE S* '[' ExtSubsetDecl* ']]>'
[[63]] IgnoreSect ::= '<![' S* IGNORE S* '[' IgnoreSectContents? ']]>'
[[64]] IgnoreSectContents ::= Ignore IgnoreSectContents?
[[65]] Ignore ::= IgnoreCData |  ('<![' IgnoreSectContents? ']]>' )
       NamedConditionalSect ::= '<![' S* PEReference S* '[' ExtSubsetDecl* ']]>'
//     NamedConditionalSect ::= '<![' S* PEReference S* '[' ExtSubsetDecl* ']]>'
[[66]] CharRef ::= ('&#' Number ';') | ( '&#x' HexNumber ';' )
[[67]] Reference ::= EntityRef | CharRef
[[68]] EntityRef ::= '&' NCName ';'
[[69]] PEReference ::= '%' NCName ';'
[[70]] EntityDecl ::= '<!ENTITY' S+ ( GEDecl | PEDecl )
//     EntityDecl ::= GEDecl | PEDecl
[[71]] GEDecl ::= NCName S+ EntityDef S* '>'
//     GEDecl ::= '<!ENTITY' S+ NCName S+ EntityDef S* '>'
[[72]] PEDecl ::= '%' S+ NCName S+ PEDef S* '>'
       // PEDecl ::= '<!ENTITY' S+ '%' S+ NCName S+ PEDef S* '>'
[[73]] EntityDef ::= EntityValue | (ExternalID NDataDecl?)
[[74]] PEDef ::= EntityValue | ExternalID
[[75]] ExternalID ::= ( SYSTEM S+ SystemLiteral )
                    | ( PUBLIC S+ PubidLiteral S+ SystemLiteral )
[[76]] NDataDecl ::=  S+ NDATA S+ NCName
[[77]] TextDecl ::= '<?xml' VersionInfo? EncodingDecl S* '?>'
[[78]] ExtParsedEnt ::= TextDecl? Content*
//     [[79]]  eliminated ExtPE ::= TextDecl? ExtSubsetDecl*
[[80]] EncodingDecl ::=  S+ encoding Eq ( ('\"' EncNameCharData '\"') | ( '\\'' EncNameCharData '\\'' ) )
//     [[81]] EncName ::= [A-Za-z] ([A-Za-z0-9._] | '-')*
[[82]] NotationDecl ::= '<!NOTATION'  S+ NCName S+ PublicID S* '>'
//     NotationDecl ::= '<!NOTATION'  S+ NCName S+ (ExternalID |  PublicID) S* '>'
[[83]] PublicID  ::= ( SYSTEM S+ SystemLiteral )
                   | ( PUBLIC S+ PubidLiteral (S+ SystemLiteral)? )
//     PublicID ::= PUBLIC S+ PubidLiteral




"
  (DECLARE (SPECIAL *ATN-REDUCE* *ATN-MODE *ATN-INPUT))
  (LET ((*ATN-LEVEL 0)
        (*ATN-STACK '(XML-PARSER::|Document-Parser|))
        (*ATN-NODE NIL)
        (*ATN-PROPERTIES NIL)
        (*ATN-CLASS NIL)
        (XML-PARSER::|Document-INDEX| -1)
        (XML-PARSER::|Root-INDEX| -1)
        (XML-PARSER::|Names-INDEX| -1)
        (XML-PARSER::|Nmtokens-INDEX| -1)
        (XML-PARSER::|EntityValue-INDEX| -1)
        (XML-PARSER::|AttValue-INDEX| -1)
        (XML-PARSER::|AttChildSequence-INDEX| -1)
        (XML-PARSER::|AttChild-INDEX| -1)
        (XML-PARSER::|DefaultAttValue-INDEX| -1)
        (XML-PARSER::|DefaultAttChildSequence-INDEX| -1)
        (XML-PARSER::|DefaultAttChild-INDEX| -1)
        (XML-PARSER::|SystemLiteral-INDEX| -1)
        (XML-PARSER::|PubidLiteral-INDEX| -1)
        (XML-PARSER::|Comment-INDEX| -1)
        (XML-PARSER::|Pi-INDEX| -1)
        (XML-PARSER::|CDSect-INDEX| -1)
        (XML-PARSER::|Prolog-INDEX| -1)
        (XML-PARSER::|DoctypeProlog-INDEX| -1)
        (XML-PARSER::|XMLDecl-INDEX| -1)
        (XML-PARSER::|VersionInfo-INDEX| -1)
        (XML-PARSER::|Eq-INDEX| -1)
        (XML-PARSER::|MiscSequence-INDEX| -1)
        (XML-PARSER::|Misc-INDEX| -1)
        (XML-PARSER::|DoctypeDecl-INDEX| -1)
        (XML-PARSER::|IntSubsetDecl-INDEX| -1)
        (XML-PARSER::|DeclSep-INDEX| -1)
        (XML-PARSER::|MarkupDecl-INDEX| -1)
        (XML-PARSER::|ExtSubset-INDEX| -1)
        (XML-PARSER::|ExtSubsetDecl-INDEX| -1)
        (XML-PARSER::|SDDecl-INDEX| -1)
        (XML-PARSER::|Element-INDEX| -1)
        (XML-PARSER::|STag-INDEX| -1)
        (XML-PARSER::|AttributeSequence-INDEX| -1)
        (XML-PARSER::|Attribute-INDEX| -1)
        (XML-PARSER::|ETag-INDEX| -1)
        (XML-PARSER::|Content-INDEX| -1)
        (XML-PARSER::|ElementDecl-INDEX| -1)
        (XML-PARSER::|ContentSpec-INDEX| -1)
        (XML-PARSER::|Children-INDEX| -1)
        (XML-PARSER::|Cp-INDEX| -1)
        (XML-PARSER::|ChoiceOrSeq-INDEX| -1)
        (XML-PARSER::|Choice-INDEX| -1)
        (XML-PARSER::|Seq-INDEX| -1)
        (XML-PARSER::|Mixed-INDEX| -1)
        (XML-PARSER::|AttlistDecl-INDEX| -1)
        (XML-PARSER::|AttDefSequence-INDEX| -1)
        (XML-PARSER::|AttDef-INDEX| -1)
        (XML-PARSER::|AttType-INDEX| -1)
        (XML-PARSER::|EnumeratedType-INDEX| -1)
        (XML-PARSER::|NotationType-INDEX| -1)
        (XML-PARSER::|NotationTypeSequence-INDEX| -1)
        (XML-PARSER::|Enumeration-INDEX| -1)
        (XML-PARSER::|EnumerationSequence-INDEX| -1)
        (XML-PARSER::|DefaultDecl-INDEX| -1)
        (XML-PARSER::|ConditionalSect-INDEX| -1)
        (XML-PARSER::|IncludeSect-INDEX| -1)
        (XML-PARSER::|IgnoreSect-INDEX| -1)
        (XML-PARSER::|IgnoreSectContents-INDEX| -1)
        (XML-PARSER::|Ignore-INDEX| -1)
        (XML-PARSER::|NamedConditionalSect-INDEX| -1)
        (XML-PARSER::|CharRef-INDEX| -1)
        (XML-PARSER::|Reference-INDEX| -1)
        (XML-PARSER::|EntityRef-INDEX| -1)
        (XML-PARSER::|PEReference-INDEX| -1)
        (XML-PARSER::|EntityDecl-INDEX| -1)
        (XML-PARSER::|GEDecl-INDEX| -1)
        (XML-PARSER::|PEDecl-INDEX| -1)
        (XML-PARSER::|EntityDef-INDEX| -1)
        (XML-PARSER::|PEDef-INDEX| -1)
        (XML-PARSER::|ExternalID-INDEX| -1)
        (XML-PARSER::|NDataDecl-INDEX| -1)
        (XML-PARSER::|TextDecl-INDEX| -1)
        (XML-PARSER::|ExtParsedEnt-INDEX| -1)
        (XML-PARSER::|EncodingDecl-INDEX| -1)
        (XML-PARSER::|NotationDecl-INDEX| -1)
        (XML-PARSER::|PublicID-INDEX| -1)
        (ATN-NET-NAMES
         '(XML-PARSER::|Document| XML-PARSER::|Root| XML-PARSER::|Names| XML-PARSER::|Nmtokens| XML-PARSER::|EntityValue|
           XML-PARSER::|AttValue| XML-PARSER::|AttChildSequence| XML-PARSER::|AttChild| XML-PARSER::|DefaultAttValue|
           XML-PARSER::|DefaultAttChildSequence| XML-PARSER::|DefaultAttChild| XML-PARSER::|SystemLiteral|
           XML-PARSER::|PubidLiteral| XML-PARSER::|Comment| XML-PARSER::|Pi| XML-PARSER::|CDSect| XML-PARSER::|Prolog|
           XML-PARSER::|DoctypeProlog| XML-PARSER::|XMLDecl| XML-PARSER::|VersionInfo| XML-PARSER::|Eq| XML-PARSER::|MiscSequence|
           XML-PARSER::|Misc| XML-PARSER::|DoctypeDecl| XML-PARSER::|IntSubsetDecl| XML-PARSER::|DeclSep| XML-PARSER::|MarkupDecl|
           XML-PARSER::|ExtSubset| XML-PARSER::|ExtSubsetDecl| XML-PARSER::|SDDecl| XML-PARSER::|Element| XML-PARSER::|STag|
           XML-PARSER::|AttributeSequence| XML-PARSER::|Attribute| XML-PARSER::|ETag| XML-PARSER::|Content|
           XML-PARSER::|ElementDecl| XML-PARSER::|ContentSpec| XML-PARSER::|Children| XML-PARSER::|Cp| XML-PARSER::|ChoiceOrSeq|
           XML-PARSER::|Choice| XML-PARSER::|Seq| XML-PARSER::|Mixed| XML-PARSER::|AttlistDecl| XML-PARSER::|AttDefSequence|
           XML-PARSER::|AttDef| XML-PARSER::|AttType| XML-PARSER::|EnumeratedType| XML-PARSER::|NotationType|
           XML-PARSER::|NotationTypeSequence| XML-PARSER::|Enumeration| XML-PARSER::|EnumerationSequence| XML-PARSER::|DefaultDecl|
           XML-PARSER::|ConditionalSect| XML-PARSER::|IncludeSect| XML-PARSER::|IgnoreSect| XML-PARSER::|IgnoreSectContents|
           XML-PARSER::|Ignore| XML-PARSER::|NamedConditionalSect| XML-PARSER::|CharRef| XML-PARSER::|Reference|
           XML-PARSER::|EntityRef| XML-PARSER::|PEReference| XML-PARSER::|EntityDecl| XML-PARSER::|GEDecl| XML-PARSER::|PEDecl|
           XML-PARSER::|EntityDef| XML-PARSER::|PEDef| XML-PARSER::|ExternalID| XML-PARSER::|NDataDecl| XML-PARSER::|TextDecl|
           XML-PARSER::|ExtParsedEnt| XML-PARSER::|EncodingDecl| XML-PARSER::|NotationDecl| XML-PARSER::|PublicID|)))
    (DECLARE
     (SPECIAL XML-PARSER::|Document-INDEX| XML-PARSER::|Root-INDEX| XML-PARSER::|Names-INDEX| XML-PARSER::|Nmtokens-INDEX|
      XML-PARSER::|EntityValue-INDEX| XML-PARSER::|AttValue-INDEX| XML-PARSER::|AttChildSequence-INDEX|
      XML-PARSER::|AttChild-INDEX| XML-PARSER::|DefaultAttValue-INDEX| XML-PARSER::|DefaultAttChildSequence-INDEX|
      XML-PARSER::|DefaultAttChild-INDEX| XML-PARSER::|SystemLiteral-INDEX| XML-PARSER::|PubidLiteral-INDEX|
      XML-PARSER::|Comment-INDEX| XML-PARSER::|Pi-INDEX| XML-PARSER::|CDSect-INDEX| XML-PARSER::|Prolog-INDEX|
      XML-PARSER::|DoctypeProlog-INDEX| XML-PARSER::|XMLDecl-INDEX| XML-PARSER::|VersionInfo-INDEX| XML-PARSER::|Eq-INDEX|
      XML-PARSER::|MiscSequence-INDEX| XML-PARSER::|Misc-INDEX| XML-PARSER::|DoctypeDecl-INDEX| XML-PARSER::|IntSubsetDecl-INDEX|
      XML-PARSER::|DeclSep-INDEX| XML-PARSER::|MarkupDecl-INDEX| XML-PARSER::|ExtSubset-INDEX| XML-PARSER::|ExtSubsetDecl-INDEX|
      XML-PARSER::|SDDecl-INDEX| XML-PARSER::|Element-INDEX| XML-PARSER::|STag-INDEX| XML-PARSER::|AttributeSequence-INDEX|
      XML-PARSER::|Attribute-INDEX| XML-PARSER::|ETag-INDEX| XML-PARSER::|Content-INDEX| XML-PARSER::|ElementDecl-INDEX|
      XML-PARSER::|ContentSpec-INDEX| XML-PARSER::|Children-INDEX| XML-PARSER::|Cp-INDEX| XML-PARSER::|ChoiceOrSeq-INDEX|
      XML-PARSER::|Choice-INDEX| XML-PARSER::|Seq-INDEX| XML-PARSER::|Mixed-INDEX| XML-PARSER::|AttlistDecl-INDEX|
      XML-PARSER::|AttDefSequence-INDEX| XML-PARSER::|AttDef-INDEX| XML-PARSER::|AttType-INDEX| XML-PARSER::|EnumeratedType-INDEX|
      XML-PARSER::|NotationType-INDEX| XML-PARSER::|NotationTypeSequence-INDEX| XML-PARSER::|Enumeration-INDEX|
      XML-PARSER::|EnumerationSequence-INDEX| XML-PARSER::|DefaultDecl-INDEX| XML-PARSER::|ConditionalSect-INDEX|
      XML-PARSER::|IncludeSect-INDEX| XML-PARSER::|IgnoreSect-INDEX| XML-PARSER::|IgnoreSectContents-INDEX|
      XML-PARSER::|Ignore-INDEX| XML-PARSER::|NamedConditionalSect-INDEX| XML-PARSER::|CharRef-INDEX| XML-PARSER::|Reference-INDEX|
      XML-PARSER::|EntityRef-INDEX| XML-PARSER::|PEReference-INDEX| XML-PARSER::|EntityDecl-INDEX| XML-PARSER::|GEDecl-INDEX|
      XML-PARSER::|PEDecl-INDEX| XML-PARSER::|EntityDef-INDEX| XML-PARSER::|PEDef-INDEX| XML-PARSER::|ExternalID-INDEX|
      XML-PARSER::|NDataDecl-INDEX| XML-PARSER::|TextDecl-INDEX| XML-PARSER::|ExtParsedEnt-INDEX| XML-PARSER::|EncodingDecl-INDEX|
      XML-PARSER::|NotationDecl-INDEX| XML-PARSER::|PublicID-INDEX|))
    (UNLESS (FIND *ATN-START-NAME ATN-NET-NAMES)
      (ERROR "production not defined in system: ~s: ~s." *ATN-START-NAME 'XML-PARSER::|Document-Parser|))
    (UNLESS (FBOUNDP *ATN-START-NAME) (ERROR "parse function missing: ~s: ~s." *ATN-START-NAME 'XML-PARSER::|Document-Parser|))
    (HANDLER-BIND ((CONTINUABLE-PARSER-ERROR #'(LAMBDA (CONDITION) (SIGNAL CONDITION)))
                   (TERMINAL-PARSER-ERROR
                    #'(LAMBDA (CONDITION &AUX (ACTION (CONDITION-ACTION CONDITION)))
                        (ETYPECASE ACTION
                          (NULL)
                          (KEYWORD
                           (ECASE ACTION
                             (:ABORT
                              (WHEN *ATN-TRACE* (WARN "terminating parse on condition: ~a: Context ~s." CONDITION *ATN-INPUT))
                              (RETURN-FROM XML-PARSER::|Document-Parser| (VALUES NIL CONDITION NIL)))
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
                    (COND (SUCCESS
                           (RETURN-FROM XML-PARSER::|Document-Parser| (VALUES RESULT INDEX (XML-PARSER::INPUT-EOF? INDEX))))
                          (T (RETURN-FROM XML-PARSER::|Document-Parser| (VALUES NIL INDEX NIL))))))))