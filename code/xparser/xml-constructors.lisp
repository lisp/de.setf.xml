;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  constructor methods use within the parser.
  these definitions provide literal content model capture only. see "XQDM-validation.lisp"
  for model compilation and validation.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010305' AUTHOR='JAA'/>
  <DELTA DATE='20010614' AUTHOR='JAA'>added defaut encoding captured from input</DELTA>
  <DELTA DATE='20010623'>WFC: Version Match</DELTA>
  <DELTA DATE='10020629'>
   <code>INTERN-QNAMES</code> replaced with <code>ACCUMULATE-QNAMES</code>, which incrementally
   registers the declarations</DELTA>
  <DELTA DATE='20010715'>intern-unprefixed-name replaced with make-ncname</DELTA>
  <DELTA DATE='20010716'>name/symbol distinction;</DELTA>
  <DELTA DATE='20010730'>removed NULL guard on |AttCharData-Constructor|</DELTA>
  <DELTA DATE='20010803'>added link to document for doctype node to support parsing dtd alone</DELTA>
  <DELTA DATE='20010907'>reinstated unique attribute constraint which had been neglected
   by setting element properties rather than specifying them upon instantiation.</DELTA>
  <DELTA DATE='20011010'>specified duration on generated ns attr defs</DELTA>
  <DELTA DATE='20020116'>DoctypeDecl-Constructor changed to collect ALL children, both external and
   internal, including comments and processing-instructions, as the children of the constructed
   node. replaced use of <code>string</code> in |AttDef-Constructor| with <code>local-part</code>.</DELTA>
  <DELTA DATE='20030320'>displaced immutable prefix tests to instantiation; adapted to 0.950 conditions</DELTA>
  <DELTA DATE='20030328'>attribute child sequences constraint to proscribe external entity references</DELTA>
  <DELTA DATE='20050127'>ns-decl constraint relaxed to allow namespace equivalence in addition to identity
    in order to facilitate use of the nick-names as the primary namespace name.</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")

;; nb. resource string buffers are used to reduce consing. these obey the following rules.
;; 1. where character data is parsed, the constructor copies the data out of the buffer and
;; returns it to the pool
;; 2. where numbers are parsed, they pertain to character references only. the numeric value
;; is parsed and the  buffer freed.
;; 3. where a name is parsed (whether a NCName or a QName) as soon as possible, the namestring
;; is interned (whether as a symbol, a qname-value, or a string) and the buffer is freed.
;; while this may not happen in the initial constructor - for example where attributes defer
;; interning until after namespaces are bound, it does happen at this layer and the buffers
;; never pass to initialization methods.


(defTokenConstructors
  "ANY" "ATTLIST" "CDATA" "DOCTYPE" "ELEMENT" "EMPTY" "encoding"
  "ENTITY" "ENTITIES"
  "ID" "IDREF" "IDREFS"  "INCLUDE" "IGNORE" "NDATA" "NMTOKEN" "NMTOKENS"
  "NOTATION" "PUBLIC" "standalone" "SYSTEM" "version" "xml"
  ;; yes and no are not necessary, as they become a constructed
  ;; category and thereby constructed through the YesOrNo term
  ;; "yes" "no"
  "#FIXED" "#IMPLIED" "#PCDATA" "#REQUIRED")



;;
;;
;; utilities

(defun check-replacement-text (text &optional (error-p t) &aux (level 0))
  (map nil #'(lambda (c)
               (case c
                 ((#\& #\%) (incf level))
                 (#\; (when (plusp level) (decf level)))))
       text)
  (cond ((or (zerop level) (= (length text) 1)))
        (error-p
         (xml-error |WFC: Replacement Text Integrity| :text text))
        (t nil)))

(defun check-replacement-data (list &optional (error-p t) &aux (level 0))
  (dolist (c list)
    (case c
      (#.(char-code #\&) (incf level))
      (#.(char-code #\%) (incf level))
      (#.(char-code #\;) (when (plusp level) (decf level)))))
  (cond ((or (zerop level) (= (length list) 1)))
        (error-p
         (xml-error |WFC: Replacement Text Integrity| :text (map 'string #'code-char list)))
        (t nil)))
;(mapcar #'(lambda (s) (check-replacement-text s nil)) '("&" "&asdf;" "&a" "%" "&as%qqw;df;" "%a"))


(defun reduce-decl-sequence (ext-subset-decl*)
  (declare (type list ext-subset-decl*)
           (optimize (speed 3) (safety 1)))
  (let ((decl nil)
        (decl-sequence nil))
    ;; allow for conditional sections and external references which yield lists
    ;; note that both the conditional and the decl-sep may be null values
    (loop (unless (setf decl (pop ext-subset-decl*)) (return))
          (etypecase decl
            (doctype-child-node (push decl decl-sequence))
            (ext-subset-node
             (dolist (decl (nreverse (children decl)))
               (push decl decl-sequence)))
            (list
             (dolist (decl (nreverse decl))
               (push decl decl-sequence)))))
    decl-sequence))

;;
;;
;; auxiliary construction functions implement aspects of the base context-dependent construction
;; operations.

(defGeneric construct-attribute-name (context name)
  (:documentation
   "invoked to generate a name for attributes in the start tag.")
  (:method ((context t) name &aux (cp (position #\: name)))
           ;; intern the name now. observe the 'no default namespace' rule
           (if cp
             (make-uname name :colon-position cp)
             (make-ncname name))))

(defGeneric construct-attribute-plist (context attribute-value name)
  (:documentation
   "produce a property-list to cache an attribute's name/value pair until all namespace bindings
    have been processed and the start tag can be instantiated.")
  (:method ((context t) att-value name)
           (list :att-value att-value :name name)))

(defGeneric construct-construction-context (active-context component)
  (:documentation
   "return the new context active for the combination of the present context and
    the given component.")
  (:method ((context t) (component t)) component))

(defGeneric construct-content-sequence (context content*)
  (:documentation
   "reduce a parsed content sequence to a sequence of element children. this may entail
    flattening and/or extracting components from parsed entities.")
  (:method ((context t) content*)
           (declare (type list content*)
                    (optimize (speed 3) (safety 1)))
           (let ((content nil)
                 (content-sequence nil))
             ;; allow for conditional sections and external references which yield a lists
             ;; note that both the conditional and the decl-sep may be null values
             (loop (unless (setf content (pop content*)) (return))
                   (etypecase content
                     (external-parsed-entity
                      (dolist (content (nreverse (children content)))
                        (push content content-sequence)))
                     ((or elem-child-node string) (push content content-sequence))
                     (list
                      (dolist (content (nreverse content))
                        (push content content-sequence)))))
             content-sequence)))

(defGeneric construct-elem-property-node (def prototype children)
  (:documentation
   "instantiate an element node instance given the definition prototype and the children
     from the parsed document instance. the base method clones the prototype and reinitializes
     it given the new children.")
  (:method ((def def-elem-property-type) (prototype abstract-elem-property-node) children
            &aux new)
           (when (and (is-fixed def) children (not (eq children :default)))
             (when (and (validate? *document*) (not (equalp children (children prototype))))
               (xml-error |VC: Fixed Attribute Default|
                          :name (name prototype) :default (children prototype)
                          :encoded children)))
           (setf new (clone-node prototype))
           (setf (slot-value new 'value) nil
                 (document new) *document*)
           (if (eq children :default)
             (reinitialize-instance new)
             (reinitialize-instance new :children children))
           new))

(defGeneric construct-element-name (context name)
  (:documentation
   "generate a name for the element generic identifier in the start and end tags")
  (:method ((context t) name)
           (make-uname name)))

(defGeneric construct-element-node (construction-context name attr-plist+ns-node*)
  (:documentation
   "construct an element node given a generic identifier namestring and a (ns-node | attr-plist)*
    sequence. attempt to locate a definition to use to constrain the instantiation.")

  (:method ((context null) (name string) (attr-plist+ns-node* t))
           "absent a construction context, the content is discarded."
           nil)

  (:method ((context t) (type def-elem-type) (name t))
           "the base implementation for a known type in the context of a document or a parent element
            instantiates a node of the declared class."
           (make-instance (node-class type) :name name :def type :document *document*))

  (:method ((context t) (type null) (name t))
           "the base implementation without a declared type simply instantiates a generic node."
           (make-elem-node :name name :def type :document *document*))
  #+cl-xml-0-918
  (:method ((context t) (name string) (attr-plist+ns-node* t) &aux type-name type)
           ;; first try to intern the name.
           ;;  if that succeeds, then try to locate the type using the universal name.
           ;;    if that succeeds, then use it.
           ;;    otherwise note the error and proceed without a definition
           ;;  if the intern failed, then try to locate the type using the qname
           ;;    if that succeeds, augment the namespaces from the type and try again to intern
           ;;      if that succeeds, proceed as above
           ;;      if the intern fails again note the error and proceed without a def
           ;;    if that fails note the error and proceed without the def
           ;; the next iteration shifts the context to the definition or null
           (let ((|NSC: Prefix Declared| nil))
             ;; disable prefix binding errors for the first intern attempt
             (setf type-name (construct-element-name context name)))
           (cond ((namespace type-name)
                  ;; the intern succeeded
                  (setf type (find-def-elem-type type-name *document* :if-does-not-exist nil))
                  ; (break "with uname: ~s/~s." name type-name)
                  (unless (or type (not (validate? *document*)))
                    (xml-error |VC: Element Valid| :name name))
                  (construct-element-node type (construct-element-node context type type-name)
                                          attr-plist+ns-node*))
                 (t
                  ;; try to locate the type using the qualified name form <prefix>:<local part>
                  ;; ignore the extent as the type def name should be interned
                  (let ((*distinguish-qname-homographs* nil))
                    (setf type (find-def-elem-type #'(lambda (def-type-name)
                                                  (qname-equal def-type-name type-name))
                                              *document* :if-does-not-exist nil)))
                  ;; (print type)
                  (unless (or type (not (validate? *document*)))
                    (xml-error |VC: Element Valid| :name name))
                  ;; (break "with qname: ~s/~s." name type-name)
                  ;; proceed with the type
                  (construct-element-node type (construct-element-node context type type-name)
                                          attr-plist+ns-node*))))

  (:method ((context t) (name string) (attr-plist+nsdecl-node* t) &aux type-name type node)
           ;; first try to intern the name.
           ;;  if that succeeds, then try to locate the type using the universal name.
           ;;    if that succeeds, then use it.
           ;;    otherwise note the error and proceed without a definition
           ;;  if the intern failed, then try to locate the type using the qname
           ;;    if that succeeds, augment the namespaces from the type and try again to intern
           ;;      if that succeeds, proceed as above
           ;;      if the intern fails again note the error and proceed without a def
           ;;    if that fails note the error and proceed without the def
           ;; the next iteration shifts the context to the definition or null
           (let ((|NSC: Prefix Declared| nil))
             ;; disable prefix binding errors for the first intern attempt
             (setf type-name (construct-element-name context name)))
           (flet ((search-for-type-by-qname (&aux (*distinguish-qname-homographs* nil)
                                                  (temp-type-name
                                                   (make-qname (local-part type-name)
                                                               (prefix type-name))))
                    (find-def-elem-type #'(lambda (def-type-name)
                                                 (qname-equal def-type-name temp-type-name))
                                             *document* :if-does-not-exist nil)))
             (cond ((and (namespace type-name)
                         (setf type (find-def-elem-type type-name *document* :if-does-not-exist nil)))
                    ;; the intern succeeded and a type was found
                    ; (break "with uname: ~s/~s." name type-name)
                    (construct-element-node type (construct-element-node context type type-name)
                                            attr-plist+nsdecl-node*))
                   ((setf type (search-for-type-by-qname))
                    ;; the alternative, matching homographs succeeded, using the qualified name
                    ;; form <prefix>:<local part>, ignoring the extent as the type def name should
                    ;; be interned, and ignoring any namespace which may have been apparent in the
                    ;; document. this requires the later double-check for nsdecl-node attribute validity
                    (when *xml-verbose*
                      (format *trace-output* "universal name mismatch. proceeding with homographs document/dtd: ~s/~s. context: ~s"
                              type-name (name type) *namespace-bindings*))
                    
                    ;; if the type was found as a homonym, unless it had no namespace binding, replace the instance name
                    ;; with the definition name. this because the definition must comprise a declaration for a declaration
                    ;; in addition to those present in the element start tag.
                    ;; (see "qname-resolution.html#contradictory")
                    (when (and (eq *null-namespace* (namespace type-name)) (not (eq *null-namespace* (namespace (name type)))))
                      (setf type-name (name type)))
                    (construct-element-node type (construct-element-node context type type-name)
                                            attr-plist+nsdecl-node*))
                   (t 
                    ;; otherwise, first a validity error, then typeless
                    (when (validate? *document*) (xml-error |VC: Element Valid| :name name))
                    (setf node
                          (construct-element-node nil (construct-element-node context type type-name)
                                                  attr-plist+nsdecl-node*))
                    (setf (slot-value node 'valid) nil)
                    node))))

  (:method ((definition null) (elem-node abstract-elem-node) attr-plist+ns-node*
            &aux ns-nodes attr-nodes)
           ;; where no definition is present, just make simple attribute nodes
           ;; namespaces are now bound, so intern the name
           (setf *construction-context*
                 (construct-construction-context *construction-context* elem-node))
           (mapc #'(lambda (structure)
                     (typecase structure
                       (ns-node (push structure ns-nodes))
                       (list (destructuring-bind (&key name att-value) structure
                               (setf name (construct-attribute-name elem-node name))
                               (push (construct-string-attr-node elem-node att-value name)
                                     attr-nodes)))))
                 attr-plist+ns-node*)
           (setf (attributes elem-node) (nreverse attr-nodes)
                 (namespaces elem-node) (nreverse ns-nodes))
           (check-constraint |WFC: Unique Att Spec| elem-node)
           elem-node)

  #+cl-xml-0-918
  (:method ((definition def-elem-type) (elem-node abstract-elem-node) attr-plist+ns-node*
            &aux (name (name elem-node))  ns-nodes attr-nodes attr-plists)
           ;; cache attributes augmented by copies of
           ;; the prototypes for required and defaulted attributes
           ;; 3. traverse the attributes;
           ;; 3a. mark ns-nodes satisfied in the required spec.
           ;; 3b. instantiate any remaining default ns-nodes
           ;; 3c. intern attr-node names and instantiation them from from the parsed
           ;; structure which still remains; mark them satisfied in the required spec.
           ;; determine the type to instnatiate from the type definition. the respective
           ;; initialization method interns values and constrains their domain.
           ;; 4. check the required spec to constrain their presence
           ;; 5. check the default spec and generate missing attributes
           (setf *construction-context*
                 (construct-construction-context *construction-context* elem-node))
           (let ((declarations (properties definition))
                 (required (copy-seq (props-required definition)))
                 (defaults (copy-seq (props-defaulted definition)))
                 (position nil)
                 (def nil)
                 (prototype nil)
                 (name-prefix (unless (namespace name) (prefix name))))
             (flet ((attr-position (name)
                      (position name declarations :test #'uname-equal :key #'name))
                    #|(intern-unprefixed-name (name &aux symbol)
             (cond ((setf symbol (find-symbol name *null-namespace*))
                    (return-buffer-string name)
                    symbol)
                   (t
                    (intern name *null-namespace*))))|#)
               ;; separate attribute structures from already instantiated ns-nodes
               (mapc #'(lambda (structure &aux position)
                         (cond ((is-ns-node structure)
                                (cond ((setf position (attr-position (name structure)))
                                       (setf (sbit required position) 0)
                                       (setf (sbit defaults position) 0))
                                      (|REC-xml-names-19990114.VC: Attribute Declared|
                                       ;; this constraint is not enforced by default
                                       (xml-error |VC: Attribute Declared|
                                                  :format-control
                                                  "no definition for attribute: ~s."
                                                  :format-arguments (list (name structure)))))
                                (push structure ns-nodes))
                               (t
                                (push structure attr-plists))))
                     attr-plist+ns-node*)
               ;; add ns-nodes from defaults
               (when (position 1 defaults)
                 (dotimes (i (length declarations))
                   (when (plusp (sbit defaults i))
                     (setf def (elt declarations i)
                           prototype (prototype def))
                     (when (is-ns-node prototype)
                       (setf (prefix-value (name prototype)) (namespace prototype))
                       (when (and (null (namespace name)) name-prefix
                                  (string= name-prefix (name prototype)))
                         ;; patch the element name on the fly -
                         ;; make-uname expects a resourced namestring
                         (setf name (intern-name (string name) (namespace prototype))
                               (prefix name) name-prefix)
                         (setf (name elem-node) name))
                       (push (construct-elem-property-node def (prototype def) :default) ns-nodes)
                       (setf (sbit required i) 0)
                       (setf (sbit defaults i) 0)))))
               ;; build attributes from structures
               (setf attr-nodes
                     (mapcar #'(lambda (structure)
                                 (destructuring-bind (&key name att-value) structure
                                   (setf name (construct-attribute-name elem-node name))
                                   (cond ((setf position (attr-position name))
                                          (setf def (elt declarations position))
                                          (setf (sbit required position) 0)
                                          (setf (sbit defaults position) 0)
                                          ;; instantiate relative to declaration
                                          (construct-elem-property-node def (prototype def) att-value))
                                         (t
                                          (xml-error |VC: Attribute Declared|
                                                     :format-control
                                                     "no definition for attribute: ~s."
                                                     :format-arguments (list name))
                                          (make-string-attr-node :name name :children att-value
                                                                 :document *document*)))))
                             attr-plists))
               ;; check for missing required attribites
               (when (and (validate? (document definition)) (position 1 required))
                 (xml-error |VC: Required Attribute|
                            :names (remove nil (map 'list #'(lambda (def y/n)
                                                              (unless (zerop y/n)
                                                                (name def)))
                                                    declarations required))))
               (when (position 1 defaults)
                 (dotimes (i (length declarations))
                   (when (plusp (sbit defaults i))
                     ;; only attribute default remain
                     (push (construct-elem-property-node (elt declarations i)
                                                         (prototype (elt declarations i))
                                                         :default)
                           attr-nodes))))))
           
           (setf (attributes elem-node) (nreverse attr-nodes)
                 (namespaces elem-node) (nreverse ns-nodes))
           (check-constraint |WFC: Unique Att Spec| elem-node)
           elem-node)

  (:method ((definition def-elem-type) (elem-node abstract-elem-node) attr-plist+nsdecl-node*
            &aux (name (name elem-node))  nsdecl-nodes attr-nodes attr-plists)
           ;; cache attributes augmented by copies of
           ;; the prototypes for required and defaulted attributes
           ;; 3. traverse the attributes;
           ;; 3a. mark nsdecl-nodes satisfied in the required spec.
           ;; 3b. instantiate any remaining default nsdecl-nodes
           ;; 3c. intern attr-node names and instantiation them from from the parsed
           ;; structure which still remains; mark them satisfied in the required spec.
           ;; determine the type to instnatiate from the type definition. the respective
           ;; initialization method interns values and constrains their domain.
           ;; 4. check the required spec to constrain their presence
           ;; 5. check the default spec and generate missing attributes
           (setf *construction-context*
                 (construct-construction-context *construction-context* elem-node))
           (let ((declarations (properties definition))
                 (required (copy-seq (props-required definition)))
                 (defaults (copy-seq (props-defaulted definition)))
                 (position nil)
                 (def nil)
                 (prototype nil)
                 (name-prefix (unless (namespace name) (prefix name))))
             (declare (dynamic-extent defaults required))
             (flet ((attr-position (name)
                      (position name declarations :test #'uname-equal :key #'name))
                    #|(intern-unprefixed-name (name &aux symbol)
                      (cond ((setf symbol (intern-name name (null-namespace)))
                             (return-buffer-string name)
                             symbol)
                            (t
                             (intern name (null-namespace)))))|#)
               ;; separate attribute structures from already instantiated nsdecl-nodes
               (mapc #'(lambda (structure &aux position def prototype)
                         (cond ((is-ns-node structure)
                                (cond ((setf position (attr-position (name structure)))
                                       ;; 20100101 : jaa relaxed constraint to apply to fixed and
                                       ;;  declare default values only, but not to implied "" default
                                       ;; double check for nsdecl-node attribute validity
                                       ;; in most cases, they match, otherwise the definition
                                       ;; would not have been found. ! but, in a case where
                                       ;; a qname/homographic match overrode an apparent prefix/ns
                                       ;; binding, or compensated a missing one, this check is 
                                       ;; required. this is enforced unless the definition was :IMPLIED,
                                       ;; in which case no value was provided and the prototype value
                                       ;; is just a default. nb. independant of the definition's fixedness,
                                       ;; if a value was provided, the discrepancy may cause subsequent
                                       ;; identifer namespaces to diverge, so it is seems prudent to
                                       ;; signal an error.
                                       (setf def (elt declarations position)
                                             prototype (prototype def))
                                       (when (and (member (stipulation def) '(:fixed nil))
                                                  (not (equal (namespace-name prototype)
                                                              (namespace-name structure)))
                                                  (not (eql (namespace prototype)
                                                            (namespace structure))))
                                         (xml-error |NSC: Namespace Attribute Default|
                                                    :name (name prototype) :default (value prototype)
                                                    :encoded (namespace-name structure)))
                                       (setf (sbit required position) 0)
                                       (setf (sbit defaults position) 0))
                                      (|REC-xml-names-19990114.VC: Attribute Declared|
                                       ;; this constraint is not enforced by default
                                       (xml-error |VC: Attribute Declared|
                                                  :format-control
                                                  "no definition for attribute: ~s."
                                                  :format-arguments (list (name structure)))
                                       (setf (slot-value elem-node 'valid) nil)))
                                (push structure nsdecl-nodes))
                               (t
                                (push structure attr-plists))))
                     attr-plist+nsdecl-node*)
               ;; add nsdecl-nodes from defaults
               (when (position 1 defaults)
                 (dotimes (i (length declarations))
                   (when (plusp (sbit defaults i))
                     (setf def (elt declarations i)
                           prototype (prototype def))
                     (when (is-ns-node prototype)
                       ;; first generate a new node from the instance. this will ensure the document's
                       ;; specific namespace is recognized.
                       (let* ((nsdecl-node (construct-elem-property-node def prototype :default))
                              (document-namespace (namespace nsdecl-node)))
                         (setf (prefix-value (name prototype)) document-namespace)
                         (when (and name-prefix (string= name-prefix (local-part (name prototype))))
                           ;; patch the element name on the fly -
                           (setf name (intern-name (local-part name) document-namespace))
                           (setf (name elem-node) name))
                         (push nsdecl-node nsdecl-nodes))
                       (setf (sbit required i) 0)
                       (setf (sbit defaults i) 0)))))
               ;; build attributes from structures
               (setf attr-nodes
                     (mapcar #'(lambda (structure)
                                 (destructuring-bind (&key name att-value) structure
                                   (setf name (construct-attribute-name elem-node name))
                                   (cond ((setf position (attr-position name))
                                          (setf def (elt declarations position))
                                          (setf (sbit required position) 0)
                                          (setf (sbit defaults position) 0)
                                          ;; instantiate relative to declaration
                                          (construct-elem-property-node def (prototype def) att-value))
                                         (t
                                          (when (and (validate? (document definition))
                                                     (not (attr-position *wild-uname*)))
                                            (xml-error |VC: Attribute Declared|
                                                       :format-control
                                                       "no definition for attribute: ~s."
                                                       :format-arguments (list name))
                                            (setf (slot-value elem-node 'valid) nil))
                                          (make-string-attr-node :name name :children att-value
                                                                 :document *document*)))))
                             attr-plists))
               ;; check for missing required attribites
               (when (and (validate? (document definition)) (position 1 required))
                 (xml-error |VC: Required Attribute|
                            :names (remove nil (map 'list #'(lambda (def y/n)
                                                              (unless (zerop y/n)
                                                                (name def)))
                                                    declarations required))))
               ;; add remaining defaults
               (when (position 1 defaults)
                 (dotimes (i (length declarations))
                   (when (plusp (sbit defaults i))
                     ;; only attribute default remain
                     (push (construct-elem-property-node (elt declarations i)
                                                         (prototype (elt declarations i))
                                                         :default)
                           attr-nodes))))))
           
           (setf (attributes elem-node) (nreverse attr-nodes)
                 (namespaces elem-node) (nreverse nsdecl-nodes))
           (check-constraint |WFC: Unique Att Spec| elem-node)
           elem-node))

(defGeneric construct-ns-node (context attribute-value name &optional colon-position)
  (:documentation
   "instantiate a namespace binding node given the prefix name and the uri value.")
  (:method ((context t) att-value name &optional (pos (position #\: name))
            &aux ns-name namespace)
           ;; for a namespace binding, resolve the namespace name,
           ;; intern the attribute name now, and instantiate a ns-node
           (setf ns-name (value-string att-value))
           (unless (stringp ns-name)
             (xml-error "namespace name syntax error: ~s: ~s." name att-value))
           (when (and pos (zerop (length ns-name)))
             (xml-error |NSC: No Null Namespace Bindings| :name name))
           (setf namespace (find-namespace ns-name :if-does-not-exist :create))
           ;; nb, the literal namespace is passed here, but it may well be overridden where
           ;; dynamic spaces, rather than packages, are in effect
           (make-ns-node :name (make-uname name :colon-position pos :namespace *xmlns-namespace*)
                         :children att-value :uri ns-name :namespace namespace
                         :document *document*)))

(defGeneric construct-string-attr-node (context att-value name)
  (:documentation
   "instantiate an attribute node given the name and the value.
    this serves in cases where the node is instantiated absent a declaration.")
  (:method ((context t) att-value name)
           (make-string-attr-node :name name :children att-value :document *document*)))



#|
;; version for distinct start and end tag rules
(defConstructor |Element-Constructor| (structure)
  ;; by this point, any "in-scope" namespaces are bound, the start/empty
  ;; tag is instantiated. here bind the children
  (with-xqdm-substructures ((|EmptyElemTag| empty-tag)
                      (|STag| start-tag)
                      (|ContentSequence| content)
                      (|ETag| end-tag))
      structure
      (when start-tag
        (with-xqdm-substructures ((|QName| end-name)) end-tag
          (unless end-name
            (xml-error |DMC: QName Required| :node end-tag))
          (setf end-name (make-uname end-name))
          (unless (uname-equal (name start-tag) end-name)
            (if (string= (name start-tag) end-name)
              (xml-error |NSC: Element Type Match|
                       :start-name (name start-tag) :end-name end-name)
              (xml-error |WFC: Element Type Match|
                         :start-name (name start-tag) :end-name end-name)))))
      (setf (children (or empty-tag start-tag)) content)
      (or empty-tag start-tag)))
|#


;;
;;
;; parsed structure constructors

(defIdentityConstructor |AttValue| )

(defConstructorMethod |AttCharData-Constructor| ((construction-context t) structure)
  #|(etypecase structure
    (string (check-replacement-text structure)
            structure)
    (null nil))|#
  structure)

(defun cons-attribute-child-sequence (att-child att-child-sequence)
  "construct a child sequence, but observe restrictions on constitution"
  (typecase att-child
    (null att-child-sequence)
    (def-internal-entity                ; internal entities appear here only if they were not expanded
                                        ; as a pushed input source when tokenizing - retain them
      (cons att-child att-child-sequence))
    ((or string number character)       ; whereby the parser produces strings only
     (cons att-child att-child-sequence))
    ((or def-external-entity external-parsed-entity)    ; for both expanded and not
     (xml-error |WFC: No External Entity References| :entity att-child)
     (cons att-child att-child-sequence))       ; if ignored, don't expand
    (t
     (xml-error "illegal attribute child: ~s." att-child)
     att-child-sequence)))

(defConstructor |AttChildSequence| (att-child att-child-sequence)
  (cons-attribute-child-sequence att-child att-child-sequence))

(defConstructor |DefaultAttChildSequence| (att-child att-child-sequence)
  (cons-attribute-child-sequence att-child att-child-sequence))

(defConstructor |AttChild| (att-char-data parsed-reference reference)
  ;; REC-xml-20001006/4.4.5 : indicates that the reference is included in literal. 
  ;; if the entity reaches this point, then it has not been expanded, so just include
  ;; it among the children.
  ;; 20010730.jaa removed null guard to permit null-valued constructors
  (or att-char-data
      parsed-reference
      reference
      ;; (xml-error "|AttChild| no sub-structure specified.")
      ))

;;
;;
;; attribute construction:
;; the individual definitions are processed only so far as to create an independent, unbound
;; definition node for the individual attribute. these are then collected as a attribute list
;; declaration, at which point the name of the context element is specified and a container
;; def-attr instance is constructed. binding reamins deferred and names are unintered, until
;; the entire document definition has been collected.
;;

(defConstructor |AttDef-Constructor| (att-type default-decl attribute-name
                                   &aux initargs class default-value prototype def
                                   attribute-namestring)
  (destructuring-bind (&key required implied fixed att-value)
                      default-decl
    (cond (required (setf (getf initargs :stipulation) :required))
          (implied (setf (getf initargs :stipulation) :implied))
          (fixed (setf (getf initargs :stipulation) :fixed)))
    ;(print (list attribute-name initargs))
    (when att-value (setf default-value att-value))
    (destructuring-bind (&key string-type tokenized-type enumerated-type)
                        att-type
      (cond (string-type (setf class *class.string-attr-node*))
            (tokenized-type (setf class
                                  (case tokenized-type
                                    (|xml|:|ID| *class.id-attr-node*)
                                    (|xml|:|IDREF| *class.id-ref-attr-node*)
                                    (|xml|:|IDREFS| *class.id-refs-attr-node*)
                                    (|xml|:|ENTITY| *class.entity-attr-node*)
                                    (|xml|:|ENTITIES| *class.entities-attr-node*)
                                    (|xml|:|NMTOKEN| *class.nmtoken-attr-node*)
                                    (|xml|:|NMTOKENS| *class.nmtokens-attr-node*)
                                    (t
                                     (xml-error "unknown tokenized type: ~s."
                                                tokenized-type)))))
            (enumerated-type
             (destructuring-bind (&key notation-type  enumeration)
                                 enumerated-type
               (cond (notation-type
                      (setf class *class.notation-attr-node*)
                      (when (validate? *document*)
                        (dolist (name notation-type)
                          (find-def-notation name *document* :if-does-not-exist :error)))
                      (setf (getf initargs :enumeration) notation-type))
                     (enumeration
                      (setf class *class.enumeration-attr-node*)
                      (setf (getf initargs :enumeration) enumeration))
                     (t
                      (xml-error "notation/enumeration missing: ~s."
                                 enumerated-type)))))
            (t
             (xml-error "type missing: ~s." att-type)))))
    (setf attribute-name (make-uname attribute-name)
          attribute-namestring (local-part attribute-name))
    (cond ((string= (prefix attribute-name) *xmlns-prefix-namestring*)
           #| deferred to prototype instantiation
           (when (and (string= attribute-namestring *xmlns-prefix-namestring*)
                      (string= (prefix attribute-name) *xmlns-prefix-namestring*))
             (xml-error "xmlns namespace is constant."))|#
           (unless (subtypep class *class.string-attr-node*)
             (xml-error |NSC: CDATA Required for Namespace Node|
                        :format-control "attribute type not permitted for namespace nodes: ~s: ~s."
                        :format-arguments (list attribute-name class)))
           (if (string= attribute-namestring *xmlns-prefix-namestring*)
             (setf attribute-name *default-namespace-attribute-name*)
             (setf attribute-name (intern-name (local-part attribute-name) *xmlns-namespace*)))
           (setf class *class.ns-node*))
          ((subtypep class *class.id-attr-node*)
           (unless (member (getf initargs :stipulation) '(:REQUIRED :IMPLIED))
             (xml-error |VC: ID Attribute Default| :name attribute-name))))
    ;; instantiate a prototype of the correct class. if a default is present, check it.
    (setf prototype (make-instance class :name attribute-name :children default-value
                                   :value nil :document *document*))
    (setf def (apply #'make-def-elem-property-type
                     :name attribute-name :prototype prototype
                     initargs))
    (when (and xutils::|REC-xml-19980210.Validate Attribute Defaults| default-value)
      (value prototype))
    def)

(defConstructor |AttDefSequence| (att-def att-def-sequence)
  (cons att-def att-def-sequence))


(defConstructor |AttlistDecl| (att-def-sequence name &aux def)
  ;; make an interim name, generate a container for the individual attribute definitions
  ;; and add the definition set to those accumulated in the definition entity branch.
  (setf name (make-uname name))
  (setf def
        (make-def-attr :name name :attributes att-def-sequence :document *document*))
  (accumulate-qnames def)
  (push def *entity-declarations*)
  def)


(defConstructor |AttributeSequence| (attribute attribute-sequence)
  ;; allow for an attribute constructor which suppresses
  (if attribute
    (cons attribute attribute-sequence)
    attribute-sequence))

(defConstructorMethod |Attribute-Constructor|
  ((construction-context t) att-value namestring &aux pos ns-node)
  (unless namestring (xml-error |NGC: QName Required| :node att-value))
  (cond ((or (string= namestring *xmlns-prefix-namestring*)
             (and (setf pos (position #\: namestring))
                  (string= namestring *xmlns-prefix-namestring* :end1 pos)))
         (when (and pos (string= namestring *xmlns-prefix-namestring* :start1 (1+ pos)))
           (xml-error "xmlns namespace is constant."))
         (setf ns-node (construct-ns-node construction-context att-value namestring pos))
         (etypecase ns-node
           (abstract-ns-node
            ;; dereference the namespace name through the node to let it look at the name first
            (setf (prefix-value (name ns-node)) (namespace ns-node)))
           (null nil)
           (cons
            (setf (prefix-value (first ns-node)) (rest ns-node))))
         ns-node)
        (t
         ;; otherwise, defer the instantiation until the element type is known
         ;; in order to choose the correct attribute node type.
         ;; (attr-node name att-value)
         (construct-attribute-plist construction-context att-value namestring))))

(defConstructor |AttType| (enumerated-type string-type tokenized-type)
  (nconc (when enumerated-type (list :enumerated-type enumerated-type))
         (when string-type (list :string-type string-type))
         (when tokenized-type (list :tokenized-type tokenized-type))))
         

(defIdentityConstructor |Cardinality| )

(defConstructor |CDSect| (|CDataCharData| |CDEnd| |CDStart|)
    (declare (ignore  |CDEnd| |CDStart|))
    |CDataCharData|)

(defNullConstructor |CDEnd|)

(defNullConstructor |CDStart| )

(defConstructorMethod |CharData-Constructor| ((construction-context t) structure)
  structure)

(defConstructorMethod |CDataCharData-Constructor| ((construction-context t) structure)
  structure)

;; should have been expanded by the reader
(defConstructor |CharRef| (hex-number number)
  (let ((value (make-array 1 :element-type 'character
                           :initial-element
                           (code-char (or number hex-number)))))
    (make-ref-character-entity
     :name (or number hex-number) :document *document*
     :value value)))

(defConstructorMethod |Comment-Constructor| ((context t) comment-char-data)
  (make-comment-node :children (list comment-char-data) :document *document*))

(defLiteralConstructor |CommentCharData| )

(defConstructor |ConditionalSect| (ignore-sect include-sect named-conditional-sect)
  (declare (ignore ignore-sect))
  (or include-sect named-conditional-sect))

(defConstructorMethod |Content-Constructor|
  ((context t) |CDSect| |CharData| |Comment| |Element| |ParsedReference| |Pi| |Reference|)
  (or |CDSect| |CharData| |Comment| |Element| |ParsedReference| |Pi| |Reference|))

(defConstructorMethod |ContentSequence-Constructor| ((context t) content content-sequence)
  (:documentation
   "accumulate the an additional term of a content sequence. NULL elements are ignored.")
  (if content
    (cons content content-sequence)
    content-sequence))

(defConstructor |Children| (cardinality choice-or-sequence)
  (case cardinality
    (|xml|:|?| (make-instance '|?-content| :expression choice-or-sequence))
    (|xml|:|*| (make-instance '|*-content| :expression choice-or-sequence))
    (|xml|:|+| (make-instance '|+-content| :expression choice-or-sequence))
    (t (make-instance '|content| :expression choice-or-sequence))))

(defConstructor |Choice| (structure) (nreverse structure))

(defConstructor |ChoiceOrSeq| (Choice Cp Seq)
  (if Choice
    (make-instance '|\|-content| :expressions (cons Cp Choice))
    (make-instance '|,-content| :expressions (cons Cp Seq))))

(defConstructor |ContentSpec| (any children empty mixed)
  (cond (any  ;; any permits character data
         (make-instance '|MIXED-content| :expression
                        (make-instance '|content-name| :name *wild-name*)))
        (empty ;; EMPTY permits whitespace only
          (make-instance '|*-content| :expression
                         (make-instance '|content-name| :name *empty-name*)))
        (mixed)
        (children)))

(defConstructor |Cp| (cardinality choice-or-seq qname &aux particle)
  (cond (qname
         (setf qname (make-uname qname))
         (setf particle (make-instance '|content-name| :name qname)))
        (choice-or-seq
         (setf particle choice-or-seq))
        (t
         (return-from |Cp-Constructor| nil)))
  (case cardinality
    (|xml|:|?| (make-instance '|?-content| :expression particle))
    (|xml|:|*| (make-instance '|*-content| :expression particle))
    (|xml|:|+| (make-instance '|+-content| :expression particle))
    (t (make-instance '|content| :expression particle))))

;;(defIdentityConstructor |DeclSep| )
(defConstructor |DeclSep| (parsed-external-subset pe-reference)
  (or parsed-external-subset pe-reference))

(defConstructorMethod |DefaultAttCharData-Constructor| ((construction-context t) structure)
  "construct a default attribute value from a parsed string.
   the default method simply returns the string. unless the attribute declaration implementation
   is changed in parallel, this identiy behaviour should likely remain the case."
  #|(etypecase structure
    (string (check-replacement-text structure)
            structure)
    (null nil))|#
  structure)

(defConstructor |DefaultAttChild-Constructor| (att-char-data parsed-reference reference)
  ;; REC-xml-20001006/4.4.5 : indicates that the reference is included in literal. 
  ;; if the entity reaches this point, then it has not been expanded, so just include
  ;; it among the children
  ;; 20010731.jaa removed null guard.
  (or att-char-data att-char-data
      parsed-reference parsed-reference
      reference reference
      ;(xml-error "|DefaultAttChild| no sub-structure specified.")
      ))

(defIdentityConstructor |DefaultAttValue| )

(defConstructor |DefaultDecl-Constructor| (att-value fixed implied required)
  (nconc (when att-value (list :att-value att-value))
         (when fixed (list :fixed fixed))
         (when required (list :required required))
         (when implied (list :implied implied))))

(defConstructor |DoctypeDecl-Constructor| (external-id internal-subset-decl* qname
                                           &aux external-version-info
                                           external-encoding-decl
                                           external-subset-decl*
                                           declarations
                                           children)
  (declare (ftype (function (t) t) parse-external-subset))
  (setf internal-subset-decl* (reduce-decl-sequence internal-subset-decl*))
  (destructuring-bind (&key system-literal pubid-literal &aux uri)
                      external-id
    (cond ((or system-literal pubid-literal)
           (let ((ext-subset-node nil))
             (cond ((and pubid-literal
                         (setf ext-subset-node (gethash pubid-literal *external-subset-cache*))))
                   (t
                    (setf uri (resolve-entity-identifiers pubid-literal system-literal *xml-base*))
                    (handler-bind
                      ((error #'(lambda (error)
                                  ; dynamic handler to be able to break in context (break)
                                  (xml-error |WFC: External Subset| :system-id system-literal
                                             :public-id pubid-literal :datum error))))
                      (setf ext-subset-node (parse-external-subset uri ))
                      (when (and pubid-literal *external-subset-cache*)
                        (setf (gethash pubid-literal *external-subset-cache*)
                              ext-subset-node)))))
             ;; combine the internal and external subsets
             (setf declarations
                   ;(nconc declarations (collect-declarations (children ext-subset-node))))
                   (nconc internal-subset-decl*
                          (collect-declarations (children ext-subset-node))))
             ;; (print declarations)
             (setf external-version-info (version ext-subset-node)
                   external-encoding-decl (encoding ext-subset-node)
                   external-subset-decl* (collect-comments-and-pis (children ext-subset-node))
                   children (append internal-subset-decl* external-subset-decl*))))
          (t
           (setf declarations internal-subset-decl*
                 children internal-subset-decl*)))
    
    ;; declarations need to be interned before the remainder of the document can be read
    (setf qname (make-uname qname))
    ;; first locate the root definition and make sure that it has a default namespace binding
    ;; (inspect declarations)
    (unless (setf *root-def-type*
                  (find-if #'(lambda (def)
                               (and (is-def-elem-type def)
                                    ;; compare with qname-equal as names are not interned yet.
                                    (qname-equal qname (name def))))
                           declarations))
      #|(dolist (def declarations)
                (when (and (is-def-elem-type def) (string= (name def) qname))
                  don't do this here, as it would override a declaration - see below
                  ;; ensure that the null namespace is bound in the root element definition
                  ;; and bind the def to tell the parser not to bind the null namespace itself
                   (unless (find *default-namespace-attribute-name* (properties def) :key #'name)
                    (push (make-def-attr :name (name def)
                                         :attributes (list *def-null-namespace-node*)
                                         :document *document*)
                          declarations))
                  (return (setf *root-def-type* def))))|#
      ;; where definitions were present, but none matches the doctype name, the document
      ;; cannot be valid, since the root element won't have a definition.
      ;; if validity is not being tested, then note the condition when diagnostics are
      ;; enabled
      (cond ((and (validate? *document*) (find-if #'is-def-elem-type declarations))
             (xml-error |VC: Element Valid| :name qname))
            (*xml-verbose*
             (warn "no root type recognized: ~s: ~s." qname *input-source*))))
          
    ;; next propagate the namespace constraints
    ;; 20010628 when the root type known, assert a default null namespace declaration for it
    ;; as an artificial additional declaration for default namespace binding. done
    ;; as the last declaration in order that it serve as a default declaration.
    ;; the propagation set comprises all declarations collected.
    ;; nb. the alternative, of providing a static binding for the "" prefix will not work,
    ;; as it would prevent CONSTRUCT-ELEMENT-NODE from discovering of a type declaration
    ;; which includes a different binding for the default namespace by matching the qualified names.
    ;;
    ;; 20010628 qnames are no longer resolved en-mass, but rather are integrated incrementally
    ;;  (intern-qnames (nconc (remove nil (mapcar #'qname-context declarations))
    ;;                 (when *root-def-type*
    ;;                        (list
    ;;                       (qname-context
    ;;                        (make-def-attr :name (name *root-def-type*)
    ;;                                       :attributes (list *def-null-namespace-node*)
    ;;                                       :document *document*))))))
     #|20020206 leave this step out as the null namespace is now implicit (from 0.950)
    (when *root-def-type*
      (accumulate-qnames (make-def-attr :name (name *root-def-type*)
                                        :attributes (list (def-null-namespace-node))
                                        :document *document*
                                        :extent :ephemeral)))|#
    ;; (break)
    ;; then intern the names. specify the root declaration for documentary purposes
    (assign-universal-names *root-def-type*)
    
    ;; nb entity and notation declarations were bound upon construction, since
    ;; the names are all null-namespace. attribute declarations have been collected
    ;; into the element declarations during qname resolution. it remains only to
    ;; bind element declarations now that the universal names are known
    (map-node-by-type #'is-def-elem-type
                      #'(lambda (def) (bind-definition def *document*))
                      declarations)
    ;; the adopt the universal name of the root type
    (when *root-def-type*
      (setf qname (name *root-def-type*)))
    (make-document-type-declaration-information-node
     :name qname :uri *xml-base*
     :document *document*
     :encoding external-encoding-decl
     :version external-version-info
     :uri uri :system-id system-literal :public-id pubid-literal
     :children children)))


(defConstructor |DoctypeProlog| (doctype-decl misc-sequence)
  (nconc (when doctype-decl (list :doctype-decl doctype-decl))
         (when misc-sequence (list :misc-sequence misc-sequence))))

(defConstructorMethod |Document-Constructor|
  ((construction-context t) third-misc-sequence prolog root &aux document-name element-name)
  (destructuring-bind (&key xml-decl ((:misc-sequence first-misc-sequence)) doctype-prolog)
                      prolog
    (destructuring-bind (&key doctype-decl ((:misc-sequence second-misc-sequence)))
                        doctype-prolog
      (unless (is-abstract-elem-node root)
        (xml-error |NGC: Unique Root Element Required|
                   :format-control "root element not present: ~s."
                   :format-arguments (list prolog root third-misc-sequence)))
      (cond ((is-document-type-declaration-information-node doctype-decl)
             (setf element-name (name root)
                   document-name (name doctype-decl))
             (unless (and (string= (local-part element-name) (local-part document-name))
                          (string= (prefix element-name) (prefix document-name)))
               (xml-error |VC: Root Element Type| :root-name element-name
                          :document-name document-name)))
            ((setf doctype-decl (entity-info *document*))
             ;; w/o an explicit declaration, adopt the root element gi
             (setf (name doctype-decl) (name root))))
      ;; note that there are no declarations, they were bound in the provisional document when the
      ;; doctype node was constructed...
      ;; the actual encoding is captured here as a default when no declaration
      ;; was present.
      (destructuring-bind (&key (encoding-decl *input-encoding*)
                                &allow-other-keys)
                          xml-decl
        (apply #'initialize-instance *document*
               :entity-info doctype-decl :encoding-decl encoding-decl xml-decl))
      (setf (children *document*)
            (remove-if (complement #'is-doc-child-node)
                       (append first-misc-sequence second-misc-sequence
                               (cons root third-misc-sequence))))
      *document*)))

(defConstructorMethod |Element-Constructor| ((construction-context t) content* etag stag)
  ;; by this point, any "in-scope" namespaces are bound, the start/empty
  ;; tag is instantiated, the name of the end tag is known. here bind the children
  ;; (break)
  (when (and etag stag)
    (setf etag (construct-element-name construction-context etag))
    (unless (uname-equal (name stag) etag)
      (xml-error |WFC: Element Type Match|
                 :start-name (name stag) :end-name etag)))
  (when content*
    (setf content* (construct-content-sequence construction-context content*)))
  (setf (children stag) content*)
  stag)

(defConstructor |ElementDecl-Constructor| (content-spec name &aux model def)
  ;; at this point the definition exists as an uninterned name and a bnf model which
  ;; also comprises uninterned symbols. construct an element definition to hold these
  ;; but defer the binding.
  (setf name (make-uname name))
  (setf model (make-instance '|content-model|
                :lhs (make-instance '|type-name| :name name) :rhs (list content-spec)))
  ;; (inspect model) (break)
  (setf def (make-def-elem-type :name name :model model :document *document*))
  ;; !! don't bind the definitions for use in the document entity.
  ;; !! the binding must wait for qname resolution
  ;; (bind-definition def *document*)
  (accumulate-qnames def)
  (push def *entity-declarations*)
  def)


#|tag syntax has been reformulated to eliminate ambiguity
(defConstructor |EmptyElemTag-Constructor| (&rest structure)
  (declare (dynamic-extent structure))
  (apply #'tag-constructor structure))
|#

(defLiteralConstructor |EncNameCharData|)

(defIdentityConstructor |EncodingDecl| )
       
(defConstructor |EntityCharData| (value)
  (etypecase value
    (string (check-replacement-text value)
            value)
    (null nil)))

(defConstructor |EntityData| (value)
  (etypecase value
    (cons (check-replacement-data value)
            value)
    (null nil)))
  
(defConstructor |EntityChildSequence| (entity-child entity-child-sequence)
  (cons entity-child entity-child-sequence))

(defConstructor |EntityDecl| (|GEDecl| |PEDecl|)
  (or |GEDecl| |PEDecl|))

(defConstructor |EntityDef| (entity-value external-id ndata-decl)
  `(,@(when entity-value `(:entity-value ,entity-value))
    ,@(when external-id `(:external-id ,external-id))
    ,@(when ndata-decl `(:ndata-decl ,ndata-decl))))

(defConstructor |EntityRef| (name)
  (setf name (make-ncname name))
  (make-ref-general-entity :name name :document *document*))

(defIdentityConstructor |EntityValue| )

;; REC-xml-20001006/4.4.5 : PEReference encodings should have been included in
;; the literal text by the reader. if the reference reaches this point, then
;; they references are not ... so just take the substructure indiscriminately

(defConstructor |EntityChild| (|EntityCharData| |PEReference| |Reference|)
    (or |EntityCharData| |PEReference| |Reference|))

(defConstructor |EnumeratedType| (enumeration notation-type)
  `(,@(when enumeration `(:enumeration ,enumeration))
    ,@(when notation-type `(:notation-type ,(mapcar #'make-ncname notation-type)))))

(defIdentityConstructor |Enumeration| )

(defConstructor |EnumerationSequence| (enumeration-sequence nmtoken)
  (cons nmtoken enumeration-sequence))

(defConstructor |Eq| () nil)

(defConstructor |ExternalID| (pubid-literal system-literal)
  (list :pubid-literal pubid-literal
        :system-literal system-literal))

(defConstructorMethod |ExtParsedEnt-Constructor| ((construction-context t) content* text-decl)
  (destructuring-bind (&key (encoding-decl *input-encoding*) &allow-other-keys) text-decl
    (setf content* (construct-content-sequence construction-context content*))
    (make-external-parsed-entity :children content* :document *document*
                                 :entity-info
                                 (apply #'make-entity-information-node
                                        :encoding-decl encoding-decl text-decl))))

(defConstructor |ExtSubset| (ext-subset-decl* text-decl)
  ;; intern names for the declarations within the given external subset
  ;; return the structure verbatim to identify the text declaration and the content sequence
  ;; (inspect (list 'ext-subset-decl* ext-subset-decl* 'text-decl text-decl))
  (setf ext-subset-decl* (reduce-decl-sequence ext-subset-decl*))
  ;; (intern-qnames (remove nil (map 'list #'qname-context ext-subset-decl*)))
  ;; propagate namespace among cumulative declarations.
  ;; 20010628 qnames are no longer resolved en-mass, but rather are integrated incrementally
  ;; (intern-qnames (remove nil (map 'list #'qname-context *entity-declarations*)))
  ;; default the encoding
  (destructuring-bind (&key (encoding-decl *input-encoding*) &allow-other-keys) text-decl
    (make-ext-subset-node  :entity-info
                           (apply #'make-entity-information-node
                                        :encoding-decl encoding-decl text-decl)
                           :defs ext-subset-decl*)))

#|
(defConstructor |ExtSubset| (decl-sequence text-decl)
  ;; intern names for the declarations within the given external subset
  ;; return the structure verbatim to identify the text declaration and the content sequence
  (intern-qnames (remove nil (mapcar #'qname-context decl-sequence)))
  (nconc (when text-decl (list :text-decl text-decl))
         (when decl-sequence (list :ext-subset-decl-sequence decl-sequence))))

(defConstructor |ExtSubsetDeclSequence| (structure)
  (let ((decl nil)
        (result-sequence (make-array 32 :fill-pointer 0 :adjustable t)))
    ;; allow for conditional section, which yields a list in itself
    ;; note that both the conditional and the decl-sep may be null values
    (loop (unless (setf decl (pop structure)) (return result-sequence))
          (typecase decl
            (doctype-child-node
             (vector-push-extend decl result-sequence))
            (sequence
             (map nil #'(lambda (decl) (vector-push-extend decl result-sequence))
                  decl))))))
|#

;;(defIdentityConstructor |ExtSubsetDecl|
;; retain the decl-sep | others 

(defConstructor |ExtSubsetDecl| (|ConditionalSect| |DeclSep| |MarkupDecl|)
    (or |ConditionalSect| |DeclSep| |MarkupDecl|))

(defIdentityConstructor |ETag| )

(defConstructor |GEDecl| (entity-def ncname)
  (destructuring-bind (&key entity-value external-id ndata-decl)
                      entity-def
    (setf ncname (make-ncname ncname))
    (cond (external-id
           (destructuring-bind (&key system-literal (system-id system-literal)
                                     pubid-literal (public-id pubid-literal))
                               external-id
             (when ndata-decl
               (when (validate? *document*)
                 (find-def-notation ndata-decl *document*)))
             (bind-definition
              (make-def-external-general-entity
               :name ncname :notation ndata-decl
               :system-id system-id :public-id public-id :document *document*)
              *document*)))
          (t  ;; nb. the value may be null for an empty literal
           (bind-definition
            (make-def-internal-general-entity
             :name ncname :children entity-value :document *document*)
            *document*)))))

(defConstructor |HexNumber| (value)
  ;; the string value in this case was buffered in the reader macro. just leave it
  (parse-integer value :radix 16))

(defNullConstructor |Ignore| )

(defNullConstructor |IgnoreCData| )

(defNullConstructor |IgnoreSect| )

(defNullConstructor |IgnoreSectContents| )

(defConstructor |IncludeSect| (ext-subset-decl*)
  (reduce-decl-sequence ext-subset-decl*))

(defConstructor |IntSubsetDecl| (|DeclSep| |MarkupDecl|)
  (or |DeclSep| |MarkupDecl|))

#|
(defConstructor |IntSubsetDeclSequence| (structure)
  (let ((decl nil)
        (result-sequence (make-array 32 :fill-pointer 0 :adjustable t)))
    ;; allow for conditional section, which yields a list in itself
    ;; note that both the conditional and the decl-sep may be null values
    (loop (unless (setf decl (pop structure)) (return result-sequence))
          (typecase decl
            (doctype-child-node
             (vector-push-extend decl result-sequence))
            (sequence
             (map nil #'(lambda (decl) (vector-push-extend decl result-sequence))
                  decl))))))
|#

(defConstructor |MarkupDecl| (|AttlistDecl| |Comment| |ElementDecl| |EntityDecl| |NotationDecl| |Pi|)
  (or |AttlistDecl| |Comment| |ElementDecl| |EntityDecl| |NotationDecl| |Pi|))

(defConstructor |Misc| (comment processing-instruction)
  (or comment processing-instruction))

(defConstructor |MiscSequence| (misc sequence)
  (cons misc sequence))

#|(defIdentityConstructor |Mixed| )|#

(defConstructor |Mixed| (names)
  (let ((pcdata (make-instance '|content-name| :name *mixed-name*)))
    (make-instance '|MIXED-content|
      :expression
      (if names
        (make-instance '|\|-content|
          :expressions
          (cons pcdata (mapcar #'(lambda (name)
                                   (setf name (make-uname name))
                                   (make-instance '|content-name| :name name))
                               names)))
        pcdata))))

(defIdentityConstructor |MixedCardinality| )

(defConstructor |NamedConditionalSect| (ext-subset-decl* pe-reference)
  (setf ext-subset-decl* (reduce-decl-sequence ext-subset-decl*))
  ;; adopt the name from the parameter entity reference to construct a conditional
  ;; container for the declarations
  (make-conditional-section :name (name pe-reference) :children ext-subset-decl*
                            :document *document*))

(defConstructor |Names| (names name)
  (cons name names))

(defIdentityConstructor |NCName|)

(defConstructor |NDataDecl| (structure)
  (make-ncname structure))

(defConstructor |Nmtokens| (nmtoken nmtokens)
  (cons nmtoken nmtokens))

(defLiteralConstructor |Nmtoken| )

(defConstructor |NotationDecl-Constructor| (name public-id-args)
  (cond (public-id-args
         (destructuring-bind (&key pubid-literal (public-id pubid-literal)
                                   system-literal (system-id system-literal)) public-id-args
           (setf name (make-ncname name))
           (bind-definition
            (make-def-notation :name name :system-id system-id :public-id public-id
                               :document *document*)
            *document*)))
        (t
         (xml-error "|NotationDecl| public id required: ~s." public-id-args))))

(defIdentityConstructor |NotationType| )

(defConstructor |NotationTypeSequence| (notation-type notation-type-sequence)
  (cons notation-type notation-type-sequence))

(defConstructor |Number| (value)
  ;; the string value in this case was buffered in the reader macro. just leave it
  (parse-integer value))

(defIdentityConstructor |ParsedExtSubset| )

(defIdentityConstructor |ParsedReference| )

(defConstructor |PEDecl| (name definition)
  (setf name (make-ncname name))
  (destructuring-bind (&key entity-value external-id) definition
    (cond (external-id
           (destructuring-bind (&key system-literal (system-id system-literal)
                                     pubid-literal (public-id pubid-literal)) external-id
             (bind-definition
              (make-def-external-parameter-entity
               :name name :system-id system-id :public-id public-id :document *document*)
              *document*)))
          (t  ;; nb. the value may be null for an empty literal
           (bind-definition
            (make-def-internal-parameter-entity
             :name name :children entity-value :document *document*)
            *document*)))))

(defConstructor |PEDef| (value external-id)
  (list :entity-value value :external-id external-id))

(defConstructor |PEReference| (name)
  (setf name (make-ncname name))
  (make-ref-parameter-entity :name name :document *document*))

(defConstructorMethod |Pi-Constructor| ((construction-context t) literal target &aux function children)
  "where a processing function is defined, invoke it and, where it returns a result, generate a
   processing instruction with that content. where no function is defined, generate an instruction
   with the literal content."
  (unless target
    (xml-error "syntax error: target required."))
  (if (setf function (pi-function target))
    (handler-case (when (setf children (funcall function target literal))
                    (make-pi-node :target target
                                  :children (if (consp children) children (list children))
                                  :document *document*))
      (error (condition) (xml-error "processing instruction error: ~s: ~s: ~a."
                                    target literal condition)))
    (make-pi-node :target target :children (list literal) :document *document*)))

(defConstructorMethod |PiCharData-Constructor| ((construction-context t) structure)
  structure)

(defConstructor |PiTarget| (name)
  (make-ncname name))

(defConstructor |Prolog| (doctype-prolog misc-sequence xml-decl)
  (list :doctype-prolog doctype-prolog
        :misc-sequence misc-sequence
        :xml-decl xml-decl))
                    

(defLiteralConstructor |PubidCharData|)

(defIdentityConstructor |PubidLiteral| )

(defConstructor |PublicID| (pubid-literal system-literal)
  `(,@(when pubid-literal `(:pubid-literal ,pubid-literal))
    ,@(when system-literal `(:system-literal ,system-literal))))

#|
;; where qnames are to be interned directly upon parsing,  they are either string
;; tokens or productions, depending on the grammar
(defConstructor |QName-Constructor| (structure &aux initargs)
  (etypecase structure
    (null nil)
    (list (with-xqdm-substructures ((|Prefix| prefix)
                              (|LocalPart| local-part))
                             structure
            (setf (getf initargs :name) local-part)
            (if prefix
              (setf (getf initargs :prefix) prefix))
            (apply #'make-qname initargs)))
    ((or string symbol)
     (make-qname :name structure)))) |#

;; at present, however, they are parsed as literal strings and interening is
;; deferred to the respective constructor. declarations, for example, resolve namespaces
;; very late and can not intern until after that is done.

(defIdentityConstructor |QName| )
(defIdentityConstructor |Prefix| )
(defIdentityConstructor |LocalPart| )

(defConstructor |Reference| (character-reference entity-reference)
  (or character-reference entity-reference))

(defIdentityConstructor |Root| )

(defNullConstructor |S| )

(defConstructor |Seq| (structure) (nreverse structure))

(defIdentityConstructor |SDDecl| )

(defConstructorMethod |STag-Constructor| ((construction-context t) attribute-sequence qname
                                          &aux node uname)
  (:documentation
   "construct an element node given the generic identifier and the sequence of
    combined attribute property lists and namespace nodes.")
  "the base method guards against a null name, delegates to <code>construct-element-node</code>
   and enforces the constraint on prefix declarations upon return."
  (unless qname
    (xml-error |NGC: QName Required| :node nil))
  (setf node (construct-element-node construction-context qname attribute-sequence))
  (when node
    ; (format *trace-output* "~%namespaces: ~s" *namespace-bindings*)
    (unless (namespace (setf uname (name node)))
      (xml-error |NSC: Prefix Declared| :name (prefix uname))
      (setf (name node) (intern-name (string qname) *null-namespace*))))
  node)

(defConstructor |StringType| (structure)
  (or (and (typep structure 'string)
           (string= structure "CDATA")
           '|xml|:|CDATA|)
      (xml-error "attribute string type is not known: ~s." structure)))

(defConstructor |SystemLiteral| (string)
  (when (find #\# string)
    (xml-error |WFC: [SystemLiteral]| :datum string))
  string)

(defLiteralConstructor |SystemCharData| )

(defConstructor |TextDecl| (encoding-decl version-info)
  (when encoding-decl
    (setf encoding-decl (change-stream-decoding encoding-decl)))
  (when version-info
    (unless (find version-info *xml-versions* :test #'string=)
      (|EC: Version Match| :nameversion-info)))
  `(,@(when version-info `(:version-info ,version-info))
    ,@(when encoding-decl `(:encoding-decl ,encoding-decl))))

(defConstructor |TokenizedType| (structure)
  (or (and (typep structure 'string)
           (find-symbol structure *token-package*))
      (xml-error "attribute tokenized type is not known: ~s." structure)))

(defConstructor |VersionInfo| (version-number)
  version-number)

(defLiteralConstructor |VersionNumCharData|)

(defConstructor |XMLDecl| (encoding-decl sddecl version-info)
  (when encoding-decl
    (setf encoding-decl (change-stream-decoding encoding-decl)))
  (when version-info
    (unless (find version-info *xml-versions* :test #'string=)
      (|EC: Version Match| :nameversion-info)))
  `(,@(when version-info `(:version-info ,version-info))
    ,@(when encoding-decl `(:encoding-decl ,encoding-decl))
    ,@(when sddecl `(:sddecl ,(eq '|xml|:|yes| sddecl)))))

(defConstructor |YesOrNo| (structure)
  (if (string= structure "yes") '|xml|:|yes| '|xml|:|no|))


:EOF
