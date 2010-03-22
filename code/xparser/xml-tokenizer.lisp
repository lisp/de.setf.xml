;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  the "tokenizer" for XML-encoded document is implemented in terms of a collection of
  context charachter tables, one for each of the lexical contexts which stipulates
  special handling for specific characters.
  
  the table is rebound by the respective parse function to indicate the context. for each
  special character, the table contains a function which transforms the input into the
  appropriate result. possible results are meta symbols and entity references.
  as they perform the lexical transform only, the functions need only replace the input
  datum with the respetive result. 
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010118' AUTHOR='jaa'>initial version</DELTA>
  <DELTA DATE='20010410' AUTHOR='jaa'>modified to work with an input ring-buffer which
   holds character codes and intermediate tokenizing results.</DELTA>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010727'>fixed parsetables for SystemId and ExternalId to recognoze
   parameter entity references</DELTA>
  <DELTA DATE='20010803'> added markup-context-wo-references to DoctypeDecl
   context in order to support direct parse of document definitions</DELTA>
  <DELTA DATE='20010903'>changes for 'fast token hashing'</DELTA>
  <DELTA DATE"'20030320'>conditions consistent with 0.950</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")






;; note that categories do not generate their own net and therefor can't bind their
;; own parsetable. note also, that a token is parsed once only. this won't work if
;; the effective token would change bepending on which bnf path is to be followed...



#|
the direct lexical contexts for quote processing are

 AttValue EncodingDecl EntityValue SystemLiteral PubidLiteral VersionInfo SDDecl

these contexts enable the '-reader. from this selection, the indirect contexts are

 {GEDecl/EntityDef,PEDecl/PEDef}/EntityValue
 {DefaultDecl,Attribute}/AttValue
 ExternalID/SystemLiteral
 {PublicID,ExternalID}/PubidLiteral
 {XMLDecl,TextDecl}/VersionInfo
 XMLDecl/SDDecl
 {XMLDecl,TextDecl}/EncodingDecl

to simplify the binding and catch lexical errors, the outer contexts serve as
quote binding contexts, as reflected in make-parser-bindings.

 Attribute DefaultDecl ExternalID GEDecl PEDecl PublicID TextDecl XMLDecl

while the open and close quote themselves must be recognized in the direct contexts.

|#

(defClass xml-parsetable (parsetable) ())

(defMethod compute-token-reader ((table xml-parsetable) character)
  (let ((token (intern (make-string 1 :initial-element character)
                       *token-package*)))
    #'(lambda ()
        (replace-input token))))

(defMethod compute-parser-macros ((property (eql 'attribute-value)))
  '(( #\< . |character-error| )
    ( #\& . |&-reader| )))

(defMethod compute-parser-macros ((property (eql 'cdata-character-data)))
  '(( #\] . |]-reader| )))

(defMethod compute-parser-macros ((property (eql 'character-data)))
  '(( #\& . |&-reader| )
    ( #\< . |<![CDATA[-reader|)))

(defMethod compute-parser-macros ((property (eql 'comment-char-sequence)))
  '(( #\- . |--reader|)))

(defmethod compute-parser-macros ((property (eql 'conditional-context)))
  (list '( #\] . |]-reader| )
         #\>
         #\[))

(defMethod compute-parser-macros ((property (eql 'decl-tag-content)))
  (list #\=  #\>))

(defMethod compute-parser-macros ((property (eql 'default-attribute-value)))
  '(( #\% . |%-reader| )
    ( #\& . |&-reader| )
    ( #\< . |character-error| )))

(defMethod compute-parser-macros ((property (eql 'element-character-data)))
  '(( #\< . |<![CDATA[-reader| )
    ( #\] . |]-reader| )
    ( #\& . |&-reader| )))

(defMethod compute-parser-macros ((property (eql 'entity-value)))
  '(( #\% . |%-reader| )
    ( #\& . |&-char-reader| )))

(defMethod compute-parser-macros ((property (eql 'expression-context)))
  '(( #\% . |%-reader| )
    #\( #\) #\* #\| #\, #\? #\+ #\>))

(defMethod compute-parser-macros ((property (eql 'ignorable-whitespace)))
  (mapcar #'(lambda (c) (cons c '|ignorable-whitespace-reader|))
          '(#\space #\return #\linefeed #\tab)))

(defMethod compute-parser-macros ((property (eql 'ignore)))
  '(( #\< . |<-ignore-reader| )
    ( #\] . |]-reader| )))

(defMethod compute-parser-macros ((property (eql 'literal-whitespace)))
  nil)

(defMethod compute-parser-macros ((property (eql 'markup-context)))
  '(( #\& . |&-reader| )
    ( #\< . |<![CDATA[-reader| )))

(defMethod compute-parser-macros ((property (eql 'markup-context-wo-references)))
  '(( #\< . |<![CDATA[-reader| )))

(defMethod compute-parser-macros ((property (eql 'markup-decl-context)))
  (list '( #\% . |%-reader| )
         '( #\< . |<-reader| )
         #\]))

(defMethod compute-parser-macros ((property (eql 'maybe-tag-content)))
  '(( #\= . |=-if-in-tag-reader|)
    ( #\/ . |/-if-in-tag-reader|)
    ( #\> . |>-if-in-tag-reader|)
    ( #\& . |&-if-not-in-tag-reader| )
    ( #\< . |<![CDATA[-reader|)
    ( #\] . |]-reader| )))

(defMethod compute-parser-macros ((property (eql 'pe-ref-context)))
  '(( #\% . |%-reader| )))

(defMethod compute-parser-macros ((property (eql 'quote-context)))
  ;; indicates a context where an initial quote is permitted and
  ;; a matching close quote is expected.
  '(( #\' . |quote-reader| )
    ( #\" . |quote-reader| )))

(defMethod compute-parser-macros ((property (eql 'tag-content)))
  '(#\=
    ( #\/ . |/-reader|)
    ( #\> . |>-reader|)))

(defMethod compute-parser-macros ((property (eql 'tag-start-and-content)))
  '(#\=
    ( #\/ . |/-reader|)
    ( #\> . |>-reader|)
    ( #\< . |<![CDATA[-reader|)
    ( #\] . |]-reader| )))

(defMethod compute-parser-macros ((property (eql 'tokenized-whitespace)))
  (mapcar #'(lambda (c) (cons c '|tokenize-whitespace-reader|))
          '(#\space #\return #\linefeed #\tab)))

(defMethod compute-parser-macros ((property (eql 'tokenized-whitespace-in-tag)))
  (mapcar #'(lambda (c) (cons c '|tokenize-whitespace-if-in-tag-reader|))
          '(#\space #\return #\linefeed #\tab)))

(defMethod compute-parser-macros ((property (eql '?-tag-content)))
  '(( #\? . |?-reader| )))

(clear-parsetables 'xml-parsetable)

(def-parsetable (|Attribute| xml-parsetable)       tag-content tokenized-whitespace)
(def-parsetable (|AttChild| xml-parsetable)        quote-context attribute-value)
(def-parsetable (|AttValue| xml-parsetable)        quote-context tokenized-whitespace attribute-value)
(def-parsetable (|AttDef| xml-parsetable)          #\( #\) #\| #\> pe-ref-context quote-context tokenized-whitespace attribute-value)
(def-parsetable (|CDataCharData| xml-parsetable)   cdata-character-data)
(def-parsetable (|CharData| xml-parsetable)        character-data)
(def-parsetable (|CommentCharData| xml-parsetable) comment-char-sequence)
(def-parsetable (|Content| xml-parsetable)         element-character-data ignorable-whitespace)
(def-parsetable (|ContentSpec| xml-parsetable)     expression-context tokenized-whitespace)
; the AttValue as a whole recognizes %, but the text itself does not
(def-parsetable (|DefaultAttChild| xml-parsetable) quote-context attribute-value)
(def-parsetable (|DefaultAttValue| xml-parsetable) quote-context tokenized-whitespace default-attribute-value)
(def-parsetable (|Document| xml-parsetable)        markup-context-wo-references tokenized-whitespace)
(def-parsetable (|DoctypeDecl| xml-parsetable)     #\] #\[ #\>  markup-context-wo-references tokenized-whitespace)
;; (def-parsetable (|Element| xml-parsetable)      element-character-data)
;; (def-parsetable (|EmptyElemTag| xml-parsetable) maybe-tag-content tokenized-whitespace-in-tag)
(def-parsetable (|EncodingDecl| xml-parsetable)    ?-tag-content decl-tag-content quote-context  tokenized-whitespace)
;; (def-parsetable (|EntityChild| xml-parsetable)  quote-context entity-value)
(def-parsetable (|EntityData| xml-parsetable)      quote-context entity-value)
(def-parsetable (|EntityValue| xml-parsetable)     quote-context tokenized-whitespace entity-value)
(def-parsetable (|Eq| xml-parsetable)              quote-context #\=)
;;(def-parsetable (|ETag| xml-parsetable)          maybe-tag-content tokenized-whitespace-in-tag)
;;(def-parsetable (|ETag| xml-parsetable)          tag-start-and-content tokenized-whitespace)
(def-parsetable (|ETag| xml-parsetable)            tag-content tokenized-whitespace)
(def-parsetable (|ExternalID| xml-parsetable)      #\[ decl-tag-content quote-context  tokenized-whitespace pe-ref-context)
(def-parsetable (|ExtParsedEnt| xml-parsetable)    element-character-data ignorable-whitespace)
(def-parsetable (|ExtSubsetDecl| xml-parsetable)   conditional-context expression-context quote-context markup-decl-context tokenized-whitespace)
(def-parsetable (|IgnoreSectContents| xml-parsetable) ignore)
(def-parsetable (|IntSubsetDecl| xml-parsetable)   expression-context quote-context markup-decl-context tokenized-whitespace quote-context)
;; (def-parsetable (|MarkupDeclOrPEReference|      markup-decl-context tokenized-whitespace)
(def-parsetable (|Pi| xml-parsetable)              ?-tag-content tokenized-whitespace)
(def-parsetable (|PiCharData| xml-parsetable)      ?-tag-content)
(def-parsetable (|PubidCharData| xml-parsetable)   quote-context )
;; (def-parsetable (|PubidLiteral| xml-parsetable) decl-tag-content quote-context tokenized-whitespace)
(def-parsetable (|PublicID| xml-parsetable)        decl-tag-content quote-context  tokenized-whitespace pe-ref-context)
(def-parsetable (|SDDecl| xml-parsetable)          ?-tag-content  decl-tag-content quote-context tokenized-whitespace)
;;(def-parsetable (|STag| xml-parsetable)          maybe-tag-content tokenized-whitespace-in-tag)
;;(def-parsetable (|STag| xml-parsetable)          tag-start-and-content tokenized-whitespace)
(def-parsetable (|STag| xml-parsetable)            tag-content tokenized-whitespace)
(def-parsetable (|SystemCharData| xml-parsetable)  quote-context )
;; (def-parsetable (|SystemLiteral| xml-parsetable) decl-tag-content quote-context  tokenized-whitespace)
(def-parsetable (|TextDecl| xml-parsetable)        ?-tag-content decl-tag-content markup-decl-context markup-context) ; tokenized-whitespace)
(def-parsetable (|VersionInfo| xml-parsetable)     ?-tag-content decl-tag-content quote-context  tokenized-whitespace) 
(def-parsetable (|XMLDecl| xml-parsetable)         ?-tag-content decl-tag-content markup-context tokenized-whitespace)


;; nb. this tokenizer interns markup tokens only. as they are recognized and replaced,
;; there is no need to bind the the token package.
;; nb.2. the macros are applied as soon as they are seen. this is in order that they
;; have the specified effect in the context in which they are recognized. if they were
;; to break only, then the interpretation might be deferred into a substructure's
;; lexical context.
;; nb.3. accumulated text is not built in a string. it is consed to a list which remains
;; local to the tokenizer. the result is extracted either as as string - in the
;; case of character data, or as a list - in the case of entity definitions. these strings
;; are managed in a pool, to which the constructors return strings where they denote
;; existing interned names.

;; parse process. these strings will be mostly names for tags and attributes, attribute values, or
;; character content.
;; while reading in the dtd, numerous keywords are left as text, are recognized by string
;; comparison, and are subsequently discarded. which entails a certain amount of garbage.
;; within the root element itself, on the other hand, all keywords are expressed in the grammar
;; as interned tokens and mapped to same by the reader macros. all other text is denotes tag or
;; attribute names or is character data. by yielding the buffer to the constructors, they can
;; determine whether to construct a string for the data, or to find (or generate) an interned
;; name, and thereby ovoid a consed string.



#|
the token reader iterates over the input buffer to construct a token.
the token extent is noted and the content extracted first when a boundary is hit.
the reader's state takes the form of four pointers
    token-start : the first byte of the present token
    token-fill : the position to add the next byte to the token
    input-start : the position of the next input byte
    input-fill : the position into which stream bytes are placed.
the boundary states are:
    input-start == fill-fill : read stream bytes
    input-fill == token-start : input stops
    token-start is initially == token-fill == input-start
when a macro is recognized, it is invoked to operate on the buffer content.
the result can be that it extends the token, replaces the input, or skips the input.
the replacement may be a symbol, for a markup token, or a content or dtd declaration.
|#

(defun token-reader
       (&aux datum)
  (unless *parsetable*
    (error "no parsetable."))
  (let* ((macros (table.macros *parsetable*))
         (macro-table-size (length macros))
         (macro nil)
         (*ignore-whitespace* *ignore-whitespace*))
    (declare (optimize (speed 3) (safety 0))
             (type fixnum macro-table-size)
             (type simple-vector macros)
             (ftype (function (t) t) parse-external-subset parse-external-general-entity))
    (when bnfp::*atn-trace*
      (format *trace-output* "~% (token-reader: ~@[in context ~s~] ~s)" *parsetable* bnfp::*atn-stack))
    (loop
      ; (format *trace-output* "(input ~s) " *input-datum*)
      (setf datum (get-input))
      (typecase datum
        ;; raw input appears as a fixnum character code
        (fixnum
         (setf macro (when (< (the fixnum datum) macro-table-size)
                       (svref macros (the fixnum datum))))
         (cond (macro
                (when bnfp::*atn-trace*
                  (format *trace-output* " (dispatching with ~s using ~a(~s)->~a)"
                          (peek-token-string) (table.name *parsetable*)
                          (code-char datum) macro))
                (funcall macro))
               (t
                (extend-token (eol-normalize-input datum))
                (advance-input))))
        
        ;; null input implies end-of-file, which yields an in-progress string or NIL
        (null (return (make-token)))

        ;; reader macros replace input with token symbols
        (symbol
         (return (if *token-end*
                   (make-token)
                   (progn (advance-input) datum))))
        ;; separate multiple values
        (cons
         (return (if *token-end*
                   (make-token)
                   (progn (replace-input (rest datum))
                          (first datum)))))
        (string
         (advance-input)
         (return datum))

        ;; internal entities are inserted in place, whereby a parameter entity
        ;; may be bracketed with spaces. where the replacement text is one byte long,
        ;; add it directly to the token so that markup is not recognized
        (def-internal-entity
          ;; (print (list *atn-term* bnfp::*atn-stack))
          (when (and (is-def-parameter-entity datum)
                     xutils::|REC-xml-19980210.PEs in Internal Subset|
                     *in-internal-subset*
                     (not *in-decl-sep*))
            (xml-error |WFC: PEs in Internal Subset| :name (name datum)))
          (when (children datum)
            ;; a single byte is appended directly to the token...
            (if (> (length (children datum)) 1)
              (push-input-source datum)
              (extend-token (first (children datum)))))
          (advance-input))
        
        ;; external entites are parsed and inserted in-line if not in a literal
        (def-external-parameter-entity
          (unless (in-dtd?)
            (xml-error |WFC: In DTD| :node datum))
          (if (in-entity-value?) ;; load the external entity data
            (progn (push-input-source datum)
                   (advance-input))
            (return (if *token-end*
                      (make-token)
                      (progn (advance-input)
                             (handler-case (parse-external-subset datum)
                               (error (error)
                                      (|WFC: External Subset|
                                       :system-id (system-id datum)
                                       :public-id (public-id datum) :datum error))))))))
        (def-external-general-entity
          (if *token-end*
            (return (make-token))
            (progn (when (notation datum)
                     (|WFC: Parsed Entity| :name (name datum)))
                   (advance-input)
                   (return (handler-case (parse-external-general-entity datum)
                             (error (error)
                                    (|WFC: External Parsed Entity|
                                     :system-id (system-id datum)
                                     :public-id (public-id datum) :datum error)))))))
                
        (ref-entity
         (return (if *token-end*
                   (make-token)
                   (progn (advance-input) datum))))
        (t
         (warn "unrecognized input ignored: ~s." datum)
         (advance-input))))))




#|


(defmacro tt (node string)
  `(with-parsetable (or (parsetable ',node) (error "no readtable: ~s." ',node))
     (with-ring-buffer (64)
       (let ((stream (make-instance 'vector-input-stream :vector ,string))
             (results nil)
             (token nil))
         (setf *input-fill* (fill-ring-buffer stream *input-fill* *token-start*))
         (handler-case (loop (unless (setf token (token-reader stream)) (return (reverse results)))
                             (push token results))
           (end-of-file (condition)
                        (declare (ignore condition))
                        (push `(*EOF* ,(make-token)) results)
                        (reverse results)))))))


(tt |Attribute| "asdf='zzzz'/>") ;; ok that quote not recognized
(let ((*quote-token* '|xml|:|"|)) (tt |AttChild| "some text' with a general&entity;in it\""))
(let ((*quote-token* '|xml|:|"|)) (tt |AttChild| "&entity;in it\""))
(let ((*quote-token* '|xml|:|"|)) (tt |AttChild| "some text' with a general&entity;\""))
(let ((*quote-token* '|xml|:|"|)) (tt |AttChild| "some text' with a char ref &#x20;&#x0A;in it\""))
(let ((*quote-token* t)) (tt |AttValue| "\"some-text-without-spaces\""))
(tt |AttDef| "elementName attName CDATA >")
(tt |CDataCharData| "asasas ][ aasas[ ]] asasas ]]< ]]a ]] > ]]>")
(tt |CharData| "< ")
(tt |CharData| "asasasas< ")
(tt |CharData| "&entity;< ")
(tt |CommentCharData| "aaas - asas - - - -> -->")
(tt |Content| "asasasa&entity;<ELEM ")
(tt |ContentSpec| "(a | (b c?) |(a:a a s s , b)*")
(tt |DoctypeDecl| "[ <!ELEMENT asdf ANY> ] >")
(let ((*quote-token* t)) (tt |EncodingDecl| "encoding='asasas'"))
(let ((*quote-token* t)) (tt |EntityChild| "'before%entity;after&notRecognized;'"))
(let ((*quote-token* t)) (tt |EntityValue| "'break on space &asaas; %as;qwqw'"))
(let ((*quote-token* t)) (tt |Eq| "-'asas'"))
(tt |ETag| "asdf/> ")
(tt |ExtSubsetDecl| "<![INCLUDE[ <!ELEMENT asdf ANY> ]]>")
(tt |ExtSubsetDecl| "INCLUDE[ <!ELEMENT asdf ANY> ]]>")
(tt |ExtSubsetDecl| "[ <!ELEMENT asdf ANY> ]]>")
(tt |Pi| "sometarget 1 2 3 4 ? version< with more > stuff ?>")
(tt |PiCharData| "sometarget 1 2 3 4 ? version< with more > stuff ?>")
(let ((*quote-token* t)) (tt |PubidCharData| "\"some text with spaces\""))
(let ((*quote-token* t)) (tt |PubidLiteral| "\"some-text-without-spaces\""))
(let ((*quote-token* t)) (tt |SDDecl| "standalone='yes'"))
(tt |STag| "qwer asdf='zzzz'/> ")
(let ((*quote-token* t)) (tt |SystemCharData| "\"some text with spaces\""))
(let ((*quote-token* t)) (tt |SystemLiteral| "\"some-text-without-spaces\""))
(let ((*quote-token* t)) (tt |VersionInfo| "version='1.*'"))
(tt |XMLDecl| "<?xml ")
(tt |XMLDecl| "<?somePI ")
(tt |XMLDecl| "<!DOCTYPE ")
(tt |XMLDecl| "<asdf ")
(tt |XMLDecl| "<?xml ?>")

|#

:EOF

