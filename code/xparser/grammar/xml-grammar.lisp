
(IN-PACKAGE "XML-PARSER") 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-QName|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-Nmtoken|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-YesOrNo|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-StringType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-TokenizedType|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-CDStart|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-CDEnd|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-Cardinality|)) 
(DECLAIM (FTYPE (FUNCTION (T) (VALUES T T T)) |IS-MixedCardinality|)) 
(DECLAIM (FTYPE (FUNCTION (T &KEY &ALLOW-OTHER-KEYS) (VALUES T T T)) |Document-Parser|)) 
(DEFUN |IS-QName| (ATN-PARSER::ITEM) (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (|IS-QNameCharData| ATN-PARSER::ITEM)))))
(DEFUN |IS-Nmtoken| (ATN-PARSER::ITEM) (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (|IS-NameCharData| ATN-PARSER::ITEM)))))
(DEFUN |IS-YesOrNo| (ATN-PARSER::ITEM)
  (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (|IS-yesToken| ATN-PARSER::ITEM) (|IS-noToken| ATN-PARSER::ITEM)))))
(DEFUN |IS-StringType| (ATN-PARSER::ITEM) (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (|IS-CDATAToken| ATN-PARSER::ITEM)))))
(DEFUN |IS-TokenizedType| (ATN-PARSER::ITEM)
  (%ATN-TRACE-FORM
   (AND ATN-PARSER::ITEM
        (OR (|IS-IDToken| ATN-PARSER::ITEM) (|IS-IDREFToken| ATN-PARSER::ITEM) (|IS-IDREFSToken| ATN-PARSER::ITEM)
            (|IS-ENTITYToken| ATN-PARSER::ITEM) (|IS-ENTITIESToken| ATN-PARSER::ITEM) (|IS-NMTOKENToken| ATN-PARSER::ITEM)
            (|IS-NMTOKENSToken| ATN-PARSER::ITEM)))))
(DEFUN |IS-CDStart| (ATN-PARSER::ITEM) (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (EQ ATN-PARSER::ITEM '|xml|:<![CDATA[)))))
(DEFUN |IS-CDEnd| (ATN-PARSER::ITEM) (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (EQ ATN-PARSER::ITEM '|xml|:]]>)))))
(DEFUN |IS-Cardinality| (ATN-PARSER::ITEM)
  (%ATN-TRACE-FORM
   (AND ATN-PARSER::ITEM (OR (EQ ATN-PARSER::ITEM '|xml|:?) (EQ ATN-PARSER::ITEM '|xml|:+) (EQ ATN-PARSER::ITEM '|xml|:*)))))
(DEFUN |IS-MixedCardinality| (ATN-PARSER::ITEM) (%ATN-TRACE-FORM (AND ATN-PARSER::ITEM (OR (EQ ATN-PARSER::ITEM '|xml|:*)))))
(PROGN
 (DEFVAR |Document-INDEX|)
 (DEFUN |Document| (ATN-PARSER::INDEX &AUX (|MiscSequence| NIL) (|Prolog| NIL) (|Root| NIL))
   "{1 } Document ::= Prolog Root MiscSequence?
(|MiscSequence| |Prolog| |Root|)"
   (DECLARE (SPECIAL |Document-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Document-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Document-INDEX| ATN-PARSER::INDEX)
       (LET ((|Document-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Document| *ATN-STACK))
             (*PARSETABLE* |Document-Parsetable|))
         (DECLARE (SPECIAL |Document-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Document|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Document|)
                                  (RETURN-FROM |Document| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Document| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Document.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Document.2|
                                                   (%ATN-EDGE-BLOCK (POP |Document|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Document|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Document|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|MiscSequence| |MiscSequence| '|Prolog|
                                                                                        |Prolog| '|Root| |Root|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|Document-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |MiscSequence| |Prolog| |Root|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Document|
                                                                                           (DELETE NIL
                                                                                                   (LIST |MiscSequence| |Prolog|
                                                                                                         |Root|)))
                                                                                     '|Document|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Document|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Document/Document.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Document/Document.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |Root|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Root|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |Root| ATN-PARSER::RESULT))
                                                                        (|Document/Document.2.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Root|)
                                                                        (|Document/fail.3| ATN-PARSER::INDEX)))))))
                                (|Document/Document.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Document/Document.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |MiscSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|MiscSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |MiscSequence| ATN-PARSER::RESULT))
                                                                        (|Document.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|MiscSequence|)
                                                                        (|Document.2| ATN-PARSER::INDEX)))))))
                                (|Document/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Document/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Document/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Document/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |Prolog|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Prolog|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Prolog| ATN-PARSER::RESULT))
                                                                        (|Document/Document.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Prolog|)
                                                                        (|Document/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Document.2| |Document/Document.2.4| |Document/Document.2.5|
                           |Document/fail.3| |Document/start.1|))
                         (|Document/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Document| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Document| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Root-INDEX|)
 (DEFUN |Root| (ATN-PARSER::INDEX &AUX (|Element| NIL))
   "Root ::= Element
(|Element|)"
   (DECLARE (SPECIAL |Root-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Root-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Root-INDEX| ATN-PARSER::INDEX)
       (LET ((|Root-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Root| *ATN-STACK))
             (*NAMESPACE-BINDINGS* (MAKE-DOCUMENT-NAMESPACE-BINDINGS)))
         (DECLARE (SPECIAL |Root-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Root|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Root|)
                                  (RETURN-FROM |Root| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Root| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Root.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Root.2|
                                                   (%ATN-EDGE-BLOCK (POP |Root|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Root|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Root|
                                                                                  ATN-PARSER::INDEX (LIST '|Element| |Element|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Root-Constructor|
                                                                                                       |Element|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Root| (DELETE NIL (LIST |Element|)))
                                                                                     '|Root|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Root|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Root/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Root/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Root/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Root/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |Element|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Element|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Element| ATN-PARSER::RESULT))
                                                                        (|Root.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Element|)
                                                                        (|Root/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Root.2| |Root/fail.3| |Root/start.1|))
                         (|Root/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Root| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Root| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Names-INDEX|)
 (DEFUN |Names| (ATN-PARSER::INDEX &AUX (|Names| NIL) (|NCName| NIL))
   "{6 } Names ::= NCName (S Names)?
(|Names| |NCName|)"
   (DECLARE (SPECIAL |Names-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Names-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Names-INDEX| ATN-PARSER::INDEX)
       (LET ((|Names-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Names| *ATN-STACK)))
         (DECLARE (SPECIAL |Names-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Names|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Names|)
                                  (RETURN-FROM |Names| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Names| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Names.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Names.2|
                                                   (%ATN-EDGE-BLOCK (POP |Names|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Names|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Names|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|Names| |Names| '|NCName| |NCName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Names-Constructor|
                                                                                                       |Names| |NCName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Names|
                                                                                           (DELETE NIL (LIST |Names| |NCName|)))
                                                                                     '|Names|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Names|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Names/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Names/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Names/Names.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Names/Names.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Names/Names.2.5|)
                                                                    (|Names/Names.2.5| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Names.2|) (|Names.2| ATN-PARSER::INDEX))))
                                (|Names/Names.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Names/Names.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Names/Names.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|Names/Names.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Names/Names.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |Names|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Names|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |Names| ATN-PARSER::RESULT))
                                                                        (|Names.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Names|) NIL))))))
                                (|Names/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Names/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|Names/Names.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|Names/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Names.2| |Names/fail.3| |Names/Names.2.4| |Names/Names.2.5|
                           |Names/Names.2.6| |Names/start.1|))
                         (|Names/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Names| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Names| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Nmtokens-INDEX|)
 (DEFUN |Nmtokens| (ATN-PARSER::INDEX &AUX (|Nmtoken| NIL) (|Nmtokens| NIL))
   "{8 } Nmtokens ::= Nmtoken (S Nmtokens)?
(|Nmtoken| |Nmtokens|)"
   (DECLARE (SPECIAL |Nmtokens-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Nmtokens-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Nmtokens-INDEX| ATN-PARSER::INDEX)
       (LET ((|Nmtokens-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Nmtokens| *ATN-STACK)))
         (DECLARE (SPECIAL |Nmtokens-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Nmtokens|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Nmtokens|)
                                  (RETURN-FROM |Nmtokens| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Nmtokens| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Nmtokens.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Nmtokens.2|
                                                   (%ATN-EDGE-BLOCK (POP |Nmtokens|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Nmtokens|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Nmtokens|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|Nmtoken| |Nmtoken| '|Nmtokens|
                                                                                        |Nmtokens|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Nmtokens-Constructor|
                                                                                                       |Nmtoken| |Nmtokens|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Nmtokens|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Nmtoken| |Nmtokens|)))
                                                                                     '|Nmtokens|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Nmtokens|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Nmtokens/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Nmtokens/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Nmtokens/Nmtokens.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Nmtokens/Nmtokens.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Nmtokens/Nmtokens.2.5|)
                                                                    (|Nmtokens/Nmtokens.2.5| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Nmtokens.2|)
                                                                    (|Nmtokens.2| ATN-PARSER::INDEX))))
                                (|Nmtokens/Nmtokens.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Nmtokens/Nmtokens.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Nmtokens/Nmtokens.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|Nmtokens/Nmtokens.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Nmtokens/Nmtokens.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |Nmtokens|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Nmtokens|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Nmtokens| ATN-PARSER::RESULT))
                                                                        (|Nmtokens.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Nmtokens|) NIL))))))
                                (|Nmtokens/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Nmtokens/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |Nmtoken|)
                                                                    (COND
                                                                     ((|IS-Nmtoken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|Nmtoken|)
                                                                      (SETF |Nmtoken|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|Nmtoken-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|Nmtoken| ATN-PARSER::|item|)
                                                                                      '|Nmtoken|)))
                                                                      (|Nmtokens/Nmtokens.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|Nmtoken|)
                                                                      (|Nmtokens/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Nmtokens.2| |Nmtokens/fail.3| |Nmtokens/Nmtokens.2.4|
                           |Nmtokens/Nmtokens.2.5| |Nmtokens/Nmtokens.2.6| |Nmtokens/start.1|))
                         (|Nmtokens/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Nmtokens| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Nmtokens| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EntityValue-INDEX|)
 (DEFUN |EntityValue| (ATN-PARSER::INDEX &AUX (|EntityData| NIL))
   "{9 } EntityValue ::= (('\"' EntityData? '\"') | (''' EntityData? '''))
(|EntityData|)"
   (DECLARE (SPECIAL |EntityValue-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EntityValue-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EntityValue-INDEX| ATN-PARSER::INDEX)
       (LET ((|EntityValue-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|EntityValue| *ATN-STACK))
             (*IN-ENTITY-VALUE* T)
             (*PARSETABLE* |EntityValue-Parsetable|))
         (DECLARE (SPECIAL |EntityValue-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EntityValue|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EntityValue|)
                                  (RETURN-FROM |EntityValue| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EntityValue| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EntityValue.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue.2|
                                                   (%ATN-EDGE-BLOCK (POP |EntityValue|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EntityValue|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|EntityValue| ATN-PARSER::INDEX
                                                                                  (LIST '|EntityData| |EntityData|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|EntityValue-Constructor|
                                                                                                       |EntityData|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EntityValue|
                                                                                           (DELETE NIL (LIST |EntityData|)))
                                                                                     '|EntityValue|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|EntityValue|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EntityValue/EntityValue.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/EntityValue.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|EntityValue/EntityValue.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|EntityValue/EntityValue.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/EntityValue.2.5|
                                                   (LET ((*PARSETABLE* |EntityData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |EntityData|)
                                                                      (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                                                                      (COND
                                                                       ((|IS-EntityData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|EntityData|)
                                                                        (SETF |EntityData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|EntityData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|EntityData| ATN-PARSER::|item|)
                                                                                        '|EntityData|)))
                                                                        (|EntityValue/EntityValue.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|EntityData|)
                                                                        (|EntityValue/EntityValue.2.6| ATN-PARSER::INDEX)))))))
                                (|EntityValue/EntityValue.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/EntityValue.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|EntityValue.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|EntityValue/EntityValue.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/EntityValue.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|EntityValue/EntityValue.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|EntityValue/EntityValue.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/EntityValue.2.8|
                                                   (LET ((*PARSETABLE* |EntityData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |EntityData|)
                                                                      (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                                                                      (COND
                                                                       ((|IS-EntityData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|EntityData|)
                                                                        (SETF |EntityData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|EntityData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|EntityData| ATN-PARSER::|item|)
                                                                                        '|EntityData|)))
                                                                        (|EntityValue/EntityValue.2.9| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|EntityData|)
                                                                        (|EntityValue/EntityValue.2.9| ATN-PARSER::INDEX)))))))
                                (|EntityValue/EntityValue.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/EntityValue.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|EntityValue.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|EntityValue/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EntityValue/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityValue/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |EntityValue/EntityValue.2.4|)
                                                                      (|EntityValue/EntityValue.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |EntityValue/EntityValue.2.7|)
                                                                      (|EntityValue/EntityValue.2.7| ATN-PARSER::INDEX))
                                                                     (|EntityValue/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EntityValue.2| |EntityValue/EntityValue.2.4|
                           |EntityValue/EntityValue.2.5| |EntityValue/EntityValue.2.6| |EntityValue/EntityValue.2.7|
                           |EntityValue/EntityValue.2.8| |EntityValue/EntityValue.2.9| |EntityValue/fail.3| |EntityValue/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|EntityValue/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EntityValue| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EntityValue| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttValue-INDEX|)
 (DEFUN |AttValue| (ATN-PARSER::INDEX &AUX (|AttChildSequence| NIL))
   "{10} AttValue ::= (('\"' AttChildSequence? '\"') | (''' AttChildSequence? '''))
(|AttChildSequence|)"
   (DECLARE (SPECIAL |AttValue-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttValue-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttValue-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttValue-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|AttValue| *ATN-STACK))
             (*PARSETABLE* |AttValue-Parsetable|))
         (DECLARE (SPECIAL |AttValue-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttValue|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttValue|)
                                  (RETURN-FROM |AttValue| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttValue| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttValue.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttValue|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttValue|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|AttValue|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|AttChildSequence| |AttChildSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|AttValue-Constructor|
                                                                                                       |AttChildSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttValue|
                                                                                           (DELETE NIL (LIST |AttChildSequence|)))
                                                                                     '|AttValue|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttValue|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttValue/AttValue.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/AttValue.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|AttValue/AttValue.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|AttValue/AttValue.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/AttValue.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttChildSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttChildSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttChildSequence| ATN-PARSER::RESULT))
                                                                        (|AttValue/AttValue.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttChildSequence|)
                                                                        (|AttValue/AttValue.2.6| ATN-PARSER::INDEX)))))))
                                (|AttValue/AttValue.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/AttValue.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|AttValue.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|AttValue/AttValue.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/AttValue.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|AttValue/AttValue.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|AttValue/AttValue.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/AttValue.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttChildSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttChildSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttChildSequence| ATN-PARSER::RESULT))
                                                                        (|AttValue/AttValue.2.9| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttChildSequence|)
                                                                        (|AttValue/AttValue.2.9| ATN-PARSER::INDEX)))))))
                                (|AttValue/AttValue.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/AttValue.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|AttValue.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|AttValue/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttValue/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttValue/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |AttValue/AttValue.2.4|)
                                                                                      (|AttValue/AttValue.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |AttValue/AttValue.2.7|)
                                                                                      (|AttValue/AttValue.2.7| ATN-PARSER::INDEX))
                                                                     (|AttValue/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttValue.2| |AttValue/AttValue.2.4| |AttValue/AttValue.2.5|
                           |AttValue/AttValue.2.6| |AttValue/AttValue.2.7| |AttValue/AttValue.2.8| |AttValue/AttValue.2.9|
                           |AttValue/fail.3| |AttValue/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|AttValue/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttValue| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttValue| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttChildSequence-INDEX|)
 (DEFUN |AttChildSequence| (ATN-PARSER::INDEX &AUX (|AttChild| NIL) (|AttChildSequence| NIL))
   "AttChildSequence ::= AttChild AttChildSequence?
(|AttChild| |AttChildSequence|)"
   (DECLARE (SPECIAL |AttChildSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttChildSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttChildSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttChildSequence-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|AttChildSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |AttChildSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttChildSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttChildSequence|)
                                  (RETURN-FROM |AttChildSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttChildSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttChildSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChildSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttChildSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttChildSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|AttChildSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|AttChild| |AttChild| '|AttChildSequence|
                                                                                        |AttChildSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|AttChildSequence-Constructor| |AttChild|
                                                                                  |AttChildSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttChildSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttChild|
                                                                                                         |AttChildSequence|)))
                                                                                     '|AttChildSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttChildSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttChildSequence/AttChildSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChildSequence/AttChildSequence.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttChildSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttChildSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttChildSequence| ATN-PARSER::RESULT))
                                                                        (|AttChildSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttChildSequence|)
                                                                        (|AttChildSequence.2| ATN-PARSER::INDEX)))))))
                                (|AttChildSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChildSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttChildSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChildSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttChild|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttChild|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttChild| ATN-PARSER::RESULT))
                                                                        (|AttChildSequence/AttChildSequence.2.4|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttChild|)
                                                                        (|AttChildSequence/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttChildSequence.2| |AttChildSequence/AttChildSequence.2.4|
                           |AttChildSequence/fail.3| |AttChildSequence/start.1|))
                         (|AttChildSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttChildSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttChildSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttChild-INDEX|)
 (DEFUN |AttChild| (ATN-PARSER::INDEX &AUX (|AttCharData| NIL) (|ParsedReference| NIL) (|Reference| NIL))
   "AttChild ::= (AttCharData | Reference | ParsedReference)
(|AttCharData| |ParsedReference| |Reference|)"
   (DECLARE (SPECIAL |AttChild-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttChild-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttChild-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttChild-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|AttChild| *ATN-STACK))
             (*PARSETABLE* |AttChild-Parsetable|))
         (DECLARE (SPECIAL |AttChild-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttChild|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttChild|)
                                  (RETURN-FROM |AttChild| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttChild| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttChild.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChild.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttChild|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttChild|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|AttChild|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|AttCharData| |AttCharData|
                                                                                        '|ParsedReference| |ParsedReference|
                                                                                        '|Reference| |Reference|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|AttChild-Constructor|
                                                                                                       |AttCharData|
                                                                                                       |ParsedReference|
                                                                                                       |Reference|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttChild|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttCharData|
                                                                                                         |ParsedReference|
                                                                                                         |Reference|)))
                                                                                     '|AttChild|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttChild|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttChild/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChild/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttChild/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttChild/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |AttCharData|)
                                                                      (COND
                                                                       ((|IS-AttCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|AttCharData|)
                                                                        (SETF |AttCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-PARSER::ATN-REDUCE-ITEM-WITH-CONTEXT
                                                                                     #'|AttCharData-Constructor|
                                                                                     *CONSTRUCTION-CONTEXT* ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|AttCharData| ATN-PARSER::|item|)
                                                                                        '|AttCharData|)))
                                                                        (|AttChild.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|AttCharData|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Reference|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Reference| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Reference| ATN-PARSER::RESULT))
                                                                                          (|AttChild.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Reference|) NIL))))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |ParsedReference|)
                                                                      (COND
                                                                       ((|IS-ParsedReference| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|ParsedReference|)
                                                                        (SETF |ParsedReference|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM
                                                                                     #'|ParsedReference-Constructor|
                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|ParsedReference|
                                                                                              ATN-PARSER::|item|)
                                                                                        '|ParsedReference|)))
                                                                        (|AttChild.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|ParsedReference|) NIL)))
                                                                     (|AttChild/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttChild.2| |AttChild/fail.3| |AttChild/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|AttChild/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttChild| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttChild| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DefaultAttValue-INDEX|)
 (DEFUN |DefaultAttValue| (ATN-PARSER::INDEX &AUX (|DefaultAttChildSequence| NIL))
   "DefaultAttValue ::= (('\"' DefaultAttChildSequence? '\"') | ('''
                                                                DefaultAttChildSequence?
                                                                '''))
(|DefaultAttChildSequence|)"
   (DECLARE (SPECIAL |DefaultAttValue-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DefaultAttValue-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DefaultAttValue-INDEX| ATN-PARSER::INDEX)
       (LET ((|DefaultAttValue-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|DefaultAttValue| *ATN-STACK))
             (*PARSETABLE* |DefaultAttValue-Parsetable|))
         (DECLARE (SPECIAL |DefaultAttValue-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DefaultAttValue|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DefaultAttValue|)
                                  (RETURN-FROM |DefaultAttValue| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DefaultAttValue| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DefaultAttValue.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue.2|
                                                   (%ATN-EDGE-BLOCK (POP |DefaultAttValue|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DefaultAttValue|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|DefaultAttValue| ATN-PARSER::INDEX
                                                                                  (LIST '|DefaultAttChildSequence|
                                                                                        |DefaultAttChildSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|DefaultAttValue-Constructor|
                                                                                  |DefaultAttChildSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DefaultAttValue|
                                                                                           (DELETE NIL
                                                                                                   (LIST
                                                                                                    |DefaultAttChildSequence|)))
                                                                                     '|DefaultAttValue|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|DefaultAttValue|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DefaultAttValue/DefaultAttValue.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/DefaultAttValue.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|DefaultAttValue/DefaultAttValue.2.5|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|DefaultAttValue/DefaultAttValue.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/DefaultAttValue.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |DefaultAttChildSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                         '|DefaultAttChildSequence| ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DefaultAttChildSequence| ATN-PARSER::RESULT))
                                                                        (|DefaultAttValue/DefaultAttValue.2.6|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DefaultAttChildSequence|)
                                                                        (|DefaultAttValue/DefaultAttValue.2.6|
                                                                         ATN-PARSER::INDEX)))))))
                                (|DefaultAttValue/DefaultAttValue.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/DefaultAttValue.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|DefaultAttValue.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|DefaultAttValue/DefaultAttValue.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/DefaultAttValue.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|DefaultAttValue/DefaultAttValue.2.8|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|DefaultAttValue/DefaultAttValue.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/DefaultAttValue.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |DefaultAttChildSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                         '|DefaultAttChildSequence| ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DefaultAttChildSequence| ATN-PARSER::RESULT))
                                                                        (|DefaultAttValue/DefaultAttValue.2.9|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DefaultAttChildSequence|)
                                                                        (|DefaultAttValue/DefaultAttValue.2.9|
                                                                         ATN-PARSER::INDEX)))))))
                                (|DefaultAttValue/DefaultAttValue.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/DefaultAttValue.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|DefaultAttValue.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|DefaultAttValue/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DefaultAttValue/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttValue/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |DefaultAttValue/DefaultAttValue.2.4|)
                                                                      (|DefaultAttValue/DefaultAttValue.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |DefaultAttValue/DefaultAttValue.2.7|)
                                                                      (|DefaultAttValue/DefaultAttValue.2.7| ATN-PARSER::INDEX))
                                                                     (|DefaultAttValue/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DefaultAttValue.2| |DefaultAttValue/DefaultAttValue.2.4|
                           |DefaultAttValue/DefaultAttValue.2.5| |DefaultAttValue/DefaultAttValue.2.6|
                           |DefaultAttValue/DefaultAttValue.2.7| |DefaultAttValue/DefaultAttValue.2.8|
                           |DefaultAttValue/DefaultAttValue.2.9| |DefaultAttValue/fail.3| |DefaultAttValue/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|DefaultAttValue/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DefaultAttValue| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DefaultAttValue| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DefaultAttChildSequence-INDEX|)
 (DEFUN |DefaultAttChildSequence| (ATN-PARSER::INDEX &AUX (|DefaultAttChild| NIL) (|DefaultAttChildSequence| NIL))
   "DefaultAttChildSequence ::= DefaultAttChild DefaultAttChildSequence?
(|DefaultAttChild| |DefaultAttChildSequence|)"
   (DECLARE (SPECIAL |DefaultAttChildSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DefaultAttChildSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DefaultAttChildSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|DefaultAttChildSequence-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|DefaultAttChildSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |DefaultAttChildSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DefaultAttChildSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DefaultAttChildSequence|)
                                  (RETURN-FROM |DefaultAttChildSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DefaultAttChildSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DefaultAttChildSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChildSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |DefaultAttChildSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DefaultAttChildSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|DefaultAttChildSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|DefaultAttChild| |DefaultAttChild|
                                                                                        '|DefaultAttChildSequence|
                                                                                        |DefaultAttChildSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|DefaultAttChildSequence-Constructor|
                                                                                  |DefaultAttChild| |DefaultAttChildSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DefaultAttChildSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |DefaultAttChild|
                                                                                                         |DefaultAttChildSequence|)))
                                                                                     '|DefaultAttChildSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s"
                                                                                  '|DefaultAttChildSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DefaultAttChildSequence/DefaultAttChildSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChildSequence/DefaultAttChildSequence.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |DefaultAttChildSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                         '|DefaultAttChildSequence| ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DefaultAttChildSequence| ATN-PARSER::RESULT))
                                                                        (|DefaultAttChildSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DefaultAttChildSequence|)
                                                                        (|DefaultAttChildSequence.2| ATN-PARSER::INDEX)))))))
                                (|DefaultAttChildSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChildSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DefaultAttChildSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChildSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |DefaultAttChild|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|DefaultAttChild|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DefaultAttChild| ATN-PARSER::RESULT))
                                                                        (|DefaultAttChildSequence/DefaultAttChildSequence.2.4|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DefaultAttChild|)
                                                                        (|DefaultAttChildSequence/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DefaultAttChildSequence.2|
                           |DefaultAttChildSequence/DefaultAttChildSequence.2.4| |DefaultAttChildSequence/fail.3|
                           |DefaultAttChildSequence/start.1|))
                         (|DefaultAttChildSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DefaultAttChildSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DefaultAttChildSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DefaultAttChild-INDEX|)
 (DEFUN |DefaultAttChild| (ATN-PARSER::INDEX &AUX (|DefaultAttCharData| NIL) (|ParsedReference| NIL) (|Reference| NIL))
   "DefaultAttChild ::= (DefaultAttCharData | Reference | ParsedReference)
(|DefaultAttCharData| |ParsedReference| |Reference|)"
   (DECLARE (SPECIAL |DefaultAttChild-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DefaultAttChild-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DefaultAttChild-INDEX| ATN-PARSER::INDEX)
       (LET ((|DefaultAttChild-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|DefaultAttChild| *ATN-STACK))
             (*PARSETABLE* |DefaultAttChild-Parsetable|))
         (DECLARE (SPECIAL |DefaultAttChild-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DefaultAttChild|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DefaultAttChild|)
                                  (RETURN-FROM |DefaultAttChild| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DefaultAttChild| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DefaultAttChild.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChild.2|
                                                   (%ATN-EDGE-BLOCK (POP |DefaultAttChild|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DefaultAttChild|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|DefaultAttChild| ATN-PARSER::INDEX
                                                                                  (LIST '|DefaultAttCharData| |DefaultAttCharData|
                                                                                        '|ParsedReference| |ParsedReference|
                                                                                        '|Reference| |Reference|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|DefaultAttChild-Constructor|
                                                                                  |DefaultAttCharData| |ParsedReference|
                                                                                  |Reference|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DefaultAttChild|
                                                                                           (DELETE NIL
                                                                                                   (LIST |DefaultAttCharData|
                                                                                                         |ParsedReference|
                                                                                                         |Reference|)))
                                                                                     '|DefaultAttChild|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|DefaultAttChild|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DefaultAttChild/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChild/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DefaultAttChild/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultAttChild/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |DefaultAttCharData|)
                                                                      (COND
                                                                       ((|IS-DefaultAttCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|DefaultAttCharData|)
                                                                        (SETF |DefaultAttCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-PARSER::ATN-REDUCE-ITEM-WITH-CONTEXT
                                                                                     #'|DefaultAttCharData-Constructor|
                                                                                     *CONSTRUCTION-CONTEXT* ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|DefaultAttCharData|
                                                                                              ATN-PARSER::|item|)
                                                                                        '|DefaultAttCharData|)))
                                                                        (|DefaultAttChild.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|DefaultAttCharData|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Reference|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Reference| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Reference| ATN-PARSER::RESULT))
                                                                                          (|DefaultAttChild.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Reference|) NIL))))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |ParsedReference|)
                                                                      (COND
                                                                       ((|IS-ParsedReference| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|ParsedReference|)
                                                                        (SETF |ParsedReference|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM
                                                                                     #'|ParsedReference-Constructor|
                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|ParsedReference|
                                                                                              ATN-PARSER::|item|)
                                                                                        '|ParsedReference|)))
                                                                        (|DefaultAttChild.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|ParsedReference|) NIL)))
                                                                     (|DefaultAttChild/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DefaultAttChild.2| |DefaultAttChild/fail.3|
                           |DefaultAttChild/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|DefaultAttChild/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DefaultAttChild| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DefaultAttChild| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |SystemLiteral-INDEX|)
 (DEFUN |SystemLiteral| (ATN-PARSER::INDEX &AUX (|SystemCharData| NIL))
   "{11} SystemLiteral ::= (('\"' SystemCharData? '\"') | (''' SystemCharData? '''))
(|SystemCharData|)"
   (DECLARE (SPECIAL |SystemLiteral-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |SystemLiteral-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |SystemLiteral-INDEX| ATN-PARSER::INDEX)
       (LET ((|SystemLiteral-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|SystemLiteral| *ATN-STACK)))
         (DECLARE (SPECIAL |SystemLiteral-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |SystemLiteral|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|SystemLiteral|)
                                  (RETURN-FROM |SystemLiteral| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |SystemLiteral| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|SystemLiteral.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral.2|
                                                   (%ATN-EDGE-BLOCK (POP |SystemLiteral|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|SystemLiteral|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|SystemLiteral| ATN-PARSER::INDEX
                                                                                  (LIST '|SystemCharData| |SystemCharData|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|SystemLiteral-Constructor| |SystemCharData|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|SystemLiteral|
                                                                                           (DELETE NIL (LIST |SystemCharData|)))
                                                                                     '|SystemLiteral|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|SystemLiteral|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|SystemLiteral/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|SystemLiteral/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |SystemLiteral/SystemLiteral.2.4|)
                                                                      (|SystemLiteral/SystemLiteral.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |SystemLiteral/SystemLiteral.2.7|)
                                                                      (|SystemLiteral/SystemLiteral.2.7| ATN-PARSER::INDEX))
                                                                     (|SystemLiteral/fail.3| ATN-PARSER::INDEX)))))
                                (|SystemLiteral/SystemLiteral.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/SystemLiteral.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|SystemLiteral/SystemLiteral.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|SystemLiteral/SystemLiteral.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/SystemLiteral.2.5|
                                                   (LET ((*PARSETABLE* |SystemCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |SystemCharData|)
                                                                      (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                                                                      (COND
                                                                       ((|IS-SystemCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|SystemCharData|)
                                                                        (SETF |SystemCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|SystemCharData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|SystemCharData| ATN-PARSER::|item|)
                                                                                        '|SystemCharData|)))
                                                                        (|SystemLiteral/SystemLiteral.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|SystemCharData|)
                                                                        (|SystemLiteral/SystemLiteral.2.6| ATN-PARSER::INDEX)))))))
                                (|SystemLiteral/SystemLiteral.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/SystemLiteral.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|SystemLiteral.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|SystemLiteral/SystemLiteral.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/SystemLiteral.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|SystemLiteral/SystemLiteral.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|SystemLiteral/SystemLiteral.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/SystemLiteral.2.8|
                                                   (LET ((*PARSETABLE* |SystemCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |SystemCharData|)
                                                                      (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                                                                      (COND
                                                                       ((|IS-SystemCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|SystemCharData|)
                                                                        (SETF |SystemCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|SystemCharData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|SystemCharData| ATN-PARSER::|item|)
                                                                                        '|SystemCharData|)))
                                                                        (|SystemLiteral/SystemLiteral.2.9| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|SystemCharData|)
                                                                        (|SystemLiteral/SystemLiteral.2.9| ATN-PARSER::INDEX)))))))
                                (|SystemLiteral/SystemLiteral.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SystemLiteral/SystemLiteral.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|SystemLiteral.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |SystemLiteral.2| |SystemLiteral/fail.3|
                           |SystemLiteral/start.1| |SystemLiteral/SystemLiteral.2.4| |SystemLiteral/SystemLiteral.2.5|
                           |SystemLiteral/SystemLiteral.2.6| |SystemLiteral/SystemLiteral.2.7| |SystemLiteral/SystemLiteral.2.8|
                           |SystemLiteral/SystemLiteral.2.9|))
                         (|SystemLiteral/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|SystemLiteral| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|SystemLiteral| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |PubidLiteral-INDEX|)
 (DEFUN |PubidLiteral| (ATN-PARSER::INDEX &AUX (|PubidCharData| NIL))
   "{12} PubidLiteral ::= (('\"' PubidCharData? '\"') | (''' PubidCharData? '''))
(|PubidCharData|)"
   (DECLARE (SPECIAL |PubidLiteral-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |PubidLiteral-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |PubidLiteral-INDEX| ATN-PARSER::INDEX)
       (LET ((|PubidLiteral-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|PubidLiteral| *ATN-STACK)))
         (DECLARE (SPECIAL |PubidLiteral-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |PubidLiteral|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|PubidLiteral|)
                                  (RETURN-FROM |PubidLiteral| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |PubidLiteral| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|PubidLiteral.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral.2|
                                                   (%ATN-EDGE-BLOCK (POP |PubidLiteral|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|PubidLiteral|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|PubidLiteral| ATN-PARSER::INDEX
                                                                                  (LIST '|PubidCharData| |PubidCharData|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|PubidLiteral-Constructor|
                                                                                                       |PubidCharData|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|PubidLiteral|
                                                                                           (DELETE NIL (LIST |PubidCharData|)))
                                                                                     '|PubidLiteral|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|PubidLiteral|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|PubidLiteral/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|PubidLiteral/PubidLiteral.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/PubidLiteral.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|PubidLiteral/PubidLiteral.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|PubidLiteral/PubidLiteral.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/PubidLiteral.2.5|
                                                   (LET ((*PARSETABLE* |PubidCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |PubidCharData|)
                                                                      (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                                                                      (COND
                                                                       ((|IS-PubidCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|PubidCharData|)
                                                                        (SETF |PubidCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|PubidCharData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|PubidCharData| ATN-PARSER::|item|)
                                                                                        '|PubidCharData|)))
                                                                        (|PubidLiteral/PubidLiteral.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|PubidCharData|)
                                                                        (|PubidLiteral/PubidLiteral.2.6| ATN-PARSER::INDEX)))))))
                                (|PubidLiteral/PubidLiteral.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/PubidLiteral.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|PubidLiteral.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|PubidLiteral/PubidLiteral.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/PubidLiteral.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|PubidLiteral/PubidLiteral.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|PubidLiteral/PubidLiteral.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/PubidLiteral.2.8|
                                                   (LET ((*PARSETABLE* |PubidCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |PubidCharData|)
                                                                      (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                                                                      (COND
                                                                       ((|IS-PubidCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|PubidCharData|)
                                                                        (SETF |PubidCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|PubidCharData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|PubidCharData| ATN-PARSER::|item|)
                                                                                        '|PubidCharData|)))
                                                                        (|PubidLiteral/PubidLiteral.2.9| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|PubidCharData|)
                                                                        (|PubidLiteral/PubidLiteral.2.9| ATN-PARSER::INDEX)))))))
                                (|PubidLiteral/PubidLiteral.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/PubidLiteral.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|PubidLiteral.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|PubidLiteral/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PubidLiteral/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |PubidLiteral/PubidLiteral.2.4|)
                                                                      (|PubidLiteral/PubidLiteral.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |PubidLiteral/PubidLiteral.2.7|)
                                                                      (|PubidLiteral/PubidLiteral.2.7| ATN-PARSER::INDEX))
                                                                     (|PubidLiteral/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |PubidLiteral.2| |PubidLiteral/fail.3|
                           |PubidLiteral/PubidLiteral.2.4| |PubidLiteral/PubidLiteral.2.5| |PubidLiteral/PubidLiteral.2.6|
                           |PubidLiteral/PubidLiteral.2.7| |PubidLiteral/PubidLiteral.2.8| |PubidLiteral/PubidLiteral.2.9|
                           |PubidLiteral/start.1|))
                         (|PubidLiteral/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|PubidLiteral| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|PubidLiteral| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Comment-INDEX|)
 (DEFUN |Comment| (ATN-PARSER::INDEX &AUX (|CommentCharData| NIL))
   "{15} Comment ::= '<!--' CommentCharData? '-->'
(|CommentCharData|)"
   (DECLARE (SPECIAL |Comment-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Comment-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Comment-INDEX| ATN-PARSER::INDEX)
       (LET ((|Comment-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Comment| *ATN-STACK)))
         (DECLARE (SPECIAL |Comment-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Comment|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Comment|)
                                  (RETURN-FROM |Comment| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Comment| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Comment.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Comment.2|
                                                   (%ATN-EDGE-BLOCK (POP |Comment|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Comment|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Comment|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|CommentCharData| |CommentCharData|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|Comment-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |CommentCharData|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Comment|
                                                                                           (DELETE NIL (LIST |CommentCharData|)))
                                                                                     '|Comment|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Comment|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Comment/Comment.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Comment/Comment.2.4|
                                                   (LET ((*PARSETABLE* |CommentCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |CommentCharData|)
                                                                      (COND
                                                                       ((|IS-CommentCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|CommentCharData|)
                                                                        (SETF |CommentCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM
                                                                                     #'|CommentCharData-Constructor|
                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|CommentCharData|
                                                                                              ATN-PARSER::|item|)
                                                                                        '|CommentCharData|)))
                                                                        (|Comment/Comment.2.5| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|CommentCharData|)
                                                                        (|Comment/Comment.2.5| ATN-PARSER::INDEX)))))))
                                (|Comment/Comment.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Comment/Comment.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:-->)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:-->)
                                                                      (SETF *ATN-TERM* '|xml|:-->)
                                                                      (|Comment.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:-->)
                                                                      (|Comment/fail.3| ATN-PARSER::INDEX))))))
                                (|Comment/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Comment/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Comment/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Comment/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<!--)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<!--)
                                                                      (SETF *ATN-TERM* '|xml|:<!--)
                                                                      (|Comment/Comment.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<!--)
                                                                      (|Comment/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Comment.2| |Comment/Comment.2.4| |Comment/Comment.2.5|
                           |Comment/fail.3| |Comment/start.1|))
                         (|Comment/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Comment| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Comment| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Pi-INDEX|)
 (DEFUN |Pi| (ATN-PARSER::INDEX &AUX (|PiCharData| NIL) (|PiTarget| NIL))
   "{16} Pi ::= '<?' PiTarget (S PiCharData?)? '?>'
(|PiCharData| |PiTarget|)"
   (DECLARE (SPECIAL |Pi-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Pi-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Pi-INDEX| ATN-PARSER::INDEX)
       (LET ((|Pi-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Pi| *ATN-STACK))
             (*PARSETABLE* |Pi-Parsetable|))
         (DECLARE (SPECIAL |Pi-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Pi|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Pi|)
                                  (RETURN-FROM |Pi| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Pi| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Pi.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi.2|
                                                   (%ATN-EDGE-BLOCK (POP |Pi|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Pi|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Pi|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|PiCharData| |PiCharData| '|PiTarget|
                                                                                        |PiTarget|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|Pi-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |PiCharData| |PiTarget|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Pi|
                                                                                           (DELETE NIL
                                                                                                   (LIST |PiCharData| |PiTarget|)))
                                                                                     '|Pi|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Pi|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Pi/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Pi/Pi.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/Pi.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |PiTarget|)
                                                                    (COND
                                                                     ((|IS-PiTarget| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|PiTarget|)
                                                                      (SETF |PiTarget|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|PiTarget-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|PiTarget| ATN-PARSER::|item|)
                                                                                      '|PiTarget|)))
                                                                      (|Pi/Pi.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|PiTarget|)
                                                                      (|Pi/fail.3| ATN-PARSER::INDEX))))))
                                (|Pi/Pi.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/Pi.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Pi/Pi/Pi.2.6.7|)
                                                                    (|Pi/Pi/Pi.2.6.7| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Pi/Pi.2.6|)
                                                                    (|Pi/Pi.2.6| ATN-PARSER::INDEX))))
                                (|Pi/Pi.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/Pi.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:?>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:?>) (SETF *ATN-TERM* '|xml|:?>)
                                                                      (|Pi.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:?>)
                                                                      (|Pi/fail.3| ATN-PARSER::INDEX))))))
                                (|Pi/Pi/Pi.2.6.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/Pi/Pi.2.6.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Pi/Pi/Pi.2.6.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|Pi/Pi/Pi.2.6.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/Pi/Pi.2.6.8|
                                                   (LET ((*PARSETABLE* |PiCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |PiCharData|)
                                                                      (COND
                                                                       ((|IS-PiCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|PiCharData|)
                                                                        (SETF |PiCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-PARSER::ATN-REDUCE-ITEM-WITH-CONTEXT
                                                                                     #'|PiCharData-Constructor|
                                                                                     *CONSTRUCTION-CONTEXT* ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|PiCharData| ATN-PARSER::|item|)
                                                                                        '|PiCharData|)))
                                                                        (|Pi/Pi.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|PiCharData|)
                                                                        (|Pi/Pi.2.6| ATN-PARSER::INDEX)))))))
                                (|Pi/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Pi/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<?)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<?) (SETF *ATN-TERM* '|xml|:<?)
                                                                      (|Pi/Pi.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<?)
                                                                      (|Pi/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Pi.2| |Pi/fail.3| |Pi/Pi.2.4| |Pi/Pi.2.5| |Pi/Pi.2.6|
                           |Pi/Pi/Pi.2.6.7| |Pi/Pi/Pi.2.6.8| |Pi/start.1|))
                         (|Pi/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Pi| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Pi| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |CDSect-INDEX|)
 (DEFUN |CDSect| (ATN-PARSER::INDEX &AUX (|CDataCharData| NIL) (|CDEnd| NIL) (|CDStart| NIL))
   "{18} CDSect ::= CDStart CDataCharData? CDEnd
(|CDataCharData| |CDEnd| |CDStart|)"
   (DECLARE (SPECIAL |CDSect-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |CDSect-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |CDSect-INDEX| ATN-PARSER::INDEX)
       (LET ((|CDSect-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|CDSect| *ATN-STACK)))
         (DECLARE (SPECIAL |CDSect-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |CDSect|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|CDSect|)
                                  (RETURN-FROM |CDSect| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |CDSect| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|CDSect.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CDSect.2|
                                                   (%ATN-EDGE-BLOCK (POP |CDSect|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|CDSect|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|CDSect|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|CDataCharData| |CDataCharData| '|CDEnd|
                                                                                        |CDEnd| '|CDStart| |CDStart|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|CDSect-Constructor|
                                                                                                       |CDataCharData| |CDEnd|
                                                                                                       |CDStart|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|CDSect|
                                                                                           (DELETE NIL
                                                                                                   (LIST |CDataCharData| |CDEnd|
                                                                                                         |CDStart|)))
                                                                                     '|CDSect|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|CDSect|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|CDSect/CDSect.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CDSect/CDSect.2.4|
                                                   (LET ((*PARSETABLE* |CDataCharData-Parsetable|))
                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |CDataCharData|)
                                                                      (COND
                                                                       ((|IS-CDataCharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|CDataCharData|)
                                                                        (SETF |CDataCharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-PARSER::ATN-REDUCE-ITEM-WITH-CONTEXT
                                                                                     #'|CDataCharData-Constructor|
                                                                                     *CONSTRUCTION-CONTEXT* ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|CDataCharData| ATN-PARSER::|item|)
                                                                                        '|CDataCharData|)))
                                                                        (|CDSect/CDSect.2.5| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|CDataCharData|)
                                                                        (|CDSect/CDSect.2.5| ATN-PARSER::INDEX)))))))
                                (|CDSect/CDSect.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CDSect/CDSect.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |CDEnd|)
                                                                    (COND
                                                                     ((|IS-CDEnd| ATN-PARSER::|item|) (SETF *ATN-TERM* '|CDEnd|)
                                                                      (SETF |CDEnd|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|CDEnd-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|CDEnd| ATN-PARSER::|item|)
                                                                                      '|CDEnd|)))
                                                                      (|CDSect.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|CDEnd|)
                                                                      (|CDSect/fail.3| ATN-PARSER::INDEX))))))
                                (|CDSect/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CDSect/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|CDSect/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CDSect/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |CDStart|)
                                                                    (COND
                                                                     ((|IS-CDStart| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|CDStart|)
                                                                      (SETF |CDStart|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|CDStart-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|CDStart| ATN-PARSER::|item|)
                                                                                      '|CDStart|)))
                                                                      (|CDSect/CDSect.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|CDStart|)
                                                                      (|CDSect/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |CDSect.2| |CDSect/CDSect.2.4| |CDSect/CDSect.2.5|
                           |CDSect/fail.3| |CDSect/start.1|))
                         (|CDSect/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|CDSect| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|CDSect| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Prolog-INDEX|)
 (DEFUN |Prolog| (ATN-PARSER::INDEX &AUX (|DoctypeProlog| NIL) (|MiscSequence| NIL) (|XMLDecl| NIL))
   "{22} Prolog ::= XMLDecl? MiscSequence? DoctypeProlog?
(|DoctypeProlog| |MiscSequence| |XMLDecl|)"
   (DECLARE (SPECIAL |Prolog-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Prolog-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Prolog-INDEX| ATN-PARSER::INDEX)
       (LET ((|Prolog-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Prolog| *ATN-STACK)))
         (DECLARE (SPECIAL |Prolog-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Prolog|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Prolog|)
                                  (RETURN-FROM |Prolog| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Prolog| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Prolog.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Prolog.2|
                                                   (%ATN-EDGE-BLOCK (POP |Prolog|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Prolog|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Prolog|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|DoctypeProlog| |DoctypeProlog|
                                                                                        '|MiscSequence| |MiscSequence| '|XMLDecl|
                                                                                        |XMLDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Prolog-Constructor|
                                                                                                       |DoctypeProlog|
                                                                                                       |MiscSequence| |XMLDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Prolog|
                                                                                           (DELETE NIL
                                                                                                   (LIST |DoctypeProlog|
                                                                                                         |MiscSequence|
                                                                                                         |XMLDecl|)))
                                                                                     '|Prolog|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Prolog|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Prolog/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Prolog/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Prolog/Prolog.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Prolog/Prolog.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |MiscSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|MiscSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |MiscSequence| ATN-PARSER::RESULT))
                                                                        (|Prolog/Prolog.2.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|MiscSequence|)
                                                                        (|Prolog/Prolog.2.5| ATN-PARSER::INDEX)))))))
                                (|Prolog/Prolog.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Prolog/Prolog.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |DoctypeProlog|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|DoctypeProlog|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DoctypeProlog| ATN-PARSER::RESULT))
                                                                        (|Prolog.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DoctypeProlog|)
                                                                        (|Prolog.2| ATN-PARSER::INDEX)))))))
                                (|Prolog/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Prolog/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |XMLDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|XMLDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |XMLDecl| ATN-PARSER::RESULT))
                                                                        (|Prolog/Prolog.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|XMLDecl|)
                                                                        (|Prolog/Prolog.2.4| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Prolog.2| |Prolog/fail.3| |Prolog/Prolog.2.4|
                           |Prolog/Prolog.2.5| |Prolog/start.1|))
                         (|Prolog/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Prolog| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Prolog| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DoctypeProlog-INDEX|)
 (DEFUN |DoctypeProlog| (ATN-PARSER::INDEX &AUX (|DoctypeDecl| NIL) (|MiscSequence| NIL))
   "DoctypeProlog ::= DoctypeDecl MiscSequence?
(|DoctypeDecl| |MiscSequence|)"
   (DECLARE (SPECIAL |DoctypeProlog-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DoctypeProlog-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DoctypeProlog-INDEX| ATN-PARSER::INDEX)
       (LET ((|DoctypeProlog-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|DoctypeProlog| *ATN-STACK)))
         (DECLARE (SPECIAL |DoctypeProlog-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DoctypeProlog|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DoctypeProlog|)
                                  (RETURN-FROM |DoctypeProlog| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DoctypeProlog| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DoctypeProlog.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeProlog.2|
                                                   (%ATN-EDGE-BLOCK (POP |DoctypeProlog|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DoctypeProlog|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|DoctypeProlog| ATN-PARSER::INDEX
                                                                                  (LIST '|DoctypeDecl| |DoctypeDecl|
                                                                                        '|MiscSequence| |MiscSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|DoctypeProlog-Constructor| |DoctypeDecl|
                                                                                  |MiscSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DoctypeProlog|
                                                                                           (DELETE NIL
                                                                                                   (LIST |DoctypeDecl|
                                                                                                         |MiscSequence|)))
                                                                                     '|DoctypeProlog|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|DoctypeProlog|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DoctypeProlog/DoctypeProlog.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeProlog/DoctypeProlog.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |MiscSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|MiscSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |MiscSequence| ATN-PARSER::RESULT))
                                                                        (|DoctypeProlog.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|MiscSequence|)
                                                                        (|DoctypeProlog.2| ATN-PARSER::INDEX)))))))
                                (|DoctypeProlog/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeProlog/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DoctypeProlog/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeProlog/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |DoctypeDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|DoctypeDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DoctypeDecl| ATN-PARSER::RESULT))
                                                                        (|DoctypeProlog/DoctypeProlog.2.4|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DoctypeDecl|)
                                                                        (|DoctypeProlog/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DoctypeProlog.2| |DoctypeProlog/DoctypeProlog.2.4|
                           |DoctypeProlog/fail.3| |DoctypeProlog/start.1|))
                         (|DoctypeProlog/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DoctypeProlog| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DoctypeProlog| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |XMLDecl-INDEX|)
 (DEFUN |XMLDecl| (ATN-PARSER::INDEX &AUX (|EncodingDecl| NIL) (|SDDecl| NIL) (|VersionInfo| NIL))
   "{23} XMLDecl ::= '<?xml' VersionInfo EncodingDecl? SDDecl? S* '?>'
(|EncodingDecl| |SDDecl| |VersionInfo|)"
   (DECLARE (SPECIAL |XMLDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |XMLDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |XMLDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|XMLDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|XMLDecl| *ATN-STACK))
             (*PARSETABLE* |XMLDecl-Parsetable|))
         (DECLARE (SPECIAL |XMLDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |XMLDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|XMLDecl|)
                                  (RETURN-FROM |XMLDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |XMLDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|XMLDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |XMLDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|XMLDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|XMLDecl|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|EncodingDecl| |EncodingDecl| '|SDDecl|
                                                                                        |SDDecl| '|VersionInfo| |VersionInfo|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|XMLDecl-Constructor|
                                                                                                       |EncodingDecl| |SDDecl|
                                                                                                       |VersionInfo|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|XMLDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EncodingDecl| |SDDecl|
                                                                                                         |VersionInfo|)))
                                                                                     '|XMLDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|XMLDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|XMLDecl.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|XMLDecl.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|XMLDecl/XMLDecl.2.8| ATN-PARSER::INDEX))))))
                                (|XMLDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|XMLDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|<?xml|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|<?xml|)
                                                                      (SETF *ATN-TERM* '|xml|:|<?xml|)
                                                                      (|XMLDecl/XMLDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|<?xml|)
                                                                      (|XMLDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|XMLDecl/XMLDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/XMLDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |VersionInfo|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|VersionInfo|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |VersionInfo| ATN-PARSER::RESULT))
                                                                        (|XMLDecl/XMLDecl.2.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|VersionInfo|)
                                                                        (|XMLDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|XMLDecl/XMLDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/XMLDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |EncodingDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|EncodingDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |EncodingDecl| ATN-PARSER::RESULT))
                                                                        (|XMLDecl/XMLDecl.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|EncodingDecl|)
                                                                        (|XMLDecl/XMLDecl.2.6| ATN-PARSER::INDEX)))))))
                                (|XMLDecl/XMLDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/XMLDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |SDDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|SDDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |SDDecl| ATN-PARSER::RESULT))
                                                                        (|XMLDecl/XMLDecl.2.7| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|SDDecl|)
                                                                        (|XMLDecl/XMLDecl.2.7| ATN-PARSER::INDEX)))))))
                                (|XMLDecl/XMLDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/XMLDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|XMLDecl.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|XMLDecl/XMLDecl.2.8| ATN-PARSER::INDEX))))))
                                (|XMLDecl/XMLDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |XMLDecl/XMLDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:?>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:?>) (SETF *ATN-TERM* '|xml|:?>)
                                                                      (|XMLDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:?>)
                                                                      (|XMLDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |XMLDecl.2| |XMLDecl.9| |XMLDecl/fail.3| |XMLDecl/start.1|
                           |XMLDecl/XMLDecl.2.4| |XMLDecl/XMLDecl.2.5| |XMLDecl/XMLDecl.2.6| |XMLDecl/XMLDecl.2.7|
                           |XMLDecl/XMLDecl.2.8|))
                         (|XMLDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|XMLDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|XMLDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |VersionInfo-INDEX|)
 (DEFUN |VersionInfo| (ATN-PARSER::INDEX &AUX (|VersionNumCharData| NIL))
   "{24} VersionInfo ::= S+ version Eq ((('\"' VersionNumCharData '\"') | ('''
                                                                     VersionNumCharData
                                                                     ''')))
(|VersionNumCharData|)"
   (DECLARE (SPECIAL |VersionInfo-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |VersionInfo-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |VersionInfo-INDEX| ATN-PARSER::INDEX)
       (LET ((|VersionInfo-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|VersionInfo| *ATN-STACK))
             (*PARSETABLE* |VersionInfo-Parsetable|))
         (DECLARE (SPECIAL |VersionInfo-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |VersionInfo|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|VersionInfo|)
                                  (RETURN-FROM |VersionInfo| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |VersionInfo| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|VersionInfo.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo.2|
                                                   (%ATN-EDGE-BLOCK (POP |VersionInfo|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|VersionInfo|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|VersionInfo| ATN-PARSER::INDEX
                                                                                  (LIST '|VersionNumCharData|
                                                                                        |VersionNumCharData|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|VersionInfo-Constructor|
                                                                                                       |VersionNumCharData|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|VersionInfo|
                                                                                           (DELETE NIL
                                                                                                   (LIST |VersionNumCharData|)))
                                                                                     '|VersionInfo|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|VersionInfo|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|VersionInfo.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|VersionInfo.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|VersionInfo/VersionInfo.2.4| ATN-PARSER::INDEX))))))
                                (|VersionInfo/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|VersionInfo/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|VersionInfo.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|VersionInfo/fail.3| ATN-PARSER::INDEX))))))
                                (|VersionInfo/VersionInfo.2.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.10|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|VersionInfo.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|VersionInfo/VersionInfo.2.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.11|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|VersionInfo/VersionInfo.2.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|VersionInfo/VersionInfo.2.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |VersionNumCharData|)
                                                                    (COND
                                                                     ((|IS-VersionNumCharData| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|VersionNumCharData|)
                                                                      (SETF |VersionNumCharData|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM
                                                                                   #'|VersionNumCharData-Constructor|
                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|VersionNumCharData|
                                                                                            ATN-PARSER::|item|)
                                                                                      '|VersionNumCharData|)))
                                                                      (|VersionInfo/VersionInfo.2.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|VersionNumCharData|) NIL)))))
                                (|VersionInfo/VersionInfo.2.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.13|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|VersionInfo.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|VersionInfo/VersionInfo.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |version|)
                                                                    (COND
                                                                     ((|IS-versionToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|version|)
                                                                      (|VersionInfo/VersionInfo.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|version|)
                                                                      (|VersionInfo/fail.3| ATN-PARSER::INDEX))))))
                                (|VersionInfo/VersionInfo.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |Eq|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Eq|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (SETF ATN-PARSER::RESULT ATN-PARSER::RESULT)
                                                                        (|VersionInfo/VersionInfo.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Eq|)
                                                                        (|VersionInfo/fail.3| ATN-PARSER::INDEX)))))))
                                (|VersionInfo/VersionInfo.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.6|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |VersionInfo/VersionInfo.2.8|)
                                                                      (|VersionInfo/VersionInfo.2.8| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |VersionInfo/VersionInfo.2.11|)
                                                                      (|VersionInfo/VersionInfo.2.11| ATN-PARSER::INDEX))
                                                                     (|VersionInfo/fail.3| ATN-PARSER::INDEX)))))
                                (|VersionInfo/VersionInfo.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|VersionInfo/VersionInfo.2.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|VersionInfo/VersionInfo.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |VersionInfo/VersionInfo.2.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |VersionNumCharData|)
                                                                    (COND
                                                                     ((|IS-VersionNumCharData| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|VersionNumCharData|)
                                                                      (SETF |VersionNumCharData|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM
                                                                                   #'|VersionNumCharData-Constructor|
                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|VersionNumCharData|
                                                                                            ATN-PARSER::|item|)
                                                                                      '|VersionNumCharData|)))
                                                                      (|VersionInfo/VersionInfo.2.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|VersionNumCharData|) NIL))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |VersionInfo.2| |VersionInfo.7| |VersionInfo/fail.3|
                           |VersionInfo/start.1| |VersionInfo/VersionInfo.2.10| |VersionInfo/VersionInfo.2.11|
                           |VersionInfo/VersionInfo.2.12| |VersionInfo/VersionInfo.2.13| |VersionInfo/VersionInfo.2.4|
                           |VersionInfo/VersionInfo.2.5| |VersionInfo/VersionInfo.2.6| |VersionInfo/VersionInfo.2.8|
                           |VersionInfo/VersionInfo.2.9|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|VersionInfo/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|VersionInfo| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|VersionInfo| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Eq-INDEX|)
 (DEFUN |Eq| (ATN-PARSER::INDEX &AUX)
   "{25} Eq ::= S* '=' S*
NIL"
   (DECLARE (SPECIAL |Eq-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Eq-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Eq-INDEX| ATN-PARSER::INDEX)
       (LET ((|Eq-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Eq| *ATN-STACK))
             (*PARSETABLE* |Eq-Parsetable|))
         (DECLARE (SPECIAL |Eq-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Eq|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Eq|)
                                  (RETURN-FROM |Eq| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Eq| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Eq.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq.2|
                                                   (%ATN-EDGE-BLOCK (POP |Eq|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Eq|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Eq|
                                                                                  ATN-PARSER::INDEX (LIST))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Eq-Constructor|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Eq| (DELETE NIL (LIST)))
                                                                                     '|Eq|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Eq|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Eq.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Eq.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|Eq/Eq.2.4| ATN-PARSER::INDEX))))))
                                (|Eq.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Eq.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|Eq.2| ATN-PARSER::INDEX))))))
                                (|Eq/Eq.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq/Eq.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:=)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:=) (SETF *ATN-TERM* '|xml|:=)
                                                                      (|Eq/Eq.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:=)
                                                                      (|Eq/fail.3| ATN-PARSER::INDEX))))))
                                (|Eq/Eq.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq/Eq.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Eq.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|Eq.2| ATN-PARSER::INDEX))))))
                                (|Eq/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Eq/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Eq/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Eq.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|Eq/Eq.2.4| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Eq.2| |Eq.6| |Eq.7| |Eq/Eq.2.4| |Eq/Eq.2.5| |Eq/fail.3|
                           |Eq/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|Eq/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Eq| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Eq| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |MiscSequence-INDEX|)
 (DEFUN |MiscSequence| (ATN-PARSER::INDEX &AUX (|Misc| NIL) (|MiscSequence| NIL))
   "MiscSequence ::= Misc MiscSequence?
(|Misc| |MiscSequence|)"
   (DECLARE (SPECIAL |MiscSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |MiscSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |MiscSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|MiscSequence-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|MiscSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |MiscSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |MiscSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|MiscSequence|)
                                  (RETURN-FROM |MiscSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |MiscSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|MiscSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MiscSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |MiscSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|MiscSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|MiscSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|Misc| |Misc| '|MiscSequence|
                                                                                        |MiscSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|MiscSequence-Constructor|
                                                                                                       |Misc| |MiscSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|MiscSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Misc| |MiscSequence|)))
                                                                                     '|MiscSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|MiscSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|MiscSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MiscSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|MiscSequence/MiscSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MiscSequence/MiscSequence.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |MiscSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|MiscSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |MiscSequence| ATN-PARSER::RESULT))
                                                                        (|MiscSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|MiscSequence|)
                                                                        (|MiscSequence.2| ATN-PARSER::INDEX)))))))
                                (|MiscSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MiscSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |Misc|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Misc|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |Misc| ATN-PARSER::RESULT))
                                                                        (|MiscSequence/MiscSequence.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Misc|)
                                                                        (|MiscSequence/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |MiscSequence.2| |MiscSequence/fail.3|
                           |MiscSequence/MiscSequence.2.4| |MiscSequence/start.1|))
                         (|MiscSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|MiscSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|MiscSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Misc-INDEX|)
 (DEFUN |Misc| (ATN-PARSER::INDEX &AUX (|Comment| NIL) (|Pi| NIL))
   "{27} Misc ::= (Comment | Pi | S+)
(|Comment| |Pi|)"
   (DECLARE (SPECIAL |Misc-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Misc-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Misc-INDEX| ATN-PARSER::INDEX)
       (LET ((|Misc-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Misc| *ATN-STACK)))
         (DECLARE (SPECIAL |Misc-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Misc|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Misc|)
                                  (RETURN-FROM |Misc| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Misc| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Misc.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Misc.2|
                                                   (%ATN-EDGE-BLOCK (POP |Misc|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Misc|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Misc|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|Comment| |Comment| '|Pi| |Pi|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Misc-Constructor|
                                                                                                       |Comment| |Pi|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Misc|
                                                                                           (DELETE NIL (LIST |Comment| |Pi|)))
                                                                                     '|Misc|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Misc|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Misc.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Misc.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Misc.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|Misc.2| ATN-PARSER::INDEX))))))
                                (|Misc/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Misc/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Misc/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Misc/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |Comment|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Comment| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Comment| ATN-PARSER::RESULT))
                                                                                          (|Misc.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Comment|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Pi|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Pi|
                                                                                                                              ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Pi| ATN-PARSER::RESULT))
                                                                                          (|Misc.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Pi|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                                      (COND
                                                                                       ((IS-S ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* 'S)
                                                                                        (|Misc.4| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM?* 'S) NIL)))
                                                                     (|Misc/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Misc.2| |Misc.4| |Misc/fail.3| |Misc/start.1|))
                         (|Misc/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Misc| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Misc| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DoctypeDecl-INDEX|)
 (DEFUN |DoctypeDecl| (ATN-PARSER::INDEX &AUX (|ExternalID| NIL) (|IntSubsetDecl| NIL) (|QName| NIL))
   "{28} DoctypeDecl ::= '<!DOCTYPE' S+ QName (S ExternalID)? S* ('['
                                                              IntSubsetDecl*
                                                              ']' S*)? '>'
(|ExternalID| |IntSubsetDecl| |QName|)"
   (DECLARE (SPECIAL |DoctypeDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DoctypeDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DoctypeDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|DoctypeDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|DoctypeDecl| *ATN-STACK))
             (*IN-DTD* T)
             (*PARSETABLE* |DoctypeDecl-Parsetable|))
         (DECLARE (SPECIAL |DoctypeDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DoctypeDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DoctypeDecl|)
                                  (RETURN-FROM |DoctypeDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DoctypeDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DoctypeDecl.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|DoctypeDecl/DoctypeDecl.2.5| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl.13|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|DoctypeDecl/DoctypeDecl.2.8| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl.18| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl.18|
                                                   (%ATN-EDGE-BLOCK (PUSH |IntSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|IntSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |IntSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |IntSubsetDecl|)))
                                                                        (|DoctypeDecl.18| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|IntSubsetDecl|)
                                                                        (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16|
                                                                         ATN-PARSER::INDEX)))))))
                                (|DoctypeDecl.19| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl.19|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl.19| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|DoctypeDecl/DoctypeDecl.2.9| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |DoctypeDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DoctypeDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|DoctypeDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|ExternalID| |ExternalID| '|IntSubsetDecl|
                                                                                        |IntSubsetDecl| '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|DoctypeDecl-Constructor|
                                                                                                       |ExternalID| |IntSubsetDecl|
                                                                                                       |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DoctypeDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |ExternalID|
                                                                                                         |IntSubsetDecl| |QName|)))
                                                                                     '|DoctypeDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|DoctypeDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DoctypeDecl/DoctypeDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|DoctypeDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl/DoctypeDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl.2.5|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|DoctypeDecl/DoctypeDecl.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|DoctypeDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|DoctypeDecl/DoctypeDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|)
                                                                    (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|
                                                                     ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |DoctypeDecl/DoctypeDecl.2.7|)
                                                                    (|DoctypeDecl/DoctypeDecl.2.7| ATN-PARSER::INDEX))))
                                (|DoctypeDecl/DoctypeDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|DoctypeDecl/DoctypeDecl.2.8| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl/DoctypeDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|)
                                                                    (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|
                                                                     ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |DoctypeDecl/DoctypeDecl.2.9|)
                                                                    (|DoctypeDecl/DoctypeDecl.2.9| ATN-PARSER::INDEX))))
                                (|DoctypeDecl/DoctypeDecl.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|DoctypeDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|DoctypeDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExternalID|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExternalID|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExternalID| ATN-PARSER::RESULT))
                                                                        (|DoctypeDecl/DoctypeDecl.2.7| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExternalID|) NIL))))))
                                (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:[)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:[) (SETF *ATN-TERM* '|xml|:[)
                                                                      (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:[) NIL)))))
                                (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15|
                                                   (%ATN-EDGE-BLOCK (PUSH |IntSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|IntSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |IntSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |IntSubsetDecl|)))
                                                                        (|DoctypeDecl.18| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|IntSubsetDecl|)
                                                                        (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16|
                                                                         ATN-PARSER::INDEX)))))))
                                (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:])
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:]) (SETF *ATN-TERM* '|xml|:])
                                                                      (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:]) NIL)))))
                                (|DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DoctypeDecl.19| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|DoctypeDecl/DoctypeDecl.2.9| ATN-PARSER::INDEX))))))
                                (|DoctypeDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DoctypeDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DoctypeDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<!DOCTYPE)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<!DOCTYPE)
                                                                      (SETF *ATN-TERM* '|xml|:<!DOCTYPE)
                                                                      (|DoctypeDecl/DoctypeDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<!DOCTYPE)
                                                                      (|DoctypeDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DoctypeDecl.10| |DoctypeDecl.13| |DoctypeDecl.18|
                           |DoctypeDecl.19| |DoctypeDecl.2| |DoctypeDecl/DoctypeDecl.2.4| |DoctypeDecl/DoctypeDecl.2.5|
                           |DoctypeDecl/DoctypeDecl.2.6| |DoctypeDecl/DoctypeDecl.2.7| |DoctypeDecl/DoctypeDecl.2.8|
                           |DoctypeDecl/DoctypeDecl.2.9| |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.11|
                           |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.7.12| |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.14|
                           |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.15| |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.16|
                           |DoctypeDecl/DoctypeDecl/DoctypeDecl.2.9.17| |DoctypeDecl/fail.3| |DoctypeDecl/start.1|))
                         (|DoctypeDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DoctypeDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DoctypeDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |IntSubsetDecl-INDEX|)
 (DEFUN |IntSubsetDecl| (ATN-PARSER::INDEX &AUX (|DeclSep| NIL) (|MarkupDecl| NIL))
   "IntSubsetDecl ::= (DeclSep | MarkupDecl)
(|DeclSep| |MarkupDecl|)"
   (DECLARE (SPECIAL |IntSubsetDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |IntSubsetDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |IntSubsetDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|IntSubsetDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|IntSubsetDecl| *ATN-STACK))
             (*IN-INTERNAL-SUBSET* T)
             (*PARSETABLE* |IntSubsetDecl-Parsetable|))
         (DECLARE (SPECIAL |IntSubsetDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |IntSubsetDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|IntSubsetDecl|)
                                  (RETURN-FROM |IntSubsetDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |IntSubsetDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|IntSubsetDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IntSubsetDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |IntSubsetDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|IntSubsetDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|IntSubsetDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|DeclSep| |DeclSep| '|MarkupDecl|
                                                                                        |MarkupDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|IntSubsetDecl-Constructor| |DeclSep|
                                                                                  |MarkupDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|IntSubsetDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |DeclSep| |MarkupDecl|)))
                                                                                     '|IntSubsetDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|IntSubsetDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|IntSubsetDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IntSubsetDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|IntSubsetDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IntSubsetDecl/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |DeclSep|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|DeclSep| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |DeclSep| ATN-PARSER::RESULT))
                                                                                          (|IntSubsetDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|DeclSep|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |MarkupDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|MarkupDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |MarkupDecl| ATN-PARSER::RESULT))
                                                                                          (|IntSubsetDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|MarkupDecl|)
                                                                                          NIL))))
                                                                     (|IntSubsetDecl/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |IntSubsetDecl.2| |IntSubsetDecl/fail.3|
                           |IntSubsetDecl/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|IntSubsetDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|IntSubsetDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|IntSubsetDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DeclSep-INDEX|)
 (DEFUN |DeclSep| (ATN-PARSER::INDEX &AUX (|ParsedExtSubset| NIL) (|PEReference| NIL))
   "{28a} DeclSep ::= (S+ | PEReference | ParsedExtSubset)
(|ParsedExtSubset| |PEReference|)"
   (DECLARE (SPECIAL |DeclSep-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DeclSep-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DeclSep-INDEX| ATN-PARSER::INDEX)
       (LET ((|DeclSep-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|DeclSep| *ATN-STACK))
             (*IN-DECL-SEP* T))
         (DECLARE (SPECIAL |DeclSep-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DeclSep|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DeclSep|)
                                  (RETURN-FROM |DeclSep| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DeclSep| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DeclSep.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DeclSep.2|
                                                   (%ATN-EDGE-BLOCK (POP |DeclSep|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DeclSep|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|DeclSep|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|ParsedExtSubset| |ParsedExtSubset|
                                                                                        '|PEReference| |PEReference|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|DeclSep-Constructor|
                                                                                                       |ParsedExtSubset|
                                                                                                       |PEReference|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DeclSep|
                                                                                           (DELETE NIL
                                                                                                   (LIST |ParsedExtSubset|
                                                                                                         |PEReference|)))
                                                                                     '|DeclSep|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|DeclSep|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DeclSep.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DeclSep.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DeclSep.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|DeclSep.2| ATN-PARSER::INDEX))))))
                                (|DeclSep/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DeclSep/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DeclSep/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DeclSep/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                                      (COND
                                                                                       ((IS-S ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* 'S)
                                                                                        (|DeclSep.4| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM?* 'S) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |PEReference|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|PEReference| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |PEReference|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|DeclSep.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|PEReference|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |ParsedExtSubset|)
                                                                      (COND
                                                                       ((|IS-ParsedExtSubset| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|ParsedExtSubset|)
                                                                        (SETF |ParsedExtSubset|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM
                                                                                     #'|ParsedExtSubset-Constructor|
                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|ParsedExtSubset|
                                                                                              ATN-PARSER::|item|)
                                                                                        '|ParsedExtSubset|)))
                                                                        (|DeclSep.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|ParsedExtSubset|) NIL)))
                                                                     (|DeclSep/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DeclSep.2| |DeclSep.4| |DeclSep/fail.3| |DeclSep/start.1|))
                         (|DeclSep/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DeclSep| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DeclSep| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |MarkupDecl-INDEX|)
 (DEFUN |MarkupDecl|
        (ATN-PARSER::INDEX
         &AUX (|AttlistDecl| NIL) (|Comment| NIL) (|ElementDecl| NIL) (|EntityDecl| NIL) (|NotationDecl| NIL) (|Pi| NIL))
   "{29} MarkupDecl ::= (ElementDecl | AttlistDecl | EntityDecl | NotationDecl | Pi | Comment)
(|AttlistDecl| |Comment| |ElementDecl| |EntityDecl| |NotationDecl| |Pi|)"
   (DECLARE (SPECIAL |MarkupDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |MarkupDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |MarkupDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|MarkupDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|MarkupDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |MarkupDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |MarkupDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|MarkupDecl|)
                                  (RETURN-FROM |MarkupDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |MarkupDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|MarkupDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MarkupDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |MarkupDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|MarkupDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|MarkupDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|AttlistDecl| |AttlistDecl| '|Comment|
                                                                                        |Comment| '|ElementDecl| |ElementDecl|
                                                                                        '|EntityDecl| |EntityDecl| '|NotationDecl|
                                                                                        |NotationDecl| '|Pi| |Pi|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|MarkupDecl-Constructor|
                                                                                                       |AttlistDecl| |Comment|
                                                                                                       |ElementDecl| |EntityDecl|
                                                                                                       |NotationDecl| |Pi|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|MarkupDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttlistDecl| |Comment|
                                                                                                         |ElementDecl| |EntityDecl|
                                                                                                         |NotationDecl| |Pi|)))
                                                                                     '|MarkupDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|MarkupDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|MarkupDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MarkupDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|MarkupDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |MarkupDecl/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |ElementDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|ElementDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |ElementDecl|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|MarkupDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|ElementDecl|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |AttlistDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|AttlistDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |AttlistDecl|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|MarkupDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|AttlistDecl|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |EntityDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|EntityDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |EntityDecl| ATN-PARSER::RESULT))
                                                                                          (|MarkupDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|EntityDecl|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |NotationDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|NotationDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |NotationDecl|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|MarkupDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|NotationDecl|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Pi|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Pi|
                                                                                                                              ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Pi| ATN-PARSER::RESULT))
                                                                                          (|MarkupDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Pi|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Comment|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Comment| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Comment| ATN-PARSER::RESULT))
                                                                                          (|MarkupDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Comment|) NIL))))
                                                                     (|MarkupDecl/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |MarkupDecl.2| |MarkupDecl/fail.3| |MarkupDecl/start.1|))
                         (|MarkupDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|MarkupDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|MarkupDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ExtSubset-INDEX|)
 (DEFUN |ExtSubset| (ATN-PARSER::INDEX &AUX (|ExtSubsetDecl| NIL) (|TextDecl| NIL))
   "{30} ExtSubset ::= TextDecl? ExtSubsetDecl*
(|ExtSubsetDecl| |TextDecl|)"
   (DECLARE (SPECIAL |ExtSubset-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ExtSubset-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ExtSubset-INDEX| ATN-PARSER::INDEX)
       (LET ((|ExtSubset-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ExtSubset| *ATN-STACK))
             (*IN-DTD* T))
         (DECLARE (SPECIAL |ExtSubset-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ExtSubset|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ExtSubset|)
                                  (RETURN-FROM |ExtSubset| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ExtSubset| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ExtSubset.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubset.2|
                                                   (%ATN-EDGE-BLOCK (POP |ExtSubset|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ExtSubset|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|ExtSubset|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|ExtSubsetDecl| |ExtSubsetDecl|
                                                                                        '|TextDecl| |TextDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|ExtSubset-Constructor|
                                                                                                       |ExtSubsetDecl| |TextDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ExtSubset|
                                                                                           (DELETE NIL
                                                                                                   (LIST |ExtSubsetDecl|
                                                                                                         |TextDecl|)))
                                                                                     '|ExtSubset|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ExtSubset|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ExtSubset.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubset.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExtSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExtSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExtSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |ExtSubsetDecl|)))
                                                                        (|ExtSubset.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExtSubsetDecl|)
                                                                        (|ExtSubset.2| ATN-PARSER::INDEX)))))))
                                (|ExtSubset/ExtSubset.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubset/ExtSubset.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExtSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExtSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExtSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |ExtSubsetDecl|)))
                                                                        (|ExtSubset.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExtSubsetDecl|)
                                                                        (|ExtSubset.2| ATN-PARSER::INDEX)))))))
                                (|ExtSubset/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubset/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ExtSubset/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubset/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |TextDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|TextDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |TextDecl| ATN-PARSER::RESULT))
                                                                        (|ExtSubset/ExtSubset.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|TextDecl|)
                                                                        (|ExtSubset/ExtSubset.2.4| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ExtSubset.2| |ExtSubset.5| |ExtSubset/ExtSubset.2.4|
                           |ExtSubset/fail.3| |ExtSubset/start.1|))
                         (|ExtSubset/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ExtSubset| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ExtSubset| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ExtSubsetDecl-INDEX|)
 (DEFUN |ExtSubsetDecl| (ATN-PARSER::INDEX &AUX (|ConditionalSect| NIL) (|DeclSep| NIL) (|MarkupDecl| NIL))
   "{31} ExtSubsetDecl ::= (MarkupDecl | ConditionalSect | DeclSep)
(|ConditionalSect| |DeclSep| |MarkupDecl|)"
   (DECLARE (SPECIAL |ExtSubsetDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ExtSubsetDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ExtSubsetDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|ExtSubsetDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ExtSubsetDecl| *ATN-STACK))
             (*PARSETABLE* |ExtSubsetDecl-Parsetable|))
         (DECLARE (SPECIAL |ExtSubsetDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ExtSubsetDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ExtSubsetDecl|)
                                  (RETURN-FROM |ExtSubsetDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ExtSubsetDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ExtSubsetDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubsetDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |ExtSubsetDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ExtSubsetDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ExtSubsetDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|ConditionalSect| |ConditionalSect|
                                                                                        '|DeclSep| |DeclSep| '|MarkupDecl|
                                                                                        |MarkupDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|ExtSubsetDecl-Constructor| |ConditionalSect|
                                                                                  |DeclSep| |MarkupDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ExtSubsetDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |ConditionalSect|
                                                                                                         |DeclSep| |MarkupDecl|)))
                                                                                     '|ExtSubsetDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ExtSubsetDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ExtSubsetDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubsetDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ExtSubsetDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtSubsetDecl/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |MarkupDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|MarkupDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |MarkupDecl| ATN-PARSER::RESULT))
                                                                                          (|ExtSubsetDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|MarkupDecl|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |ConditionalSect|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|ConditionalSect| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |ConditionalSect|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|ExtSubsetDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|ConditionalSect|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |DeclSep|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|DeclSep| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |DeclSep| ATN-PARSER::RESULT))
                                                                                          (|ExtSubsetDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|DeclSep|) NIL))))
                                                                     (|ExtSubsetDecl/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ExtSubsetDecl.2| |ExtSubsetDecl/fail.3|
                           |ExtSubsetDecl/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|ExtSubsetDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ExtSubsetDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ExtSubsetDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |SDDecl-INDEX|)
 (DEFUN |SDDecl| (ATN-PARSER::INDEX &AUX (|YesOrNo| NIL))
   "{32} SDDecl ::= S+ standalone Eq ((('\"' YesOrNo '\"') | (''' YesOrNo ''')))
(|YesOrNo|)"
   (DECLARE (SPECIAL |SDDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |SDDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |SDDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|SDDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|SDDecl| *ATN-STACK))
             (*PARSETABLE* |SDDecl-Parsetable|))
         (DECLARE (SPECIAL |SDDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |SDDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|SDDecl|)
                                  (RETURN-FROM |SDDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |SDDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|SDDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |SDDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|SDDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|SDDecl|
                                                                                  ATN-PARSER::INDEX (LIST '|YesOrNo| |YesOrNo|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|SDDecl-Constructor|
                                                                                                       |YesOrNo|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|SDDecl| (DELETE NIL (LIST |YesOrNo|)))
                                                                                     '|SDDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|SDDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|SDDecl.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|SDDecl.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|SDDecl/SDDecl.2.4| ATN-PARSER::INDEX))))))
                                (|SDDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|SDDecl/SDDecl.2.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.10|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|SDDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|SDDecl/SDDecl.2.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.11|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|SDDecl/SDDecl.2.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|SDDecl/SDDecl.2.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.12|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |YesOrNo|)
                                                                    (COND
                                                                     ((|IS-YesOrNo| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|YesOrNo|)
                                                                      (SETF |YesOrNo|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|YesOrNo-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|YesOrNo| ATN-PARSER::|item|)
                                                                                      '|YesOrNo|)))
                                                                      (|SDDecl/SDDecl.2.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|YesOrNo|) NIL)))))
                                (|SDDecl/SDDecl.2.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.13|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|SDDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|SDDecl/SDDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |standalone|)
                                                                    (COND
                                                                     ((|IS-standaloneToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|standalone|)
                                                                      (|SDDecl/SDDecl.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|standalone|)
                                                                      (|SDDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|SDDecl/SDDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |Eq|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Eq|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (SETF ATN-PARSER::RESULT ATN-PARSER::RESULT)
                                                                        (|SDDecl/SDDecl.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Eq|)
                                                                        (|SDDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|SDDecl/SDDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.6|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |SDDecl/SDDecl.2.8|)
                                                                                      (|SDDecl/SDDecl.2.8| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |SDDecl/SDDecl.2.11|)
                                                                                      (|SDDecl/SDDecl.2.11| ATN-PARSER::INDEX))
                                                                     (|SDDecl/fail.3| ATN-PARSER::INDEX)))))
                                (|SDDecl/SDDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|SDDecl/SDDecl.2.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|SDDecl/SDDecl.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/SDDecl.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |YesOrNo|)
                                                                    (COND
                                                                     ((|IS-YesOrNo| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|YesOrNo|)
                                                                      (SETF |YesOrNo|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|YesOrNo-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|YesOrNo| ATN-PARSER::|item|)
                                                                                      '|YesOrNo|)))
                                                                      (|SDDecl/SDDecl.2.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|YesOrNo|) NIL)))))
                                (|SDDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |SDDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|SDDecl.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|SDDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |SDDecl.2| |SDDecl.7| |SDDecl/fail.3| |SDDecl/SDDecl.2.10|
                           |SDDecl/SDDecl.2.11| |SDDecl/SDDecl.2.12| |SDDecl/SDDecl.2.13| |SDDecl/SDDecl.2.4| |SDDecl/SDDecl.2.5|
                           |SDDecl/SDDecl.2.6| |SDDecl/SDDecl.2.8| |SDDecl/SDDecl.2.9| |SDDecl/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|SDDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|SDDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|SDDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Element-INDEX|)
 (DEFUN |Element| (ATN-PARSER::INDEX &AUX (|Content| NIL) (|ETag| NIL) (|STag| NIL))
   "{39} Element ::= STag (('/>' | ('>' Content* ETag)))
(|Content| |ETag| |STag|)"
   (DECLARE (SPECIAL |Element-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Element-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Element-INDEX| ATN-PARSER::INDEX)
       (LET ((|Element-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Element| *ATN-STACK))
             (*NAMESPACE-BINDINGS* *NAMESPACE-BINDINGS*)
             (*DEFAULT-NAMESPACE* *DEFAULT-NAMESPACE*)
             (*CONSTRUCTION-CONTEXT* *CONSTRUCTION-CONTEXT*))
         (DECLARE (SPECIAL |Element-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Element|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Element|)
                                  (RETURN-FROM |Element| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Element| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Element.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element.2|
                                                   (%ATN-EDGE-BLOCK (POP |Element|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Element|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Element|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|Content| |Content| '|ETag| |ETag| '|STag|
                                                                                        |STag|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|Element-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |Content| |ETag| |STag|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Element|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Content| |ETag| |STag|)))
                                                                                     '|Element|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Element|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Element.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |Content|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Content|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Content| (CONS ATN-PARSER::RESULT |Content|)))
                                                                        (|Element.8| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Content|)
                                                                        (|Element/Element.2.7| ATN-PARSER::INDEX)))))))
                                (|Element/Element.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element/Element.2.4|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:/>)
                                                                                      (COND
                                                                                       ((EQ ATN-PARSER::|item| '|xml|:/>)
                                                                                        (SETF *ATN-TERM* '|xml|:/>)
                                                                                        (|Element.2| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM?* '|xml|:/>) NIL)))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Element/Element.2.5|)
                                                                                      (|Element/Element.2.5| ATN-PARSER::INDEX))
                                                                     (|Element/fail.3| ATN-PARSER::INDEX)))))
                                (|Element/Element.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element/Element.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|Element/Element.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>) NIL)))))
                                (|Element/Element.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element/Element.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |Content|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Content|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Content| (CONS ATN-PARSER::RESULT |Content|)))
                                                                        (|Element.8| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Content|)
                                                                        (|Element/Element.2.7| ATN-PARSER::INDEX)))))))
                                (|Element/Element.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element/Element.2.7|
                                                   (%ATN-EDGE-BLOCK (PUSH |ETag|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ETag|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |ETag| ATN-PARSER::RESULT))
                                                                        (|Element.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ETag|) NIL))))))
                                (|Element/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Element/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Element/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |STag|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|STag|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |STag| ATN-PARSER::RESULT))
                                                                        (|Element/Element.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|STag|)
                                                                        (|Element/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Element.2| |Element.8| |Element/Element.2.4|
                           |Element/Element.2.5| |Element/Element.2.6| |Element/Element.2.7| |Element/fail.3| |Element/start.1|))
                         (|Element/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Element| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Element| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |STag-INDEX|)
 (DEFUN |STag| (ATN-PARSER::INDEX &AUX (|AttributeSequence| NIL) (|QName| NIL))
   "{40} STag ::= '<' QName AttributeSequence? S*
(|AttributeSequence| |QName|)"
   (DECLARE (SPECIAL |STag-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |STag-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |STag-INDEX| ATN-PARSER::INDEX)
       (LET ((|STag-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|STag| *ATN-STACK))
             (*PARSETABLE* |STag-Parsetable|))
         (DECLARE (SPECIAL |STag-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |STag|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|STag|)
                                  (RETURN-FROM |STag| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |STag| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|STag.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag.2|
                                                   (%ATN-EDGE-BLOCK (POP |STag|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|STag|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|STag|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|AttributeSequence| |AttributeSequence|
                                                                                        '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|STag-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |AttributeSequence| |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|STag|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttributeSequence|
                                                                                                         |QName|)))
                                                                                     '|STag|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|STag|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|STag.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|STag.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|STag.2| ATN-PARSER::INDEX))))))
                                (|STag/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|STag/STag.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag/STag.2.4|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|STag/STag.2.5| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|STag/fail.3| ATN-PARSER::INDEX)))))))
                                (|STag/STag.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag/STag.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttributeSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttributeSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttributeSequence| ATN-PARSER::RESULT))
                                                                        (|STag/STag.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttributeSequence|)
                                                                        (|STag/STag.2.6| ATN-PARSER::INDEX)))))))
                                (|STag/STag.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag/STag.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|STag.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) (|STag.2| ATN-PARSER::INDEX))))))
                                (|STag/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |STag/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<) (SETF *ATN-TERM* '|xml|:<)
                                                                      (|STag/STag.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<)
                                                                      (|STag/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |STag.2| |STag.7| |STag/fail.3| |STag/STag.2.4|
                           |STag/STag.2.5| |STag/STag.2.6| |STag/start.1|))
                         (|STag/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|STag| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|STag| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttributeSequence-INDEX|)
 (DEFUN |AttributeSequence| (ATN-PARSER::INDEX &AUX (|Attribute| NIL) (|AttributeSequence| NIL))
   "AttributeSequence ::= Attribute AttributeSequence?
(|Attribute| |AttributeSequence|)"
   (DECLARE (SPECIAL |AttributeSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttributeSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttributeSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttributeSequence-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|AttributeSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |AttributeSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttributeSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttributeSequence|)
                                  (RETURN-FROM |AttributeSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttributeSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttributeSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttributeSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttributeSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttributeSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|AttributeSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|Attribute| |Attribute|
                                                                                        '|AttributeSequence| |AttributeSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|AttributeSequence-Constructor| |Attribute|
                                                                                  |AttributeSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttributeSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Attribute|
                                                                                                         |AttributeSequence|)))
                                                                                     '|AttributeSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttributeSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttributeSequence/AttributeSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttributeSequence/AttributeSequence.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttributeSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttributeSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttributeSequence| ATN-PARSER::RESULT))
                                                                        (|AttributeSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttributeSequence|)
                                                                        (|AttributeSequence.2| ATN-PARSER::INDEX)))))))
                                (|AttributeSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttributeSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttributeSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttributeSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |Attribute|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Attribute|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Attribute| ATN-PARSER::RESULT))
                                                                        (|AttributeSequence/AttributeSequence.2.4|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Attribute|)
                                                                        (|AttributeSequence/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttributeSequence.2|
                           |AttributeSequence/AttributeSequence.2.4| |AttributeSequence/fail.3| |AttributeSequence/start.1|))
                         (|AttributeSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttributeSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttributeSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Attribute-INDEX|)
 (DEFUN |Attribute| (ATN-PARSER::INDEX &AUX (|AttValue| NIL) (|QName| NIL))
   "{41} Attribute ::= S+ QName Eq AttValue
(|AttValue| |QName|)"
   (DECLARE (SPECIAL |Attribute-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Attribute-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Attribute-INDEX| ATN-PARSER::INDEX)
       (LET ((|Attribute-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Attribute| *ATN-STACK))
             (*PARSETABLE* |Attribute-Parsetable|))
         (DECLARE (SPECIAL |Attribute-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Attribute|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Attribute|)
                                  (RETURN-FROM |Attribute| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Attribute| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Attribute.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute.2|
                                                   (%ATN-EDGE-BLOCK (POP |Attribute|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Attribute|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Attribute|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|AttValue| |AttValue| '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|Attribute-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |AttValue| |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Attribute|
                                                                                           (DELETE NIL (LIST |AttValue| |QName|)))
                                                                                     '|Attribute|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Attribute|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Attribute.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Attribute.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Attribute/Attribute.2.4| ATN-PARSER::INDEX))))))
                                (|Attribute/Attribute.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute/Attribute.2.4|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|Attribute/Attribute.2.5| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|Attribute/fail.3| ATN-PARSER::INDEX)))))))
                                (|Attribute/Attribute.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute/Attribute.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |Eq|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Eq|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (SETF ATN-PARSER::RESULT ATN-PARSER::RESULT)
                                                                        (|Attribute/Attribute.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Eq|)
                                                                        (|Attribute/fail.3| ATN-PARSER::INDEX)))))))
                                (|Attribute/Attribute.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute/Attribute.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttValue|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttValue|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttValue| ATN-PARSER::RESULT))
                                                                        (|Attribute.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttValue|)
                                                                        (|Attribute/fail.3| ATN-PARSER::INDEX)))))))
                                (|Attribute/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Attribute/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Attribute/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Attribute.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Attribute/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Attribute.2| |Attribute.7| |Attribute/Attribute.2.4|
                           |Attribute/Attribute.2.5| |Attribute/Attribute.2.6| |Attribute/fail.3| |Attribute/start.1|))
                         (|Attribute/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Attribute| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Attribute| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ETag-INDEX|)
 (DEFUN |ETag| (ATN-PARSER::INDEX &AUX (|QName| NIL))
   "{42} ETag ::= '</' QName S* '>'
(|QName|)"
   (DECLARE (SPECIAL |ETag-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ETag-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ETag-INDEX| ATN-PARSER::INDEX)
       (LET ((|ETag-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ETag| *ATN-STACK))
             (*PARSETABLE* |ETag-Parsetable|))
         (DECLARE (SPECIAL |ETag-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ETag|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ETag|)
                                  (RETURN-FROM |ETag| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ETag| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ETag.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag.2|
                                                   (%ATN-EDGE-BLOCK (POP |ETag|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ETag|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|ETag|
                                                                                  ATN-PARSER::INDEX (LIST '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|ETag-Constructor|
                                                                                                       |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ETag| (DELETE NIL (LIST |QName|)))
                                                                                     '|ETag|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ETag|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ETag.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ETag.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ETag/ETag.2.6| ATN-PARSER::INDEX))))))
                                (|ETag/ETag.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag/ETag.2.4|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|ETag/ETag.2.5| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|ETag/fail.3| ATN-PARSER::INDEX)))))))
                                (|ETag/ETag.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag/ETag.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ETag.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ETag/ETag.2.6| ATN-PARSER::INDEX))))))
                                (|ETag/ETag.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag/ETag.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|ETag.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|ETag/fail.3| ATN-PARSER::INDEX))))))
                                (|ETag/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ETag/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ETag/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:</)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:</) (SETF *ATN-TERM* '|xml|:</)
                                                                      (|ETag/ETag.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:</)
                                                                      (|ETag/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ETag.2| |ETag.7| |ETag/ETag.2.4| |ETag/ETag.2.5|
                           |ETag/ETag.2.6| |ETag/fail.3| |ETag/start.1|))
                         (|ETag/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ETag| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ETag| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Content-INDEX|)
 (DEFUN |Content|
        (ATN-PARSER::INDEX
         &AUX (|CDSect| NIL) (|CharData| NIL) (|Comment| NIL) (|Element| NIL) (|ParsedReference| NIL) (|Pi| NIL) (|Reference| NIL))
   "{43} Content ::= (CharData | Element | Comment | Pi | CDSect | Reference | ParsedReference)
(|CDSect| |CharData| |Comment| |Element| |ParsedReference| |Pi| |Reference|)"
   (DECLARE (SPECIAL |Content-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Content-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Content-INDEX| ATN-PARSER::INDEX)
       (LET ((|Content-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|Content| *ATN-STACK))
             (*PARSETABLE* |Content-Parsetable|))
         (DECLARE (SPECIAL |Content-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Content|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Content|)
                                  (RETURN-FROM |Content| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Content| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Content.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Content.2|
                                                   (%ATN-EDGE-BLOCK (POP |Content|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Content|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Content|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|CDSect| |CDSect| '|CharData| |CharData|
                                                                                        '|Comment| |Comment| '|Element| |Element|
                                                                                        '|ParsedReference| |ParsedReference| '|Pi|
                                                                                        |Pi| '|Reference| |Reference|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|Content-Constructor| *CONSTRUCTION-CONTEXT*
                                                                                  |CDSect| |CharData| |Comment| |Element|
                                                                                  |ParsedReference| |Pi| |Reference|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Content|
                                                                                           (DELETE NIL
                                                                                                   (LIST |CDSect| |CharData|
                                                                                                         |Comment| |Element|
                                                                                                         |ParsedReference| |Pi|
                                                                                                         |Reference|)))
                                                                                     '|Content|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Content|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Content/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Content/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Content/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Content/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |CharData|)
                                                                      (COND
                                                                       ((|IS-CharData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|CharData|)
                                                                        (SETF |CharData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-PARSER::ATN-REDUCE-ITEM-WITH-CONTEXT
                                                                                     #'|CharData-Constructor|
                                                                                     *CONSTRUCTION-CONTEXT* ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|CharData| ATN-PARSER::|item|)
                                                                                        '|CharData|)))
                                                                        (|Content.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|CharData|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Element|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Element| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Element| ATN-PARSER::RESULT))
                                                                                          (|Content.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Element|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Comment|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Comment| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Comment| ATN-PARSER::RESULT))
                                                                                          (|Content.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Comment|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Pi|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Pi|
                                                                                                                              ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Pi| ATN-PARSER::RESULT))
                                                                                          (|Content.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Pi|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |CDSect|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|CDSect| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |CDSect| ATN-PARSER::RESULT))
                                                                                          (|Content.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|CDSect|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Reference|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Reference| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Reference| ATN-PARSER::RESULT))
                                                                                          (|Content.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Reference|) NIL))))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |ParsedReference|)
                                                                      (COND
                                                                       ((|IS-ParsedReference| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|ParsedReference|)
                                                                        (SETF |ParsedReference|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM
                                                                                     #'|ParsedReference-Constructor|
                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|ParsedReference|
                                                                                              ATN-PARSER::|item|)
                                                                                        '|ParsedReference|)))
                                                                        (|Content.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|ParsedReference|) NIL)))
                                                                     (|Content/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Content.2| |Content/fail.3| |Content/start.1|))
                         (|Content/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Content| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Content| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ElementDecl-INDEX|)
 (DEFUN |ElementDecl| (ATN-PARSER::INDEX &AUX (|ContentSpec| NIL) (|QName| NIL))
   "{45} ElementDecl ::= '<!ELEMENT' S+ QName S+ ContentSpec S* '>'
(|ContentSpec| |QName|)"
   (DECLARE (SPECIAL |ElementDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ElementDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ElementDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|ElementDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|ElementDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |ElementDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ElementDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ElementDecl|)
                                  (RETURN-FROM |ElementDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ElementDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ElementDecl.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ElementDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ElementDecl/ElementDecl.2.5| ATN-PARSER::INDEX))))))
                                (|ElementDecl.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ElementDecl.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ElementDecl/ElementDecl.2.7| ATN-PARSER::INDEX))))))
                                (|ElementDecl.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ElementDecl.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ElementDecl/ElementDecl.2.9| ATN-PARSER::INDEX))))))
                                (|ElementDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |ElementDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ElementDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ElementDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|ContentSpec| |ContentSpec| '|QName|
                                                                                        |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|ElementDecl-Constructor|
                                                                                                       |ContentSpec| |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ElementDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |ContentSpec| |QName|)))
                                                                                     '|ElementDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ElementDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ElementDecl/ElementDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/ElementDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ElementDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ElementDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|ElementDecl/ElementDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/ElementDecl.2.5|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|ElementDecl/ElementDecl.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|ElementDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|ElementDecl/ElementDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/ElementDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ElementDecl.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ElementDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|ElementDecl/ElementDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/ElementDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (PUSH |ContentSpec|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ContentSpec|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ContentSpec| ATN-PARSER::RESULT))
                                                                        (|ElementDecl/ElementDecl.2.8| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ContentSpec|)
                                                                        (|ElementDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|ElementDecl/ElementDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/ElementDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ElementDecl.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ElementDecl/ElementDecl.2.9| ATN-PARSER::INDEX))))))
                                (|ElementDecl/ElementDecl.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/ElementDecl.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|ElementDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|ElementDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|ElementDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ElementDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ElementDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<!ELEMENT)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<!ELEMENT)
                                                                      (SETF *ATN-TERM* '|xml|:<!ELEMENT)
                                                                      (|ElementDecl/ElementDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<!ELEMENT)
                                                                      (|ElementDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ElementDecl.10| |ElementDecl.11| |ElementDecl.12|
                           |ElementDecl.2| |ElementDecl/ElementDecl.2.4| |ElementDecl/ElementDecl.2.5|
                           |ElementDecl/ElementDecl.2.6| |ElementDecl/ElementDecl.2.7| |ElementDecl/ElementDecl.2.8|
                           |ElementDecl/ElementDecl.2.9| |ElementDecl/fail.3| |ElementDecl/start.1|))
                         (|ElementDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ElementDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ElementDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ContentSpec-INDEX|)
 (DEFUN |ContentSpec| (ATN-PARSER::INDEX &AUX (ANY NIL) (|Children| NIL) (EMPTY NIL) (|Mixed| NIL))
   "{46} ContentSpec ::= (EMPTY | ANY | Mixed | Children)
(ANY |Children| EMPTY |Mixed|)"
   (DECLARE (SPECIAL |ContentSpec-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ContentSpec-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ContentSpec-INDEX| ATN-PARSER::INDEX)
       (LET ((|ContentSpec-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ContentSpec| *ATN-STACK))
             (*PARSETABLE* |ContentSpec-Parsetable|))
         (DECLARE (SPECIAL |ContentSpec-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ContentSpec|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ContentSpec|)
                                  (RETURN-FROM |ContentSpec| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ContentSpec| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ContentSpec.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ContentSpec.2|
                                                   (%ATN-EDGE-BLOCK (POP |ContentSpec|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ContentSpec|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ContentSpec| ATN-PARSER::INDEX
                                                                                  (LIST 'ANY ANY '|Children| |Children| 'EMPTY
                                                                                        EMPTY '|Mixed| |Mixed|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|ContentSpec-Constructor|
                                                                                                       ANY |Children| EMPTY
                                                                                                       |Mixed|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ContentSpec|
                                                                                           (DELETE NIL
                                                                                                   (LIST ANY |Children| EMPTY
                                                                                                         |Mixed|)))
                                                                                     '|ContentSpec|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ContentSpec|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ContentSpec/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ContentSpec/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ContentSpec/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ContentSpec/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST EMPTY)
                                                                                      (COND
                                                                                       ((|IS-EMPTYToken| ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* 'EMPTY)
                                                                                        (SETF EMPTY
                                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                                    (ATN-REDUCE-ITEM
                                                                                                     #'|EMPTY-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                                        (LIST 'EMPTY
                                                                                                              ATN-PARSER::|item|)
                                                                                                        'EMPTY)))
                                                                                        (|ContentSpec.2| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM?* 'EMPTY) NIL)))
                                                                     (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST ANY)
                                                                                      (COND
                                                                                       ((|IS-ANYToken| ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* 'ANY)
                                                                                        (SETF ANY
                                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                                    (ATN-REDUCE-ITEM
                                                                                                     #'|ANY-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                                        (LIST 'ANY
                                                                                                              ATN-PARSER::|item|)
                                                                                                        'ANY)))
                                                                                        (|ContentSpec.2| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM?* 'ANY) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Mixed|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Mixed| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Mixed| ATN-PARSER::RESULT))
                                                                                          (|ContentSpec.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Mixed|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Children|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Children| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Children| ATN-PARSER::RESULT))
                                                                                          (|ContentSpec.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Children|) NIL))))
                                                                     (|ContentSpec/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ContentSpec.2| |ContentSpec/fail.3| |ContentSpec/start.1|))
                         (|ContentSpec/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ContentSpec| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ContentSpec| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Children-INDEX|)
 (DEFUN |Children| (ATN-PARSER::INDEX &AUX (|Cardinality| NIL) (|ChoiceOrSeq| NIL))
   "{47} Children ::= ChoiceOrSeq Cardinality?
(|Cardinality| |ChoiceOrSeq|)"
   (DECLARE (SPECIAL |Children-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Children-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Children-INDEX| ATN-PARSER::INDEX)
       (LET ((|Children-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Children| *ATN-STACK)))
         (DECLARE (SPECIAL |Children-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Children|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Children|)
                                  (RETURN-FROM |Children| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Children| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Children.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Children.2|
                                                   (%ATN-EDGE-BLOCK (POP |Children|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Children|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Children|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|Cardinality| |Cardinality| '|ChoiceOrSeq|
                                                                                        |ChoiceOrSeq|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Children-Constructor|
                                                                                                       |Cardinality| |ChoiceOrSeq|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Children|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Cardinality|
                                                                                                         |ChoiceOrSeq|)))
                                                                                     '|Children|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Children|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Children/Children.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Children/Children.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |Cardinality|)
                                                                    (COND
                                                                     ((|IS-Cardinality| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|Cardinality|)
                                                                      (SETF |Cardinality|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|Cardinality-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|Cardinality| ATN-PARSER::|item|)
                                                                                      '|Cardinality|)))
                                                                      (|Children.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|Cardinality|)
                                                                      (|Children.2| ATN-PARSER::INDEX))))))
                                (|Children/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Children/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Children/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Children/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |ChoiceOrSeq|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ChoiceOrSeq|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ChoiceOrSeq| ATN-PARSER::RESULT))
                                                                        (|Children/Children.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ChoiceOrSeq|)
                                                                        (|Children/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Children.2| |Children/Children.2.4| |Children/fail.3|
                           |Children/start.1|))
                         (|Children/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Children| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Children| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Cp-INDEX|)
 (DEFUN |Cp| (ATN-PARSER::INDEX &AUX (|Cardinality| NIL) (|ChoiceOrSeq| NIL) (|QName| NIL))
   "{48} Cp ::= ((QName | ChoiceOrSeq)) Cardinality?
(|Cardinality| |ChoiceOrSeq| |QName|)"
   (DECLARE (SPECIAL |Cp-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Cp-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Cp-INDEX| ATN-PARSER::INDEX)
       (LET ((|Cp-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Cp| *ATN-STACK)))
         (DECLARE (SPECIAL |Cp-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Cp|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Cp|)
                                  (RETURN-FROM |Cp| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Cp| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Cp.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Cp.2|
                                                   (%ATN-EDGE-BLOCK (POP |Cp|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Cp|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Cp|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|Cardinality| |Cardinality| '|ChoiceOrSeq|
                                                                                        |ChoiceOrSeq| '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Cp-Constructor|
                                                                                                       |Cardinality| |ChoiceOrSeq|
                                                                                                       |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Cp|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Cardinality|
                                                                                                         |ChoiceOrSeq| |QName|)))
                                                                                     '|Cp|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Cp|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Cp/Cp.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Cp/Cp.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |Cardinality|)
                                                                    (COND
                                                                     ((|IS-Cardinality| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|Cardinality|)
                                                                      (SETF |Cardinality|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|Cardinality-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|Cardinality| ATN-PARSER::|item|)
                                                                                      '|Cardinality|)))
                                                                      (|Cp.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|Cardinality|)
                                                                      (|Cp.2| ATN-PARSER::INDEX))))))
                                (|Cp/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Cp/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Cp/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Cp/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                                      (COND
                                                                                       ((|IS-QName| ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* '|QName|)
                                                                                        (SETF |QName|
                                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                                    (ATN-REDUCE-ITEM
                                                                                                     #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                                        (LIST '|QName|
                                                                                                              ATN-PARSER::|item|)
                                                                                                        '|QName|)))
                                                                                        (|Cp/Cp.2.4| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM* '|QName|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |ChoiceOrSeq|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|ChoiceOrSeq| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |ChoiceOrSeq|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|Cp/Cp.2.4| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|ChoiceOrSeq|)
                                                                                          NIL))))
                                                                     (|Cp/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Cp.2| |Cp/Cp.2.4| |Cp/fail.3| |Cp/start.1|))
                         (|Cp/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Cp| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Cp| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ChoiceOrSeq-INDEX|)
 (DEFUN |ChoiceOrSeq| (ATN-PARSER::INDEX &AUX (|Choice| NIL) (|Cp| NIL) (|Seq| NIL))
   "ChoiceOrSeq ::= '(' S* Cp ((Choice | Seq))? S* ')'
(|Choice| |Cp| |Seq|)"
   (DECLARE (SPECIAL |ChoiceOrSeq-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ChoiceOrSeq-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ChoiceOrSeq-INDEX| ATN-PARSER::INDEX)
       (LET ((|ChoiceOrSeq-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|ChoiceOrSeq| *ATN-STACK)))
         (DECLARE (SPECIAL |ChoiceOrSeq-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ChoiceOrSeq|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ChoiceOrSeq|)
                                  (RETURN-FROM |ChoiceOrSeq| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ChoiceOrSeq| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ChoiceOrSeq.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ChoiceOrSeq.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ChoiceOrSeq/ChoiceOrSeq.2.8| ATN-PARSER::INDEX))))))
                                (|ChoiceOrSeq.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq.2|
                                                   (%ATN-EDGE-BLOCK (POP |ChoiceOrSeq|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ChoiceOrSeq|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ChoiceOrSeq| ATN-PARSER::INDEX
                                                                                  (LIST '|Choice| |Choice| '|Cp| |Cp| '|Seq|
                                                                                        |Seq|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|ChoiceOrSeq-Constructor|
                                                                                                       |Choice| |Cp| |Seq|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ChoiceOrSeq|
                                                                                           (DELETE NIL (LIST |Choice| |Cp| |Seq|)))
                                                                                     '|ChoiceOrSeq|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ChoiceOrSeq|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ChoiceOrSeq.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ChoiceOrSeq.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ChoiceOrSeq/ChoiceOrSeq.2.5| ATN-PARSER::INDEX))))))
                                (|ChoiceOrSeq/ChoiceOrSeq.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/ChoiceOrSeq.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ChoiceOrSeq.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ChoiceOrSeq/ChoiceOrSeq.2.5| ATN-PARSER::INDEX))))))
                                (|ChoiceOrSeq/ChoiceOrSeq.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/ChoiceOrSeq.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |Cp|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Cp|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |Cp| ATN-PARSER::RESULT))
                                                                        (|ChoiceOrSeq/ChoiceOrSeq.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Cp|)
                                                                        (|ChoiceOrSeq/fail.3| ATN-PARSER::INDEX)))))))
                                (|ChoiceOrSeq/ChoiceOrSeq.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/ChoiceOrSeq.2.6|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |Choice|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Choice| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Choice| ATN-PARSER::RESULT))
                                                                                          (|ChoiceOrSeq/ChoiceOrSeq.2.7|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Choice|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Seq|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Seq| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Seq| ATN-PARSER::RESULT))
                                                                                          (|ChoiceOrSeq/ChoiceOrSeq.2.7|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Seq|) NIL))))
                                                                     (|ChoiceOrSeq/ChoiceOrSeq.2.7| ATN-PARSER::INDEX)))))
                                (|ChoiceOrSeq/ChoiceOrSeq.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/ChoiceOrSeq.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ChoiceOrSeq.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ChoiceOrSeq/ChoiceOrSeq.2.8| ATN-PARSER::INDEX))))))
                                (|ChoiceOrSeq/ChoiceOrSeq.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/ChoiceOrSeq.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|)|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|)|)
                                                                      (SETF *ATN-TERM* '|xml|:|)|)
                                                                      (|ChoiceOrSeq.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|)|)
                                                                      (|ChoiceOrSeq/fail.3| ATN-PARSER::INDEX))))))
                                (|ChoiceOrSeq/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ChoiceOrSeq/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ChoiceOrSeq/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|(|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|(|)
                                                                      (SETF *ATN-TERM* '|xml|:|(|)
                                                                      (|ChoiceOrSeq/ChoiceOrSeq.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|(|)
                                                                      (|ChoiceOrSeq/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ChoiceOrSeq.10| |ChoiceOrSeq.2| |ChoiceOrSeq.9|
                           |ChoiceOrSeq/ChoiceOrSeq.2.4| |ChoiceOrSeq/ChoiceOrSeq.2.5| |ChoiceOrSeq/ChoiceOrSeq.2.6|
                           |ChoiceOrSeq/ChoiceOrSeq.2.7| |ChoiceOrSeq/ChoiceOrSeq.2.8| |ChoiceOrSeq/fail.3| |ChoiceOrSeq/start.1|))
                         (|ChoiceOrSeq/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ChoiceOrSeq| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ChoiceOrSeq| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Choice-INDEX|)
 (DEFUN |Choice| (ATN-PARSER::INDEX &AUX (|Cp| NIL))
   "{49} Choice ::= (S* '|' S* Cp)+
(|Cp|)"
   (DECLARE (SPECIAL |Choice-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Choice-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Choice-INDEX| ATN-PARSER::INDEX)
       (LET ((|Choice-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Choice| *ATN-STACK)))
         (DECLARE (SPECIAL |Choice-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Choice|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Choice|)
                                  (RETURN-FROM |Choice| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Choice| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Choice.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.8| ATN-PARSER::INDEX))))))
                                (|Choice.15| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice.15|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.12| ATN-PARSER::INDEX))))))
                                (|Choice.16| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice.16|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.16| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.14| ATN-PARSER::INDEX))))))
                                (|Choice.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice.2|
                                                   (%ATN-EDGE-BLOCK (POP |Choice|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Choice|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Choice|
                                                                                  ATN-PARSER::INDEX (LIST '|Cp| |Cp|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Choice-Constructor| |Cp|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Choice| (DELETE NIL (LIST |Cp|)))
                                                                                     '|Choice|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Choice|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Choice.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Choice/Choice.4.5|)
                                                                    (|Choice/Choice.4.5| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Choice.2|) (|Choice.2| ATN-PARSER::INDEX))))
                                (|Choice.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.6| ATN-PARSER::INDEX))))))
                                (|Choice/Choice.4.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.12| ATN-PARSER::INDEX))))))
                                (|Choice/Choice.4.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.12|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|\||)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|\||)
                                                                      (SETF *ATN-TERM* '|xml|:|\||)
                                                                      (|Choice/Choice.4.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|\||) NIL)))))
                                (|Choice/Choice.4.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.13|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.16| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.14| ATN-PARSER::INDEX))))))
                                (|Choice/Choice.4.14| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.14|
                                                   (%ATN-EDGE-BLOCK (PUSH |Cp|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Cp|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Cp| (CONS ATN-PARSER::RESULT |Cp|)))
                                                                        (|Choice.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Cp|) NIL))))))
                                (|Choice/Choice.4.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.6| ATN-PARSER::INDEX))))))
                                (|Choice/Choice.4.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|\||)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|\||)
                                                                      (SETF *ATN-TERM* '|xml|:|\||)
                                                                      (|Choice/Choice.4.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|\||) NIL)))))
                                (|Choice/Choice.4.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Choice.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Choice/Choice.4.8| ATN-PARSER::INDEX))))))
                                (|Choice/Choice.4.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/Choice.4.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |Cp|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Cp|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Cp| (CONS ATN-PARSER::RESULT |Cp|)))
                                                                        (|Choice.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Cp|) NIL))))))
                                (|Choice/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Choice/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Choice/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Choice/Choice.4.11|)
                                                                    (|Choice/Choice.4.11| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Choice/fail.3|)
                                                                    (|Choice/fail.3| ATN-PARSER::INDEX)))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Choice.10| |Choice.15| |Choice.16| |Choice.2| |Choice.4|
                           |Choice.9| |Choice/Choice.4.11| |Choice/Choice.4.12| |Choice/Choice.4.13| |Choice/Choice.4.14|
                           |Choice/Choice.4.5| |Choice/Choice.4.6| |Choice/Choice.4.7| |Choice/Choice.4.8| |Choice/fail.3|
                           |Choice/start.1|))
                         (|Choice/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Choice| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Choice| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Seq-INDEX|)
 (DEFUN |Seq| (ATN-PARSER::INDEX &AUX (|Cp| NIL))
   "{50} Seq ::= (S* ',' S* Cp)+
(|Cp|)"
   (DECLARE (SPECIAL |Seq-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Seq-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Seq-INDEX| ATN-PARSER::INDEX)
       (LET ((|Seq-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Seq| *ATN-STACK)))
         (DECLARE (SPECIAL |Seq-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Seq|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Seq|)
                                  (RETURN-FROM |Seq| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Seq| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Seq.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.8| ATN-PARSER::INDEX))))))
                                (|Seq.15| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq.15|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.12| ATN-PARSER::INDEX))))))
                                (|Seq.16| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq.16|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.16| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.14| ATN-PARSER::INDEX))))))
                                (|Seq.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq.2|
                                                   (%ATN-EDGE-BLOCK (POP |Seq|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Seq|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Seq|
                                                                                  ATN-PARSER::INDEX (LIST '|Cp| |Cp|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Seq-Constructor| |Cp|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Seq| (DELETE NIL (LIST |Cp|)))
                                                                                     '|Seq|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Seq|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Seq.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Seq/Seq.4.5|)
                                                                    (|Seq/Seq.4.5| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Seq.2|) (|Seq.2| ATN-PARSER::INDEX))))
                                (|Seq.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.6| ATN-PARSER::INDEX))))))
                                (|Seq/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Seq/Seq.4.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.12| ATN-PARSER::INDEX))))))
                                (|Seq/Seq.4.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.12|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|,|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|,|)
                                                                      (SETF *ATN-TERM* '|xml|:|,|)
                                                                      (|Seq/Seq.4.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|,|) NIL)))))
                                (|Seq/Seq.4.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.13|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.16| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.14| ATN-PARSER::INDEX))))))
                                (|Seq/Seq.4.14| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.14|
                                                   (%ATN-EDGE-BLOCK (PUSH |Cp|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Cp|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Cp| (CONS ATN-PARSER::RESULT |Cp|)))
                                                                        (|Seq.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Cp|) NIL))))))
                                (|Seq/Seq.4.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.6| ATN-PARSER::INDEX))))))
                                (|Seq/Seq.4.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|,|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|,|)
                                                                      (SETF *ATN-TERM* '|xml|:|,|)
                                                                      (|Seq/Seq.4.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|,|) NIL)))))
                                (|Seq/Seq.4.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Seq.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Seq/Seq.4.8| ATN-PARSER::INDEX))))))
                                (|Seq/Seq.4.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/Seq.4.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |Cp|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Cp|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Cp| (CONS ATN-PARSER::RESULT |Cp|)))
                                                                        (|Seq.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Cp|) NIL))))))
                                (|Seq/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Seq/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Seq/Seq.4.11|)
                                                                    (|Seq/Seq.4.11| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Seq/fail.3|)
                                                                    (|Seq/fail.3| ATN-PARSER::INDEX)))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Seq.10| |Seq.15| |Seq.16| |Seq.2| |Seq.4| |Seq.9|
                           |Seq/fail.3| |Seq/Seq.4.11| |Seq/Seq.4.12| |Seq/Seq.4.13| |Seq/Seq.4.14| |Seq/Seq.4.5| |Seq/Seq.4.6|
                           |Seq/Seq.4.7| |Seq/Seq.4.8| |Seq/start.1|))
                         (|Seq/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Seq| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Seq| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Mixed-INDEX|)
 (DEFUN |Mixed| (ATN-PARSER::INDEX &AUX (|QName| NIL))
   "{51} Mixed ::= (('(' S* PCDATA (S* '|' S* QName)* S* ')' MixedCardinality) | ('('
                                                                              S*
                                                                              PCDATA
                                                                              S*
                                                                              ')'))
(|QName|)"
   (DECLARE (SPECIAL |Mixed-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Mixed-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Mixed-INDEX| ATN-PARSER::INDEX)
       (LET ((|Mixed-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Mixed| *ATN-STACK)))
         (DECLARE (SPECIAL |Mixed-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Mixed|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Mixed|)
                                  (RETURN-FROM |Mixed| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Mixed| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Mixed.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.6| ATN-PARSER::INDEX))))))
                                (|Mixed.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.12|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Mixed/Mixed.12.13|)
                                                                    (|Mixed/Mixed.12.13| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Mixed/Mixed.2.8|)
                                                                    (|Mixed/Mixed.2.8| ATN-PARSER::INDEX))))
                                (|Mixed.17| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.17|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.17| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.12.14| ATN-PARSER::INDEX))))))
                                (|Mixed.18| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.18|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.18| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.12.16| ATN-PARSER::INDEX))))))
                                (|Mixed.19| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.19|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.19| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.9| ATN-PARSER::INDEX))))))
                                (|Mixed.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.2|
                                                   (%ATN-EDGE-BLOCK (POP |Mixed|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Mixed|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Mixed|
                                                                                  ATN-PARSER::INDEX (LIST '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Mixed-Constructor|
                                                                                                       |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Mixed| (DELETE NIL (LIST |QName|)))
                                                                                     '|Mixed|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Mixed|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Mixed.25| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.25|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.25| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.22| ATN-PARSER::INDEX))))))
                                (|Mixed.26| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed.26|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.26| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.24| ATN-PARSER::INDEX))))))
                                (|Mixed/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Mixed/Mixed.12.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.12.13|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.17| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.12.14| ATN-PARSER::INDEX))))))
                                (|Mixed/Mixed.12.14| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.12.14|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|\||)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|\||)
                                                                      (SETF *ATN-TERM* '|xml|:|\||)
                                                                      (|Mixed/Mixed.12.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|\||) NIL)))))
                                (|Mixed/Mixed.12.15| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.12.15|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.18| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.12.16| ATN-PARSER::INDEX))))))
                                (|Mixed/Mixed.12.16| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.12.16|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (CONS
                                                                                 (IF (EQ *ATN-REDUCE* T)
                                                                                     (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                      ATN-PARSER::|item|)
                                                                                     (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                         (LIST '|QName| ATN-PARSER::|item|)
                                                                                         '|QName|))
                                                                                 |QName|))
                                                                        (|Mixed.12| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|) NIL))))))
                                (|Mixed/Mixed.2.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.10|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |MixedCardinality|)
                                                                    (COND
                                                                     ((|IS-MixedCardinality| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|MixedCardinality|)
                                                                      (|Mixed.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|MixedCardinality|) NIL)))))
                                (|Mixed/Mixed.2.20| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.20|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|(|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|(|)
                                                                      (SETF *ATN-TERM* '|xml|:|(|)
                                                                      (|Mixed/Mixed.2.21| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|(|) NIL)))))
                                (|Mixed/Mixed.2.21| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.21|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.25| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.22| ATN-PARSER::INDEX))))))
                                (|Mixed/Mixed.2.22| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.22|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST PCDATA)
                                                                    (COND
                                                                     ((|IS-PCDATAToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'PCDATA)
                                                                      (|Mixed/Mixed.2.23| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'PCDATA) NIL)))))
                                (|Mixed/Mixed.2.23| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.23|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.26| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.24| ATN-PARSER::INDEX))))))
                                (|Mixed/Mixed.2.24| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.24|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|)|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|)|)
                                                                      (SETF *ATN-TERM* '|xml|:|)|)
                                                                      (|Mixed.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|)|) NIL)))))
                                (|Mixed/Mixed.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|(|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|(|)
                                                                      (SETF *ATN-TERM* '|xml|:|(|)
                                                                      (|Mixed/Mixed.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|(|) NIL)))))
                                (|Mixed/Mixed.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.6| ATN-PARSER::INDEX))))))
                                (|Mixed/Mixed.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST PCDATA)
                                                                    (COND
                                                                     ((|IS-PCDATAToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'PCDATA)
                                                                      (|Mixed/Mixed.2.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'PCDATA) NIL)))))
                                (|Mixed/Mixed.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Mixed/Mixed.12.13|)
                                                                    (|Mixed/Mixed.12.13| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Mixed/Mixed.2.8|)
                                                                    (|Mixed/Mixed.2.8| ATN-PARSER::INDEX))))
                                (|Mixed/Mixed.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Mixed.19| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Mixed/Mixed.2.9| ATN-PARSER::INDEX))))))
                                (|Mixed/Mixed.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/Mixed.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|)|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|)|)
                                                                      (SETF *ATN-TERM* '|xml|:|)|)
                                                                      (|Mixed/Mixed.2.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|)|) NIL)))))
                                (|Mixed/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Mixed/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Mixed/Mixed.2.4|)
                                                                                      (|Mixed/Mixed.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Mixed/Mixed.2.20|)
                                                                                      (|Mixed/Mixed.2.20| ATN-PARSER::INDEX))
                                                                     (|Mixed/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Mixed.11| |Mixed.12| |Mixed.17| |Mixed.18| |Mixed.19|
                           |Mixed.2| |Mixed.25| |Mixed.26| |Mixed/fail.3| |Mixed/Mixed.12.13| |Mixed/Mixed.12.14|
                           |Mixed/Mixed.12.15| |Mixed/Mixed.12.16| |Mixed/Mixed.2.10| |Mixed/Mixed.2.20| |Mixed/Mixed.2.21|
                           |Mixed/Mixed.2.22| |Mixed/Mixed.2.23| |Mixed/Mixed.2.24| |Mixed/Mixed.2.4| |Mixed/Mixed.2.5|
                           |Mixed/Mixed.2.6| |Mixed/Mixed.2.7| |Mixed/Mixed.2.8| |Mixed/Mixed.2.9| |Mixed/start.1|))
                         (|Mixed/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Mixed| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Mixed| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttlistDecl-INDEX|)
 (DEFUN |AttlistDecl| (ATN-PARSER::INDEX &AUX (|AttDefSequence| NIL) (|QName| NIL))
   "{52} AttlistDecl ::= '<!ATTLIST' S+ QName AttDefSequence? S* '>'
(|AttDefSequence| |QName|)"
   (DECLARE (SPECIAL |AttlistDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttlistDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttlistDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttlistDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|AttlistDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |AttlistDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttlistDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttlistDecl|)
                                  (RETURN-FROM |AttlistDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttlistDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttlistDecl.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttlistDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttlistDecl/AttlistDecl.2.8| ATN-PARSER::INDEX))))))
                                (|AttlistDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttlistDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttlistDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|AttlistDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|AttDefSequence| |AttDefSequence| '|QName|
                                                                                        |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|AttlistDecl-Constructor|
                                                                                                       |AttDefSequence| |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttlistDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttDefSequence|
                                                                                                         |QName|)))
                                                                                     '|AttlistDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttlistDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttlistDecl.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttlistDecl.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttlistDecl/AttlistDecl.2.5| ATN-PARSER::INDEX))))))
                                (|AttlistDecl/AttlistDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/AttlistDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttlistDecl.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttlistDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|AttlistDecl/AttlistDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/AttlistDecl.2.5|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|AttlistDecl/AttlistDecl.2.6| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|AttlistDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|AttlistDecl/AttlistDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/AttlistDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttDefSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttDefSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttDefSequence| ATN-PARSER::RESULT))
                                                                        (|AttlistDecl/AttlistDecl.2.7| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttDefSequence|)
                                                                        (|AttlistDecl/AttlistDecl.2.7| ATN-PARSER::INDEX)))))))
                                (|AttlistDecl/AttlistDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/AttlistDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttlistDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttlistDecl/AttlistDecl.2.8| ATN-PARSER::INDEX))))))
                                (|AttlistDecl/AttlistDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/AttlistDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|AttlistDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|AttlistDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|AttlistDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttlistDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttlistDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<!ATTLIST)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<!ATTLIST)
                                                                      (SETF *ATN-TERM* '|xml|:<!ATTLIST)
                                                                      (|AttlistDecl/AttlistDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<!ATTLIST)
                                                                      (|AttlistDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttlistDecl.10| |AttlistDecl.2| |AttlistDecl.9|
                           |AttlistDecl/AttlistDecl.2.4| |AttlistDecl/AttlistDecl.2.5| |AttlistDecl/AttlistDecl.2.6|
                           |AttlistDecl/AttlistDecl.2.7| |AttlistDecl/AttlistDecl.2.8| |AttlistDecl/fail.3| |AttlistDecl/start.1|))
                         (|AttlistDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttlistDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttlistDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttDefSequence-INDEX|)
 (DEFUN |AttDefSequence| (ATN-PARSER::INDEX &AUX (|AttDef| NIL) (|AttDefSequence| NIL))
   "AttDefSequence ::= AttDef AttDefSequence?
(|AttDef| |AttDefSequence|)"
   (DECLARE (SPECIAL |AttDefSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttDefSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttDefSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttDefSequence-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|AttDefSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |AttDefSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttDefSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttDefSequence|)
                                  (RETURN-FROM |AttDefSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttDefSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttDefSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDefSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttDefSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttDefSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|AttDefSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|AttDef| |AttDef| '|AttDefSequence|
                                                                                        |AttDefSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|AttDefSequence-Constructor| |AttDef|
                                                                                  |AttDefSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttDefSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttDef|
                                                                                                         |AttDefSequence|)))
                                                                                     '|AttDefSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttDefSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttDefSequence/AttDefSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDefSequence/AttDefSequence.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttDefSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttDefSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttDefSequence| ATN-PARSER::RESULT))
                                                                        (|AttDefSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttDefSequence|)
                                                                        (|AttDefSequence.2| ATN-PARSER::INDEX)))))))
                                (|AttDefSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDefSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttDefSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDefSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttDef|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttDef|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttDef| ATN-PARSER::RESULT))
                                                                        (|AttDefSequence/AttDefSequence.2.4|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttDef|)
                                                                        (|AttDefSequence/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttDefSequence.2| |AttDefSequence/AttDefSequence.2.4|
                           |AttDefSequence/fail.3| |AttDefSequence/start.1|))
                         (|AttDefSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttDefSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttDefSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttDef-INDEX|)
 (DEFUN |AttDef| (ATN-PARSER::INDEX &AUX (|AttType| NIL) (|DefaultDecl| NIL) (|QName| NIL))
   "{53} AttDef ::= S+ QName S+ AttType S+ DefaultDecl
(|AttType| |DefaultDecl| |QName|)"
   (DECLARE (SPECIAL |AttDef-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttDef-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttDef-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttDef-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|AttDef| *ATN-STACK))
             (*PARSETABLE* |AttDef-Parsetable|))
         (DECLARE (SPECIAL |AttDef-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttDef|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttDef|)
                                  (RETURN-FROM |AttDef| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttDef| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttDef.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttDef.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttDef/AttDef.2.6| ATN-PARSER::INDEX))))))
                                (|AttDef.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttDef.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttDef/AttDef.2.8| ATN-PARSER::INDEX))))))
                                (|AttDef.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttDef|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttDef|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|AttDef|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|AttType| |AttType| '|DefaultDecl|
                                                                                        |DefaultDecl| '|QName| |QName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|AttDef-Constructor|
                                                                                                       |AttType| |DefaultDecl|
                                                                                                       |QName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttDef|
                                                                                           (DELETE NIL
                                                                                                   (LIST |AttType| |DefaultDecl|
                                                                                                         |QName|)))
                                                                                     '|AttDef|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttDef|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttDef.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttDef.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttDef/AttDef.2.4| ATN-PARSER::INDEX))))))
                                (|AttDef/AttDef.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/AttDef.2.4|
                                                   (LET ((*IN-NAME-TOKEN* T))
                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |QName|)
                                                                      (COND
                                                                       ((|IS-QName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|QName|)
                                                                        (SETF |QName|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|QName-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|QName| ATN-PARSER::|item|)
                                                                                        '|QName|)))
                                                                        (|AttDef/AttDef.2.5| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM* '|QName|)
                                                                        (|AttDef/fail.3| ATN-PARSER::INDEX)))))))
                                (|AttDef/AttDef.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/AttDef.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttDef.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttDef/fail.3| ATN-PARSER::INDEX))))))
                                (|AttDef/AttDef.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/AttDef.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |AttType|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|AttType|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |AttType| ATN-PARSER::RESULT))
                                                                        (|AttDef/AttDef.2.7| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|AttType|)
                                                                        (|AttDef/fail.3| ATN-PARSER::INDEX)))))))
                                (|AttDef/AttDef.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/AttDef.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttDef.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttDef/fail.3| ATN-PARSER::INDEX))))))
                                (|AttDef/AttDef.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/AttDef.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |DefaultDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|DefaultDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DefaultDecl| ATN-PARSER::RESULT))
                                                                        (|AttDef.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DefaultDecl|)
                                                                        (|AttDef/fail.3| ATN-PARSER::INDEX)))))))
                                (|AttDef/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttDef/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttDef/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|AttDef.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|AttDef/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttDef.10| |AttDef.11| |AttDef.2| |AttDef.9|
                           |AttDef/AttDef.2.4| |AttDef/AttDef.2.5| |AttDef/AttDef.2.6| |AttDef/AttDef.2.7| |AttDef/AttDef.2.8|
                           |AttDef/fail.3| |AttDef/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|AttDef/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttDef| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttDef| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |AttType-INDEX|)
 (DEFUN |AttType| (ATN-PARSER::INDEX &AUX (|EnumeratedType| NIL) (|StringType| NIL) (|TokenizedType| NIL))
   "{54} AttType ::= (StringType | TokenizedType | EnumeratedType)
(|EnumeratedType| |StringType| |TokenizedType|)"
   (DECLARE (SPECIAL |AttType-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |AttType-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |AttType-INDEX| ATN-PARSER::INDEX)
       (LET ((|AttType-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|AttType| *ATN-STACK)))
         (DECLARE (SPECIAL |AttType-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |AttType|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|AttType|)
                                  (RETURN-FROM |AttType| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |AttType| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|AttType.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttType.2|
                                                   (%ATN-EDGE-BLOCK (POP |AttType|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|AttType|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|AttType|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|EnumeratedType| |EnumeratedType|
                                                                                        '|StringType| |StringType| '|TokenizedType|
                                                                                        |TokenizedType|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|AttType-Constructor|
                                                                                                       |EnumeratedType|
                                                                                                       |StringType|
                                                                                                       |TokenizedType|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|AttType|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EnumeratedType|
                                                                                                         |StringType|
                                                                                                         |TokenizedType|)))
                                                                                     '|AttType|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|AttType|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|AttType/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttType/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|AttType/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |AttType/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |StringType|)
                                                                                      (COND
                                                                                       ((|IS-StringType| ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* '|StringType|)
                                                                                        (SETF |StringType|
                                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                                    (ATN-REDUCE-ITEM
                                                                                                     #'|StringType-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                                        (LIST '|StringType|
                                                                                                              ATN-PARSER::|item|)
                                                                                                        '|StringType|)))
                                                                                        (|AttType.2| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM* '|StringType|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |TokenizedType|)
                                                                                      (COND
                                                                                       ((|IS-TokenizedType| ATN-PARSER::|item|)
                                                                                        (SETF *ATN-TERM* '|TokenizedType|)
                                                                                        (SETF |TokenizedType|
                                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                                    (ATN-REDUCE-ITEM
                                                                                                     #'|TokenizedType-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                                        (LIST '|TokenizedType|
                                                                                                              ATN-PARSER::|item|)
                                                                                                        '|TokenizedType|)))
                                                                                        (|AttType.2| (1+ ATN-PARSER::INDEX)))
                                                                                       (T (SETF *ATN-TERM* '|TokenizedType|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (PUSH |EnumeratedType|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|EnumeratedType| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |EnumeratedType|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|AttType.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|EnumeratedType|)
                                                                                          NIL))))
                                                                     (|AttType/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |AttType.2| |AttType/fail.3| |AttType/start.1|))
                         (|AttType/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|AttType| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|AttType| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EnumeratedType-INDEX|)
 (DEFUN |EnumeratedType| (ATN-PARSER::INDEX &AUX (|Enumeration| NIL) (|NotationType| NIL))
   "{57} EnumeratedType ::= (NotationType | Enumeration)
(|Enumeration| |NotationType|)"
   (DECLARE (SPECIAL |EnumeratedType-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EnumeratedType-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EnumeratedType-INDEX| ATN-PARSER::INDEX)
       (LET ((|EnumeratedType-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|EnumeratedType| *ATN-STACK)))
         (DECLARE (SPECIAL |EnumeratedType-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EnumeratedType|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EnumeratedType|)
                                  (RETURN-FROM |EnumeratedType| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EnumeratedType| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EnumeratedType.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumeratedType.2|
                                                   (%ATN-EDGE-BLOCK (POP |EnumeratedType|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EnumeratedType|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|EnumeratedType| ATN-PARSER::INDEX
                                                                                  (LIST '|Enumeration| |Enumeration|
                                                                                        '|NotationType| |NotationType|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|EnumeratedType-Constructor| |Enumeration|
                                                                                  |NotationType|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EnumeratedType|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Enumeration|
                                                                                                         |NotationType|)))
                                                                                     '|EnumeratedType|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|EnumeratedType|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EnumeratedType/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumeratedType/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EnumeratedType/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumeratedType/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |NotationType|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|NotationType| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |NotationType|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|EnumeratedType.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|NotationType|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |Enumeration|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|Enumeration| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |Enumeration|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|EnumeratedType.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|Enumeration|)
                                                                                          NIL))))
                                                                     (|EnumeratedType/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EnumeratedType.2| |EnumeratedType/fail.3|
                           |EnumeratedType/start.1|))
                         (|EnumeratedType/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EnumeratedType| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EnumeratedType| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |NotationType-INDEX|)
 (DEFUN |NotationType| (ATN-PARSER::INDEX &AUX (|NotationTypeSequence| NIL))
   "{58} NotationType ::= NOTATION S+ '(' S* NotationTypeSequence S* ')'
(|NotationTypeSequence|)"
   (DECLARE (SPECIAL |NotationType-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |NotationType-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |NotationType-INDEX| ATN-PARSER::INDEX)
       (LET ((|NotationType-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|NotationType| *ATN-STACK)))
         (DECLARE (SPECIAL |NotationType-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |NotationType|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|NotationType|)
                                  (RETURN-FROM |NotationType| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |NotationType| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|NotationType.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationType.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationType/NotationType.2.5| ATN-PARSER::INDEX))))))
                                (|NotationType.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationType.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationType/NotationType.2.7| ATN-PARSER::INDEX))))))
                                (|NotationType.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationType.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationType/NotationType.2.9| ATN-PARSER::INDEX))))))
                                (|NotationType.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType.2|
                                                   (%ATN-EDGE-BLOCK (POP |NotationType|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|NotationType|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|NotationType| ATN-PARSER::INDEX
                                                                                  (LIST '|NotationTypeSequence|
                                                                                        |NotationTypeSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|NotationType-Constructor|
                                                                                                       |NotationTypeSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|NotationType|
                                                                                           (DELETE NIL
                                                                                                   (LIST |NotationTypeSequence|)))
                                                                                     '|NotationType|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|NotationType|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|NotationType/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|NotationType/NotationType.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/NotationType.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationType.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationType/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationType/NotationType.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/NotationType.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|(|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|(|)
                                                                      (SETF *ATN-TERM* '|xml|:|(|)
                                                                      (|NotationType/NotationType.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|(|)
                                                                      (|NotationType/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationType/NotationType.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/NotationType.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationType.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationType/NotationType.2.7| ATN-PARSER::INDEX))))))
                                (|NotationType/NotationType.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/NotationType.2.7|
                                                   (%ATN-EDGE-BLOCK (PUSH |NotationTypeSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|NotationTypeSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |NotationTypeSequence| ATN-PARSER::RESULT))
                                                                        (|NotationType/NotationType.2.8| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|NotationTypeSequence|)
                                                                        (|NotationType/fail.3| ATN-PARSER::INDEX)))))))
                                (|NotationType/NotationType.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/NotationType.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationType.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationType/NotationType.2.9| ATN-PARSER::INDEX))))))
                                (|NotationType/NotationType.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/NotationType.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|)|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|)|)
                                                                      (SETF *ATN-TERM* '|xml|:|)|)
                                                                      (|NotationType.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|)|)
                                                                      (|NotationType/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationType/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationType/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST NOTATION)
                                                                    (COND
                                                                     ((|IS-NOTATIONToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'NOTATION)
                                                                      (|NotationType/NotationType.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'NOTATION)
                                                                      (|NotationType/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |NotationType.10| |NotationType.11| |NotationType.12|
                           |NotationType.2| |NotationType/fail.3| |NotationType/NotationType.2.4| |NotationType/NotationType.2.5|
                           |NotationType/NotationType.2.6| |NotationType/NotationType.2.7| |NotationType/NotationType.2.8|
                           |NotationType/NotationType.2.9| |NotationType/start.1|))
                         (|NotationType/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|NotationType| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|NotationType| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |NotationTypeSequence-INDEX|)
 (DEFUN |NotationTypeSequence| (ATN-PARSER::INDEX &AUX (|NCName| NIL) (|NotationTypeSequence| NIL))
   "NotationTypeSequence ::= NCName (S* '|' S* NotationTypeSequence)?
(|NCName| |NotationTypeSequence|)"
   (DECLARE (SPECIAL |NotationTypeSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |NotationTypeSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |NotationTypeSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|NotationTypeSequence-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|NotationTypeSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |NotationTypeSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |NotationTypeSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|NotationTypeSequence|)
                                  (RETURN-FROM |NotationTypeSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |NotationTypeSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|NotationTypeSequence.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationTypeSequence.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationTypeSequence/NotationTypeSequence.2.8|
                                                                       ATN-PARSER::INDEX))))))
                                (|NotationTypeSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |NotationTypeSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|NotationTypeSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|NotationTypeSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|NCName| |NCName| '|NotationTypeSequence|
                                                                                        |NotationTypeSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|NotationTypeSequence-Constructor| |NCName|
                                                                                  |NotationTypeSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|NotationTypeSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |NCName|
                                                                                                         |NotationTypeSequence|)))
                                                                                     '|NotationTypeSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s"
                                                                                  '|NotationTypeSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|NotationTypeSequence.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationTypeSequence.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationTypeSequence/NotationTypeSequence.2.6|
                                                                       ATN-PARSER::INDEX))))))
                                (|NotationTypeSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|NotationTypeSequence/NotationTypeSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/NotationTypeSequence.2.4|
                                                   (%ATN-EDGE-BLOCK
                                                    (ATN-PARSER::JUMP |NotationTypeSequence/NotationTypeSequence.2.5|)
                                                    (|NotationTypeSequence/NotationTypeSequence.2.5| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |NotationTypeSequence.2|)
                                                                    (|NotationTypeSequence.2| ATN-PARSER::INDEX))))
                                (|NotationTypeSequence/NotationTypeSequence.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/NotationTypeSequence.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationTypeSequence.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationTypeSequence/NotationTypeSequence.2.6|
                                                                       ATN-PARSER::INDEX))))))
                                (|NotationTypeSequence/NotationTypeSequence.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/NotationTypeSequence.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|\||)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|\||)
                                                                      (SETF *ATN-TERM* '|xml|:|\||)
                                                                      (|NotationTypeSequence/NotationTypeSequence.2.7|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|\||) NIL)))))
                                (|NotationTypeSequence/NotationTypeSequence.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/NotationTypeSequence.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationTypeSequence.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationTypeSequence/NotationTypeSequence.2.8|
                                                                       ATN-PARSER::INDEX))))))
                                (|NotationTypeSequence/NotationTypeSequence.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/NotationTypeSequence.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |NotationTypeSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|NotationTypeSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |NotationTypeSequence| ATN-PARSER::RESULT))
                                                                        (|NotationTypeSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|NotationTypeSequence|) NIL))))))
                                (|NotationTypeSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationTypeSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|NotationTypeSequence/NotationTypeSequence.2.4|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|NotationTypeSequence/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |NotationTypeSequence.10| |NotationTypeSequence.2|
                           |NotationTypeSequence.9| |NotationTypeSequence/fail.3| |NotationTypeSequence/NotationTypeSequence.2.4|
                           |NotationTypeSequence/NotationTypeSequence.2.5| |NotationTypeSequence/NotationTypeSequence.2.6|
                           |NotationTypeSequence/NotationTypeSequence.2.7| |NotationTypeSequence/NotationTypeSequence.2.8|
                           |NotationTypeSequence/start.1|))
                         (|NotationTypeSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|NotationTypeSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|NotationTypeSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Enumeration-INDEX|)
 (DEFUN |Enumeration| (ATN-PARSER::INDEX &AUX (|EnumerationSequence| NIL))
   "{59} Enumeration ::= '(' EnumerationSequence S* ')'
(|EnumerationSequence|)"
   (DECLARE (SPECIAL |Enumeration-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Enumeration-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Enumeration-INDEX| ATN-PARSER::INDEX)
       (LET ((|Enumeration-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Enumeration| *ATN-STACK)))
         (DECLARE (SPECIAL |Enumeration-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Enumeration|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Enumeration|)
                                  (RETURN-FROM |Enumeration| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Enumeration| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Enumeration.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration.2|
                                                   (%ATN-EDGE-BLOCK (POP |Enumeration|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Enumeration|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|Enumeration| ATN-PARSER::INDEX
                                                                                  (LIST '|EnumerationSequence|
                                                                                        |EnumerationSequence|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Enumeration-Constructor|
                                                                                                       |EnumerationSequence|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Enumeration|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EnumerationSequence|)))
                                                                                     '|Enumeration|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Enumeration|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Enumeration.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Enumeration.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Enumeration/Enumeration.2.6| ATN-PARSER::INDEX))))))
                                (|Enumeration/Enumeration.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration/Enumeration.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |EnumerationSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|EnumerationSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |EnumerationSequence| ATN-PARSER::RESULT))
                                                                        (|Enumeration/Enumeration.2.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|EnumerationSequence|)
                                                                        (|Enumeration/fail.3| ATN-PARSER::INDEX)))))))
                                (|Enumeration/Enumeration.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration/Enumeration.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|Enumeration.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|Enumeration/Enumeration.2.6| ATN-PARSER::INDEX))))))
                                (|Enumeration/Enumeration.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration/Enumeration.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|)|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|)|)
                                                                      (SETF *ATN-TERM* '|xml|:|)|)
                                                                      (|Enumeration.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|)|)
                                                                      (|Enumeration/fail.3| ATN-PARSER::INDEX))))))
                                (|Enumeration/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Enumeration/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Enumeration/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|(|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|(|)
                                                                      (SETF *ATN-TERM* '|xml|:|(|)
                                                                      (|Enumeration/Enumeration.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|(|)
                                                                      (|Enumeration/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Enumeration.2| |Enumeration.7|
                           |Enumeration/Enumeration.2.4| |Enumeration/Enumeration.2.5| |Enumeration/Enumeration.2.6|
                           |Enumeration/fail.3| |Enumeration/start.1|))
                         (|Enumeration/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Enumeration| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Enumeration| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EnumerationSequence-INDEX|)
 (DEFUN |EnumerationSequence| (ATN-PARSER::INDEX &AUX (|EnumerationSequence| NIL) (|Nmtoken| NIL))
   "EnumerationSequence ::= S* Nmtoken (S* '|' EnumerationSequence)?
(|EnumerationSequence| |Nmtoken|)"
   (DECLARE (SPECIAL |EnumerationSequence-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EnumerationSequence-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EnumerationSequence-INDEX| ATN-PARSER::INDEX)
       (LET ((|EnumerationSequence-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|EnumerationSequence| *ATN-STACK)))
         (DECLARE (SPECIAL |EnumerationSequence-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EnumerationSequence|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EnumerationSequence|)
                                  (RETURN-FROM |EnumerationSequence| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EnumerationSequence| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EnumerationSequence.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EnumerationSequence.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EnumerationSequence/EnumerationSequence.2.8|
                                                                       ATN-PARSER::INDEX))))))
                                (|EnumerationSequence.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence.2|
                                                   (%ATN-EDGE-BLOCK (POP |EnumerationSequence|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EnumerationSequence|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|EnumerationSequence| ATN-PARSER::INDEX
                                                                                  (LIST '|EnumerationSequence|
                                                                                        |EnumerationSequence| '|Nmtoken|
                                                                                        |Nmtoken|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|EnumerationSequence-Constructor|
                                                                                  |EnumerationSequence| |Nmtoken|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EnumerationSequence|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EnumerationSequence|
                                                                                                         |Nmtoken|)))
                                                                                     '|EnumerationSequence|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s"
                                                                                  '|EnumerationSequence|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EnumerationSequence.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EnumerationSequence.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EnumerationSequence/EnumerationSequence.2.4|
                                                                       ATN-PARSER::INDEX))))))
                                (|EnumerationSequence/EnumerationSequence.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/EnumerationSequence.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::CAT |Nmtoken|)
                                                                    (COND
                                                                     ((|IS-Nmtoken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|Nmtoken|)
                                                                      (SETF |Nmtoken|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|Nmtoken-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|Nmtoken| ATN-PARSER::|item|)
                                                                                      '|Nmtoken|)))
                                                                      (|EnumerationSequence/EnumerationSequence.2.5|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM* '|Nmtoken|)
                                                                      (|EnumerationSequence/fail.3| ATN-PARSER::INDEX))))))
                                (|EnumerationSequence/EnumerationSequence.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/EnumerationSequence.2.5|
                                                   (%ATN-EDGE-BLOCK
                                                    (ATN-PARSER::JUMP |EnumerationSequence/EnumerationSequence.2.7|)
                                                    (|EnumerationSequence/EnumerationSequence.2.7| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |EnumerationSequence.2|)
                                                                    (|EnumerationSequence.2| ATN-PARSER::INDEX))))
                                (|EnumerationSequence/EnumerationSequence.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/EnumerationSequence.2.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EnumerationSequence.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EnumerationSequence/EnumerationSequence.2.8|
                                                                       ATN-PARSER::INDEX))))))
                                (|EnumerationSequence/EnumerationSequence.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/EnumerationSequence.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|\||)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|\||)
                                                                      (SETF *ATN-TERM* '|xml|:|\||)
                                                                      (|EnumerationSequence/EnumerationSequence.2.9|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|\||) NIL)))))
                                (|EnumerationSequence/EnumerationSequence.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/EnumerationSequence.2.9|
                                                   (%ATN-EDGE-BLOCK (PUSH |EnumerationSequence|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|EnumerationSequence|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |EnumerationSequence| ATN-PARSER::RESULT))
                                                                        (|EnumerationSequence.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|EnumerationSequence|) NIL))))))
                                (|EnumerationSequence/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EnumerationSequence/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EnumerationSequence/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EnumerationSequence.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EnumerationSequence/EnumerationSequence.2.4|
                                                                       ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EnumerationSequence.10| |EnumerationSequence.2|
                           |EnumerationSequence.6| |EnumerationSequence/EnumerationSequence.2.4|
                           |EnumerationSequence/EnumerationSequence.2.5| |EnumerationSequence/EnumerationSequence.2.7|
                           |EnumerationSequence/EnumerationSequence.2.8| |EnumerationSequence/EnumerationSequence.2.9|
                           |EnumerationSequence/fail.3| |EnumerationSequence/start.1|))
                         (|EnumerationSequence/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EnumerationSequence| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EnumerationSequence| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |DefaultDecl-INDEX|)
 (DEFUN |DefaultDecl| (ATN-PARSER::INDEX &AUX (|DefaultAttValue| NIL) (FIXED NIL) (IMPLIED NIL) (REQUIRED NIL))
   "{60} DefaultDecl ::= (REQUIRED | IMPLIED | ((FIXED S)? DefaultAttValue))
(|DefaultAttValue| FIXED IMPLIED REQUIRED)"
   (DECLARE (SPECIAL |DefaultDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |DefaultDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |DefaultDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|DefaultDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|DefaultDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |DefaultDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |DefaultDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|DefaultDecl|)
                                  (RETURN-FROM |DefaultDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |DefaultDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|DefaultDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |DefaultDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|DefaultDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|DefaultDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|DefaultAttValue| |DefaultAttValue| 'FIXED
                                                                                        FIXED 'IMPLIED IMPLIED 'REQUIRED REQUIRED))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|DefaultDecl-Constructor|
                                                                                                       |DefaultAttValue| FIXED
                                                                                                       IMPLIED REQUIRED)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|DefaultDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |DefaultAttValue| FIXED
                                                                                                         IMPLIED REQUIRED)))
                                                                                     '|DefaultDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|DefaultDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|DefaultDecl/DefaultDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl/DefaultDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|)
                                                                    (|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|
                                                                     ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |DefaultDecl/DefaultDecl.2.5|)
                                                                    (|DefaultDecl/DefaultDecl.2.5| ATN-PARSER::INDEX))))
                                (|DefaultDecl/DefaultDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl/DefaultDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |DefaultAttValue|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|DefaultAttValue|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |DefaultAttValue| ATN-PARSER::RESULT))
                                                                        (|DefaultDecl.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|DefaultAttValue|) NIL))))))
                                (|DefaultDecl/DefaultDecl/DefaultDecl.2.5.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST FIXED)
                                                                    (COND
                                                                     ((|IS-FIXEDToken| ATN-PARSER::|item|) (SETF *ATN-TERM* 'FIXED)
                                                                      (SETF FIXED
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|FIXED-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST 'FIXED ATN-PARSER::|item|)
                                                                                      'FIXED)))
                                                                      (|DefaultDecl/DefaultDecl/DefaultDecl.2.5.7|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'FIXED) NIL)))))
                                (|DefaultDecl/DefaultDecl/DefaultDecl.2.5.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl/DefaultDecl/DefaultDecl.2.5.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|DefaultDecl/DefaultDecl.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|DefaultDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|DefaultDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |DefaultDecl/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST REQUIRED)
                                                                      (COND
                                                                       ((|IS-REQUIREDToken| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* 'REQUIRED)
                                                                        (SETF REQUIRED
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|REQUIRED-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST 'REQUIRED ATN-PARSER::|item|)
                                                                                        'REQUIRED)))
                                                                        (|DefaultDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* 'REQUIRED) NIL)))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST IMPLIED)
                                                                      (COND
                                                                       ((|IS-IMPLIEDToken| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* 'IMPLIED)
                                                                        (SETF IMPLIED
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|IMPLIED-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST 'IMPLIED ATN-PARSER::|item|)
                                                                                        'IMPLIED)))
                                                                        (|DefaultDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* 'IMPLIED) NIL)))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |DefaultDecl/DefaultDecl.2.4|)
                                                                      (|DefaultDecl/DefaultDecl.2.4| ATN-PARSER::INDEX))
                                                                     (|DefaultDecl/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |DefaultDecl.2| |DefaultDecl/DefaultDecl.2.4|
                           |DefaultDecl/DefaultDecl.2.5| |DefaultDecl/DefaultDecl/DefaultDecl.2.5.6|
                           |DefaultDecl/DefaultDecl/DefaultDecl.2.5.7| |DefaultDecl/fail.3| |DefaultDecl/start.1|))
                         (|DefaultDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|DefaultDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|DefaultDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ConditionalSect-INDEX|)
 (DEFUN |ConditionalSect| (ATN-PARSER::INDEX &AUX (|IgnoreSect| NIL) (|IncludeSect| NIL) (|NamedConditionalSect| NIL))
   "{61} ConditionalSect ::= (IncludeSect | IgnoreSect | NamedConditionalSect)
(|IgnoreSect| |IncludeSect| |NamedConditionalSect|)"
   (DECLARE (SPECIAL |ConditionalSect-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ConditionalSect-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ConditionalSect-INDEX| ATN-PARSER::INDEX)
       (LET ((|ConditionalSect-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ConditionalSect| *ATN-STACK)))
         (DECLARE (SPECIAL |ConditionalSect-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ConditionalSect|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ConditionalSect|)
                                  (RETURN-FROM |ConditionalSect| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ConditionalSect| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ConditionalSect.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ConditionalSect.2|
                                                   (%ATN-EDGE-BLOCK (POP |ConditionalSect|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ConditionalSect|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ConditionalSect| ATN-PARSER::INDEX
                                                                                  (LIST '|IgnoreSect| |IgnoreSect| '|IncludeSect|
                                                                                        |IncludeSect| '|NamedConditionalSect|
                                                                                        |NamedConditionalSect|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|ConditionalSect-Constructor| |IgnoreSect|
                                                                                  |IncludeSect| |NamedConditionalSect|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ConditionalSect|
                                                                                           (DELETE NIL
                                                                                                   (LIST |IgnoreSect| |IncludeSect|
                                                                                                         |NamedConditionalSect|)))
                                                                                     '|ConditionalSect|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ConditionalSect|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ConditionalSect/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ConditionalSect/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ConditionalSect/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ConditionalSect/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |IncludeSect|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|IncludeSect| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |IncludeSect|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|ConditionalSect.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|IncludeSect|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |IgnoreSect|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|IgnoreSect| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |IgnoreSect| ATN-PARSER::RESULT))
                                                                                          (|ConditionalSect.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|IgnoreSect|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |NamedConditionalSect|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|NamedConditionalSect|
                                                                                           ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |NamedConditionalSect|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|ConditionalSect.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T
                                                                                          (SETF *ATN-TERM?*
                                                                                                  '|NamedConditionalSect|)
                                                                                          NIL))))
                                                                     (|ConditionalSect/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ConditionalSect.2| |ConditionalSect/fail.3|
                           |ConditionalSect/start.1|))
                         (|ConditionalSect/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ConditionalSect| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ConditionalSect| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |IncludeSect-INDEX|)
 (DEFUN |IncludeSect| (ATN-PARSER::INDEX &AUX (|ExtSubsetDecl| NIL))
   "{62} IncludeSect ::= '<![' S* INCLUDE S* '[' ExtSubsetDecl* ']]>'
(|ExtSubsetDecl|)"
   (DECLARE (SPECIAL |IncludeSect-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |IncludeSect-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |IncludeSect-INDEX| ATN-PARSER::INDEX)
       (LET ((|IncludeSect-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|IncludeSect| *ATN-STACK)))
         (DECLARE (SPECIAL |IncludeSect-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |IncludeSect|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|IncludeSect|)
                                  (RETURN-FROM |IncludeSect| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |IncludeSect| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|IncludeSect.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IncludeSect.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IncludeSect/IncludeSect.2.5| ATN-PARSER::INDEX))))))
                                (|IncludeSect.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IncludeSect.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IncludeSect/IncludeSect.2.7| ATN-PARSER::INDEX))))))
                                (|IncludeSect.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect.12|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExtSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExtSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExtSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |ExtSubsetDecl|)))
                                                                        (|IncludeSect.12| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExtSubsetDecl|)
                                                                        (|IncludeSect/IncludeSect.2.9| ATN-PARSER::INDEX)))))))
                                (|IncludeSect.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect.2|
                                                   (%ATN-EDGE-BLOCK (POP |IncludeSect|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|IncludeSect|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|IncludeSect| ATN-PARSER::INDEX
                                                                                  (LIST '|ExtSubsetDecl| |ExtSubsetDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|IncludeSect-Constructor|
                                                                                                       |ExtSubsetDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|IncludeSect|
                                                                                           (DELETE NIL (LIST |ExtSubsetDecl|)))
                                                                                     '|IncludeSect|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|IncludeSect|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|IncludeSect/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|IncludeSect/IncludeSect.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/IncludeSect.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IncludeSect.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IncludeSect/IncludeSect.2.5| ATN-PARSER::INDEX))))))
                                (|IncludeSect/IncludeSect.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/IncludeSect.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST INCLUDE)
                                                                    (COND
                                                                     ((|IS-INCLUDEToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'INCLUDE)
                                                                      (|IncludeSect/IncludeSect.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'INCLUDE)
                                                                      (|IncludeSect/fail.3| ATN-PARSER::INDEX))))))
                                (|IncludeSect/IncludeSect.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/IncludeSect.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IncludeSect.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IncludeSect/IncludeSect.2.7| ATN-PARSER::INDEX))))))
                                (|IncludeSect/IncludeSect.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/IncludeSect.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:[)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:[) (SETF *ATN-TERM* '|xml|:[)
                                                                      (|IncludeSect/IncludeSect.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:[)
                                                                      (|IncludeSect/fail.3| ATN-PARSER::INDEX))))))
                                (|IncludeSect/IncludeSect.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/IncludeSect.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExtSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExtSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExtSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |ExtSubsetDecl|)))
                                                                        (|IncludeSect.12| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExtSubsetDecl|)
                                                                        (|IncludeSect/IncludeSect.2.9| ATN-PARSER::INDEX)))))))
                                (|IncludeSect/IncludeSect.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/IncludeSect.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:]]>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:]]>)
                                                                      (SETF *ATN-TERM* '|xml|:]]>)
                                                                      (|IncludeSect.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:]]>)
                                                                      (|IncludeSect/fail.3| ATN-PARSER::INDEX))))))
                                (|IncludeSect/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IncludeSect/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<![)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<![)
                                                                      (SETF *ATN-TERM* '|xml|:<![)
                                                                      (|IncludeSect/IncludeSect.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<![)
                                                                      (|IncludeSect/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |IncludeSect.10| |IncludeSect.11| |IncludeSect.12|
                           |IncludeSect.2| |IncludeSect/fail.3| |IncludeSect/IncludeSect.2.4| |IncludeSect/IncludeSect.2.5|
                           |IncludeSect/IncludeSect.2.6| |IncludeSect/IncludeSect.2.7| |IncludeSect/IncludeSect.2.8|
                           |IncludeSect/IncludeSect.2.9| |IncludeSect/start.1|))
                         (|IncludeSect/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|IncludeSect| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|IncludeSect| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |IgnoreSect-INDEX|)
 (DEFUN |IgnoreSect| (ATN-PARSER::INDEX &AUX (|IgnoreSectContents| NIL))
   "{63} IgnoreSect ::= '<![' S* IGNORE S* '[' IgnoreSectContents? ']]>'
(|IgnoreSectContents|)"
   (DECLARE (SPECIAL |IgnoreSect-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |IgnoreSect-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |IgnoreSect-INDEX| ATN-PARSER::INDEX)
       (LET ((|IgnoreSect-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|IgnoreSect| *ATN-STACK)))
         (DECLARE (SPECIAL |IgnoreSect-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |IgnoreSect|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|IgnoreSect|)
                                  (RETURN-FROM |IgnoreSect| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |IgnoreSect| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|IgnoreSect.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IgnoreSect.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IgnoreSect/IgnoreSect.2.5| ATN-PARSER::INDEX))))))
                                (|IgnoreSect.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IgnoreSect.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IgnoreSect/IgnoreSect.2.7| ATN-PARSER::INDEX))))))
                                (|IgnoreSect.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect.2|
                                                   (%ATN-EDGE-BLOCK (POP |IgnoreSect|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|IgnoreSect|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|IgnoreSect| ATN-PARSER::INDEX
                                                                                  (LIST '|IgnoreSectContents|
                                                                                        |IgnoreSectContents|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|IgnoreSect-Constructor|
                                                                                                       |IgnoreSectContents|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|IgnoreSect|
                                                                                           (DELETE NIL
                                                                                                   (LIST |IgnoreSectContents|)))
                                                                                     '|IgnoreSect|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|IgnoreSect|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|IgnoreSect/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|IgnoreSect/IgnoreSect.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/IgnoreSect.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IgnoreSect.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IgnoreSect/IgnoreSect.2.5| ATN-PARSER::INDEX))))))
                                (|IgnoreSect/IgnoreSect.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/IgnoreSect.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST IGNORE)
                                                                    (COND
                                                                     ((|IS-IGNOREToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'IGNORE)
                                                                      (|IgnoreSect/IgnoreSect.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'IGNORE)
                                                                      (|IgnoreSect/fail.3| ATN-PARSER::INDEX))))))
                                (|IgnoreSect/IgnoreSect.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/IgnoreSect.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|IgnoreSect.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|IgnoreSect/IgnoreSect.2.7| ATN-PARSER::INDEX))))))
                                (|IgnoreSect/IgnoreSect.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/IgnoreSect.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:[)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:[) (SETF *ATN-TERM* '|xml|:[)
                                                                      (|IgnoreSect/IgnoreSect.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:[)
                                                                      (|IgnoreSect/fail.3| ATN-PARSER::INDEX))))))
                                (|IgnoreSect/IgnoreSect.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/IgnoreSect.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |IgnoreSectContents|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|IgnoreSectContents|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |IgnoreSectContents| ATN-PARSER::RESULT))
                                                                        (|IgnoreSect/IgnoreSect.2.9| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|IgnoreSectContents|)
                                                                        (|IgnoreSect/IgnoreSect.2.9| ATN-PARSER::INDEX)))))))
                                (|IgnoreSect/IgnoreSect.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/IgnoreSect.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:]]>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:]]>)
                                                                      (SETF *ATN-TERM* '|xml|:]]>)
                                                                      (|IgnoreSect.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:]]>)
                                                                      (|IgnoreSect/fail.3| ATN-PARSER::INDEX))))))
                                (|IgnoreSect/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSect/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<![)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<![)
                                                                      (SETF *ATN-TERM* '|xml|:<![)
                                                                      (|IgnoreSect/IgnoreSect.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<![)
                                                                      (|IgnoreSect/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |IgnoreSect.10| |IgnoreSect.11| |IgnoreSect.2|
                           |IgnoreSect/fail.3| |IgnoreSect/IgnoreSect.2.4| |IgnoreSect/IgnoreSect.2.5| |IgnoreSect/IgnoreSect.2.6|
                           |IgnoreSect/IgnoreSect.2.7| |IgnoreSect/IgnoreSect.2.8| |IgnoreSect/IgnoreSect.2.9|
                           |IgnoreSect/start.1|))
                         (|IgnoreSect/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|IgnoreSect| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|IgnoreSect| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |IgnoreSectContents-INDEX|)
 (DEFUN |IgnoreSectContents| (ATN-PARSER::INDEX &AUX (|Ignore| NIL) (|IgnoreSectContents| NIL))
   "{64} IgnoreSectContents ::= Ignore IgnoreSectContents?
(|Ignore| |IgnoreSectContents|)"
   (DECLARE (SPECIAL |IgnoreSectContents-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |IgnoreSectContents-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |IgnoreSectContents-INDEX| ATN-PARSER::INDEX)
       (LET ((|IgnoreSectContents-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|IgnoreSectContents| *ATN-STACK))
             (*ATN-REDUCE* NIL)
             (*PARSETABLE* |IgnoreSectContents-Parsetable|))
         (DECLARE (SPECIAL |IgnoreSectContents-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |IgnoreSectContents|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|IgnoreSectContents|)
                                  (RETURN-FROM |IgnoreSectContents| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |IgnoreSectContents| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|IgnoreSectContents.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSectContents.2|
                                                   (%ATN-EDGE-BLOCK (POP |IgnoreSectContents|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|IgnoreSectContents|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|IgnoreSectContents| ATN-PARSER::INDEX
                                                                                  (LIST '|Ignore| |Ignore| '|IgnoreSectContents|
                                                                                        |IgnoreSectContents|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|IgnoreSectContents-Constructor| |Ignore|
                                                                                  |IgnoreSectContents|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|IgnoreSectContents|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Ignore|
                                                                                                         |IgnoreSectContents|)))
                                                                                     '|IgnoreSectContents|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|IgnoreSectContents|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|IgnoreSectContents/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSectContents/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|IgnoreSectContents/IgnoreSectContents.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSectContents/IgnoreSectContents.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |IgnoreSectContents|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|IgnoreSectContents|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |IgnoreSectContents| ATN-PARSER::RESULT))
                                                                        (|IgnoreSectContents.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|IgnoreSectContents|)
                                                                        (|IgnoreSectContents.2| ATN-PARSER::INDEX)))))))
                                (|IgnoreSectContents/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |IgnoreSectContents/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |Ignore|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Ignore|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Ignore| ATN-PARSER::RESULT))
                                                                        (|IgnoreSectContents/IgnoreSectContents.2.4|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Ignore|)
                                                                        (|IgnoreSectContents/fail.3| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |IgnoreSectContents.2| |IgnoreSectContents/fail.3|
                           |IgnoreSectContents/IgnoreSectContents.2.4| |IgnoreSectContents/start.1|))
                         (|IgnoreSectContents/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|IgnoreSectContents| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|IgnoreSectContents| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Ignore-INDEX|)
 (DEFUN |Ignore| (ATN-PARSER::INDEX &AUX (|IgnoreCData| NIL) (|IgnoreSectContents| NIL))
   "{65} Ignore ::= (IgnoreCData | ('<![' IgnoreSectContents? ']]>'))
(|IgnoreCData| |IgnoreSectContents|)"
   (DECLARE (SPECIAL |Ignore-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Ignore-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Ignore-INDEX| ATN-PARSER::INDEX)
       (LET ((|Ignore-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Ignore| *ATN-STACK)))
         (DECLARE (SPECIAL |Ignore-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Ignore|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Ignore|)
                                  (RETURN-FROM |Ignore| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Ignore| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Ignore.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Ignore.2|
                                                   (%ATN-EDGE-BLOCK (POP |Ignore|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Ignore|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Ignore|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|IgnoreCData| |IgnoreCData|
                                                                                        '|IgnoreSectContents|
                                                                                        |IgnoreSectContents|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Ignore-Constructor|
                                                                                                       |IgnoreCData|
                                                                                                       |IgnoreSectContents|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Ignore|
                                                                                           (DELETE NIL
                                                                                                   (LIST |IgnoreCData|
                                                                                                         |IgnoreSectContents|)))
                                                                                     '|Ignore|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Ignore|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Ignore/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Ignore/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Ignore/Ignore.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Ignore/Ignore.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<![)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<![)
                                                                      (SETF *ATN-TERM* '|xml|:<![)
                                                                      (|Ignore/Ignore.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<![) NIL)))))
                                (|Ignore/Ignore.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Ignore/Ignore.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |IgnoreSectContents|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|IgnoreSectContents|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |IgnoreSectContents| ATN-PARSER::RESULT))
                                                                        (|Ignore/Ignore.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|IgnoreSectContents|)
                                                                        (|Ignore/Ignore.2.6| ATN-PARSER::INDEX)))))))
                                (|Ignore/Ignore.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Ignore/Ignore.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:]]>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:]]>)
                                                                      (SETF *ATN-TERM* '|xml|:]]>)
                                                                      (|Ignore.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:]]>) NIL)))))
                                (|Ignore/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Ignore/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (DE.SETF.UTILITY.IMPLEMENTATION::TEST |IgnoreCData|)
                                                                      (COND
                                                                       ((|IS-IgnoreCData| ATN-PARSER::|item|)
                                                                        (SETF *ATN-TERM* '|IgnoreCData|)
                                                                        (SETF |IgnoreCData|
                                                                                (IF (EQ *ATN-REDUCE* T)
                                                                                    (ATN-REDUCE-ITEM #'|IgnoreCData-Constructor|
                                                                                                     ATN-PARSER::|item|)
                                                                                    (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                        (LIST '|IgnoreCData| ATN-PARSER::|item|)
                                                                                        '|IgnoreCData|)))
                                                                        (|Ignore.2| (1+ ATN-PARSER::INDEX)))
                                                                       (T (SETF *ATN-TERM?* '|IgnoreCData|) NIL)))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |Ignore/Ignore.2.4|)
                                                                                      (|Ignore/Ignore.2.4| ATN-PARSER::INDEX))
                                                                     (|Ignore/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Ignore.2| |Ignore/fail.3| |Ignore/Ignore.2.4|
                           |Ignore/Ignore.2.5| |Ignore/Ignore.2.6| |Ignore/start.1|))
                         (|Ignore/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Ignore| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Ignore| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |NamedConditionalSect-INDEX|)
 (DEFUN |NamedConditionalSect| (ATN-PARSER::INDEX &AUX (|ExtSubsetDecl| NIL) (|PEReference| NIL))
   "NamedConditionalSect ::= '<![' S* PEReference S* '[' ExtSubsetDecl* ']]>'
(|ExtSubsetDecl| |PEReference|)"
   (DECLARE (SPECIAL |NamedConditionalSect-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |NamedConditionalSect-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |NamedConditionalSect-INDEX| ATN-PARSER::INDEX)
       (LET ((|NamedConditionalSect-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|NamedConditionalSect| *ATN-STACK))
             (*ATN-REDUCE* NIL))
         (DECLARE (SPECIAL |NamedConditionalSect-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |NamedConditionalSect|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|NamedConditionalSect|)
                                  (RETURN-FROM |NamedConditionalSect| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |NamedConditionalSect| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|NamedConditionalSect.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NamedConditionalSect.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NamedConditionalSect/NamedConditionalSect.2.5|
                                                                       ATN-PARSER::INDEX))))))
                                (|NamedConditionalSect.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NamedConditionalSect.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NamedConditionalSect/NamedConditionalSect.2.7|
                                                                       ATN-PARSER::INDEX))))))
                                (|NamedConditionalSect.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect.12|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExtSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExtSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExtSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |ExtSubsetDecl|)))
                                                                        (|NamedConditionalSect.12| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExtSubsetDecl|)
                                                                        (|NamedConditionalSect/NamedConditionalSect.2.9|
                                                                         ATN-PARSER::INDEX)))))))
                                (|NamedConditionalSect.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect.2|
                                                   (%ATN-EDGE-BLOCK (POP |NamedConditionalSect|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|NamedConditionalSect|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|NamedConditionalSect| ATN-PARSER::INDEX
                                                                                  (LIST '|ExtSubsetDecl| |ExtSubsetDecl|
                                                                                        '|PEReference| |PEReference|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE
                                                                                  #'|NamedConditionalSect-Constructor|
                                                                                  |ExtSubsetDecl| |PEReference|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|NamedConditionalSect|
                                                                                           (DELETE NIL
                                                                                                   (LIST |ExtSubsetDecl|
                                                                                                         |PEReference|)))
                                                                                     '|NamedConditionalSect|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s"
                                                                                  '|NamedConditionalSect|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|NamedConditionalSect/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|NamedConditionalSect/NamedConditionalSect.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/NamedConditionalSect.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NamedConditionalSect.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NamedConditionalSect/NamedConditionalSect.2.5|
                                                                       ATN-PARSER::INDEX))))))
                                (|NamedConditionalSect/NamedConditionalSect.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/NamedConditionalSect.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |PEReference|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|PEReference|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |PEReference| ATN-PARSER::RESULT))
                                                                        (|NamedConditionalSect/NamedConditionalSect.2.6|
                                                                         ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|PEReference|)
                                                                        (|NamedConditionalSect/fail.3| ATN-PARSER::INDEX)))))))
                                (|NamedConditionalSect/NamedConditionalSect.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/NamedConditionalSect.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NamedConditionalSect.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NamedConditionalSect/NamedConditionalSect.2.7|
                                                                       ATN-PARSER::INDEX))))))
                                (|NamedConditionalSect/NamedConditionalSect.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/NamedConditionalSect.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:[)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:[) (SETF *ATN-TERM* '|xml|:[)
                                                                      (|NamedConditionalSect/NamedConditionalSect.2.8|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:[)
                                                                      (|NamedConditionalSect/fail.3| ATN-PARSER::INDEX))))))
                                (|NamedConditionalSect/NamedConditionalSect.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/NamedConditionalSect.2.8|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExtSubsetDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExtSubsetDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExtSubsetDecl|
                                                                                  (CONS ATN-PARSER::RESULT |ExtSubsetDecl|)))
                                                                        (|NamedConditionalSect.12| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExtSubsetDecl|)
                                                                        (|NamedConditionalSect/NamedConditionalSect.2.9|
                                                                         ATN-PARSER::INDEX)))))))
                                (|NamedConditionalSect/NamedConditionalSect.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/NamedConditionalSect.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:]]>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:]]>)
                                                                      (SETF *ATN-TERM* '|xml|:]]>)
                                                                      (|NamedConditionalSect.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:]]>)
                                                                      (|NamedConditionalSect/fail.3| ATN-PARSER::INDEX))))))
                                (|NamedConditionalSect/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NamedConditionalSect/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<![)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<![)
                                                                      (SETF *ATN-TERM* '|xml|:<![)
                                                                      (|NamedConditionalSect/NamedConditionalSect.2.4|
                                                                       (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<![)
                                                                      (|NamedConditionalSect/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |NamedConditionalSect.10| |NamedConditionalSect.11|
                           |NamedConditionalSect.12| |NamedConditionalSect.2| |NamedConditionalSect/fail.3|
                           |NamedConditionalSect/NamedConditionalSect.2.4| |NamedConditionalSect/NamedConditionalSect.2.5|
                           |NamedConditionalSect/NamedConditionalSect.2.6| |NamedConditionalSect/NamedConditionalSect.2.7|
                           |NamedConditionalSect/NamedConditionalSect.2.8| |NamedConditionalSect/NamedConditionalSect.2.9|
                           |NamedConditionalSect/start.1|))
                         (|NamedConditionalSect/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|NamedConditionalSect| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|NamedConditionalSect| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |CharRef-INDEX|)
 (DEFUN |CharRef| (ATN-PARSER::INDEX &AUX (|HexNumber| NIL) (|Number| NIL))
   "{66} CharRef ::= (('&#' Number ';') | ('&#x' HexNumber ';'))
(|HexNumber| |Number|)"
   (DECLARE (SPECIAL |CharRef-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |CharRef-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |CharRef-INDEX| ATN-PARSER::INDEX)
       (LET ((|CharRef-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|CharRef| *ATN-STACK)))
         (DECLARE (SPECIAL |CharRef-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |CharRef|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|CharRef|)
                                  (RETURN-FROM |CharRef| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |CharRef| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|CharRef.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef.2|
                                                   (%ATN-EDGE-BLOCK (POP |CharRef|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|CharRef|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|CharRef|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|HexNumber| |HexNumber| '|Number|
                                                                                        |Number|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|CharRef-Constructor|
                                                                                                       |HexNumber| |Number|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|CharRef|
                                                                                           (DELETE NIL
                                                                                                   (LIST |HexNumber| |Number|)))
                                                                                     '|CharRef|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|CharRef|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|CharRef/CharRef.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/CharRef.2.4|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|&#|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|&#|)
                                                                      (SETF *ATN-TERM* '|xml|:|&#|)
                                                                      (|CharRef/CharRef.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|&#|) NIL)))))
                                (|CharRef/CharRef.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/CharRef.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |Number|)
                                                                    (COND
                                                                     ((|IS-Number| ATN-PARSER::|item|) (SETF *ATN-TERM* '|Number|)
                                                                      (SETF |Number|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|Number-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|Number| ATN-PARSER::|item|)
                                                                                      '|Number|)))
                                                                      (|CharRef/CharRef.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|Number|) NIL)))))
                                (|CharRef/CharRef.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/CharRef.2.6|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|;|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|;|)
                                                                      (SETF *ATN-TERM* '|xml|:|;|)
                                                                      (|CharRef.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|;|) NIL)))))
                                (|CharRef/CharRef.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/CharRef.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|&#x|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|&#x|)
                                                                      (SETF *ATN-TERM* '|xml|:|&#x|)
                                                                      (|CharRef/CharRef.2.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|&#x|) NIL)))))
                                (|CharRef/CharRef.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/CharRef.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |HexNumber|)
                                                                    (COND
                                                                     ((|IS-HexNumber| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|HexNumber|)
                                                                      (SETF |HexNumber|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|HexNumber-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|HexNumber| ATN-PARSER::|item|)
                                                                                      '|HexNumber|)))
                                                                      (|CharRef/CharRef.2.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|HexNumber|) NIL)))))
                                (|CharRef/CharRef.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/CharRef.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|;|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|;|)
                                                                      (SETF *ATN-TERM* '|xml|:|;|)
                                                                      (|CharRef.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|;|) NIL)))))
                                (|CharRef/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|CharRef/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |CharRef/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |CharRef/CharRef.2.4|)
                                                                                      (|CharRef/CharRef.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |CharRef/CharRef.2.7|)
                                                                                      (|CharRef/CharRef.2.7| ATN-PARSER::INDEX))
                                                                     (|CharRef/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |CharRef.2| |CharRef/CharRef.2.4| |CharRef/CharRef.2.5|
                           |CharRef/CharRef.2.6| |CharRef/CharRef.2.7| |CharRef/CharRef.2.8| |CharRef/CharRef.2.9| |CharRef/fail.3|
                           |CharRef/start.1|))
                         (|CharRef/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|CharRef| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|CharRef| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |Reference-INDEX|)
 (DEFUN |Reference| (ATN-PARSER::INDEX &AUX (|CharRef| NIL) (|EntityRef| NIL))
   "{67} Reference ::= (EntityRef | CharRef)
(|CharRef| |EntityRef|)"
   (DECLARE (SPECIAL |Reference-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |Reference-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |Reference-INDEX| ATN-PARSER::INDEX)
       (LET ((|Reference-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|Reference| *ATN-STACK)))
         (DECLARE (SPECIAL |Reference-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |Reference|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|Reference|)
                                  (RETURN-FROM |Reference| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |Reference| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|Reference.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Reference.2|
                                                   (%ATN-EDGE-BLOCK (POP |Reference|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|Reference|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|Reference|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|CharRef| |CharRef| '|EntityRef|
                                                                                        |EntityRef|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|Reference-Constructor|
                                                                                                       |CharRef| |EntityRef|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|Reference|
                                                                                           (DELETE NIL
                                                                                                   (LIST |CharRef| |EntityRef|)))
                                                                                     '|Reference|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|Reference|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|Reference/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Reference/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|Reference/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |Reference/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |EntityRef|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|EntityRef| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |EntityRef| ATN-PARSER::RESULT))
                                                                                          (|Reference.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|EntityRef|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |CharRef|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|CharRef| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |CharRef| ATN-PARSER::RESULT))
                                                                                          (|Reference.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|CharRef|) NIL))))
                                                                     (|Reference/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |Reference.2| |Reference/fail.3| |Reference/start.1|))
                         (|Reference/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|Reference| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|Reference| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EntityRef-INDEX|)
 (DEFUN |EntityRef| (ATN-PARSER::INDEX &AUX (|NCName| NIL))
   "{68} EntityRef ::= '&' NCName ';'
(|NCName|)"
   (DECLARE (SPECIAL |EntityRef-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EntityRef-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EntityRef-INDEX| ATN-PARSER::INDEX)
       (LET ((|EntityRef-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|EntityRef| *ATN-STACK)))
         (DECLARE (SPECIAL |EntityRef-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EntityRef|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EntityRef|)
                                  (RETURN-FROM |EntityRef| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EntityRef| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EntityRef.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityRef.2|
                                                   (%ATN-EDGE-BLOCK (POP |EntityRef|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EntityRef|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|EntityRef|
                                                                                  ATN-PARSER::INDEX (LIST '|NCName| |NCName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|EntityRef-Constructor|
                                                                                                       |NCName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EntityRef|
                                                                                           (DELETE NIL (LIST |NCName|)))
                                                                                     '|EntityRef|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|EntityRef|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EntityRef/EntityRef.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityRef/EntityRef.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|EntityRef/EntityRef.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|EntityRef/fail.3| ATN-PARSER::INDEX))))))
                                (|EntityRef/EntityRef.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityRef/EntityRef.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|;|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|;|)
                                                                      (SETF *ATN-TERM* '|xml|:|;|)
                                                                      (|EntityRef.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|;|)
                                                                      (|EntityRef/fail.3| ATN-PARSER::INDEX))))))
                                (|EntityRef/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityRef/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EntityRef/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityRef/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:&)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:&) (SETF *ATN-TERM* '|xml|:&)
                                                                      (|EntityRef/EntityRef.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:&)
                                                                      (|EntityRef/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EntityRef.2| |EntityRef/EntityRef.2.4|
                           |EntityRef/EntityRef.2.5| |EntityRef/fail.3| |EntityRef/start.1|))
                         (|EntityRef/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EntityRef| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EntityRef| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |PEReference-INDEX|)
 (DEFUN |PEReference| (ATN-PARSER::INDEX &AUX (|NCName| NIL))
   "{69} PEReference ::= '%' NCName ';'
(|NCName|)"
   (DECLARE (SPECIAL |PEReference-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |PEReference-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |PEReference-INDEX| ATN-PARSER::INDEX)
       (LET ((|PEReference-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|PEReference| *ATN-STACK)))
         (DECLARE (SPECIAL |PEReference-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |PEReference|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|PEReference|)
                                  (RETURN-FROM |PEReference| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |PEReference| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|PEReference.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEReference.2|
                                                   (%ATN-EDGE-BLOCK (POP |PEReference|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|PEReference|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|PEReference| ATN-PARSER::INDEX
                                                                                  (LIST '|NCName| |NCName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|PEReference-Constructor|
                                                                                                       |NCName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|PEReference|
                                                                                           (DELETE NIL (LIST |NCName|)))
                                                                                     '|PEReference|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|PEReference|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|PEReference/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEReference/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|PEReference/PEReference.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEReference/PEReference.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|PEReference/PEReference.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|PEReference/fail.3| ATN-PARSER::INDEX))))))
                                (|PEReference/PEReference.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEReference/PEReference.2.5|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|;|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|;|)
                                                                      (SETF *ATN-TERM* '|xml|:|;|)
                                                                      (|PEReference.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|;|)
                                                                      (|PEReference/fail.3| ATN-PARSER::INDEX))))))
                                (|PEReference/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEReference/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:%)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:%) (SETF *ATN-TERM* '|xml|:%)
                                                                      (|PEReference/PEReference.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:%)
                                                                      (|PEReference/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |PEReference.2| |PEReference/fail.3|
                           |PEReference/PEReference.2.4| |PEReference/PEReference.2.5| |PEReference/start.1|))
                         (|PEReference/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|PEReference| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|PEReference| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EntityDecl-INDEX|)
 (DEFUN |EntityDecl| (ATN-PARSER::INDEX &AUX (|GEDecl| NIL) (|PEDecl| NIL))
   "{70} EntityDecl ::= '<!ENTITY' S+ ((GEDecl | PEDecl))
(|GEDecl| |PEDecl|)"
   (DECLARE (SPECIAL |EntityDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EntityDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EntityDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|EntityDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|EntityDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |EntityDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EntityDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EntityDecl|)
                                  (RETURN-FROM |EntityDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EntityDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EntityDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |EntityDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EntityDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|EntityDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|GEDecl| |GEDecl| '|PEDecl| |PEDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|EntityDecl-Constructor|
                                                                                                       |GEDecl| |PEDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EntityDecl|
                                                                                           (DELETE NIL (LIST |GEDecl| |PEDecl|)))
                                                                                     '|EntityDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|EntityDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EntityDecl.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDecl.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EntityDecl.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EntityDecl/EntityDecl.2.5| ATN-PARSER::INDEX))))))
                                (|EntityDecl/EntityDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDecl/EntityDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EntityDecl.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EntityDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|EntityDecl/EntityDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDecl/EntityDecl.2.5|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |GEDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|GEDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |GEDecl| ATN-PARSER::RESULT))
                                                                                          (|EntityDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|GEDecl|) NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |PEDecl|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|PEDecl| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |PEDecl| ATN-PARSER::RESULT))
                                                                                          (|EntityDecl.2|
                                                                                           ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|PEDecl|) NIL))))
                                                                     (|EntityDecl/fail.3| ATN-PARSER::INDEX)))))
                                (|EntityDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EntityDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<!ENTITY)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<!ENTITY)
                                                                      (SETF *ATN-TERM* '|xml|:<!ENTITY)
                                                                      (|EntityDecl/EntityDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<!ENTITY)
                                                                      (|EntityDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EntityDecl.2| |EntityDecl.6| |EntityDecl/EntityDecl.2.4|
                           |EntityDecl/EntityDecl.2.5| |EntityDecl/fail.3| |EntityDecl/start.1|))
                         (|EntityDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EntityDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EntityDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |GEDecl-INDEX|)
 (DEFUN |GEDecl| (ATN-PARSER::INDEX &AUX (|EntityDef| NIL) (|NCName| NIL))
   "{71} GEDecl ::= NCName S+ EntityDef S* '>'
(|EntityDef| |NCName|)"
   (DECLARE (SPECIAL |GEDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |GEDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |GEDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|GEDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|GEDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |GEDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |GEDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|GEDecl|)
                                  (RETURN-FROM |GEDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |GEDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|GEDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |GEDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|GEDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|GEDecl|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|EntityDef| |EntityDef| '|NCName|
                                                                                        |NCName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|GEDecl-Constructor|
                                                                                                       |EntityDef| |NCName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|GEDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EntityDef| |NCName|)))
                                                                                     '|GEDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|GEDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|GEDecl.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|GEDecl.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|GEDecl/GEDecl.2.5| ATN-PARSER::INDEX))))))
                                (|GEDecl.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|GEDecl.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|GEDecl/GEDecl.2.7| ATN-PARSER::INDEX))))))
                                (|GEDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|GEDecl/GEDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl/GEDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|GEDecl.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|GEDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|GEDecl/GEDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl/GEDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |EntityDef|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|EntityDef|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |EntityDef| ATN-PARSER::RESULT))
                                                                        (|GEDecl/GEDecl.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|EntityDef|)
                                                                        (|GEDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|GEDecl/GEDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl/GEDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|GEDecl.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|GEDecl/GEDecl.2.7| ATN-PARSER::INDEX))))))
                                (|GEDecl/GEDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl/GEDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|GEDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|GEDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|GEDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |GEDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|GEDecl/GEDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|GEDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |GEDecl.2| |GEDecl.8| |GEDecl.9| |GEDecl/fail.3|
                           |GEDecl/GEDecl.2.4| |GEDecl/GEDecl.2.5| |GEDecl/GEDecl.2.6| |GEDecl/GEDecl.2.7| |GEDecl/start.1|))
                         (|GEDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|GEDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|GEDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |PEDecl-INDEX|)
 (DEFUN |PEDecl| (ATN-PARSER::INDEX &AUX (|NCName| NIL) (|PEDef| NIL))
   "{72} PEDecl ::= '%' S+ NCName S+ PEDef S* '>'
(|NCName| |PEDef|)"
   (DECLARE (SPECIAL |PEDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |PEDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |PEDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|PEDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|PEDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |PEDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |PEDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|PEDecl|)
                                  (RETURN-FROM |PEDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |PEDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|PEDecl.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PEDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PEDecl/PEDecl.2.5| ATN-PARSER::INDEX))))))
                                (|PEDecl.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PEDecl.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PEDecl/PEDecl.2.7| ATN-PARSER::INDEX))))))
                                (|PEDecl.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PEDecl.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PEDecl/PEDecl.2.9| ATN-PARSER::INDEX))))))
                                (|PEDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |PEDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|PEDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|PEDecl|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|NCName| |NCName| '|PEDef| |PEDef|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|PEDecl-Constructor|
                                                                                                       |NCName| |PEDef|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|PEDecl|
                                                                                           (DELETE NIL (LIST |NCName| |PEDef|)))
                                                                                     '|PEDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|PEDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|PEDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|PEDecl/PEDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/PEDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PEDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PEDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|PEDecl/PEDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/PEDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|PEDecl/PEDecl.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|PEDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|PEDecl/PEDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/PEDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PEDecl.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PEDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|PEDecl/PEDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/PEDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (PUSH |PEDef|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|PEDef|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT (SETF |PEDef| ATN-PARSER::RESULT))
                                                                        (|PEDecl/PEDecl.2.8| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|PEDef|)
                                                                        (|PEDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|PEDecl/PEDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/PEDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PEDecl.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PEDecl/PEDecl.2.9| ATN-PARSER::INDEX))))))
                                (|PEDecl/PEDecl.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/PEDecl.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|PEDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|PEDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|PEDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:%)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:%) (SETF *ATN-TERM* '|xml|:%)
                                                                      (|PEDecl/PEDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:%)
                                                                      (|PEDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |PEDecl.10| |PEDecl.11| |PEDecl.12| |PEDecl.2|
                           |PEDecl/fail.3| |PEDecl/PEDecl.2.4| |PEDecl/PEDecl.2.5| |PEDecl/PEDecl.2.6| |PEDecl/PEDecl.2.7|
                           |PEDecl/PEDecl.2.8| |PEDecl/PEDecl.2.9| |PEDecl/start.1|))
                         (|PEDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|PEDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|PEDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EntityDef-INDEX|)
 (DEFUN |EntityDef| (ATN-PARSER::INDEX &AUX (|EntityValue| NIL) (|ExternalID| NIL) (|NDataDecl| NIL))
   "{73} EntityDef ::= (EntityValue | (ExternalID NDataDecl?))
(|EntityValue| |ExternalID| |NDataDecl|)"
   (DECLARE (SPECIAL |EntityDef-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EntityDef-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EntityDef-INDEX| ATN-PARSER::INDEX)
       (LET ((|EntityDef-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|EntityDef| *ATN-STACK)))
         (DECLARE (SPECIAL |EntityDef-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EntityDef|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EntityDef|)
                                  (RETURN-FROM |EntityDef| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EntityDef| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EntityDef.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDef.2|
                                                   (%ATN-EDGE-BLOCK (POP |EntityDef|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EntityDef|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|EntityDef|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|EntityValue| |EntityValue| '|ExternalID|
                                                                                        |ExternalID| '|NDataDecl| |NDataDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|EntityDef-Constructor|
                                                                                                       |EntityValue| |ExternalID|
                                                                                                       |NDataDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EntityDef|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EntityValue| |ExternalID|
                                                                                                         |NDataDecl|)))
                                                                                     '|EntityDef|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|EntityDef|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EntityDef/EntityDef.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDef/EntityDef.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |ExternalID|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|ExternalID|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |ExternalID| ATN-PARSER::RESULT))
                                                                        (|EntityDef/EntityDef.2.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|ExternalID|) NIL))))))
                                (|EntityDef/EntityDef.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDef/EntityDef.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |NDataDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|NDataDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |NDataDecl| ATN-PARSER::RESULT))
                                                                        (|EntityDef.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|NDataDecl|)
                                                                        (|EntityDef.2| ATN-PARSER::INDEX)))))))
                                (|EntityDef/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDef/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EntityDef/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EntityDef/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |EntityValue|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|EntityValue| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |EntityValue|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|EntityDef.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|EntityValue|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |EntityDef/EntityDef.2.4|)
                                                                                      (|EntityDef/EntityDef.2.4|
                                                                                       ATN-PARSER::INDEX))
                                                                     (|EntityDef/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EntityDef.2| |EntityDef/EntityDef.2.4|
                           |EntityDef/EntityDef.2.5| |EntityDef/fail.3| |EntityDef/start.1|))
                         (|EntityDef/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EntityDef| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EntityDef| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |PEDef-INDEX|)
 (DEFUN |PEDef| (ATN-PARSER::INDEX &AUX (|EntityValue| NIL) (|ExternalID| NIL))
   "{74} PEDef ::= (EntityValue | ExternalID)
(|EntityValue| |ExternalID|)"
   (DECLARE (SPECIAL |PEDef-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |PEDef-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |PEDef-INDEX| ATN-PARSER::INDEX)
       (LET ((|PEDef-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|PEDef| *ATN-STACK)))
         (DECLARE (SPECIAL |PEDef-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |PEDef|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|PEDef|)
                                  (RETURN-FROM |PEDef| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |PEDef| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|PEDef.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDef.2|
                                                   (%ATN-EDGE-BLOCK (POP |PEDef|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|PEDef|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|PEDef|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|EntityValue| |EntityValue| '|ExternalID|
                                                                                        |ExternalID|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|PEDef-Constructor|
                                                                                                       |EntityValue| |ExternalID|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|PEDef|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EntityValue|
                                                                                                         |ExternalID|)))
                                                                                     '|PEDef|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|PEDef|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|PEDef/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDef/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|PEDef/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PEDef/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (PUSH |EntityValue|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|EntityValue| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |EntityValue|
                                                                                                    ATN-PARSER::RESULT))
                                                                                          (|PEDef.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|EntityValue|)
                                                                                          NIL))))
                                                                     (%ATN-EDGE-BLOCK (PUSH |ExternalID|)
                                                                                      (MULTIPLE-VALUE-BIND
                                                                                          (ATN-PARSER::RESULT
                                                                                           ATN-PARSER::RESULT-INDEX
                                                                                           ATN-PARSER::SUCCESS)
                                                                                          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE
                                                                                           '|ExternalID| ATN-PARSER::INDEX)
                                                                                        (COND
                                                                                         (ATN-PARSER::SUCCESS
                                                                                          (WHEN ATN-PARSER::RESULT
                                                                                            (SETF |ExternalID| ATN-PARSER::RESULT))
                                                                                          (|PEDef.2| ATN-PARSER::RESULT-INDEX))
                                                                                         (T (SETF *ATN-TERM?* '|ExternalID|)
                                                                                          NIL))))
                                                                     (|PEDef/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |PEDef.2| |PEDef/fail.3| |PEDef/start.1|))
                         (|PEDef/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|PEDef| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|PEDef| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ExternalID-INDEX|)
 (DEFUN |ExternalID| (ATN-PARSER::INDEX &AUX (|PubidLiteral| NIL) (|SystemLiteral| NIL))
   "{75} ExternalID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC S+ PubidLiteral S+
                                                  SystemLiteral))
(|PubidLiteral| |SystemLiteral|)"
   (DECLARE (SPECIAL |ExternalID-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ExternalID-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ExternalID-INDEX| ATN-PARSER::INDEX)
       (LET ((|ExternalID-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ExternalID| *ATN-STACK))
             (*PARSETABLE* |ExternalID-Parsetable|))
         (DECLARE (SPECIAL |ExternalID-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ExternalID|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ExternalID|)
                                  (RETURN-FROM |ExternalID| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ExternalID| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ExternalID.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID.13|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ExternalID.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ExternalID/ExternalID.2.10| ATN-PARSER::INDEX))))))
                                (|ExternalID.14| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID.14|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ExternalID.14| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ExternalID/ExternalID.2.12| ATN-PARSER::INDEX))))))
                                (|ExternalID.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID.2|
                                                   (%ATN-EDGE-BLOCK (POP |ExternalID|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ExternalID|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ExternalID| ATN-PARSER::INDEX
                                                                                  (LIST '|PubidLiteral| |PubidLiteral|
                                                                                        '|SystemLiteral| |SystemLiteral|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|ExternalID-Constructor|
                                                                                                       |PubidLiteral|
                                                                                                       |SystemLiteral|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ExternalID|
                                                                                           (DELETE NIL
                                                                                                   (LIST |PubidLiteral|
                                                                                                         |SystemLiteral|)))
                                                                                     '|ExternalID|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ExternalID|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ExternalID.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ExternalID.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|ExternalID/ExternalID.2.6| ATN-PARSER::INDEX))))))
                                (|ExternalID/ExternalID.2.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.10|
                                                   (%ATN-EDGE-BLOCK (PUSH |PubidLiteral|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|PubidLiteral|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |PubidLiteral| ATN-PARSER::RESULT))
                                                                        (|ExternalID/ExternalID.2.11| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|PubidLiteral|) NIL))))))
                                (|ExternalID/ExternalID.2.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ExternalID.14| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|ExternalID/ExternalID.2.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.12|
                                                   (%ATN-EDGE-BLOCK (PUSH |SystemLiteral|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|SystemLiteral|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |SystemLiteral| ATN-PARSER::RESULT))
                                                                        (|ExternalID.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|SystemLiteral|) NIL))))))
                                (|ExternalID/ExternalID.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST SYSTEM)
                                                                    (COND
                                                                     ((|IS-SYSTEMToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'SYSTEM)
                                                                      (|ExternalID/ExternalID.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'SYSTEM) NIL)))))
                                (|ExternalID/ExternalID.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ExternalID.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|ExternalID/ExternalID.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |SystemLiteral|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|SystemLiteral|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |SystemLiteral| ATN-PARSER::RESULT))
                                                                        (|ExternalID.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|SystemLiteral|) NIL))))))
                                (|ExternalID/ExternalID.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST PUBLIC)
                                                                    (COND
                                                                     ((|IS-PUBLICToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'PUBLIC)
                                                                      (|ExternalID/ExternalID.2.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'PUBLIC) NIL)))))
                                (|ExternalID/ExternalID.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/ExternalID.2.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|ExternalID.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|ExternalID/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ExternalID/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExternalID/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |ExternalID/ExternalID.2.4|)
                                                                      (|ExternalID/ExternalID.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |ExternalID/ExternalID.2.8|)
                                                                      (|ExternalID/ExternalID.2.8| ATN-PARSER::INDEX))
                                                                     (|ExternalID/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ExternalID.13| |ExternalID.14| |ExternalID.2|
                           |ExternalID.7| |ExternalID/ExternalID.2.10| |ExternalID/ExternalID.2.11| |ExternalID/ExternalID.2.12|
                           |ExternalID/ExternalID.2.4| |ExternalID/ExternalID.2.5| |ExternalID/ExternalID.2.6|
                           |ExternalID/ExternalID.2.8| |ExternalID/ExternalID.2.9| |ExternalID/fail.3| |ExternalID/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|ExternalID/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ExternalID| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ExternalID| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |NDataDecl-INDEX|)
 (DEFUN |NDataDecl| (ATN-PARSER::INDEX &AUX (|NCName| NIL))
   "{76} NDataDecl ::= S+ NDATA S+ NCName
(|NCName|)"
   (DECLARE (SPECIAL |NDataDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |NDataDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |NDataDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|NDataDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|NDataDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |NDataDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |NDataDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|NDataDecl|)
                                  (RETURN-FROM |NDataDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |NDataDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|NDataDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |NDataDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|NDataDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|NDataDecl|
                                                                                  ATN-PARSER::INDEX (LIST '|NCName| |NCName|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|NDataDecl-Constructor|
                                                                                                       |NCName|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|NDataDecl|
                                                                                           (DELETE NIL (LIST |NCName|)))
                                                                                     '|NDataDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|NDataDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|NDataDecl.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NDataDecl.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NDataDecl/NDataDecl.2.4| ATN-PARSER::INDEX))))))
                                (|NDataDecl.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NDataDecl.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NDataDecl/NDataDecl.2.6| ATN-PARSER::INDEX))))))
                                (|NDataDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|NDataDecl/NDataDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl/NDataDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST NDATA)
                                                                    (COND
                                                                     ((|IS-NDATAToken| ATN-PARSER::|item|) (SETF *ATN-TERM* 'NDATA)
                                                                      (|NDataDecl/NDataDecl.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'NDATA)
                                                                      (|NDataDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NDataDecl/NDataDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl/NDataDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NDataDecl.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NDataDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NDataDecl/NDataDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl/NDataDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|NDataDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|NDataDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NDataDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NDataDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NDataDecl.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NDataDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |NDataDecl.2| |NDataDecl.7| |NDataDecl.8| |NDataDecl/fail.3|
                           |NDataDecl/NDataDecl.2.4| |NDataDecl/NDataDecl.2.5| |NDataDecl/NDataDecl.2.6| |NDataDecl/start.1|))
                         (|NDataDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|NDataDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|NDataDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |TextDecl-INDEX|)
 (DEFUN |TextDecl| (ATN-PARSER::INDEX &AUX (|EncodingDecl| NIL) (|VersionInfo| NIL))
   "{77} TextDecl ::= '<?xml' VersionInfo? EncodingDecl S* '?>'
(|EncodingDecl| |VersionInfo|)"
   (DECLARE (SPECIAL |TextDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |TextDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |TextDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|TextDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|TextDecl| *ATN-STACK))
             (*PARSETABLE* |TextDecl-Parsetable|))
         (DECLARE (SPECIAL |TextDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |TextDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|TextDecl|)
                                  (RETURN-FROM |TextDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |TextDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|TextDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |TextDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|TextDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|TextDecl|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|EncodingDecl| |EncodingDecl|
                                                                                        '|VersionInfo| |VersionInfo|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|TextDecl-Constructor|
                                                                                                       |EncodingDecl|
                                                                                                       |VersionInfo|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|TextDecl|
                                                                                           (DELETE NIL
                                                                                                   (LIST |EncodingDecl|
                                                                                                         |VersionInfo|)))
                                                                                     '|TextDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|TextDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|TextDecl.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|TextDecl.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|TextDecl/TextDecl.2.7| ATN-PARSER::INDEX))))))
                                (|TextDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|TextDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|<?xml|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|<?xml|)
                                                                      (SETF *ATN-TERM* '|xml|:|<?xml|)
                                                                      (|TextDecl/TextDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|<?xml|)
                                                                      (|TextDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|TextDecl/TextDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl/TextDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |VersionInfo|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|VersionInfo|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |VersionInfo| ATN-PARSER::RESULT))
                                                                        (|TextDecl/TextDecl.2.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|VersionInfo|)
                                                                        (|TextDecl/TextDecl.2.5| ATN-PARSER::INDEX)))))))
                                (|TextDecl/TextDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl/TextDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |EncodingDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|EncodingDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |EncodingDecl| ATN-PARSER::RESULT))
                                                                        (|TextDecl/TextDecl.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|EncodingDecl|)
                                                                        (|TextDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|TextDecl/TextDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl/TextDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|TextDecl.8| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|TextDecl/TextDecl.2.7| ATN-PARSER::INDEX))))))
                                (|TextDecl/TextDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |TextDecl/TextDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:?>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:?>) (SETF *ATN-TERM* '|xml|:?>)
                                                                      (|TextDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:?>)
                                                                      (|TextDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |TextDecl.2| |TextDecl.8| |TextDecl/fail.3|
                           |TextDecl/start.1| |TextDecl/TextDecl.2.4| |TextDecl/TextDecl.2.5| |TextDecl/TextDecl.2.6|
                           |TextDecl/TextDecl.2.7|))
                         (|TextDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|TextDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|TextDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |ExtParsedEnt-INDEX|)
 (DEFUN |ExtParsedEnt| (ATN-PARSER::INDEX &AUX (|Content| NIL) (|TextDecl| NIL))
   "{78} ExtParsedEnt ::= TextDecl? Content*
(|Content| |TextDecl|)"
   (DECLARE (SPECIAL |ExtParsedEnt-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |ExtParsedEnt-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |ExtParsedEnt-INDEX| ATN-PARSER::INDEX)
       (LET ((|ExtParsedEnt-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|ExtParsedEnt| *ATN-STACK))
             (*PARSETABLE* |ExtParsedEnt-Parsetable|))
         (DECLARE (SPECIAL |ExtParsedEnt-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |ExtParsedEnt|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|ExtParsedEnt|)
                                  (RETURN-FROM |ExtParsedEnt| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |ExtParsedEnt| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|ExtParsedEnt.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtParsedEnt.2|
                                                   (%ATN-EDGE-BLOCK (POP |ExtParsedEnt|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|ExtParsedEnt|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|ExtParsedEnt| ATN-PARSER::INDEX
                                                                                  (LIST '|Content| |Content| '|TextDecl|
                                                                                        |TextDecl|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-PARSER::ATN-REDUCE-STRUCTURE-WITH-CONTEXT
                                                                                  #'|ExtParsedEnt-Constructor|
                                                                                  *CONSTRUCTION-CONTEXT* |Content| |TextDecl|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|ExtParsedEnt|
                                                                                           (DELETE NIL
                                                                                                   (LIST |Content| |TextDecl|)))
                                                                                     '|ExtParsedEnt|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|ExtParsedEnt|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|ExtParsedEnt.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtParsedEnt.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |Content|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Content|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Content| (CONS ATN-PARSER::RESULT |Content|)))
                                                                        (|ExtParsedEnt.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Content|)
                                                                        (|ExtParsedEnt.2| ATN-PARSER::INDEX)))))))
                                (|ExtParsedEnt/ExtParsedEnt.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtParsedEnt/ExtParsedEnt.2.4|
                                                   (%ATN-EDGE-BLOCK (PUSH |Content|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Content|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |Content| (CONS ATN-PARSER::RESULT |Content|)))
                                                                        (|ExtParsedEnt.5| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Content|)
                                                                        (|ExtParsedEnt.2| ATN-PARSER::INDEX)))))))
                                (|ExtParsedEnt/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtParsedEnt/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|ExtParsedEnt/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |ExtParsedEnt/start.1|
                                                   (%ATN-EDGE-BLOCK (PUSH |TextDecl|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|TextDecl|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |TextDecl| ATN-PARSER::RESULT))
                                                                        (|ExtParsedEnt/ExtParsedEnt.2.4| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|TextDecl|)
                                                                        (|ExtParsedEnt/ExtParsedEnt.2.4| ATN-PARSER::INDEX))))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |ExtParsedEnt.2| |ExtParsedEnt.5|
                           |ExtParsedEnt/ExtParsedEnt.2.4| |ExtParsedEnt/fail.3| |ExtParsedEnt/start.1|))
                         (|ExtParsedEnt/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|ExtParsedEnt| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|ExtParsedEnt| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |EncodingDecl-INDEX|)
 (DEFUN |EncodingDecl| (ATN-PARSER::INDEX &AUX (|EncNameCharData| NIL))
   "{80} EncodingDecl ::= S+ encoding Eq ((('\"' EncNameCharData '\"') | ('''
                                                                    EncNameCharData
                                                                    ''')))
(|EncNameCharData|)"
   (DECLARE (SPECIAL |EncodingDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |EncodingDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |EncodingDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|EncodingDecl-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|EncodingDecl| *ATN-STACK))
             (*PARSETABLE* |EncodingDecl-Parsetable|))
         (DECLARE (SPECIAL |EncodingDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |EncodingDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|EncodingDecl|)
                                  (RETURN-FROM |EncodingDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |EncodingDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|EncodingDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |EncodingDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|EncodingDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|EncodingDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|EncNameCharData| |EncNameCharData|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|EncodingDecl-Constructor|
                                                                                                       |EncNameCharData|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|EncodingDecl|
                                                                                           (DELETE NIL (LIST |EncNameCharData|)))
                                                                                     '|EncodingDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|EncodingDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|EncodingDecl.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EncodingDecl.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EncodingDecl/EncodingDecl.2.4| ATN-PARSER::INDEX))))))
                                (|EncodingDecl/EncodingDecl.2.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.10|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|EncodingDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|EncodingDecl/EncodingDecl.2.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.11|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|EncodingDecl/EncodingDecl.2.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|EncodingDecl/EncodingDecl.2.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |EncNameCharData|)
                                                                    (COND
                                                                     ((|IS-EncNameCharData| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|EncNameCharData|)
                                                                      (SETF |EncNameCharData|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|EncNameCharData-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|EncNameCharData| ATN-PARSER::|item|)
                                                                                      '|EncNameCharData|)))
                                                                      (|EncodingDecl/EncodingDecl.2.13| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|EncNameCharData|) NIL)))))
                                (|EncodingDecl/EncodingDecl.2.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.13|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|'|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|'|)
                                                                      (SETF *ATN-TERM* '|xml|:|'|)
                                                                      (|EncodingDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|'|) NIL)))))
                                (|EncodingDecl/EncodingDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |encoding|)
                                                                    (COND
                                                                     ((|IS-encodingToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|encoding|)
                                                                      (|EncodingDecl/EncodingDecl.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|encoding|)
                                                                      (|EncodingDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|EncodingDecl/EncodingDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (PUSH |Eq|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|Eq|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (SETF ATN-PARSER::RESULT ATN-PARSER::RESULT)
                                                                        (|EncodingDecl/EncodingDecl.2.6| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|Eq|)
                                                                        (|EncodingDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|EncodingDecl/EncodingDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.6|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |EncodingDecl/EncodingDecl.2.8|)
                                                                      (|EncodingDecl/EncodingDecl.2.8| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK
                                                                      (ATN-PARSER::JUMP |EncodingDecl/EncodingDecl.2.11|)
                                                                      (|EncodingDecl/EncodingDecl.2.11| ATN-PARSER::INDEX))
                                                                     (|EncodingDecl/fail.3| ATN-PARSER::INDEX)))))
                                (|EncodingDecl/EncodingDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:|"|)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:|"|)
                                                                      (SETF *ATN-TERM* '|xml|:|"|)
                                                                      (|EncodingDecl/EncodingDecl.2.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:|"|) NIL)))))
                                (|EncodingDecl/EncodingDecl.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/EncodingDecl.2.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |EncNameCharData|)
                                                                    (COND
                                                                     ((|IS-EncNameCharData| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* '|EncNameCharData|)
                                                                      (SETF |EncNameCharData|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|EncNameCharData-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|EncNameCharData| ATN-PARSER::|item|)
                                                                                      '|EncNameCharData|)))
                                                                      (|EncodingDecl/EncodingDecl.2.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|EncNameCharData|) NIL)))))
                                (|EncodingDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|EncodingDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |EncodingDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|EncodingDecl.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|EncodingDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |EncodingDecl.2| |EncodingDecl.7|
                           |EncodingDecl/EncodingDecl.2.10| |EncodingDecl/EncodingDecl.2.11| |EncodingDecl/EncodingDecl.2.12|
                           |EncodingDecl/EncodingDecl.2.13| |EncodingDecl/EncodingDecl.2.4| |EncodingDecl/EncodingDecl.2.5|
                           |EncodingDecl/EncodingDecl.2.6| |EncodingDecl/EncodingDecl.2.8| |EncodingDecl/EncodingDecl.2.9|
                           |EncodingDecl/fail.3| |EncodingDecl/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|EncodingDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|EncodingDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|EncodingDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |NotationDecl-INDEX|)
 (DEFUN |NotationDecl| (ATN-PARSER::INDEX &AUX (|NCName| NIL) (|PublicID| NIL))
   "{82} NotationDecl ::= '<!NOTATION' S+ NCName S+ PublicID S* '>'
(|NCName| |PublicID|)"
   (DECLARE (SPECIAL |NotationDecl-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |NotationDecl-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |NotationDecl-INDEX| ATN-PARSER::INDEX)
       (LET ((|NotationDecl-INDEX| ATN-PARSER::INDEX) (*ATN-LEVEL (1+ *ATN-LEVEL)) (*ATN-STACK (CONS '|NotationDecl| *ATN-STACK)))
         (DECLARE (SPECIAL |NotationDecl-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |NotationDecl|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|NotationDecl|)
                                  (RETURN-FROM |NotationDecl| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |NotationDecl| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|NotationDecl.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl.10|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationDecl/NotationDecl.2.5| ATN-PARSER::INDEX))))))
                                (|NotationDecl.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl.11|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationDecl.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationDecl/NotationDecl.2.7| ATN-PARSER::INDEX))))))
                                (|NotationDecl.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationDecl.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationDecl/NotationDecl.2.9| ATN-PARSER::INDEX))))))
                                (|NotationDecl.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl.2|
                                                   (%ATN-EDGE-BLOCK (POP |NotationDecl|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|NotationDecl|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a"
                                                                                  '|NotationDecl| ATN-PARSER::INDEX
                                                                                  (LIST '|NCName| |NCName| '|PublicID| |PublicID|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|NotationDecl-Constructor|
                                                                                                       |NCName| |PublicID|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|NotationDecl|
                                                                                           (DELETE NIL (LIST |NCName| |PublicID|)))
                                                                                     '|NotationDecl|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|NotationDecl|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|NotationDecl/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|NotationDecl/NotationDecl.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/NotationDecl.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationDecl.10| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationDecl/NotationDecl.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/NotationDecl.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST |NCName|)
                                                                    (COND
                                                                     ((|IS-NCName| ATN-PARSER::|item|) (SETF *ATN-TERM* '|NCName|)
                                                                      (SETF |NCName|
                                                                              (IF (EQ *ATN-REDUCE* T)
                                                                                  (ATN-REDUCE-ITEM #'|NCName-Constructor|
                                                                                                   ATN-PARSER::|item|)
                                                                                  (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                      (LIST '|NCName| ATN-PARSER::|item|)
                                                                                      '|NCName|)))
                                                                      (|NotationDecl/NotationDecl.2.6| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|NCName|)
                                                                      (|NotationDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationDecl/NotationDecl.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/NotationDecl.2.6|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationDecl.11| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationDecl/NotationDecl.2.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/NotationDecl.2.7|
                                                   (%ATN-EDGE-BLOCK (PUSH |PublicID|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|PublicID|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |PublicID| ATN-PARSER::RESULT))
                                                                        (|NotationDecl/NotationDecl.2.8| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|PublicID|)
                                                                        (|NotationDecl/fail.3| ATN-PARSER::INDEX)))))))
                                (|NotationDecl/NotationDecl.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/NotationDecl.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|NotationDecl.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|NotationDecl/NotationDecl.2.9| ATN-PARSER::INDEX))))))
                                (|NotationDecl/NotationDecl.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/NotationDecl.2.9|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:>)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:>) (SETF *ATN-TERM* '|xml|:>)
                                                                      (|NotationDecl.2| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:>)
                                                                      (|NotationDecl/fail.3| ATN-PARSER::INDEX))))))
                                (|NotationDecl/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |NotationDecl/start.1|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::WORD |xml|:<!NOTATION)
                                                                    (COND
                                                                     ((EQ ATN-PARSER::|item| '|xml|:<!NOTATION)
                                                                      (SETF *ATN-TERM* '|xml|:<!NOTATION)
                                                                      (|NotationDecl/NotationDecl.2.4| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* '|xml|:<!NOTATION)
                                                                      (|NotationDecl/fail.3| ATN-PARSER::INDEX)))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |NotationDecl.10| |NotationDecl.11| |NotationDecl.12|
                           |NotationDecl.2| |NotationDecl/fail.3| |NotationDecl/NotationDecl.2.4| |NotationDecl/NotationDecl.2.5|
                           |NotationDecl/NotationDecl.2.6| |NotationDecl/NotationDecl.2.7| |NotationDecl/NotationDecl.2.8|
                           |NotationDecl/NotationDecl.2.9| |NotationDecl/start.1|))
                         (|NotationDecl/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|NotationDecl| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|NotationDecl| ATN-PARSER::INDEX *ATN-STACK))))
(PROGN
 (DEFVAR |PublicID-INDEX|)
 (DEFUN |PublicID| (ATN-PARSER::INDEX &AUX (|PubidLiteral| NIL) (|SystemLiteral| NIL))
   "{83} PublicID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC S+ PubidLiteral
                                                (S+ SystemLiteral)?))
(|PubidLiteral| |SystemLiteral|)"
   (DECLARE (SPECIAL |PublicID-INDEX|))
   (DECLARE (TYPE FIXNUM ATN-PARSER::INDEX |PublicID-INDEX| *ATN-LEVEL))
   (DECLARE (OPTIMIZE (SPEED 1) (SAFETY 3)))
   (IF (< |PublicID-INDEX| ATN-PARSER::INDEX)
       (LET ((|PublicID-INDEX| ATN-PARSER::INDEX)
             (*ATN-LEVEL (1+ *ATN-LEVEL))
             (*ATN-STACK (CONS '|PublicID| *ATN-STACK))
             (*PARSETABLE* |PublicID-Parsetable|))
         (DECLARE (SPECIAL |PublicID-INDEX|))
         (DECLARE (DYNAMIC-EXTENT *ATN-STACK))
         (DECLARE (TYPE CONS *ATN-STACK))
         (SYMBOL-MACROLET ((ATN-PARSER::|item| (INPUT-REFERENCE ATN-PARSER::INDEX)))
           (%ATN-BLOCK |PublicID|
                       (LABELS ((ATN-PARSER::SUCCEED (ATN-PARSER::INDEX ATN-PARSER::RESULT)
                                  (SETF *ATN-TERM* '|PublicID|)
                                  (RETURN-FROM |PublicID| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX T)))
                                (ATN-PARSER::FAIL (ATN-PARSER::INDEX)
                                  (RETURN-FROM |PublicID| (VALUES NIL ATN-PARSER::INDEX NIL)))
                                (|PublicID.12| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID.12|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PublicID.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PublicID/PublicID.2.10| ATN-PARSER::INDEX))))))
                                (|PublicID.15| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID.15|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PublicID.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PublicID/PublicID.2.14| ATN-PARSER::INDEX))))))
                                (|PublicID.2| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID.2|
                                                   (%ATN-EDGE-BLOCK (POP |PublicID|)
                                                                    (WHEN T
                                                                      (SETF *ATN-TERM* '|PublicID|)
                                                                      (%ATN-TRACE " [***/~a @ ~s reduce structure: ~a" '|PublicID|
                                                                                  ATN-PARSER::INDEX
                                                                                  (LIST '|PubidLiteral| |PubidLiteral|
                                                                                        '|SystemLiteral| |SystemLiteral|))
                                                                      (LET ((ATN-PARSER::RESULT-STRUCTURE
                                                                             (IF (EQ *ATN-REDUCE* T)
                                                                                 (ATN-REDUCE-STRUCTURE #'|PublicID-Constructor|
                                                                                                       |PubidLiteral|
                                                                                                       |SystemLiteral|)
                                                                                 (IF (EQ *ATN-REDUCE* 'CONS)
                                                                                     (CONS '|PublicID|
                                                                                           (DELETE NIL
                                                                                                   (LIST |PubidLiteral|
                                                                                                         |SystemLiteral|)))
                                                                                     '|PublicID|))))
                                                                        (WHEN (IS-ATN-TRACE)
                                                                          (FORMAT *TRACE-OUTPUT* " -> ~a: ~s" '|PublicID|
                                                                                  ATN-PARSER::RESULT-STRUCTURE))
                                                                        (ATN-PARSER::SUCCEED ATN-PARSER::INDEX
                                                                         ATN-PARSER::RESULT-STRUCTURE))))))
                                (|PublicID.7| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID.7|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PublicID.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S)
                                                                      (|PublicID/PublicID.2.6| ATN-PARSER::INDEX))))))
                                (|PublicID/fail.3| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/fail.3| (PROGN (ATN-PARSER::FAIL ATN-PARSER::INDEX))))
                                (|PublicID/PublicID.2.10| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.10|
                                                   (%ATN-EDGE-BLOCK (PUSH |PubidLiteral|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|PubidLiteral|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |PubidLiteral| ATN-PARSER::RESULT))
                                                                        (|PublicID/PublicID.2.11| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|PubidLiteral|) NIL))))))
                                (|PublicID/PublicID.2.11| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.11|
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |PublicID/PublicID.2.13|)
                                                                    (|PublicID/PublicID.2.13| ATN-PARSER::INDEX))
                                                   (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |PublicID.2|)
                                                                    (|PublicID.2| ATN-PARSER::INDEX))))
                                (|PublicID/PublicID.2.13| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.13|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PublicID.15| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|PublicID/PublicID.2.14| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.14|
                                                   (%ATN-EDGE-BLOCK (PUSH |SystemLiteral|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|SystemLiteral|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |SystemLiteral| ATN-PARSER::RESULT))
                                                                        (|PublicID.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|SystemLiteral|) NIL))))))
                                (|PublicID/PublicID.2.4| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.4|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST SYSTEM)
                                                                    (COND
                                                                     ((|IS-SYSTEMToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'SYSTEM)
                                                                      (|PublicID/PublicID.2.5| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'SYSTEM) NIL)))))
                                (|PublicID/PublicID.2.5| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.5|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PublicID.7| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|PublicID/PublicID.2.6| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.6|
                                                   (%ATN-EDGE-BLOCK (PUSH |SystemLiteral|)
                                                                    (MULTIPLE-VALUE-BIND
                                                                        (ATN-PARSER::RESULT ATN-PARSER::RESULT-INDEX
                                                                         ATN-PARSER::SUCCESS)
                                                                        (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE '|SystemLiteral|
                                                                                                            ATN-PARSER::INDEX)
                                                                      (COND
                                                                       (ATN-PARSER::SUCCESS
                                                                        (WHEN ATN-PARSER::RESULT
                                                                          (SETF |SystemLiteral| ATN-PARSER::RESULT))
                                                                        (|PublicID.2| ATN-PARSER::RESULT-INDEX))
                                                                       (T (SETF *ATN-TERM?* '|SystemLiteral|) NIL))))))
                                (|PublicID/PublicID.2.8| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.8|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST PUBLIC)
                                                                    (COND
                                                                     ((|IS-PUBLICToken| ATN-PARSER::|item|)
                                                                      (SETF *ATN-TERM* 'PUBLIC)
                                                                      (|PublicID/PublicID.2.9| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'PUBLIC) NIL)))))
                                (|PublicID/PublicID.2.9| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/PublicID.2.9|
                                                   (%ATN-EDGE-BLOCK (DE.SETF.UTILITY.IMPLEMENTATION::TEST S)
                                                                    (COND
                                                                     ((IS-S ATN-PARSER::|item|) (SETF *ATN-TERM* 'S)
                                                                      (|PublicID.12| (1+ ATN-PARSER::INDEX)))
                                                                     (T (SETF *ATN-TERM?* 'S) NIL)))))
                                (|PublicID/start.1| (ATN-PARSER::INDEX)
                                  (%ATN-NODE-BLOCK |PublicID/start.1|
                                                   (%ATN-EDGE-BLOCK OR
                                                                    (OR
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |PublicID/PublicID.2.4|)
                                                                                      (|PublicID/PublicID.2.4| ATN-PARSER::INDEX))
                                                                     (%ATN-EDGE-BLOCK (ATN-PARSER::JUMP |PublicID/PublicID.2.8|)
                                                                                      (|PublicID/PublicID.2.8| ATN-PARSER::INDEX))
                                                                     (|PublicID/fail.3| ATN-PARSER::INDEX))))))
                         (DECLARE
                          (INLINE ATN-PARSER::SUCCEED ATN-PARSER::FAIL |PublicID.12| |PublicID.15| |PublicID.2| |PublicID.7|
                           |PublicID/fail.3| |PublicID/PublicID.2.10| |PublicID/PublicID.2.11| |PublicID/PublicID.2.13|
                           |PublicID/PublicID.2.14| |PublicID/PublicID.2.4| |PublicID/PublicID.2.5| |PublicID/PublicID.2.6|
                           |PublicID/PublicID.2.8| |PublicID/PublicID.2.9| |PublicID/start.1|))
                         (SETF *QUOTE-TOKEN* (OR *QUOTE-TOKEN* T))
                         (|PublicID/start.1| ATN-PARSER::INDEX)
                         (SETF *ATN-NODE NIL)
                         (%ATN-TRACE " [***/~a failed @ ~s." '|PublicID| ATN-PARSER::INDEX)
                         (ATN-PARSER::FAIL ATN-PARSER::INDEX)))))
       (WARN "recursive grammar: ~s @ position ~s: ~s" '|PublicID| ATN-PARSER::INDEX *ATN-STACK))))
(SETF (GET '|Document| :PRODUCTION) "
{1 } Document ::= Prolog Root MiscSequence?")
(SETF (GET '|Root| :PRODUCTION) "
     Root ::= Element")
(SETF (GET '|Names| :PRODUCTION) "
{6 } Names ::= NCName (S Names)?")
(SETF (GET '|Nmtokens| :PRODUCTION) "
{8 } Nmtokens ::= Nmtoken (S Nmtokens)?")
(SETF (GET '|EntityValue| :PRODUCTION) "
{9 } EntityValue ::= (('\"' EntityData? '\"') | (''' EntityData? '''))")
(SETF (GET '|AttValue| :PRODUCTION) "
{10} AttValue ::= (('\"' AttChildSequence? '\"') | (''' AttChildSequence? '''))")
(SETF (GET '|AttChildSequence| :PRODUCTION) "
     AttChildSequence ::= AttChild AttChildSequence?")
(SETF (GET '|AttChild| :PRODUCTION) "
     AttChild ::= (AttCharData | Reference | ParsedReference)")
(SETF (GET '|DefaultAttValue| :PRODUCTION) "
     DefaultAttValue ::= (('\"' DefaultAttChildSequence? '\"') | ('''
                                                                DefaultAttChildSequence?
                                                                '''))")
(SETF (GET '|DefaultAttChildSequence| :PRODUCTION) "
     DefaultAttChildSequence ::= DefaultAttChild DefaultAttChildSequence?")
(SETF (GET '|DefaultAttChild| :PRODUCTION) "
     DefaultAttChild ::= (DefaultAttCharData | Reference | ParsedReference)")
(SETF (GET '|SystemLiteral| :PRODUCTION) "
{11} SystemLiteral ::= (('\"' SystemCharData? '\"') | (''' SystemCharData? '''))")
(SETF (GET '|PubidLiteral| :PRODUCTION) "
{12} PubidLiteral ::= (('\"' PubidCharData? '\"') | (''' PubidCharData? '''))")
(SETF (GET '|Comment| :PRODUCTION) "
{15} Comment ::= '<!--' CommentCharData? '-->'")
(SETF (GET '|Pi| :PRODUCTION) "
{16} Pi ::= '<?' PiTarget (S PiCharData?)? '?>'")
(SETF (GET '|CDSect| :PRODUCTION) "
{18} CDSect ::= CDStart CDataCharData? CDEnd")
(SETF (GET '|Prolog| :PRODUCTION) "
{22} Prolog ::= XMLDecl? MiscSequence? DoctypeProlog?")
(SETF (GET '|DoctypeProlog| :PRODUCTION) "
     DoctypeProlog ::= DoctypeDecl MiscSequence?")
(SETF (GET '|XMLDecl| :PRODUCTION) "
{23} XMLDecl ::= '<?xml' VersionInfo EncodingDecl? SDDecl? S* '?>'")
(SETF (GET '|VersionInfo| :PRODUCTION) "
{24} VersionInfo ::= S+ version Eq ((('\"' VersionNumCharData '\"') | ('''
                                                                     VersionNumCharData
                                                                     ''')))")
(SETF (GET '|Eq| :PRODUCTION) "
{25} Eq ::= S* '=' S*")
(SETF (GET '|MiscSequence| :PRODUCTION) "
     MiscSequence ::= Misc MiscSequence?")
(SETF (GET '|Misc| :PRODUCTION) "
{27} Misc ::= (Comment | Pi | S+)")
(SETF (GET '|DoctypeDecl| :PRODUCTION) "
{28} DoctypeDecl ::= '<!DOCTYPE' S+ QName (S ExternalID)? S* ('['
                                                              IntSubsetDecl*
                                                              ']' S*)? '>'")
(SETF (GET '|IntSubsetDecl| :PRODUCTION) "
     IntSubsetDecl ::= (DeclSep | MarkupDecl)")
(SETF (GET '|DeclSep| :PRODUCTION) "
{28a} DeclSep ::= (S+ | PEReference | ParsedExtSubset)")
(SETF (GET '|MarkupDecl| :PRODUCTION) "
{29} MarkupDecl ::= (ElementDecl | AttlistDecl | EntityDecl | NotationDecl | Pi | Comment)")
(SETF (GET '|ExtSubset| :PRODUCTION) "
{30} ExtSubset ::= TextDecl? ExtSubsetDecl*")
(SETF (GET '|ExtSubsetDecl| :PRODUCTION) "
{31} ExtSubsetDecl ::= (MarkupDecl | ConditionalSect | DeclSep)")
(SETF (GET '|SDDecl| :PRODUCTION) "
{32} SDDecl ::= S+ standalone Eq ((('\"' YesOrNo '\"') | (''' YesOrNo ''')))")
(SETF (GET '|Element| :PRODUCTION) "
{39} Element ::= STag (('/>' | ('>' Content* ETag)))")
(SETF (GET '|STag| :PRODUCTION) "
{40} STag ::= '<' QName AttributeSequence? S*")
(SETF (GET '|AttributeSequence| :PRODUCTION) "
     AttributeSequence ::= Attribute AttributeSequence?")
(SETF (GET '|Attribute| :PRODUCTION) "
{41} Attribute ::= S+ QName Eq AttValue")
(SETF (GET '|ETag| :PRODUCTION) "
{42} ETag ::= '</' QName S* '>'")
(SETF (GET '|Content| :PRODUCTION) "
{43} Content ::= (CharData | Element | Comment | Pi | CDSect | Reference | ParsedReference)")
(SETF (GET '|ElementDecl| :PRODUCTION) "
{45} ElementDecl ::= '<!ELEMENT' S+ QName S+ ContentSpec S* '>'")
(SETF (GET '|ContentSpec| :PRODUCTION) "
{46} ContentSpec ::= (EMPTY | ANY | Mixed | Children)")
(SETF (GET '|Children| :PRODUCTION) "
{47} Children ::= ChoiceOrSeq Cardinality?")
(SETF (GET '|Cp| :PRODUCTION) "
{48} Cp ::= ((QName | ChoiceOrSeq)) Cardinality?")
(SETF (GET '|ChoiceOrSeq| :PRODUCTION) "
     ChoiceOrSeq ::= '(' S* Cp ((Choice | Seq))? S* ')'")
(SETF (GET '|Choice| :PRODUCTION) "
{49} Choice ::= (S* '|' S* Cp)+")
(SETF (GET '|Seq| :PRODUCTION) "
{50} Seq ::= (S* ',' S* Cp)+")
(SETF (GET '|Mixed| :PRODUCTION) "
{51} Mixed ::= (('(' S* PCDATA (S* '|' S* QName)* S* ')' MixedCardinality) | ('('
                                                                              S*
                                                                              PCDATA
                                                                              S*
                                                                              ')'))")
(SETF (GET '|AttlistDecl| :PRODUCTION) "
{52} AttlistDecl ::= '<!ATTLIST' S+ QName AttDefSequence? S* '>'")
(SETF (GET '|AttDefSequence| :PRODUCTION) "
     AttDefSequence ::= AttDef AttDefSequence?")
(SETF (GET '|AttDef| :PRODUCTION) "
{53} AttDef ::= S+ QName S+ AttType S+ DefaultDecl")
(SETF (GET '|AttType| :PRODUCTION) "
{54} AttType ::= (StringType | TokenizedType | EnumeratedType)")
(SETF (GET '|EnumeratedType| :PRODUCTION) "
{57} EnumeratedType ::= (NotationType | Enumeration)")
(SETF (GET '|NotationType| :PRODUCTION) "
{58} NotationType ::= NOTATION S+ '(' S* NotationTypeSequence S* ')'")
(SETF (GET '|NotationTypeSequence| :PRODUCTION) "
     NotationTypeSequence ::= NCName (S* '|' S* NotationTypeSequence)?")
(SETF (GET '|Enumeration| :PRODUCTION) "
{59} Enumeration ::= '(' EnumerationSequence S* ')'")
(SETF (GET '|EnumerationSequence| :PRODUCTION) "
     EnumerationSequence ::= S* Nmtoken (S* '|' EnumerationSequence)?")
(SETF (GET '|DefaultDecl| :PRODUCTION) "
{60} DefaultDecl ::= (REQUIRED | IMPLIED | ((FIXED S)? DefaultAttValue))")
(SETF (GET '|ConditionalSect| :PRODUCTION) "
{61} ConditionalSect ::= (IncludeSect | IgnoreSect | NamedConditionalSect)")
(SETF (GET '|IncludeSect| :PRODUCTION) "
{62} IncludeSect ::= '<![' S* INCLUDE S* '[' ExtSubsetDecl* ']]>'")
(SETF (GET '|IgnoreSect| :PRODUCTION) "
{63} IgnoreSect ::= '<![' S* IGNORE S* '[' IgnoreSectContents? ']]>'")
(SETF (GET '|IgnoreSectContents| :PRODUCTION) "
{64} IgnoreSectContents ::= Ignore IgnoreSectContents?")
(SETF (GET '|Ignore| :PRODUCTION) "
{65} Ignore ::= (IgnoreCData | ('<![' IgnoreSectContents? ']]>'))")
(SETF (GET '|NamedConditionalSect| :PRODUCTION) "
     NamedConditionalSect ::= '<![' S* PEReference S* '[' ExtSubsetDecl* ']]>'")
(SETF (GET '|CharRef| :PRODUCTION) "
{66} CharRef ::= (('&#' Number ';') | ('&#x' HexNumber ';'))")
(SETF (GET '|Reference| :PRODUCTION) "
{67} Reference ::= (EntityRef | CharRef)")
(SETF (GET '|EntityRef| :PRODUCTION) "
{68} EntityRef ::= '&' NCName ';'")
(SETF (GET '|PEReference| :PRODUCTION) "
{69} PEReference ::= '%' NCName ';'")
(SETF (GET '|EntityDecl| :PRODUCTION) "
{70} EntityDecl ::= '<!ENTITY' S+ ((GEDecl | PEDecl))")
(SETF (GET '|GEDecl| :PRODUCTION) "
{71} GEDecl ::= NCName S+ EntityDef S* '>'")
(SETF (GET '|PEDecl| :PRODUCTION) "
{72} PEDecl ::= '%' S+ NCName S+ PEDef S* '>'")
(SETF (GET '|EntityDef| :PRODUCTION) "
{73} EntityDef ::= (EntityValue | (ExternalID NDataDecl?))")
(SETF (GET '|PEDef| :PRODUCTION) "
{74} PEDef ::= (EntityValue | ExternalID)")
(SETF (GET '|ExternalID| :PRODUCTION) "
{75} ExternalID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC S+ PubidLiteral S+
                                                  SystemLiteral))")
(SETF (GET '|NDataDecl| :PRODUCTION) "
{76} NDataDecl ::= S+ NDATA S+ NCName")
(SETF (GET '|TextDecl| :PRODUCTION) "
{77} TextDecl ::= '<?xml' VersionInfo? EncodingDecl S* '?>'")
(SETF (GET '|ExtParsedEnt| :PRODUCTION) "
{78} ExtParsedEnt ::= TextDecl? Content*")
(SETF (GET '|EncodingDecl| :PRODUCTION) "
{80} EncodingDecl ::= S+ encoding Eq ((('\"' EncNameCharData '\"') | ('''
                                                                    EncNameCharData
                                                                    ''')))")
(SETF (GET '|NotationDecl| :PRODUCTION) "
{82} NotationDecl ::= '<!NOTATION' S+ NCName S+ PublicID S* '>'")
(SETF (GET '|PublicID| :PRODUCTION) "
{83} PublicID ::= ((SYSTEM S+ SystemLiteral) | (PUBLIC S+ PubidLiteral
                                                (S+ SystemLiteral)?))")
(DEFUN |Document-Parser|
       (ATN-PARSER::*ATN-INPUT
        &KEY ((:TRACE *ATN-TRACE*) *ATN-TRACE*) ((:TRACE-NETS *ATN-TRACE-NETS*) *ATN-TRACE-NETS*)
        ((:START-NAME ATN-PARSER::*ATN-START-NAME) '|Document|) ((:MODE ATN-PARSER::*ATN-MODE) :MULTIPLE)
        ((:REDUCE *ATN-REDUCE*) T) ((:REGISTER-WORDS *ATN-REGISTER-WORDS) NIL) &ALLOW-OTHER-KEYS
        &AUX)
  "// generated 2014.12.29T03:21:32 based on \"XML:BNF;XML-GRAMMAR.BNF\" from 2006.08.09T21:18:05.
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
  (DECLARE (SPECIAL *ATN-REDUCE* ATN-PARSER::*ATN-MODE ATN-PARSER::*ATN-INPUT))
  (LET ((*ATN-LEVEL 0)
        (*ATN-STACK '(|Document-Parser|))
        (*ATN-NODE NIL)
        (*ATN-PROPERTIES NIL)
        (*ATN-CLASS NIL)
        (|Document-INDEX| -1)
        (|Root-INDEX| -1)
        (|Names-INDEX| -1)
        (|Nmtokens-INDEX| -1)
        (|EntityValue-INDEX| -1)
        (|AttValue-INDEX| -1)
        (|AttChildSequence-INDEX| -1)
        (|AttChild-INDEX| -1)
        (|DefaultAttValue-INDEX| -1)
        (|DefaultAttChildSequence-INDEX| -1)
        (|DefaultAttChild-INDEX| -1)
        (|SystemLiteral-INDEX| -1)
        (|PubidLiteral-INDEX| -1)
        (|Comment-INDEX| -1)
        (|Pi-INDEX| -1)
        (|CDSect-INDEX| -1)
        (|Prolog-INDEX| -1)
        (|DoctypeProlog-INDEX| -1)
        (|XMLDecl-INDEX| -1)
        (|VersionInfo-INDEX| -1)
        (|Eq-INDEX| -1)
        (|MiscSequence-INDEX| -1)
        (|Misc-INDEX| -1)
        (|DoctypeDecl-INDEX| -1)
        (|IntSubsetDecl-INDEX| -1)
        (|DeclSep-INDEX| -1)
        (|MarkupDecl-INDEX| -1)
        (|ExtSubset-INDEX| -1)
        (|ExtSubsetDecl-INDEX| -1)
        (|SDDecl-INDEX| -1)
        (|Element-INDEX| -1)
        (|STag-INDEX| -1)
        (|AttributeSequence-INDEX| -1)
        (|Attribute-INDEX| -1)
        (|ETag-INDEX| -1)
        (|Content-INDEX| -1)
        (|ElementDecl-INDEX| -1)
        (|ContentSpec-INDEX| -1)
        (|Children-INDEX| -1)
        (|Cp-INDEX| -1)
        (|ChoiceOrSeq-INDEX| -1)
        (|Choice-INDEX| -1)
        (|Seq-INDEX| -1)
        (|Mixed-INDEX| -1)
        (|AttlistDecl-INDEX| -1)
        (|AttDefSequence-INDEX| -1)
        (|AttDef-INDEX| -1)
        (|AttType-INDEX| -1)
        (|EnumeratedType-INDEX| -1)
        (|NotationType-INDEX| -1)
        (|NotationTypeSequence-INDEX| -1)
        (|Enumeration-INDEX| -1)
        (|EnumerationSequence-INDEX| -1)
        (|DefaultDecl-INDEX| -1)
        (|ConditionalSect-INDEX| -1)
        (|IncludeSect-INDEX| -1)
        (|IgnoreSect-INDEX| -1)
        (|IgnoreSectContents-INDEX| -1)
        (|Ignore-INDEX| -1)
        (|NamedConditionalSect-INDEX| -1)
        (|CharRef-INDEX| -1)
        (|Reference-INDEX| -1)
        (|EntityRef-INDEX| -1)
        (|PEReference-INDEX| -1)
        (|EntityDecl-INDEX| -1)
        (|GEDecl-INDEX| -1)
        (|PEDecl-INDEX| -1)
        (|EntityDef-INDEX| -1)
        (|PEDef-INDEX| -1)
        (|ExternalID-INDEX| -1)
        (|NDataDecl-INDEX| -1)
        (|TextDecl-INDEX| -1)
        (|ExtParsedEnt-INDEX| -1)
        (|EncodingDecl-INDEX| -1)
        (|NotationDecl-INDEX| -1)
        (|PublicID-INDEX| -1)
        (ATN-PARSER::ATN-NET-NAMES
         '(|Document| |Root| |Names| |Nmtokens| |EntityValue| |AttValue| |AttChildSequence| |AttChild| |DefaultAttValue|
           |DefaultAttChildSequence| |DefaultAttChild| |SystemLiteral| |PubidLiteral| |Comment| |Pi| |CDSect| |Prolog|
           |DoctypeProlog| |XMLDecl| |VersionInfo| |Eq| |MiscSequence| |Misc| |DoctypeDecl| |IntSubsetDecl| |DeclSep| |MarkupDecl|
           |ExtSubset| |ExtSubsetDecl| |SDDecl| |Element| |STag| |AttributeSequence| |Attribute| |ETag| |Content| |ElementDecl|
           |ContentSpec| |Children| |Cp| |ChoiceOrSeq| |Choice| |Seq| |Mixed| |AttlistDecl| |AttDefSequence| |AttDef| |AttType|
           |EnumeratedType| |NotationType| |NotationTypeSequence| |Enumeration| |EnumerationSequence| |DefaultDecl|
           |ConditionalSect| |IncludeSect| |IgnoreSect| |IgnoreSectContents| |Ignore| |NamedConditionalSect| |CharRef| |Reference|
           |EntityRef| |PEReference| |EntityDecl| |GEDecl| |PEDecl| |EntityDef| |PEDef| |ExternalID| |NDataDecl| |TextDecl|
           |ExtParsedEnt| |EncodingDecl| |NotationDecl| |PublicID|)))
    (DECLARE
     (SPECIAL |Document-INDEX| |Root-INDEX| |Names-INDEX| |Nmtokens-INDEX| |EntityValue-INDEX| |AttValue-INDEX|
      |AttChildSequence-INDEX| |AttChild-INDEX| |DefaultAttValue-INDEX| |DefaultAttChildSequence-INDEX| |DefaultAttChild-INDEX|
      |SystemLiteral-INDEX| |PubidLiteral-INDEX| |Comment-INDEX| |Pi-INDEX| |CDSect-INDEX| |Prolog-INDEX| |DoctypeProlog-INDEX|
      |XMLDecl-INDEX| |VersionInfo-INDEX| |Eq-INDEX| |MiscSequence-INDEX| |Misc-INDEX| |DoctypeDecl-INDEX| |IntSubsetDecl-INDEX|
      |DeclSep-INDEX| |MarkupDecl-INDEX| |ExtSubset-INDEX| |ExtSubsetDecl-INDEX| |SDDecl-INDEX| |Element-INDEX| |STag-INDEX|
      |AttributeSequence-INDEX| |Attribute-INDEX| |ETag-INDEX| |Content-INDEX| |ElementDecl-INDEX| |ContentSpec-INDEX|
      |Children-INDEX| |Cp-INDEX| |ChoiceOrSeq-INDEX| |Choice-INDEX| |Seq-INDEX| |Mixed-INDEX| |AttlistDecl-INDEX|
      |AttDefSequence-INDEX| |AttDef-INDEX| |AttType-INDEX| |EnumeratedType-INDEX| |NotationType-INDEX|
      |NotationTypeSequence-INDEX| |Enumeration-INDEX| |EnumerationSequence-INDEX| |DefaultDecl-INDEX| |ConditionalSect-INDEX|
      |IncludeSect-INDEX| |IgnoreSect-INDEX| |IgnoreSectContents-INDEX| |Ignore-INDEX| |NamedConditionalSect-INDEX| |CharRef-INDEX|
      |Reference-INDEX| |EntityRef-INDEX| |PEReference-INDEX| |EntityDecl-INDEX| |GEDecl-INDEX| |PEDecl-INDEX| |EntityDef-INDEX|
      |PEDef-INDEX| |ExternalID-INDEX| |NDataDecl-INDEX| |TextDecl-INDEX| |ExtParsedEnt-INDEX| |EncodingDecl-INDEX|
      |NotationDecl-INDEX| |PublicID-INDEX|))
    (UNLESS (FIND ATN-PARSER::*ATN-START-NAME ATN-PARSER::ATN-NET-NAMES)
      (ERROR "production not defined in system: ~s: ~s." ATN-PARSER::*ATN-START-NAME '|Document-Parser|))
    (UNLESS (FBOUNDP ATN-PARSER::*ATN-START-NAME)
      (ERROR "parse function missing: ~s: ~s." ATN-PARSER::*ATN-START-NAME '|Document-Parser|))
    (HANDLER-BIND ((CONTINUABLE-PARSER-ERROR #'(LAMBDA (CONDITION) (SIGNAL CONDITION)))
                   (TERMINAL-PARSER-ERROR
                    #'(LAMBDA (CONDITION &AUX (ATN-PARSER::ACTION (CONDITION-ACTION CONDITION)))
                        (ETYPECASE ATN-PARSER::ACTION
                          (NULL)
                          (KEYWORD
                           (ECASE ATN-PARSER::ACTION
                             (:ABORT
                              (WHEN *ATN-TRACE*
                                (WARN "terminating parse on condition: ~a: Context ~s." CONDITION ATN-PARSER::*ATN-INPUT))
                              (RETURN-FROM |Document-Parser| (VALUES NIL CONDITION NIL)))
                             (:CONTINUE
                              (WHEN *ATN-TRACE*
                                (WARN "continuing parse with condition: ~a: Context ~s." CONDITION ATN-PARSER::*ATN-INPUT))
                              (CONTINUE CONDITION))
                             (:SIGNAL
                              (WHEN *ATN-TRACE*
                                (WARN "signaling parse condition: ~a: Context ~s." CONDITION ATN-PARSER::*ATN-INPUT))
                              (SIGNAL CONDITION)
                              (WHEN *ATN-TRACE*
                                (WARN "continuing parse with condition: ~a: Context ~s." CONDITION ATN-PARSER::*ATN-INPUT))
                              (CONTINUE CONDITION))))
                          (FUNCTION (FUNCALL ATN-PARSER::ACTION)))))
                   (ERROR #'(LAMBDA (CONDITION) (WHEN *ATN-TRACE* (WARN "parse raised condition: ~a." CONDITION)) NIL)))
      (MULTIPLE-VALUE-BIND (ATN-PARSER::RESULT ATN-PARSER::INDEX ATN-PARSER::SUCCESS)
          (ATN-PARSER::ATN-PARSE-SUBSTRUCTURE ATN-PARSER::*ATN-START-NAME 0)
        (COND
         (ATN-PARSER::SUCCESS
          (RETURN-FROM |Document-Parser| (VALUES ATN-PARSER::RESULT ATN-PARSER::INDEX (INPUT-EOF? ATN-PARSER::INDEX))))
         (T (RETURN-FROM |Document-Parser| (VALUES NIL ATN-PARSER::INDEX NIL))))))))