;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
<DESCRIPTION>
 <p>implementation of uniform name resolution for cl-xml.</p>
 <p>when <code>|REC-xml-names-19990114|</code> is null, names are parsed as strings or symbols,
  depending on the value bound to <code>*NAMESPACE*</code>.
  this, the original xml-1.0 interpretation, is straightforward. it is necessary unbuffer and
  tokenize the name.<.p>
 <p>when <code>|REC-xml-names-19990114|</code> is non-null, names are taken to denote universal
  names. the process is somewhat complex. the name is not only unbuffer, but is interned in
  the namespace specified by the prefix on the name. this prefix does not identify the
  namespace directly, rather it is bound to the name of the namespace according torules set
  out in the recommentationon namespaces in xml.<p>
 <p>the document describes the process for the document entity. which process is implemented
  elsewhere. (see xqdm-namespaces.lisp and xqdm-operators.lisp). this file implements
  an analogous process for the components of the document definition, which translates the
  specified rules from the instancto the type domain to enable namespace-aware document type
  definitions.</p>
 <p>a more complete description of the interning process resides in a separate
 <a href=''file:///./qnames.html'>file</a>.</p>
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href=' /> 
 <CHRONOLOGY>
 <DELTA DATE='20010416'>
  <ul>
  <li>recognized static binding for "xml" namespace in <code>ASSIGN-NAMSEPACE</code></li>
  <li>changed prefix comparisons to symbol rather than string</li>
  </ul>
  </DELTA>
  <DELTA DATE='20010604'>model traversal moved to xqdm-classes</DELTA>
  <DELTA DATE='20010622'>intern qnames no longer binds a global context set
   </DELTA>
  <DELTA DATE='20010225'>cache the rprefix binding only when one is found.
   </DELTA>
  <DELTA DATE='20010625'>
   added an additional searching match for content qnames to
   <code>assign-namespaces</code> for the case where prefixes don't match.</DELTA>
  <DELTA DATE='20010627'>
   no warning for unresolved names until final namespace assignment</DELTA>
  <DELTA DATE='20010628'>
   <code>INTERN-QNAMES</code> incrementally rather than at the conclusion of each external
   entity</DELTA>
  <DELTA DATE='20010714'>namespace/package distinction</DELTA>
  <DELTA DATE='20010729'>while formulating the documentation, i experimented with examples
   of confliciting (homographic) qnames by asserting conflicting bindings and enabling/
   disabling incremental propagation. the cases where conflicting bindings are detected
   are exactly those where qnames are indiscernably homographic. that is within a given
   declaration scope. which means that content-based propagation of namespace bindings
   is permitted to constrain the namespace of content elements, since a conflict implies
   indiscernable homography.</DELTA>
  <DELTA DATE='20010906'>support for namespaces implemented as tokenizers</DELTA>
  <DELTA DATE='20010909'>method to <code>resolve-universal-names</code> to
   ensure that the respective presence of a default null namespace declaration for
   the respective context before performing final name resolution.</DELTA>
  <DELTA DATE='20010910'>fix to augment properties to test uniqueness based on qname rather than local part</DELTA>
  <DELTA DATE='20010913'>addition to <code>find-nsdecl-node</code> to include the local cache,
   which then recognizes inferred ns nodes when identifying prefixes across context branches.
   </DELTA>
  <DELTA DATE='20010914'>
   <ul><li>added clauses to <code>find-nsdecl-node</code> to sort-cut the search for
   constant namespaces xml, and xmlns, since these caused extensive searches in large dtds which
   were bound to fail.</li>
    <li>last check for a default name in <code>resolve-universal-name</code> changed to search the
     parents as well as the local cache</li></ul></DELTA>
  <DELTA DATE='20020116'>names for nameset-tokenizers now accessed with name method</DELTA>
  <DELTA DATE='20020124'>assign-namespaces (def-type-qname-context) checks content names</DELTA>
  <DELTA DATE='20020205'>namespace assignment now defers defaults until the end and does not
   fabricate namespace nodes.<br />
   references to distinguished namespaces account for ephemeral spaces.</DELTA>
  <DELTA DATE='20030328'>qname-contexts must copy prior to sorting</DELTA>
 </CHRONOLOGY>
</DOCUMENTATION>

|#

(in-package :xml-query-data-model)

(defParameter *pass-id* nil)

(defParameter *propagate-incrementally*  nil
  "specify whether to propagate ns constraints from a dominant to a dependant type immeidately.
   NIL is required where constraints may be shadowed and dominant declarations appear first.
   this, on the other hand, is impractical where declarations exhibit large fan-in.")

(defParameter *cache-mode* :success
  "specify whether to cache success only, or to also cache failure when searching for prefix bindings.
   during initial propagation the :success value means only found nodes are cached.
   during assignment failures are also cached.")

;;
;;
;;

(defun find-nsdecl-node* (prefix qname-context &aux cache-value)
  (declare (special *contexts)) ; (break)
  (check-type prefix string)
  (multiple-value-bind (ns-node definitive-p)
                       (find-nsdecl-node prefix qname-context)
    (cond (ns-node)
          (definitive-p nil)
          ((not (find qname-context (when (boundp '*contexts) *contexts)))
           (let ((*contexts (cons qname-context (when (boundp '*contexts) *contexts))))
             (declare (special *contexts) (dynamic-extent *contexts))
             (setf cache-value
                   (some #'(lambda (parent) (find-nsdecl-node* prefix parent))
                         (parents qname-context)))
             ;; add a cache entry when a binding is found only
             (cond (cache-value
                    (push (cons prefix cache-value) (ns-cache qname-context)))
                   ((eq *cache-mode* :all)
                    (when *trace-qname-resolution*
                      (format *trace-output* "~%caching prefix failure ~s/~s:" (name qname-context) prefix))
                    (push (cons prefix nil) (ns-cache qname-context))))
             cache-value)))))

(defun find-nsdecl-node (prefix qname-context)
  (check-type prefix string)
  ;; optimize search for constant namespaces
  (cond ((local-part-equal prefix *xml-prefix-string*)
         (xml-namespace-node))
        ((local-part-equal prefix *xmlns-prefix-string*)
         (xmlns-namespace-node))
        ((or *default-namespace-is-visible*
             (not (local-part-equal prefix *default-prefix-name*)))
         (or (find prefix (nsdecl-nodes qname-context) :key #'local-part :test #'string=)
             ;; 20010912.jaa (docbook) to ensure cross-branch identity when dcl is inferred
             (let ((cache-entry (assoc prefix (ns-cache qname-context) :test #'string=)))
               (when cache-entry
                 (values (rest cache-entry) t)))))
        (t ;; a null-prefixed attribute name -> return a node as if one was there
         (null-namespace-node))))

(defun find-ns-node (x y) (find-nsdecl-node x y))
(defun find-ns-node* (x y) (find-nsdecl-node x y))
(defun xml-namespace-node () *xml-namespace-node*)
(defun xmlns-namespace-node () *xmlns-namespace-node*)
(defun null-namespace-node () *null-namespace-node*)

(defMethod qname-context ((node document-definition-child-object))
  nil)

(defMethod qname-context ((node t))
  (warn "unexpected qualified name context: ~s." node)
  nil)

(defMethod qname-context ((def-node element-type-definition) &aux props)
  (with-slots (qname-context name) def-node
    (if qname-context qname-context
        (setf props (mapcar #'prototype (annotation-model def-node))
              qname-context
              (make-instance 'def-type-qname-context
                :name (name def-node)
                :content-names (remove-if #'(lambda (c-name)
                                              (cond ((eq c-name name) t)
                                                    ((eq c-name *empty-name*) t)))
                                          (collect-model-names (content-model def-node)))
                ;; the contexts are intended for use immediately after the definitions
                ;; are parsed. in which case the doctype constructor may have asserted
                ;; a null namespace binding on the root node. still, collect all properties
                ;; just in case
                :nsdecl-nodes (collect-namespace-declarations props)
                :attr-nodes (collect-attributes props)
                :def def-node)))))

(defMethod qname-context ((def-node doctype-attlist-definition))
  (with-slots (qname-context) def-node
    (if qname-context qname-context
        (setf (qname-context def-node)
              (let ((prototypes (mapcar #'prototype (attributes def-node))))
                (make-instance 'def-attr-qname-context
                  :name (name def-node)
                  :attr-nodes (remove-if #'nsdecl-node-p prototypes)
                  :nsdecl-nodes (remove-if (complement #'nsdecl-node-p) prototypes)
                  :def def-node))))))

#|
declare attributes:

merge direct declarations from an attlist to the respective element declaration
based on matched element id's. permit first the collected nsdecl-nodes in the
element space and then those to be added from the attribute space to provide
prefix values. to this point, the element spaces have no parents, which means
that only bindings collected from other attribute declarations can effect
the outcome.
|#


(defMethod element/attribute-qname-equal
           ((e-name symbol) (a-name symbol)
            (e-space def-type-qname-context) (a-space def-attr-qname-context)
            &aux e-nsdecl-node a-nsdecl-node)
  "this method is used when inferring element/attlist relations.
   <code>E-NAME</code> appears as the element declaration identifier.
   <code>A-NAME</code> is the identifier from an attribute list declaration. 
   the names match when:
   <ul><li>they are literally equal;</li>
       <li>the local parts are equal and the element prefix and attribute prefix
           identify a respective ns-bindings such that the namespace names match.</li>
       <ul>
   the initial match must succeed based on declarations local to the respective
   attribute declaration. accumulated ns declarations affect later matches.
   once the element hierarchy has been inferred, the imputed effective lexical context
   also affects matches."
  (flet ((find-combined-nsdecl-node (prefix &aux nsdecl-node)
           ;; search parents and cache result only if parents exist.
           (if (setf nsdecl-node (find-nsdecl-node* prefix e-space))
             nsdecl-node
             (find-nsdecl-node prefix a-space))))
    (if (and (symbol-package e-name) (symbol-package a-name))
      (eq e-name a-name)
      (or (qname-equal e-name a-name)
          (and (string= (local-part e-name) (local-part a-name))
               (let ((e-namespace (or (namespace-name e-name)
                                      (when (setf e-nsdecl-node (find-combined-nsdecl-node (prefix e-name)))
                                        (setf (namespace-name e-name) (namespace-name e-nsdecl-node)))))
                     (a-namespace (or (namespace-name a-name)
                                      (when (setf a-nsdecl-node (find-combined-nsdecl-node (prefix a-name)))
                                        (setf (namespace-name a-name) (namespace-name a-nsdecl-node))))))
                 ;; (print (list e-name e-namespace a-name a-namespace))
                 (and e-namespace a-namespace
                      (string= e-namespace a-namespace))))))))

(defMethod element/attribute-qname-equal
           ((e-name qname) (a-name qname)
            (e-space def-type-qname-context) (a-space def-attr-qname-context)
            &aux e-nsdecl-node a-nsdecl-node)
  "see method for (SYMBOL x SYMBOL)"
  (flet ((find-combined-nsdecl-node (prefix &aux nsdecl-node)
           ;; search parents and cache result only if parents exist.
           (if (setf nsdecl-node (find-nsdecl-node* prefix e-space))
             nsdecl-node
             (find-nsdecl-node prefix a-space))))
    (or (qname-equal e-name a-name)
        (and (string= (local-part e-name) (local-part a-name))
             (let ((e-namespace (or (namespace-name e-name)
                                    (when (setf e-nsdecl-node (find-combined-nsdecl-node (prefix e-name)))
                                      (setf (namespace-name e-name) (namespace-name e-nsdecl-node)))))
                   (a-namespace (or (namespace-name a-name)
                                    (when (setf a-nsdecl-node (find-combined-nsdecl-node (prefix a-name)))
                                      (setf (namespace-name a-name) (namespace-name a-nsdecl-node))))))
               ;; (print (list e-name e-namespace a-name a-namespace))
               (and e-namespace a-namespace
                    (string= e-namespace a-namespace)))))))

(defMethod element/attribute-qname-equal
           ((e-name uname) (a-name uname)
            (e-space def-type-qname-context) (a-space def-attr-qname-context))
  (uname-equal e-name a-name))

(defMethod element/element-qname-equal
           ((p-name symbol) (c-name symbol)
            (p-space def-type-qname-context) (c-space def-type-qname-context)
            &aux p-nsdecl-node c-nsdecl-node)
  "this method is used when resolving element/content relations. <code>P-NAME</code> appears
   in the element content model. <code>C-NAME</code> is the element id from an element
   declaration. 
   the names match if they are literally equal, or if the local parts are equal and
   the child prefix identifies an ns-binding either directly in the child or visible in the
   parent and the parent prefix identifies an ns-binding visible in the parent, such that
   the namespace names match.
   note that, the parent relations of the parent are already resolved, while those of the child
   do not yet exist."
  (labels ((find-child-nsdecl-node (prefix)
             (or (find-nsdecl-node prefix c-space)
                 (find-nsdecl-node* prefix p-space))))
    (if (and (symbol-package p-name) (symbol-package c-name))
      (eq p-name c-name)
      (or (qname-equal p-name c-name)
          (and (string= (local-part p-name) (local-part c-name))
               (let ((p-namespace (or (namespace-name p-name)
                                      (when (setf p-nsdecl-node (find-nsdecl-node* (prefix p-name) p-space))
                                        (setf (namespace-name p-name) (namespace-name p-nsdecl-node)))))
                     (c-namespace nil))
                 (and p-namespace
                      ;; don't cache the name unless it matches
                      (setf c-namespace (or (namespace-name c-name)
                                            (when (setf c-nsdecl-node (find-child-nsdecl-node (prefix c-name)))
                                              (namespace-name c-nsdecl-node))
                                            (when (setf c-nsdecl-node (find-child-nsdecl-node (prefix c-name)))
                                              (namespace-name c-nsdecl-node))))
                      (when (string= p-namespace c-namespace)
                        (setf (namespace-name c-name) c-namespace)))))))))

(defMethod element/element-qname-equal
           ((p-name qname) (c-name qname)
            (p-space def-type-qname-context) (c-space def-type-qname-context)
            &aux p-nsdecl-node c-nsdecl-node)
  "see method for (SYMBOL x SYMBOL)"
  (labels ((find-child-nsdecl-node (prefix)
             (or (find-nsdecl-node prefix c-space)
                 (find-nsdecl-node* prefix p-space))))
    (or (qname-equal p-name c-name)
        (and (string= (local-part p-name) (local-part c-name))
             (let ((p-namespace (or (namespace-name p-name)
                                    (when (setf p-nsdecl-node (find-nsdecl-node* (prefix p-name) p-space))
                                      (setf (namespace-name p-name) (namespace-name p-nsdecl-node)))))
                   (c-namespace nil))
               (and p-namespace
                    ;; don't cache the name unless it matches
                    (setf c-namespace (or (namespace-name c-name)
                                          (when (setf c-nsdecl-node (find-child-nsdecl-node (prefix c-name)))
                                            (namespace-name c-nsdecl-node))
                                          (when (setf c-nsdecl-node (find-child-nsdecl-node (prefix c-name)))
                                            (namespace-name c-nsdecl-node))))
                    (when (string= p-namespace c-namespace)
                      (setf (namespace-name c-name) c-namespace))))))))

(defMethod element/element-qname-equal
           ((e-name uname) (a-name uname)
            (p-space def-type-qname-context) (c-space def-type-qname-context))
  (uname-equal e-name a-name))


#|
universal name assignment:

each element space comprises all symbols in its respective def-elem-type, and def-attr instances.
for each of these, the prefix/namespace binding is resolved and the universal name is determined
and asserted. this for each of the name, content-names, and attr-nodes symbols.
then a walk is performed on the respective definition instance and the original uninterned
symbol is replaced with the universal name. should noname be present by that point, this is an
error.

|#

(defMethod assign-namespace ((name symbol) (context def-type-qname-context))
  (flet ((maybe-static-namespace-name (prefix)
           (cond ((string= prefix *default-prefix-string*)
                  (when (null *default-namespace-is-visible*)
                    *null-namespace-name*))
                 ((string= prefix *xml-prefix-string*)
                  *xml-namespace-name*))))
    (unless (namespace name)
      (let* ((nsdecl-node (find-nsdecl-node* (prefix name) context))
             (namespace (if nsdecl-node
                          (namespace nsdecl-node)
                          (maybe-static-namespace-name (prefix name)))))
        (etypecase namespace
          (string (setf (namespace-name name) namespace))
          (nameset-tokenizer (setf (namespace-name name) (name namespace)))
          (package (setf (namespace-name name) (namespace-name namespace)))
          (null
           ;; it would be inappropriate to warn here, since namespace assignement
           ;; will be attempted for partitions. in which case a dependant physical
           ;; entity my be defining elements which do not appear in a structure
           ;; until later the dominant entity is
           ;; (warn "no namespace present for name: ~/xqdm:format-name/: ~s." name *document*)
           ;; (break)
           ))))))

(defMethod assign-namespace ((name abstract-name) (context def-type-qname-context))
  (flet ((maybe-static-namespace-name (prefix)
           (cond ((string= prefix *default-prefix-string*)
                  (when (null *default-namespace-is-visible*)
                    *null-namespace-name*))
                 ((string= prefix *xml-prefix-string*)
                  *xml-namespace-name*))))
    (unless (namespace name)
      (let* ((nsdecl-node (find-nsdecl-node* (prefix name) context))
             (namespace (if nsdecl-node
                          (namespace nsdecl-node)
                          (maybe-static-namespace-name (prefix name)))))
        (etypecase namespace
          (string (setf (namespace-name name) namespace))
          (nameset-tokenizer (setf (namespace name) namespace))
          (package (setf (namespace name) namespace))
          (null
           ;; see note on symbol method
           ))))))

(defMethod assign-namespace ((node attribute-node) context &aux (*default-namespace-is-visible* nil))
  (assign-namespace (name node) context))

(defMethod assign-namespaces ((spaces list))
  (dolist (space spaces)
    (assign-namespaces space)))

(defMethod assign-namespaces ((space def-type-qname-context))
  (when (eq (pass-id space) *pass-id*)
    ;; perform assignment for spaces which have been augmented in this pass
    (assign-namespace (name space) space)
    ;; use the located childrens' prefix/namespace binding to resolve the content names
    ;; and for only those children which have been found to this point. this to allow for multiple
    ;; subsets. note that a child symbol may appear more than once if the model so specifies.
    (dolist (name (content-names space))
      (unless (namespace-name name) (assign-namespace name space)))
    (dolist (c-space (children space))
      (let ((c-space-name (name c-space)) (found nil) c-space-ns space-ns)
        (dolist (c-name (content-names space))
          (cond ((or (eq c-name *wild-name*) (eq c-name *wild-uname*))
                 (assign-namespace c-space-name c-space)
                 (setf found t))
                ((eq (content-name-type-name c-name) c-space-name)
                 ;; assignment was already possible when the spaces were linked
                 (setf found t))
                ((qname-equal c-name c-space-name)
                 (assign-namespace c-name c-space)
                 (setf found t))
                ;; try to resolve the case where prefixes diverge, but bindings agree
                ((and (string= (local-part c-name) (local-part c-space-name))
                      (setf c-space-ns (find-nsdecl-node* (prefix c-space-name) c-space))
                      (setf space-ns (find-nsdecl-node (prefix c-name) space))
                      (string= (namespace-name c-space-ns) (namespace-name space-ns)))
                 (setf (namespace-name c-name) (namespace-name c-space-ns)
                       found t))))
        (unless found
          (warn "lost child name: ~s / ~s." (name space) c-space-name)
          (break))))
    #|(mapc #'(lambda (c-space
                     &aux (c-name (find (name c-space) (content-names space) :test #'qname-equal)))
              (unless c-name (error "lost child name: ~s/~s." (name space) (name c-space)))
              (assign-namespace c-name c-space))
          (children space))|#
    ;; ignore nsdecl-nodes, they have a static namespace
    (dolist (attribute-node (attr-nodes space))
        (assign-namespace attribute-node space))))


(defGeneric resolve-universal-name (datum)
  (:method ((name symbol) &aux namespace-or-name uname prefix)
           (cond ((namespace name) name)
                 ((setf namespace-or-name (cond ((namespace-name name))
                                                ((string= (setf prefix (prefix name)) *default-prefix-string*)
                                                 (cond ((and *default-namespace-is-visible* (default-namespace)))
                                                       (t *null-namespace-name*)))
                                                ((string= prefix *xml-prefix-string*)
                                                 *xml-namespace-name*)
                                                ((string= prefix *xmlns-prefix-string*)
                                                 *xmlns-namespace-name*)))
                  (setf uname (intern-name (string name) namespace-or-name)
                        (prefix uname) (prefix name))
                  uname)
                 (t
                  (restart-case
                    (progn
                      (|NSC: Namespace Undetermined| :name name :document *document*)
                      name)
                    (use-value (namespace)
                               (setf uname (intern-name (string name) namespace)
                                     (prefix uname) (prefix name))
                               uname)))))
  (:method ((name qname) &aux namespace uname prefix)
           (cond ((setf namespace (namespace name))
                  (setf uname (intern-name (local-part name) namespace)
                        (prefix uname) (prefix name))
                  uname)
                 ((setf namespace (cond ((namespace-name name))
                                        ((string= (setf prefix (prefix name)) *default-prefix-string*)
                                                 (cond ((and *default-namespace-is-visible* (default-namespace)))
                                                       (t *null-namespace-name*)))
                                        ((string= prefix *xml-prefix-string*)
                                         *xml-namespace-name*)
                                        ((string= prefix *xmlns-prefix-string*)
                                         *xmlns-namespace-name*)))
                  (setf uname (intern-name (local-part name) namespace)
                        (prefix uname) (prefix name))
                  uname)
                 (t
                  (restart-case
                    (progn
                      (|NSC: Namespace Undetermined| :name name :document *document*)
                      ;; (break)
                      name)
                    (use-value (namespace)
                               (setf uname (intern-name (local-part name) namespace)
                                     (prefix uname) (prefix name))
                               uname)))))
  (:method ((name uname)) name))

(defGeneric resolve-node-names (context)
  (:documentation
   "walk the definition components and replace names with the respective universal name.
    the traversal is similar to the generic abstract walk functions, but the presence of side-effects means its easier to maintian as an isolated function since only a subset of the possible node types are involed and many leaves are replaced rahter than visited. the traversal starts at the cached qname contexts, through the definitions to any content models and default nodes.")

  (:method ((datum list))
           (map nil #'resolve-node-names datum))

  (:method ((context def-type-qname-context))
           "perform a final namespace assignment for contexts which were never linked, had no attributes, etc. then resolve names in the definitions."
           ;; (break "before")
           (when (null (pass-id context))
             (assign-namespaces context))
           (map nil #'resolve-node-names (namespace-declarations context))
           (let ((*default-namespace-is-visible* nil))
             (map nil #'resolve-node-names (attributes context)))
           ;; nb. the content names must remain uninterned as they are the link back from content spaces.
           (resolve-node-names (definition context))
           ;; (break "after")
           )

  (:method ((context element-definition))
           (with-slots (name qname-context) context
             (when qname-context
               (setf (direct-annotation-model context)
                     (nconc (mapcar #'definition (namespace-declarations qname-context))
                            ;; remove duplicate elements from the front.
                            ;; eq suffices as they are now interned.
                            (remove-duplicates (mapcar #'definition (attributes qname-context)) :key #'name))))
             (setf name (resolve-universal-name name))
             (resolve-node-names (direct-annotation-model context))
             (resolve-node-names (content-model context))))

  (:method ((context annotation-definition))
           (with-accessors ((name name) (prototype prototype)) context
             (setf name (resolve-universal-name name))
             (when prototype
               (setf (name prototype) (resolve-universal-name (name prototype))))))

  (:method ((context annotation-node))
           (with-slots (name def) context
             (setf name (resolve-universal-name name))
             (when def (setf (name def) (resolve-universal-name (name def))))))

  (:method ((context content-model))
           (resolve-node-names (nonterminal context))
           (resolve-node-names (grammar context)))
  (:method ((context content-list))
           (resolve-node-names (expressions context)))
  (:method ((context content-occurrence))
           (resolve-node-names (expression context)))
  (:method ((context content-name))
           (setf (name context) (resolve-universal-name (name context))))
  (:method ((context type-name))
           (setf (name context) (resolve-universal-name (name context))))

  (:method ((datum t))
           datum))


; (setq *trace-qname-resolution* nil)
; (setq *trace-qname-resolution* t)

(defun assign-universal-names   (&optional root-def-type &aux 
                                           (*cache-mode* :all))
  "the second pass for name resolution uses constraints collected in the respective
   <code>DEF-ELEM-TYPE</code>s' qname-contexts based on attribute declarations to first
   combine element/content contexts. recursive ns-propagation and further combinations
   are possible. this should complete the assertion of namespace constraints in
   qualified name properties. the type declarations are then traversed to replace
   the as yet uninterned qualified names in the definitions with their universal names."
  (declare (ftype (function (t t) t) write-node-graph))
  #|(unless *propagate-incrementally*
    (maphash #'(lambda (name contexts)
                 (declare (ignore name))
                 (dolist (context contexts)
                   (combine-qname-contexts context :propagate t)))
             *def-type-id-qname-contexts*))|#
  ;; (warn "explicit propagation starting")
  ;; (break "assign universal names, before propagation")
  (let ((all-contexts (qname-contexts :type-by-precedence))
        (*contexts nil))
     (declare (special *contexts))
     (dolist (context all-contexts)
       (combine-qname-contexts context :propagate t))
     (dolist (context all-contexts)
       (propagate-ns-cache context)))
  ;; (break "assign universal names, after propagation")
  ;; export a graph for documentation
  (when (and root-def-type *verbose-qnames* (fboundp 'write-node-graph))
    (write-node-graph (qname-context root-def-type)
                      (format nil "xml:tests;graphs;~aQnames.dot" (name root-def-type))))
  ;; resolve the names for accumulated type declarations
  (maphash #'(lambda (name contexts)
               (declare (ignore name))
               (map nil #'resolve-node-names contexts))
           *def-type-id-qname-contexts*))

;;
;;
;;

(defGeneric qname-context-lessp (c1 c2)
  (:method ((c1 def-type-qname-context) (c2 def-type-qname-context) &aux cache)
           (labels ((find-as-parent* (c2-parent)
                      (cond ((eq c1 c2-parent))
                            ((not (find c2-parent cache))
                             (push c2-parent cache)
                             (find-if #'find-as-parent* (parents c2-parent))))))
             (find-if #'find-as-parent* (parents c2))))
  (:method ((c1 t) (c2 t)) nil))

(defun qname-contexts (name)
  ;; take care to copy the list prior to sorting. otherwise the first component may get
  ;; reused thereby corrupting the individual components.
  (case name
    (:all (let ((all-contexts nil))
            (flet ((augment (key contexts)
                     (unless (eq key *wild-name*)
                       (setf all-contexts (append all-contexts contexts)))))
              (maphash #'augment *def-type-id-qname-contexts*)
              (maphash #'augment *def-attr-qname-contexts*))
            (sort (copy-list all-contexts)
                  #'(lambda (c1 c2 &aux (n1 (name c1)) (n2 (name c2)))
                      (if (string< n1 n2)
                        t
                        (if (string= n1 n2)
                          (typep c1 'def-type-qname-context)))))))
    (:by-name (let ((all-contexts nil))
                (flet ((augment (key contexts &aux  (name-contexts nil))
                         (cond ((setf name-contexts (assoc key all-contexts :test #'string=))
                                (setf (rest name-contexts)
                                      (append (rest name-contexts) contexts)))
                               (t
                                (push (cons key contexts) all-contexts)))))
                  (maphash #'augment *def-type-id-qname-contexts*)
                  (maphash #'augment *def-attr-qname-contexts*))
                (sort (copy-list all-contexts) #'string< :key #'first)))
    (:type-by-precedence (let ((all-contexts nil))
                           (flet ((augment (key contexts)
                                    (declare (ignore key))
                                    (setf all-contexts (append all-contexts contexts))))
                             (maphash #'augment *def-type-id-qname-contexts*))
                           (sort (copy-list all-contexts) #'qname-context-lessp)))
    (t
     (append (id-qname-contexts (string name))
             (attr-qname-contexts (string name))))))

(defun id-qname-contexts (name)
  (gethash (local-part name) *def-type-id-qname-contexts*))

(defun add-id-qname-context (context
                             &aux
                             (name (name context))
                             (namestring (local-part name))
                             (contexts (gethash namestring *def-type-id-qname-contexts*)))
  (assert (typep context 'def-type-qname-context))
  ;; if the type is already registered ignore it.
  ;; a later binding step will check the validity constraint
  (cond ((find (name context) contexts :key #'name :test #'qname-equal)
         (cond ((validate-p (def context))
                (xml-error |VC: Unique Element Type Declaration| :name name))
               (*xml-verbose*
                (warn "duplicate element declaration: ~/xqdm:format-name/." name))))
        (t
         (push context contexts)
         (setf (gethash namestring *def-type-id-qname-contexts*)
               contexts)))
  context)

(defun remove-id-qname-context (context
                                &aux
                                (namestring (local-part (name context)))
                                (contexts (gethash namestring *def-type-id-qname-contexts*)))
  (setf contexts (remove context contexts))
  (if contexts
    (setf (gethash namestring *def-type-id-qname-contexts*) contexts)
    (remhash namestring *def-type-id-qname-contexts*))
  context)


(defun model-qname-contexts (name)
  (gethash (local-part name) *def-type-model-qname-contexts*))
(defun add-model-qname-context (name context
                                     &aux
                                     (namestring (local-part name))
                                     (contexts (gethash namestring *def-type-model-qname-contexts*)))
  (assert (typep context 'def-type-qname-context))
  (unless (find (name context) contexts :key #'name :test #'qname-equal)
    ;; a previous definition may well exist, since the cache id is the local name
    ;; which may appear more than once in a model - each time with a distinct prefix
    (setf (gethash namestring *def-type-model-qname-contexts*)
          (cons context contexts)))
  context)
(defun remove-model-qname-context (name context
                                &aux
                                (namestring (local-part name))
                                (contexts (gethash namestring
                                                   *def-type-model-qname-contexts*)))
  (setf contexts (remove context contexts))
  (if contexts
    (setf (gethash namestring *def-type-model-qname-contexts*) contexts)
    (remhash namestring *def-type-model-qname-contexts*))
  context)

(defun attr-qname-contexts (name)
  (gethash (local-part name) *def-attr-qname-contexts*))
(defun add-attr-qname-context (context
                             &aux
                             (name (name context))
                             (namestring (local-part name))
                             (contexts (gethash namestring *def-attr-qname-contexts*)))
  (assert (typep context 'def-attr-qname-context))
  (setf (gethash namestring *def-attr-qname-contexts*)
        (cons context contexts))
  context)
(defun remove-attr-qname-context (context
                                &aux
                                (namestring (local-part (name context)))
                                (contexts (gethash namestring *def-attr-qname-contexts*)))
  (setf contexts (remove context contexts))
  (if contexts
    (setf (gethash namestring *def-attr-qname-contexts*) contexts)
    (remhash namestring *def-attr-qname-contexts*))
  context)

(defGeneric accumulate-qnames (definition)
  (:documentation
   "accumulate declarations incrementally as they appear. they are recorded by local name,
    independant of prefix. literal attribute-element combination is performed
    incrementally, but propagation and indirect combination is deferred until the entire
    declaration is read. otherwise bindings 
    done whether namespace-aware or not, in preparation for combining attribute and element
    declarations.")
  (:method ((def doctype-element-definition))
           (accumulate-qnames (qname-context def)))
  (:method ((def doctype-attlist-definition))
           (accumulate-qnames (qname-context def)))
  (:method ((context def-type-qname-context))
           (add-id-qname-context context)
           (dolist (content-name (content-names context))
             (add-model-qname-context content-name context))
           (combine-qname-contexts context :propagate *propagate-incrementally*))
  (:method ((context def-attr-qname-context))
           (add-attr-qname-context context)
           (combine-qname-contexts context :propagate *propagate-incrementally*)))

(defGeneric combine-qname-contexts (context &key propagate)
  (:documentation
   "combine accumulated contexts: begin with the global context by combining model and
    attribute contexts for matching element generic identifiers. where an element context
    is augmented, resolve attribute names. where the addition was a namespace, recurse to
    resolve model names and attempt further content/element matches.")
  (:method ((context def-type-qname-context) &key (propagate nil)
            &aux (name (name context)))
           "where the context is new, propagate is nil and only element/attribute
            combinations are attempted. where an id has been resolved, propagation may be
            permitted."
           (when *trace-qname-resolution*
               (format *trace-output* "~%combine element context ~s:" (name context)))
           (dolist (a-context (attr-qname-contexts name))
             (when *trace-qname-resolution*
               (format *trace-output* "~% combine element/attlist ~s/~s?" (name context) (name a-context)))
             (cond ((and (null (assignment a-context))
                         (element/attribute-qname-equal (name context) (name a-context)
                                                        context a-context))
                    (when *trace-qname-resolution*
                      (write-string "--> t" *trace-output*))
                    (augment-properties context a-context))
                   (*trace-qname-resolution*
                    (format *trace-output*  "--> ~:[nil~; =~a~]." 
                            (assignment a-context) (name (assignment a-context))))))
           (when propagate
             ;; first combine as content with contexts with explicit models.
             ;; one match only is necessary since at most one definition should match
             (dolist (m-context (model-qname-contexts name))
               (when *trace-qname-resolution*
                 (format *trace-output* "~% combine parent/element-as-content ~s/~s (~s) ?"
                         (name m-context) (name context) (content-names m-context)))
               (cond ((find context (children m-context))
                      (when *trace-qname-resolution*
                        (write-string "--> already present" *trace-output*)))
                     (t
                      (let ((m-name
                             (find-if #'(lambda (m-name)
                                          (element/element-qname-equal m-name name
                                                                       m-context context))
                                      (content-names m-context))))
                        (cond (m-name
                               (when *trace-qname-resolution*
                                 (write-string "--> t" *trace-output*))
                               (if (namespace-name name)
                                 (setf (namespace-name m-name) (namespace-name name))
                                 (push m-name (type-name-content-names name)))
                               (setf (content-name-type-name m-name) name)
                               (augment-children m-context context))
                              (*trace-qname-resolution*
                               (write-string "--> nil." *trace-output*))))))))
                               
             ;; attempt combination as a parent context for id contexts which are already constrained.
             ;; this is necessary in order that parent declarations can follow children
             ;; further is not attempted here: it depends on a change in status for the individual model name,
             ;; which is monitored in augment-nsdecl-nodes when other type contexts are added.
             (dolist (m-name (content-names context))
               (when *trace-qname-resolution*
                 (format *trace-output* "~% combine element-as-parent/content ~s/~s ?" name m-name))
               (dolist (m-context (id-qname-contexts m-name))
                 (let ((m-type-name (name m-context)))
                   (when *trace-qname-resolution*
                     (format *trace-output* "~%  next content context ~a." m-type-name))
                   (cond ((element/element-qname-equal m-name m-type-name context m-context)
                          (when *trace-qname-resolution*
                            (format *trace-output* "--> t."))
                          (if (namespace-name m-type-name)
                            (setf (namespace-name m-name) (namespace-name m-type-name))
                            (push m-name (type-name-content-names m-type-name)))
                          (setf (content-name-type-name m-name) m-type-name))
                         (*trace-qname-resolution*
                               (write-string "--> nil." *trace-output*)))
                   (return))))

             ;; then combine with contexts with ANY content
             (dolist (m-context (model-qname-contexts *wild-name*))
               (when *trace-qname-resolution*
                 (format *trace-output* "~% combine as content with any ~s/~s." (name m-context) name))
               (augment-children m-context context)))
  (:method ((context def-attr-qname-context) &key propagate
            &aux (name (name context)) e-context)
           ;; if the respective 
           (when (setf e-context
                       (find-if #'(lambda (e-context)
                                    (element/attribute-qname-equal (name e-context) name
                                                                   e-context context))
                                (id-qname-contexts name)))
             ;; (format *trace-output* "~%combine e/a: ~s/~s" (name e-context) name)
             (augment-properties e-context context :propagate propagate))))
;(trace augment-attributes combine-qname-contexts)

(defMethod augment-children ((p-context def-type-qname-context) (c-context def-type-qname-context))
  "when a name from one context's content matches another context's identifier,
   add the second context as a successor.
   if any namespace bindings are present in the parent, propagate them."
  (unless (find c-context (children p-context))
    (push c-context (children p-context))
    (push p-context (parents c-context))
    (propagate-nsdecl-node c-context (nsdecl-nodes p-context))))

(defGeneric attempt-qname-resolution (name nsdecl-node)
  (:method ((name symbol) nsdecl-node)
           (when (string= (prefix name) (local-part nsdecl-node))
             (let ((namespace-name (namespace-name name)))
               (cond (namespace-name
                      (unless (string= namespace-name (namespace-name nsdecl-node))
                        (warn "conflicting namespace bindings: ~a: ~s != ~s."
                              (prefix name) namespace-name (namespace-name nsdecl-node)))
                      nil)
                     (t
                      (setf (namespace-name name) (namespace-name nsdecl-node)))))))
  (:method ((name abstract-name) nsdecl-node)
           (when (string= (prefix name) (local-part nsdecl-node))
             (let ((namespace-name (namespace-name name)))
               (cond (namespace-name
                      (unless (string= namespace-name (namespace-name nsdecl-node))
                        (warn "conflicting namespace bindings: ~a: ~s != ~s."
                              (prefix name) namespace-name (namespace-name nsdecl-node)))
                      nil)
                     (t
                      (setf (namespace name) (namespace nsdecl-node))))))))

;(trace attempt-qname-resolution)

(defGeneric augment-nsdecl-nodes (context nsdecl-node &key inherited propagate)
  (:documentation
   "invoked either when combining element and attribute definition contexts, or when
    asserting bindings based on inferred containment relations. in the former case,
    propagate==nil in the latter case inherited==t.")
  (:method ((context def-type-qname-context) (nsdecl-node nsdecl-node)
            &key (inherited nil) (propagate nil)
            &aux (name (name context)))
           "add the node to the context's cache; try to resolve any names present."
           (unless inherited (push nsdecl-node (nsdecl-nodes context)))
           (push (cons (local-part nsdecl-node) nsdecl-node) (ns-cache context))
           (when (attempt-qname-resolution name nsdecl-node)
             ;; upon id qname resolution, fix any connected models and
             (dolist (m-name (type-name-content-names name))
               (setf (namespace-name m-name) (namespace-name name)))
             ;; try to combine the context
             (combine-qname-contexts context :propagate propagate))
           (dolist (m-name (content-names context))
             (when (attempt-qname-resolution m-name nsdecl-node)
               (dolist (c-context (id-qname-contexts m-name))
                 (let ((c-name (name c-context)))
                   (when (element/element-qname-equal m-name c-name context c-context)
                     (setf (namespace-name c-name) (namespace-name m-name))
                     (combine-qname-contexts c-context)
                     (augment-children context c-context))))))
           (when propagate (propagate-nsdecl-node (children context) nsdecl-node))))
;(trace augment-nsdecl-nodes)

(defGeneric propagate-ns-cache (context)
  (:method ((p-context def-type-qname-context))
           (declare (special *contexts))
           (unless (find p-context *contexts)
             (push p-context *contexts)
             (dolist (c-context (children p-context))
               (dolist (cache-entry (ns-cache p-context))
                 (unless (assoc (first cache-entry) (ns-cache c-context) :test #'equal)
                   (push cache-entry (ns-cache c-context))))
               (propagate-ns-cache c-context)))))

(defGeneric propagate-nsdecl-node (context nsdecl-node)
  (:documentation
   "where a namespace binding is not yet apparent in a given context, augment the context's namespace
    bindings. this triggers an attempt to combine that context. then propagate the binding further.
    avoid cycles by noting the binding first.")
  (:method ((contexts list) (nsdecl-node nsdecl-node))
           (dolist (context contexts) (propagate-nsdecl-node context nsdecl-node)))
  (:method ((context t) (nsdecl-nodes list))
           (dolist (nsdecl-node nsdecl-nodes) (propagate-nsdecl-node context nsdecl-node)))
  (:method ((context def-type-qname-context) (nsdecl-node nsdecl-node))
           (unless (assoc (local-part nsdecl-node) (ns-cache context) :test #'string=)
             (augment-nsdecl-nodes context nsdecl-node :inherited t :propagate t))))

(defGeneric augment-attr-nodes (context attribute-node)
  (:method ((context def-type-qname-context) (attr-node attribute-node))
           (push attr-node (attr-nodes context))))

(defGeneric augment-properties (e-context a-context &key propagate)
  (:documentation
   "augment the attribute and namespace definitions for an element context from those
    present in an attribute context. as invocation is during the initial combination phase
    only, nsdecl-nodes are not propagated further.")
  (:method ((p-context def-type-qname-context) (a-context def-attr-qname-context)
            &key propagate)
           ;; note the assignment first
           ;; carry over the name, so that namespace will be indicated for the a-context
           (setf (assignment a-context) p-context
                 (name a-context) (name p-context))
           (let ((a-context-def (def a-context)))
             (when a-context-def (setf (name a-context-def) (name a-context))))
           (dolist (nsdecl-node (nsdecl-nodes a-context))
             (unless (find (local-part nsdecl-node) (nsdecl-nodes p-context) :test #'string= :key #'local-part)
               (augment-nsdecl-nodes p-context nsdecl-node :propagate propagate :inherited nil)))
           ;; then merge property names. literal duplicates can be eliminated immediately,
           ;; but note that a second pass is still required after names have been
           ;; resolved. (see remove-duplicate-attributes)
           (dolist (attr-node (attr-nodes a-context))
             #|(unless (find (local-part attr-node) (attr-nodes p-context) :test #'string= :key #'local-part)
               (augment-attr-nodes p-context attr-node))|#
             (unless (find (name attr-node) (attr-nodes p-context) :test #'qname-equal :key #'name)
               (augment-attr-nodes p-context attr-node)))
           a-context))

(defmethod remove-duplicate-attributes ((context def-type-qname-context))
  "after all names have been resolved, remove duplicate attributes.
   as the names are resolved, eq suffices. this accounts for cases where different
   qnames have resolved to the same universal name."
  (setf (attr-nodes context)
        (remove-duplicates (attr-nodes context) :key #'name)))
      

;;
;;
;;

#|

(defun make-qname (string &aux (pos (position #\: string)) symbol)
  (setf symbol (make-symbol (if pos (subseq string (1+ pos)) string)))
  (when pos
    (setf (prefix symbol) (intern-prefix (subseq string 0 pos) (xmlns-namespace))))
  symbol)

(setq *def-type-id-qname-contexts* (make-hash-table :test #'equalp))
(setq *def-type-model-qname-contexts* (make-hash-table :test #'equalp))
(setq *def-attr-qname-contexts* (make-hash-table :test #'equalp))

(defParameter *space-a.x*
  (make-instance 'def-type-qname-context :name (make-qname "a:X")
                 :content-names (list (make-qname "a:Y") (make-qname "a:Z"))))
(defParameter *space-a.y*
  (make-instance 'def-type-qname-context :name (make-qname "a:Y")
                 :content-names nil))
(defParameter *space-a.z*
  (make-instance 'def-type-qname-context :name (make-qname "a:Z")
                 :content-names nil))
(defParameter *space-@a.x*
  (make-instance 'def-attr-qname-context :name (make-qname "a:X")
                 :attr-nodes (list (make-string-attr-node :name (make-qname "a:ATT1"))
                                   (make-string-attr-node :name (make-qname "a:ATT2")))
                 :nsdecl-nodes (list (make-nsdecl-node :name '|xmlns|::|a| :children (list "123")))))
(defParameter *space-@a.y*
  (make-instance 'def-attr-qname-context :name (make-qname "a:Y")
                 :attr-nodes (list (make-string-attr-node :name (make-qname "a:ATT3")))
                 :nsdecl-nodes ()))
(map nil #'accumulate-qnames (list *space-a.x* *space-a.y* *space-a.z*
                                   *space-@a.x*  *space-@a.y*))

(combine-qname-contexts *def-type-id-qname-contexts*)

(inspect (qname-contexts :all))
(inspect (qname-contexts :by-name))
(inspect *def-attr-qname-contexts*)
(write-node-graph (list *def-type-id-qname-contexts* *def-attr-qname-contexts*)
                  "qnames.dot")
(def-attr-qname-contexts "Y")



(let ((internal
       (list (make-instance 'def-attr-qname-context :name (make-qname "alpha")
                            :attr-nodes () :nsdecl-nodes (list (make-nsdecl-node "" "a-names")))
             (make-instance 'def-attr-qname-context :name (make-qname "beta")
                            :attr-nodes () :nsdecl-nodes (list (make-nsdecl-node "" "b-names")))
             (make-instance 'def-type-qname-context :name (make-qname "universal")
                            :content-names (list (make-qname "alpha") (make-qname "beta")))
             (make-instance 'def-attr-qname-context :name (make-qname "universal")
                            :attr-nodes () :nsdecl-nodes (list (make-nsdecl-node  "" "u-names")))))
      (external1
       (list (make-instance 'def-type-qname-context :name (make-qname "alpha")
                            :content-names (list (make-qname "one") (make-qname "two")))
             (make-instance 'def-type-qname-context :name (make-qname "one")
                            :content-names nil)
             (make-instance 'def-type-qname-context :name (make-qname "two")
                            :content-names nil)))
      (external2
       (list (make-instance 'def-type-qname-context :name (make-qname "beta")
                            :content-names (list (make-qname "one") (make-qname "two")))
             (make-instance 'def-type-qname-context :name (make-qname "one")
                            :content-names nil)
             (make-instance 'def-type-qname-context :name (make-qname "two")
                            :content-names nil))))
  (inspect (list (intern-qnames (append internal external1))
                 (intern-qnames (append internal external2)))))



(pprint (ccl:top-inspect-form))
(trace combine-elem-declaration)

|#