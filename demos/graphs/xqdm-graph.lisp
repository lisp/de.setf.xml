;;; -*- Package: ("XML-QUERY-DATA-MODEL") -*-
;;;

#|
<DOCUMENTATION>
 <DESCRIPTION>
  type and instance graphs via serialization to dot format.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010324' AUTHOR='JAA'>
   new</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-QUERY-DATA-MODEL")


(defParameter *node-graph-cache* nil)
(defParameter *eol*
  (make-array 2 :element-type 'character
              :initial-contents '(#\return #\linefeed))
  "network-standard eol sequence for use with .dot files. otherwise windows
   interpreters can't parse them.")

(defGeneric write-node-graph (node stream)
  (:method (node (pathname pathname))
           (with-open-file (stream pathname :direction :output
                                   :if-exists :supersede
                                   :if-does-not-exist :create)
             (write-node-graph node stream)))
  (:method (node (pathname string))
           (write-node-graph node (pathname pathname)))
  (:method (node (*standard-output* stream))
           (let ((*node-graph-cache* (make-hash-table)))
             (format *standard-output* "~a~a ~a {"
                     *eol* "digraph" (name node))
             (encode-node-graph node)
             (format *standard-output* "~a }~a" *eol* *eol*))))

(defGeneric encode-node-graph (node)
  (:documentation
   "write .dot form for a node to <code>*standard-output*</code>.
    where the node is a type definition, the content models are
    graphed recursively. where the node is an instance, the instance
    graph is generated using generated names."))

(defGeneric node-graph-properties (node)
  (:documentation
   "where properties are to be ascribed to a specific node,
    specialize the function to generate them as an p-list.")
  (:method ((node t)) nil))

(defGeneric node-link-properties (node1 node2)
  (:documentation
   "where properties are to be ascribed to links between specific nodes,
    specialize the function to generate them as an p-list.")
  (:method ((node1 t) (node2 t)) nil))

(defun encode-node-string (string &aux char)
  ;; write out the string with returns and quotes escaped
  (dotimes (i (length string))
    (case (setf char (char string i))
      (#.(code-char #x0A) (write-string "\\n" *standard-output*))
      (#\" (write-string "\\\"" *standard-output*))
      (t (write-char char *standard-output*)))))

(defMethod encode-node-graph ((node doc-node) &aux c-id)
  (format *standard-output* "~a  \"~a\" ~@[[~{~a=\"~a\"~^,~}]~];"
          *eol* (name node) (node-graph-properties node))
  (dolist (c (children node))
    (when (setf c-id (encode-node-graph c))
      (format *standard-output*
                   "~a  \"~a\" -> \"~a\" ~@[[~{~a=\"~a\"~^,~}]~];"
                   *eol* (name node) c-id (node-link-properties node c)))))

(defMethod encode-node-graph ((node elem-node) &aux cache-entry id props c-id)
  (flet ((format-node (name properties)
           (format *standard-output* "~a  \"~a\" ~@[[~{~a=\"~a\"~^,~}]~];"
                   *eol* name properties))
         (format-link (from to properties)
           (format *standard-output*
                   "~a  \"~a\" -> \"~a\" ~@[[~{~a=\"~a\"~^, ~}]~];"
                   *eol* from to properties)))
    ;; instance graphs should, of themselves, be acyclic, but prepare
    ;; for tracing id links.
    (cond ((setf cache-entry (gethash node *node-graph-cache*))
           (setf id (second cache-entry))
           (format-node id (third cache-entry))
           id)
          (t ;generate new node and recurse
           (setf id (gensym (concatenate 'string (string (name node)) "-"))
                 props (node-graph-properties node))
           (setf (gethash node *node-graph-cache*) (list node id props))
           (format-node id props)
           (dolist (c (namespaces node))
             (when (setf c-id (encode-node-graph c))
               (format-link id c-id (node-link-properties node c))))
           (dolist (c (attributes node))
             (when (setf c-id (encode-node-graph c))
               (format-link id c-id (node-link-properties node c))))
           (dolist (c (children node))
             (when (setf c-id (encode-node-graph c))
               (format-link id c-id (node-link-properties node c))))
           id))))

(defMethod encode-node-graph ((node elem-property-node) &aux name id)
  (setf name (name node))
  (when (eq name *default-namespace-attribute-name*)
    (setf name "xmlns"))
  (setf id (gensym (concatenate 'string (string name) "-")))
  (format *standard-output* "~a  \"~a\" [label=\"~a='" *eol* id name)
  (map nil #'encode-node-string (children node))
  (format *standard-output* "'\"~@[~{,~a=\"~a\"~}~]];" (node-graph-properties node))
  id)

(defMethod encode-node-graph ((node string) &aux id)
  (setf id (gensym "STRING-"))
  (format *standard-output* "~a  \"~a\" [label=\"'" *eol* id)
  (encode-node-string node)
  (format *standard-output* "'\"~@[~{,~a=\"~a\"~}~]];" (node-graph-properties node))
  id)

(defMethod encode-node-graph ((node comment-node) &aux id)
  (setf id (gensym "COMMENT-"))
  (format *standard-output* "~a  \"~a\" [label=\"'" *eol* id)
  (map nil #'encode-node-string (children node))
  (format *standard-output* "'\"~@[~{,~a=\"~a\"~}~]];" (node-graph-properties node))
  id)

(defMethod encode-node-graph ((node pi-node) &aux id)
  (setf id (gensym "PI-"))
  (format *standard-output* "~a  \"~a\" [label=\"~a: '" *eol* id (target node))
  (map nil #'encode-node-string (children node))
  (format *standard-output* "'\"~@[~{,~a=\"~a\"~}~]];" (node-graph-properties node))
  id)

(defMethod encode-node-graph ((node def-type) &aux cache-entry id props c-def)
  (flet ((format-node (name properties)
           (format *standard-output* "~a  \"~a\" ~@[[~{~a=\"~a\"~^,~}]~];"
                   *eol* name properties))
         (format-link (from to properties)
           (format *standard-output*
                   "~a  \"~a\" -> \"~a\" ~@[[~{~a=\"~a\"~^,~}]~];"
                   *eol* from to properties)))
    ;; instance graphs should, of themselves, be acyclic, but prepare
    ;; for tracing id links.
    (cond ((setf cache-entry (gethash node *node-graph-cache*))
           (setf id (second cache-entry))
           ; (format-node id (third cache-entry))
           id)
          (t ;generate new node and recurse
           (setf id (name node)
                 props (node-graph-properties node))
           (setf (gethash node *node-graph-cache*) (list node id props))
           (format-node id props)
           ;; the q-name contexts has already resolved the successors, but that
           ;; is the closure. this expression required the immediate successors
           ;; only.
           (dolist (c-id
                    (collect-model-names (first (bnfp::bnf-rhs (model node)))))
             (cond ((eq c-id '|xml|:|()|)
                    c-id)
                   ((eq c-id '|xml|:|*|)
                    (unless (gethash '|xml|:|ANY| *node-graph-cache*)
                      (setf props (node-graph-properties '|xml|:|ANY|))
                      (setf (gethash node *node-graph-cache*)
                            (list c-id c-id props))
                      (format-node c-id props))
                    (format-link id c-id (node-link-properties node c-id)))
                   ((setf c-def (find-def-type c-id (document node)))
                    (encode-node-graph c-def)
                    (format-link id c-id (node-link-properties node c-def)))
                   
                   (t
                    (warn "definition not found: ~a: ~a." node c-id))))
           id))))


           
:EOF
