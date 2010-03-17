;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  parameter and type definitions for the xml query data model and parser
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010318' AUTHOR='JAA'> collected into one file</DELTA>
  <DELTA DATE='20010501' >factored out separate file for XML parser</DELTA>
  <DELTA DATE='20010530' VERSION='0.905'>
   first combined version with xpath/xquery</DELTA>
  <DELTA DATE='20010611' VERSION='0.909'> added |VC: No Duplicate Tokens|</DELTA>
  <DELTA DATE='20010622'>
   reader adjustments on null symbol names for personal lispworks</DELTA>
  <DELTA DATE='20010629'>parameters for incrementation qname interning</DELTA>
  <DELTA DATE='20010702'>differentiated qname contexts</DELTA>
  <DELTA DATE='20010703'>attribute names for static namespaces</DELTA>
  <DELTA DATE='20010714'>namespace/package distinction</DELTA>
  <DELTA DATE='20010720' VERSION='0.910'>clos namespaces</DELTA>
  <DELTA DATE='20010805'>*namespaces -> *namespace-bindings*</DELTA>
  <DELTA DATE='20010910'><code>nameset-tokenizer</code> namespaces</DELTA>
  <DELTA DATE='20010909'><code>*def-null-namespace-node*</code> and
   <code>*null-namespace-node*</code></DELTA>
  <DELTA DATE='20010910' VERSION='0.912'>tokenizers</DELTA>
  <DELTA DATE='20010914'>ns-nodes for xmlns and xml namespace</DELTA>
  <DELTA DATE='20010915' VERSION='0.913'/>
  <DELTA DATE='20010917' VERSION='0.914'>0.912+lw/allegro tests</DELTA>
  <DELTA DATE='20010918' VERSION='0.915'>first-level tokenization</DELTA>
  <DELTA DATE='20011219'>*generated-ns-bindings*; *xsd-namespace*</DELTA>
  <DELTA DATE='20020120' VERSION='0.918'>lispworks and allegro parity</DELTA>
  <DELTA DATE='20030328' VERSION='0.949'>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XQDM")

;; see the defConstructor macro for class parameters generation

(defParameter *version* "0.949")

(defParameter *conflate-qname-synonyms*
  "specifies whether to conflate qnames with different literal forms. based on
   namespace bindings. default <code>T</code>")
(defParameter *def-type-id-qname-contexts* nil
  "binds accumulated qname contexts for a given document.")

(defParameter *def-type-model-qname-contexts* nil
  "binds accumulated qname contexts for a given document.")

(defParameter *def-attr-qname-contexts* nil
  "binds accumulated qname contexts for a given document.")

(defParameter *def-null-namespace-node* nil
  "binds a prototype definition to be used in document types which include no
   binding for the null namespace.")

(defParameter *default-namespaces* nil
  "designates the initial bindings for the xml, xmlns, and default namespaces.")

(defParameter *default-prefix-string* "")

(defParameter *distinguish-qname-homographs* t
  "specifies whether to distinguish qnames with identical literal forms based on
   namespace bindings. default <code>T</code>")

(defParameter *document* nil
  "acts as the default context for document-scoped nodes and operations.
   a parser binds it to the 'document-in-progress'.")

(defParameter *element-count* nil
  "incremented during a parse to count the element position in a document")

(defparameter *external-subset-cache* (make-hash-table :test 'equalp)
  "Serves as a cache for parsed external subsets (eg. dtd instances),
 keyed by public id string. To dispable bind to NIL. See |DoctypeDecl-Constructor|.")

(defParameter *input-source* nil
  "binds the current input source for xml processing.
   asserted by the respective parser.
   referenced by condition report functions to indicate state in case of errors.")

(defParameter *generated-ns-bindings* nil
  "binds additional prefix/namespace bindings generated locally while serializing
   a given element.")

(defParameter *namespace-bindings* nil
  "designates the visible namespace bindings. exists only while parsing the document entity.
   remains <code>NIL</code> in the dtd since universal name resolution is deferred there.")

(defParameter *null-namespace-node* nil
  "binds a prototype definition to be used in document types which include no
   binding for the null namespace.")

(defParameter *output-destination* nil
  "binds the current input destination for xml processing.
   asserted and referenced by the xml encoding methods.")

(defVar *specialize-elem-node* nil
  "specifies whether the parser should attempt to specialize elem-node
   instances based on the element's generic identifier.")

(defVar *specialize-attr-node* nil
  "specifies whether the parser should attempt to specialize attr-node
   instances based on the element's generic identifier.")

(defParameter *verbose-qnames* nil
  "controls tracing for the qname -> uname resolution process.")

(defParameter *wild-namestring* "*")

(defParameter *wild-namespace* (find-namespace *wild-namestring*)
  "comprises identifiers in paths which designate a wildcard for the namespace.")

(defParameter *xml-namespace-node* nil)

(defParameter *xml-prefix-namestring* "xml")

(defParameter *xmlns-namespace-node* nil)

(defParameter *xmlns-prefix-namestring* "xmlns"
  "where 'xmlns' appears as the prefix for the qualified name of an element property,
   the property denotes a namespace binding rather than an attribute.")

(defParameter *trace-qname-resolution* nil
  "when non-null (default nil) traance information is printed during dtd qname resolution.")

(defparameter *NULL-NAMESPACE-NAME* "")
(defParameter *DEFAULT-NAMESPACE-IS-VISIBLE* t)
(defparameter *XML-PREFIX-STRING* "xml")
(defParameter *XMLNS-PREFIX-STRING* "xmlns")
(defParameter *XMLNS-namespace-name* "xmlns")
(defparameter *XML-NAMESPACE-NAME* "xml")
(defparameter *default-namespace* nil)

;; static namespaces

(defParameter *null-namespace* (find-namespace "")
  "serves as the namespace for unprefixed identifiers absent a default namespace
   binding. also comprises interned NCNames (which are expressed as
   <code>||:<it>NCName</it></code>).")
(defParameter *namespace* *null-namespace*
  "serves as the contained for symbols when not interpreting qualified names.
   may be bound to <code>NIL</code> to leave names as uninterned strings.")
(defParameter *xhtml-namespace* (find-namespace "xhtml")
  "the namespace for xhtml.")
(defParameter *xmlns-namespace* (find-namespace "xmlns")
  "comprises namespace node identifiers.")
(defParameter *xml-namespace* (find-namespace "xml")
  "comprises tokens for the metasymbols of xml itself.")
(defParameter *xsd-namespace* (find-namespace "xsd")
  "comprises tokens for the schema datatypes.")


;; static names

(defParameter *empty-name* (intern-name "()" *xml-namespace*))
(defParameter *mixed-name* (intern-name "mixed" *xml-namespace*))
(defParameter *lang-name* (intern-name "lang" *xml-namespace*))
(defParameter *null-name* (intern-name "" *null-namespace*))
(defParameter *default-namespace-attribute-name* (intern-name "" *xmlns-namespace*)
  "designates the default namespace for namespace nodes.")
(defParameter *xml-namespace-attribute-name* (intern-name *xml-prefix-namestring* *xmlns-namespace*)
  "designates the default namespace for namespace nodes.")
(defParameter *xmlns-namespace-attribute-name* (intern-name *xmlns-prefix-namestring* *xmlns-namespace*)
  "designates the default namespace for namespace nodes.")
(defParameter *wild-name* (intern-name *wild-namestring* *xml-namespace*))
(defParameter *wild-prefix* (intern-name *wild-namestring* *xmlns-namespace*))
(defParameter *wild-uname* (intern-name *wild-namestring* *wild-namespace*))
(defParameter *default-prefix-name* (intern-name *default-prefix-string* *xmlns-namespace*)
  "designates the default namespace for namespace nodes.")


;; initial state

(setq *default-namespaces*
      `(;; (|xmlns|:|| . ,*null-namespace*)
        ;; don't bind the null namespace by default.
        ;; a binding would complicate looking for type definitions for unprefixed element ids
        (,(local-part *xmlns-namespace-attribute-name*) . ,*xmlns-namespace*)
        (,(local-part *xml-namespace-attribute-name*) . ,*xml-namespace*)))


:EOF
