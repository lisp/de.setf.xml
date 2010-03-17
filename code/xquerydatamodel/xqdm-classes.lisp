;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  these classes implement an XML query data model
  (<a href='WD-query-datamod-20010215%20.html'>XQDM</a>) conformant XML document model.
  the interface is consistent with the XML infoset
  (<a href='WD-xml-infoset-20010202.html'>XMLI</a>).
  this includes support for all node types and an
  interface which adopt analogous accessor names. 
  <p>
  where differences exist between the infoset and the query data model the implementation
  follows XQDM, because the latter
   <ul>
   <li>includes the type information,</li>
   <li>permits a wider range of attribute and element content, whereby
    the parsing and serialization ensure that the xml standard's constraints
    are upheld for serial forms.</li>
   </ul>
   </p><p>
   the model varies from the standards in several respects:
   <ul>
    <li>the <code>NaR</code> distinguished value is represented with
     <code>NIL</code>. the context of use is sufficient to distinguish
     between an empty list and an absent atom.</li>
    <li>the <code>StringValue</code> <code>valueNode</code> is modeled as a string.
     as for the remaining types, a class is provided, but the parser produces strings.</li>
    <li>numerous information items are retained as distinguished nodes
     rather than masking them as opaque nodes. this includes entities and entity
     references. the attribute and element node accessors conform to the spec in that they
     combine content to produce the required value.
     this makes it easier to represent the literal encoding in a single model.
     the parser, on the other hand, always expands entity references.
     </li>
    <li>cdata and entity markers are not supported. the respective content is
     instead encapsulated in a reified instance, either directly - as for cdata,
     or indirectly - as for an entity reference.</li>
    </ul>
   </p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='19990000' AUTHOR='JAA'>
   this started as a minimal xml document model. to wit, from the original description:
   <quote>
    this is an absolutely minimal and nonconforming xml processor.
    it reads the main document entity, skipping all processing
    instructions, declarations, and definitions. it returns only the
    single element in the document. it recognizes entities for <![CDATA[<>&]]>
    and translates them on input and output. no other entites are
    supported.
    </quote></DELTA>
  <DELTA DATE='19990209' AUTHOR='JAA'>
   jaa added attribute support
   </DELTA>
  <DELTA DATE='20010223' AUTHOR='JAA'>
   comments, processing instructions and reified attributes
   </DELTA>
  <DELTA DATE='20010226' AUTHOR='JAA'>
   changed names to symbols to support namespaces
   </DELTA><DELTA DATE='20010301' AUTHOR='JAA'>
    interface and classes changed to align with the query data model
   </DELTA>
  <DELTA DATE='20010308' AUTHOR='JAA'>
   incorporated accessors and accommodated properties from the infoset.
   note that
   <ul>
   <li>no entity start or end nodes are modeled</li>
   <li>the URI handling is incomplete.</li></ul></DELTA>
  <DELTA DATE='20010412' AUTHOR='JAA'>
   eliminated teh attribute slot from doc-node.</DELTA>
  <DELTA DATE='20010501' AUTHOR='JAA'>
   factored out xml-encoding specific classes.</DELTA>
  <DELTA DATE='20010520'>clone/copy-node to accept overriding initargs</DELTA>
  <DELTA DATE='20010530'>
   REF-ENTITY needs to be a NAMED-NODE, in order to bind the target name</DELTA>
  <DELTA DATE='20010604'>
   model traversal moved her from xqdm-qnames</DELTA>
  <DELTA DATE='20010605' AUTHOR='MS'>lispworks conformance</DELTA>
  <DELTA DATE='20010611'> added |VC: No Duplicate Tokens|</DELTA>
  <DELTA DATE='20010622'> reader adjustments on null symbol names</DELTA>
  <DELTA DATE='20010625' AUTHOR='RLF'>fixed arguments in FIRST-MODEL-NAME</DELTA>
  <DELTA DATE='20010625'>
   adjustments to print-object for *-model for PCDATA
   <br />
   eliminated <code>VALUE</code> speciaization for <code>NS-NODE</code></DELTA>
  <DELTA DATE='20010626'>eliminated <code>ABSTRACT-NODE</code> from <code>ORDINAL-NODE</code>
   in order to reduce the implementation of <code>ABSTRACT-ELEM-NODE</code>, which thereby now
   prescribes <code>ORDINAL</code> and <code>DOCUMENT</code> slots only.
   changed <code>*CLASS.*</code> parameters to bind classes rather than names
   </DELTA>
  <DELTA DATE='20010703'>added attribute initargs to def-type-qname-context</DELTA>
  <DELTA DATE='20010803'>added def-type.node-validator reader</DELTA>
  <DELTA DATE='20010816'>additions for schema types</DELTA>
  <DELTA DATE='20010906'>updated print-object methods for name instances</DELTA>
  <DELTA DATE='20010914'>ns-nodes for xml and xmlns namespace bindings</DELTA>
  <DELTA DATE='20011010'>duration-scoped-nodes</DELTA>
  <DELTA DATE='20011230'>added value alternative to print-object for general entity defs</DELTA>
  <DELTA DATE='20020116'>names for nameset-tokenizers now accessed with name method</DELTA>
  <DELTA DATE='20020117'>correction to print-object (def-element-type)</DELTA>
  <DELTA DATE"'20030320'>conditions consistent with 0.950</DELTA>
  <DELTA DATE='20030805'>correction to type specified for name slot in named</DELTA>
  <DELTA DATE='20030816'>clisp:
    reordered class definitions to avoid forward references;
    avoided method-combinations
    </DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-QUERY-DATA-MODEL")


;;
;;
;; classes

;; abstract

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defClass abstract-class (standard-class) ()
    #+clisp(:metaclass structure-class))
  (defMethod validate-superclass
             ((class abstract-class) (superclass standard-class))
    t)
  (defMethod validate-superclass
             ((class standard-class) (superclass abstract-class))
    t)
  )
(defMethod make-instance ((class abstract-class) &key)
  (xml-error "instantiation precluded for class: ~s." class))

(defClass abstract-node ()
  ((parent :initform nil :initarg :parent :accessor parent
           :type (or abstract-node null))
   (children :initarg :children :accessor children))
  (:metaclass abstract-class)
  (:documentation
   "an <code>ABSTRACT-NODE</code> constitutes the generic form of all instances
    in a document model and its definition. it comprises the one-many graph
    relation intrinsic to the document model. it stipulates this structure for
    all nodes. this even for nodes like <code>DOC-NODE</code> and
    <code>ATTR-NODE</code>, which maintain a relation to a dominant node, even
    though they do not have <em>parents</em> according to the DOM
    specifications."))

(defClass abstract-value-node (abstract-node)
  ((value :initarg :value))
  (:metaclass abstract-class)
  (:documentation
   "an <code>ABSTRACT-VALUE-NODE</code> encapsulates a datum in a node so that it can be
    integrated into the document graph. a value which may well be modeled with
    an atom (eg. a number or a string) still has children, to collect the
    raw parsed form as its children and to permit complex representations for
    serialization.
    the specializations include both direct encapsulations and more complex, annotated values,
    such as type and entity definitions, element properties, and entity information."))

(defClass named (abstract-node)
  ((name :initform *null-name* :initarg :name :accessor name
         :type name))
  (:metaclass abstract-class))

(defClass named-node (named) () (:metaclass abstract-class))
(defClass unamed (named) () (:metaclass abstract-class))
(defClass unamed-node (unamed named-node) () (:metaclass abstract-class))
(defClass ncnamed (named) () (:metaclass abstract-class))
(defClass ncnamed-node (ncnamed named-node) () (:metaclass abstract-class))

(defClass typed-node (abstract-node)
  ((def :initform nil :initarg :def :accessor def
         :type (or null abstract-def-type)))
  (:metaclass abstract-class)
  (:documentation
   "an abstract class which introduces a definition property for an instance."))

(defClass document-scoped-node ()
  ((document :initform nil :initarg :document :accessor document))
  (:metaclass abstract-class)
  (:documentation
   "mixin form for classes which exist relative to a document.
    nb. it makes no provisions for graph relations."))

(defClass duration-scoped-node ()
  ((ephemeral :initform nil :initarg :ephemeral
              :reader is-ephemeral :writer (setf ephemeral)
              :documentation
              "ranges over T, NIL to specify whether to include the node when serializing."))
  (:metaclass abstract-class)
  (:documentation
   "mixin class to record whether a node should be included in serialized documents.
    in particular, generated namespaces are not serialized by default."))


(defClass ordinal-node ()
  ((ordinality :initform 0 :initarg :ordinality :type (or fixnum null) :accessor ordinality))
  (:metaclass abstract-class)
  (:documentation
   "a mixin form which binds a position in a global order.
   this is used to cache the original document order for elements and the local order
   for references. nb. it makes no provisions for graph relations."))

(defClass document () ()
  (:documentation "added for compatibility with 0.950 conditions"))

(defClass doc-node-interface (document)
  ()
  (:metaclass abstract-class)
  (:documentation
   "a mixin marker to indicate that the class implements the minimal document node interface
    required for serialization:
    (root children encoding entity-info general-entities notations parameter-entities standalone
     types version)."))

(defClass elem-node-interface ()
  ()
  (:metaclass abstract-class)
  (:documentation
   "a marker mixin to indicate that the class implements the minimal element node interface
    required for serialization:
    (name parent children attributes namespaces)."))

(defClass elem-property-node-interface ()
  ()
  (:metaclass abstract-class)
  (:documentation
   "a marker mixin to indicate that the class implements the minimal element property interface
    required for serialization:
    (name children)."))


(defClass entity-information-node (ncnamed-node abstract-value-node)
  ((uri :initform nil :initarg :uri :accessor uri
        :documentation
        "for the document entity, this binds the explicit uri.
         for external references, it binds the instance form of the system-id.
         this is generated by resolving the system-id relative to the containing entity.
         it could also be generated from th epublic id.")
   (system-id :initform nil :initarg :system-id :accessor system-id)
   (public-id :initform nil :initarg :public-id :accessor public-id)
   (encoding :initform nil :initarg :encoding :initarg :encoding-decl
             :reader encoding)
   (version :initform nil :initarg :version :initarg :version-info
            :accessor version)))

(defClass entity-delegate ()
  ((entity-info :initform nil :initarg :entity-info :writer (setf entity-info)
           :type (or entity-information-node null)))
  (:metaclass abstract-class)
  (:documentation
   "an abstract root for classes which implement references to external entities "))

(defClass attr-child-node ()
  ()
  (:metaclass abstract-class)
  (:documentation "marker mixin for classes allowed among attributes' children"))

(defClass elem-child-node (document-scoped-node)
  ()
  (:metaclass abstract-class)
  (:documentation "marker mixin for classes allowed among elements' children"))

(defClass doc-child-node (elem-child-node document-scoped-node)
  ()
  (:metaclass abstract-class)
  (:documentation "marker mixin for classes allowed at the document top-level"))

(defClass document-definition-child-object () ()
  (:documentation "added for compatibility with 0.950 conditions"))

(defClass doctype-child-node (document-scoped-node document-definition-child-object)
  ()
  (:metaclass abstract-class)
  (:documentation "marker mixin for classes permitted in the dtd."))

(defClass abstract-elem-property-node (document-scoped-node elem-property-node-interface)
  ()
  (:metaclass abstract-class)
  (:documentation
   "a marker mixin for concrete element properties (attributes and ns-nodes)
    and respective reference nodes."))

(defClass annotation () () (:documentation "added for compatibility with 0.950"))
(defClass annotation-node (annotation) () (:documentation "added for compatibility with 0.950"))
(defClass elem-property-node (unamed-node abstract-value-node abstract-elem-property-node
                                          typed-node annotation-node)
  ((value :initform nil))
  (:metaclass abstract-class)
  (:documentation
   "an abstract class for values which are bound to an element as properties or annotations.
    these include attributes and namespaces."))

(defClass value-node (abstract-value-node)
  ((value :initform nil))
  (:metaclass abstract-class)
  (:documentation
   "an abstract class for value nodes which provide a default <code>NULL</code> value."))

(defClass named-value-node (ncnamed-node value-node)
  ()
  (:metaclass abstract-class)
  (:documentation
   "the abstract root for classes which combine a name and a value property."))

(defClass abstract-def-node (named-node)
  ()
  (:metaclass abstract-class)
  (:documentation
   "the abstract class for model nodes which binds the definition of an attribute, element,
    notation, or entity."))

(defClass abstract-def-type (abstract-def-node)
  ()
  (:metaclass abstract-class)
  (:documentation
   "the abstract class of type definitions: attributes, elements, primitive types"))

(defClass abstract-top-level-def-node (abstract-def-node doctype-child-node)
  ()
  (:metaclass abstract-class)
  (:documentation
   "a marker mixin to indicate that the node is permitted as a top-level definition
    in a document type definition."))

;; concrete

(defClass doc-node (entity-delegate abstract-node doc-node-interface)
  ((root :initform nil :initarg :root :accessor root :accessor element
         :type (or abstract-elem-node null)
         :documentation
         "binds the root element of the document.
          this is also called the <em>document element</em>.
          it is <em>not</em> the <em>document root</em> - that is the doc-node itself.")
   (standalone  :accessor standalone :initarg :standalone :initarg :sddecl
                :initform t
                :documentation
                "indicates that an external subset is required to properly decode a document.
                 the value is ignored by the parser, but it should be set correctly to enable
                 valid serialization. default is <code>T</code>.")
   (version :accessor version :initarg :version :initarg :version-info
            :initform nil)
   (notations  :accessor notations
               :initform (make-hash-table) :type hash-table)
   (ids  :accessor ids
         :initform (make-hash-table) :type hash-table)
   (general-entities :accessor general-entities
                     :initform (make-hash-table) :type hash-table)
   (parameter-entities  :initarg :parameter-entities :accessor parameter-entities
                        :initform (make-hash-table) :type hash-table)
   (types :accessor types
          :initform (make-hash-table) :type hash-table)
   (attributes :initform nil :accessor attributes
          :type list :documentation
          "binds attlist definition instances. these are present for documentation
           purposes only: the effective definitions are integrated in the element
           type definitions.")
   (validate :initform nil :initarg :validate :accessor validate?)
   (namespaces :initform nil :initarg :namespaces :accessor namespaces
               :documentation
               "bind the set of namespaces present within the document.")))

(defun document-element (document) (root document))
(defun (setf document-element) (element document) (setf (root document) element))


(defClass document-type-declaration-information-node (entity-information-node document-scoped-node)
  ())

(defClass abstract-elem-node (typed-node ordinal-node doc-child-node elem-node-interface)
  ((ordinality :initform (when *element-count* (incf *element-count*))))
  (:metaclass abstract-class)
  (:documentation
   "the abstract form for element nodes.
    extends the <code>elem-node-interface</code> to provide slots for ordinality and document.
    the graph interface (name parent children attributes namespaces) remains to be implemented
    by specializers."))

(defClass elem-node (unamed-node abstract-elem-node)
  ((children :initform nil :type list)
   (attributes :initform nil :initarg :attributes :accessor attributes
               :type list)
   (namespaces :initform nil :initarg :namespaces :accessor namespaces
               :type list)
   (valid)))

(defClass ref-node (abstract-value-node ordinal-node)
  ())

(defClass ref-elem-node (ref-node abstract-elem-node) ())

(defClass ext-subset-node (entity-delegate abstract-node)
  ((children :initform nil :initarg :defs :accessor defs)))

(defClass abstract-attr-node () () (:metaclass abstract-class))

(defClass attribute-node () () (:documentation "added for compatibility with 0.950"))
(defClass attr-node (elem-property-node abstract-attr-node attribute-node)
  ()
  (:metaclass abstract-class))

(defClass normalizing-attr-node (attr-node)
  ()
  (:metaclass abstract-class))
(defClass trimming-attr-node (attr-node)
  ()
  (:metaclass abstract-class))

(defClass namespace-declaration () ()
  (:documentation "added for compatibility with 0.950 conditions"))

(defClass abstract-ns-node (namespace-declaration) () (:metaclass abstract-class))

(defClass nsdecl-node () ()
  (:documentation "for 0.950 compatibility"))
(defClass ns-node (elem-property-node abstract-ns-node duration-scoped-node nsdecl-node)
  ((name  :initarg :prefix :reader prefix)
   (children :initform nil)
   (value :initform nil :initarg :uri :initarg :namespace-name)
   (namespace :initform nil :initarg :namespace :reader namespace)))

(defClass ref-elem-property-node (ref-node abstract-elem-property-node) ())
(defClass ref-attr-node (ref-elem-property-node abstract-attr-node) ())
(defClass ref-ns-node (ref-elem-property-node abstract-ns-node) ())

(defClass decimal-attr-node (attr-node) () )
(defClass double-attr-node (attr-node) () )
(defClass entity-attr-node (trimming-attr-node) () )
(defClass entities-attr-node (attr-node) () )
(defClass enumerated-attr-node (trimming-attr-node)
  ()
  (:metaclass abstract-class))
(defClass id-attr-node (trimming-attr-node) () )
(defClass id-ref-attr-node (trimming-attr-node) () )
(defClass id-refs-attr-node (attr-node) () )
(defClass nmtoken-attr-node (trimming-attr-node) () )
(defClass nmtokens-attr-node (attr-node) () )
(defClass notation-attr-node (enumerated-attr-node) () )
(defClass qname-attr-node (attr-node) () )
(defClass recur-dur-attr-node (attr-node) () )
(defClass string-attr-node (normalizing-attr-node) () )
(defClass time-attr-node (attr-node) () )
(defClass uri-ref-attr-node (attr-node) () )
(defclass enumeration-attr-node (enumerated-attr-node string-attr-node) () )


(defClass pi-node (named-node abstract-value-node doc-child-node doctype-child-node)
  ((value :initform nil)
   (name :initarg :target :accessor target))
  (:documentation
   "a processing instruction binds a </it>target name</it> and a string value.
    the value should not include the sequence '?>', but that it not enforced."))

(defClass comment-node (abstract-value-node doc-child-node doctype-child-node)
  ())

(defClass character-data-node (abstract-value-node doc-child-node)
  ())

(defClass info-item-node (abstract-node)
  ())

(defClass number-value (value-node elem-child-node attr-child-node) ()
  (:metaclass abstract-class))
(defClass binary-value (value-node elem-child-node attr-child-node) ())
(defClass bool-value (value-node elem-child-node attr-child-node) ())
(defClass decimal-value (number-value) ())
(defClass double-value (number-value) ())
(defClass entity-value (value-node attr-child-node) ())
(defClass float-value (number-value) ())
(defClass function-value (named-value-node)
  ((value :initarg :expression :reader expression)))
(defClass id-value (value-node attr-child-node) ())
(defClass id-ref-value (value-node attr-child-node) ())
(defClass notation-value (value-node attr-child-node) ())
(defClass qname-value (named-value-node attr-child-node)
  ((name :initarg :local-part :reader local-part)
   (value :initform nil :reader qname
          :documentation "binds the universal name symbol")
   (prefix :initform nil :initarg :prefix :reader prefix)
   (uri :initform nil :initarg :uri :reader uri)
   (namespace :initform nil :initarg :namespace :reader namespace)))
(defClass recur-dur-value (value-node elem-child-node attr-child-node) ())
(defClass string-value (value-node elem-child-node attr-child-node) ())
(defClass time-dur-value (value-node elem-child-node attr-child-node) ())
(defClass uri-ref-value (named-value-node elem-child-node attr-child-node) ()
  (:documentation "wrap an uri instance with an appropriately typed node."))


(defClass qname-context-delegate ()
  ((qname-context :accessor qname-context :initform nil
                  :documentation "binds a context to collect and resolve qualified names."))
  (:metaclass abstract-class)
  (:documentation
   "augments definitions which collect qualified names."))

(defClass element-definition () ()
  (:documentation "added for compatibility with 0.950 conditions"))
(defClass element-type-definition () ()
  (:documentation "added for compatibility with 0.950 conditions"))
(defClass doctype-element-definition (element-definition element-type-definition) ()
  (:documentation "added for compatibility with 0.950 conditions"))

(defClass def-elem-type (doctype-element-definition
                         unamed-node abstract-def-type abstract-top-level-def-node
                         qname-context-delegate abstract-value-node
                         )
  ((value :initform nil :reader node-validator
          :documentation "binds the compiled validator")
   (children :initarg :model :accessor model :initform nil
             :documentation "binds the bnf content model")
   ;; (type :initarg :type :reader type)
   (node-class :initform nil :initarg :node-class
          :documentation "binds the class used to instantiate element nodes of this type")
   (properties :initform nil :initarg :properties :accessor properties)
   (props-required :initform nil
                   :documentation
                   "a bit-mirror for definitions in properties where =1 implies required")
   (props-defaulted :initform nil
                    :documentation
                    "a bit-mirror for definitions in properties where =1 implies default")))

(defun direct-annotation-model (definition) "0-950" (properties definition))
(defun (setf direct-annotation-model) (model definition) "0-950" (setf (properties definition) model))
(defun annotation-model (definition) "0-950" (properties definition))
(defun content-model (definition) "0-950" (model definition))

(defClass doctype-attlist-definition () () (:documentation "0.950"))
(defClass def-attr (doctype-attlist-definition
                    abstract-top-level-def-node unamed-node qname-context-delegate
                    duration-scoped-node)
  ((children :initarg :attributes :accessor attributes :initform nil))
  (:documentation
   "a <code>DEF-ATTR</code> collects a set of attribute definitions for a given
    element type context."))

(defClass annotation-definition () () (:documentation "0.950"))
(defClass doctype-annotation-definition (annotation-definition) () (:documentation "0.950"))
(defClass def-elem-property-type (unamed-node abstract-def-type abstract-def-node
                                              duration-scoped-node
                                              doctype-annotation-definition)
  ((children :initform nil :initarg :enumeration :reader enumeration)
   (stipulation :initarg :stipulation :initform nil :reader stipulation)
   (prototype :initarg :prototype :initform nil :reader prototype))
  (:documentation
   "for use in the element definition."))

(defClass def-notation (abstract-top-level-def-node entity-information-node)
  ())

(defClass def-entity (ncnamed-node abstract-top-level-def-node abstract-value-node)
  ((value :initform nil)
   (extent :initform nil :initarg :extent :reader extent
           :type (member :static :temporary nil))
   (maybe-markup-text :initform :unknown))
  (:metaclass abstract-class))

(defClass general-entity-definition () ()
  (:documentation "added for compatibility with 0.950 conditions"))
(defClass def-general-entity (def-entity general-entity-definition) () (:metaclass abstract-class))

(defClass parameter-entity-definition () ()
  (:documentation "added for compatibility with 0.950 conditions"))
(defClass def-parameter-entity (def-entity parameter-entity-definition) () (:metaclass abstract-class))
(defClass def-internal-entity (def-entity) () (:metaclass abstract-class))
(defClass def-external-entity (entity-delegate def-entity)
  ((children :initform nil))
  (:metaclass abstract-class))
(defClass def-internal-general-entity (def-internal-entity def-general-entity)
  ())
(defClass def-external-general-entity (def-external-entity def-general-entity)
  ((notation :initform nil :initarg :notation :reader notation)))
(defClass def-internal-parameter-entity (def-internal-entity def-parameter-entity) ())
(defClass def-external-parameter-entity (def-external-entity def-parameter-entity)
  ((children :initform nil)))

(defClass type-definition (named) ()
  (:documentation "added for compatibility with 0.950 conditions"))

(defClass ref-entity (ref-node named-node attr-child-node)
  ((expand :initform nil :initarg :expand :accessor expand
           :documentation "specifies whether to expand the entity when encoding."))
  (:metaclass abstract-class))
(defClass ref-general-entity (ref-entity elem-child-node) () )
(defClass ref-parameter-entity (ref-entity doctype-child-node) () )
(defClass ref-character-entity (ref-entity elem-child-node) ())

(defClass conditional-section (ref-parameter-entity)
  ()
  (:documentation
 "a <code>CONDITIONAL-SECTION</code> specializes the behaviour of a pe-reference
  and serves as the container for conditional declarations, the presence of which
  depend on the respective entites value.
  it is produced by parsing external declaration subsets with
  pe expansion disabled, and may also be generated programmatically."))

(defClass external-parsed-entity (entity-delegate ref-general-entity)
  ()
  (:documentation
   "an <code>EXTERNAL_PARSED-ENTITY</code> acts as a container for an external parsed general
    entity. it binds the content sequence and the encoding. it is used to enforce the
    structural constraints on the entities content."))

;;
;;
;; model classes 

(defClass content-model () ())
(defClass content-list () ())
(defClass content-name () ())
(defClass type-name () ())
(defClass |content-model| (bnfp::bnf-phrase-definition content-model) ())
(defClass |\|-content| (bnfp::bnf-alternative content-list) () )
(defClass content-occurrence () ())
(defClass |?-content| (bnfp::bnf-opt-expr content-occurrence) () )
(defClass |*-content| (bnfp::bnf-rep-expr content-occurrence) () )
(defClass |bounded-content| (bnfp::bnf-qexpr content-occurrence)
  ((min :initarg :min :initform nil)
   (max :initarg :max :initform nil)) )
(defClass |MIXED-content| (|*-content|) () )
(defClass |+-content| (bnfp::bnf-plus-expr content-occurrence) () )
(defClass |content| (bnfp::bnf-one-expr content-occurrence) () )
(defClass |,-content| (bnfp::bnf-group content-list) () )
(defClass |content-name| (bnfp::bnf-phrase-symbol content-name) () )
(defClass |type-name| (bnfp::bnf-nonterminal-symbol type-name) () )
(defClass mixed-atn (bnfp::atn) ())
(defClass element-atn (bnfp::atn) ())

(defMethod name ((instance |content-name|)) (bnfp::bnf-name instance))
(defMethod (setf name) (name (instance |content-name|)) (setf (bnfp::bnf-name instance) name))
(defMethod name ((instance |type-name|)) (bnfp::bnf-name instance))
(defMethod (setf name) (name (instance |type-name|)) (setf (bnfp::bnf-name instance) name))
(defMethod name ((instance |content-model|)) (name (bnfp::bnf-lhs instance)))
(defMethod nonterminal ((instance |content-model|)) (bnfp::bnf-lhs instance))
(defMethod grammar ((instance |content-model|)) (bnfp::bnf-rhs instance))
(defun expressions (x) (bnfp::bnf-expressions x))
(defmethod expression ((x content-occurrence)) (bnfp::bnf-expression x))

(defMethod print-object ((object |content-name|) stream &aux name)
  (setf name (and *print-pretty* (bnfp::bnf-name object)))
  ;; only the special case of PCDATA with other elements gets here
  ;; ANY and EMPTY never get here -- see below
  (cond ((eq name *mixed-name*) (princ "#PCDATA" stream))
        (t (call-next-method))))

(defMethod print-object ((object |*-content|) stream &aux expr name)
  (setf name (when (and *print-pretty*
                        (typep (setf expr (bnfp::bnf-expression object)) '|content-name|))
               (bnfp::bnf-name expr)))
  (cond ((eq name *wild-name*) (princ "ANY" stream))
        ((eq name *empty-name*) (princ "EMPTY" stream))
        ((eq name *mixed-name*) (princ "(#PCDATA)" stream))
        (t (call-next-method))))

;;
;;
;; walking definition components

(defGeneric walk-model-names (particle function)
  ;; type declaration data
  (:method ((context def-elem-type) (function t))
           (setf (name context) (funcall function (name context)))
           (walk-model-names (properties context) function)
           (walk-model-names (model context) function))
  ;; generic expression data
  (:method ((context t) (function t)) nil)
  (:method ((decls list) (function t))
           (dolist (decl decls) (walk-model-names decl function)))
  ;; attribute declaration data
  (:method ((context def-elem-property-type) (function t))
           (with-slots (prototype) context
             (setf (name context) (funcall function (name context)))
             (when prototype
               (setf (name prototype) (funcall function (name prototype))))))
  (:method ((context elem-property-node) (function t))
           (with-slots (def) context
             (setf (name context) (funcall function (name context)))
             (when def (setf (name def) (funcall function (name def))))))
  ;; content model data
  (:method ((context |content-model|) (function t))
           (walk-model-names (bnfp::bnf-lhs context) function)
           (walk-model-names (bnfp::bnf-rhs context) function))
  (:method ((context |\|-content|) (function t))
           (walk-model-names (bnfp::bnf-expressions context) function))
  (:method ((context |?-content|) (function t))
           (walk-model-names (bnfp::bnf-expression context) function))
  (:method ((context |*-content|) (function t))
           (walk-model-names (bnfp::bnf-expression context) function))
  (:method ((context |+-content|) (function t))
           (walk-model-names (bnfp::bnf-expression context) function))
  (:method ((context |content|) (function t))
           (walk-model-names (bnfp::bnf-expression context) function))
  (:method ((context |,-content|) (function t))
           (walk-model-names (bnfp::bnf-expressions context) function))
  (:method ((context |content-name|) (function t))
           (setf (bnfp::bnf-name context) (funcall function (bnfp::bnf-name context))))
  (:method ((context |type-name|) (function t))
           (setf (bnfp::bnf-name context) (funcall function (bnfp::bnf-name context)))))

(defMethod collect-model-names ((model |content-model|) &aux names is-mixed (model-name (name model)))
  (walk-model-names model
                          #'(lambda (name)
                              (cond ((or (eq name *empty-name*) (eq name *wild-name*))
                                     (push name names)
                                     name)
                                    ((eq name *mixed-name*) (setf is-mixed t) name)
                                    (t (push name names) name))))
  (when (and (validate? *document*) is-mixed)
    (mapl #'(lambda (rest &aux (name (first rest)))
              (when (find name (rest rest)
                          :test #'(lambda (n1 n2)
                                    (and (bnfp::name= n1 n2)
                                         (not (eq n1 model-name)) (not (eq n2 model-name)))))
                  (|VC: No Duplicate Types| :context model :name (first rest))))
          names))
  names)

(defMethod collect-model-names ((model bnfp::bnf-expr) &aux names)
  (walk-model-names model
                          #'(lambda (name)
                              (cond ((or (eq name *empty-name*) (eq name *wild-name*))
                                     (pushnew name names)
                                     name)
                                    ((eq name *mixed-name*) name)
                                    (t (pushnew name names) name))))
  (nreverse names))

(defGeneric first-model-name (model)
  (:method ((model |content-model|))
           (first-model-name (bnfp::bnf-rhs model)))
  (:method ((model t))
           (walk-model-names model #'(lambda (name) (return-from first-model-name name)))))


;;
;;
;; classes for qualified name resolution

(defClass qname-context ()
  ((name :initarg :name :reader name)
   (def :initform nil :initarg :def :reader def :reader definition)
   (pass-id :initform nil :accessor pass-id))
  (:documentation
   "a <code>QNAME-CONTEXT</code> collects the uninterned qnames which are governed by a
    given declaration. it is used while reading the document type definition. at the point of
    appearance of each declaration a new one is created."))

(defClass def-type-qname-context (qname-context)
  ((parents :initform nil :accessor parents)
   (children :initform nil :accessor children)
   (content-names :initarg :content-names :reader content-names)
   (attr-nodes :initform nil :initarg :attr-nodes :accessor attr-nodes
               :initarg :attributes :accessor attributes)
   (ns-nodes :initform nil :initarg :ns-nodes :accessor ns-nodes
              :initarg :nsdecl-nodes :accessor nsdecl-nodes
              :initarg :namespace-declarations :accessor namespace-declarations)
   (successors :initform nil
               :documentation
               "binds the conceivable successors based on the literal qualified names.")
   (ns-cache :initform nil :accessor ns-cache
             :documentation "bind results from searching parents"))
  (:documentation
   "a <code>def-type-QNAME-CONTEXT</code> collects the qualified names which contribute to
    an individual element declaration. it is created with the names from the element
    declaration proper and augmented with those from related attribute list declarations.
    in the process of resolving qualified names to universal names, relations among element
    contexts are established to simulate the visibility of prefix/namespace bindings
    as specified for the document entity."))

(defClass def-attr-qname-context (qname-context)
  ((name :writer (setf name))
   (attr-nodes :initform nil :initarg :attr-nodes :accessor attr-nodes
               :initarg :attributes :accessor attributes)
   (ns-nodes :initform nil :initarg :ns-nodes :accessor ns-nodes
              :initarg :nsdecl-nodes :accessor nsdecl-nodes
              :initarg :namespace-declarations :accessor namespace-declarations)
   (assignment :initform nil :accessor assignment))
  (:documentation
   "a <code>DEF-ATTR-QNAME-CONTEXT</code> collects the qualified names which contribute
    to attribute declarations for an element. note that the namespace nodes can be neglected
    as the 'xmlns' prefix/namespace binding is static.
    in the process of resolving qualified names to universal names, each attribute context
    is merged into a element context."))

(defGeneric walk-model-nodes (particle function)
  (:documentation
   "walk the model tree and apply the function to each node. for 0.950")
  (:method ((context element-definition) (function t))
           (funcall function context)
           (walk-model-nodes (annotation-model context) function)
           (walk-model-nodes (content-model context) function))
  (:method ((context t) (function t)) nil)
  (:method ((decls list) (function t))
           (dolist (decl decls) (walk-model-nodes decl function)))
  (:method ((node ext-subset-node) (function t))
           (walk-model-nodes (children node) function))
  (:method ((context annotation-definition) (function t))
           (with-accessors ((prototype prototype)) context
             (funcall function context)
             (when prototype
               (funcall function prototype))))
  (:method ((context annotation) (function t))
           (with-accessors ((definition definition)) context
             (funcall function context)
             (when definition(funcall function definition))))
  (:method ((context def-type-qname-context) (function t))
           (funcall function context)
           (mapcar #'(lambda (def) (walk-model-nodes def function)) (namespace-declarations context))
           (let ((*default-namespace-is-visible* nil))
             (mapcar #'(lambda (def) (walk-model-names def function)) (attributes context)))
           (walk-model-nodes (def context) function))
  ;; content model data
  (:method ((context content-model) (function t))
           (walk-model-nodes (nonterminal context) function)
           (walk-model-nodes (grammar context) function))
  (:method ((context content-list) (function t))
           (walk-model-nodes (expressions context) function))
  (:method ((context content-occurrence) (function t))
           (walk-model-nodes (expression context) function))
  (:method ((context content-name) (function t))
           (funcall function context))
  (:method ((context type-name) (function t))
           (funcall function (name context))))

;;
;;
;; types and constructors
;; nb. no constructors defined for the abstract classes...

(defMacro defClassConstructor (name)
  `(defun ,(intern (concatenate 'string "MAKE-" (string name)))
          (&rest initargs)
     (declare (dynamic-extent initargs))
     (apply #'make-instance
            ,(intern (concatenate 'string "*CLASS." (string name) "*"))
            initargs)))

(defMacro defClassConstructors (&rest names)
  `(progn 
     ,@(mapcar #'(lambda (name)
                   `(defParameter ,(intern (concatenate 'string "*CLASS." (string name) "*"))
                      (find-class ',name)))
               names)
     ,@(mapcar #'(lambda (name) `(defClassConstructor ,name)) names)))


(defMacro defTypePredicate (name)
  `(defun ,(intern (concatenate 'string "IS-" (string name))) (x)
     (typep x ',name)))

(defvar *export-output* )
(defMacro defTypePredicates (&rest names)
  (when (boundp '*export-output*)
    (mapcar #'(lambda (names)
                (format *export-output* "~%~{~s~^ ~}" names))
            (sort (mapcar #'(lambda (name)
                              (list* (string name)
                                     (concatenate 'string "IS-" (string name))
                                     (unless (string= "ABSTRACT" name :end2 (min (length (string name)) 8))
                                       (list (concatenate 'string "*CLASS." (string name) "*")
                                             (concatenate 'string "MAKE-" (string name))))))
                          names)
                  #'string< :key #'first)))
  `(progn ,@(mapcar #'(lambda (name)
                        `(defTypePredicate ,name)) names)))

(defClassConstructors
  doc-node elem-node ns-node ext-subset-node
  decimal-attr-node  double-attr-node  entity-attr-node  entities-attr-node
  enumeration-attr-node id-attr-node id-ref-attr-node id-refs-attr-node
  nmtoken-attr-node nmtokens-attr-node notation-attr-node
  qname-attr-node recur-dur-attr-node string-attr-node time-attr-node
  uri-ref-attr-node
  pi-node comment-node info-item-node character-data-node
  document-type-declaration-information-node entity-information-node
  string-value bool-value float-value double-value decimal-value
  time-dur-value recur-dur-value binary-value uri-ref-value id-value id-ref-value
  qname-value entity-value notation-value function-value
  def-attr def-elem-property-type def-elem-type def-notation
  def-internal-general-entity def-external-general-entity
  ref-node
  def-internal-parameter-entity def-external-parameter-entity
  ref-parameter-entity ref-general-entity ref-character-entity
  conditional-section external-parsed-entity)

(defTypePredicates
  doc-node abstract-elem-node elem-node ext-subset-node ordinal-node
  elem-property-node abstract-elem-property-node
  abstract-attr-node attr-node abstract-ns-node ns-node
  def-elem-property-type
  elem-child-node attr-child-node doctype-child-node doc-child-node
  decimal-attr-node  double-attr-node  entity-attr-node  entities-attr-node
  enumeration-attr-node id-attr-node id-ref-attr-node id-refs-attr-node
  nmtoken-attr-node nmtokens-attr-node notation-attr-node
  qname-attr-node recur-dur-attr-node string-attr-node time-attr-node
  uri-ref-attr-node
  pi-node comment-node info-item-node character-data-node
  document-type-declaration-information-node entity-information-node
  value-node string-value bool-value number-value float-value double-value decimal-value
  time-dur-value recur-dur-value binary-value uri-ref-value id-value id-ref-value
  qname-value entity-value notation-value function-value
  abstract-def-node abstract-top-level-def-node abstract-def-type
  def-attr def-elem-type def-notation def-entity
  def-internal-entity def-external-entity def-parameter-entity def-general-entity
  def-internal-general-entity def-external-general-entity
  def-internal-parameter-entity def-external-parameter-entity
  ref-node ref-entity
  ref-parameter-entity ref-general-entity ref-character-entity
  conditional-section external-parsed-entity
  qname-context)

(defun element-p (x) (is-abstract-elem-node x))
(defun id-attr-node-p (x) (is-id-attr-node x))
(defun nsdecl-node-p (x) (is-ns-node x))
;;
;;
;; supplementary accessors

(defMethod value ((node value-node))
  (with-slots (children value) node
    (or value (setf value (value-string children)))))

(defMethod parent ((node string)) nil)
(defMethod children ((node string)) nil)

(defGeneric validate? (node)
  (:documentation "bound directly to document nodes. other nodes resolve relative to the container, or yield nil.")
  (:method ((node document-scoped-node)) (validate? (document node)))
  (:method ((node null)) nil)
  (:method ((node t)) (warn "validation not defined for node: ~s." node) nil))
(defun validate-p (x) (validate? x))

#|
;; the value generators for entites are only marginally useful.
;; the replacement mechanism uses the input sequence stored in the child slot
;; rather than the string which would have been produced here

(defMethod value ((node ref-parameter-entity))
  (with-slots (value name) node
    (or value (setf value (parameter-entity-value name)))))

(defMethod value ((node ref-general-entity))
  (with-slots (value name) node
    (or value (setf value (general-entity-value name)))))

(defMethod value ((node def-internal-entity))
  (with-slots (children value) node
    (or value (setf value (value-string children)))))

(defMethod value ((node def-external-entity) &aux (uri (uri node)))
  (with-slots (children value) node
    (if value
      value
      (setf children nil
            value (when uri
                    (read-external-entity uri))))))

|#

(defMethod value ((node entities-attr-node))
  (with-slots (children value document) node
    (cond (value)
          (children
           (setf value (mapcar #'(lambda (name &aux entity)
                                   (unless (is-ncname name)
                                     (|VC: ID| :name (name node) :value value
                                                :detail "not an NCName"))
                                   (setf name (intern-name name *null-namespace*))
                                   (when document
                                     (when (setf entity (find-def-general-entity name document))
                                       (unless (and (is-def-external-general-entity entity)
                                                    (notation entity))
                                         (|VC: Entity Name| :name name))))
                                   name)
                               (split-string (value-string children)
                                             #(#\space #\return #\linefeed #\tab))))))))

(defMethod value ((node entity-attr-node) &aux entity)
  (with-slots (children value document) node
    (cond (value)
          (t
           (unless (is-ncname (setf value
                                      (normalize-value node (value-string children))))
             (|VC: Entity Name| :context (name node) :name value
                        :detail "not an NCName"))
           (setf value (intern-name value *null-namespace*))
           (when document
             (when (setf entity (find-def-general-entity value document))
               (unless (and (is-def-external-general-entity entity)
                            (notation entity))
                 (|VC: Entity Name|
                            :context (name node) :name value
                            :detail "must name an unparsed entity"))))))))

(defMethod value ((node id-attr-node))
  (with-slots (children value) node
    (cond (value)
          (children
           (unless (is-ncname (setf value
                                      (normalize-value node (value-string children))))
             (|VC: ID| :name (name node) :value value
                        :detail "not an NCName"))
           (setf value (intern-name value *null-namespace*))))))

(defMethod value ((node id-ref-attr-node))
  (with-slots (children value) node
    (cond (value)
          (children
           (unless (is-ncname (setf value
                                      (normalize-value node (value-string children))))
             (|VC: ID| :name (name node) :value value
                        :detail "not an NCName"))
           (setf value (intern-name value *null-namespace*))))))

(defMethod value ((node id-refs-attr-node))
  (with-slots (children value) node
    (cond (value)
          (children
           (setf value (mapcar #'(lambda (name)
                                   (unless (is-ncname name)
                                     (|VC: ID| :name (name node) :value value
                                                :detail "not an NCName"))
                                   (intern-name name *null-namespace*))
                               (split-string (value-string children)
                                             #(#\space #\return #\linefeed #\tab))))))))
                   
(defMethod value ((node nmtoken-attr-node))
  (with-slots (children value) node
    (cond (value)
          (children
           (unless (is-namechardata (setf value
                                            (normalize-value node (value-string children))))
             (|VC: Name Token| :name (name node) :value value
                        :detail "not a Name"))
           (setf value (intern-name value *null-namespace*))))))


(defMethod value ((node nmtokens-attr-node))
  (with-slots (children value) node
    (cond (value)
          (children
           (setf value (mapcar #'(lambda (name)
                                   (unless (is-namechardata name) 
                                     (|VC: Name Token|
                                      :name (name node) :value name
                                      :detail "not an Name"))
                                   (intern-name name *null-namespace*))
                               (split-string (value-string children)
                                             #(#\space #\return #\linefeed #\tab))))))))


(defMethod value ((node notation-attr-node))
  (with-slots (children value def) node
    (cond (value)
          (children
           (setf value (normalize-value node (value-string children)))
           (unless (is-namechardata value)
             (|VC: Name Token| :name (name node) :value value
                                         :detail "not an Name"))
           (setf value (intern-name value *null-namespace*))
           (when def
             (unless (find value (enumeration def))
               (|VC: Notation Attributes| :name value))))
          (t
           (|VC: Name Token| :name (name node) :value value
                               :detail "not an Name")))))

(defMethod value ((node enumeration-attr-node))
  (with-slots (children value def) node
    (cond (value)
          (children
           (call-next-method)
           (when def
             (unless (find value (enumeration def) :test #'string=)
               (|VC: Enumeration| :name value)))))))

(defMethod value ((node string-attr-node))
  (with-slots (children value) node
    (if value value
        (setf value (normalize-value node (value-string children))))))

(defmethod (setf value) ((new-value string) (node string-attr-node))
  (with-slots (children value) node
    (setf children (list new-value)
          value new-value)))

(defMethod value ((node ns-node))
  (with-slots (children value) node
    (if value value
        (setf value (normalize-value node (value-string children))))))

(defMethod uri ((node ns-node))
  (value node))

(defMethod namespace-name ((node ns-node))
  (value node))

(defMethod value ((node pi-node))
  (with-slots (value children) node
    (or value (setf value (or (first children) "")))))

(defMethod (setf value) ((new-value string) (node pi-node))
  (with-slots (value children) node
    (setf value new-value
          children (list new-value))))

(defMethod (setf value) ((new-value t) (node pi-node))
  (assert (typep new-value 'string)))

(defMethod value ((node uri-ref-value))
  (with-slots (value children) node
    (if value value
        (setf value (make-uri (string-trim #(#\space) (value-string children)) *xml-base*)))))
              
;;
;; normalizing reduces all space to a single character, trimming, in addition,
;; removes initial and trailing space
;; nb. in order to keep the model independent of the respective parser, a simple subsequence
;; is generated and no attempt is made to return string buffers, as the only xml parser uses them.

(defGeneric normalize-value (node value)
  (:documentation
   "value normalization is specified by the XML standard.
   it is performed when a value is generated from children, which is the case
    when a node is generated by the parser.")
  (:method ((node attr-node) (value t)) value))

(defMethod normalize-value ((node normalizing-attr-node) (value string)
                            &aux (to 0) (from 0) (end (length value)) char space?)
  (loop (when (>= from end) (return))
        (cond ((xml-space? (setf char (schar value from)))
               (setf (schar value to) #\space)
               (unless space?
                 (incf to)
                 (setf space? t)))
              (t
               (setf (schar value to) char)
               (setf space? nil)
               (incf to)))
        (incf from))
  (cond ((= to end) value)
        (t (subseq value 0 to))))

(defun normalize-and-trim-string (value &aux (to 0) (from 0) (end (length value)) char space?)
  (loop (when (>= from end) (return))
        (cond ((xml-space? (setf char (schar value from)))
               (setf (schar value to) #\space)
               (when (and (not space?) (> to 0))
                 (incf to)
                 (setf space? t)))
              (t
               (setf (schar value to) char)
               (setf space? nil)
               (incf to)))
        (incf from))
  (when (and (> to 0) (xml-space? (schar value (1- to))))
    (decf to))
  (cond ((= to end) value)
        (t (subseq value 0 to))))

(defMethod normalize-value ((node trimming-attr-node) (value string))
  (normalize-and-trim-string value))

(defMethod normalize-value ((node ns-node) (value string))
  (normalize-and-trim-string value))


;(normalize-value (allocate-instance (find-class 'string-attr-node)) "  d  a    ")
;(normalize-value (allocate-instance (find-class 'nmtoken-attr-node)) " this-gets-normalized ")
  

(defMethod (setf parent) :after
           ((parent elem-node) (instance attr-node))
  ;; generate the value in order to enforce constraints. this is deferred until
  ;; the attribute is bound to an element in order to use the context when generating
  ;; interned values.
  (when (validate? instance)
    (value instance)))

(defMethod (setf parent) :after
           ((parent elem-node) (instance id-attr-node) &aux (id (value instance)))
  ;; bind the id within the document
  (with-slots (document) instance
    (when (setf document (document parent))
      (when (gethash id (ids document))
        (|VC: ID| :name (name instance) :value id :detail "not unique"))
      (setf (gethash id (ids document)) instance))))

;;
;;
;; encapsulated children are expendable for attribute/ns nodes and for value
;; nodes themselves.
;; children generated as parse artifacts or may be asserted for serialization.
;; the value slot dominates and modifies the children implicitly.

(defMethod (setf value) ((new-value string) (node value-node))
  (with-slots (children value) node
    (setf value new-value)
    (setf children (list new-value))))

(defMethod (setf value) ((new-value value-node) (node value-node))
  (with-slots (children value) node
    (setf value new-value)
    (setf children (list (value-string new-value)))))

;;
;;
;; entity information delegation

(defMethod entity-info ((node entity-delegate))
  (with-slots (entity-info) node
    (or entity-info
        (setf entity-info (make-instance 'entity-information-node)))))

(defMethod name ((node doc-node))
  (with-slots (entity-info) node
    (when entity-info (name entity-info))))
(defMethod (setf name) (value (node doc-node))
  (setf (name (entity-info node)) value))

(defMethod uri ((node entity-delegate))
  (with-slots (entity-info) node
    (when entity-info (uri entity-info))))
(defMethod (setf uri) (value (node entity-delegate))
  (setf (uri (entity-info node)) value))

(defMethod system-id ((node entity-delegate))
  (with-slots (entity-info) node
    (when entity-info (system-id entity-info))))
(defMethod (setf system-id) (value (node entity-delegate))
  (setf (system-id (entity-info node)) value))
(defMethod (setf system-id) :after ((value t) (node entity-information-node))
  (with-slots (uri system-id public-id) node
    (setf uri (resolve-entity-identifiers public-id system-id *xml-base*))))

(defMethod public-id ((node entity-delegate))
  (with-slots (entity-info) node
    (when entity-info (public-id entity-info))))
(defMethod (setf public-id) (value (node entity-delegate))
  (setf (public-id (entity-info node)) value))
(defMethod (setf public-id) :after ((value t) (node entity-information-node))
  (with-slots (uri system-id public-id) node
    (setf uri (resolve-entity-identifiers public-id system-id *xml-base*))))

(defMethod encoding ((node entity-delegate))
  (with-slots (entity-info) node
    (when entity-info (encoding entity-info))))
(defMethod (setf encoding) (value (node entity-delegate))
  (setf (encoding (entity-info node)) value))

(defmethod encoding ((node document-scoped-node))
  (encoding (document node)))

(defgeneric (setf encoding) (encoding entity-information-node)
  (:method ((encoding string) (node entity-information-node) &aux canonical-encoding)
           (cond
            ((setf canonical-encoding (canonical-encoding encoding))
             (setf (slot-value node 'encoding) canonical-encoding))
            (t
             (error "illegal encoding: ~s." encoding))))
  (:method ((encoding symbol) (node entity-information-node) &aux canonical-encoding)
           (cond
            ((setf canonical-encoding (canonical-encoding encoding))
             (setf (slot-value node 'encoding) canonical-encoding))
            (t
             (error "illegal encoding: ~s." encoding)))))

(defMethod version ((node entity-delegate))
  (with-slots (entity-info) node
    (when entity-info (version entity-info))))
(defMethod (setf version) (value (node entity-delegate))
  (setf (version (entity-info node)) value))


;;
;;
;; reference node access delegation

(defMacro defDelegateMethod (name ((instance class)) slot)
  `(progn (defMethod ,name ((,instance ,class))
            (with-slots (,slot) ,instance (,name ,slot)))
          (defMethod (setf ,name) (new-value (,instance ,class))
            (with-slots (,slot) ,instance (setf (,name ,slot) new-value)))))

(defDelegateMethod children ((node ref-elem-node)) value)
(defDelegateMethod name ((node ref-elem-node)) value)
(defDelegateMethod attributes ((node ref-elem-node)) value)
(defDelegateMethod def ((node ref-elem-node)) value)
(defDelegateMethod namespaces ((node ref-elem-node)) value)
(defDelegateMethod valid ((node ref-elem-node)) value)

(defDelegateMethod children ((node ref-elem-property-node)) value)
(defDelegateMethod name ((node ref-elem-property-node)) value)
(defDelegateMethod def ((node ref-elem-property-node)) value)
(defDelegateMethod value ((node ref-elem-property-node)) value)
#+sbcl(make-instance 'ref-ns-node)
(defDelegateMethod namespace ((node ref-ns-node)) value)

;;
;;
;; node cloning. for attributes

(defMethod clone-node
           ((instance abstract-node) &rest initargs &aux new)
  (declare (dynamic-extent initargs))
  (setf new (allocate-instance (class-of instance)))
  ;; initialize overriding slot values.
  ;; do this first, to inhibit side-effects from copying
  (when initargs (apply #'shared-initialize new nil initargs))
  (copy-node instance new)
  new)

(defMethod clone-node ((instance string) &key) instance)

(defMethod clone-node ((nodes list) &rest initargs)
  (mapcar #'(lambda (x) (apply #'clone-node x initargs)) nodes))


(defGeneric copy-node (from to)
  (:documentation
   "copy slot values from one node to another.
    slots with bound values are left unchanged.")
  #-(or scl clisp)
  (:method-combination progn :most-specific-last)
  #+(or scl clisp)
  (:method ((from t) (to t)) )
  (:method #-(or scl clisp)progn ((from abstract-node) (to abstract-node))
           #+(or scl clisp) (call-next-method)
           (unless (slot-boundp to 'parent)
             (setf (slot-value to 'parent) nil))
           (unless (slot-boundp to 'children)
             (setf (slot-value to 'children) (clone-node (children from)))))
  (:method #-(or scl clisp)progn ((from typed-node) (to typed-node))
           #+(or scl clisp) (call-next-method)
           (unless (slot-boundp to 'def) 
             (setf (slot-value to 'def) (slot-value from 'def))))
  (:method #-(or scl clisp)progn ((from named-node) (to named-node))
           #+(or scl clisp) (call-next-method)
           (unless (slot-boundp to 'name) 
             (setf (slot-value to 'name) (slot-value from 'name))))
  (:method #-(or scl clisp)progn ((from ns-node) (to ns-node))
           #+(or scl clisp) (call-next-method)
           (unless (slot-boundp to 'value) 
             (setf (slot-value to 'value) (slot-value from 'value)))
           (unless (slot-boundp to 'namespace) 
             (setf (slot-value to 'namespace) (slot-value from 'namespace))))
  (:method #-(or scl clisp)progn ((from attr-node) (to attr-node))
           #+(or scl clisp) (call-next-method)
           (unless (slot-boundp to 'value) 
             (setf (slot-value to 'value) (slot-value from 'value)))))
  
;;
;;
;; constituent management for a document maintains the relation between the children
;; and the root node. see also the respective check-constraint method

(defMethod nodes ((node doc-node))
  "for use with path interpretation"
  (children node))

(defMethod (setf nodes) (new-value (doc doc-node))
  (setf (children doc) new-value))

(defMethod (setf children) ((children sequence) (doc doc-node))
  (with-slots (root) doc
    (setf root (find-if #'is-abstract-elem-node children))
    (call-next-method)))

(defGeneric document (node) 
  (:method ((node doc-node)) node)
  (:method ((node t)) nil))

(defMethod def ((node elem-node) &aux document)
  (with-slots (def name) node
    (or (call-next-method)
        (setf def (when (and name (setf document (document node)))
                     (find-def-elem-type name document))))))

(defGeneric definition (x)
  (:method ((x t)) (def x)))

;;
;;
;; initialize property bits in a type definition

(defMethod is-required ((def def-elem-property-type))
  (eq (stipulation def) :REQUIRED))
(defMethod is-implied ((def def-elem-property-type))
  (eq (stipulation def) :IMPLIED))
(defMethod is-fixed ((def def-elem-property-type))
  (eq (stipulation def) :FIXED))
(defMethod is-defaulted ((def def-elem-property-type))
  (with-slots (prototype) def
    (and prototype (children prototype))))

(defMethod is-required ((node elem-property-node))
  (with-slots (def) node (when def (is-required def))))
(defMethod is-implied ((node elem-property-node))
  (with-slots (def) node (when def (is-implied def))))
(defMethod is-fixed ((node elem-property-node))
  (with-slots (def) node (when def (is-fixed def))))
(defMethod is-defaulted ((node elem-property-node))
  (with-slots (children) node
    children))

(defMethod props-defaulted ((def def-elem-type))
  (with-slots (properties props-defaulted) def
    (or props-defaulted
        (setf props-defaulted
              (make-array (length properties) :element-type 'bit
                          :initial-contents
                          (mapcar #'(lambda (def) (if (is-defaulted def) 1 0))
                                  properties))))))

(defMethod props-required ((def def-elem-type))
  (with-slots (properties props-required) def
    (or props-required
        (setf props-required
              (make-array (length properties) :element-type 'bit
                          :initial-contents
                          (mapcar #'(lambda (def) (if (is-required def) 1 0))
                                  properties))))))


(defGeneric name-symbol (name)
  (:method ((name symbol))
           (if (keywordp name) (intern (string name) *package*) name))
  (:method ((name uname))
           (intern (local-part name)
                   (let* ((namespace (namespace name))
                          (package-name (namespace-name namespace)))
                     (if (eq namespace *null-namespace*)
                       *package*
                       (or (find-package package-name)
                           (error "package not found: ~s." package-name)))))))

(defGeneric find-node-class (name)
  (:method ((name symbol)) (find-class name nil))
  (:method ((name uname)) (find-node-class (ignore-errors (name-symbol name)))))

(defMethod node-class ((def def-elem-type))
  (with-slots (node-class name) def
    (or node-class
        (cond ((and *specialize-elem-node*
                    (setf node-class (find-node-class name))
                    (subtypep (class-name node-class) 'abstract-elem-node))
               node-class)
              (t
               (setf node-class *class.elem-node*))))))

;(trace node-class)
;(trace xmlp:construct-element-node)
;;
;;
;; initialization

(defMethod initialize-instance
           ((instance entity-delegate) &rest initargs
            &key entity-info uri
            system-literal (system-id system-literal)
            pubid-literal (public-id pubid-literal)
            encoding-decl (encoding encoding-decl)
            version-info (version version-info))
  ;; keep name in sync. for doc-node this becomes the only binding
  (when (listp entity-info)
    (setf entity-info (apply #'make-entity-information-node entity-info)))
  (when (is-entity-information-node entity-info)
    (when uri (uri entity-info) uri)
    (when system-id (setf (system-id entity-info) system-id))
    (when public-id (setf (public-id entity-info) public-id))
    (when encoding (setf (encoding entity-info) encoding))
    (when version (setf (version entity-info) version)))
  (apply #'call-next-method instance :entity-info entity-info initargs))

(defMethod initialize-instance
           ((instance entity-information-node) &key (defaults *xml-base*))
  (with-slots (uri system-id public-id) instance
    (call-next-method)
    ;; generate the uri from the system and public identifiers
    (unless uri
      (setf uri (resolve-entity-identifiers public-id system-id defaults)))))
  
  
(defMethod initialize-instance
           ((instance doc-node) &rest initargs
            &key declarations children (root (find-if #'is-abstract-elem-node children))
            notations ids general-entities parameter-entities types attributes)
  ;; integrate definitions for notation, entities and types.
  ;; note that the attributes informational and thus not integrated. the effective
  ;; definitions are in the types
  (apply #'call-next-method instance
         :root root :children (or children (when root (list root)))
         initargs)
  (when root (setf (parent root) instance))
  (flet ((local-bind-definition (def) (bind-definition def instance)))
    (etypecase notations
      (hash-table (setf (notations instance) notations))
      (cons (map nil #'local-bind-definition notations))
      (null (map-node-by-type #'is-def-notation #'bind-definition declarations)))
    (etypecase ids
      (hash-table (setf (ids instance) ids))
      (null t))
    (etypecase general-entities
      (hash-table (setf (general-entities instance) general-entities))
      (cons (map nil #'local-bind-definition general-entities))
      (null (map-node-by-type #'is-def-general-entity #'bind-definition declarations)))
    (etypecase parameter-entities
      (hash-table (setf (parameter-entities instance) general-entities))
      (cons (map nil #'local-bind-definition parameter-entities))
      (null (map-node-by-type #'is-def-parameter-entity #'bind-definition declarations)))
    (etypecase types
      (hash-table (setf (types instance) types))
      (cons (map nil #'local-bind-definition types))
      (null (map-node-by-type #'is-def-elem-type #'bind-definition declarations)))
    (setf (attributes instance)
          (etypecase attributes
            (cons attributes)
            (null (collect-attribute-declarations declarations))))
    ))

(defMethod initialize-instance
           ((instance elem-node) &rest initargs
            &key
            (attributes nil attributes-p)
            (namespaces nil namespaces-p)
            (children nil children-p))
  (apply #'call-next-method instance
         :children nil
         initargs)
  (when attributes-p (setf (attributes instance) attributes))
  (when namespaces-p (setf (namespaces instance) namespaces))
  (when children-p (setf (children instance) children)))

(defMethod (setf attributes) :before (attributes (instance elem-node))
  (dolist (n attributes)
    (etypecase n
      (attr-node (setf (parent n) instance)))))

(defMethod (setf namespaces) :before (namespaces (instance elem-node))
  (dolist (n namespaces)
    (etypecase n
      (ns-node (setf (parent n) instance)))))

(defMethod (setf children) :after (children (instance elem-node))
  (declare (special |VC: Element Content|))
  (slot-makunbound instance 'valid)
  (dolist (n children)
    (etypecase n
      (elem-child-node (setf (parent n) instance))
      (string )))
  (when (validate? instance)
    (check-constraint |VC: Element Content| instance)))

(defMethod initialize-instance :after
           ((instance ns-node) &key)
  "upon instantiation, as ns-node generates the effective namespace name and ensures
   that it exists."
  (declare (special |NSC: Prefix Immutable|))
  (with-slots (children value namespace name) instance
    (when (string= (local-part name) *xmlns-prefix-namestring*)
      (setf name *default-namespace-attribute-name*))
    (when namespace
      (setf value (namespace-name namespace)))
    (etypecase value
      (null
       (setf value (value-string children)))
      (string
       (unless (and (stringp (first children))
                    (string= (first children) value)
                    (null (rest children)))
         (setf children (list value)))))
    (unless namespace
      (setf namespace (find-namespace value :if-does-not-exist :create)))
    (check-constraint |NSC: Prefix Immutable| instance)))

#| 20010501, now in the parser only. in constructors for type and attr defs
(defMethod initialize-instance :after
           ((instance abstract-top-level-def-node) &key)
  ;; cache declarations within each given physical entity
  (push instance *entity-declarations*))
|#

(defMethod initialize-instance :after
           ((instance def-elem-property-type) &key)
  (with-slots (prototype children) instance
    (when prototype (setf (def prototype) instance))
    ;; 20010611 xml-V10-2e-errata#E2
    (mapl #'(lambda (values)
              (when (find (first values) (rest values) :test #'bnfp::name=)
                (|VC: No Duplicate Tokens| :context instance :name (first values))))
          children)))

(defMethod initialize-instance :after
           ((instance def-attr) &key)
  (with-slots (children) instance
    (dolist (def children)
      (setf (parent def) instance))))

;; nb, it would be nicer to note the when the entity is bound and to replace them _and_ longer
;; entities which encode character entities with the effective character entity.
;; the would require that the tokenizer recognize character entity instances.
(defMethod initialize-instance :after
           ((instance def-internal-entity) &key)
  (with-slots (children) instance
    ;; normalize and constraint the entity value
    (when (stringp children)
      (setf children (map 'list #'char-code children)))
    ;; (print (list children (= 1 (length children)) (xml-markupchar? (or (first children) 0))))
    (when (and (= 1 (length children)) (xml-markupchar? (first children)))
      (setf children (map 'list #'char-code (format nil "&#~d;" (first children)))))))
;;
;;
;;

(defMethod print-object ((node named-node) stream)
  (print-unreadable-object (node stream :type t :identity t)
    (write (when (slot-boundp node 'name) (slot-value node 'name)) :stream stream)))

(defMethod print-object ((node doc-node) stream &aux uri)
  (print-unreadable-object (node stream :type t :identity t)
    (if (slot-boundp node 'entity-info)
      (if (setf uri (uri node))
        (write-string (uri-namestring uri) stream)
        (write-string "<no uri>" stream))
      (write-string "<no entity info>" stream))))

(defMethod print-object ((instance qname-value) stream)
  (with-slots (namespace name) instance
    (format stream "{~@[~a~]}~a" (when namespace (namespace-name namespace)) name)))

(defMethod print-object ((node elem-node) stream)
  (print-unreadable-object (node stream :identity t :type t)
    (format stream "~s~@[ ~s~]"
            (when (slot-boundp node 'name) (slot-value node 'name))
            (when (slot-boundp node 'ordinality) (slot-value node 'ordinality)))))

(defMethod print-object ((node attr-node) stream)
  (print-unreadable-object (node stream :identity t :type t)
    (write (when (slot-boundp node 'name) (slot-value node 'name)) :stream stream)))

(defMethod print-object ((node ns-node) stream)
  (print-unreadable-object (node stream :identity t :type t)
    (write (when (slot-boundp node 'name) (slot-value node 'name)) :stream stream)
    (write-string " -> " stream)
    (write (when (or (slot-boundp node 'value) (slot-boundp node 'children)) (value node))
           :stream stream)))

(defMethod print-object ((instance pi-node) stream &aux value trimmed)
  (print-unreadable-object (instance stream :type t :identity t)
    (prin1 (name instance) stream)
    (setf value (value instance))
    (write-string " '" stream)
    (dotimes (i (length value))
      (write-char (char value i) stream)
      (when (> i 16) (setf trimmed t) (return)))
    (if trimmed
      (write-string "..." stream)
      (write-char #\' stream))))

(defMethod print-object ((instance def-internal-entity) stream
                         &aux children value)
  (print-unreadable-object (instance stream :type t :identity t)
    (prin1 (name instance) stream)
    (cond ((setf children (children instance))
           (write-string " '" stream)
           (let ((i 0))
             (block print-trimmed
               (map nil #'(lambda (c)
                            (when (>= (incf i) 16) (return-from print-trimmed))
                            (write-char (code-char c) stream))
                    children))
             (when (>= i 16)
               (write-string "..." stream)))
           (write-char #\' stream))
          ((setf value (slot-value instance 'value))
           (format stream " '~a'" value)))))

(defMethod print-object ((node def-elem-type) stream
                         &aux (*print-pretty* t) (*print-right-margin* 1024))
  (with-slots (name children) node
    (print-unreadable-object (node stream :type t :identity t)
      (write (when (slot-boundp node 'name) (slot-value node 'name)) :stream stream)
      (if (typep children '|content-model|)
        (princ children stream)
        (format stream " ~a" children)))))

(defMethod print-object ((node def-attr) stream)
  (print-unreadable-object (node stream :type t :identity t)
    (format stream "~/xqdm:print-qname/ ~(~/xqdm:print-qname/~^ ~)"
            (when (slot-boundp node 'name) (slot-value node 'name))
            (when (slot-boundp node 'children) (slot-value node 'children)))))

(defMethod print-qname ((node named-node) (stream stream) &rest args)
  (declare (dynamic-extent args))
  (apply #'print-qname stream (name node) args))
(defMethod print-qname ((stream stream) (node named-node) &rest args)
  (declare (dynamic-extent args))
  (apply #'print-qname stream (name node) args))
(defMethod print-qname ((stream stream) (name abstract-name) &rest args)
  (declare (ignore args))
  (let ((prefix (prefix name))
        (namespace (namespace-name name))
        (extent (qname-extent name))
        (local-part (local-part name)))
    (etypecase namespace
      (nameset (setf namespace (name namespace)))
      (nameset-tokenizer (setf namespace (name namespace)))
      (null t)
      (string t))
    (if namespace
      (format stream "{~a}~a" namespace local-part)
      (format stream "#~@[~a:~]~a" prefix local-part))
    (when extent
      (format stream "[~a]" extent))
    name))
(defMethod print-qname ((name abstract-name) (stream stream) &rest args)
  (declare (dynamic-extent args))
  (apply #'print-qname stream name args))

  
  

(defGeneric print-ns-node (stream node &rest args)
  (:method ((stream stream) (instance ns-node) &rest args)
           (declare (ignore args))
           (with-slots (name value) instance
             (if *print-pretty*
               (format stream "[~a~@[/~s~]]" name value)
               (print-unreadable-object (instance stream :type t :identity t)
                 (format stream "~a~@[/~s~]"
                         name value)))))
  (:method ((instance ns-node) (stream stream) &rest args)
           (declare (dynamic-extent args))
           (apply #'print-ns-node stream instance args)))


(defParameter *context-print-level* 0)

(defMethod print-content ((instance def-type-qname-context) stream)
  (with-slots (name parents children content-names attr-nodes ns-nodes) instance
    (format stream "~/xqdm:print-qname/" name)
    (if (slot-boundp instance 'parents)
      (format stream " (^:~{ ~/xqdm:print-qname/~})" (mapcar #'name parents))
      (write-string " (^: #<UNBOUND>)" stream))
    (format stream " (@:~{ ~/xqdm:print-qname/~})" (mapcar #'name attr-nodes))
    (let ((*print-pretty* t))
      (format stream " (ns:~{ ~/xqdm:print-ns-node/~})" ns-nodes))
    (format stream " (m:~{ ~/xqdm:print-qname/~})" content-names)
    (when children
      (let ((*context-print-level* (+ *context-print-level* 2)))
        (if *print-pretty*
          (format stream "~{~%~a~}" children)
          (format stream " ->(~{~/xqdm:print-qname/~^ ~})"
                  (mapcar #'name children)))))))

(defMethod print-content ((instance def-attr-qname-context) stream
                          &aux (*print-pretty* t))
  (with-slots (name attr-nodes ns-nodes assignment) instance
    (format stream "~/xqdm:print-qname/" name)
    (format stream " (@:~{ ~/xqdm:print-qname/~})" (mapcar #'name attr-nodes))
    (format stream " (ns:~{ ~/xqdm:print-ns-node/~})" ns-nodes)
    (if assignment
      (format stream " ->~/xqdm:print-qname/" (name assignment))
      (format stream " ->?"))))

(defMethod print-object ((instance qname-context) stream)
  (cond (*print-pretty*
         (dotimes (i *context-print-level*) (write-char #\space stream))
         (write-char #\[ stream)
         (print-content instance stream)
         (write-char #\] stream))
        (t
         (print-unreadable-object (instance stream :type t :identity t)
           (print-content instance stream)))))




#|
(defparameter *test*
   (sxml-element 'test
               "asdf" (sxml-element 'test2 "qwer" "<>")))

(write-node *test* *standard-output*)
(element-bind (name value) entry (print (list name value)))
(element.content (element.content-element *test* 'test2))

(inspect
 (with-input-from-string
   (stream
    "<?xml version='1.0'>
    <!DOCTYPE asdf [<!ELEMENT asdf #PCDATA>]>
    <asdf attribute1='first' attribute2='second'>
     testing&one;
     </asdf>")
   (|Document-Parser| stream)))
(write-node (top-inspect-form) *standard-output*)
 |#

:EOF
