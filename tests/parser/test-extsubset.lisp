;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

#|
 <DOCUMENTATION
  <DESCRIPTION>
   this file contains combinations of possible declaration subset forms to test
   declarations in themselves.
   depending on the invocation, the resulting instances may be uninterned qualified names
   or interned names.
   </DESCRIPTION>
  </DOCUMENTATION>   
|#

;; 20010914 0.913

(defParameter *external-subset-string*
"<!-- ElementDecl -->
<!ELEMENT pre:refs (A*)>
<!ELEMENT A EMPTY>

<!-- AttlistDecl -->
<!ATTLIST pre:refs refs IDREFS #REQUIRED
                   xmlns:pre CDATA 'a space'>
<!ATTLIST poem  xml:space (default|preserve) 'preserve'>
<!ATTLIST a id ID #REQUIRED>
<!ATTLIST poem   xml:lang NMTOKEN 'fr'>
<!ATTLIST gloss  xml:lang NMTOKEN 'en'>
<!ATTLIST note   xml:lang NMTOKEN 'en'>
<!ATTLIST pre xml:space (preserve) #FIXED 'preserve'>
<!ATTLIST pre:termdef
          att1r    CDATA   #REQUIRED
          att1i    CDATA   #IMPLIED
          att1f    CDATA   #FIXED 'value'
          att1v    CDATA   'value'
          att2r    ID      #REQUIRED
          att2i    ID      #IMPLIED
          att2f    ID      #FIXED 'value'
          att2v    ID      'value'
          att3r1   NOTATION (name1) #REQUIRED
          att3r2   NOTATION (name1|name2) #REQUIRED
          att3i1   NOTATION (name1) #IMPLIED
          att3i2   NOTATION (name1|name2) #IMPLIED
          att3f1   NOTATION (name1) #FIXED 'name1'
          att3f1   NOTATION (name1|name2) #FIXED 'name2'
          att3v1   NOTATION (name1) 'name1'
          att3v2   NOTATION (name1|name2) 'name1'
          att4r   (token1 |token2) #REQUIRED
          att4i   (token1|token2) #IMPLIED
          att4f   (token1 | token2|token3) #FIXED 'token1'
          att4v   (token1 |token2) 'token1' >
<!ATTLIST list
          type    (bullets|ordered|glossary)  \"ordered\">
<!ATTLIST form
          method  CDATA   #FIXED \"POST\">

<!-- EntityDecl -->
<!ENTITY % peDef 'asdf qwer'>
<!ENTITY % peExtDef0 SYSTEM 'a system literal' >
<!ENTITY % peExtDef1 PUBLIC 'a public literal' 'a system literal' >

<!ENTITY geDef 'asdf qwer'>
<!ENTITY geExtDef0 SYSTEM 'a system literal' >
<!ENTITY geExtDef1 PUBLIC 'a public literal' 'a system literal' >
<!ENTITY geExtDef2 SYSTEM 'a system literal' NDATA Notation1>
<!ENTITY geExtDef3 PUBLIC 'a public literal' 'a system literal' NDATA Notation1>

<!-- NotationDecl -->
<!NOTATION notation1 SYSTEM 'a system literal' >
<!NOTATION notation2 PUBLIC 'a public literal' 'a system literal' >
<!NOTATION notation3 PUBLIC 'a public literal' >
<!NOTATION unknot PUBLIC \"Unknown\">

<!-- Pi -->

<?aPiTarget wiith some data ?>
")

(inspect
 (parse-external-subset-toplevel *external-subset-string*))

(parse-external-subset-toplevel "data:,<!ELEMENT subjectterm (#PCDATA)>")

(parse-external-subset-toplevel "data:,
<![INCLUDE[

<!ELEMENT title (test)*>

<!ELEMENT test ANY>
<!ATTLIST test test-attr (optional|required) 'required' >
]]>")

;; note the difference in the generated entity content. the two amp forms are normalized
;; to be the same, since it is a single markup character
(inspect
(parse-external-subset-toplevel "data:,
<!ENTITY icirc  '&#238;' >
<!ENTITY lt      '&#38;#60;' ><!-- less-than sign, U+003C ISOnum -->
<!ENTITY gt      '&#62;' ><!-- greater-than sign, U+003E ISOnum -->
<!ENTITY amp     '&#38;#38;' ><!-- ampersand, U+0026 ISOnum -->
<!ENTITY amp     '&#38;' ><!-- ampersand, U+0026 ISOnum -->
<!ENTITY apos    '&#39;' ><!-- apostrophe, U+0027 ISOnum -->
<!ENTITY quot    '&#34;' ><!-- quotation mark = APL quote, U+0022 ISOnum -->"
                 :start-name '|ExtSubset|))

;; in order that the parser perform qname resolution, the entire document definition
;; must be parsed
(inspect
(document-parser "data:,<!DOCTYPE doc [
  <!ELEMENT doc (a:x)* >
  <!ATTLIST doc xmlns CDATA 'data:,ns-top'>
  <!ELEMENT a:x EMPTY>
  <!ATTLIST a:x xmlns:a CDATA 'data:,ns-a'>
  ]>" :start-name '|DoctypeDecl|))

(flet ((parse-subset (string)
         (list xutils::|REC-xml-names-19990114| *namespace*
               (document-parser string :reduce t :trace nil :start-name '|ExtSubset|))))
  (let ((results nil))
    (let ((xutils::|REC-xml-names-19990114| t) (*namespace* *null-namespace*)
          (result nil))
      (time (setf result (parse-subset *external-subset-string*)))
      (push result results))
    (let ((xutils::|REC-xml-names-19990114| t) (*namespace* nil)
          (result nil))
      (time (setf result (parse-subset *external-subset-string*)))
      (push result results))
    (let ((xutils::|REC-xml-names-19990114| nil) (*namespace* *null-namespace*)
          (result nil))
      (time (setf result (parse-subset *external-subset-string*)))
      (push result results))
    #| 20010914 0.913 the qname processing does not permit string-values names
       (let ((xutils::|REC-xml-names-19990114| nil) (*namespace* nil)
          (result nil))
      (time (setf result (parse-subset *external-subset-string*)))
      (push result results))|#
    (inspect results)))

(parse-external-subset-toplevel #p"xml:tests;xml;lisp.dtd")


:EOF
