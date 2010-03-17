;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  XML paths are a means to specify a set of elements in a document.
  <p>
  the set is generated from an origin node by generating candiates along some
  "dimension" and selecting from among the candiates using filter predicates.</p>
  <p>
  the generators are modelled with closures which generate one of the specified
  nodes incrementally.
  the predicates are modeled as closures over a source - which may be a
  generator or a predicate closure, which consume nodes and yield those which
  match the respective criteria.</p>
  <p>
  the outer-most context determines the disposition of the results of path
  application.
  this context could be either an set-oriented function, or an iteration function.
  the set oriented functions include element construction, and accumulaton
  methods, such as sum or count.</p>
  <p>
  where it is a construction operator, the results are wrapped in a COLLECT-NODES
  form, to generate the set value. this furnishes a collection closure to the
  path which consumes the generated nodes and constructs the set.
  where it is an ierative expression, the path is given a consumption function
  which is provided with one generated node for each pass through the
  iteration.</p>
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010602'>
   added support for count to step generators.
   count is generated incrementally, rather than collecting the set or traversing it in
   advance. (with the exception of the parent axis.)
   </DELTA>
  <DELTA DATE='20010609'>typo in root generator</DELTA>
  <DELTA DATE='20010610'>clos root and child generator, name test</DELTA>
  <DELTA DATE='20010622'>*default-namespace-attribute-name* for LispWorks/pe reader</DELTA>
  <DELTA DATE='20011211'>corrections to xpa::intern, compute-child-generator for name instances</DELTA>
  <DELTA DATE='20030917'>removed an errant print statement</DELTA>
  </CHRONOLOGY>>
 </DOCUMENTATION>
|#

(in-package "XML-PATH")

;;
;; each compilation pass generates numerous temporary variables.
;; they are interned in order that the code can be saved and compiled.
;; in order to conserve symbol resource, the name counter is restarted for each
;; compiler pass, as the names must be unique within a given pass only.
;; this behaviour is different from gensym/temp in that the latter always ensure
;; global uniqueness

(defun xpa::gensym (&optional (stem "SYM-") (package *xpa-package*))
  (intern (format nil "~a~d" stem (incf *gensym-counter*)) package))

(defun xpa::intern (name)
  (etypecase name
    (symbol name)
    (cons
     (destructuring-bind (&key local-part namespace prefix) (rest name)
       (cond ((and (null namespace) (null prefix) (string-equal local-part (local-part *wild-name*)))
              *wild-uname*)
             (t
              (setf namespace
                    (if namespace
                      (or (find-package namespace)
                          (error "unknown namespace: ~s." namespace))
                      (if prefix
                        (prefix-value prefix)
                        (let ((|NSC: Prefix Declared| nil))
                          (or (prefix-value *default-namespace-attribute-name*)
                              *null-namespace*)))))
              (unless local-part (setf local-part "*"))
              (intern-name local-part namespace)))))))

(defun xpa::context-node ()
  xpa:*context-node*)

(defMacro xpa::funcall (function &rest args)
  ;; resolve qualified names to symbols at the point of compilation
  ;; symbol-valued arguments are quoted, but the function name is left as is.
  (cons (xpa::intern function)
        (mapcar #'(lambda (expr)
                    (cond ((and (consp expr) (eq (first expr) 'xpa:uname))
                           `(quote ,(xpa::intern expr)))
                          (t
                           expr)))
                args)))
          
#|
(defGeneric xpa::FUNCALL (function &rest args)
  (:method ((function function) &rest args)
           (apply function args))
  (:method ((function function-value) &rest args)
           (destructuring-bind (lambda parameters . body) (expression function)
             (declare (ignore lambda))
             (let ((xpa:*context-node*
                    (list* xpa:*context-node*
                           (mapcar #'(lambda (var val) (cons var val))
                                   parameters args))))
               (xpa::EVAL body)))))|#

(defMacro xpa::collect-nodes (&rest body
                               &aux (head (xqa::gensym)) (tail (xqa::gensym)))
  `(let* ((,head (list nil)) (,tail ,head))
     ,@(mapcar #'(lambda (form)
                   `(xq::map-nodes #'(lambda (node)
                                       (unless (member node ,head)
                                         (setf (rest ,tail) (list node)
                                               ,tail (rest ,tail))))
                                 ,form))
               body)
     (rest ,head)))

(defGeneric map-nodes (function datum)
  (:documentation
   "iterate over a node set. the target is the <em>the</em> first level of
    nodes. where the initial operand is an attribute or an element, use
    its content. where the target is a function, operate on the generated nodes.
    this method serves path-based forms.
    other non-sequence operands are acted upon directly.")
  (:method ((function function) (datum sequence))
           (map nil #'(lambda (datum)
                        (if (typep datum 'sequence)
                          (map-nodes function datum)
                          (funcall function datum)))
                datum))
  (:method ((operator function) (generator function))
           (let ((node nil))
             (loop (unless (setf node (funcall generator)) (return))
                   (funcall operator node))))
  (:method ((function function) (datum string))
           (funcall function datum))
  (:method ((function function) (datum number))
           (funcall function datum))
  (:method ((function function) (datum elem-node))
           (map-nodes function (children datum)))
  (:method ((function function) (datum attr-node))
           (map-nodes function (children datum))))

(defun xpa::call-with-collector (function)
  (let* ((head (list nil)) (tail head))
     (map-nodes #'(lambda (node)
                        (unless (member node head)
                          (setf (rest tail) (list node)
                                tail (rest tail))))
                    function)
     (rest head)))

;;
;; the core operation is to "apply" a path to a source.
;; this is effected by transforming the path description into a filter.
;; the generated function is applied to the source to produce a generator
;; closure. this source-specific function is called repeatedly to generate
;; all nodes which correspond to the path with respect to the source.
;;
;; when used in an iteration form, the map-nodes control structure generates
;; the stream and binds the individual nodes for the body.
;; when used in another context, the second application must be forced.
;;

(defGeneric xpa::path-function (step source)
  (:method ((path function) (source null))
           #'(lambda () nil))
  (:method ((path function) (source cons))
           (xpa::path-function path
                               #'(lambda () (pop source))))
  (:method ((path function) (source t))
           (xpa::path-function path (list source)))
  (:method ((path function) (source function))
           (funcall path source)))

(defGeneric compute-path-function
  (path-keyword &rest steps)
  (:method ((path (eql 'xpa:path)) &rest steps
            &aux (path-source (gensym "SOURCE-")))
           (let ((last-step-name path-source)
                 (path-bindings (list `(,path-source nil)))
                 (step-function nil))
             (dolist (step steps)
               (destructuring-bind (key &optional generator test 
                                        &rest predicates)
                                   step
                 (setf step-function
                       (apply #'compute-step-combination key last-step-name
                              generator test predicates))
                 (setf last-step-name (gensym (string key))))
               (push (list last-step-name step-function)
                     path-bindings))
             `(let* ,(reverse path-bindings)
                (function (lambda (source)
                            (setf ,path-source source)
                            ,last-step-name))))))

(defMacro xpa::apply-path (path source &aux form)
  (setf form
        `(xpa::path-function ,(apply #'compute-path-function path) ,source))
  form)

(defun is-child-name-test-step (generator test)
  (and (consp generator) (eq (first generator) 'xpa:child)
       (consp test) (eq (first test) 'xpa:name-test)))

(defGeneric compute-step-combination
  (step-keyword source generator test &rest predicates)
  (:method ((step (eql 'xpa:step))
            step-source generator test &rest predicates)
           (let ((generator-name (gensym (string (first generator))))
                 (step-bindings (list '(xpa:*context-node* nil)
                                      '(xpa:*position* 0)
                                      '(xpa:*count* 0)))
                 (last-test-name nil)
                 (test-function nil))
             (flet ((generate-test (test)
                      (setf test-function
                            (apply #'compute-predicate-combination
                                   (first test) last-test-name (rest test)))
                      (setf last-test-name (gensym "TEST-"))
                      (push (list last-test-name test-function)
                            step-bindings)))
               (cond ((is-child-name-test-step generator test)
                      ;; a child generator followed by a name test are implemented
                      ;; in a combined operation
                      (push (list generator-name
                                  (apply #'compute-child-generator step-source (rest test)))
                            step-bindings)
                      (setf last-test-name generator-name))
                     (t
                      ;; otherwise rewrite the generator and (optionally) the test to
                      ;; distinct operations
                      (push (list generator-name
                                  (apply #'compute-generator-combination
                                         (first generator) step-source (rest generator)))
                            step-bindings)
                      (setf last-test-name generator-name)
                      (when test (generate-test test))))
               (dolist (predicate predicates)
                 (generate-test predicate)))
             `(let* ,(reverse step-bindings)
                ,last-test-name)))
  (:method ((step (eql 'xpa:parent-step))
            step-source (generator t) (test t) &rest predicates)
           (apply #'compute-step-combination 'xpa:step
                                     step-source
                                     '(xpa:parent)
                                     nil
                                     predicates))
  (:method ((step (eql 'xpa:root-step))
            step-source (generator t) (test t) &rest predicates)
           (apply #'compute-step-combination 'xpa:step
                                     step-source
                                     '(xpa:root)
                                     nil
                                     predicates))
  (:method ((step (eql 'xpa:self-step))
            step-source (generator t) (test t) &rest predicates)
           (apply #'compute-step-combination 'xpa:step
                                     step-source
                                     '(xpa:self)
                                     nil
                                     predicates))
  (:method ((step (eql 'xpa:wild-inferior-step))
            step-source (generator t) (test t) &rest predicates)
           (apply #'compute-step-combination 'xpa:step
                                     step-source
                                     '(xpa:descendant-or-self)
                                     nil
                                     predicates)))

(defGeneric compute-generator-combination (generator source &key)
  (:method ((generator (eql 'xpa:ancestor)) source &key)
           `(let ((source-node nil)
                  (parent-node nil))
              #'(lambda ()
                  (loop (cond ((and parent-node
                                    (setf parent-node (parent parent-node)))
                               (incf xpa:*position*)
                               (setf xpa:*context-node* parent-node)
                               (return parent-node))
                              ((setf source-node (funcall ,source))
                               (setf xpa:*count* (parent-count source-node)
                                     xpa:*position* 0)
                               (setf parent-node source-node))
                              (t
                               (setf xpa:*count* 0)
                               (return)))))))
  (:method ((generator (eql 'xpa:ancestor-or-self)) source &key)
           `(let ((source-node nil)
                  (parent-node nil))
              #'(lambda ()
                  (loop (cond ((and parent-node
                                    (setf parent-node (parent parent-node)))
                               (incf xpa:*position*)
                               (setf xpa:*context-node* parent-node)
                               (return parent-node))
                              ((setf source-node (funcall ,source))
                               (setf xpa:*count* (1+ (parent-count source-node))
                                     xpa:*position* 1)
                               (setf parent-node source-node)
                               (setf xpa:*context-node* parent-node)
                               (return parent-node))
                              (t
                               (setf xpa:*count* 0)
                               (return)))))))
  (:method ((generator (eql 'xpa:attribute)) source &key)
           `(let ((source-node nil)
                  (attributes nil)
                  (attr-node nil))
              #'(lambda ()
                  (flet ((next-attributes ()
                           (loop (typecase (setf source-node (funcall ,source))
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   (elem-node
                                    (setf attributes (attributes source-node))
                                    (when attributes
                                      (setf xpa:*count* (length attributes)
                                            xpa:*position* 0)
                                      (return attributes)))
                                   (t nil)))))
                    (loop (if attributes
                            (progn (setf attr-node (pop attributes))
                                   (incf xpa:*position*)
                                   (setf xpa:*context-node* attr-node)
                                   (return attr-node))
                            (unless (next-attributes) (return))))))))
  (:method ((generator (eql 'xpa:child)) source &key)
           `(let ((source-node nil)
                  (children nil)
                  (child-node nil))
              #'(lambda ()
                  (flet ((next-children ()
                           (loop (setf source-node (funcall ,source))
                                 (typecase source-node
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   ((or elem-node doc-node ref-elem-node)
                                    (setf children (children source-node))
                                    (when children
                                      (setf xpa:*count* (length children)
                                            xpa:*position* 0)
                                      (return children)))
                                   (t nil)))))
                    (loop (if children
                            (progn (setf child-node (pop children))
                                   (incf xpa:*position*)
                                   (setf xpa:*context-node* child-node)
                                   (return child-node))
                            (unless (next-children) (return))))))))
  (:method ((generator (eql 'xpa:descendant)) source &key)
           `(let ((source-node nil)
                  (children nil)
                  (child-node nil))
              #'(lambda ()
                  (flet ((next-children ()
                           (loop (typecase (setf source-node (funcall ,source))
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   ((or abstract-elem-node doc-node)
                                    (when (setf children (children source-node))
                                      (setf xpa:*count* (length children))
                                      (return children)))
                                   (t nil))))
                         (next-descendants (&aux child-children)
                           (when (setf child-children (children child-node))
                             (incf xpa:*count* (length child-children))
                             (setf children (append child-children children)))))
                    (loop (if children
                            (progn (setf child-node (pop children))
                                   (when (is-abstract-elem-node child-node)
                                     (next-descendants))
                                   (incf xpa:*position*)
                                   (setf xpa:*context-node* child-node)
                                   (return child-node))
                            (unless (next-children) (return))))))))
  (:method ((generator (eql 'xpa:descendant-or-self)) source &key)
           `(let ((source-node nil)
                  (children nil)
                  (child-node nil))
              #'(lambda ()
                  (flet ((next-children ()
                           (loop (typecase (setf source-node (funcall ,source))
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   (abstract-elem-node
                                    (setf children
                                          (cons source-node (children source-node)))
                                    (setf xpa:*count* (length children))
                                    (return children))
                                   (doc-node
                                    ;; ignore the self-aspect for a document
                                    (when (setf children (children source-node))
                                      (setf xpa:*count* (length children))
                                      (return children)))
                                   (t nil))))
                         (next-descendants (&aux child-children)
                           (when (setf child-children (children child-node))
                             (incf xpa:*count* (length child-children))
                             (setf children (append child-children children)))))
                    (loop (if children
                            (progn (setf child-node (pop children))
                                   (when (is-abstract-elem-node child-node)
                                     (next-descendants))
                                   (incf xpa:*position*)
                                   (setf xpa:*context-node* child-node)
                                   (return child-node))
                            (unless (next-children) (return))))))))
  (:method ((generator (eql 'xpa:following)) source &key)
           "traverse forwards, depth-first, then parents; exclude initial source node"
           `(let ((source-node nil)
                  (successors nil)
                  (successor nil))
              #'(lambda ()
                  (flet ((next-successors ()
                           (loop (unless (is-abstract-elem-node source-node)
                                   (setf source-node (funcall ,source)))
                                 (typecase source-node
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   (elem-child-node
                                    (when (setf successors
                                                (following-siblings source-node))
                                      (setf xpa:*count* (length successors))
                                      (setf source-node (parent source-node))
                                      (return successors)))
                                   (t nil))))
                         (next-descendants (&aux successor-children)
                           (when (setf successor-children (children successor))
                             (incf xpa:*count* (length successor-children))
                             (setf successors (append successor-children successors)))))
                    (loop (if successors
                            (progn (setf successor (pop successors))
                                   (when (is-abstract-elem-node successor)
                                     (next-descendants))
                                   (incf xpa:*position*)
                                   (setf *context-node* successor)
                                   (return successor))
                            (unless (next-successors) (return))))))))
  (:method ((generator (eql 'xpa:following-or-self)) source &key)
           "traverse forwards, depth-first, then parents; include initial source node"
           `(let ((source-node nil)
                  (successors nil)
                  (successor nil)
                  (is-self t))
              #'(lambda ()
                  (flet ((next-successors ()
                           (loop (unless (is-abstract-elem-node source-node)
                                   (setf source-node (funcall ,source)
                                         is-self t))
                                 (typecase source-node
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   (elem-child-node
                                    (when (setf successors
                                                (following-siblings source-node))
                                      (when (shiftf is-self)
                                        (push source-node successors))
                                      (setf xpa:*count* (length successors))
                                      (setf source-node (parent source-node))
                                      (return successors)))
                                   (t nil))))
                         (next-descendants (&aux successor-children)
                           (when (setf successor-children (children successor))
                             (incf xpa:*count* (length successor-children))
                             (setf successors (append successor-children successors)))))
                    (loop (if successors
                            (progn (setf successor (pop successors))
                                   (when (is-abstract-elem-node successor)
                                     (next-descendants))
                                   (incf xpa:*position*)
                                   (setf *context-node* successor)
                                   (return successor))
                            (unless (next-successors) (return))))))))
  (:method ((generator (eql 'xpa:following-sibling)) source &key)
           "traverse forwards, siblings only; exclude initial source node"
           `(let ((source-node nil)
                  (successors nil)
                  (successor nil))
              #'(lambda ()
                  (loop (when (setf successor (pop successors))
                          (incf xpa:*position*)
                          (setf xpa:*context-node* successor)
                          (return successor))
                        (typecase (setf source-node (funcall ,source))
                          (null (setf xpa:*count* 0)
                                (return))
                          (elem-child-node
                           (setf successors (following-siblings source-node)
                                 xpa:*count* (length successors)
                                 xpa:*position* 0))
                          (t nil))))))
  (:method ((generator (eql 'xpa:id)) source &key value)
           "dereference a given id value, or use the id in the current node"
           (if value
             `(let ((source-node nil)
                    (node nil))
                #'(lambda ()
                    (loop (typecase (setf source-node (funcall ,source))
                            (null (setf xpa:*count* 0)
                                  (return))
                            ((or doc-node document-scoped-node)
                             (when (setf xpa:*context-node*
                                         (find-element-by-id source-node ',value))
                               (setf xpa:*count* 1
                                     xpa:*position* 1)
                               (return xpa:*context-node*)))
                            (t nil)))))
             `(let ((source-node nil)
                    (node nil)
                    (id-node nil))
                #'(lambda ()
                    (loop (typecase (setf source-node (funcall ,source))
                            (null
                             (return))
                            (abstract-elem-node
                             (when (and (setf id-node
                                              (find-if #'is-id-attr-node
                                                       (attributes source-node)))
                                        (setf xpa:*context-node*
                                         (find-element-by-id source-node
                                                             (value id-node))))
                               (setf xpa:*count* 1
                                     xpa:*position* 1)
                               (return xpa:*context-node*)))
                            (t nil)))))))
  (:method ((generator (eql 'xpa:key)) source &key name)
           "dereference a specified attribute value as an id"
           `(let ((source-node nil)
                  (node nil)
                  (key-node nil))
              (setf name (xpa::intern name))
              #'(lambda ()
                  (loop (typecase (setf source-node (funcall ,source))
                          (null (setf xpa:*count* 0)
                                (return))
                          (abstract-elem-node
                           (when (and (setf key-node
                                            (find ',name
                                                  (attributes source-node)
                                                  :key #'name))
                                      (setf xpa:*context-node*
                                            (find-element-by-id source-node
                                                                (value key-node))))
                             (setf xpa:*count* 1
                                   xpa:*position* 1)
                             (return xpa:*context-node*)))
                          (t nil))))))
  (:method ((generator (eql 'xpa:namespace)) source &key)
           "traverse namespace nodes"
           `(let ((source-node nil)
                  (namespaces nil)
                  (ns-node nil))
              #'(lambda ()
                  (loop (when (setf ns-node (pop namespaces))
                          (incf xpa:*position*)
                          (setf xpa:*context-node* attr-node)
                          (return ns-node))
                        (typecase (setf source-node (funcall ,source))
                          (null (return))
                          (abstract-elem-node
                           (setf namespaces (namespaces source-node)
                                 xpa:*count* (length namespaces)))
                          (t nil))))))
  (:method ((generator (eql 'xpa:parent)) source &key)
           "traverse parent nodes. which node is the 'parent' of a ref node?"
           `(let ((source-node nil)
                  (parent-node nil))
              #'(lambda ()
                  (loop (typecase (setf source-node (funcall ,source))
                          (null
                           (return))
                          (abstract-elem-node
                           (when (setf parent-node (parent source-node))
                             (setf xpa:*position* 1
                                   xpa:*count* 1
                                   xpa:*context-node* parent-node)
                             (return parent-node)))
                          (t nil))))))
  (:method ((generator (eql 'xpa:preceding)) source &key)
           `(let ((source-node nil)
                  (predecessors nil)
                  (predecessor nil))
              #'(lambda ()
                  (flet ((next-predecessors ()
                           (loop (unless (is-abstract-elem-node source-node)
                                   (setf source-node (funcall ,source)))
                                 (typecase source-node
                                   (null (setf xpa:*count* 0)
                                         (return))
                                   (elem-child-node
                                    (when (setf predecessors
                                                (preceding-siblings source-node))
                                      (setf xpa:*count* (length predecessors))
                                      (setf source-node (parent source-node))
                                      (return predecessors)))
                                   (t nil))))
                         (next-descendants (&aux predecessor-children)
                           (when (setf predecessor-children (children predecessor))
                             (incf xpa:*count* (length predecessor-children))
                             (setf predecessors (append predecessor-children predecessors)))))
                    (loop (if predecessors
                            (progn (setf predecessor (pop predecessors))
                                   (when (is-abstract-elem-node predecessor)
                                     (next-predecessors))
                                   (incf xpa:*position*)
                                   (setf *context-node* predecessor)
                                   (return predecessor))
                            (unless (next-predecessors) (return))))))))
  (:method ((generator (eql 'xpa:preceding-sibling)) source &key)
           `(let ((source-node nil)
                  (sibling nil))
              #'(lambda ()
                  (loop (when (setf sibling (pop siblings))
                          (incf xpa:*position*)
                          (setf xpa:*context-node* sibling)
                          (return sibling))
                        (typecase (setf source-node (funcall ,source))
                          (null (setf xpa:*count* 0)
                                (return))
                          (elem-child-node
                           (setf siblings (preceding-siblings source-node)
                                 xpa:*count* (length siblings)
                                 xpa:*position* 0))
                          (t nil))))))
  (:method ((generator (eql 'xpa:root)) source &key)
           `(let ((source-node nil))
              (function (lambda (&aux root)
                          (loop  (when (and source-node
                                           (typecase source-node
                                             (doc-node (setf root source-node))
                                             (document-scoped-node (setf root (document source-node)))
                                             (abstract-node nil)
                                             (t
                                              (setf root source-node))))
                                  (setf xpa:*count* 1
                                        xpa:*position* 1
                                        xpa:*context-node* root)
                                  (setf source-node nil)
                                  (return root))
                                (unless (setf source-node (funcall ,source))
                                  (setf xpa:*count* 0)
                                  (return)))))))
  (:method ((generator (eql 'xpa:self)) source &key)
           `(let ((source-node nil))
              #'(lambda ()
                  (loop (typecase (setf source-node (funcall ,source))
                          (null (setf xpa:*count* 0
                                      xpa:*position* 0)
                                (return))
                          (t 
                           (setf xpa:*position* 1
                                 xpa:*count* 1
                                 xpa:*context-node* source-node)
                           (return source-node))))))))

(defGeneric compute-child-generator (source &key)
  (:documentation
   "a child navigation step followed by a name test are implemented in a single
    operation. when applied to an element node, this is implemented with a simple
    combination of the individual steps. when applied to another clos object, it
    is implemented  with a function based on slot access. the default method computes
    a new class-specific method for the given instance and installs it in the generic
    function.")
  (:method (source  &key name)
           (setf name (xpa::intern name))
           `(let ((source-node nil)
                  (children nil)
                  (child-node nil)
                  (generator nil))
              (labels ((next-children ()
                         (loop (setf source-node (funcall ,source))
                               ; (print (list :child-generator source-node))
                               (typecase source-node
                                 (null (setf xpa:*count* 0)
                                       (return))
                                 ((or elem-node doc-node ref-elem-node)
                                  (setf children (children source-node))
                                  (when children
                                    (setf xpa:*count* (length children)
                                          xpa:*position* 0)
                                    (setf generator #'generate-element-child)
                                    (return (generate-element-child))))
                                 ;; if it is not an element, then if it is a non-dom
                                 ;; instance, then try to retrieve the named slot
                                 (abstract-node nil)
                                 (standard-object
                                  (print (list :as-clos-object source-node ',name
                                               (slot-boundp source-node ',name)))
                                  (when (slot-boundp source-node ',name)
                                    (setf child-node (slot-value source-node ',name))
                                    (typecase child-node
                                      (null)
                                      (cons (setf children child-node
                                                  xpa:*count* (length children)
                                                  xpa:*position* 0)
                                            (setf generator #'generate-clos-child)
                                            (return (generate-clos-child)))
                                      (t
                                       (setf  xpa:*count* (length children)
                                              xpa:*position* 1
                                              xpa:*context-node* child-node)
                                       (return child-node)))))
                                 (t nil))))
                       (generate-element-child ()
                         (loop (cond (children
                                      (setf child-node (pop children))
                                      (when (and (is-abstract-elem-node child-node)
                                                 ,(cond ((eq name *wild-uname*) t)
                                                        ((or (string-equal (local-part name) (local-part *wild-name*))
                                                             (eq (namespace name) *wild-namespace*))
                                                         `(xsd:validate-name (name child-node) ',name))
                                                        (t
                                                         `(eq ',name (name child-node)))))
                                        (incf xpa:*position*)
                                        (setf xpa:*context-node* child-node)
                                        (return child-node)))
                                     (t
                                      (return (next-children))))))
                       (generate-clos-child ()
                         (cond ((setf child-node (pop children))
                                (incf xpa:*position*)
                                (setf xpa:*context-node* child-node))
                               (t
                                (next-children)))))
                  (setf generator #'generate-element-child)
                  #'(lambda () (funcall generator))))))

(defGeneric compute-predicate-combination (predicate source &key)
  (:method ((predicate (eql 'xpa:comment-test)) source &key literal)
           `(function (lambda (&aux node)
                        (loop (unless (setf node (funcall ,source))
                                (return))
                              (when (and (is-comment-node node)
                                         ,@(if literal `((string= literal (value node)))))
                                (return node))))))
  (:method ((predicate (eql 'xpa:name-test)) source &key name)
           (setf name (xpa::intern name))
           `(function (lambda (&aux node)
                        (loop (unless (setf node (funcall ,source))
                                (return))
                              (when *xml-verbose* (format *trace-output* "~%name-test: ~a ~a" node ',name))
                              (when (and (or (is-abstract-elem-node node)
                                             (is-abstract-elem-property-node node))
                                         ,(cond ((eq name *wild-uname*) t)
                                                ((or (string-equal (local-part name) *wild-name*)
                                                     (eq (namespace name) *wild-namespace*))
                                                 `(xsd:validate-name (name node) ',name))
                                                (t
                                                 `(eq ',name (name node)))))
                                (return node))))))
  (:method ((predicate (eql 'xpa:@name-test)) source &key name)
           (setf name (xpa::intern name))
           `(function (lambda (&aux node)
                        (loop (unless (setf node (funcall ,source))
                                (return))
                              (when (and (is-abstract-attr-node node)
                                         ,(cond ((eq name *wild-uname*) t)
                                                ((or (string-equal (local-part name) *wild-name*)
                                                     (eq (namespace name) *wild-namespace*))
                                                 `(xsd:validate-name (name node) ',name))
                                                (t
                                                 `(eq ',name (name node)))))
                                (return node))))))
  (:method ((predicate (eql 'xpa:pi-test)) source &key target data)
           `(function (lambda (&aux node)
                        (loop (unless (setf node (funcall ,source))
                                (return))
                              (when (and (is-pi-node node)
                                         ,@(if target `((string= ,target (name node))))
                                         ,@(if data `((string= ,data (value node)))))
                                (return node))))))
  (:method ((predicate (eql 'xpa:predicate)) source &key expression
            &aux (result (gensym "RESULT-")))
           `(let ((count 0))
              (function (lambda (&aux node ,result)
                          (loop (unless (setf node (funcall ,source))
                                  (return))
                                (let ((xpa:*position* (incf count)))
                                  (when (typecase (setf ,result ,expression)
                                          (number (= (round ,result) xpa:*position*))
                                          (t ,result))
                                    (return node))))))))
  (:method ((predicate (eql 'xpa:text-test)) source &key literal)
           `(function (lambda (&aux node)
                        (loop (unless (setf node (funcall ,source))
                                (return))
                              (when (xsd:|IS-string| node ,literal)
                                (return node))))))
  (:method ((predicate (eql 'xpa:type-name-test)) source &key type name)
           (setf name (xpa::intern name))
           `(function (lambda (&aux node)
                        (loop (unless (setf node (funcall ,source))
                                (return))
                              (when (and (xsd:typep node ,type)
                                         ,(cond ((eq name *wild-uname*) t)
                                                ((or (string-equal (local-part name) *wild-name*)
                                                     (eq (namespace name) *wild-namespace*))
                                                 `(xsd:validate-name (name node) ',name))
                                                (t
                                                 `(eq ',name (name node)))))
                                (return node))))))
  (:method ((predicate (eql 'xpa:type-test)) source &key type)
           `(function (lambda (&aux node)
                          (loop (unless (setf node (funcall ,source))
                                  (return))
                                (when (xsd:typep node ,type)
                                  (return node)))))))


                        

;;
;; top-level predicates

(defun compute-predicate-function
       (predicate-keyword &rest properties)
  (let ((predicate-source (gensym "SOURCE-"))
        (test-name (gensym "TEST-"))
        (test-function nil))
    (setf test-function
          (apply #'compute-predicate-combination
                 predicate-keyword predicate-source properties))
    `(let ((,test-name ,test-function)
           (function (lambda (source)
                       (setf ,predicate-source source)
                       ,test-name))))))

(defMacro xpa::apply-predicate (predicate source)
  `(xpa::path-function ,(apply #'compute-predicate-function predicate) ,source))

;;
;; node set generation for use as a function argument

(defun xpa::path-nodes (function &aux nodes node)
  "generate the nodes from a path"
  (loop (unless (setf node (funcall function)) (return (nreverse nodes)))
        (push node nodes)))


#|

;; there are no indepedent step expressions

(defMacro xpa::apply-step (step source)
  `(xpa::combine-path
    (function ,(let ((generator (generator step))
                      (predicates (predicates step))
                      (step-function nil))
                  (setf step-function
                        (xpa::APPLY-STEP-GENERATOR generator source))
                  (dolist (predicate predicates)
                    (setf step-function
                          (xpa::COMBINE-STEP-PREDICATE predicate step-function)))
                  step-function))
    ,source))



(defun xpa::COMBINE-STEP-PREDICATE (step-predicate source)
  (let ((p-fun (step-predicate-function step-predicate))
        (test-node nil))
    #'(lambda ()
        (loop (unless (setf test-node (funcall source)) (return))
              (when (funcall p-fun test-node) (return test-node))))))

(defMacro xpa::APPLY-STEP-PREDICATE (step-predicate source)
  `(function (lambda ()
               (flet ((p-fun ,(step-predicate-lambda-expression step-predicate))
                      (s-fun ,source))
                 (let ((test-node nil))
                   (loop (unless (setf test-node (funcall s-fun))
                           (return))
                         (when (funcall p-fun test-node)
                           (return test-node))))))))

(defun xpa::COMBINE-STEP-GENERATOR (step-generator source)
  (let ((g-fun (step-generator-function step-generator))
        (source-node nil)
        (generated-node nil))
    #'(lambda ()
        (loop (when (null source-node)
                (unless (setf source-node (funcall source))
                  (return))
                (return (funcall g-fun source-node)))
              (if (setf generated-node (funcall g-fun))
                (return generated-node)
                (setf source-node nil))))))  

|#
:EOF