;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  print methods for xml data models
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010305' AUTHOR='JAA'/>
  <DELTA DATE='20010511' AUTHOR='JAA'>
   separate <code>WRITE-NODE</code> and <code>ENCODE-NODE</code> functions.
   the first acts as the interface and takes a stream arg. the second is
   internal and expects bindings for the writer function.
   </DELTA>
  <DELTA DATE='20010603'>
   corrected (encode-node symbol) to permit uninterned names -> no prefix;
   bind *document* in (write-node doc-node) for consistency parse/serialize.
   </DELTA>
  <DELTA DATE='20010621'>
   fixed spacing in attribute declarations<br />
   fixed encoding printing for doc-node</DELTA>
  <DELTA DATE='20010621'>WITH-XML-WRITER macro</DELTA>
  <DELTA DATE='20010623'>encode-node for doc-node takes a default doctype
   name from the root element</DELTA>
  <DELTA DATE='20010625'>
   adjustments to encode-node for <code>*-model</code> for PCDATA
   <br />
   *node-cache* to support recursive <code>DEF-NODE</code> printing, which
   makes it possible to effect prefixes analogous to those used in the
   document entity.</DELTA>
  <DELTA DATE='20010626'>
   changed respective <code>WRITE-NODE</code> and <code>ENCODE-NODE</code>
   to specialize on <code>ABSTRACT-ELEM-NODE</code> rather than on
   <code>ELEM-NODE</code> in order to support specialized instantiation.
   <code>ENCODE-NODE</code> now relies on the interface rather than the
   presence of slots.
   </DELTA>
  <DELTA DATE='20010707'>reified <code>ENCODE-NEWLINE</code></DELTA>
  <DELTA DATE='20010803'>
   introduced uniform -interface specializers document, element, and property
   nodes</DELTA>
  <DELTA DATE='20010906'>modified <code>ENCODE-NODE</code> for name instances</DELTA>
  <DELTA DATE='20010910'>fix to encode node for default namespace names</DELTA>
  <DELTA DATE='20011010'>use <code>ephemeral</code> property to control printing</DELTA>
  <DELTA DATE='20011219'>*generated-ns-bindings*as a special binding with
   a single global handler</DELTA>
  <DELTA DATE='20011223'><code>writer-stream</code></DELTA>
  <DELTA DATE='20020112'>(ecode-node symbol) delegates keywords to the
   string method</DELTA>
  <DELTA DATE='20020118'>some CormanLisp</DELTA>
  <DELTA DATE='20030320'>with-output-encoding changed to accept keyword options;
   correction for generated namespace declarations in element definitions </DELTA>
  <DELTA DATE='20030323'>correct default serialization for attribute definitions</DELTA>
  <DELTA DATE='20030531'>corrected encode-generated-ns-bindings for string prefixes</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20031023'>enabled prefix hint in preference to namespace nickname</DELTA>
  <DELTA DATE='20040125'>fixed 20031023 to use the node rather than the name and
   to guard for unbound prefix</DELTA>
  <DELTA DATE='20040202'>lw-4.3-pc required a definition for stream-read-char(writer-stream)</DELTA>
  <DELTA DATE='20040210'>lw-4.3.6-pc required a direction slot declaration for xml-writer when
  loading fasl files</DELTA>
  <DELTA DATE='20041015' AUTHOR='janderson'>changed with-xml-printer macro to pass
  rest args through</DELTA>
  <DELTA DATE='20041024' AUTHOR='janderson'>added excl:stream-terpri</DELTA>
  <DELTA DATE='20041114' AUTHOR='janderson'>added encode-node (function)</DELTA>
  <DELTA DATE='20050703' AUTHOR='janderson'>added quote escape to attribute values. (?!)</DELTA>
  <DELTA DATE='20051025' AUTHOR=`janderson'>added allegro character operators to writer streams</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :xml-parser)

;;; for debugging - iff no namespaces to be generated...
;;; (setq *writer-function #'(lambda (arg c) (declare (ignore arg)) (write-char c *trace-output*)))
;;
;;
;; interface functions

#|
(defMacro with-xml-writer ((stream &optional (encoding :utf-8)) &rest body)
  "execute the body in a context appropriate to encode xml to the
   provided stream."
  `(multiple-value-bind (*writer-function *writer-arg)
                        (encoding-stream-writer ,stream ,encoding)
     (let ((*namespace-bindings* *default-namespaces*))
       (handler-bind ((|NSC: Prefix Declared|
                       #'(lambda (condition &aux (prefix (next-prefix))
                                            node)
                           (setf node (cons prefix (name condition)))
                           (push node *namespace-bindings*)
                           (push node *generated-ns-bindings*)
                           (use-value prefix))))
         ,@body))))
|#

(defparameter *encode-xml-declaration* t)
(defparameter *encode-document-type* t)
(defparameter *attribute-value-delimiter* #\')

(defparameter *attribute-value-quote-entities*
  '((#\< . "&lt;")
    (#\" . "&#34;")
    (#\& . "&amp;"))
  "The character->entity map to apply for attribute values when delimited by quotes.")

(defparameter *attribute-value-apostrophe-entities*
  '((#\< . "&lt;")
    (#\' . "&#39;")
    (#\& . "&amp;"))
  "The character->entity map to apply for attribute values when delimited by apostrophes.")

(defparameter *character-data-entities*
  '((#\< . "&lt;")
    (#\& . "&amp;"))
  "The character->entity map to apply for character data.")


(defun call-with-xml-writer (function *xml-output*
                                      &key (encoding *output-encoding*)
                                      ((:pretty *print-pretty*) *print-pretty*)
                                      ((:xml-declaration *encode-xml-declaration*)
                                       *encode-xml-declaration*)
                                      ((:document-type *encode-document-type*)
                                       *encode-document-type*)
                                      ; namespace-bindings
                                      &allow-other-keys)
  "execute the body in a context appropriate to encode xml to the provided stream.
   this includes *default-namespaces* as the initial value for
   *namespace-bindings* and a null *xml-writer-node-cache*."
  (multiple-value-bind (*writer-function *writer-arg *output-encoding*)
                       (encoding-stream-writer *xml-output* encoding)
    (let ((*namespace-bindings* *default-namespaces*))
      (handler-bind ((|NSC: Namespace Declared|
                      ;; this condition is signaled where a namespace is not bound, and thus
                      ;; therefore no prefix is apparent for serialization.
                      ;; if a preference is provided, this is tested to see if some other
                      ;; namespace is already bound to it.
                      ;; if the prefix is already in use, or if no prefix hint was provided,
                      ;; then the 'next' one is generated. the "" prefix is handled by leaving it up to
                      ;; prefix-namespace to observe whether default namespace bindings are visible
                      ;; or not.
                      #'(lambda (condition)
                          (let ((namespace (condition-namespace condition))
                                (name (condition-name condition)))
                            ;; if a suggestion for prefix
                            (when *xml-verbose*
                              (warn "~a with prefix hint ~a~%with ns bindings ~s" condition name
                                    *namespace-bindings*))
                            (if (or name (let ((maybe-name (namespace-printname namespace)))
                                           (when (or (equal name "")
                                                     (is-ncname maybe-name))
                                             (setf name maybe-name))))
                              (handler-case (when (prefix-value name)
                                              (setf name (next-prefix)))
                                (|NSC: Prefix Declared| (c)
                                                        ;; if the prefix wasn't declared, then use it
                                                        (declare (ignore c))))
                              (setf name (next-prefix)))
                            (when *xml-verbose*
                              (warn "yielded prefix: ~s." name))
                            (setf (prefix-value (local-part name))
                                  namespace
                                  ;(namespace-name namespace)
                                  )
                            (push (first *namespace-bindings*) *generated-ns-bindings*)
                            (use-value name)))))
        (funcall function)))))


(defMacro with-xml-writer ((stream &rest args &key encoding pretty document-type xml-declaration)
                           &rest body
                           &aux (writer-body (gensym "WRITER-"))
                           (xml-stream (if (symbolp stream) stream (gensym "XML-STREAM-"))))
  "ensure the the body is executed in a context appropriate for xml encoding."
  (declare (ignore encoding pretty document-type xml-declaration))
  `(let (,@(unless (eq xml-stream stream) `((,xml-stream ,stream))))
     (flet ((,writer-body () ,@body))
       (declare (dynamic-extent (function ,writer-body)))
       (if (eq ,xml-stream *xml-output*)
         (funcall #',writer-body)
         (call-with-xml-writer #',writer-body ,xml-stream ,@args)))))


(defun encode-format (&rest args)
  (declare (dynamic-extent args))
  (apply #'format *xml-writer-stream* args))

(defun encode-escaped-format (&rest args)
  (declare (dynamic-extent args))
  (apply #'format *xml-escaped-writer-stream* args))
    

(defClass writer-stream (#+ALLEGRO excl::fundamental-binary-output-stream
                         #+LispWorks stream:fundamental-stream
                         #+digitool ccl::output-binary-stream
                         #+CormanLisp stream
                         #+clozure-common-lisp ccl:fundamental-binary-stream)
  (#+(or clisp CMU lispworks sbcl scl clozure-common-lisp) (direction :initarg :direction))
  (:default-initargs :direction :output
    #+CormanLisp :element-type #+CormanLisp 'unsigned-byte))

(defclass escaped-writer-stream (writer-stream)
  ())

(defmethod stream-element-type ((stream writer-stream))
  'character)

(defun writer-write-string (string)
  (do ((i 0 (1+ i)))
      ((>= i (length string)))
    (funcall *writer-function *writer-arg (char string i))))

(defun writer-tyo-escaped (char)
  (case char
    (#\< (writer-write-string "&lt;"))
    (#\> (writer-write-string "&gt;"))
    (#\& (writer-write-string "&amp;"))
    (t (funcall *writer-function *writer-arg char))))


#+allegro
(progn
  
  (defmethod excl:stream-line-column ((stream writer-stream)) nil)
  
  (defmethod excl:stream-terpri ((stream writer-stream))
    (funcall *writer-function *writer-arg #\return)
    (funcall *writer-function *writer-arg #\linefeed))
  
  (defmethod excl:stream-write-char ((stream escaped-writer-stream) (char character))
    (writer-tyo-escaped char))
  
  (defmethod excl:stream-write-char ((stream writer-stream) (char character))
    (funcall *writer-function *writer-arg char))
  
  (defmethod excl:stream-write-string ((stream writer-stream) string
                                       &optional (start 0) (end (length string)))
    (unless end (setf end (length string)))
    (do ((i start (1+ i)))
        ((>= i end))
      (excl:stream-write-char stream (char string i)))
    string)
  ) ;; +allegro

#+clozure
(progn
  (defmethod ccl:stream-line-column ((stream writer-stream)) nil)
  
  (defmethod ccl:stream-terpri ((stream writer-stream))
    (funcall *writer-function *writer-arg #\return)
    (funcall *writer-function *writer-arg #\linefeed))
  
  (defmethod ccl:stream-write-char ((stream writer-stream) (char character))
    (funcall *writer-function *writer-arg char))
  
  (defmethod ccl:stream-write-char ((stream escaped-writer-stream) (char character))
    (writer-tyo-escaped char))
  
  (defmethod ccl:stream-write-string ((stream writer-stream) string
                                      &optional (start 0) (end (length string)))
    (unless end (setf end (length string)))
    (do ((i start (1+ i)))
        ((>= i end))
      (ccl:stream-write-char stream (char string i)))
    string)
  ) ;; +clozure

#+digitool
(progn
  (defmethod ccl:stream-tyo ((stream writer-stream) char)
    (funcall *writer-function *writer-arg char))
  
  (defmethod ccl:stream-tyo ((stream escaped-writer-stream) char)
    (writer-tyo-escaped char))
  
  (defmethod ccl:stream-write-string ((stream writer-stream) string start end)
    (unless end (setf end (length string)))
    (do ((i start (1+ i)))
        ((>= i end))
      (ccl:stream-tyo stream (char string i)))
    string)
  ) ;; +digitool


#+lispworks
(progn
  (defmethod stream:stream-write-char ((stream writer-stream) (char character))
    (funcall *writer-function *writer-arg char))

  (defmethod stream:stream-write-char ((stream escaped-writer-stream) (char character))
    (writer-tyo-escaped char))
  ) ;; +lispworks


(setq *xml-writer-stream* (make-instance 'writer-stream))

(setq *xml-escaped-writer-stream* (make-instance 'escaped-writer-stream))


;;;
;;;

(defgeneric write-node (datum stream &rest args)
  (:documentation
   "encode the node as xml to the provided stream.")

  (:method ((node t) (destination pathname) &rest args)
           (with-open-file (stream destination :direction :output :element-type 'unsigned-byte
                                   :if-exists :supersede :if-does-not-exist :create)
             (apply #'write-node node stream args)))

  (:method ((node t) (*output-destination* t) &rest args)
           (apply #'call-with-xml-writer 
                  #'(lambda () (encode-node node))
                  *output-destination*
                  args)
           node))

#+digitool
(setf (ccl:assq 'with-xml-writer ccl::*FRED-SPECIAL-INDENT-ALIST*) 1)


;;
;;
;; primitives

(defun encode-char (char)
  "Encode the provided character to the current output destination _without_ escapes."
  (funcall *writer-function *writer-arg char))


(defun encode-string (string)
  "encode the provided string to the output destination _without_ escapes."
  (dotimes (i (length string))
    (funcall *writer-function *writer-arg (char string i))))


(defun encode-newline ()
  "The standard EOL to be reported is a #x0a. Thus emit just that as newline to output destinations."
  (encode-char #.(code-char #x0a)))


(defgeneric encode-node (node)
  (:documentation
   "encode the provided node to the current output destination.
    escape character data in content and attribute values as appropriate.
    introduce namespace bindings as required.
    given a tree of nodes, treat it as an s-expression document model."))


(defun encode-escaped-string (string delimiter-map)
  (assert (typep string 'string))
  (dotimes (x (length string))
    (let* ((char (char string x))
           (entity (rest (assoc char delimiter-map))))
      (declare (type character char))
      (if entity (encode-string entity) (funcall *writer-function *writer-arg char)))))


(defun encode-character-data (string)
  "Encode the given string with character data escapes."
  (encode-escaped-string string *character-data-entities*))


(defun encode-attribute-value (value)
  "Encode the given string with the escapes as per the current attribute delimiter"
  (etypecase value
    (cons (dolist (value value) (encode-attribute-value value)))
    (string (encode-escaped-string value (ecase *attribute-value-delimiter*
                                            (#\' *attribute-value-apostrophe-entities*)
                                            (#\" *attribute-value-quote-entities*))))))
    

(defmethod encode-node ((string string))
  (encode-escaped-string string *character-data-entities*))


(defmethod encode-node
           ((node list))
  "Iff the form looks like an element, encode it as one. Otherwise encode each constituent individually."
  (if (or (consp (first node)) (xqdm::uname-p (first node)))
    ;; encode an element
    (encode-sexp-node node)
    (mapc 'encode-node node)))

(defmethod encode-node
           ((node number))
  (encode-string (write-to-string node)))

(defmethod encode-node
    ((node function))
  (funcall node))

;;
;;
;; node methods

(defmethod encode-node
           ((node symbol)
            &aux (local-part (local-part node))
            (namespace (namespace node))
            prefix)
  (if (keywordp node)
    (encode-node (string node))
    (cond ((string= (namespace-name namespace) *xmlns-prefix-namestring*)
           (encode-string *xmlns-prefix-namestring*)
           (unless (eq node *default-namespace-attribute-name*)
             (encode-char #\:)
             (encode-string local-part)))
          (namespace
           (setf prefix (local-part (namespace-prefix namespace (get node :prefix))))
           (unless (string= prefix "")
             (encode-string (local-part prefix))
             (encode-char #\:))
           (encode-string local-part))
          (t ;; allow uninterned names
           (encode-string local-part)))))


(defmethod encode-node
           ((node null))
  )


(defmethod encode-node
           ((node abstract-name)
            &aux (local-part (local-part node))
            (namespace (namespace node))
            prefix)
  (cond ((string= (namespace-name namespace) *xmlns-prefix-namestring*)
         (encode-string *xmlns-prefix-namestring*)
         (unless (eq node *default-namespace-attribute-name*)
           (encode-char #\:)
           (encode-string local-part)))
        (namespace
         (setf prefix (local-part (namespace-prefix namespace
                                                    (with-slots (prefix) node
                                                      (and (slot-boundp node 'prefix) prefix)))))
         (unless (string= prefix "")
           (encode-node (local-part prefix))
           (encode-char #\:))
         (encode-string local-part))
        (t ;; allow uninterned names
         (encode-string local-part))))


(defun encode-xml-declaration (&key version encoding standalone)
  (encode-string "<?xml")
  (when (zerop (length version))
    (setf version *xml-version*))
  (encode-string " version='")
  (encode-string version)
  (encode-char #\')
  (when encoding
    (encode-string " encoding='")
    (encode-string (string encoding))
    (encode-char #\'))
  (encode-string " standalone='")
  (encode-string (if standalone "yes" "no"))
  (encode-string "' ?>"))

(defun encode-document-type (name &key public system)
  "simple document type encoding"
  (encode-string "<!DOCTYPE ")
  (encode-string (local-part name))
  (if system
    (if public
      (encode-format " PUBLIC \"~a\" \"~a\"" public system)
      (encode-format " SYSTEM \"~a\"" system))
    (if public                          ; allow w/o system
      (encode-format " PUBLIC \"~a\"" public)))
  (encode-string ">"))
    

(defmethod encode-node
           ((node doc-node-interface)
            &aux
            (*prefix-count* *prefix-count*)
            (*namespace-bindings* *namespace-bindings*)
            (*default-namespace* *default-namespace*)
            (name nil)
            (encoding (encoding node))
            (standalone (standalone node))
            (version (version node))
            (entity-info (entity-info node)))
  (etypecase *encode-xml-declaration*
    (null )
    (cons (apply #'encode-xml-declaration *encode-xml-declaration*))
    ((member t)
     (encode-xml-declaration :version version :encoding encoding :standalone standalone)))
  
  (etypecase *encode-document-type*
    (null )
    (cons (apply #'encode-document-type *encode-document-type*))
    ((member t)
     (setf name (name (entity-info node)))
     (when (or (eq name *null-name*) (null name))
       (setf name (name (root node))))
     (cond (entity-info
            (encode-newline)
            (encode-document-type (name entity-info)
                                  :public (public-id entity-info)
                                  :system (system-id entity-info)))
           ((or (plusp (hash-table-count (notations node)))
                (> (hash-table-count (general-entities node)) 5)
                (plusp (hash-table-count (parameter-entities node)))
                (plusp (hash-table-count (types node)))
                (attributes node))
            (encode-char #\newline)
            (encode-string "<!DOCTYPE ")
            (encode-node (local-part name))  ;; force the literal name w/o ns|prefix
            (encode-string " [")
            (flet ((encode-def (key def)
                     (declare (ignore key))
                     (encode-newline)
                     (encode-node def)))
              (maphash #'encode-def (notations node))
              (maphash #'encode-def (parameter-entities node))
              (maphash #'encode-def (general-entities node)))
            (let* ((root (root node))
                   (root-type (when root (ignore-errors (def root))))
                   (*node-cache* nil))
              (flet ((encode-def (key def)
                       (declare (ignore key))
                       (unless (find def *node-cache*)
                         (push def *node-cache*)
                         (encode-newline)
                         (encode-node def))))
                ;; encode the root definition first. the method proceeds recursively,
                ;; which generates sensible namespace prefixes. any remaining
                ;; definitions are done subsequently
                (if root-type
                  (encode-def nil root-type)
                  (encode-string " <!-- no root element definition present -->"))
                (maphash #'encode-def (types node))))
            (encode-newline)
            (encode-string " ]>")))))
    (dolist (child (children node))
      (encode-newline)
      (encode-node child)))

(defun encode-generated-ns-bindings (generated-ns-bindings)
  (dolist (binding generated-ns-bindings)
    (destructuring-bind (prefix . namespace) binding
      (encode-char #\space)
      (typecase prefix
        (name (encode-node prefix))
        (string
         (encode-string "xmlns")
         (unless (equal prefix "")
           (encode-char #\:)
           (encode-string prefix))))
      (encode-char #\=)
      (encode-char *attribute-value-delimiter*)
      (encode-attribute-value (namespace-name namespace))
      (encode-char *attribute-value-delimiter*))))

(defmethod encode-node
           ((node elem-node-interface))
  (let ((*namespace-bindings* *namespace-bindings*)
        (*default-namespace* *default-namespace*)
        (*node-level* (1+ *node-level*))
        (*prefix-count* *prefix-count*)
        (*generated-ns-bindings* nil))
    (declare (dynamic-extent *namespace-bindings*))
    (with-accessors ((name name)
                     (children children)
                     (attributes attributes)
                     (namespaces namespaces)) node
      (dolist (ns-node namespaces)
        (push ns-node *namespace-bindings*))
      ; (break "namespaces: ~s/~s." *namespace-bindings* namespaces)
      (encode-char #\<)
      (encode-node name)
      (dolist (node namespaces)
        (encode-char #\space)
        (encode-node node))
      (dolist (node attributes)
        (encode-char #\space)
        (encode-node node))
      (when *generated-ns-bindings*
        (encode-generated-ns-bindings *generated-ns-bindings*))
      (cond (children
             (encode-char #\>)
             (dolist (node children)
               (when *print-pretty*
                 (encode-newline)
                 (dotimes (x *node-level*) (encode-char #\space)))
               (encode-node node))
             (encode-string "</")
             (encode-node name)
             (encode-char #\>))
            (t
             (encode-string " />"))))))

(defun encode-sexp-node (element)
  (let* ((tag (first element))
         (name (if (consp tag) (first tag) tag))
         (annotations (when (consp tag) (rest tag)))
         (children (rest element))
         (*generated-ns-bindings* nil)
         (*namespace-bindings* *namespace-bindings*))
    (loop for (name value) in annotations
          when (eq (namespace name) *xmlns-namespace*)
          do (push (make-instance 'ns-node :name name :value value) *namespace-bindings*))
    (encode-char #\<)
    (encode-node name)
    (loop for (name value) in annotations
          do (progn (encode-char #\space)
                    (encode-node name)
                    (encode-char #\=)
                    (encode-char *attribute-value-delimiter*)
                    (encode-attribute-value value)
                    (encode-char *attribute-value-delimiter*)))
      (when *generated-ns-bindings*
        (encode-generated-ns-bindings *generated-ns-bindings*))
      (cond (children
             (encode-char #\>)
             (dolist (node children)
               (when *print-pretty*
                 (encode-newline)
                 (dotimes (x *node-level*) (encode-char #\space)))
               (encode-node node))
             (encode-string "</")
             (encode-node name)
             (encode-char #\>))
            (t
             (encode-string " />")))))


(defmethod encode-node
           ((node elem-property-node-interface))
  (with-slots (name children) node
    (encode-node name)
    (encode-char #\=)
    (encode-char *attribute-value-delimiter*)
    (dolist (node children)
      ;; allow for uname constituents, but for strngs to be escaped as attribute values
      (typecase node
        (string (encode-attribute-value node))
        (t (encode-node node))))
    (encode-char *attribute-value-delimiter*)))

(defmethod encode-node
           ((node pi-node))
  (encode-string "<?")
  (encode-node (name node))
  (encode-char #\space)
  (dolist (node (children node))
    (encode-node node))
  (encode-string "?>"))

(defmethod encode-node
           ((node comment-node))
  (encode-string "<!-- ")
  (dolist (node (children node))
    (encode-node node))
  (encode-string " -->"))

(defun encode-comment (control &rest args)
  (declare (dynamic-extent args))
  (encode-string "<!-- ")
  (apply #'encode-format control args)
  (encode-string " -->"))

;;
;;
;; declarations

(defmethod encode-node ((node def-elem-type)
                        &aux
                        (*namespace-bindings* *namespace-bindings*)
                        (*generated-ns-bindings* nil)
                        c-def)
  (with-slots (name children properties) node
    ;; first do the definition itself, that is, the content model and the
    ;; attribute declarations. these all in the same namespace context
    (dolist (node properties)
      (when (is-ns-node (prototype node))
        (push (prototype node) *namespace-bindings*)))
    ;; write the element declaration
    (encode-string " <!ELEMENT ")
    (encode-node name)
    (encode-char #\space)
    (dolist (child children)
      (encode-node child))
    (encode-string " >")
    ;; write the attribute declarations
    (when properties
      (encode-newline)
      (encode-string " <!ATTLIST ")
      (encode-node name)
      (encode-char #\space)
      (mapc #'(lambda (n)
                (encode-newline)
                (encode-string "   ")
                (encode-node n))
            properties)
      (encode-string " >"))
    (when *generated-ns-bindings*
      (encode-newline)
      (encode-string " <!ATTLIST ")
      (encode-node name)
      (encode-char #\space)
      (dolist (binding *generated-ns-bindings*)
        (destructuring-bind (prefix . namespace) binding
          (encode-newline)
          (encode-string "   ")
          (typecase prefix
            (string (encode-string "xmlns:") (encode-string prefix))
            (t (encode-node (first binding))))
          (encode-string " CDATA '")
          (encode-escaped-string (namespace-name namespace) *attribute-value-apostrophe-entities*)
          (encode-string "'")))
      (encode-string " >"))
    ;; then do type definitions referenced by virtue of their presence in the
    ;; content model
    (dolist (c-name (collect-model-names (first (bnfp::bnf-rhs (model node)))))
      (cond ((eq c-name *empty-name*) nil)
            ((eq c-name *wild-name*) nil)
            ((setf c-def (find-def-elem-type c-name (document node)))
             (unless (find c-def *node-cache*)
               (push c-def *node-cache*)
               (encode-newline)
               (encode-node c-def)))
            (t
             (encode-string
              (format nil " <!-- definition not found: ~a: ~a."
                      (name node) c-name)))))))

(defmethod encode-node ((node |content-model|))
  (encode-node (first (bnfp::bnf-rhs node))))

(defmethod encode-node ((node |\|-content|)
                        &aux (expressions (bnfp::bnf-expressions node)))
  (encode-char #\()
  (loop (encode-node (pop expressions))
        (if expressions (encode-string " | ") (return)))
  (encode-char #\)))

(defmethod encode-node ((node |?-content|))
  (encode-node (bnfp::bnf-expression node))
  (encode-char #\?))

(defmethod encode-node ((node |*-content|)
                        &aux (expression (bnfp::bnf-expression node))
                        name)
  (setf name
        (when (typep expression '|content-name|) (bnfp::bnf-name expression)))
  (cond ((eq name *wild-name*) (encode-string "ANY"))
        ((eq name *empty-name*) (encode-string "EMPTY"))
        ((eq name *mixed-name*) (encode-string "(#PCDATA)"))
        (t (encode-node expression)
           (encode-char #\*))))

(defmethod encode-node ((node |+-content|))
  (encode-node (bnfp::bnf-expression node))
  (encode-char #\+))

(defmethod encode-node ((node |content|))
  (encode-node (bnfp::bnf-expression node)))

(defmethod encode-node ((node |,-content|)
                        &aux (expressions (bnfp::bnf-expressions node)))
  (encode-char #\()
  (loop (encode-node (pop expressions))
        (if expressions (encode-string ", ") (return)))
  (encode-char #\)))

(defmethod encode-node ((node |content-name|)
                        &aux (name (bnfp::bnf-name node)))
  (cond ((eq name *mixed-name*) (encode-string "(#PCDATA)"))
        (t (encode-node (bnfp::bnf-name node)))))

(defmethod encode-node ((node |type-name|))
  (encode-node (bnfp::bnf-name node)))


;; this isn't complete, but it's a start

(defmethod encode-node ((node def-elem-property-type)
                        &aux (prototype (prototype node))
                        (default (children prototype))
                        (stipulation (stipulation node)))
  (flet ((encode-enumeration (enumeration)
           (cond (enumeration
                  (encode-char #\()
                  (loop (encode-node (pop enumeration))
                        (if enumeration (encode-char #\|) (return)))
                  (encode-char #\)))
                 (t
                  (encode-string "()")))))
    (unless (is-ephemeral node)
      (encode-node (name node))
      (typecase prototype
        (entity-attr-node (encode-string " ENTITY"))
        (entities-attr-node (encode-string " ENTITIES"))
        (enumeration-attr-node
         (encode-char #\space)
         (encode-enumeration (children node)))
        (id-attr-node (encode-string " ID"))
        (id-ref-attr-node (encode-string " IDREF"))
        (id-refs-attr-node (encode-string " IDREFS"))
        (nmtoken-attr-node (encode-string " NMTOKEN"))
        (nmtokens-attr-node (encode-string " NMTOKENS"))
        (notation-attr-node
         (encode-string " NOTATION")
         (encode-enumeration (children node)))
        (ns-node (encode-string " CDATA"))
        (attr-node (encode-string " CDATA"))
        )
      (encode-char #\space)
      (ecase stipulation
        (:required (encode-string "#REQUIRED"))
        (:implied (encode-string "#IMPLIED"))
        ((nil :fixed)
         (when (eq stipulation :fixed) (encode-string "#FIXED"))
         (encode-char #\space)
         (encode-char *attribute-value-delimiter*)
         (when default (encode-attribute-value default))
         (encode-char *attribute-value-delimiter*))))))
  
  
(defmethod encode-node ((node def-notation))
  (with-slots (name system-id public-id) node
    (encode-string " <!NOTATION " )
    (encode-node name)
    (encode-char #\space)
    (cond (public-id
           (encode-string "PUBLIC '")
           (encode-string public-id)
           (when system-id
             (encode-string "' '")
             (encode-string system-id)))
          (t
           (encode-string "SYSTEM '")
           (encode-string system-id)))
    (encode-string "' >")))

(defmethod encode-node ((node ref-entity))
  (with-slots (value children) node
    (flet ((encode-char-or-byte (datum)
             (funcall *writer-function *writer-arg
                      (if (integerp datum) (code-char datum) datum))))
      (cond ((and (expand node)
                  (cond ((stringp value) (map nil #'encode-char value) t)
                        ((functionp value)
                         (map nil  #'encode-char-or-byte (funcall value))
                         t)
                        ((is-def-internal-entity value)
                         (with-slots (children value) value
                           (cond (children
                                  (map nil #'encode-char-or-byte children)
                                  t)
                                 (value
                                  (map nil #'encode-char value)
                                  t))))
                        ((typep children 'sequence)
                         (map nil #'encode-char-or-byte children)))))
            (t
             (encode-char #\&)
             (encode-node (name node))
             (encode-char #\;))))))


(defmethod encode-node ((node def-internal-entity))
  (encode-string " <!ENTITY ")
  (when (is-def-parameter-entity node)
    (encode-string "% "))
  (encode-node (name node))
  (encode-string " '")
  (with-slots (children value) node
    (cond (children
           (mapc #'(lambda (byte) (funcall *writer-function *writer-arg
                                           (code-char byte)))
                 children))
          (value
           (map nil #'encode-char value))))
  (encode-string "' >"))

(defmethod encode-node ((node def-external-entity))
  (encode-string " <!ENTITY ")
  (when (is-def-parameter-entity node)
    (encode-string "% "))
  (encode-node (name node))
  (let ((system (system-id node))
        (public (public-id node)))
    (cond (public (encode-string " PUBLIC '")
                  (encode-node public)
                  (encode-string "' '")
                  (encode-node system)
                  (encode-node "'"))
          (system (encode-string " SYSTEM '")
                  (encode-node system)
                  (encode-node "'"))))
  (encode-string " >"))


(let* ((*print-pretty* nil)
       (result (with-output-to-string (stream)
				      (with-xml-writer (stream)
						       (encode-node '(({xhtml}head ({xmlns}xhtml "http://www.w3.org/1999/xhtml"))
								      (({}meta ({}http-equiv  "Content-Type")
									       ({}content  "text/xml;charset=iso-8859-1")))
								      ({xhtml}title "The Title"))))))
       (test "<xhtml:head xmlns:xhtml='http://www.w3.org/1999/xhtml'><meta http-equiv='Content-Type' content='text/xml;charset=iso-8859-1' /><xhtml:title>The Title</xhtml:title></xhtml:head>"))
  (unless (equal result test)
    (cerror "continue" "xmlwriter failed:~% ~s !=~% ~s." result test)))

:de.setf.xml
