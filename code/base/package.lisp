;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

#|
<DOCUMENTATION>
 nb. see XQueryDataModel:XQDM-classes for exports for class predicate and constructors
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' /> <CHRONOLOGY>
  <DELTA DATE='20010507'>incorporated character class exports</DELTA>
  <DELTA DATE='20010617'>moved parsetable to XML-UTILS</DELTA>
  <DELTA DATE='20010621'>exported xml serialization iterface</DELTA>
  <DELTA DATE='20010622'>parameters for reader adjustments for null symbol names</DELTA>
  <DELTA DATE='20010624'>node graph interface</DELTA>
  <DELTA DATE='20010702'><code>DATA-URL</code>; differentiated qname contexts</DELTA>
  <DELTA DATE='20010714'>factored namespaces out</DELTA>
  <DELTA DATE='20010718'>xmlparser package renamed to XMLP</DELTA>
  <DELTA DATE='20010808'>added '$' package for XQL variables</DELTA>
  <DELTA DATE='20010816'>additions for schema types</DELTA>
  <DELTA DATE='20010902'>www-utils and tk1 package for cl-http tokenizer</DELTA>
  <DELTA DATE='20030320'>added 0.950 package nicknmes inorder to use its condition implementation</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20050616'>don't use ccl</DELTA>
  <DELTA DATE='20061001'>explicit cl-http feature test rather than conditionalized</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :cl-user)

#+cl-http(unless (find :cl-http *features*) (error "this file must be recompiled."))
#-cl-http(when (find :cl-http *features*) (error "this file must be recompiled."))



(defpackage :xml-utils
  (:nicknames :xutils :de.setf.xml.base.implementation
              :de.setf.xml.conditions)
  (:use :common-lisp
        ;; 20050616 don't use ccl #+ccl :ccl
        :de.setf.utility)
  #+cl-http (:import-from :url
                          :URI :URL :PARSE-URL :INTERN-URL
                          :HTTP-URL :FILE-URL :NAME-STRING
                          :PATH :HOST :HOST-STRING :PORT :OBJECT :EXTENSION
                          :TRANSLATED-PATHNAME
                          ;; for the file-url function
                          :DIRECTORY-NAME-STRING :WITH-VALUE-CACHED
                          :WRITE-SCHEME-PREFIX :WRITE-HOST-PORT-STRING :WRITE-PATH)
  #+cl-http (:import-from :http
                          :MERGE-URL)
  #+ALLEGRO (:import-from :EXCL :WITHOUT-INTERRUPTS)
  #+lispworks (:import-from :lispworks :without-interrupts)
  #+CMU (:import-from :SYSTEM :WITHOUT-INTERRUPTS)
  #+PCL (:shadowing-import-from :PCL :CLASS-PRECEDENCE-LIST
				:FUNCALLABLE-STANDARD-CLASS
				:VALIDATE-SUPERCLASS :STANDARD-CLASS
				:BUILT-IN-CLASS :FIND-CLASS
				:CLASS-NAME :CLASS-OF)
  #+SBCL (:import-from :SB-SYS :WITHOUT-INTERRUPTS)
  #+sbcl (:shadowing-import-from :SB-PCL :CLASS-PRECEDENCE-LIST
				 :FUNCALLABLE-STANDARD-CLASS
				 :VALIDATE-SUPERCLASS :STANDARD-CLASS
				 :BUILT-IN-CLASS :FIND-CLASS
				 :CLASS-NAME :CLASS-OF)
  #+digitool
  (:import-from :ccl
                :stream-tyo
                :stream-reader
                :stream-writer
                :stream-column)
  #+(or digitool clozure)
  (:import-from :ccl
                :stream-position
                :without-interrupts
                :stream-eofp)
  
  (:import-from :de.setf.utility
                :deftest
                :deftests
                :execute-tests
                :trim-string-whitespace)
  (:EXPORT
   :deftest
   :deftests
   :execute-tests
   :*ENCODING-MAP*
   :*PARSETABLE*
   :*TOKEN-PACKAGE*
   :*XML-BASE*
   :*XML-VERBOSE*
   :<-CHAR-CODE-LIMIT
   :CANONICAL-ENCODING
   :CHECKED-CODE-CHAR
   :CLEAR-PARSETABLE
   :CLEAR-PARSETABLES
   :COMPUTE-PARSER-MACROS
   :COMPUTE-TOKEN-READER
   :COPY-PARSETABLE
   :DATA-URL
   :DEFALTERNATIVECONSTRUCTOR
   :DEFCONSTANTCONSTRUCTOR
   :DEFCONSTRUCTOR
   :DEFCONSTRUCTORMETHOD
   :DEFIDENTITYCONSTRUCTOR
   :DEFLITERALCONSTRUCTOR
   :DEFNULLCONSTRUCTOR
   :DEF-PARSETABLE
   :DEFTOKEN
   :DEFTOKENCONSTRUCTOR
   :DEFTOKENCONSTRUCTORS
   :DEFTOKENS
   :EXPORT-NAME
   :FILE-URL
   :FILE-URL-PATHNAME
   :HTTP-URL
   :MAKE-DATA-URL
   :MAKE-URI
   :MERGE-URIS
   :namespace
   :|NOTE-newline-200101314|
   :object
   :PARSER-MACRO
   :PARSETABLE
   :PATHNAME-FILE-URL
   :|REC-xml-19980210.End-of-Line Handling|
   :|REC-xml-19980210.PEs in Internal Subset|
   :|REC-xml-19980210.Validate Attribute Defaults|
   :|REC-xml-names-19990114|
   :|REC-xml-names-19990114.NSC: Prefix Immutable|
   :|REC-xml-names-19990114.VC: Attribute Declared|
   :RESOLVE-ENTITY-IDENTIFIERS
   :SPLIT-SEQUENCE
   :SPLIT-STRING
   :STREAM-POSITION
   :STREAM-STATE
   :TABLE.MACROS
   :TABLE.NAME
   :TABLE.PROPERTIES
   :URI
   :URI-NAMESTRING
   :URL
   :URL-DATA
   :URN
   :urn-namespace
   :urn-string
   :VECTOR-INPUT-STREAM
   :WITH-DATA-STREAM
   :WITH-FILE-STREAM
   :WITH-HTTP-STREAM
   :WITH-PARSETABLE
   :WITHOUT-INTERRUPTS
   :STREAM-COLUMN
   :STREAM-READER
   :stream-tyo
   :STREAM-WRITER
   :check-constraint
   :coerce-to-generic-function
   :condition-continue-format-arguments
   :condition-continue-format-control
   :continuable-error
   :continue-format-arguments
   :continue-format-control
   :def-exception
   :initialize-condition
   :internal-xml-error
   :make-initialized-condition
   :report-condition
   :report-condition
   :simple-continuable-condition
   :stream-eofp
   :xml-condition
   :xml-error
   :xml-warn
   :xml-warning
   :|VC: ID|
   :|VC: Name Token|
   :|VC: Entity Name|
   :|VC: Notation Attributes|
   :|VC: Enumeration|
   :|VC: Element Content|
   :|VC: No Duplicate Tokens|
   :|VC: No Duplicate Types|
   :|NSC: Prefix Immutable|
   :|WFC: Legal Character|
   ))


(defpackage :XML-QUERY-DATA-MODEL
  (:nicknames :XQDM
              :DE.SETF.XML.NAMES.IMPLEMENTATION
              :DE.SETF.XML.NODE.IMPLEMENTATION
              :DE.SETF.XML.MODEL
              :DE.SETF.XML.MODEL.IMPLEMENTATION)
  (:shadowing-import-from :BNFP :PARSE-ERROR)
  (:use :BNFP #+CCL :CCL :COMMON-LISP :XUTILS)
  #+LISPWORKS
  (:import-from :HCL :VALIDATE-SUPERCLASS)
  #+scl
  (:import-from :clos :validate-superclass)
  #+CCL (:shadow :TARGET)
  #+PCL (:shadowing-import-from :PCL :CLASS-PRECEDENCE-LIST
			       :FUNCALLABLE-STANDARD-CLASS
			       :VALIDATE-SUPERCLASS :STANDARD-CLASS
			       :BUILT-IN-CLASS :FIND-CLASS
			       :CLASS-NAME :CLASS-OF
			       :STRUCTURE-CLASS) 
  #+sbcl (:shadowing-import-from :SB-PCL :CLASS-PRECEDENCE-LIST
				:FUNCALLABLE-STANDARD-CLASS
				:VALIDATE-SUPERCLASS :STANDARD-CLASS
				:BUILT-IN-CLASS :FIND-CLASS
				:CLASS-NAME :CLASS-OF)
  (:import-from :de.setf.utility
                :trim-string-whitespace)
  (:export
   ;; document string constants
   :+xml-namespace-name+
   :+xhtml-namespace-name+
   :+xhtml-public-identifier+
   :+xhtml-system-identifier+
   :+xsd-namespace-name+
   :+xs-namespace-name+
   :+xsi-namespace-name+

   
   ;; the defTypePredicate macro exports for classes and predicate names
   ;; the defException macro exports exception class names
   
   :ABSTRACT-CLASS
   :ABSTRACT-NODE
   :NAMED-NODE
   :UNAMED-NODE
   :NCNAMED-NODE
   :TYPED-NODE
   :DOCUMENT-SCOPED-NODE
   :ORDINAL-NODE
   :ENTITY-DELEGATE
   :DOC-NODE-INTERFACE
   :ELEM-NODE-INTERFACE
   :ELEM-PROPERTY-NODE-INTERFACE
   
   ;; model classes: all classes export the symbol and a predicate
   ;; concrete classes have an instantiation function and parameter
   ;; see defTypePredicate for generation
   :ABSTRACT-ATTR-NODE :IS-ABSTRACT-ATTR-NODE
   :ABSTRACT-DEF-NODE :IS-ABSTRACT-DEF-NODE
   :ABSTRACT-DEF-TYPE :IS-ABSTRACT-DEF-TYPE
   :ABSTRACT-ELEM-NODE :IS-ABSTRACT-ELEM-NODE
   :ABSTRACT-ELEM-PROPERTY-NODE :IS-ABSTRACT-ELEM-PROPERTY-NODE
   :ABSTRACT-NS-NODE :IS-ABSTRACT-NS-NODE
   :ABSTRACT-TOP-LEVEL-DEF-NODE :IS-ABSTRACT-TOP-LEVEL-DEF-NODE
   :ATTR-CHILD-NODE :IS-ATTR-CHILD-NODE :*CLASS.ATTR-CHILD-NODE* :MAKE-ATTR-CHILD-NODE
   :ATTR-NODE :IS-ATTR-NODE :*CLASS.ATTR-NODE* :MAKE-ATTR-NODE
   :BINARY-VALUE :IS-BINARY-VALUE :*CLASS.BINARY-VALUE* :MAKE-BINARY-VALUE
   :BOOL-VALUE :IS-BOOL-VALUE :*CLASS.BOOL-VALUE* :MAKE-BOOL-VALUE
   :CHARACTER-DATA-NODE :IS-CHARACTER-DATA-NODE :*CLASS.CHARACTER-DATA-NODE* :MAKE-CHARACTER-DATA-NODE
   :COMMENT-NODE :IS-COMMENT-NODE :*CLASS.COMMENT-NODE* :MAKE-COMMENT-NODE
   :CONDITIONAL-SECTION :IS-CONDITIONAL-SECTION :*CLASS.CONDITIONAL-SECTION* :MAKE-CONDITIONAL-SECTION
   :DECIMAL-ATTR-NODE :IS-DECIMAL-ATTR-NODE :*CLASS.DECIMAL-ATTR-NODE* :MAKE-DECIMAL-ATTR-NODE
   :DECIMAL-VALUE :IS-DECIMAL-VALUE :*CLASS.DECIMAL-VALUE* :MAKE-DECIMAL-VALUE
   :DEF-ATTR :IS-DEF-ATTR :*CLASS.DEF-ATTR* :MAKE-DEF-ATTR
   :DEF-ELEM-PROPERTY-TYPE :IS-DEF-ELEM-PROPERTY-TYPE :*CLASS.DEF-ELEM-PROPERTY-TYPE* :MAKE-DEF-ELEM-PROPERTY-TYPE
   :DEF-ELEM-TYPE :IS-DEF-ELEM-TYPE :*CLASS.DEF-ELEM-TYPE* :MAKE-DEF-ELEM-TYPE
   :DEF-ENTITY :IS-DEF-ENTITY :*CLASS.DEF-ENTITY* :MAKE-DEF-ENTITY
   :DEF-EXTERNAL-ENTITY :IS-DEF-EXTERNAL-ENTITY :*CLASS.DEF-EXTERNAL-ENTITY* :MAKE-DEF-EXTERNAL-ENTITY
   :DEF-EXTERNAL-GENERAL-ENTITY :IS-DEF-EXTERNAL-GENERAL-ENTITY :*CLASS.DEF-EXTERNAL-GENERAL-ENTITY* :MAKE-DEF-EXTERNAL-GENERAL-ENTITY
   :DEF-EXTERNAL-PARAMETER-ENTITY :IS-DEF-EXTERNAL-PARAMETER-ENTITY :*CLASS.DEF-EXTERNAL-PARAMETER-ENTITY* :MAKE-DEF-EXTERNAL-PARAMETER-ENTITY
   :DEF-GENERAL-ENTITY :IS-DEF-GENERAL-ENTITY :*CLASS.DEF-GENERAL-ENTITY* :MAKE-DEF-GENERAL-ENTITY
   :DEF-INTERNAL-ENTITY :IS-DEF-INTERNAL-ENTITY :*CLASS.DEF-INTERNAL-ENTITY* :MAKE-DEF-INTERNAL-ENTITY
   :DEF-INTERNAL-GENERAL-ENTITY :IS-DEF-INTERNAL-GENERAL-ENTITY :*CLASS.DEF-INTERNAL-GENERAL-ENTITY* :MAKE-DEF-INTERNAL-GENERAL-ENTITY
   :DEF-INTERNAL-PARAMETER-ENTITY :IS-DEF-INTERNAL-PARAMETER-ENTITY :*CLASS.DEF-INTERNAL-PARAMETER-ENTITY* :MAKE-DEF-INTERNAL-PARAMETER-ENTITY
   :DEF-NOTATION :IS-DEF-NOTATION :*CLASS.DEF-NOTATION* :MAKE-DEF-NOTATION
   :DEF-PARAMETER-ENTITY :IS-DEF-PARAMETER-ENTITY :*CLASS.DEF-PARAMETER-ENTITY* :MAKE-DEF-PARAMETER-ENTITY
   :DEFNAMESPACE
   :DOC-CHILD-NODE :IS-DOC-CHILD-NODE :*CLASS.DOC-CHILD-NODE* :MAKE-DOC-CHILD-NODE
   :DOC-NODE :IS-DOC-NODE :*CLASS.DOC-NODE* :MAKE-DOC-NODE
   :DOCTYPE-CHILD-NODE :IS-DOCTYPE-CHILD-NODE :*CLASS.DOCTYPE-CHILD-NODE* :MAKE-DOCTYPE-CHILD-NODE
   :DOCUMENT-TYPE-DECLARATION-INFORMATION-NODE :IS-DOCUMENT-TYPE-DECLARATION-INFORMATION-NODE :*CLASS.DOCUMENT-TYPE-DECLARATION-INFORMATION-NODE* :MAKE-DOCUMENT-TYPE-DECLARATION-INFORMATION-NODE
   :DOUBLE-ATTR-NODE :IS-DOUBLE-ATTR-NODE :*CLASS.DOUBLE-ATTR-NODE* :MAKE-DOUBLE-ATTR-NODE
   :DOUBLE-VALUE :IS-DOUBLE-VALUE :*CLASS.DOUBLE-VALUE* :MAKE-DOUBLE-VALUE
   :ELEM-CHILD-NODE :IS-ELEM-CHILD-NODE :*CLASS.ELEM-CHILD-NODE* :MAKE-ELEM-CHILD-NODE
   :ELEM-NODE :IS-ELEM-NODE :*CLASS.ELEM-NODE* :MAKE-ELEM-NODE
   :ELEM-PROPERTY-NODE :IS-ELEM-PROPERTY-NODE :*CLASS.ELEM-PROPERTY-NODE* :MAKE-ELEM-PROPERTY-NODE
   :ENTITIES-ATTR-NODE :IS-ENTITIES-ATTR-NODE :*CLASS.ENTITIES-ATTR-NODE* :MAKE-ENTITIES-ATTR-NODE
   :ENTITY-ATTR-NODE :IS-ENTITY-ATTR-NODE :*CLASS.ENTITY-ATTR-NODE* :MAKE-ENTITY-ATTR-NODE
   :ENTITY-INFORMATION-NODE :IS-ENTITY-INFORMATION-NODE :*CLASS.ENTITY-INFORMATION-NODE* :MAKE-ENTITY-INFORMATION-NODE
   :ENTITY-VALUE :IS-ENTITY-VALUE :*CLASS.ENTITY-VALUE* :MAKE-ENTITY-VALUE
   :ENUMERATION-ATTR-NODE :IS-ENUMERATION-ATTR-NODE :*CLASS.ENUMERATION-ATTR-NODE* :MAKE-ENUMERATION-ATTR-NODE
   :EXT-SUBSET-NODE :IS-EXT-SUBSET-NODE :*CLASS.EXT-SUBSET-NODE* :MAKE-EXT-SUBSET-NODE
   :EXTERNAL-PARSED-ENTITY :IS-EXTERNAL-PARSED-ENTITY :*CLASS.EXTERNAL-PARSED-ENTITY* :MAKE-EXTERNAL-PARSED-ENTITY
   :FLOAT-VALUE :IS-FLOAT-VALUE :*CLASS.FLOAT-VALUE* :MAKE-FLOAT-VALUE
   :FUNCTION-VALUE :IS-FUNCTION-VALUE :*CLASS.FUNCTION-VALUE* :MAKE-FUNCTION-VALUE
   :ID-ATTR-NODE :IS-ID-ATTR-NODE :*CLASS.ID-ATTR-NODE* :MAKE-ID-ATTR-NODE
   :ID-REF-ATTR-NODE :IS-ID-REF-ATTR-NODE :*CLASS.ID-REF-ATTR-NODE* :MAKE-ID-REF-ATTR-NODE
   :ID-REF-VALUE :IS-ID-REF-VALUE :*CLASS.ID-REF-VALUE* :MAKE-ID-REF-VALUE
   :ID-REFS-ATTR-NODE :IS-ID-REFS-ATTR-NODE :*CLASS.ID-REFS-ATTR-NODE* :MAKE-ID-REFS-ATTR-NODE
   :ID-VALUE :IS-ID-VALUE :*CLASS.ID-VALUE* :MAKE-ID-VALUE
   :INFO-ITEM-NODE :IS-INFO-ITEM-NODE :*CLASS.INFO-ITEM-NODE* :MAKE-INFO-ITEM-NODE
   :NMTOKEN-ATTR-NODE :IS-NMTOKEN-ATTR-NODE :*CLASS.NMTOKEN-ATTR-NODE* :MAKE-NMTOKEN-ATTR-NODE
   :NMTOKENS-ATTR-NODE :IS-NMTOKENS-ATTR-NODE :*CLASS.NMTOKENS-ATTR-NODE* :MAKE-NMTOKENS-ATTR-NODE
   :NOTATION-ATTR-NODE :IS-NOTATION-ATTR-NODE :*CLASS.NOTATION-ATTR-NODE* :MAKE-NOTATION-ATTR-NODE
   :NOTATION-VALUE :IS-NOTATION-VALUE :*CLASS.NOTATION-VALUE* :MAKE-NOTATION-VALUE
   :NS-NODE :IS-NS-NODE :*CLASS.NS-NODE* :MAKE-NS-NODE
   :NUMBER-VALUE :IS-NUMBER-VALUE :*CLASS.NUMBER-VALUE* :MAKE-NUMBER-VALUE
   :ORDINAL-NODE :IS-ORDINAL-NODE :*CLASS.ORDINAL-NODE* :MAKE-ORDINAL-NODE
   :PI-NODE :IS-PI-NODE :*CLASS.PI-NODE* :MAKE-PI-NODE
   :QNAME-ATTR-NODE :IS-QNAME-ATTR-NODE :*CLASS.QNAME-ATTR-NODE* :MAKE-QNAME-ATTR-NODE
   :QNAME-CONTEXT :IS-QNAME-CONTEXT :*CLASS.QNAME-CONTEXT* :MAKE-QNAME-CONTEXT
   :QNAME-VALUE :IS-QNAME-VALUE :*CLASS.QNAME-VALUE* :MAKE-QNAME-VALUE
   :RECUR-DUR-ATTR-NODE :IS-RECUR-DUR-ATTR-NODE :*CLASS.RECUR-DUR-ATTR-NODE* :MAKE-RECUR-DUR-ATTR-NODE
   :RECUR-DUR-VALUE :IS-RECUR-DUR-VALUE :*CLASS.RECUR-DUR-VALUE* :MAKE-RECUR-DUR-VALUE
   :REF-CHARACTER-ENTITY :IS-REF-CHARACTER-ENTITY :*CLASS.REF-CHARACTER-ENTITY* :MAKE-REF-CHARACTER-ENTITY
   :REF-ENTITY :IS-REF-ENTITY :*CLASS.REF-ENTITY* :MAKE-REF-ENTITY
   :REF-GENERAL-ENTITY :IS-REF-GENERAL-ENTITY :*CLASS.REF-GENERAL-ENTITY* :MAKE-REF-GENERAL-ENTITY
   :REF-NODE :IS-REF-NODE :*CLASS.REF-NODE* :MAKE-REF-NODE
   :REF-PARAMETER-ENTITY :IS-REF-PARAMETER-ENTITY :*CLASS.REF-PARAMETER-ENTITY* :MAKE-REF-PARAMETER-ENTITY
   :STRING-ATTR-NODE :IS-STRING-ATTR-NODE :*CLASS.STRING-ATTR-NODE* :MAKE-STRING-ATTR-NODE
   :STRING-VALUE :IS-STRING-VALUE :*CLASS.STRING-VALUE* :MAKE-STRING-VALUE
   :TIME-ATTR-NODE :IS-TIME-ATTR-NODE :*CLASS.TIME-ATTR-NODE* :MAKE-TIME-ATTR-NODE
   :TIME-DUR-VALUE :IS-TIME-DUR-VALUE :*CLASS.TIME-DUR-VALUE* :MAKE-TIME-DUR-VALUE
   :URI-REF-ATTR-NODE :IS-URI-REF-ATTR-NODE :*CLASS.URI-REF-ATTR-NODE* :MAKE-URI-REF-ATTR-NODE
   :URI-REF-VALUE :IS-URI-REF-VALUE :*CLASS.URI-REF-VALUE* :MAKE-URI-REF-VALUE
   :VALUE-NODE :IS-VALUE-NODE :*CLASS.VALUE-NODE* :MAKE-VALUE-NODE   
   ;; accessors
   :URI
   :CHILDREN
   :ROOT
   :VALIDATE?
   :PARENT
   :DEF
   :DOCUMENT
   :EXPAND
   :NAMESPACES
   :ATTRIBUTES
   :PROPERTIES
   :NOTATION
   :ORDINALITY
   :MODEL
   :NODE-CLASS
   :NODE-VALIDATOR
   :VALUE
   :ENCODING
   :NODES
   :PREFIX
   :TARGET
   :DEREF
   :IS-FIXED
   :IS-REQUIRED
   :IS-IMPLIED
   :IS-EPHEMERAL
   :PROTOTYPE
   :STIPULATION
   :PROPS-DEFAULTED
   :PROPS-REQUIRED
   
   :VERSION
   :STANDALONE
   :SYSTEM-ID
   :PUBLIC-ID
   :NAMESPACE-NAME
   :LOCAL-NAME
   
   ;; additional accessors and abstract nodes which are not in the model
   :ENTITIES
   :NOTATIONS
   :TYPES
   :ATTRIBUTES
   :PRECEDING-SIBLINGS
   :FOLLOWING-SIBLINGS
   :GENERAL-ENTITIES
   :PARAMETER-ENTITIES
   :NAMED-VALUE-NODE
   :ELEM-PROPERTY-NODE
   :ELEM-CHILD-NODE
   :DOC-CHILD-NODE
   :FUNCTION-VALUE
   :IS-FUNCTION-VALUE
   :EXPRESSION
   :CHARACTER-DATA-NODE
   :PI-NODES
   :COMMENT-NODES
   :CONTENT
   :ENTITY-INFO
   :REF-ELEM-NODE
   :REF-ELEM-PROPERTY-NODE
   
   :CLONE-NODE
   :LOCAL-PART
   :CHECK-CONSTRAINT
   :BIND-DEFINITION
   :COLLECT-MODEL-NAMES
   :FIRST-MODEL-NAME
   :ASSIGN-UNIVERSAL-NAMES
   :VALIDATE-CONTENT
   
   ;; serialization interface
   :WRITE-NODE
   :*NODE-LEVEL*
   :*VERBOSE-QNAMES*
   
   :ELEMENT-APPEND
   :ELEMENT-GET
   :ELEMENT-SET
   :EXPORT-NAMES
   :FIND-ATTRIBUTE
   :FIND-ELEMENT
   :FIND-ELEMENT-BY-ID
   :FIND-NAME
   :FIND-NAMESPACE
   :FIND-PREFIX
   :INTERN-NAME
   :INTERN-PREFIX
   :INTERN-TYPE
   :MAKE-NAME
   :MAKE-QNAME
   :NAME
   :NAMESPACE
   :CONTENT-NAME-TYPE-NAME
   :PARENT-COUNT

   :*CONSTANT-PREFIX-STRINGS*
   :*DEF-NULL-NAMESPACE-NODE*
   :*DEFAULT-NAMESPACE-ATTRIBUTE-NAME*
   :*DEFAULT-PREFIX-NAME*
   :*DEFAULT-NAMESPACES*
   :*DEFAULT-NAMESPACE*
   :*DOCUMENT*
   :*ELEMENT-COUNT*
   :*EMPTY-NAME*
   :*external-subset-cache*
   :*GENERATED-NS-BINDINGS*
   :*INPUT-SOURCE*
   :*MIXED-NAME*
   :*NAMESPACE-BINDINGS*
   :*NAMESPACE-DICTIONARY*
   :*NAMESPACE-MODE*
   :*NAMESPACE*
   :*NULL-NAME*
   :*NULL-NAMESPACE*
   :*NULL-NAMESPACE-NODE*
   :*OUTPUT-DESTINATION*
   :*UNBINDABLE-PREFIX-STRINGS*
   :*XHTML-NAMESPACE*
   :*XMLNS-NAMESPACE*
   :*XML-NAMESPACE*
   :*XML-PREFIX-NAMESTRING*
   :*XMLNS-PREFIX-NAMESTRING*
   :*WILD-NAMESPACE*
   :*WILD-NAMESTRING*
   :*WILD-PREFIX*
   :*XML-NAMESPACE-ATTRIBUTE-NAME*
   :*XML-NAMESPACE-NODE*
   :*XMLNS-NAMESPACE-ATTRIBUTE-NAME*
   :*XMLNS-NAMESPACE-NODE*
   :*XSD-NAMESPACE*
   :PREFIX-VALUE
   :NAMESPACE-PREFIX
   :call-with-namespace-bindings
   :with-namespace-bindings

   ;; qualified name resolution
   :*QNAME-EXTENT*
   :*DEF-TYPE-ID-QNAME-CONTEXTS*
   :*DEF-TYPE-MODEL-QNAME-CONTEXTS*
   :*DEF-ATTR-QNAME-CONTEXTS*
   :NEW-QNAME-EXTENT
   :QNAME-EXTENT
   :QNAME-EXTENT-EQUAL
   :*DISTINGUISH-QNAME-HOMOGRAPHS*
   :*CONFLATE-QNAME-SYNONYMS*
   :ACCUMULATE-QNAMES
   :ABSTRACT-NAME
   :UNAME
   :QNAME

   :VALUE-STRING
   :VALUE-NUMBER
   :VALUE-BOOLEAN
   :FIND-DEF-PARAMETER-ENTITY
   :FIND-DEF-GENERAL-ENTITY
   :FIND-DEF-ELEM-TYPE
   :FIND-DEF-NOTATION
   
   :IS-NAMECHARDATA
   :IS-NCNAME
   
   ;; utility functions
   *SPECIALIZE-ELEM-NODE*
   *SPECIALIZE-ATTR-NODE*
   :*TOKEN-PACKAGE*
   :*WILD-NAME*
   :*WILD-UNAME*
   :*LANG-NAME*
   :!-reader
   :WALK-NODE
   :XML-ERROR
   :XML-EOF-ERROR
   :DOCUMENT-MODEL-ERROR
   :INTERNAL-XML-ERROR
   :VALIDITY-CERROR
   :VALIDITY-CONDITION
   :NAMESPACE-ERROR
   :WELLFORMEDNESS-ERROR
   :WELLFORMEDNESS-CERROR
   :SIMPLE-XML-ERROR
   :INCOMPLETE-PARSE
   :PRINT-QNAME
   :PRINT-NS-NODE
   
   :COLLECT-NODE-BY-TYPE
   :MAP-NODE-BY-TYPE
   
   :COLLECT-ATTRIBUTE-DECLARATIONS
   :COLLECT-ATTRIBUTES
   :COLLECT-COMMENTS
   :COLLECT-COMMENTS-AND-PIS
   :COLLECT-DECLARATIONS
   :COLLECT-ELEMENT-DECLARATIONS
   :COLLECT-ELEMENT-PROPERTIES
   :COLLECT-ELEMENTS
   :COLLECT-GENERAL-ENTITIES
   :COLLECT-NAMESPACES
   :COLLECT-NOTATIONS
   :COLLECT-PARAMETER-ENTITIES
   :COLLECT-PIS
   
   :UNAME-EQUAL
   :QNAME-EQUAL
   :NODE-EQUAL
   :MAKE-DOCUMENT-NAMESPACE-BINDINGS
   :|content-model|
   :|\|-content|
   :|?-content|
   :|*-content|
   :|bounded-content|
   :|MIXED-content|
   :|+-content|
   :|content|
   :|,-content|
   :|content-name|
   :|type-name|
   :mixed-atn
   :element-atn
   
   ;; character classes
   :XML-CHAR?
   :XML-SPACE?
   :XML-IDEOGRAPHIC?
   :XML-BASECHAR?
   :XML-LETTER?
   :XML-DIGIT?
   :XML-COMBININGCHAR?
   :XML-EXTENDER?
   :XML-NAMECHAR?
   :XML-INITIAL-NAMECHAR?
   :XML-PUBIDCHAR?
   :XML-MARKUPCHAR?
   :XML-LATINALPHACHAR?
   :XML-LATINCHAR?
   :XML-LANGUAGEIDCHAR?
   :XML-VERSIONNUMCHAR?
   :XML-MODEL-OP-CHAR?
   :XML-SUCCESSOR-EOLCHAR?
   :XML-INITIAL-EOLCHAR?

   ;; graphs
   :WRITE-NODE-GRAPH
   :ENCODE-NODE-GRAPH
   :NODE-GRAPH-PROPERTIES
   :NODE-LINK-PROPERTIES

   ;; 0.950 compatibility
   :annotation-model
   :constant-prefix-p
   :direct-annotation-model
   :condition-name
   :condition-namespace
   :document
   :document-element
   :element-definition
   :element-p
   :general-entity-definition
   :id-attr-node-p
   :namespace-declaration
   :namespace-equal
   :parameter-entity-definition
   :type-definition
   :unbindable-prefix-p
   :with-namespaces
   :default-namespace
   :*default-prefix-string*
   :local-part-equal
   :valid
   :namespace-printname

   :|./*|
   :|.//*|
   :|.//|
   :|.//|-string
   :|./@|
   :|.//@|-string-equal
   :|./@|-string
   :|./@|-value
   :|./|
   :|./|-string
   :|./|-value
   :|..|
   :successor
   :successor-element

   :urn
   :urn-namespace
   :urn-string
   ))

(defpackage "xml" (:use)
  (:nicknames "http://www.w3.org/XML/1998/namespace")
  (:export " " "!=" "!=" "!==" "\"" "#FIXED" "#IMPLIED" "#PCDATA" "#REQUIRED"
           "$" "%" "&" "&#" "&#x" "'" "(" "()" ")" ")*" "*" "*:" "+" ","
           "-" "-->" "->" "." ".." "/" "//" "/>" ":" ":=" "::" ":*" ";" "<" "<!" "<!--"
           "<!ATTLIST" "<!DOCTYPE" "<!ELEMENT" "<!ENTITY" "<!NOTATION"
           "<![" "<![CDATA[" "</" "<=" "<?" "<?xml" "=" "==" ">" ">=" "?" "?>"
           "@" "AFTER" "ANY" "ASCENDING" "BEFORE" "CDATA" "DESCENDING" "EMPTY"
           "ENTITIES" "ENTITY" "ID" "IDREF" "IDREFS" "IGNORE" "INCLUDE"
           "NDATA" "NMTOKEN" "NMTOKENS" "NOT" "NOTATION" "PUBLIC" "SYSTEM"
           "[" "]" "]]>" "^"
           "ancestor" "ancestor-or-self" "and" "attribute"
           "child" "comment"
           "descendant" "descendant-or-self" "div" "document"
           "encoding" "following" "following-sibling"
           "id" "key" "lang"
           "mixed" "mod" "namespace" "no" "node" "not" "or"
           "parent" "preceding" "preceding-sibling" "processing-instruction"
           "root" "self" "standalone" "text" "union" "version" "xml" "yes"
           "{" "|" "}"
	   ;;; pre 20120414 this included the mac-encoded strik-thru-zero
	   )
  (:export
   "ANY-Constructor" "AttCharData-Constructor" "CDEnd-Constructor"
   "CDStart-Constructor" "CDataCharData-Constructor"
   "Cardinality-Constructor" "CharData-Constructor"
   "CommentCharData-Constructor" "DefaultAttCharData-Constructor"
   "Document-Parser" "EMPTY-Constructor" "EncNameCharData-Constructor"
   "EntityData-Constructor" "FIXED-Constructor" "HexNumber-Constructor"
   "IMPLIED-Constructor" "IS-ANY" "IS-AttCharData" "IS-CDataCharData"
   "IS-CharData" "IS-CommentCharData" "IS-DefaultAttCharData" "IS-EMPTY"
   "IS-EncNameCharData" "IS-EntityData" "IS-FIXED" "IS-HexNumber"
   "IS-IGNORE" "IS-IMPLIED" "IS-INCLUDE" "IS-IgnoreCData" "IS-NCName"
   "IS-NDATA" "IS-NOTATION" "IS-Number" "IS-PCDATA" "IS-PUBLIC"
   "IS-ParsedExtSubset" "IS-ParsedReference" "IS-PiCharData"
   "IS-PiTarget" "IS-PubidCharData" "IS-REQUIRED" "IS-S" "IS-SYSTEM"
   "IS-SystemCharData" "IS-VersionNumCharData" "IS-encoding"
   "IS-standalone" "IS-version" "IgnoreCData-Constructor"
   "NCName-Constructor" "Nmtoken-Constructor" "Number-Constructor"
   "ParsedExtSubset-Constructor" "ParsedReference-Constructor"
   "PiCharData-Constructor" "PiTarget-Constructor"
   "PubidCharData-Constructor" "QName-Constructor" "READER"
   "REQUIRED-Constructor" "StringType-Constructor"
   "SystemCharData-Constructor" "TokenizedType-Constructor"
   "VersionNumCharData-Constructor" "YesOrNo-Constructor"  
   ))

#| ISSUES

; compilation unit finished
;   Undefined functions:
;     |xml|:IS-ANY |xml|:IS-EMPTY |xml|:IS-FIXED |xml|:IS-IGNORE |xml|:IS-IMPLIED |xml|:IS-INCLUDE |xml|:IS-NDATA |xml|:IS-NOTATION |xml|:IS-PCDATA |xml|:IS-PUBLIC |xml|:IS-REQUIRED |xml|:IS-SYSTEM |xml|:|IS-encoding| |xml|:|IS-standalone| |xml|:|IS-version| |xml|:READER

... Where are those to be defined?

(apropos "IS-ANY")
^ note XML-PARSER::|IS-ANYToken| (fbound)
(apropos "IS-standalone")
^ note XML-PARSER::|IS-standaloneToken| (fbound)

|#

#| ISSUES

production not defined in system: XML-PARSER::|Document|: |xml|:|Document-Parser|.
   [Condition of type SIMPLE-ERROR]

Restarts:
 0: [RETRY] Retry SLIME REPL evaluation request.
 1: [*ABORT] Return to SLIME's top level.
 2: [ABORT] Abort thread (#<THREAD "repl-thread" RUNNING {1006B600B3}>)

Backtrace:
  0: (|xml|:|Document-Parser| #<XML-PARSER::XML-INPUT {100BA8F493}> :TRACE NIL :TRACE-NETS NIL :START-NAME XML-PARSER::|Document| :MODE :MULTIPLE :REDUCE T :REGISTER-WORDS NIL)
  1: ((:METHOD XML-PARSER:DOCUMENT-PARSER (STREAM)) #<XML-UTILS:VECTOR-INPUT-STREAM #(3C 66 6F 6F 20 62 61 72 3D 27 71 75 75 78 27 2F 3E)>) [fast-method]
  2: ((:METHOD XML-PARSER:DOCUMENT-PARSER (STRING)) "<foo bar='quux'/>") [fast-method]
  3: (SB-INT:SIMPLE-EVAL-IN-LEXENV (XML-PARSER:DOCUMENT-PARSER "<foo bar='quux'/>") #<NULL-LEXENV>)
  4: (EVAL (XML-PARSER:DOCUMENT-PARSER "<foo bar='quux'/>"))

|#

(defpackage :XML-PARSER
  (:nicknames :XMLP
              :de.setf.xml
              :de.setf.xml.interface
              :de.setf.xml.codec.implementation
              :de.setf.xml.process.implementation)
  (:use :BNFP
        ;; don't use ccl: leads to later problems loading other ccl utils #+CCL :ccl
        :COMMON-LISP :XQDM :XUTILS
        "xml")
  (:shadowing-import-from  ;; cf. "xml" package
   "xml" ;; ?? or #:xqdm ??
   "IS-IMPLIED"
   "IS-REQUIRED"
   "IS-FIXED"
   )
  (:shadowing-import-from  ;; cf. "xml" package
   #:cl
   #:|*|
   #:|+|
   #:NOT
   #:|<=|
   #:|-|
   #:|//|
   #:|/|
   #:|>|
   #:IGNORE
   #:|>=|
   #:|=|
   #:|<|)
  (:shadowing-import-from  ;; cf. "xml" package
   #:xqdm
   #:|..|
   #:NOTATION
   #:ENTITIES)
  (:shadowing-import-from   ;; cf. "xml" package
   #:de.setf.clifs
   #:SYSTEM)

#|
#+ISSUES - XML names not being exported ??

; compilation unit finished
;   Undefined functions:
;     |xml|::|ANY-Constructor| |xml|::|AttCharData-Constructor| |xml|::|CDEnd-Constructor| |xml|::|CDStart-Constructor| |xml|::|CDataCharData-Constructor| |xml|::|Cardinality-Constructor| |xml|::|CharData-Constructor| |xml|::|CommentCharData-Constructor| |xml|::|DefaultAttCharData-Constructor| XML-PARSER::|Document-Parser| |xml|::|EMPTY-Constructor| |xml|::|EncNameCharData-Constructor| |xml|::|EntityData-Constructor| |xml|::|FIXED-Constructor| |xml|::|HexNumber-Constructor| |xml|::|IMPLIED-Constructor| |xml|::IS-ANY |xml|::|IS-AttCharData| |xml|::|IS-CDataCharData| |xml|::|IS-CharData| |xml|::|IS-CommentCharData| |xml|::|IS-DefaultAttCharData| |xml|::IS-EMPTY |xml|::|IS-EncNameCharData| |xml|::|IS-EntityData| |xml|::IS-FIXED |xml|::|IS-HexNumber| |xml|::IS-IGNORE |xml|::IS-IMPLIED |xml|::IS-INCLUDE |xml|::|IS-IgnoreCData| |xml|::|IS-NCName| |xml|::IS-NDATA |xml|::IS-NOTATION |xml|::|IS-Number| |xml|::IS-PCDATA |xml|::IS-PUBLIC |xml|::|IS-ParsedExtSubset| |xml|::|IS-ParsedReference| |xml|::|IS-PiCharData| |xml|::|IS-PiTarget| |xml|::|IS-PubidCharData| |xml|::IS-REQUIRED |xml|::IS-S |xml|::IS-SYSTEM |xml|::|IS-SystemCharData| |xml|::|IS-VersionNumCharData| |xml|::|IS-encoding| |xml|::|IS-standalone| |xml|::|IS-version| |xml|::|IgnoreCData-Constructor| |xml|::|NCName-Constructor| |xml|::|Nmtoken-Constructor| |xml|::|Number-Constructor| |xml|::|ParsedExtSubset-Constructor| |xml|::|ParsedReference-Constructor| |xml|::|PiCharData-Constructor| |xml|::|PiTarget-Constructor| |xml|::|PubidCharData-Constructor| |xml|::|QName-Constructor| XML-PARSER::READER |xml|::|REQUIRED-Constructor| |xml|::|StringType-Constructor| |xml|::|SystemCharData-Constructor| |xml|::|TokenizedType-Constructor| |xml|::|VersionNumCharData-Constructor| |xml|::|YesOrNo-Constructor|
|#

  #+CCL (:shadowing-import-from :XQDM :TARGET)
  (:export
   :*CONSTRUCTION-CONTEXT*
   :*SPECIALIZE-ELEM-NODE*
   :*SPECIALIZE-ATTR-NODE*
   :*XML-VERSION*
   :|AttCharData-Constructor|
   :|Attribute-Constructor|
   :CALL-WITH-NAME-PROPERTIES
   :|CharData-Constructor|
   :|CDataCharData-Constructor|
   :|Comment-Constructor|
   :CONSTRUCT-ATTRIBUTE-NAME
   :CONSTRUCT-ATTRIBUTE-PLIST
   :CONSTRUCT-CONSTRUCTION-CONTEXT
   :CONSTRUCT-CONTENT-SEQUENCE
   :CONSTRUCT-ELEM-PROPERTY-NODE
   :CONSTRUCT-ELEMENT-NAME
   :CONSTRUCT-ELEMENT-NODE
   :CONSTRUCT-NS-NODE
   :CONSTRUCT-STRING-ATTR-NODE
   :|Content-Constructor|
   :|ContentSequence-Constructor|
   ;; the constructor method for attribute default values remains unexported
   ;; until specialization is implemented for the DTD as a whole...
   ;; :|DefaultAttCharData-Constructor|
   :def-pi-function
   :|Document-Constructor|
   :document-parser
   :|Element-Constructor|
   :encode-attribute-value
   :encode-char
   :encode-character-data
   :encode-comment
   :encode-escaped-format
   :encode-format
   :encode-node
   :encode-node-as
   :encode-string
   :encode-newline
   :encode-xml-declaration
   :encode-document-type
   :|ExtParsedEnt-Constructor|
   :|Pi-Constructor|
   :PI-FUNCTION
   :|PiCharData-Constructor|
   ;; :MAKE-NCNAME
   ;; :MAKE-UNAME
   :PARSE-EXTERNAL-ENTITY-DATA
   :PARSE-EXTERNAL-SOURCE
   :PARSE-EXTERNAL-SUBSET
   :PARSE-EXTERNAL-GENERAL-ENTITY
   :READ-EXTERNAL-ENTITY-DATA
   :|STag-Constructor|
   :WRITE-NODE
   :WRITER-STREAM
   :XML
   :*XML-WRITER-STREAM*
   :*XML-ESCAPED-WRITER-STREAM*
   :WITH-XML-WRITER

   ;; 0.950 compatibility
   :prefix-namespace
   )
  )

(defpackage :XML-PATH
  (:nicknames :XP)
  (:use :BNFP #+CCL :CCL :COMMON-LISP :XQDM :XUTILS)
  ;; the term 'step' is central to the standard so it is shadowed rather
  ;; than using an alternative.
  (:shadow :STEP)
  #+CCL (:shadowing-import-from :XQDM :TARGET)
  (:EXPORT
   :PATH :STEP :CONTEXT
   :PATH-ELEMENT :STEP-ELEMENT :STEP-GENERATOR :STEP-FILTER
   :ENUMERATING-STEP-GENERATOR :LIST-GENERATOR :AXIS-GENERATOR
   :MAP-NODES :NAME-TEST :NODE-SET :NODE-TEST :TYPE-TEST
   :TERM :IS-ABSOLUTE :STEPS :GENERATOR
   :TEST :PREDICATES :SOURCE :PREFIX :LOCAL-PART
   :STEP-GENERATOR-FUNCTION :STEP-PREDICATE-FUNCTION
   :LITERAL
   :NODE :LOCATION :SIZE :BINDINGS :VARIABLES :FUNCTIONS :NAMESPACES
   :EXPRESSION
   
   :*CLASS.PATH*
   :*CLASS.STEP*
   :*CLASS.CONTEXT*
   :*CLASS.CHILD*
   :*DOCUMENTS*
   )
  )

(defpackage :XML-QUERY
  (:nicknames :XQ)
  (:use :BNFP #+CCL :CCL :COMMON-LISP :XQDM :XUTILS)
  #+CCL (:shadowing-import-from :XQDM :TARGET)
  )


;;
;;
;; packages for implementing xml data modeling.
;; types from the datatype package appear in expression in the two algrbras. they are
;; exported, but not used/imported, as the customary expression uses the prefix.
;; the case distinctions distinguish grammatic meta-symbols which participate in special
;; forms from the names for functions and types, which conserve case.

;; package for xml query types
(defpackage :XML-SCHEMA-DATATYPES (:use) (:nicknames :XSD)
  (:export typep :typep-specialized
           "IS-anyComplexType" "IS-anySimpleType" "IS-anyTreeType" "IS-anyType"  "IS-anyURI"
           "IS-attribute" "IS-base64Binary" "IS-boolean" "IS-byte" "IS-comment" "IS-complex"
           "IS-date" "IS-dateTime"
           "IS-decimal" "IS-double" "IS-duration"
           "IS-element" "IS-ENTITY" "IS-ENTITIES" "IS-float"
           "IS-gDay" "IS-gMonth" "IS-gMonthDay" "IS-gYear"
           "IS-hexBinary" "IS-ID" "IS-IDREF" "IS-IDREFS"
           "IS-int" "IS-integer" "IS-language" "IS-long"
           "IS-Name" "IS-NCName" "IS-NMTOKEN" "IS-NMTOKENS"
           "IS-negativeInteger" "IS-nonNegativeInteger" "IS-nonPositiveInteger" "IS-normalizedString"
           "IS-NOTATION" "IS-pi" "IS-positiveInteger" "IS-scalar" "IS-short" "IS-simple"
           "IS-string" "IS-time" "IS-token" "IS-UName"
           "IS-unsignedByte" "IS-unsignedInt" "IS-unsignedLong" "IS-unsignedShort"
           
           :validate-string :validate-attribute :validate-name))

;; package for xml path "algebra" operators
(defpackage :XML-PATH-ALGEBRA (:use) (:nicknames :XPA)
  (:import-from "xml" "document")
  (:intern :APPLY-DESCENDANTS-PATH :APPLY-CHILD-PATH :APPLY-PATH
           :APPLY-PREDICATE-PATH :APPLY-STEP
           :EVAL :FUNCALL :LANGUAGE-EQUAL :NODES :VARIABLE
           :SYMBOL-FUNCTION :GENSYM)
  (:export
   ;; path components
   :PATH :STEP :UNAME
   :ID-STEP :KEY-STEP :PARENT-STEP :ROOT-STEP :SELF-STEP :WILD-INFERIOR-STEP
   :AXIS-GENERATOR :LIST-GENERATOR
   :ANCESTOR :ANCESTOR-OR-SELF :ATTRIBUTE :CHILD :DESCENDANT
   :DESCENDANT-OR-SELF :FOLLOWING :FOLLOWING-OR-SELF :FOLLOWING-SIBLING
   :ID :KEY
   :NAMESPACE :PARENT :PRECEDING :PRECEDING-SIBLING :ROOT :SELF
   :NAME-TEST :@NAME-TEST :TYPE-TEST :TYPE-NAME-TEST
   :PI-TEST :COMMENT-TEST :TEXT-TEST
   :PREDICATE
   ;; state variables
   :*CONTEXT-NODE* :*POSITION* :*COUNT*
   ;; library functions
   "and"
   "boolean"
   "ceiling" "contains" "count"
   "document"
   "false" "floor"
   "id"
   "last" "local-name" "lang"
   "mod"
   "name" "namespace-uri" "normalize-space" "not"  "number"
   "or"
   "position"
   "round"
   "starts-with" "string" "substring"
   "substring-after" "substring-before"
   "string-length" "sum" 
   "translate" "true"
   "union"
   "+" "-" "*" "/" "<" "<=" ">" ">=" "=" "!="
   "NaN" "0+" "0-" "infinity+" "infinity-"
   ))

;; package for xml query algebra operators
(defpackage :XML-QUERY-ALGEBRA (:use) (:nicknames :XQA)
  (:import-from :XPA
                "and"
                "boolean"
                "ceiling" "contains" "count"
                "document"
                "false" "floor"
                "id"
                "last" "local-name" "lang"
                "mod"
                "name" "namespace-uri" "normalize-space" "not"  "number"
                "or"
                "position"
                "round"
                "starts-with" "string" "substring"
                "substring-after" "substring-before"
                "string-length" "sum" 
                "translate" "true"
                "union"
                ;; these are not imported "<" "<=" ">" ">=" "="
                ;; as the comparison differs
                "+" "-" "*" "/" "!="
                "NaN" "0+" "0-" "infinity+" "infinity-"
                "GENSYM")
  (:export  :if :let :else :for :match :case :where
            :type :fun :query
            :and :or :not :div :mod :schema
            "+" "-" "*" "<" "<=" ">" ">=" "=" "==" "!=" "!=="
            "//" "/" "." "|"
            :defun
            :attribute :element
            :make-ncname :make-tname :make-uname
            :sequence :union :difference :intersection :sort
            :error :instanceof :before :after
            :typep :type :sort
            :type-ref :id-test :typep :range-test
            ;; xpath algebra symbols
            "and"
            "boolean"
            "cdata" "ceiling" "contains" "count"
            "document"
            "false" "floor"
            "id"
            "last" "local-name" "lang"
            "mod"
            "name" "namespace-uri" "normalize-space" "not"  "number"
            "or"
            "position"
            "round"
            "starts-with" "string" "substring"
            "substring-after" "substring-before"
            "string-length" "sum" 
            "translate" "true"
            "union"
            "NaN" "0+" "0-" "infinity+" "infinity-"
            ;; xml query algebra specific
            "avg"
            "bagtolist"
            "data" "difference" "distinct_nodes" "distinct_value"
            "comment" "Comment" "deref" 
            "except"
            "index" "intersection"
            "listtobag" "localname"
            "max" "min"
            "namespace" "nodes"
            "parent" "processing_instruction"
            "ref"
            "sequence" "sort"
            "target"
            "value"
            
            
            "empty"
            "=="))

(defpackage "$" (:use))

(defpackage :xml-query-language (:use) (:nicknames :XQL)
  (:import-from :xpa
                "and"
                "boolean"
                "ceiling" "contains" "count"
                "document"
                "false" "floor"
                "id"
                "last" "local-name" "lang"
                "mod"
                "name" "namespace-uri" "normalize-space" "not"  "number"
                "or"
                "position"
                "round"
                "starts-with" "string" "substring"
                "substring-after" "substring-before"
                "string-length" "sum"  
                "translate" "true"
                "union"
                "+" "-" "*" "/" "!="
                "NaN" "0+" "0-" "infinity+" "infinity-")
  (:import-from :xqa
                "<" "<=" ">" ">=" "=")
  (:export "ELEMENT" "ATTRIBUTE" "CAST" "TREAT" "INTERSECT" "EXCEPT"
           "INSTANCEOF" "SOME" "EVERY" "FUNCTION"
           "FUNCALL"  "NAMESPACE-DECL" "QNAME"  "SCHEMA-DECL"
           "ID-PATH" "ATTRIBUTE-PATH" "TYPE-PATH" "ELEMENT-PATH"
           "RANGE" "/" "//" "*" "STEP" "TYPE"
           ;; xpath algebra symbols
           "and"
           "boolean"
           "ceiling" "contains" "count"
           "document"
           "false" "floor"
           "id"
           "last" "local-name" "lang"
           "mod"
           "name" "namespace-uri" "normalize-space" "not"  "number"
           "or"
           "position"
           "round"
           "starts-with" "string" "substring"
           "substring-after" "substring-before"
           "string-length" "sum" 
           "translate" "true"
           "union"
           "+" "-" "*" "/" "<" "<=" ">" ">=" "=" "!="
           "NaN" "0+" "0-" "infinity+" "infinity-"
           ;; xquery language library 
           "comment" "date" "distinct"
           "empty" "equal" "filter" "last"
           "name" "number" "pi" "union"))


;; additions for cl-http tokenizer
(unless (find :cl-http *features*)
  (defpackage :WWW-UTILS
    (:use common-lisp)
    (:export :with-fast-array-references :make-lock :with-lock-held)))

(unless (find :cl-http *features*)
  (defpackage :tk1
    (:use common-lisp)
    (:import-from :www-utils :with-fast-array-references :make-lock :with-lock-held)
    (:export
     :*default-tokenizer-size*
     :clear-tokenizer
     :create-tokenizer
     :define-tokenizer
     :describe-tokenizer
     :find-tokenizer-named
     :get-token
     :insert-token
     :map-tokens
     :rehash-tokenizer
     :remove-token
     :tokenize
     :undefine-tokenizer)))

(unless (find :cl-http *features*)
  (defpackage :http
    (:export :*standard-character-type*)))

:EOF


