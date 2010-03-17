;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  model operators for the xml query data modl
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010318' AUTHOR='JAA'>
   factored out as separate file</DELTA>
  <DELTA DATE='20010501' AUTHOR='JAA'>
   factored separate file for xml parser</DELTA>
  <DELTA DATE='20010520'> augmented find-id for use with xquery/xpath</DELTA>
  <DELTA DATE='20010526'>added sibling generators</DELTA>
  <DELTA DATE='20010616'>added character method to value-string</DELTA>
  <DELTA DATE='20010621'>name for comment nodes</DELTA>
  <DELTA DATE='20010622'>*default-namespace-attribute-name* fix for lispworks reader</DELTA>
  <DELTA DATE='20040125'>cmucl 19 stream class name</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XQDM")

;;
;;
;; predicates

(defun is-namechardata (x)
  (and (stringp x) (plusp (length x))
       (not (find-if #'(lambda (c)
                         (not (or (xml-namechar? c) (char= c #\:))))
                     x))))
(defun is-ncname (x)
  (and (stringp x) (plusp (length x))
       (xml-initial-namechar? (schar x 0))
       (not (find-if (complement #'xml-namechar?)
                     x :start 1))))

;;
;;
;; could be used to see if an entity value needs to be parsed, or could just be
;; appended to in-progress text...

(defgeneric maybe-markup-text (context)
  (:method ((node def-entity))
           (with-slots (maybe-markup-text) node
             (if (eq maybe-markup-text :unknown)
               (setf maybe-markup-text (maybe-markup-text (value node)))
               maybe-markup-text)))
  (:method ((string string))
           (unless (= (length string) 1)
             (map nil #'(lambda (c)
                          (if (or (xml-markupchar? c) (xml-space? c))
                            (return-from maybe-markup-text t)))
                  string))))



;; to match qname-value
(defMethod value ((datum symbol)) datum)

;;
;;
;; info-set conform accessors
;? jaa: why? #+cmu (fmakunbound 'name)
(defMethod name ((node null)) nil)
(defmethod name ((node comment-node)) nil)
(defMethod name ((node symbol)) (symbol-name node))
(defMethod name ((element string)) nil)
(defMethod namespace ((value null)) nil)


(defMethod namespace-name ((node elem-node)) (namespace-name (name node)))
(defMethod namespace-name ((node attr-node)) (namespace-name (name node)))
(defMethod namespace-name ((value string)) value)
(defMethod namespace-name (x) (uri x))


  
(defMethod local-part ((x string) &aux (pos (position #\: x)))
  (if pos (subseq x (1+ pos)) x))

(defMethod local-part ((node elem-node))
  (local-part (name node)))

(defMethod local-part ((node elem-property-node))
  (local-part (name node)))

(defMethod prefix ((name string) &aux (position (position #\: name)))
  (if position (subseq name 0 position) ""))


(defMethod prefix ((node elem-node))
  (declare (ftype (function (t) t) namespace-prefix))
  (with-slots (name) node
    (typecase name
      (null nil)
      (symbol (namespace-prefix name))
      (qname-value (prefix name)))))

(defMethod prefix ((node attr-node))
  (declare (ftype (function (t) t) namespace-prefix))
  (with-slots (name) node
    (typecase name
      (null nil)
      (symbol (namespace-prefix name))
      (qname-value (prefix name)))))

(defMethod prefix ((context qname-context)) (prefix (name context)))

(defMethod uri ((node null)) nil)

(defMethod uri ((node t)) (uri (namespace node)))

(defMethod uri ((node package)) (namespace-name node))

(defMethod uri ((stream stream)) nil)

#-cmu
(defMethod uri ((stream file-stream)) (pathname stream))
#+(and cmu :cmu19)
(defMethod uri ((stream system:fd-stream)) (pathname stream))
#+(and cmu :cmu18)
(defMethod uri ((stream cl::fd-stream)) (pathname stream))

(defMethod entities ((node doc-node))
  (cons (entity-info node) (append (general-entities node) (parameter-entities node))))

(defGeneric inscope-namespaces (node)
  (:method ((node elem-node))
           (delete-duplicates (append (namespaces node)
                                      (inscope-namespaces (parent node)))
                              :test #'string=
                              :key #'local-part
                              :from-end t))
  (:method ((node null)) *namespace-bindings*)
  (:method ((node doc-node)) *namespace-bindings*))

(defGeneric specified (node)
  (:method ((node elem-property-node)) t)
  (:method ((node def-elem-property-type)) nil)
  (:documentation
   "true where the property was instantiated, but not where it was cloned from
    the definition."))

(defMethod attribute-def ((x attr-node)) (def x))
(defMethod owner-element ((x attr-node)) (parent x))
(defMethod normalized-value ((x attr-node)) (value x))
(defMethod content ((x pi-node)) (value x))

(defGeneric node-equal (n1 n2)
  (:documentation
   "test for 'value' equality among nodes.
    implements the '=' operator.
    an open question is whether this has to be overrrdden for strikt xpath conformance as the
    definition there resorts to comparing serialized strings.")
  (:method ((n1 elem-node) (n2 elem-node))
           (and (eq (name n1) (name n2))
                (dolist (n (attributes n1))
                  (unless (find n (attributes n2) :test #'node-equal)
                    (return-from node-equal nil)))
                (dolist (n (namespaces n1))
                  (unless (find n (namespaces n2) :test #'node-equal)
                    (return-from node-equal nil)))
                (node-equal (children n1) (children n2))))
  (:method ((n1 elem-property-node) (n2 elem-property-node))
           ;; ignore specialized type
           (and (eq (name n1) (name n2))
                (equalp (value n1) (value n2))))
  (:method ((n1 list) (n2 list))
           (loop (if (consp n1)
                   (if (consp n2)
                     (unless (node-equal (pop n1) (pop n2)) (return-from nil))
                     (return nil))
                   (return (node-equal n1 n2)))))
  (:method ((n1 string) (n2 string))
           (string= n1 n2))
  (:method ((n1 sequence) (n2 sequence))
           (equalp n1 n2))
  (:method ((n1 null) (n2 null ))
           t)
  (:method ((n1 t) (n2 t))
           nil))

(defMethod uname-equal ((q1 ref-parameter-entity) (q2 ref-parameter-entity))
  "permit comparison of named nodes with unexpanded names"
  (uname-equal (name q1) (name q2)))

;;
;;
;; collectors

(defun map-node-by-type (type-p function list)
  (when (or (symbolp type-p) (consp type-p))
    (setf type-p #'(lambda (n) (typep n type-p))))
  (map nil #'(lambda (o) (when (funcall type-p o) (funcall function o))) list))

(defun collect-node-by-type (type-p list)
  (when (or (symbolp type-p) (consp type-p))
    (setf type-p #'(lambda (n) (typep n type-p))))
  (remove-if (complement type-p) list))

(defun collect-attribute-declarations (list) (collect-node-by-type #'is-def-attr list))
(defun collect-attributes (list) (collect-node-by-type #'is-abstract-attr-node list))
(defun collect-comments (list) (collect-node-by-type #'is-comment-node list))
(defun collect-comments-and-pis (list) (collect-node-by-type #'(lambda (x) (or (is-pi-node x) (is-comment-node x))) list))
(defun collect-declarations (list) (collect-node-by-type #'is-abstract-def-node list))
(defun collect-element-declarations (list) (collect-node-by-type #'is-def-elem-type list))
(defun collect-element-properties (list) (collect-node-by-type #'is-abstract-elem-property-node list))
(defun collect-elements (list) (collect-node-by-type #'is-elem-node list))
(defun collect-general-entities (list) (collect-node-by-type #'is-def-general-entity list))
(defun collect-namespaces (list) (collect-node-by-type #'is-abstract-ns-node list))
(defun collect-namespace-declarations (x) "for 0.950" (collect-namespaces x))
(defun collect-notations (list) (collect-node-by-type #'is-notation-value list))
(defun collect-parameter-entities (list) (collect-node-by-type #'is-def-parameter-entity list))
(defun collect-pis (list) (collect-node-by-type #'is-pi-node list))


;;
;;
;;

(defGeneric parent-count (node)
  (:method ((node abstract-node) &aux (count 0))
           (loop (unless (setf node (parent node)) (return count))
                 (incf count)))
  (:method ((node t)) 0))

(defMethod elem-append
           ((node elem-node) (string string))
  (elem-append node (make-string-value :value string)))

(defMethod elem-append
           ((node elem-node) (child elem-child-node))
  (setf (children node)
        (nconc (children node) (list child)))
  (setf (parent child) node)
  child)
        
(defMethod (setf elem-get)
           ((value t) (element elem-node) (name symbol))
  (setf (elem-get element (string name)) value))

(defMethod (setf elem-get)
           ((value t) (element elem-node) (name string)
            &aux binding)
  (cond
   ((setf binding (find name (attributes element)
                        :key #'name :test #'string-equal))
    (setf (value binding) value))
   (t
    (setf binding (make-string-attr-node :name name :value value))
    (push binding (attributes element))
    (setf (parent binding) element)
    value)))

(defMethod elem-get
           ((element elem-node) (attribute t)
             &aux binding)
  (when (setf binding (find attribute (attributes element)
                            :key #'name :test #'string-equal))
    (value binding)))

(defGeneric value-string (object)
  (:documentation
   "serialize a document to s single string.
    attributes reduce to their string value.
    elements catenate the string values fo their content.
    unexpanded entities reduce to an encoded reference - this for serialization.
    characters reduce to a single-element string - this for construction operators.")
  (:method ((node doc-node))
           (value-string (root node)))
  (:method ((node list))
           (if (cdr node)
             (apply #'concatenate 'string (mapcar #'value-string node))
             (value-string (first node))))
  (:method ((node attr-node))     (value-string (value node)))
  (:method ((node string))        node)
  (:method ((object number))      (write-to-string object))
  ;; (:method ((node t))              (write-to-string node))
  (:method ((node elem-node))     (value-string (children node)))
  (:method ((object null))        "")
  (:method ((object bool-value))  (value-string (value object)))
  (:method ((node ref-general-entity)) (format nil "&~a;" (name node)))
  (:method ((node ref-parameter-entity)) (format nil "%~a;" (name node)))
  (:method ((node ref-character-entity)) (format nil "&#x~x;" (value node)))
  (:method ((node character)) (make-string 1 :initial-element node))
  (:method ((node comment-node)) "")
  (:method ((node def-entity))    (concatenate 'string (value node))))

(defGeneric value-number (x)
  (:method ((x number)) x)
  (:method ((x string)) (read-from-string x))
  (:method ((object number-value)) (value object))
  (:method ((x abstract-node)) (value-number (value-string x)))
  (:method ((object null)) 0))

(defGeneric value-boolean (x)
  (:method ((x bool-value)) (value x))
  (:method ((x value-node)) (value-boolean (value x)))
  (:method ((x (eql t))) t)
  (:method ((x null)) nil)
  (:method ((x string-value)) (value-boolean (value x)))
  (:method ((x string)) (plusp (length x)))
  (:method ((x t)) t))

(defGeneric find-element-by-id (node id)
  (:method ((node t) (id t)) nil)
  (:method ((node t) (id string))
           (find-element-by-id node (intern-name id *null-namespace*)))
  (:method ((node elem-node) (id uname))
           (or (find-if #'(lambda (value)
                            (typecase value (string (string= value (local-part id)))))
                        (attributes node) :key #'value)
               (some #'(lambda (child)
                         (find-element-by-id child id))
                     (children node))))
  (:method ((node elem-node) (id symbol))
           (or (find-if #'(lambda (value)
                            (typecase value (string (string= value (local-part id)))))
                        (attributes node) :key #'value)
               (some #'(lambda (child)
                         (find-element-by-id child id))
                     (children node))))
  (:method ((node doc-node) (id symbol))
           (with-slots (ids root types) node
             (if (and ids types (plusp (hash-table-count types)))
               (gethash id ids)
               (when root (find-element-by-id root id)))))
  (:method ((node doc-node) (id uname))
           (with-slots (ids root types) node
             (if (and ids types (plusp (hash-table-count types)))
               (gethash id ids)
               (when root (find-element-by-id root id))))))

;;
;;
;;

(defGeneric walk-node (node predicate function)
  (:method :around ((*node t) predicate (function t))
           (declare (special *node))
           (when (funcall predicate *node) (call-next-method)))
  (:method ((node t) (predicate t) (function t))
           (funcall function node))
  (:method ((node null) (predicate t) (function t))
           nil)
  (:method ((node hash-table) (predicate t) (function t))
           (maphash #'(lambda (key value)
                        (declare (ignore key))
                        (walk-node value predicate function))
                    node))
  (:method ((node cons) (predicate t) function)
           (walk-node (first node) predicate function)
           (walk-node (rest node) predicate function))
  (:method ((node doc-node) predicate function)
           (when (funcall function node)
             (with-slots (children parameter-entities general-entities types) node
               (dolist (node children) (walk-node node predicate function))
               (walk-node types predicate function)
               (walk-node general-entities predicate function)
               (walk-node parameter-entities predicate function))))
  (:method ((node elem-node) predicate function)
           (when (funcall function node)
             (with-slots (name children attributes namespaces def) node
               (walk-node name predicate function)
               (dolist (node namespaces) (walk-node node predicate function))
               (dolist (node attributes) (walk-node node predicate function))
               (dolist (node children) (walk-node node predicate function))
               (walk-node def predicate function))))
  (:method ((node attr-node) predicate function)
            (when (funcall function node)
              (with-slots (name children value) node
                (walk-node name predicate function)
                (dolist (node children) (walk-node node predicate function))
                (walk-node value predicate function))))
  (:method ((node ns-node) predicate function)
            (when (funcall function node)
              (with-slots (name children value namespace) node
                (walk-node name predicate function)
                (dolist (node children) (walk-node node predicate function))
                (walk-node value predicate function)
                (walk-node namespace predicate function))))
  (:method ((node pi-node) predicate function)
           (when (funcall function node)
             (with-slots (name value children) node
               (walk-node name predicate function)
               (dolist (node children) (walk-node node predicate function))
               (walk-node value predicate function))))
  (:method ((node comment-node) predicate function)
           (when (funcall function node)
             (with-slots (name value children) node
               (dolist (node children) (walk-node node predicate function))
               (walk-node value predicate function))))
  (:method ((node value-node) (predicate t) function)
           (funcall function node))
  (:method ((node ref-entity) predicate function)
           (when (funcall function node)
             (with-slots (name value children) node
               (walk-node name predicate function)
               (dolist (node children) (walk-node node predicate function))
               (walk-node value predicate function)))))

(defun walk-element-definitions (model function)
  (walk-node model
             #'(lambda (node)
                 (typep node '(or doc-node hash-table def-elem-type)))
             #'(lambda (node)
                 (typecase node
                   (doc-node t)
                   (def-elem-type (funcall function node))))))

(defun walk-elements (model function)
  (walk-node model
             #'(lambda (node)
                 (typep node '(or doc-node abstract-elem-node)))
             #'(lambda (node)
                 (typecase node
                   (doc-node t)
                   (abstract-elem-node (funcall function node))))))

;;
;;
;; resolve definitions

(defGeneric bind-definition (definition context)
  (:method ((def t) (context null)) def nil)
  (:method ((def def-general-entity) (context doc-node))
           (bind-definition def (general-entities context)))
  (:method ((def def-general-entity) (context hash-table) &aux bound-p (name (name def)))
           (when name
             (cond ((gethash name context)
                    (check-constraint |WFC: Predefined Entity| def))
                   (t
                    (setf (gethash name context) def)
                    (setf bound-p t))))
           (values def bound-p))
  (:method ((def def-parameter-entity) (context doc-node))
           (bind-definition def (parameter-entities context)))
  (:method ((def def-parameter-entity) (context hash-table) &aux bound-p (name (name def)))
           (when name
             (cond ((gethash name context)
                    (check-constraint |WFC: Predefined Entity| def))
                   (t
                    (setf (gethash name context) def)
                    (setf bound-p t))))
           (values def bound-p))
  (:method ((def def-notation) (context doc-node))
           (bind-definition def (notations context)))
  (:method ((def def-notation) (context hash-table) &aux bound-p (name (name def)))
           (when (and name (not (gethash name context)))
             (setf (gethash name context) def)
             (setf bound-p t))
           (values def bound-p))
  (:method ((def def-elem-type) (context doc-node))
           (bind-definition def (types context)))
  (:method ((def def-elem-type) (context hash-table) &aux bound-p (name (name def)))
           (when name
             (cond ((not (gethash name context))
                    (setf (gethash name context) def)
                    (setf bound-p t))
                   ((validate? def)
                    ;; note that, when parsing, this condition may well have been raised already
                    ;; when resolving qualified names.
                    (xml-error |VC: Unique Element Type Declaration|
                               :name name))))
           (values def bound-p))
  ;; nb. attribute definiitons are collated at the conclusion of qname interpretation
  ;; see assign-universal-names
  (:documentation
   "when a binding context is specified, add the definition to the respective collection.
    a document context delegates to the respective table. a null context ignores the binding."))

(defGeneric find-def-general-entity (name context &key if-does-not-exist)
  (:documentation
   "locate an general entity declaration. where a document is specified as context, the
    respective entities are used. where no declaration is found, the
    <code>IF-DOES-NOT-EXIST</code> keyword specifies whether to do nothing (<code>NIL</code>),
    or signal a formedness condition (<code>:ERROR</code>).")
  (:method ((name t) (context doc-node) &rest args)
           (apply #'find-def-general-entity name (general-entities context) args))
  (:method ((id string) (context t) &rest args)
           (declare (dynamic-extent args))
           (apply #'find-def-general-entity (intern-name id *null-namespace*) context args))
  (:method ((name t) (context hash-table) &rest args)
           (or (gethash name context)
               (apply #'find-def-general-entity name nil args)))
  (:method ((name t) (context null) &key (if-does-not-exist :error))
           (when (eq if-does-not-exist :error)
             (xml-error |WFC: Entity Declared| :name name))))


(defGeneric find-def-parameter-entity (name context &key if-does-not-exist)
  (:documentation
   "locate an parameter entity declaration. where a document is specified as context, the
    respective entities are used. where no declaration is found, the
    <code>IF-DOES-NOT-EXIST</code> keyword specifies whether to do nothing (<code>NIL</code>),
    or signal a formedness condition (<code>:ERROR</code>).")
  (:method ((name t) (context doc-node) &rest args)
           (apply #'find-def-parameter-entity name (parameter-entities context) args))
  (:method ((id string) (context t) &rest args)
           (declare (dynamic-extent args))
           (apply #'find-def-parameter-entity (intern-name id *null-namespace*) context args))
  (:method ((name t) (context hash-table) &rest args)
           (or (gethash name context)
               (apply #'find-def-parameter-entity name nil args)))
  (:method ((name t) (context null) &key (if-does-not-exist :error))
           (when (eq if-does-not-exist :error)
             (xml-error |WFC: Entity Declared| :name name))))

(defGeneric find-def-notation (name context &key if-does-not-exist)
  (:documentation
   "locate a notation declaration. where a document is specified as context, the
    respective notations are used. where no declaration is found, the
    <code>IF-DOES-NOT-EXIST</code> keyword specifies whether to instantiate and bind a new
    notation (<code>:CREATE</code>), do nothing (<code>NIL</code>), or signal a
    validity condition (<code>:ERROR</code>).")
  (:method ((name t) (context doc-node) &rest args)
           (apply #'find-def-notation name (notations context) args))
  (:method ((id string) (context t) &rest args)
           (declare (dynamic-extent args))
           (apply #'find-def-notation (intern-name id *null-namespace*) context args))
  (:method ((name t) (context hash-table) &rest args &key (if-does-not-exist :error))
           (or (gethash name context)
               (if (eq if-does-not-exist :create)
                 (setf (gethash name context) (make-def-notation :name name))
                 (apply #'find-def-notation name nil args))))
  (:method ((name t) (context null) &key (if-does-not-exist :error))
           (when (eq if-does-not-exist :error)
             (xml-error |VC: Notation Attributes| :name name))))

(defGeneric find-def-elem-type (name context &key if-does-not-exist)
  (:documentation
   "locate an element type definition. where a document is specified as context, the
    respective type definitions are used. where no type is found, the
    <code>IF-DOES-NOT-EXIST</code> keyword specifies whether to instantiate and bind a new
    type (<code>:CREATE</code>), do nothing (<code>NIL</code>), or signal a
    validity condition (<code>:ERROR</code>).")

  (:method ((name t) (context doc-node) &rest args)
           (apply #'find-def-elem-type name (types context) args))

  (:method ((name symbol) (context hash-table) &rest args &key (if-does-not-exist :error))
           (or (gethash name context)
               (if (eq if-does-not-exist :create)
                 (setf (gethash name context) (make-def-elem-type :name name))
                 (apply #'find-def-elem-type name nil args))))

  (:method ((name abstract-name) (context hash-table) &rest args &key (if-does-not-exist :error))
           (or (gethash name context)
               (if (eq if-does-not-exist :create)
                 (setf (gethash name context) (make-def-elem-type :name name))
                 (apply #'find-def-elem-type name nil args))))

  (:method ((predicate function) (context hash-table) &rest args)
           (maphash #'(lambda (key value)
                            (when (funcall predicate key) (return-from find-def-elem-type value)))
                    context)
           (apply #'find-def-elem-type predicate nil args))

  (:method ((name t) (context null) &key (if-does-not-exist :error))
           (when (eq if-does-not-exist :error)
             (xml-error |VC: Element Valid| :name name))))


(defGeneric find-id (id context  &key if-does-not-exist)
  (:documentation
   "locate an element based on a registered id attribute.
    where a document is specified as context, the respective id cache is used.
    where no type is found, the
    <code>IF-DOES-NOT-EXIST</code> keyword specifies whether to do nothing (<code>NIL</code>),
    or signal a condition (<code>:ERROR</code>).")
  (:method ((id string) (context t) &rest args)
           (declare (dynamic-extent args))
           (apply #'find-id (intern-name id *null-namespace*) context args))
  (:method ((id t) (context doc-node) &rest args)
           (apply #'find-id id (ids context) args))
  (:method ((id t) (context doc-child-node) &rest args)
           (declare (dynamic-extent args))
           (apply #'find-id id (document context) args))
  (:method ((id t) (context sequence) &rest args)
           (declare (dynamic-extent args))
           (some #'(lambda (context) (apply #'find-id id context args)) context))
  (:method ((id t) (context hash-table) &rest args)
           (or (gethash id context)
               (apply #'find-id id nil args)))
  (:method ((id t) (context null) &key (if-does-not-exist :error))
           (when (eq if-does-not-exist :error)
             (xml-error |VC: IDRef Target| :name id))))


(defgeneric following-siblings (node)
  (:documentation "generate a list of successor siblings")
  (:method ((node elem-node) &aux parent children)
           (when (and (setf parent (parent node))
                      (setf children (children parent)))
             (rest (member node children))))
  (:method ((node attr-node) &aux parent attributes)
           (when (and (setf parent (parent node))
                      (setf attributes (attributes parent)))
             (rest (member node attributes))))
  (:method ((node t)) nil))

(defgeneric preceding-siblings (node)
  (:documentation "generate a reverse list of predecessor siblings")
  (:method ((node elem-node) &aux parent children nodes)
           (when (and (setf parent (parent node))
                      (setf children (children parent))
                      (setf nodes (member node children)))
             (nreverse (ldiff children nodes))))
  (:method ((node attr-node) &aux parent attributes nodes)
           (when (and (setf parent (parent node))
                      (setf attributes (attributes parent))
                      (setf nodes (member node attributes)))
             (nreverse (ldiff attributes nodes))))
  (:method ((node t)) nil))


(setq *null-namespace-node*
      (make-ns-node :name *default-namespace-attribute-name*
                    :namespace *null-namespace*
                    :value "" :children '("")
                    :ephemeral t))
(setq *def-null-namespace-node*
      (make-def-elem-property-type
       :name *default-namespace-attribute-name*
       :prototype *null-namespace-node*
       :ephemeral t))

(setq *xml-namespace-node*
      (make-ns-node :name *xml-namespace-attribute-name*
                    :namespace *xml-namespace*
                    :value (namespace-name *xml-namespace*)
                    :children (list (namespace-name *xml-namespace*))))

(setq *xmlns-namespace-node*
      (make-ns-node :name *xmlns-namespace-attribute-name*
                    :namespace *xmlns-namespace*
                    :value (namespace-name *xmlns-namespace*)
                    :children (list (namespace-name *xmlns-namespace*))))

;; 0.950 compatibility

(defmethod xsd:validate-name ((node named-node) (name t))
  (xsd:validate-name (name node) name))

(defun prefix-namespace (x)
  (declare (ftype (function (t) t) prefix-value))
  (prefix-value x))



:EOF
