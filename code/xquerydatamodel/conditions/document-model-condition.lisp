;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.model.implementation; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this file declares the conditions which denote deviation from the
  well-formedness and validity constraints described in the respective specification.
  conditions for namespace and primitive encoding constaints are included
  in the xabstract module.</p>
  <p>
  numerous condition definitions include check-methods. the checks are
  triggered during class instantiation via :after methods which are also
  defined here. checks during model operations and parsing are triggered
  elsewhere.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010318' AUTHOR='JAA'>
   factoer out as a distinct file.</DELTA>
  <DELTA DATE='20010623'>EC: Version Match</DELTA>
  <DELTA DATE='20010918'>report and properties corrected  for |WFC: Parsed Entity|
   and |VC: Name Token|.</DELTA>
  <DELTA DATE='20020115'>reorganized conditions to use an explicit report function
   in order to allow call-next-method (cf. LispWorks)</DELTA>
  <DELTA DATE='20020123'>conditions for namespace/package errors</DELTA>
  <DELTA DATE='20020315'>well-formedness constraint for schema component definitions</DELTA>
  <DELTA DATE='20020712'>NSC: Prefix Immutable</DELTA>
  <DELTA DATE='20020812'>make-condition rather than allocate-instance</DELTA>
  <DELTA DATE='20020815'>changed access to condition slots to use an accessor v/s with-slots.</code></DELTA>
  <DELTA DATE='20020820'>changed <code>check-constraint</code> protocol to use the condition symbol
   rather than instantiating the condition in the default case.</DELTA>
  <DELTA DATE='20021020'>
   factored general conditions, the function interface, and
   the abstract reporting methods out to the xml-abstract module.</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.xml.model.implementation)

(define-condition document-model-condition (condition) ())

(define-condition document-model-error (document-model-condition xml-error) ())

(define-condition schema-condition (condition) ())

(define-condition schema-error (schema-condition xml-error) ())

(define-condition wellformedness-condition (condition) ())

(define-condition wellformedness-error (wellformedness-condition xml-error parser-error) () )

(define-condition wellformedness-cerror (continuable-error wellformedness-error) () )

(define-condition validity-condition (condition) ())

(define-condition validity-cerror (continuable-error validity-condition xml-error parser-error) ())

(define-condition parse-context-error (wellformedness-error)
                  ((context :initarg :context :initform nil :reader condition-context)))

(define-condition production-error (wellformedness-error)
                  ((name :reader condition-name)))

(defMethod report-condition
           ((condition production-error) stream)
  (with-accessors ((name condition-name)) condition
    (let ((production (get name :production)))
      (format stream "production failed~@[: ~s~]." production))))

(define-condition incomplete-parse (wellformedness-error)
                  ((result :initarg :result :initform nil :accessor condition-result)
                   (document :initarg :document :initform nil :accessor condition-document)))

(defMethod report-condition
           ((condition incomplete-parse) stream)
  (with-accessors ((result condition-result)) condition
    (format stream "incomplete parse~@[: result ~s~]." result)))

(define-condition undefined-namespace-assignment (xml-condition simple-warning)
                  ((name :initarg :name :reader condition-name :initform nil)
                   (document :initarg :document :reader condition-document :initform *document*)))

(defmethod simple-condition-format-arguments ((condition undefined-namespace-assignment))
  (list (condition-name condition) (condition-document condition)))
(defMethod simple-condition-format-control  ((condition undefined-namespace-assignment))
  "no namespace assignment possible for name: '~/xqdm:format-name/': ~s.")

(defmethod check-constraint :around ((constraint validity-condition) (instance t))
  (when (validate? *document*) (call-next-method)))

;;
;;
;; condition definition macros

(defMacro def-dmc (name &optional super slots &rest options)
  `(def-exception (,name "DMC") ,(or super '(document-model-error))
     ,slots
     ,@options))

(defMacro def-sc (name &optional super slots &rest options)
  `(def-exception (,name "SC") ,(or super '(schema-error))
     ,slots
     ,@options))

(defMacro def-wfc (name &optional super slots &rest options)
  `(def-exception (,name "WFC") ,(or super '(wellformedness-error))
     ,slots
     ,@options))

(defMacro def-wfc-production (name &optional super slots &rest options)
  `(def-exception (,(format nil "[~a]" name) "WFC") ,(or super '(production-error))
     ((name :initform ',(intern name) :allocation :class :reader condition-name)
      ,@slots)
     ,@options))

(defmacro def-vc (name &optional super slots &rest options)
  `(def-exception (,name "VC") ,(or super '(validity-cerror))
     ,slots
     ,@options))


#+digitool
(dolist (sym '(def-dmc def-sc def-wfc def-wfc-production def-vc def-sc def-dmc))
  (pushnew (cons sym 2) *FRED-SPECIAL-INDENT-ALIST* :key #'first))


;;
;;
;; concrete conditions following the specs

(def-vc "Attribute Default Legal" )

(def-vc "Attribute Value Type" )

(def-vc "Attribute Declared" )

(def-nsc "CDATA Required for Namespace Node" )

(def-wfc "Character Reference" ()
  ()
  (:default-initargs
    :format-control "invalid character reference syntax: ~s."
    :format-arguments '(nil)))

(def-wfc "Character Context" (parse-context-error)
  ((character :initarg :character :initform nil :reader condition-character))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((context condition-context) (character condition-character)) condition
       (format stream "character not permitted in this context: ~s."
               character)))))

(def-wfc-production "CharRef" ())

(def-wfc-production "Comment" ())

(def-wfc "Element Type Match" ()
  ((start-name :initform nil :initarg :start-name :reader condition-start-name)
   (end-name :initform nil :initarg :end-name :reader condition-end-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((start-name condition-start-name) (end-name condition-end-name)) condition
       (format stream "start tag identifier does not match end: ~s: ~s."
               start-name end-name)))))

(def-nsc "Element Type Match" ()
  ((start-name :initform nil :initarg :start-name :reader condition-start-name)
   (end-name :initform nil :initarg :end-name :reader condition-end-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((start-name condition-start-name) (end-name condition-end-name)) condition
       (format stream "start tag identifier does not match end: ~s: ~s."
               start-name end-name)))))

(def-vc "Element Valid" ()
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "there must be a definition where the name matches: ~s."
               name)))))

(def-vc "Element Content" ()
  ((model :initform nil :initarg :model :reader condition-model)
   (content :initform nil :initarg :content :reader condition-content))
  (:report-condition
   (lambda (condition stream &aux (*print-length* 7))
     (with-accessors ((content condition-content) (model condition-model)) condition
       (format stream "content must match the element model: ~s: ~a."
               content (with-output-to-string (stream) (pprint model stream))))))
  (:check (lambda (condition (node elem-node) &aux (def (def node)))
            (unless (validate-content def node)
              (|VC: Element Content| :model (when def (children def))
                                     :content (children node))))))

(def-vc "Entity Declared" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "entity not defined prior to use: ~a." name)))))

(def-wfc "Entity Declared" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "entity not defined prior to use: ~a." name)))))

(def-vc "Entity Name" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (context :initarg :context :initform nil :reader condition-context)
   (detail :initarg :detail :initform nil :reader condition-detail))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((context condition-context) (name condition-name) (detail condition-detail)) condition
       (format stream "erroneous entity name: ~s : ~s~@[ (~a)~]."
               context name detail)))))

(def-wfc-production "EntityRef" ())

(def-vc "Enumeration" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "all enumeration values must be be declared: ~s." name)))))

(def-wfc "External Subset" ()
  ((system-id :initarg :system-id :initform nil :reader condition-system-id)
   (public-id :initarg :public-id :initform nil :reader condition-public-id)
   (datum :initarg :datum :initform nil :reader condition-datum))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((system-id condition-system-id) (public-id condition-public-id) (datum condition-datum)) condition
       (format stream
               "entity identified as (SYSTEM ~s PUBLIC ~s) does not have the form of an external subset:~%~a"
               system-id public-id datum)))))

(def-wfc "External Parsed Entity" ()
  ((system-id :initarg :system-id :initform nil :reader condition-system-id)
   (public-id :initarg :public-id :initform nil :reader condition-public-id)
   (datum :initarg :datum :initform nil :reader condition-datum))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((system-id condition-system-id) (public-id condition-public-id) (datum condition-datum)) condition
       (format stream
               "entity identified as (SYSTEM ~s PUBLIC ~s) does not have the form of an external parsed entity:~%~a"
               system-id public-id datum)))))



(def-vc "Fixed Attribute Default" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (default :initarg :default :initform nil :reader condition-default)
   (encoded :initarg :encoded :initform nil :reader condition-encoded))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (default condition-default) (encoded condition-encoded)) condition
       (format stream "attribute value does not match default: ~a: ~s: ~s:"
               name encoded default)))))

(def-vc "ID" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (value :initarg :value :initform nil :reader condition-value)
   (detail :initarg :detail :initform nil :reader condition-detail))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (value condition-value) (detail condition-detail)) condition
       (format stream
               "ID values must match the Name production and be unique: ~s: ~s~@[ (~a)~]."
               name value detail)))))

(def-vc "ID Attribute Default" ()
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "ID attributes must have a declared default of #IMPLIED or #REQUIRED: ~s."
               name)))))

(def-vc "IDRef" ()
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "IDREF values must match the Name production: ~s."
               name)))))

(def-vc "IDRef Target" ()
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream
               "IDREF values must match the value of an ID attribute on some element in the document: ~s."
               name)))))


(def-wfc "In DTD" )

(def-nsc "Leading XML" ()
  ()
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "'xml' prefix precluded in attribute name: ~s." name)))))

(def-wfc "Legal Character" ()
  ((code :initarg :code :initform nil :reader condition-code)
   (name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((code condition-code) (name condition-name)) condition
       (format stream
               "character name/code error: ~s/#x~x (~a)."
               name code 
               (if (<-char-code-limit code) "not permitted" "not supported"))))))

(def-wfc "Name" () )

(def-vc "Name Token" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (value :initarg :value :initform nil :reader condition-value)
   (detail :initarg :detail :initform nil :reader condition-detail))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (value condition-value) (detail condition-detail)) condition
       (format stream
               "NMTOKEN values must match the Nmtoken production: ~s: ~s~@[ (~a)~]."
               name value detail)))))

(def-nsc "Namespace Attribute Default" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (default :initarg :default :initform nil :reader condition-default)
   (encoded :initarg :encoded :initform nil :reader condition-encoded))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (default condition-default) (encoded condition-encoded)) condition
       (format stream "namespace name does not match default value: ~a == ~s /= ~s:"
               name encoded default)))))

(def-nsc "Namespace Undetermined" (namespace-condition xml-warning)
  ((name :initarg :name :reader condition-name :initform nil))
  (:default-initargs :format-control "no namespace assignment possible for name: '~/xqdm:format-name/'.")
  (:format-arguments (lambda (condition) (list (condition-name condition)))))


(def-vc "No Duplicate Tokens" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (context :initarg :context :initform nil :reader condition-context))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (context condition-context)) condition
       (format stream
               "The names in a single declaration must all be distinct."
               context name )))))

(def-vc "No Duplicate Types" ()
  ((name :initarg :name :initform nil :reader condition-name)
   (context :initarg :context :initform nil :reader condition-context))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (context condition-context)) condition
       (format stream
               "The same name must not appear more than once in a single mixed-content declaration: ~s: ~s."
               context name )))))

(def-wfc "No External Entity References" ()
  ((entity :initarg :entity :initform nil :reader condition-entity))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((entity condition-entity)) condition
       (format stream "Attribute values cannot contain entity references to external entities : ~s"
               entity)))))

(def-wfc "No Recursion" ()
  ((entity :initarg :entity :initform nil :reader condition-entity))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((entity condition-entity)) condition
       (format stream "no entity recursion permitted: ~s" entity)))))

(def-wfc "No < in Attribute Values" )

(def-nsc "No Null Namespace Bindings" ()
  ((continue-format-control :initform "permit the binding." :allocation :class))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "no null namespace binding permitted: ~s." name)))))

(def-vc "Notation Attributes" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "all notation names must be declared: ~s." name)))))

(def-vc "One ID per Element Type" ()
  ((name :initform nil :initarg :name :reader condition-name)
   (attribute-names :initform nil :initarg :attribute-names :reader condition-attribute-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (attribute-names condition-attribute-name)) condition
       (format stream "no element type may have more than one ID attribute specified: ~s: ~s."
               name attribute-names))))
  (:check (lambda (condition (node element-definition))
            (check-constraint condition (annotation-model node))))
  (:check (lambda (condition (declarations sequence))
            (when (> (count-if #'id-attr-node-p declarations :key #'prototype) 1)
              (xml-error condition
                         :name (name (parent (first declarations)))
                         :attribute-names (mapcar #'name declarations))))))

(defMethod initialize-instance :after ((instance element-definition) &key)
  (map nil #'(lambda (def) (setf (parent def) instance))
       (direct-annotation-model instance))
  (check-constraint |VC: One ID per Element Type| instance))

(defMethod (setf properties) :before (new-value (instance element-definition))
  (dolist (def new-value) (setf (parent def) instance))
  (check-constraint |VC: One ID per Element Type| new-value))


(def-wfc "Parsed Entity" (wellformedness-cerror)
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "An entity reference must not contain the name of an unparsed entity: ~s."
               name)))))

(def-wfc "PE Between Declarations" )

(def-wfc "PEs in Internal Subset" (wellformedness-cerror)
  ((name :initform nil :initarg :name :reader condition-name)
   (continue-format-control :initform "permit the reference" :allocation :class))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "In the internal DTD subset, parameter-entity references can occur only where markup declarations can occur: ~a."
               name)))))


(def-nsc "Prefix Immutable" ()
  ((name :initform nil :initarg :name :reader condition-name)
   (namespace :initform nil :initarg :namespace :reader condition-namespace))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)
                      (namespace condition-namespace)) condition
       (format stream "immutable prefix cannot be bound to namespace: ~s: ~s."
               name namespace))))
  (:check (lambda (condition (nsdecl-node namespace-declaration))
            (let ((ns-binding (cons (local-part (name nsdecl-node))
                                    (namespace nsdecl-node))))
              (check-constraint condition ns-binding))))
  (:check (lambda (condition (nsdecl-node cons))
            (destructuring-bind (prefix . namespace) nsdecl-node
              (declare (ftype (function (t) t) prefix-namespace))
              (when (and |REC-xml-names-19990114.NSC: Prefix Immutable|
                         ;; xmlns may not be bound at all, while others may not be changed
                         (or (unbindable-prefix-p prefix)
                             (and (constant-prefix-p prefix)
                                  (not (namespace-equal (prefix-namespace prefix) namespace)))))
                (xml-error condition :name prefix :namespace namespace))))))

(def-nsc "PrefixedAttName Required" ()
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "PrefixedAttName required: ~s."
               name)))))


(def-wfc "Predefined Entity" (wellformedness-cerror)
  ((name :initform nil :initarg :name :reader condition-name)
   (type :initform nil :initarg :type :reader condition-type)
   (continue-format-control :initform "ignore new definition" :allocation :class))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (type condition-type)) condition
       (format stream "duplicate ~@[~a ~]entity definition precluded: ~a."
               type name))))
  (:check (lambda (condition (instance parameter-entity-definition)
                             &aux old-def (name (name instance)))
            (declare (ftype (function (t t) t) find-def-parameter-entity))
            (cond ((and (setf old-def
                              (find-def-parameter-entity name (document instance)
                                                         :if-does-not-exist nil))
                        (eq (extent old-def) :permanent)
                        (not (equalp (children old-def) (children instance))))
                   (xml-error |WFC: Predefined Entity|
                              :name name :type (type-of instance))
                   nil)
                  (t t))))
  (:check (lambda (condition (instance general-entity-definition)
                             &aux old-def (name (name instance)))
            (declare (ftype (function (t t) t) find-def-general-entity))
            (cond ((and (setf old-def (find-def-general-entity name (document instance)
                                                               :if-does-not-exist nil))
                        (eq (extent old-def) :static)
                        (not (equalp (children old-def) (children instance)))
                        #| 20010506 no longer necessary, as entity value is normalized upon instantiation
                        ;; special case for &amp;  &lt, ... which have varying definitions
                        ;; permit redefinition where a single byte is replaced with "#&..."
                        (or (not (eql (first (children instance)) 38))
                            (not (eql (second (children instance)) 35))
                            (not (= (length (children old-def)) 1)))|#
                        )
                   (xml-error |WFC: Predefined Entity|
                              :name name :type (type-of instance))
                   nil)
                  (t t))))
  (:check (lambda (condition (instance type-definition)
                             &aux (name (name instance)))
            (xml-error |WFC: Predefined Entity|
                       :name name :type (type-of instance))
            nil)))

(def-wfc "Proper Declaration/PE Nesting" )

(def-vc "Proper Group/PE Nesting" )

(def-sc "Ref Target" ()
  ((name :initform nil :initarg :name :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "Reference target not found: ~s."
               name)))))

(def-wfc "Replacement Text Integrity" (wellformedness-error)
  ((name :initform nil :initarg :name :reader condition-name)
   (text :initform nil :initarg :text :reader condition-text))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name) (type condition-type) (text condition-text)) condition
       (format stream "incomplete entity reference(s) in replacement text: ~a: ~s."
               name text)))))

(def-vc "Required Attribute" ()
  ((names :initarg :names :initform nil :reader condition-names))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((names condition-names)) condition
       (format stream "~r attribute~:P missing: ~s."
               (length names) names)))))

(def-vc "Root Element Type" ()
  ((root-name :initarg :root-name :reader condition-root-name)
   (document-name :initarg :document-name :reader condition-document-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((root-name condition-root-name) (document-name condition-document-name)) condition
       (format stream "document and root element names do not match: ~s: ~s."
               document-name root-name)))))

(def-vc "Standalone Document Declaration" () ()
  (:documentation "this is here, but senseless to enforce."))

(def-wfc-production "SystemLiteral" ()
  ((datum :initarg :datum :initform nil :reader condition-datum))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((datum condition-datum)) condition
       (format stream "no fragment identifier permitted: ~s." datum)))))

(def-wfc "Unique Att Spec" (wellformedness-cerror)
  ((attributes :initform nil :initarg :attributes :reader condition-attributes)
   (continue-format-control :initform "permit duplication." :allocation :class))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((attributes condition-attributes)) condition
       (format stream "duplicate attribute~p precluded: ~{~s~^ ~}."
               (length attributes) (mapcar #'name attributes)))))
  (:check (lambda (condition (node abstract-elem-node) &aux duplicates)
            (flet ((check-node (node list &aux (name (name node)))
                     (map nil #'(lambda (test)
                                  (when (and (not (eq test node))
                                             (uname-equal (name test) name))
                                    (push test duplicates)))
                          list)))
              (mapl #'(lambda (nodes) (check-node (first nodes) (rest nodes)))
                    (attributes node))
              (mapl #'(lambda (nodes) (check-node (first nodes) (rest nodes)))
                    (namespaces node))
              (when duplicates
                (xml-error |WFC: Unique Att Spec| :attributes duplicates))))))

#|
20010907.jaa removed as the parser sets the properties rather than providing them for
initialization.

(defMethod initialize-instance :after ((instance elem-node) &key)
  (inspect instance)
  (break)
  (check-constraint |WFC: Unique Att Spec| instance))
|#

(def-vc "Unique Element Type Declaration" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "No element type may be declared more than once: ~s."
               name)))))






:EOF