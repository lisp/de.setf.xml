;;; -*- package: NOX; Syntax: Common-lisp; Base: 10 -*-

(in-package "NOX")

;; an xmlp-based sax parser drives the event-based counterpart based on
;; inline parser construction operations.
;; note that the bridge class implementation does not specify the
;; instantiation and invocation structure.

(defClass sax-construction-context (sax-producer)
  ())

(defMethod parse ((parser sax-construction-context) (source t) (locator xutils:uri))
  (parse parser source (xutils:uri-namestring locator)))
(defMethod parse ((parser sax-construction-context) (source t) (locator null))
  (parse parser source ""))
(defMethod parse ((parser sax-construction-context) (source t) (locator string))
  (let ((*current-parser* parser)
        (consumer (sax-producer-consumer parser)))
    (start-document consumer locator)
    (xmlp:document-parser source :construction-context parser)
    ))


;;
;;
;; specialized versions of the xml parser constructors generate parse events.

(defMethod xmlp:|CDataCharData-Constructor|
           ((context sax-construction-context) (data string))
  (when (plusp (length data))
    (char-content (sax-producer-consumer context)
                  data
                  (sax-consumer-mode (sax-producer-consumer context)))
    nil))

(defMethod xmlp:|CharData-Constructor|
           ((context sax-construction-context) (data string))
  (setf data (collapse-whitespace data))
  (when (plusp (length data))
    (char-content (sax-producer-consumer context)
                  data
                  (sax-consumer-mode (sax-producer-consumer context)))
    nil))

(defMethod xmlp:construct-construction-context
           ((context sax-construction-context) (component t))
  "the context remains unchanged throughout the parse process."
  context)

(defMethod xmlp:construct-ns-node
           ((context sax-construction-context) attribute-value name
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
           ((construction-context sax-construction-context) (third-misc-sequence t) (prolog t) (root t))
  (let ((consumer (sax-producer-consumer construction-context)))
    (end-document consumer (sax-consumer-mode consumer))))

(defMethod xmlp:|Element-Constructor|
           ((context sax-construction-context) (content* t) etag stag)
  (when etag
    (let ((close-tag (make-instance 'close-tag)))
      (setf (tag-counterpart stag) close-tag
            (tag-counterpart close-tag) stag)))
  (end-element (sax-producer-consumer context) stag
               (sax-consumer-mode (sax-producer-consumer context)))
  nil)

(defMethod xmlp:|STag-Constructor|
           ((context sax-construction-context) attr-plist+ns-cons* name)
  (let ((tag (make-instance 'open-tag))
        (namespaces nil)
        (attributes nil))
    (xmlp:call-with-name-properties
     #'(lambda (&key namestring local-part namespace &allow-other-keys)
         (flet ((tag-attribute (&key name att-value)
                  (xmlp:call-with-name-properties
                   #'(lambda (&key local-part namespace &allow-other-keys)
                       (cons (concatenate 'string (xqdm:namespace-name namespace) local-part)
                             (xqdm:value-string att-value)))
                   name))
                (tag-namespace (name value)
                  (cons (if (string-equal name xqdm:*xmlns-prefix-namestring*)
                          nil
                          name)
                        value)))
           (setf (token-string tag) (if (eq namespace xqdm:*null-namespace*)
                                      local-part
                                      (concatenate 'string
                                                   (xqdm:namespace-name namespace)
                                                   local-part))
                 (tag-original-name tag) namestring)
           (mapcar #'(lambda (attr-plist+ns-cons)
                       (cond ((consp (rest attr-plist+ns-cons)) ;; an attribute
                              (push (apply #'tag-attribute attr-plist+ns-cons) attributes))
                             (t
                              (push (tag-namespace (first attr-plist+ns-cons) (rest attr-plist+ns-cons))
                                    namespaces))))
                   attr-plist+ns-cons*)
           (setf (tag-attributes tag) attributes
                 (tag-namespaces tag) namespaces)))
     name)
    (start-element (sax-producer-consumer context) tag
                   (sax-consumer-mode (sax-producer-consumer context)))
    tag))

(defMethod xmlp:|ExtParsedEnt-Constructor|
           ((context sax-construction-context) (content* t) (text-decl t))
  nil)

(defMethod xmlp:|Pi-Constructor|
           ((context sax-construction-context) literal target)
  (proc-instruction (sax-producer-consumer context)
                    (format nil "~a ~a" target literal)
                    (sax-consumer-mode (sax-producer-consumer context))))


:EOF
