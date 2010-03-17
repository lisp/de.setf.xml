;;
;; how to collect the values of specific attributes

(in-package :web-user)

<h2>CL-XML: How To: Access Document Components: Modular Path Methods</h2>
<p>20031024  <br/>
<a href="mailto:James.Anderson@setf.de">james anderson</a> (c)2003, </p>

<table border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
   <td align="center">
    [<a href="./load.html">loading</a>]
    [<a href="./parse.html">parsing</a>]
    [<a href="./functional-accessors.html">accessor functions</a>]
    [<a href="./path-accessors.html">paths</a>]
    [<a href="#CombinedMethods">combinations</a>]
    [<a href="./transformations.html">transformations</a>]
    <a name="TOP"></a></td></tr>
  <tr>
   this note describes how to use generic functions and the xml-path compiler to define reusable methods for operating on document components by name and/or location.
   </tr>
  </table>

<a name='CombinedMethods'><hr /></a>
<h2>Combined Methods</h2>
(defVar *dm* (parse-document #p"xml:documentation;howto;howto.xml"))

<p>
an application often needs to express combinations of operations on related sets of components which are derived from a given base document. for these purposes, the elementary accessor definitions described in the note on <a href="./path-accessors">path accessors</a> are too primitive.
this note demonstrates how to define functions which can be combined and reused flexibly.</p>
<p>
the basic approach is shared with elementary accessors. that is, a path expressions is translated in to an iterator function which can be applied to a source to generate the matching nodes.
in order that the results can be combined and reused, an alternative interface to the path compiler is demonstrated in to form of two generic functions, <code>all</code> and <code>each</code>, and two iteration forms are demonstrated <code>forall</code> and <code>foreach</code> which combine to express complex operatons in simple terms.</p>

(defGeneric all (source path-collector consumer)
  (:documentation "
transform a path expression into a collector function and support various modes
of operation with that function. the general method for string path designators
compiles the path expression and delegates to the methods for a functional collector.
these methods distinguish various source types - nodes, nodes sets, generator
functions and a null source, as well as two consumer types - a function or null,
and generate either combinators or the collected node set depending on which
argument combination is provided.   
")
  (:method ((source t) (path-expression string) (consumer t))
           "compile the path expression and delegate to the all method for a path iterator"
           (multiple-value-bind (result index complete)
                                (xpath-parser path-expression)
             (cond (complete (all source (eval result) consumer))
                   (t
                    (warn "incomplete parse of xpath expression (@~s): ~s" index path-expression)
                    nil))))
  (:method ((node-or-node-set t) (iterator function) (consumer null))
           "given a null consumer, return a function which accepts its own consumer and
            which generates all matching nodes from the the original source"
           #'(lambda (deferred-consumer)
               (all node-or-node-set iterator deferred-consumer)))
  (:method ((node null) (iterator function) (consumer null))
           "given a null source and consumer, return a function which generates all matching
            nodes given its own argument node or node-set and consumer"
           #'(lambda (deferred-node-or-set deferred-consumer)
               (all deferred-node-or-set iterator deferred-consumer)))
  (:method ((node elem-property-node) (iterator function) (consumer function))
           "call the given consumer with the collected matching nodes
           for the given iterator and source property node"
           (funcall consumer (call-with-collector (funcall iterator node))))
  (:method ((node elem-node) (iterator function) (consumer function))
           "call the given consumer with the collected matching nodes
            for the given iterator and source element node"
           (funcall consumer (call-with-collector (funcall iterator node))))
  (:method ((node doc-node) (iterator function) (consumer function))
           "call the given consumer with the collected matching nodes
            for the given iterator and source document"
           (funcall consumer (call-with-collector (funcall iterator node))))
  (:method ((node-set list) (iterator function) (consumer function))
           "call the given consumer with the collected matching nodes
            for the given iterator and source node-set"
           (let ((set-collection nil))
             (flet ((collector (node-collection)
                      (setf set-collection (append set-collection node-collection))))
               (declare (dynamic-extent collector))
               (dolist (node node-set) (all node iterator #'collector))
               (funcall consumer set-collection))))
  (:method ((node-set-generator function) (iterator function) (consumer function))
           "call the given consumer with the collected matching nodes
            for the given iterator and a generated set of source nodes"
           (let ((set-collection nil))
             (flet ((collector (node-collection)
                      (setf set-collection (append set-collection node-collection))))
               (declare (dynamic-extent collector))
               (flet ((walker (node) (all node iterator #'collector)))
                 (declare (dynamic-extent #'walker))
                 (map-nodes #'walker node-set-generator))))))
           
(defGeneric each (node path-iterator consumer)
  (:documentation "
transform a path expression into an iterator function and support various
modes of operation with that function. the general method for string path
designators compiles the path expression and delegates to the methods for
a functional iterator. these methods distinguish various source types -
nodes, nodes sets, generator functions and a null source, as well as two
consumer types - a function or null, and generate either combinators or
iterate over the node set depending on which argument combination is provided.   
")
  (:method ((node t) (path-expression string) (consumer t))
           "compile the path expression and delegate to the each method for a path iterator"
           (multiple-value-bind (result index complete)
                                (xpath-parser path-expression)
             (cond (complete (each node (eval result) consumer))
                   (t
                    (warn "incomplete parse of xpath expression (@~s): ~s" index path-expression)
                    nil))))
  (:method ((node t) (iterator function) (consumer null))
           #'(lambda (deferred-consumer)
               (map-nodes deferred-consumer (funcall iterator  node))))
  (:method ((node t) (iterator function) (consumer (eql t)))
           (funcall iterator  node))
  (:method ((node null) (iterator function) (consumer null))
           #'(lambda (deferred-node-or-set deferred-consumer)
               (map-nodes deferred-consumer (funcall iterator  deferred-node-or-set))))
  (:method ((node elem-property-node) (iterator function) (consumer function))
           (map-nodes consumer (funcall iterator  node)))
  (:method ((node elem-node) (iterator function) (consumer function))
           (map-nodes consumer (funcall iterator  node)))
  (:method ((node doc-node) (iterator function) (consumer function))
           (map-nodes consumer (funcall iterator  node)))
  (:method ((node-set list) (iterator function) (consumer function))
           (dolist (node node-set) (each node iterator consumer)))
  (:method ((node-set-generator function) (iterator function) (consumer function))
           (flet ((walker (node) (each node iterator consumer)))
             (declare (dynamic-extent #'walker))
             (map-nodes #'walker node-set-generator))))

(defMacro with-collector ((collector) &rest body
                          &aux (head (gensym)) (tail (gensym)))
  `(let* ((,head (list nil)) (,tail ,head))
     (flet ((,collector (node) (unless (member node ,head)
                                 (setf (rest ,tail) (list node)
                                       ,tail (rest ,tail)))))
       ,@body)
     (rest ,head)))

<div>
these could be used directly with the <a href='./howto.xml'><i>howto</i></a> document to extract all nodes which  match a path and to iterate over those nodes.</div>

(all *dm* "//@upc" #'(lambda (nodes) (mapcar #'value nodes)))
<div>
== <code><pre>("123456789" "445322344" "485672034" "132957764")</pre></code>
or</div>

(with-collector (collect) (each *dm* "//@upc" #'(lambda (node) (collect (value node)))))
<div>
== <code><pre>("123456789" "445322344" "485672034" "132957764")</pre></code></div>

<a name='PathForms'><hr /></a>
<h2>Path Forms</h2>

<p>
in order to combine selection operations, one can simply combine functions like <code>all</code> and <code>each</code>.</p>


(with-collector (collect)
  (each *dm* "//item"
        #'(lambda (item)
            (each item "./@upc" 
                  #'(lambda (upc)
                      (each item "./name"
                            #'(lambda (name)
                                (collect (cons (value-string name) (value upc))))))))))
<div>
== <code>(("Invisibility Cream" . "123456789") ("Levitation Salve" . "445322344") ("Blork and Freen Instameal" . "485672034") ("Grob winglets" . "132957764"))</code><br />
as this approach can prove unwieldy when combining selection and construction operations, it may be better,
as an alternative, to define forms which interleave iteration and construction.</div>

(defMacro foreach (bindings &rest body)
  (let ((iterator-vars (mapcar #'(lambda (binding) (declare (ignore binding)) (gensym "I-")) bindings)))
    `(let ,(mapcar #'(lambda (i-var binding) (destructuring-bind (n-var path source) binding
                                               (declare (ignore n-var))
                                               `(,i-var ,(if (stringp path)
                                                           `(,(translate-xpath-accessor path) ,source)
                                                           `(each ,source ,path t)))))
                   iterator-vars bindings)
       (do ,(mapcar #'(lambda (i-var binding) (destructuring-bind (n-var path source) binding
                                                (declare (ignore path source))
                                                `(,n-var (funcall ,i-var) (funcall ,i-var))))
                    iterator-vars bindings)
            ((not (and ,@(mapcar #'first bindings))))
           ,@body))))

<div>
this approach can be be applied both for static paths ...</div>

(with-collector (collect)
 (foreach ((item "//item" *dm*))
   (foreach ((upc "./@upc" item) (name "./name" item))
     (collect (cons (value-string name) (value upc))))))
<div>
== <code>(("Invisibility Cream" . "123456789") ("Levitation Salve" . "445322344") ("Blork and Freen Instameal" . "485672034") ("Grob winglets" . "132957764"))</code><br />

and for dynamic path values </div>

(defun document-items (document attribute-path)
  (with-collector (collect)
    (foreach ((item "//item" document))
             (foreach ((upc attribute-path item) (name "./name" item))
                      (collect (cons (value-string name) (value upc)))))))

(document-items *dm* "./@upc")
<div>
== <code>(("Invisibility Cream" . "123456789") ("Levitation Salve" . "445322344") ("Blork and Freen Instameal" . "485672034") ("Grob winglets" . "132957764"))</code></div>

(document-items *dm* "./@stock")
<div>
== <code>(("Invisibility Cream" . "12") ("Levitation Salve" . "18") ("Blork and Freen Instameal" . "653") ("Grob winglets" . "44"))</code></div>

:eof
