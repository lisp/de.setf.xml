;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  model operators for the xml query data model
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010501' AUTHOR='JAA'>
   factored out as separate file for xml parser</DELTA>
  <DELTA DATE='20010622'>*default-namespace-attribute-name* for lispowrks/pe reader</DELTA>
  <DELTA DATE='20010628'>added qnames extents</DELTA>
  <DELTA DATE='20010719'><code>CALL-WITH-NAME-PROPERTIES</code> added
   for use in alternative parsers; modified <code>PREFIX-VALUE</code> to support
   string prefixes</DELTA>
  <DELTA DATE='20010918'>corrections to <code>make-uname</code> and <code>make-ncname</code>
   to use tokenizer</DELTA>
  <DELTA DATE='20020116'>fixed stream-reader (def-internal-entity) where the incorrect type declaration
   caused problems</DELTA>
  <DELTA DATE='20010118'>added guarded code-char function</DELTA>
  <DELTA DATE"'20030320'>fixed values for constant namespace bindings;
    conditions consistent with 0.950</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")

(defun make-parse-document (&key validate &allow-other-keys &aux doc)
  "construct a provisional document for a parse."
  (setf doc (make-doc-node :general-entities (copy-definitions *general-entities*)
                           :validate validate))
  (list doc validate)
  doc)


#|pre tokenizers
(defun make-ncname (name &optional (namespace *null-namespace*)
                        &aux symbol)
  (cond ((setf symbol (find-name name namespace))
         (return-buffer-string name)
         symbol)
        (t
         (intern-name name namespace))))

(defun make-uname (namestring &key (colon-position nil)
                        (prefix *default-namespace-attribute-name* prefix-p)
                       (namespace nil namespace-p) (local-part namestring)
                       (free-p t))
  (declare (optimize (speed 3) (safety 1)))
  (flet ((intern-name-local (string namespace &optional prefix &aux symbol)
           (cond ((setf symbol (find-name string namespace))
                  (when (or free-p (not (eq string namestring)))
                    (return-buffer-string string)))
                 (t
                  (setf symbol (intern-name string namespace))))
           (when prefix (setf (prefix symbol) prefix))
           symbol)
         (intern-prefix-local (string end &aux prefix symbol)
           (setf prefix (buffer-string-subseq string 0 end))
           (cond ((setf symbol (find-prefix prefix *xmlns-namespace*))
                  (return-buffer-string prefix)
                  symbol)
                 (t
                  (intern-prefix prefix *xmlns-namespace*)))))
    (cond (xutils::|REC-xml-names-19990114|
           ;; names are encoded as universal names
           (cond (namespace-p
                  ;; always resolve the namespace in order to ensure that static references are
                  ;; replaced by dynamic clones should the context require.
                  (setf namespace (find-namespace namespace)))
                 (prefix-p
                  (unless *in-dtd*
                    (setf namespace (prefix-value prefix))))
                 ((or colon-position (setf colon-position (position #\: namestring)))
                  (setf prefix (intern-prefix-local namestring colon-position))
                  (unless *in-dtd*
                    ;; nb. if the prefix is unbound, this may return NIL
                    (setf namespace (when *namespace-bindings* (prefix-value prefix)))))
                 (t
                  (when *namespace-bindings*
                    (setf namespace (prefix-value "")))))
           (when colon-position
             (setf local-part (buffer-string-subseq namestring (1+ colon-position)))
             (when free-p (return-buffer-string namestring)))
           (cond (namespace
                  ;; if the namespace is known, then intern an universal name
                  (intern-name-local local-part namespace prefix))
                 (t
                  ;; otherwise generate an uninterned qualified name this happens
                  ;; in the DTD and when the prefix is not bound
                  (let ((name (make-qname local-part)))
                    (setf (prefix name) prefix)
                    (when *qname-extent*
                      (setf (qname-extent name) *qname-extent*))
                    name))))
          (*namespace*
           ;; when not recognizing qualified names, intern names in the default namespace, unless precluded
           (intern-name-local local-part *namespace*))
          (t
           ;; otherwise just leave them as strings
           local-part))))
|#

(defun make-ncname (name &optional (namespace *null-namespace*))
  (intern-name name namespace))

(defun make-uname (namestring &key (colon-position nil)
                              (prefix *default-namespace-attribute-name* prefix-p)
                              (namespace nil namespace-p)
                              (local-part namestring))
  ;; when limiting resourec use within the parser, the namestring has already been resourced
  ;; within the dynamically created *name-tokenizer*. thus is not to be returned. thus there need be no
  ;; initial check with find-name.
  ;; where the where a tokenizer is bound when that <prefix> : <local-part> are partitioned, they are
  ;; resourced there as well.

  (declare (optimize (speed 3) (safety 1)))
  (flet ((intern-name-local (string namespace &optional prefix &aux symbol)
           (setf symbol (intern-name string namespace))
           (when prefix (setf (prefix symbol) prefix))
           symbol)
         (intern-prefix-local (string end &aux prefix)
           (setf prefix
                 (or (tk1::get-token *name-tokenizer* string 0 end)
                     (tk1::insert-token *name-tokenizer* (subseq string 0 end) string 0 end)))
           (intern-prefix prefix *xmlns-namespace*)))
    (cond (xutils::|REC-xml-names-19990114|
           ;; names are encoded as universal names
           (cond (namespace-p
                  ;; always resolve the namespace in order to ensure that static references are
                  ;; replaced by dynamic clones should the context require.
                  (setf namespace (find-namespace namespace)))
                 (prefix-p
                  (unless *in-dtd*
                    (setf namespace (prefix-value prefix))))
                 ((or colon-position (setf colon-position (position #\: namestring)))
                  (setf prefix (intern-prefix-local namestring colon-position))
                  (unless *in-dtd*
                    ;; nb. if the prefix is unbound, this may return NIL
                    (setf namespace (when *namespace-bindings* (prefix-value prefix)))))
                 (t
                  (when *namespace-bindings*
                    (setf namespace (prefix-value "")))))
           (when colon-position
             (setf local-part
                   (or (tk1::get-token *name-tokenizer* namestring (1+ colon-position))
                       (tk1::insert-token *name-tokenizer* (subseq namestring (1+ colon-position))
                                          namestring (1+ colon-position)))))
           (cond (namespace
                  ;; if the namespace is known, then intern an universal name
                  (intern-name-local local-part namespace prefix))
                 (t
                  ;; otherwise generate an uninterned qualified name.
                  ;; this happens in the DTD and when the prefix is not bound
                  (cond ((equal namestring *xmlns-prefix-namestring*)
                         (let ((name (make-qname "")))
                           (setf (prefix name) *xmlns-prefix-namestring*)
                           (when *qname-extent*
                             (setf (qname-extent name) *qname-extent*))
                           name))
                        (t
                         (let ((name (make-qname local-part)))
                           (setf (prefix name) prefix)
                           (when *qname-extent*
                             (setf (qname-extent name) *qname-extent*))
                           name))))))
          (*namespace*
           ;; when not recognizing qualified names, intern names in the default namespace,
           ;; unless precluded by a null binding for the context
           (intern-name-local local-part *namespace*))
          (t
           ;; otherwise just leave them as strings
           local-part))))

(defun call-with-name-properties
       (function namestring &key (colon-position nil)
                 (prefix *default-namespace-attribute-name* prefix-p)
                 (namespace nil namespace-p) (local-part namestring))
  "parse the literal name and attempt to resolve prefix.
   provided as a convenience method to standardardize with
   <code>MAKE-UNAME</code>.
   presumes namespace are to be interpreted, but does _no_ interning."
  (cond (namespace-p
         (setf namespace (find-namespace namespace)))
        (prefix-p
         (unless *in-dtd*
           (setf namespace (prefix-value prefix))))
        ((or colon-position (setf colon-position (position #\: namestring)))
         (setf prefix (buffer-string-subseq namestring 0 colon-position))
         (unless *in-dtd*
           ;; nb. if the prefix is unbound, this may return NIL
           (setf namespace (when *namespace-bindings* (prefix-value prefix)))))
        (t
         (when *namespace-bindings*
           (setf namespace (prefix-value "")))))
    (setf local-part
          (if colon-position
            (buffer-string-subseq namestring (1+ colon-position))
            (buffer-string-subseq namestring 0)))
    (funcall function :namestring namestring :namespace namespace
             :colon-position colon-position :local-part local-part
             :prefix prefix))

;;
;;
;; lookup both in an a-list and a list of ns-nodes

(defGeneric find-bound-namespace (namespace context)
  (:documentation
   "this mechanism determines the prefix bound to a given namespace.")
  (:method ((ns t) (context list))
           (or (some #'(lambda (binding)
                         (etypecase binding
                           (cons
                            (when (eq (rest binding) ns) (first binding)))
                           (ns-node
                            (when (eq (namespace binding) ns) (local-part (name binding))))))
                     context)
               (cond ((eq ns *xmlns-namespace*)
                      *xmlns-namespace-attribute-name*)
                     ((eq ns *xml-namespace*)
                      *xml-namespace-attribute-name*))))
  (:method ((ns symbol) (context t))
           (find-bound-namespace (string ns) context))
  (:method ((ns string) (context t))
           ;; by this point, any dynamic namespace should have been constructed
           ;; during parsing. therefore a missing namespace is an error.
           (find-bound-namespace (find-namespace ns :if-does-not-exist :error) context))
  (:method ((ns t) (context elem-node))
           (or (find-bound-namespace ns (namespaces context))
               (find-bound-namespace ns (parent context))))
  (:method ((ns t) (context null))
           nil)
  (:method ((ns t) (context doc-node))
           (find-bound-namespace ns *namespace-bindings*)))

(defGeneric namespace-prefix (namespace &optional default)
  (:documentation
   "locate the bound prefix value for a given namespace.
    should there be no binding, signal a continuable error and permit the process to specify the
    prefix. one would expect the furnished default to be used.
    the process should bind the prefix with (setf prefix-value) to avoid repeated signals.
    the default namespace is distinguished to speed lookups.")
  (:method ((ns string) &optional default)
           (namespace-prefix (find-namespace ns :if-does-not-exist :error) default))
  (:method ((namespace t) &optional default)
           (declare (ftype (function (t &rest t) t) |NSC: Namespace Declared| xml-error))
           (or (when (or (namespace-equal namespace (default-namespace))
                         (namespace-equal namespace *null-namespace*))
                 *default-prefix-string*)
               (find-bound-namespace namespace *namespace-bindings*)
               (restart-case (|NSC: Namespace Declared| :name default
                                                        :namespace namespace)
                 (use-value (prefix)
                            (typecase prefix
                              ((or string symbol abstract-name) prefix)
                              (t
                               (xml-error 'internal-xml-error
                                          :format-control "illegal value to use-value on |NSC: Namespace Declared|: ~s: ~s."
                                          :format-arguments (list namespace prefix)))))))))
                            

(defGeneric prefix-value (prefix)
  (:method ((prefix null)) *null-namespace*)
  (:method ((prefix abstract-name)) (prefix-value (local-part prefix)))
  (:method ((prefix symbol)) (prefix-value (symbol-name prefix)))
  (:method ((prefix string))
           ;; (prefix-value (intern-prefix prefix *xmlns-namespace*))
           ;; implement string prefix independently in order to support
           ;; alternative parsers
           (or (some #'(lambda (binding)
                         (etypecase binding
                           (cons (when (string= prefix (first binding))
                                   (rest binding)))
                           (ns-node (when (string= prefix (name binding))
                                      (namespace binding)))))
                     *namespace-bindings*)
               ;; if no binding is present for the default namespace,
               ;; use the null namespace
               (cond ((equal prefix "")
                      *null-namespace*)
                     ((equal prefix *xml-prefix-namestring*)
                      *xml-namespace*)
                     ((equal prefix *xmlns-prefix-namestring*)
                      *xml-namespace*)
                     (t
                      (xml-error |NSC: Prefix Declared| :name prefix)))))
  #|(:method ((prefix symbol))
           (or (some #'(lambda (binding)
                         (etypecase binding
                           (cons
                            (when (eq (first binding) prefix)
                              (rest binding)))
                           (ns-node
                            (when (eq (name binding) prefix)
                              (namespace binding)))))
                     *namespace-bindings*)
               ;; if no binding is present for the default namespace,
               ;; use the null namespace
               (if (eq prefix *default-namespace-attribute-name*)
                 *null-namespace*
                 (xml-error |NSC: Prefix Declared| :name prefix))))|#
  (:method ((prefix function))
            (or (some #'(lambda (binding)
                         (etypecase binding
                           (cons
                            (when (funcall prefix (first binding))
                              (rest binding)))
                           (ns-node
                            (when (funcall prefix (name binding))
                              (namespace binding)))))
                     *namespace-bindings*)
                (xml-error |NSC: Prefix Declared| :name (funcall prefix nil)))))

(defGeneric (setf prefix-value) (value prefix)
  (:documentation
   "this method binds a prefix to a namespace in the current dynamic namespace context.
    the namespace must be know by this point. which should be the case, as a ns-attribute
    generates the namespace, if need be, upon instantiation.")
  (:method ((value t) (prefix null))
           (xml-error "null namespace is constant. it cannot be rebound."))
  (:method ((value t) (prefix symbol))
           (setf (prefix-value (symbol-name prefix)) value))
  (:method ((value t) (prefix xqdm::abstract-name))
           (setf (prefix-value (local-part prefix)) value))
  (:method ((value package) (prefix string))
           (push (cons prefix value) *namespace-bindings*)
           value)
  (:method ((value xqdm::nameset) (prefix string))
           (push (cons prefix value) *namespace-bindings*)
           value)
  (:method ((value xqdm::nameset-tokenizer) (prefix string))
           (push (cons prefix value) *namespace-bindings*)
           value)
  (:method ((value string) (prefix t))
           (setf (prefix-value prefix)
                 (find-namespace value :if-does-not-exist :error)))
  (:method ((value t) (prefix string))
           (xml-error "prefix value not bindable: ~s." value))
  (:method :before ((namespace t) (prefix string))
           ;; constrain constant bindings
           (let ((ns-binding (cons prefix namespace)))
             (declare (dynamic-extent ns-binding))
             (check-constraint |NSC: Prefix Immutable| ns-binding)))
  (:method :after ((namespace t) (prefix string))
           ;; where the distinguished namespaces are shadowed automatically when
           ;; a new ns-context is established, an extra check is not necessary
           ;; (distinguish-namespace namespace)
           (reconcile-namespace-binding prefix namespace)))

(defun reconcile-namespace-binding (prefix namespace)
  (when (equal prefix *default-prefix-string*)
    ;; coerce to a namespace only if it will be asserted as the default.
    ;; this permits names to be serialized even when their namespace was local
    ;; to a document
    (setf (default-namespace) namespace)))

(defun next-prefix ()
  (intern-prefix (format nil "nsp-~d" (incf *prefix-count*)) *xmlns-namespace*))

(defun make-document-namespace-bindings ()
  "construct document default namspace bindings.
   if the root element is defined, then don't override its null prefix binding."
  (if *root-def-type*
    *default-namespaces*
    (cons (cons (local-part *default-namespace-attribute-name*)
                *null-namespace*)
          *default-namespaces*)))

(defun call-with-namespace-bindings (operator bindings)
  "Call the given OPERATOR in a dynamic context which includes the additional
 namespace bindings.
 OPERATOR : (function () t)
 BINDINGS : (list (cons prefix (designator namespace)))"
  (let ((*namespace-bindings* *namespace-bindings*))
    (loop for (prefix . namespace) in bindings
          do (setf (prefix-value prefix) namespace))
    (funcall operator)))

(defmacro with-namespace-bindings (bindings &rest body)
  "Execute the body in a dynamic context which includes the additional
 namespace bindings. The bindings take the form af a let list, in which
 the prefix is not evaluated while the namespace designator is."
  (let ((op (gensym "with-namespace-bindings")))
    `(flet ((,op () ,@body))
       (declare (dynamic-extent #',op))
       (call-with-namespace-bindings #',op
                                     (list ,@(loop for (prefix namespace) in bindings
                                                   collect `(cons (quote ,prefix)
                                                                   ,namespace)))))))


;;
;;
;; manage entities


(defGeneric find-uname-binding (name context &key if-does-not-exist)
  (:documentation
   "<code>FIND-UNAME-BINDING</code> implements the generic search for entity, type, and
    notation bindings. as names are permitted <code>STRING</code>, <code>SYMBOL</code>,
    and <code>QNAME-VALUE</code> arguments. the setting for <code>*CLASS.QNAME-VALUE*</code>
    controls the domain which the parser uses to generate names.")
  (:method ((name t) (context null) &key (if-does-not-exist :error))
           (when (eq if-does-not-exist :error)
             (xml-error |WFC: Entity Declared| :name name)))
  (:method ((name null) (context t) &rest args)
           (declare (ignore args))
           (xml-error "null specified as binding name"))
  (:method ((name qname-value) (context t) &rest args)
           (apply #'find-uname-binding (value name) context args))
  (:method ((name symbol) (context cons) &rest args)
           (or (some #'(lambda (binding)
                         ;; compare with string= as the names of entities
                         ;; are ncnames
                         (typecase binding
                           (cons (when (uname-equal name (first binding))
                                   (rest binding)))
                           (hash-table (gethash name binding))
                           (abstract-def-node
                            (when (uname-equal name (name binding))
                              binding))
                           (t
                            (warn "illegitimate value among definitions: ~s."
                                  binding))))
                     context)
               (apply #'find-uname-binding name nil args)))
  (:method ((predicate function) (context cons) &rest args)
           (or (some #'(lambda (binding)
                         ;; compare with string= as the names of entities
                         ;; are ncnames
                         (typecase binding
                           (cons (when (funcall predicate (first binding))
                                   (rest binding)))
                           (hash-table (maphash #'(lambda (k v)
                                                    (when (funcall predicate k)
                                                      (return-from find-uname-binding v)))
                                                binding))
                           (abstract-def-node
                            (when (funcall predicate (name binding))
                              binding))
                           (t (warn "illegitimate value among definitions: ~s."
                                    binding))))
                     context)
               (apply #'find-uname-binding predicate nil args)))
  (:method ((name t) (context def-elem-type) &rest args)
           (apply #'find-uname-binding name (properties context) args))
  (:method ((name symbol) (context hash-table) &rest args)
           (or (gethash name context)
               (apply #'find-uname-binding name nil args))))




#|
;; the replacement happens in the tokenizer and uses the children slot
;; directly. this wrapper is not used

(defun general-entity-value (name &key (if-does-not-exist nil) &aux value)
  (when (setf value
              (find-def-general-entity name :if-does-not-exist if-does-not-exist))
    (children value)))

(defun parameter-entity-value (name &key (if-does-not-exist nil) &aux value)
  (when (setf value (find-ncname-binding name *parameter-entities*
                                         :if-does-not-exist if-does-not-exist))
    (value-string value)))
|#

(defMethod copy-definitions ((defs list) &aux (table (make-hash-table)))
  (dolist (def defs)
    (setf (gethash (name def) table) def))
  table)

(defMethod copy-definitions ((defs hash-table) &aux (table (make-hash-table)))
  (maphash #'(lambda (key def) (setf (gethash key table) def)) defs)
  table)

;;
;;
;;

(defMethod stream-position ((node def-entity) &optional new)
  (declare (ignore new))
  ;; when the entity is acting as the input source, then calling the reader with a keyword
  ;; value yields the offset
  (when (eq node *input-source*) (funcall *input-reader* :position)))

(defMethod stream-reader ((datum string))
  (stream-reader (map 'list #'char-code datum)))

(defMethod stream-reader ((list list) &aux (position 0))
  #'(lambda (arg)
      (cond (arg position)
            (list (setf arg (first list) list (rest list) position (+ position 1))
                  arg))))

(defMethod stream-reader ((entity def-internal-entity))
  (let ((pad? (and (is-def-parameter-entity entity) (not (in-literal?))))
        (input (children entity))
        (position 0))
    (declare (type fixnum position) (type list input) (optimize (speed 3) (safety 0)))
    (when pad? (push #.(char-code #\space) input))
    #'(lambda (arg)
        (cond (arg (case arg
                     (:position position)
                     (:input input)
                     (:children (children entity))
                     (:entity entity)))
              (input (setf arg (first input) input (rest input) position (+ position 1))
                     arg)
              (pad?
               (setf pad? nil)
               #.(char-code #\space))))))

(defMethod stream-reader ((entity def-external-parameter-entity) &aux vector)
  (with-slots (value) entity
    (unless value
      (setf vector (handler-case (read-external-entity-data entity)
                    (error (error)
                           (|WFC: External Parsed Entity|
                            :system-id (system-id entity)
                            :public-id (public-id entity) :datum error)
                           (make-array 0)))
            value (make-instance 'vector-input-stream :vector vector)))
    (stream-reader value)))


;;
;;
;; input token construction

(if xutils::|REC-xml-19980210.End-of-Line Handling|
  (if xutils::|NOTE-newline-200101314|
    (defun eol-normalize-input (byte &aux next-byte)
      (declare (optimize (speed 3) (safety 0))
               (type fixnum byte)
               (type fixnum code line column)
               ;; won't inline
               ;(inline xml-initial-eolchar? xml-successor-eolchar?)
               (inline =))
               
      (cond ((xml-initial-eolchar? byte)
             (when (= byte #x0d)
               (when (and (setf next-byte (get-next-input))
                          (not (xml-successor-eolchar? next-byte)))
                 (unget-input next-byte)
                 (replace-input byte))
               (setf byte #x0a))
             (setf *input-column* 1)
             (incf *input-line*))
            ((not (xml-char? byte))
             (xml-error |WFC: Legal Character|
                        :name (ignore-errors (code-char byte))
                        :code byte)))
      byte)
    (defun eol-normalize-input  (byte &aux next-byte)
      (declare (optimize (speed 3) (safety 0))
               (type fixnum byte)
               (type fixnum code lin column)
               (inline =))
       (cond ((xml-initial-eolchar? byte)
              (when (= byte #x0d)
                (when (and (setf next-byte (get-next-input))
                           (/= next-byte #x0a))
                  (unget-input next-byte)
                  (replace-input byte))
                (setf byte #x0a))
              (setf *input-column* 1)
              (incf *input-line*))
             ((not (xml-char? byte))
             (xml-error |WFC: Legal Character|
                        :name (ignore-errors (code-char byte))
                        :code byte)))
      byte))
  (defun eol-normalize-input  (byte)
    (cond ((xml-initial-eolchar? byte)
           (setf *input-column* 1)
           (incf *input-line*))
          ((not (xml-char? byte))
             (xml-error |WFC: Legal Character|
                        :name (ignore-errors (code-char byte))
                        :code byte)))
    byte))

(defun get-input ()
  ; (typecase *input-datum* (integer (print (code-char *input-datum*))) (t (print *input-datum*)))
  *input-datum*)

(defun unget-input (datum)
  (when *reinput-datum*
    (error "multiple unread data: ~s, ~s." *reinput-datum* datum))
  ;; (format *trace-output* "[<-~s]" datum)
  (setf *reinput-datum* datum))

(defun get-next-input ()
  (when (advance-input) (get-input)))

(defun get-next-input-no-eof ()
  (advance-input-no-eof) (get-input))

(defun advance-input ()
  (declare (type fixnum *input-column*)
           (type (function (t) t) *input-reader*)
           (optimize (speed 3) (safety 0)))
  (cond (*reinput-datum*
         (shiftf *input-datum* *reinput-datum* nil))
        ((typep (setf *input-datum* (funcall *input-reader* *input-reader-arg*)) 'fixnum)
         (incf *input-column*)
         *input-datum*)
        ((pop-input-source)
         (advance-input)
         (get-input))
        (t
         (setf *input-eof* t)
         nil)))
    
(defun advance-input-no-eof ()
  (or (advance-input)
      (xml-eof-error :stream *input-source*)))

(defun replace-input (replacement-value)
  (setf *input-datum* replacement-value))

(defun pop-input-source ()
  (finish-input-source *input-source*)
  (when (> *literal-entity-level* 0) (decf *literal-entity-level*))
  (unless (<= (fill-pointer *input-source-stack*) 0)
    (setf *input-line* (vector-pop *input-source-stack*)
          *input-column* (vector-pop *input-source-stack*)
          *input-reader-arg* (vector-pop *input-source-stack*)
          *input-reader* (vector-pop *input-source-stack*)
          *input-source* (vector-pop *input-source-stack*))))

(defun push-input-source (source)
  (when *input-source*
    (vector-push-extend *input-source* *input-source-stack*)
    (vector-push-extend *input-reader* *input-source-stack*)
    (vector-push-extend *input-reader-arg* *input-source-stack*)
    (vector-push-extend *input-column* *input-source-stack*)
    (vector-push-extend *input-line* *input-source-stack*))
  (when (find source *input-source-stack*)
    (xml-error |WFC: No Recursion| :entity source))
  (multiple-value-setq (*input-reader* *input-reader-arg*)
    (stream-reader source))
  (when (in-literal?) (incf *literal-entity-level*))
  (setf *input-line* 1
        *input-column* 1
        *input-source* source))

(defMethod finish-input-source ((source t)) source)

(defun input-stack (&aux frames)
  ;; extract the frames from the source stack
  (when *input-source-stack*
    (do ((ptr 0 (+ ptr 5))) ((>= ptr (fill-pointer *input-source-stack*)))
      (push (list :source (aref *input-source-stack* ptr)
                  :position (stream-position (aref *input-source-stack* ptr))
                  :column (aref *input-source-stack* (+ ptr 3))
                  :line (aref *input-source-stack* (+ ptr 4)))
            frames))
    frames))

(defun extend-token (byte)
  ;(break "~s ~s ~s" byte (ring-subseq *token-start* 10) (ring-subseq *token-fill* 5))
  ;; (when (= byte 13) (break))
  (setf (first *token-fill*) byte
        *token-end* *token-fill*
        *token-fill* (or (rest *token-fill*)
                         (setf (rest *token-fill*) (cons nil nil)))
        *token-length* (1+ *token-length*)))

(defun make-token-string ()
  (when *token-end*
    (cond #|((eq *atn-term?* '|IgnoreCData|)
           (setf *token-length* 0
                 *token-end* nil
                 *token-fill* *token-start*)
           "IgnoreCData")|#
          (t
           (let ((result (get-buffer-string *token-length*))
                 (buffer *token-start*))
             (declare (type cons token)
                      (type fixnum *token-length*)
                      (type simple-string result)
                      (optimize (speed 3) (safety 0)))
             (dotimes (i *token-length*)
               (setf (schar result i) (checked-code-char (first buffer))
                     buffer (rest buffer)))
             (setf *token-length* 0
                   *token-end* nil
                   *token-fill* *token-start*)
             result)))))

(defun peek-token-string (&aux byte)
  (when (> *token-length* 0)
    (let ((result (make-string *token-length* :element-type 'character))
          (buffer *token-start*))
      (dotimes (i *token-length*)
        (setf (schar result i)
              (if (<-char-code-limit (setf byte (first buffer)))
                (code-char byte) #.(code-char 255))
              buffer (rest buffer)))
      result)))

(defun make-token-list ()
  (declare (type cons *token-end* *token-fill* *token-start*)
           (optimize (speed 3) (safety 0)))
  (when *token-end*
    (let ((result *token-start*))
      (setf (rest *token-end*) nil
            *token-length* 0
            *token-end* nil
            *token-start* *token-fill*)
      result)))

(defun make-token-name ()
  (let ((length *token-length*)
        (string (make-token-string))
        (mask #b11111111))
    (multiple-value-bind (name is-newly-interned)
                         (tk1::%tokenize *name-tokenizer* mask string 0 length)
      (unless is-newly-interned
        (return-buffer-string string))
      name)))

(defun make-token ()
  (if (in-entity-value?)
    (make-token-list)
    (if (in-name-token?)
      (make-token-name)
      (make-token-string))))

(defun make-xml-tokenizer ()
  (tk1::create-tokenizer "xml-parser-tokens" :function #'subseq :test #'string=))
;(make-xml-tokenizer)


(setq *name-tokenizer* (make-xml-tokenizer))

;;
;; names are used for entity and character references

(defun extend-name (byte)
  (setf (first *name-fill*) byte
        *name-fill* (or (rest *name-fill*)
                         (setf (rest *name-fill*) (cons nil nil)))
        *name-length* (1+ *name-length*)))

(defun make-name-string ()
  (unless (eq *name-fill* *name-start*)
    (let ((result (get-buffer-string *name-length*))
          (buffer *name-start*))
      (declare (type cons token)
               (type fixnum *name-length*)
               (type simple-string result)
               (optimize (speed 3) (safety 0)))
      (dotimes (i *name-length*)
        (setf (schar result i) (checked-code-char (first buffer))
              buffer (rest buffer)))
      (setf *name-length* 0
            *name-fill* *name-start*)
      result)))



#|
(defparameter *test*
   (sxml-element 'test
               "asdf" (sxml-element 'test2 "qwer" "<>")))

(print-element *test* *standard-output*)
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
