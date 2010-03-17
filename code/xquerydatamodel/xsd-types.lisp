;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
 this file represents aspects of the xml-schema datatype system.

 the package "XSD" comprises type specifiers for atomic and complex types.
 a type specifier itself may be simple, that is a symbol, or it may be
 specialized, that is represented with a list.

 the type predicate XSD:TYPEP interprets these specifiers and discriminates
 provided objects either directly by class, for simple specifiers, or
 based on content, range, or some other interpretative judgement, for
 specializer specifiers.
 classifications themselves may be disjunctive, where a given schema type
 permits represetnation as an atomic, or instantial value.

 the simple and specialized types are all defined to be self evaluating, in
 order that they can appear unencumbered in path and query expressions.
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010809'>
   new type implementation for non-symbol type names:<br/>

   for both xml schema and the xml query algebra, element and attribute
   identifiers contribute to types. identifiers may be modelled either as
   symbols or as clos instances. (see xml:code;xquerydatamodel;xqdm-namespaces.)
   thus the type system must support both symbols and instance names.
   which means that the type system must be independent of the cl/clos type
   system, which stipulates symbols for type names.<br/>

   this type system for xml schema datatypes uses various specialized
   forms of <code>type-definition</code> to describe the declared type
   information (primitive type stipulations, content model structures,
   text patterns) and to drive the document decoding and interpretation
   process. these type definitions are more elaborate than those
   (<code>def-elem-type</code>, <code>def-elem-property-type</code>) which
   suffice for simple xml-1.0 declarations.
   it is envoked implicitly when the processor recognizes a reference to an
   xml schema according to the terms of the xml schema spec, in which case the
   schema declarations take precedence over any dtd declarations present. 
    </DELTA>
   <DELTA DATE='20010915'><code>short-float</code> replaed with <code>float</code>
    </DELTA>
   <DELTA DATE='20011203' AUTHOR='JAA'>eval-when for compilation of the
    abstract classes and type lookup mechanism.instances.</DELTA>
   </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-QUERY-DATA-MODEL") 

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defClass xsd::type-specifier (unamed)
    ((resolved :initform nil)
     (direct-subtypes :initform nil :initarg :direct-subtypes
                      :accessor type.direct-subtypes)
     (direct-supertypes :initform nil :initarg :direct-supertypes
                        :writer (setf type.direct-supertypes))
     (direct-predicate :initform nil :initarg :direct-predicate
                       :accessor type.direct-predicate)
     (predicate :initform nil :initarg :predicate
                :accessor type.predicate))
    (:metaclass abstract-class))
  
  (defMethod print-object ((instance xsd::type-specifier) stream)
    (with-slots (name) instance
      (print-unreadable-object (instance stream :type nil)
        (write-string "XSD:" stream)
        (princ (type-of instance) stream)
        (write-char #\space stream)
        (if (slot-boundp instance 'name)
          (prin1 name stream)
          (write-string "<unnamed>" stream)))))
  
  (defParameter *xschema-types* (make-hash-table)
    "binds a global dictionary for type specifications.
   this is augmented for each given document with a local dictionary")
  
  ;;
  ;; mixin types
  
  (defClass xsd::pattern-type-specifier ()
    ((pattern :initform nil :reader type.pattern)
     (pattern-predicate :reader type.pattern-predicate)))
  (defMethod initialize-instance :after ((instance xsd::pattern-type-specifier)
                                         &key pattern)
    (when pattern (setf (type.pattern instance) pattern)))
  (defGeneric (setf type.pattern) (pattern type-specifier)
    (:method ((new-pattern string) (instance xsd::pattern-type-specifier)
              &aux (pattern-atn (regular-expression-to-regex-atn new-pattern)))
             (with-slots (pattern pattern-predicate) instance
               (setf pattern-predicate #'(lambda (string)
                                           (and (stringp string)
                                                (match-regex pattern-atn string)))
                     pattern new-pattern)))
    (:method ((new-pattern null) (instance xsd::pattern-type-specifier))
             (with-slots (pattern pattern-predicate) instance
               (setf pattern-predicate (default-pattern-predicate instance)
                     pattern nil))))
  
  
  (defClass xsd::whitespace-type-specifier ()
    ())
  (defClass xsd::collapse-whitespace-type-specifier (xsd::whitespace-type-specifier)
    ())
  (defMethod type.whitespace ((type-specifier xsd::collapse-whitespace-type-specifier))
    :collapse)
  (defClass xsd::preserve-whitespace-type-specifier (xsd::whitespace-type-specifier)
    ())
  (defMethod type.whitespace ((type-specifier xsd::preserve-whitespace-type-specifier))
    :preserve)
  (defClass xsd::declare-whitespace-type-specifier ()
    ((whitespace :initform nil :initarg :whitespace :accessor type.whitespace)))
  (defClass xsd::enumerated-type-specifier ()
    ((enumeration :initform nil :initarg :enumeration :accessor type.enumeration)))
  (defClass xsd::bounded-type-specifier ()
    ((min-inclusive :initform nil :initarg :min-inclusive
                    :accessor type.min-inclusive)
     (min-exclusive :initform nil :initarg :min-exclusive
                    :accessor type.min-exclusive)
     (max-inclusive :initform nil :initarg :max-inclusive
                    :accessor type.max-inclusive)
     (max-exclusive :initform nil :initarg :max-exclusive
                    :accessor type.max-exclusive)))
  (defClass xsd::sequence-type-specifier ()
    ((length :initarg :length :initform nil :accessor type.length)
     (min-length :initarg :min-length :initform nil :accessor type.min-length)
     (max-length :initarg :max-length :initform nil :accessor type.max-length)))
  (defClass xsd::number-type-specifier (xsd::pattern-type-specifier
                                        xsd::enumerated-type-specifier
                                        xsd::collapse-whitespace-type-specifier
                                        xsd::bounded-type-specifier)
    ())
  
  (defClass xsd::universal-time-type-specifier (xsd::pattern-type-specifier
                                                xsd::enumerated-type-specifier
                                                xsd::collapse-whitespace-type-specifier
                                                xsd::bounded-type-specifier)
    ())
  
  
  ;;
  ;; abstract dichotomies
  ;;
  ;; primitive v/s derived
  
  (defClass xsd::derived-type-specifier (xsd::type-specifier)
    ())
  
  (defClass xsd::primitive-type-specifier (xsd::type-specifier)
    ())
  
  ;;
  ;; atomic v/s list v/s union
  
  (defClass xsd::atomic-type-specifier (xsd::type-specifier)
    ())
  
  (defClass xsd::list-type-specifier (xsd::sequence-type-specifier
                                      xsd::derived-type-specifier)
    ((element-type :initarg :element-type :initform '{xsd}anyType
                   :writer (setf type.element-type))))
  (defMethod type.element-type ((spec xsd::list-type-specifier))
    (with-slots (element-type) spec
      (etypecase element-type
        (xsd::type-specifier element-type)
        (symbol (if (eq element-type t)
                  t
                  (setf element-type (find-type element-type))))
        (abstract-name (setf element-type (find-type element-type)))
        (cons (let* ((prototype (find-type (first element-type)))
                     (new-spec (clone-type-specifier prototype)))
                (apply #'reinitialize-instance new-spec (rest element-type))
                (setf element-type new-spec))))))
  
  (defClass xsd::union-type-specifier (xsd::derived-type-specifier)
    ())
  
  ;;
  ;; built-in v/s user-derived
  
  (defClass xsd::builtin-type-specifier (xsd::type-specifier)
    ())
  
  (defClass xsd::user-derived-type-specifier (xsd::type-specifier)
    ())
  
  (defClass xsd::complex-type-specifier (xsd::type-specifier)
    ())
  
  
  
  ;; ...
  
  (defClass xsd::primitive-atomic-builtin-type-specifier
    (xsd::primitive-type-specifier xsd::atomic-type-specifier xsd::builtin-type-specifier)
    ())
  
  (defClass xsd::derived-atomic-builtin-type-specifier
    (xsd::derived-type-specifier xsd::atomic-type-specifier xsd::builtin-type-specifier)
    ())
  
  (defClass xsd::derived-list-builtin-type-specifier
    (xsd::list-type-specifier xsd::builtin-type-specifier)
    ())
  
  (defClass xsd::complex-builtin-type-specifier
    (xsd::complex-type-specifier xsd::builtin-type-specifier)
    ())
  
  
  ;;
  ;;
  
  
  (defun find-type (name &optional (errorp t))
    (or (etypecase *xschema-types*
          (hash-table (gethash name *xschema-types*))
          (cons (or (gethash name (first *xschema-types*))
                    (gethash name (rest *xschema-types*)))))
        (when errorp
          (error "type definition not found: ~s." name))))
  (defun (setf find-type) (type name)
    (etypecase *xschema-types*
      (hash-table (setf (gethash name *xschema-types*) type))
      (cons (setf (gethash name (first *xschema-types*)) type))))
  
  (defMethod type.direct-supertypes
             ((type xsd::type-specifier))
    (with-slots (direct-supertypes resolved) type
      (cond (resolved
             direct-supertypes)
            (t
             (setf direct-supertypes
                   (mapcar #'(lambda (supertype)
                               (etypecase supertype
                                 (xsd::type-specifier)
                                 (name (setf supertype (find-type supertype))))
                               (pushnew type (type.direct-subtypes supertype))
                               supertype)
                           direct-supertypes))
             (setf resolved t)
             direct-supertypes))))
  
  (defun define-type (name supertypes class &rest initargs
                           &aux (type (find-type name nil)))
    (cond (type
           (when (typep type 'xsd::builtin-type-specifier)
             (unless (subtypep class 'xsd::builtin-type-specifier)
               (error "redefinition of builtin type not allowed: ~s." name)))
           (with-slots (direct-supertypes resolved) type
             (when resolved
               (dolist (supertype (type.direct-supertypes type))
                 (setf (type.direct-subtypes supertype)
                       (remove type (type.direct-subtypes supertype))))
               (setf resolved nil))
             (apply #'reinitialize-instance type :direct-supertypes supertypes
                    initargs)))
          (t
           (setf type (apply #'make-instance class :name name
                             :direct-supertypes supertypes
                             initargs))
           (setf (find-type name) type)))
    type)
  
  )
;;
;; validation operators

(defMethod validate-properties
           ((def list) (elem elem-node))
  (dolist (attr-def def)
    (unless (find-if #'(lambda (attr-node)
                         (apply #'xsd:|IS-attribute| attr-node attr-def))
                     (attributes elem))
      (return nil))))

(defGeneric xsd:validate-name (name constraints)
  (:method ((name t) (constraints t)) nil)
  (:method ((name symbol) (constraints null)) t)
  (:method ((name abstract-name) (constraints null)) t)
  (:method ((name symbol) (constraints (eql *wild-uname*))) t)
  (:method ((name abstract-name) (constraints (eql *wild-uname*))) t)
  (:method ((name symbol) (constraint symbol))
           (cond ((eq name constraint) t)
                 ((eq (namespace constraint) *wild-namespace*)
                  (string-equal (local-part name) constraint))
                 ((string= (local-part constraint) "*")
                  (eq (namespace name) (namespace constraint)))
                 (t nil)))
  (:method ((name symbol) (constraint string))
           (equal (symbol-name name) constraint))
  (:method ((name abstract-name) (constraint abstract-name))
           (cond ((eq name constraint) t)
                 ((eq (namespace constraint) *wild-namespace*)
                  (string-equal (local-part name) (local-part constraint)))
                 ((string= (local-part constraint) "*")
                  (eq (namespace name) (namespace constraint)))
                 (t nil)))
  (:method ((name abstract-name) (constraint string))
           (equal (local-part name) constraint))
  (:method ((name symbol) (constraints cons))
           (dolist (constraint (if (eq (first constraints) 'or)
                                 (rest constraints) constraints)
                               t)
             (unless (xsd:validate-name name constraint) (return nil))))
  (:method ((name abstract-name) (constraints cons))
           (dolist (constraint (if (eq (first constraints) 'or)
                                 (rest constraints) constraints)
                               t)
             (unless (xsd:validate-name name constraint) (return nil)))))

(defGeneric xsd:validate-string (string constraints)
  (:method ((string t) (constraints t)) nil)
  (:method ((string string) (constriants null)) t)
  (:method ((string string) (constraints (eql *wild-name*))) t)
  (:method ((string string) (constraint string))
           (warn "string expressions not supported: ~s." constraint)
           t))



;;
;;
;; types
;; nb. the order follows that of xmlschema-2 (datatypes)

(defMacro defTypeClass (name supertypes facets &rest options
                             &aux metatype class-name)
  (when (setf metatype (rest (assoc :metatype options)))
    (setf options (remove :metatype options :key #'first)))
  (setf class-name (intern (local-part name) "XSD"))
  `(eval-when (:load-toplevel :execute :compile-toplevel)
     (defClass ,class-name
       ,(or metatype '(xsd::builtin-atomic-type-specifier))
       ((direct-supertypes :initform ',supertypes)
        ,@facets)
       ,@options)
     (defun ,class-name (&rest args)
       (apply #'make-instance ',class-name args))
     (defParameter ,class-name (setf (find-type ',name)
                                     (make-instance ',class-name)))))

;;
;; abstract types

(defTypeClass {xsd}anyType ()
  ()
  (:metatype xsd::builtin-type-specifier))

(defTypeClass {xsd}anySimpleType ({xsd}anyType)
  ()
  (:metatype xsd::builtin-type-specifier))

(defTypeClass {xsd}anyListType ({xsd}anyType)
  ()
  (:metatype xsd::derived-list-builtin-type-specifier))

(defTypeClass {xsd}anyComplexType ({xsd}anyType)
  ()
  (:metatype xsd::builtin-type-specifier))

(defTypeClass {xsd}anyTreeType ({xsd}anyComplexType)
  ()
  (:metatype xsd::builtin-type-specifier))

;;
;; primitive types

(defTypeClass {xsd}anyURI ({xsd}anySimpleType)
  ()
  (:metatype xsd::sequence-type-specifier
             xsd::pattern-type-specifier xsd::enumerated-type-specifier
             xsd::collapse-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}string ({xsd}anySimpleType)
  ()
  (:metatype xsd::sequence-type-specifier
             xsd::pattern-type-specifier xsd::enumerated-type-specifier
             xsd::preserve-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}boolean ({xsd}anySimpleType)
  ()
  (:metatype xsd::pattern-type-specifier xsd::collapse-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}decimal ({xsd}anySimpleType)
  ((total-digits :initarg :total-digits :initform nil
                 :accessor type.total-digits)
   (fraction-digits :initarg :fraction-digits :initform nil
                    :accessor type.fraction-digits))
  (:metatype xsd::number-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}element ({xsd}anyComplexType)
  ((reference :initform nil :initarg :reference 
              :documentation
              "a reference to a type definition is used where an element
              declaration refers to another type definition.")
   (name-predicate :initform nil)
   (attribute-model :initform nil :initarg :attribute-model
                    :accessor type.attribute-model)
   (attribute-predicate :initform nil)
   (children :initarg :content-model
             :accessor type.content-model)
   (content-predicate :initform nil))
  (:metatype xsd::user-derived-type-specifier
             xsd::complex-type-specifier
             def-elem-type))

(defTypeClass {xsd}float ({xsd}anySimpleType)
  ()
  (:metatype xsd::number-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}double '({xsd}anySimpleType)
  ()
  (:metatype xsd::number-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}duration ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}dateTime ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}time ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}date ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}gYearMonth ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}gYear ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}gMonthDay ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}gDay ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}gMonth ({xsd}anySimpleType)
  ()
  (:metatype xsd::universal-time-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}hexBinary '({xsd}anySimpleType)
  ()
  (:metatype xsd::sequence-type-specifier
             xsd::pattern-type-specifier xsd::enumerated-type-specifier
             xsd::collapse-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}base64Binary ({xsd}anySimpleType)
  ()
  (:metatype xsd::sequence-type-specifier
             xsd::pattern-type-specifier xsd::enumerated-type-specifier
             xsd::collapse-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

(defTypeClass {xsd}UName ({xsd}anySimpleType)
  ((name-type :initarg :name-type :initform t)
   (uri-type :initarg :uri-type :initform t))
  (:metatype xsd::sequence-type-specifier
             xsd::pattern-type-specifier xsd::enumerated-type-specifier
             xsd::collapse-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier)
  (:documentation
   "the class of type specifiers for universal names.
    nb. the standard naming 'QName' is nonsense; 'UName' is used instead,
    in keeping with the domains present in the query model."))

(defTypeClass {xsd}NOTATION ({xsd}anySimpleType)
  ()
  (:metatype xsd::sequence-type-specifier
             xsd::pattern-type-specifier xsd::enumerated-type-specifier
             xsd::collapse-whitespace-type-specifier
             xsd::primitive-atomic-builtin-type-specifier))

;;
;; derived types

(defTypeClass {xsd}normalizedString ({xsd}string)
  ()
  (:metatype xsd::|string|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}token ({xsd}normalizedString)
  ()
  (:metatype xsd::|normalizedString|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}language ({xsd}token)
  ()
  (:metatype xsd::|token|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}NMTOKEN ({xsd}token)
  ()
  (:metatype xsd::|token|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}NMTOKENS ({xsd}anyListType)
  ((element-type :initform '{xsd}NMTOKEN))
  (:metatype xsd::derived-list-builtin-type-specifier))

(defTypeClass {xsd}Name ({xsd}token)
  ()
  (:metatype xsd::|token|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}NCName ({xsd}Name)
  ()
  (:metatype xsd::|Name|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}ID ({xsd}NCName)
  ()
  (:metatype xsd::|NCName|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}IDREF ({xsd}NCName)
  ()
  (:metatype xsd::|NCName|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}IDREFS ({xsd}anyListType)
  ((element-type :initform '{xsd}IDREF))
  (:metatype xsd::derived-list-builtin-type-specifier))

(defTypeClass {xsd}ENTITY ({xsd}token)
  ()
  (:metatype xsd::|token|
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}ENTITIES ({xsd}anyListType)
  ((element-type :initform '{xsd}ENTITY))
  (:metatype xsd::derived-list-builtin-type-specifier))

(defTypeClass {xsd}integer '({xsd}decimal)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}nonPositiveInteger ({xsd}integer)
  ((max-inclusive :initform 0))
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}negativeInteger ({xsd}nonPositiveInteger)
  ((max-exclusive :initform 0))
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}long ({xsd}integer)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}int ({xsd}long)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}short ({xsd}int)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}byte ({xsd}short)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}nonNegativeInteger ({xsd}integer)
  ((min-inclusive :initform 0))
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}positiveInteger ({xsd}integer)
  ((min-exclusive :initform 0))
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}unsignedLong ({xsd}nonNegativeInteger {xsd}long)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}unsignedInt ({xsd}nonNegativeInteger {xsd}unsignedLong)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}unsignedShort ({xsd}nonNegativeInteger {xsd}unsignedInt)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))

(defTypeClass {xsd}unsignedByte ({xsd}nonNegativeInteger {xsd}unsignedShort)
  ()
  (:metatype xsd::number-type-specifier
             xsd::derived-atomic-builtin-type-specifier))


(defTypeClass {xsd}pi ({xsd}anyComplexType)
  ((name-type :initarg :name-type :initform t)
   (value-type :initarg :value-type :initform t))
  (:metatype xsd::complex-builtin-type-specifier))

(defTypeClass {xsd}attribute ({xsd}anyComplexType)
  ()
  (:metatype xsd::complex-builtin-type-specifier))

(defTypeClass {xsd}comment ({xsd}anyComplexType)
  ()
  (:metatype xsd::complex-builtin-type-specifier))


;;
;;

(defMethod type.attribute-predicate ((spec xsd::|element|))
  (with-slots (attribute-model attribute-predicate reference) spec
    (cond (attribute-predicate)
          ((or (eq attribute-model *wild-name*)
               (eq attribute-model nil)
               (eq attribute-model t))
           (setf attribute-predicate
                 (if reference
                   (type.attribute-predicate reference)
                   #'(lambda (x) (declare (ignore x)) t))))
          (t
           (setf attribute-predicate
                 (if reference
                   (let ((ref-predicate (type.attribute-predicate reference)))
                     #'(lambda (datum)
                         (and (funcall ref-predicate datum)
                              (validate-properties datum attribute-model))))
                   #'(lambda (datum)
                       (validate-properties datum attribute-model))))))))

(defMethod type.content-predicate ((spec xsd::|element|))
  (with-slots (content-model content-predicate reference) spec
    (cond (content-predicate)
          ((or (eq content-model *wild-name*)
               (eq content-model nil)
               (eq content-model t))
           (setf content-predicate
                 (if reference
                   (type.content-predicate reference)
                   #'(lambda (datum) (declare (ignore datum)) t))))
          ((eq content-model *empty-name*)
           (setf content-predicate
                 (if reference
                   (let ((ref-predicate (type.content-predicate reference)))
                     #'(lambda (datum)
                         (and (null (children datum))
                              (funcall ref-predicate datum))))
                   #'(lambda (datum)
                       (null (children datum))))))
          (t
           (setf content-predicate
                 (if reference
                   (let ((ref-predicate (type.content-predicate reference)))
                     #'(lambda (datum)
                         (and (funcall ref-predicate datum)
                              (validate-content datum
                                                (node-validator spec)))))
                    #'(lambda (datum)
                        (validate-content datum
                                          (node-validator spec)))))))))

(defMethod type.name-predicate ((spec xsd::|element|))
  (with-slots (name name-predicate) spec
    (cond (name-predicate)
          (t
           (setf name-predicate
                 #'(lambda (datum)
                     (xsd:validate-name (name datum) name)))))))


;;
;;

(defGeneric clone-type-specifier (type-specifier)
  (:method ((spec xsd::type-specifier) &aux new)
           (setf new (allocate-instance (class-of spec)))
           (setf (slot-value new 'resolved) (slot-value spec 'resolved)
                 (slot-value new 'direct-subtypes) (slot-value spec 'direct-subtypes)
                 (slot-value new 'direct-supertypes) (slot-value spec 'direct-supertypes)
                 (slot-value new 'direct-predicate) (slot-value spec 'direct-predicate)
                 (slot-value new 'predicate) (slot-value spec 'predicate))
           new)
  (:method ((spec xsd::pattern-type-specifier) &aux new)
           (setf new (call-next-method))
           (setf (slot-value new 'pattern) (slot-value spec 'pattern)
                 (slot-value new 'pattern-predicate) (slot-value spec 'pattern-predicate))
           new)
  (:method ((spec xsd::declare-whitespace-type-specifier) &aux new)
           (setf new (call-next-method))
           (setf (slot-value new 'whitespace) (slot-value spec 'whitespace))
           new)
  (:method ((spec xsd::enumerated-type-specifier) &aux new)
           (setf new (call-next-method))
           (setf (slot-value new 'enumeration) (slot-value spec 'enumeration))
           new)
  (:method ((spec xsd::bounded-type-specifier) &aux new)
           (setf new (call-next-method))
           (setf (slot-value new 'min-inclusive) (slot-value spec 'min-inclusive)
                 (slot-value new 'min-exclusive) (slot-value spec 'min-exclusive)
                 (slot-value new 'max-inclusive) (slot-value spec 'max-inclusive)
                 (slot-value new 'max-exclusive) (slot-value spec 'max-exclusive))
           new)
  (:method ((spec xsd::sequence-type-specifier) &aux new)
           (setf new (call-next-method))
           (setf (slot-value new 'length) (slot-value spec 'length)
                 (slot-value new 'min-length) (slot-value spec 'max-length)
                 (slot-value new 'max-length) (slot-value spec 'max-length))
           new)
  (:method ((spec xsd::list-type-specifier) &aux new)
           (setf new (call-next-method))
           (setf (slot-value new 'element-type) (slot-value spec 'element-type))
           new))


(defGeneric test-type-specifier (datum type-specifier)
  (:documentation
   "combine specialized type predicates for individual facets.")
  #-(or scl clisp) (:method-combination and)
  (:method #-(or scl clisp) and ((datum string) (spec xsd::enumerated-type-specifier))
           (with-slots (enumeration) spec
             (or (null enumeration)
                 (find datum enumeration :test #'string=))))
  (:method #-(or scl clisp) and ((datum number) (spec xsd::enumerated-type-specifier))
           (with-slots (enumeration) spec
             (or (null enumeration)
                 (find datum enumeration :test #'=))))
  (:method #-(or scl clisp) and ((datum sequence) (spec xsd::sequence-type-specifier))
           (with-slots (length min-length max-length)
                       spec
             (cond (length
                    (= (length datum) length))
                   ((or min-length max-length)
                    (<= (or min-length (length datum))
                        (length datum)
                        (or max-length (length datum))))
                   (t t))))
  (:method #-(or scl clisp) and ((datum string) (spec xsd::pattern-type-specifier))
           (with-slots (pattern) spec
             (or (null pattern)
                 (funcall (type.pattern-predicate spec) datum))))
  (:method #-(or scl clisp) and ((datum null) (spec xsd::enumerated-type-specifier))
           (with-slots (enumeration) spec
             (or (null enumeration)
                 (find datum enumeration))))
  (:method #-(or scl clisp) and ((datum (eql t)) (spec xsd::enumerated-type-specifier))
           (with-slots (enumeration) spec
             (or (null enumeration)
                 (find datum enumeration))))
  (:method #-(or scl clisp) and ((datum number) (spec xsd::bounded-type-specifier))
           (with-slots (min-inclusive max-inclusive
                            min-exclusive max-exclusive) spec
             (and (cond (min-inclusive (<= min-inclusive datum))
                        (min-exclusive (< min-exclusive datum))
                        (t t))
                  (cond (max-inclusive (>= max-inclusive datum))
                        (max-exclusive (>= max-exclusive datum))
                        (t t)))))
  (:method #-(or scl clisp) and ((datum integer) (spec xsd::|decimal|))
           (with-slots (total-digits fraction-digits) spec
                  (or (null total-digits)
                           (< (ceiling (log datum 10))
                              (if fraction-digits
                                (- total-digits fraction-digits)
                                total-digits)))))
  (:method #-(or scl clisp) and ((datum ratio) (spec xsd::|decimal|))
           (test-type-specifier (float datum) spec))
  (:method #-(or scl clisp) and ((datum float) (spec xsd::|decimal|))
           (test-type-specifier (write-to-string datum) spec))
  (:method #-(or scl clisp) and ((datum string) (spec xsd::|decimal|))
           (with-slots (total-digits fraction-digits) spec
             (cond ((or total-digits fraction-digits)
                    (let* ((position (position #\. datum))
                           (datum-total-digits (length datum))
                           (datum-fraction-digits
                            (if position (- datum-total-digits position) 0)))
                      (and (cond (total-digits
                                  (<= datum-total-digits total-digits))
                                 (t t))
                           (cond (fraction-digits
                                  (<= datum-fraction-digits fraction-digits))
                                 (t t)))))
                   (t t))))
  (:method #-(or scl clisp) and ((datum sequence) (spec xsd::list-type-specifier))
           (let ((element-type (type.element-type spec)))
             (not (find-if (complement #'(lambda (element)
                                           (xsd::typep element element-type)))
                           datum)))))

(defGeneric default-pattern-predicate (type-specifier)
  (:method ((spec xsd::pattern-type-specifier)) #'stringp)
  (:method ((spec xsd::|NCName|)) #'is-ncname)
  (:method ((spec xsd::|NMTOKEN|)) #'is-namechardata)
  (:method ((spec xsd::|normalizedString|))
           #'(lambda (datum)
               (and (stringp datum)
                    (not (find-if #'(lambda (c)
                                      (or (char= c (code-char #x0d))
                                          (char= c (code-char #x0a))
                                          (char= c (code-char #x09))))
                                  datum)))))
  (:method ((spec xsd::|token|))
           #'(lambda (datum &aux (length (length datum)) (space-position -1))
               (and (stringp datum)
                    (when (> length 0)
                      (dotimes (position length
                                         (not (= space-position (1- length))))
                        (when (xml-space? (char datum position))
                          (when (= space-position (1- position))
                            (return))
                          (setf space-position position)))))))
  (:method ((spec xsd::|language|))
           #'(lambda (datum &aux (length (length datum)) (dash-position -1)
                            char)
               (and (stringp datum)
                    (when (> length 0)
                      (dotimes (position length
                                         (not (= dash-position (1- length))))
                        (setf char (char datum position))
                        (cond ((alpha-char-p char) t)
                              ((char= char #\-)
                               (when (= dash-position (1- position))
                                 (return))
                               (setf dash-position position))
                              (t (return))))))))
  (:method ((spec xsd::|base64Binary|))
           #'(lambda (datum)
               (when (stringp datum)
                 (block :test
                   (map nil #'(lambda (c) (unless (< (char-code c) 64)
                                            (return-from :test nil)))
                        datum)
                   t))))
  (:method ((spec xsd::|hexBinary|))
           #'(lambda (datum)
               (when (stringp datum)
                 (block :test
                   (map nil
                        #'(lambda (c)
                            (setf c (char-code c))
                            (unless (or
                                     (and (<= #.(char-code #\0) c)
                                          (<= c #.(char-code #\9)))
                                     (and (<= #.(char-code #\a) c)
                                          (<= c #.(char-code #\f)))
                                     (and (<= #.(char-code #\A) c)
                                          (<= c #.(char-code #\F))))
                              (return-from :test nil)))
                        datum)
                   t)))))

;;
;;
;; type predicates

(defGeneric xsd:typep (object type-specifier)
  (:argument-precedence-order type-specifier object)
  (:method ((datum t) (type-specifier null))
           nil)
  (:method ((datum t) (type-specifier (eql t)))
           t)
  (:method ((datum t) (type-specifier symbol))
           (xsd:typep datum (find-type type-specifier)))
  (:method ((datum t) (type-specifier uname))
           (xsd:typep datum (find-type type-specifier)))
  (:method ((datum t) (type-specifier t))
           nil)

  (:method (datum (type-specifier xsd::|anyType|))
           (xsd:|IS-anyType| datum type-specifier))
  (:method (datum (type-specifier xsd::|anyTreeType|))
           (xsd:|IS-anyTreeType| datum type-specifier))
  (:method (datum (type-specifier xsd::|anyComplexType|))
           (xsd:|IS-anyComplexType| datum type-specifier))
  (:method (datum (type-specifier xsd::|anySimpleType|))
           (xsd:|IS-anySimpleType| datum type-specifier))
  (:method (datum (type-specifier xsd::|attribute|))
           (xsd::|IS-attribute| datum type-specifier))
  (:method (datum (type-specifier xsd::|boolean|))
           (xsd::|IS-boolean| datum type-specifier))
  (:method (datum (type-specifier xsd::|comment|))
           (xsd::|IS-comment| datum type-specifier))
  (:method (datum (type-specifier xsd::|date|))
           (xsd::|IS-date| datum type-specifier))
  (:method (datum (type-specifier xsd::|dateTime|))
           (xsd::|IS-dateTime| datum type-specifier))
  (:method (datum (type-specifier xsd::|decimal|))
           (xsd::|IS-decimal| datum type-specifier))
  (:method (datum (type-specifier xsd::|element|))
           (xsd::|IS-element| datum type-specifier))
  (:method (datum (type-specifier xsd::|float|))
           (xsd::|IS-float| datum type-specifier))
  (:method (datum (type-specifier xsd::|gDay|))
           (xsd::|IS-gDay| datum type-specifier))
  (:method (datum (type-specifier xsd::|gMonth|))
           (xsd::|IS-gMonth| datum type-specifier))
  (:method (datum (type-specifier xsd::|gMonthDay|))
           (xsd::|IS-gMonthDay| datum type-specifier))
  (:method (datum (type-specifier xsd::|gYear|))
           (xsd::|IS-gYear| datum type-specifier))
  (:method (datum (type-specifier xsd::|integer|))
           (xsd::|IS-integer| datum type-specifier))
  (:method (datum (type-specifier xsd::|Name|))
           (xsd::|IS-Name| datum type-specifier))
  (:method (datum (type-specifier xsd::|NCName|))
           (xsd::|IS-NCName| datum type-specifier))
  (:method (datum (type-specifier xsd::|normalizedString|))
           (xsd::|IS-normalizedString| datum type-specifier))
  (:method (datum (type-specifier xsd::|pi|))
           (xsd::|IS-pi| datum type-specifier))
  (:method (datum (type-specifier xsd::|string|))
           (xsd::|IS-string| datum type-specifier))
  (:method (datum (type-specifier xsd::|time|))
           (xsd::|IS-time| datum type-specifier))
  (:method (datum (type-specifier xsd::|UName|))
           (xsd::|IS-UName| datum type-specifier))
  (:method (datum (type-specifier xsd::|anyURI|))
           (xsd::|IS-anyURI| datum type-specifier))
  (:method (datum (type-specifier function))
           (funcall type-specifier datum type-specifier)))

;;
;;
;; base type predicates

(defun xsd:|IS-anyTreeType| (datum &optional type-specifier)
  (cond ((xsd:|IS-scalar| datum) t)
        ((xsd:|IS-element| datum type-specifier) t)
        ((xsd:|IS-attribute| datum type-specifier) t)))

(defun xsd:|IS-anyType| (datum &optional type-specifier)
  (declare (ignore type-specifier))
  (cond ((xsd:|IS-anySimpleType| datum t) t)
        ((xsd:|IS-anyComplexType| datum t) t)))

(defGeneric xsd:|IS-anyURI| (datum type-specifier)
  (:method ((datum uri-ref-value) (spec (eql t))) t)
  (:method ((datum uri) (spec (eql t))) t)
  (:method ((datum uri-ref-value) (spec xsd::|anyURI|))
           (xsd:|IS-anyURI| (name datum) spec))
  (:method ((datum uri) (spec xsd::|anyURI|))
           (xsd:|IS-anyURI| (uri-namestring datum) spec))
  (:method ((datum string) (spec xsd::|anyURI|))
           (test-type-specifier datum spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-attribute| (datum type-specifier)
  (:method ((datum attr-node) (spec (eql t))) t)
  (:method ((datum attr-node) (spec xsd::|attribute|))
           (with-slots (name-type value-type) spec
             (and (xsd:|IS-UName| (name datum) name-type)
                  (xsd:typep (value datum) value-type))))
  (:method ((datum ref-elem-property-node) (spec t))
           (xsd:|IS-attribute| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-base64Binary| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum string-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|base64Binary|))
           (test-type-specifier datum spec))
  (:method ((datum string-value) (spec xsd::|base64Binary|))
           (xsd:|IS-base64Binary| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defun xsd::is-boolean (datum) (xsd::|IS-boolean| datum t))

(defGeneric xsd:|IS-boolean| (datum type-specifier)
  (:method ((datum string) (spec xsd::|boolean|))
           (test-type-specifier datum spec))
  (:method ((datum bool-value) (spec (eql t))) t)
  (:method ((datum bool-value) (spec xsd::|boolean|))
           (test-type-specifier (value datum) spec))
  (:method ((datum null) (spec (eql t))) t)
  (:method ((datum null) (spec xsd::|boolean|))
           (test-type-specifier datum spec))
  (:method ((datum (eql t)) (spec (eql t))) t)
  (:method ((datum (eql t)) (spec xsd::|boolean|))
           (test-type-specifier datum spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-byte| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(signed-byte 8)))
  (:method ((datum integer) (spec xsd::|byte|))
           (and (typep datum '(signed-byte 8))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|byte|))
           (xsd:|IS-byte| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-comment| (datum &optional text)
  (:method ((datum comment-node) &optional text)
           (if text (string= text (value datum)) t))
  (:method ((datum t) &optional text)
           (declare (ignore text))
           nil))

(defun xsd:|IS-anyComplexType| (datum &optional spec)
  (declare (ignore spec))
  (and (listp datum)
       (dolist (datum datum t)
         (unless (xsd:|IS-anyTreeType| datum) (return)))))

(defGeneric xsd:|IS-dateTime| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|dateTime|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-dateTime| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-date| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|date|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-date| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-decimal| (datum type-specifier)
  (:method ((datum rational) (spec (eql t))) t)
  (:method ((datum rational) (spec xsd::|decimal|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-decimal| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-double| (datum type-specifier)
  (:method ((datum double-float) (spec (eql t))) t)
  (:method ((datum double-float) (spec xsd::|double|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|double|))
           (xsd:|IS-double| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-duration| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|duration|))
           ;; this will fail on boundary cases
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|double|))
           (xsd:|IS-double| (value datum) spec))
  (:method ((datum t) (spec t)) nil))
  

(defGeneric xsd:|IS-element| (datum type-specifier)
  (:method ((datum elem-node) (spec (eql t))) t)
  (:method ((datum elem-node) (spec xsd::|element|))
           (and (funcall (type.name-predicate spec) datum)
                (funcall (type.attribute-predicate spec) datum)
                (funcall (type.content-predicate spec) datum)))
  (:method ((datum ref-elem-node) (spec t))
           (xsd:|IS-element| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-ENTITY| (datum type-specifier)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec (eql t))) t)
  (:method ((datum symbol) (type xsd::|ENTITY|))
           (test-type-specifier (symbol-name datum) type))
  (:method ((datum abstract-name) (type xsd::|ENTITY|))
           (test-type-specifier (local-part datum) type))
  (:method ((datum string) (type xsd::|ENTITY|))
           (test-type-specifier datum type))
  (:method ((datum entity-attr-node) (spec xsd::|ENTITY|))
           (xsd:|IS-ENTITY| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-ENTITIES| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum nmtokens-attr-node) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|ENTITIES|))
           (xsd:|IS-ENTITIES| (split-string datum #(#\space #\return #\linefeed #\tab))
                              spec))
  (:method ((datum entities-attr-node) (spec xsd::|ENTITIES|))
           (xsd:|IS-NMTOKENS| (value datum) spec))
  (:method ((datum list) (spec xsd::|ENTITIES|))
           (test-type-specifier datum spec))
  (:method ((datum t) (spec t)) nil))

;; nb. allegro does not support short-float
(defGeneric xsd:|IS-float| (datum type-specifier)
  (:method ((datum float) (spec (eql t))) t)
  (:method ((datum float) (spec xsd::|float|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|float|))
           (xsd:|IS-float| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-gDay| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|gDay|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-gDay| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-gMonth| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|gMonth|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-gMonth| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-gMonthDay| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|gMonthDay|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-gMonthDay| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-gYear| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|gYear|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-gYear| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-hexBinary| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum string-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|hexBinary|))
           (test-type-specifier datum spec))
  (:method ((datum string-value) (spec xsd::|hexBinary|))
           (xsd:|IS-hexBinary| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-ID| (datum type-specifier)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec (eql t))) t)
  (:method ((datum symbol) (type xsd::|ID|))
           (test-type-specifier (symbol-name datum) type))
  (:method ((datum abstract-name) (type xsd::|ID|))
           (test-type-specifier (local-part datum) type))
  (:method ((datum string) (type xsd::|ID|))
           (test-type-specifier datum type))
  (:method ((datum id-attr-node) (spec xsd::|ID|))
           (xsd:|IS-ID| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-IDREF| (datum type-specifier)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec (eql t))) t)
  (:method ((datum symbol) (type xsd::|IDREF|))
           (test-type-specifier (symbol-name datum) type))
  (:method ((datum abstract-name) (type xsd::|IDREF|))
           (test-type-specifier (local-part datum) type))
  (:method ((datum string) (type xsd::|IDREF|))
           (test-type-specifier datum type))
  (:method ((datum id-ref-attr-node) (spec xsd::|IDREF|))
           (xsd:|IS-IDREF| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-IDREFS| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum nmtokens-attr-node) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|IDREFS|))
           (xsd:|IS-IDREFS| (split-string datum #(#\space #\return #\linefeed #\tab))
                              spec))
  (:method ((datum id-refs-attr-node) (spec xsd::|IDREFS|))
           (xsd:|IS-NMTOKENS| (value datum) spec))
  (:method ((datum list) (spec xsd::|IDREFS|))
           (test-type-specifier datum spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-int| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(signed-byte 32)))
  (:method ((datum integer) (spec xsd::|int|))
           (and (typep datum '(signed-byte 32))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|int|))
           (xsd:|IS-int| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-integer| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|integer|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|integer|))
           (xsd:|IS-integer| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-language| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum string-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|language|))
           (test-type-specifier datum spec))
  (:method ((datum string-value) (spec xsd::|language|))
           (xsd:|IS-language| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-long| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(signed-byte 64)))
  (:method ((datum integer) (spec xsd::|long|))
           (and (typep datum '(signed-byte 64))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|long|))
           (xsd:|IS-long| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-Name| (datum type-specifier)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec xsd::|Name|))
           (test-type-specifier (local-part datum) spec))
  (:method ((datum t) (spec (eql t))) nil))

(defGeneric xsd:|IS-NCName| (datum type-specifier)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec (eql t))) t)
  (:method ((datum symbol) (type xsd::|NCName|))
           (test-type-specifier (symbol-name datum) type))
  (:method ((datum abstract-name) (type xsd::|NCName|))
           (test-type-specifier (local-part datum) type))
  (:method ((datum string) (type xsd::|NCName|))
           (test-type-specifier datum type))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-negativeInteger| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (not (plusp datum)))
  (:method ((datum integer) (spec xsd::|negativeInteger|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|negativeInteger|))
           (xsd:|IS-negativeInteger| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-NMTOKEN| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum nmtoken-attr-node) (spec (eql t))) t)
  (:method ((datum abstract-name) (spec (eql t))) t)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|NMTOKEN|))
           (test-type-specifier datum spec))
  (:method ((datum nmtoken-attr-node) (spec xsd::|NMTOKEN|))
           (xsd:|IS-NMTOKEN| (value datum) spec))
  (:method ((datum abstract-name) (spec xsd::|NMTOKEN|))
           (test-type-specifier (local-part datum) spec))
  (:method ((datum symbol) (spec xsd::|NMTOKEN|))
           (test-type-specifier (symbol-name datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-NMTOKENS| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum nmtokens-attr-node) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|NMTOKENS|))
           (xsd:|IS-NMTOKENS| (split-string datum #(#\space #\return #\linefeed #\tab))
                              spec))
  (:method ((datum nmtokens-attr-node) (spec xsd::|NMTOKENS|))
           (xsd:|IS-NMTOKENS| (value datum) spec))
  (:method ((datum list) (spec xsd::|NMTOKENS|))
           (test-type-specifier datum spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-nonNegativeInteger| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (not (plusp datum)))
  (:method ((datum integer) (spec xsd::|nonNegativeInteger|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|nonNegativeInteger|))
           (xsd:|IS-nonNegativeInteger| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-nonPositiveInteger| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (not (plusp datum)))
  (:method ((datum integer) (spec xsd::|nonPositiveInteger|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|nonPositiveInteger|))
           (xsd:|IS-nonPositiveInteger| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-normalizedString| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum string-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|normalizedString|))
           (test-type-specifier datum spec))
  (:method ((datum string-value) (spec xsd::|normalizedString|))
           (xsd:|IS-normalizedString| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-NOTATION| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum notation-attr-node) (spec (eql t))) t)
  (:method ((datum notation-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|NOTATION|))
           (test-type-specifier datum spec))
  (:method ((datum notation-attr-node) (spec xsd::|NOTATION|))
           (test-type-specifier (value datum) spec))
  (:method ((datum notation-value) (spec xsd::|NOTATION|))
           (test-type-specifier (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-pi| (datum type-specifier)
  (:method ((datum pi-node) (spec (eql t))) t)
  (:method ((datum pi-node) (spec xsd::|pi|))
           (with-slots (name-type value-type) spec
             (and (xsd::|IS-NCName| (name datum) name-type)
                  (xsd::|IS-string| (value datum) value-type))))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-positiveInteger| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (not (plusp datum)))
  (:method ((datum integer) (spec xsd::|positiveInteger|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec xsd::|positiveInteger|))
           (xsd:|IS-positiveInteger| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defun xsd:|IS-scalar| (datum &optional type-specifier)
  (declare (ignore type-specifier))
  (or (xsd:|IS-boolean| datum t)
      (xsd:|IS-integer| datum t)
      (xsd:|IS-float| datum t)
      (xsd:|IS-string| datum t)
      (xsd:|IS-anyURI| datum t)))

(defGeneric xsd:|IS-short| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(signed-byte 16)))
  (:method ((datum integer) (spec xsd::|short|))
           (and (typep datum '(signed-byte 16))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|short|))
           (xsd:|IS-short| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defun xsd:|IS-anySimpleType| (datum &optional type-specifier)
  (declare (ignore type-specifier))
  (or (xsd:|IS-scalar| datum)
      (and (listp datum)
           (dolist (element datum t)
             (unless (xsd:|IS-scalar| element) (return))))))

(defGeneric xsd:|IS-string| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum string-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|string|))
           (test-type-specifier datum spec))
  (:method ((datum string-value) (spec xsd::|string|))
           (xsd:|IS-string| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-time| (datum type-specifier)
  (:method ((datum integer) (spec (eql t))) t)
  (:method ((datum integer) (spec xsd::|time|))
           (test-type-specifier datum spec))
  (:method ((datum number-value) (spec t))
           (xsd:|IS-time| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-token| (datum type-specifier)
  (:method ((datum string) (spec (eql t))) t)
  (:method ((datum string-value) (spec (eql t))) t)
  (:method ((datum string) (spec xsd::|token|))
           (test-type-specifier datum spec))
  (:method ((datum string-value) (spec xsd::|token|))
           (xsd:|IS-token| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-UName| (datum type-specifier)
  (:method ((datum symbol) (spec (eql t))) t)
  (:method ((datum uname) (spec (eql t))) t)
  (:method ((datum symbol) (spec xsd::|UName|))
           (with-slots (name-type uri-type) spec
             (and (xsd:|IS-NCName| (symbol-name datum) name-type)
                  (xsd:|IS-anyURI| (package-name (symbol-package datum))
                                   uri-type))))
  (:method ((datum uname) (spec xsd::|UName|))
           (with-slots (name-type uri-type) spec
             (and (xsd:|IS-NCName| (local-part datum) name-type)
                  (xsd:|IS-anyURI| (namespace-name datum) uri-type))))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-unsignedByte| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(unsigned-byte 8)))
  (:method ((datum integer) (spec xsd::|unsignedByte|))
           (and (typep datum '(unsigned-byte 8))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|unsignedByte|))
           (xsd:|IS-unsignedByte| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-unsignedInt| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (not (plusp datum)))
  (:method ((datum integer) (spec xsd::|unsignedInt|))
           (and (typep datum '(unsigned-byte 32))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|unsignedInt|))
           (xsd:|IS-unsignedInt| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-unsignedLong| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(unsigned-byte 64)))
  (:method ((datum integer) (spec xsd::|unsignedLong|))
           (and (typep datum '(signed-byte 64))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|unsignedLong|))
           (xsd:|IS-unsignedLong| (value datum) spec))
  (:method ((datum t) (spec t)) nil))

(defGeneric xsd:|IS-unsignedShort| (datum type-specifier)
  (:method ((datum integer) (spec (eql t)))
           (typep datum '(unsigned-byte 16)))
  (:method ((datum integer) (spec xsd::|unsignedShort|))
           (and (typep datum '(unsigned-byte 16))
                (test-type-specifier datum spec)))
  (:method ((datum number-value) (spec xsd::|unsignedShort|))
           (xsd:|IS-unsignedShort| (value datum) spec))
  (:method ((datum t) (spec t)) nil))


:EOF
