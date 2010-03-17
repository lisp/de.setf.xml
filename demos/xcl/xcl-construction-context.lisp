;;; -*- package: de.setf.xcl; Syntax: Common-lisp; Base: 10 -*-

(in-package :de.setf.xcl)

;; an xmlp-based sax parser drives the event-based counterpart based on
;; inline parser construction operations.
;; note that the bridge class implementation does not specify the
;; instantiation and invocation structure.

(defClass xcl-construction-context (asexp-construction-context)
  ()
  (:documentation
   "the class xcl-construction-context further specializes ae-construction-context to produce xml common logic expressions."))


;;
;;
;; specialized versions of the xml parser constructors generate xcl expressions.


(defMethod xmlp:construct-construction-context
           ((context xcl-construction-context) (component t))
  "the context remains unchanged throughout the parse process."
  context)

(defMethod xmlp:construct-ns-node
           ((context xcl-construction-context) attribute-value name
            &optional (colon-position (position #\: name))
            &aux ns-name namespace)
  (setf ns-name (xqdm:value-string attribute-value))
  (unless (stringp ns-name)
    (xqdm:xml-error "namespace name syntax error: ~s: ~s." name attribute-value))
  (when (and colon-position (zerop (length ns-name)))
    (xqdm:xml-error xqdm:|NSC: No Null Namespace Bindings| :name name))
  (setf namespace (xqdm:find-namespace ns-name :if-does-not-exist :create))
  (xmlp:call-with-name-properties
   #'(lambda (&key local-part &allow-other-keys) (cons local-part namespace))
   name :colon-position colon-position :namespace xqdm:*xmlns-namespace*))

(defMethod xmlp:|Document-Constructor|
           ((construction-context xcl-construction-context) (third-misc-sequence t) (prolog t) (root t))
  root)

(defMethod xmlp:|Element-Constructor|
           ((context xcl-construction-context) (content* t) etag stag)
  (let ((name (if (consp stag) (first stag) stag)))
    (unless (equal name etag)
      (|WFC: Element Type Match| :start-name name :end-name etag))
    (cons stag (remove nil (nreverse content*)))))


(defMethod construct-element-node
           ((context xcl-construction-context) (name string) (attr-plist+nsdecl-node* t) &aux type-name type node)
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
           (construct-element-node context type attr-plist+nsdecl-node*))
          ((setf type (search-for-type-by-qname))
           ;; the alternative, matching homographs succeeded, using the qualified name
           ;; form <prefix>:<local part>, ignoring the extent as the type def name should
           ;; be interned, and ignoring any namespace which may have been apparent in the
           ;; document. this requires the later double-check for nsdecl-node attribute validity
           (when *xml-verbose*
             (format *trace-output* "universal name mismatch. proceeding with homographs document/dtd: ~s/~s. context: ~s"
                     type-name (name type) *namespace-bindings*))
           
           ;; nb. no attempt is made to fix-up type name mispatches. see the construct-element-node
           ;; definitions in "xml:xml-parser;contrsuctors.lisp"
           (construct-element-node context type attr-plist+nsdecl-node*))
          (t 
           ;; otherwise, first a validity error, then typeless
           (when (validate? *document*) (xml-error |VC: Element Valid| :name name))
           (construct-element-node context type-name attr-plist+nsdecl-node*))))

(defMethod construct-element-node
           ((definition xcl-construction-context) (name uname) attr-plist+ns-node*
            &aux elem-node)
           ;; where no definition is present, just make simple attribute nodes
           ;; namespaces are now bound, so intern the name
           (setf *construction-context*
                 (construct-construction-context *construction-context* elem-node))
           (mapc #'(lambda (structure)
                     (destructuring-bind (&key name att-value) structure
                       (etypecase name
                         (string
                          (setf name (construct-attribute-name elem-node name))
                          (setf (first structure) name))
                         (uname
                          ))))
                 attr-plist+ns-node*)
           (setf elem-node (cons name (nreverse attr-plist+ns-node*)))
           (check-constraint |WFC: Unique Att Spec| elem-node)
           elem-node)

(defMethod construct-element-node
           ((context xcl-construction-context) (definition def-elem-type) attr-plist+nsdecl-node*
            &aux (name (name definition)) element nsdecl-nodes attr-nodes attr-plists)
  ;; parallels the implementation for document model nodes from "xml:xml-parser;contrsuctors.lisp" to
  ;; construct annotated epxressions.
  (setf element (list (list name)))
  (setf *construction-context*
        (construct-construction-context *construction-context* element))
  (let ((declarations (properties definition))
        (required (copy-seq (props-required definition)))
        (defaults (copy-seq (props-defaulted definition)))
        (position nil)
        (def nil)
        (prototype nil)
        (name-prefix (unless (namespace name) (prefix name))))
    (declare (dynamic-extent defaults required))
    (flet ((attr-position (name)
             (position name declarations :test #'uname-equal :key #'name)))
      ;; separate attribute structures from already instantiated nsdecl-nodes
      (mapc #'(lambda (structure &aux position def prototype)
                (destructuring-bind (name . value) structure
                  (cond ((eq (namespace name) *xmlns-namespace*)
                         (cond ((setf position (attr-position name))
                              ;; double check for nsdecl-node attribute validity
                              ;; in most cases, they match, otherwise the definition
                              ;; would not have been found. ! but, in a case where
                              ;; a qname/homographic match overrode an apparent prefix/ns
                              ;; binding, or compensated a missing one, this check is 
                              ;; required. nb. this is independant of the definition's fixedness:
                              ;; the discrepancy may cause subsequent identifer namespaces to
                              ;; diverge - start/end tag, or instance/dtd, so it is prohibited.
                              (setf def (elt declarations position)
                                    prototype (prototype def))
                              (when (not (equal (namespace-name (name prototype))
                                                (namespace-name name)))
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
                                         :format-arguments (list (name structure)))))
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
                       (let* ((document-namespace (namespace prototype))
                              (nsdecl-node (cons (name prototype) namespace)))
                         (setf (prefix-value (name prototype)) document-namespace)
                         (when (and name-prefix (string= name-prefix (local-part (name prototype))))
                           ;; patch the element name on the fly -
                           (setf name (intern-name (local-part name) document-namespace))
                           (setf (caar element) name))
                         (push nsdecl-node nsdecl-nodes))
                       (setf (sbit required i) 0)
                       (setf (sbit defaults i) 0)))))
               ;; build attributes from structures
               (setf attr-nodes
                     (mapcar #'(lambda (structure)
                                 (destructuring-bind (&key name att-value) structure
                                   (setf name (construct-attribute-name context name))
                                   (cond ((setf position (attr-position name))
                                          (setf def (elt declarations position))
                                          (setf (sbit required position) 0)
                                          (setf (sbit defaults position) 0)
                                          (cons name att-value))
                                         (t
                                          (when (and (validate? (document definition))
                                                     (not (attr-position *wild-uname*)))
                                            (xml-error |VC: Attribute Declared|
                                                       :format-control
                                                       "no definition for attribute: ~s."
                                                       :format-arguments (list name)))
                                          (cons name att-value)))))
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
                     (let ((prototype (prototype (elt declarations i))))
                     (push (cons (name prototype) (value prototype)) attr-nodes))))))
           
           (setf (cdar element) (append (nreverse nsdecl-nodes) (nreverse attr-nodes)))
           (check-constraint |WFC: Unique Att Spec| elem-node)
           elem-node))


(defMethod xmlp:|STag-Constructor|
           ((context xcl-construction-context) attr-plist+ns-cons* name)
  (construct-element-node context name attr-plist+ns-cons*))


(defMethod xmlp:|ExtParsedEnt-Constructor|
           ((context xcl-construction-context) (content* t) (text-decl t))
  nil)

(defMethod xmlp:|Pi-Constructor|
           ((context xcl-construction-context) literal target)
  nil)


:EOF
