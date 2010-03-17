;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  this file implements namespaces and defines the constructors to be used for the
  name form specified by the xml-symbols conditionalizer. name instance and property-access
  definitions are defined for both symbols and name instances - the programming interface
  only is optionally generated.</DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010714'>namespace/package distinction</DELTA>
  <DELTA DATE='20010723'>escape syntax for name reader</DELTA>
  <DELTA DATE='20010810'>broadened to include limited parallel instance and symbol definitions.
   </DELTA>
  <DELTA DATE='20010917' AUTHOR='SK'>#. removed from reader macro for '{' for acl-6.0.1</DELTA>
  <DELTA DATE='20011203' AUTHOR='JAA'>added <code>make-load-form</code> for <code>uname</code>
   instances.</DELTA>
  <DELTA DATE='20020116'>names for nameset-tokenizers now accessed with name method</DELTA>
  <DELTA DATE='20030320'>0.950 additions for conditions for cmucl</DELTA>
  <DELTA DATE='20030407'>qname-equal corrections for qname/uname; corrections to use-namespace and
   import-from-namespace; definitions for schema namespaces.</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20030816'>clisp: single reader macro return value only</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :xml-query-data-model)

(declaim (special *null-namespace-name* *null-namespace* *default-namespace*))

(defparameter *namespace-dictionary* nil
  "binds additional, document-specific, aliases for namespaces as an a-list.
   where an alternative name/ alias is registered, it will be used in addition to
   the packages proper name / nicknames and preferred when serializing.")


;;;
;;; types

(deftype namespace () '(or package nameset nameset-tokenizer))
(defun is-namespace (x) (typep x 'namespace))
(deftype name () '(or (and symbol (not null)) abstract-name))
(defun is-name (x) (typep x 'name))


;;;
;;; generic definitions for namespace functions


(defgeneric namespaces (datum) )
(defgeneric (setf namespaces) (namespaces datum))

(defgeneric print-qname (stream symbol &rest args)
  (:method ((stream stream) (symbol symbol) &rest args)
           (declare (ignore args))
           (let ((prefix (prefix symbol))
                 (namespace (namespace-name symbol))
                 (extent (qname-extent symbol)))
             (etypecase namespace
               (package (setf namespace (namespace-name namespace)))
               (null t)
               (string t))
             (if namespace
               (format stream "{~a}~a" namespace symbol)
               (format stream "#~@[~a:~]~a" prefix symbol))
             (when extent
               (format stream "[~a]" extent))
             symbol))
  (:method ((symbol symbol) (stream stream) &rest args)
           (declare (dynamic-extent args))
           (apply #'print-qname stream symbol args))
  (:method ((stream stream) (datum t) &rest args)
           (declare (ignore args))
           (prin1 datum stream))
  (:method ((datum t) (stream stream) &rest args)
           (declare (ignore args))
           (prin1 datum stream))
  (:documentation
   "prints a symbol together with its qualified-name properties"))


(defun format-name (arg1 arg2 &rest args)
  (declare (ignore args))
  (print-qname arg1 arg2))

(defparameter *qname-extent* nil
  "binds a generated identifier for each physical entity.
   used to partition qualified name extents.")

(defun new-qname-extent (&aux (context (or *qname-extent* "QE")))
  (gensym (concatenate 'string (string context) ".")))

(defun qname-extent-equal (e1 e2 &aux length)
  (setf e1 (string e1)
        e2 (string e2)
        length (min (length e1) (length e2)))
  (string= e1 e2 :end1 length :end2 length))


;; definitions for names specific to non-symbol names

(defclass nameset ()
  ((name :initarg :name :reader name)
   (names :initform (make-hash-table :test #'equalp) :reader namespace.names)
   (nicknames :initform nil :initarg :nicknames :reader namespace.nicknames)
   (use :initform nil :initarg :use :reader namespace.use)
   (export :initform nil :initarg :export :reader namespace.export)
   (static :initform t :initarg :static :accessor namespace.is-static)))

(defStruct (nameset-tokenizer (:include tk1::tokenizer) (:conc-name tokenizer-)
                              (:constructor %make-nameset-tokenizer))
  (nicknames nil)
  (printname nil)
  (use nil)
  (export nil)
  (is-static t :type (member t nil)))

(defmethod namespace-printname ((tokenizer nameset-tokenizer)) (tokenizer-printname tokenizer))

(defmethod name ((namespace nameset-tokenizer)) (tk1::tokenizer-name namespace))

(defmethod name ((namespace package)) (package-name namespace))

(defun make-nameset-tokenizer (&key name nicknames use export intern (static t) (is-static static)
                                    printname &aux tokenizer)
  (multiple-value-bind (modulus rehash-size) 
                       (tk1::select-table-size  tk1::*default-tokenizer-size*)
    (setf tokenizer
          (%make-nameset-tokenizer
           :name name :nicknames nicknames
           :printname printname 
           :modulus modulus
           :table (tk1::allocate-table modulus)
           :mask (tk1::compute-mask #'string=)
           :function #'subseq
           :rehash-size rehash-size
           :is-static is-static
           :lock (www-utils::make-lock name :type :multiple-reader-single-writer)))
    
    (dolist (local-part intern)
      (intern-name local-part tokenizer))
    (setf (tokenizer-export tokenizer)
          (mapcar #'(lambda (local-part) (intern-name local-part tokenizer))
                  export))
    (use-namespace use tokenizer)
    tokenizer))

    


(defclass abstract-name ()
  ((prefix :initform nil :type (or null string)
           :documentation
           "binds the prefix used for the first qname which resolved to a given universal name.
            the reader is an explicit method which implements an optional lookup for u-names
            which bind no explicit prefix.")
   (local-part :initform nil :initarg :local-part :reader local-part :type (or null string))
   (namespace :initform nil :initarg :namespace :reader namespace))
  (:documentation
   "the class of universal names."))

(defmethod initialize-instance :after ((instance abstract-name) &key prefix)
  (setf (prefix instance) prefix))

(defclass uname (abstract-name) ())

(defclass qname (abstract-name)
  ((qname-extent :initform nil :initarg :qname-extent :accessor qname-extent)
   (content-name-type-name :initform nil :accessor content-name-type-name)
   (type-name-content-names :initform nil :accessor type-name-content-names))
  (:documentation
   "the class of qualified names. note that these specialize abstract name, which affords them
    a namespace property. this is permits assignment during the qname->uname resolution process
    prior to replacement with the ultimate uname."))

(defmethod print-object ((object abstract-name) stream)
  (if *print-pretty*
    (print-qname stream object)
    (print-unreadable-object (object stream :type t)
      (print-qname stream object))))

(defmethod make-load-form #-(or ANSI-CL Draft-ANSI-CL-2) ((instance uname))
                          #+(or ANSI-CL Draft-ANSI-CL-2) ((instance uname) &optional environment)
  #+(or ANSI-CL Draft-ANSI-CL-2) (declare (ignore environment))
  (with-slots (prefix local-part namespace) instance
    (values `(intern-name ,local-part ,(namespace-name namespace))
            `(setf (prefix ,instance) ,prefix))))

(defmethod bnfp::bnf-namestring ((datum abstract-name)) (local-part datum))
(defmethod bnfp::name= ((name1 abstract-name) (name2 t)) (bnfp::name= (local-part name1) name2))
(defmethod bnfp::name= ((name1 t) (name2 abstract-name)) (bnfp::name= name1 (local-part name2)))
(defmethod bnfp::name-lessp ((name1 abstract-name) (name2 t)) (bnfp::name-lessp (local-part name1) name2))
(defmethod bnfp::name-lessp ((name1 t) (name2 abstract-name)) (bnfp::name-lessp name1 (local-part name2)))

(defparameter *class.uname* 'uname)
(defparameter *class.qname* 'qname)
(defparameter *class.namespace* 'nameset)
(defparameter *namespace-mode* :use
  "specify how to treat an existing namespace. the default for operations outseide of a document
   is to use the static instance. within a document the mode is rebound to :copy, which
   creates local versions of any static space.")



;; generic definitions for both symbol and name instance implementations

(defgeneric namespace (datum)
  (:method ((value symbol)) (symbol-package value)))

(defgeneric namespace-name (namespace)
  (:method  ((value symbol) &aux (package (symbol-package value)))
    (if package (namespace-name package) (get value :namespace)))
  (:method ((namespace package))
    (declare (special *namespace-dictionary*))
    (or (first (rassoc namespace *namespace-dictionary*))
        (when (eq namespace *null-namespace*) *null-namespace-name*)
        (package-name namespace)))
  (:method ((value abstract-name) &aux (namespace (namespace value)))
    (if namespace (namespace-name namespace)))
  (:method ((namespace nameset))
    (declare (special *namespace-dictionary*))
    (or (when (eq namespace *null-namespace*) *null-namespace-name*)
        (first (rassoc namespace *namespace-dictionary*))
        (name namespace)))
  (:method ((namespace nameset-tokenizer))
           (declare (special *namespace-dictionary*))
           (or (when (eq namespace *null-namespace*) *null-namespace-name*)
               (first (rassoc namespace *namespace-dictionary*))
               (name namespace)))
  (:documentation
   "this method is from the infoset spec. it is suspect. for elements
    and attributes it returns the name of the namespace as it
    suggests. for an ns-node it returns the value of the node and nothing
    which has to do with its name as the name 'has' no namespace."))

(defgeneric (setf namespace-name) (namespace-name datum)
  (:documentation
   "method used during namespace propagation to assert the inferred namespace name.
    checks for conflicting constraints.")
  (:method  ((namespace-name string) (value symbol))
            (if (symbol-package value)
              (unless (eq (find-package namespace-name) (symbol-package value))
                (error "namespace already fixed: ~s." value))
              (setf (get value :namespace) namespace-name)))
  (:method ((namespace-name string) (value abstract-name))
           (if (namespace value)
             (unless (string= namespace-name (namespace-name value))
               (error "namespace already fixed: ~s." value))
             (setf (slot-value value 'namespace) (find-namespace namespace-name)))
	   namespace-name))

(defgeneric (setf namespace) (namespace datum)
  (:documentation
   "method used ti cache the namespace instance in name instances.
    does not applied to symbol form of names.")
  (:method ((namespace nameset) (name abstract-name))
           (setf (slot-value name 'namespace) namespace))
  (:method ((namespace nameset-tokenizer) (name abstract-name))
           (setf (slot-value name 'namespace) namespace))
  (:method ((namespace-name string) (value abstract-name))
           (if (namespace value)
             (unless (string= namespace-name (namespace-name value))
               (error "namespace already fixed: ~s." value))
             (setf (slot-value value 'namespace) (find-namespace namespace-name)))))
  
(defun namespace-equal (ns1 ns2)
  "provides support for equality among ephemeral namespaces when serializing, under which circumstances
    the looser name equality applies instead of strict eq-equality."
  (when ns1
    (or (eq ns1 ns2)
        (equal (namespace-name ns1) (namespace-name ns2)))))

(defgeneric qname-extent (name)
  (:documentation
   "retrieve the noted extent at the point a name parsed.")
  (:method ((name symbol)) (get name :qname-extent))
  (:method ((name abstract-name)) nil))

(defgeneric (setf qname-extent) (extent name)
  (:documentation
   "note the extent active at the point when a name is parsed. this serves for homograph/synonym
    processing.")
  (:method (extent (name symbol))
           (setf (get name :qname-extent) extent))
  (:method (extent (name abstract-name))
           (warn "attempt to set qname extent of an abstract name: ~s: ~s."
                 name extent)))
  
(defgeneric content-name-type-name (name)
  (:documentation "the content-name-type-name is a property of a name which appears in
   a content model. it is the name of the matching element type definition.
   a qname instance has a respective slot, a symbol caches the value on its plist, a uname
   must be identical to the intended value as they appear in the dtd only when all names are
   in the null namespace.")
  (:method ((name symbol))
           (get name :type-name))
  (:method ((name uname))
           name))

(defgeneric (setf content-name-type-name) (type-name name)
  (:method ((type-name symbol) (name symbol))
           (setf (get name :type-name) type-name))
  (:method (type-name (name uname))
           (unless (eq type-name name)
             (error "attempt to set non-identical type-name of an universal name: ~s: ~s."
                    name type-name))
           type-name))

(defgeneric type-name-content-names (name)
  (:documentation "the type-name-content-names is a property of an element definition name.
   it is the setf of names which appear in content models.
   a qname instance has a respective slot, a symbol caches the value on its plist, a uname
   must be identical to the intended values as they appear n the dtd only when all names are
   in the null namespace.")
  (:method ((name symbol))
           (get name :content-names))
  (:method ((name uname))
           (list name)))

(defgeneric (setf type-name-content-names) (content-name name)
  (:method ((content-names list) (name symbol))
           (setf (get name :content-names) content-names))
  (:method (content-names (name uname))
           (when (find name content-names :test (complement #'eq))
             (error "attempt to set non-identical content-names of an universal name: ~s: ~s."
                    name content-names))
           content-names))

(defgeneric prefix (name)
  (:method ((name symbol) &aux package)
           (declare (special *default-namespace-attribute-name*)
                    (ftype (function (t) t) namespace-prefix))
           (or (get name :prefix)
               (if (setf package (symbol-package name))
                 (ignore-errors (namespace-prefix package))
                 *default-namespace-attribute-name*)))
  (:method ((name abstract-name) &aux namespace)
    (declare (special *default-namespace-attribute-name*)
             (ftype (function (t) t) namespace-prefix)) 
    (with-slots (prefix) name
      (or (and (slot-boundp name 'prefix) prefix)
          (if (setf namespace (namespace name))
            (ignore-errors (namespace-prefix namespace))
            *default-namespace-attribute-name*)))))


(defgeneric (setf prefix) (prefix name)
  (:method ((prefix string) (name symbol))
           (setf (get name :prefix) prefix))
  (:method ((prefix null) (name symbol))
           (setf (get name :prefix) prefix))
  (:method ((prefix string) (name abstract-name))
           (setf (slot-value name 'prefix) prefix))
  (:method ((prefix null) (name abstract-name))
           (setf (slot-value name 'prefix) prefix))
  (:method ((prefix symbol) (name t))
           (setf (prefix name) (symbol-name prefix)))
  (:method ((prefix abstract-name) (name t))
           (setf (prefix name) (local-part prefix))))

(defgeneric local-part (x) 
  (:method ((name symbol))
           (or (get name :local-part) (symbol-name name))))

(defgeneric uname-equal (n1 n2)
  (:documentation
   "compare universal names: the interned values should be eq.
    default methods are provided for alternative types.")
  ;;(defmethod uname-equal ((q1 qname-value) (q2 t)) (uname-equal (value q1) q2))
  ;;(defmethod uname-equal ((q1 t) (q2 qname-value)) (uname-equal q1 (value q2)))
  ;;(defmethod uname-equal ((q1 qname-value) (q2 qname-value)) (eq (value q1) (value q2)))
  (:method ((q1 string) (q2 string)) (string= q1 q2))
  (:method ((q1 t) (q2 t)) nil)
  (:method ((q1 null) (q2 null)) nil)
  (:method ((q1 symbol) (q2 symbol)) (eq q1 q2))
  (:method ((u1 abstract-name) (u2 abstract-name)) (eq u1 u2)))

(defgeneric uname-p (name)
  (:method ((object t)) nil)
  (:method ((uname uname)) t)
  (:method ((uname symbol)) (when (get uname :prefix) t)))
  
(defgeneric qname-equal (q1 q2)
  (:documentation
   "compare qualified names: values are equal if eq or, if not yet interned, they can be
    literally equal and in the same qualified name context.
    default methods are provided for alternative types.")
  (:method ((q1 t) (q2 t)) nil)
  (:method ((q1 string) (q2 string)) (string= q1 q2))
  (:method ((q1 symbol) (q2 symbol))
    (declare (special *distinguish-qname-homographs*))
    (declare (optimize (speed 3) (safety 0))
             (type symbol q1 q2))
    ;; true if either they are eq, or at least one is not yet interned
    ;; and the qualified names (prefix:local-part) match
    ;; and they are in the same qname extent
    (if (eq q1 q2)
      t
      (if (and (symbol-package q1) (symbol-package q2))
        nil
        (and (string= (symbol-name q1) (symbol-name q2))
             (eq (prefix q1) (prefix q2))
             ;; when distinguishing homographs, constrain equality by adjoining extents
             ;; otherwise homographs are identical.
             (if *distinguish-qname-homographs*
               (qname-extent-equal (qname-extent q1) (qname-extent q2))
               t)))))
  (:method ((q1 qname) (q2 qname))
    (declare (special *distinguish-qname-homographs*))
    (declare (optimize (speed 3) (safety 0)))
    ;; true if either they are eq, or at least one is not yet interned
    ;; and the qualified names (prefix:local-part) match
    ;; and they are in the same qname extent
    (if (eq q1 q2)
      t
      (if (and (namespace q1) (namespace q2))
        (or (eq (namespace q1) (namespace q2))
            (string= (namespace-name q1) (namespace-name q2)))
        (and (string= (local-part q1) (local-part q2))
             (eq (prefix q1) (prefix q2))
             ;; when distinguishing homographs, constrain equality by adjoining extents
             ;; otherwise homographs are identical.
             (if *distinguish-qname-homographs*
               (qname-extent-equal (qname-extent q1) (qname-extent q2))
               t)))))
  ;; from 0.950
  (:method ((q1 uname) (q2 qname))
           (qname-equal q2 q1))
  (:method ((q1 qname) (q2 uname))
           (declare (special *distinguish-qname-homographs*))
           (declare (optimize (speed 3) (safety 0)))
           ;; true if either they are eq, or at least one is not yet interned
           ;; and the qualified names (prefix:local-part) match
           ;; and they are in the same qname extent
           (if (eq q1 q2)
             t
             (if (and (namespace q1) (namespace q2))
               (namespace-equal (namespace q1) (namespace q2))
               (and (string= (local-part q1) (local-part q2))
                    (local-part-equal (prefix q1) (prefix q2))
                    ;; homographs don't matter, as the uname is interned
                    t)))))

(defgeneric find-name (namestring namespace)
  (:method (namestring (designator symbol))
           (find-name namestring (symbol-name designator)))
  (:method (namestring (namespace string))
           (find-name namestring (find-namespace namespace :if-does-not-exist :error)))
  (:method (namestring (namespace package)) (find-symbol namestring namespace))
  (:method (namestring (namespace nameset)) (gethash namestring (namespace.names namespace)))
  (:method (namestring (namespace nameset-tokenizer)) (tk1::get-token namespace namestring)))

(defgeneric export-names (names namespace)
  (:method (names (namespace package))
           (export names namespace))
  (:method (names (namespace nameset))
           (dolist (name names)
             (unless (eq name (find-name (local-part name) namespace))
               (error "name not present in namespace: ~s: ~s." name namespace)))
           (with-slots (export) namespace
             (dolist (name names)
               (pushnew name export )))
           names)
  (:method (names (namespace nameset-tokenizer))
           (dolist (name names)
             (unless (eq name (find-name (local-part name) namespace))
               (error "name not present in namespace: ~s: ~s." name namespace)))
           (dolist (name names)
             (pushnew name (tokenizer-export namespace)))
           names))

(defmethod namespace.is-static ((tokenizer nameset-tokenizer)) (tokenizer-is-static tokenizer))
(defmethod (setf namespace.is-static) (value (tokenizer nameset-tokenizer))
  (setf (tokenizer-is-static tokenizer) value))
(defmethod namespace.nicknames ((tokenizer nameset-tokenizer)) (tokenizer-nicknames tokenizer))

(defgeneric use-namespace (namespaces-to-use namespace)
  (:method ((use list) (namespace string))
           (use-namespace use (find-namespace namespace :if-does-not-exist :error)))
  (:method ((use list) (namespace package))
           (use-package use namespace))
  (:method ((use list) (namespace nameset))
           (mapc #'(lambda (ns-name &aux ns old-name)
                     (etypecase ns-name
                       (string (setf ns (find-namespace ns-name :if-does-not-exist :error)))
                       (namespace (setf ns ns-name)))
                     (dolist (name (namespace.export ns))
                       (setf old-name (gethash (local-part name) (namespace.names ns)))
                       (when (and old-name (not (eq old-name name)))
                         (error "name already present in namespace: ~s: ~s." (local-part name) namespace))
                       (setf (gethash (local-part name) (namespace.names namespace)) name)))
                 use))
  (:method ((use list) (namespace nameset-tokenizer))
           (mapc #'(lambda (ns-name &aux ns old-name)
            (etypecase ns-name
              (string (setf ns (find-namespace ns-name :if-does-not-exist :error)))
              (namespace (setf ns ns-name)))
            (dolist (name (tokenizer-export ns))
              (setf old-name (find-name (local-part name) ns))
              (when (and old-name (not (eq old-name name)))
                (error "name already present in namespace: ~s: ~s."
                       (local-part name) namespace))
              (tk1::insert-token namespace name (local-part name))))
        use)
           (setf (tokenizer-use namespace) use)))

(defgeneric import-from-namespace (source-namespace namestrings namespace)
  (:method ((source-namespace string) (namestrings t) (namespace t))
           (import-from-namespace (find-namespace source-namespace :if-does-not-exist :error)
                                  namestrings namespace))
  (:method ((source-namespace t) (namestrings list) (namespace package))
           (import (mapcar #'(lambda (local-part)
                                 (or (find-name local-part source-namespace)
                                     (error "name not present in namespace: ~s: ~s."
                                            local-part source-namespace)))
                           namestrings)
                   namespace))
  (:method ((source-namespace t) (namestrings list) (namespace nameset) &aux name)
           (dolist (local-part namestrings)
             (unless (setf name (find-name local-part source-namespace))
               (error "name not present in namespace: ~s: ~s." local-part source-namespace))
             (when (gethash local-part (namespace.names namespace))
               (error "name already present in namespace: ~s: ~s." local-part namespace))
             (setf (gethash local-part (namespace.names namespace)) name)))
  (:method ((source-namespace t) (namestrings list) (namespace nameset-tokenizer) &aux name old)
           (dolist (local-part namestrings)
             (unless (setf name (find-name local-part source-namespace))
               (error "name not present in namespace: ~s: ~s." local-part source-namespace))
             (if (setf old (tk1::get-token namespace local-part))
               (unless (eq old name)
                 (error "name already present in namespace: ~s: ~s." local-part namespace))
               (tk1::insert-token namespace name local-part)))))

;; 0.950 cpompatibility 

(defmethod namespace-printname ((namespace string)) namespace)

(defparameter *package-printnames* nil)

(defmethod namespace-printname ((namespace package))
  (cond ((rest (assoc namespace *package-printnames*)))
        (t
         (let ((printname
                (first (sort (cons (package-name namespace)
                                   (copy-list (package-nicknames namespace)))
                             #'< :key #'length))))
           (unless printname
             (when *xml-verbose*
               (warn "no printname present for package: ~a." namespace)))
           (push (cons namespace printname) *package-printnames*)
           printname))))

(defparameter *constant-prefix-strings* nil
  "binds a list of prefix names which cannot be rebound when |REC-xml-names-19990114.NSC: constant bindings|
   is non-null. this is intended to apply to namespace prefixes such as 'xml' and 'xmlns',
   but could preclude binding any given prefix other than ''.")

(defVar *unbindable-prefix-strings* nil
  "binds a list of prefix names which cannot be rebound when |REC-xml-names-19990114.NSC: constant bindings|
   is non-null. this is intended to apply to namespace prefixes such as 'xml' and 'xmlns',
   but could preclude binding any given prefix other than ''.")

(setq *unbindable-prefix-strings* (list "xmlns"))

(defgeneric constant-prefix-p (datum &optional start end)
  (:method ((string string) &optional (start 0) (end (length string)))
           (find-if #'(lambda (constant-prefix) (string= string constant-prefix :start1 start :end1 end))
                    *constant-prefix-strings*))
  (:method ((datum t) &optional start end) (declare (ignore start end)) nil))

(defgeneric unbindable-prefix-p (string &optional start end)
  (:method ((string string) &optional (start 0) (end (length string)))
           (find-if #'(lambda (constant-prefix) (string= string constant-prefix :start1 start :end1 end))
                    *unbindable-prefix-strings*))
  (:method ((datum t) &optional start end) (declare (ignore start end)) nil))

(defgeneric ns-attribute-name-p (datum)
  (:documentation
   "determine whether the name is in the 'xmlns' namespace.
    the term comprises both prefixed and unprefixed namespace attribute names. it originates in rec-xml-names, production 2.")
  (:method ((name t)) nil))

(defmethod constant-prefix-p
           ((name abstract-name) &optional start end)
  (when (or start end) (warn "ignored: :start ~s, :end ~s." start end))
  (constant-prefix-p (local-part name)))

(defmethod unbindable-prefix-p
           ((name abstract-name) &optional start end)
  (when (or start end) (warn "ignored: :start ~s, :end ~s." start end))
  (unbindable-prefix-p (local-part name)))

(defmethod ns-attribute-name-p
           ((name uname))
  (declare (special *xmlns-namespace*))
  (namespace-equal (namespace name) *xmlns-namespace*))

(defmethod constant-prefix-p
           ((name symbol) &optional start end)
  (when (or start end) (warn "ignored: :start ~s, :end ~s." start end))
  (constant-prefix-p (local-part name)))

(defmethod unbindable-prefix-p
           ((name symbol) &optional start end)
  (when (or start end) (warn "ignored: :start ~s, :end ~s." start end))
  (unbindable-prefix-p (local-part name)))

(defmethod ns-attribute-name-p
           ((name symbol))
  (declare (special *xmlns-namespace*))
  (namespace-equal (namespace name) *xmlns-namespace*))

(defMacro with-namespaces (namespace-definitions &rest body)
  "create namespaces make them available within the form's body."
  `(let ((*namespace-dictionary* *namespace-dictionary*))
     ,@(mapcar #'(lambda (spec) (cons 'defnamespace spec)) namespace-definitions)
     ,@body))


(defun default-namespace ()
  (cond (*default-namespace*
         *default-namespace*)))


(defun (setf default-namespace) (value)
  (cond ((eq value *default-namespace*) value)
        (t
         (setf *default-namespace* (find-namespace value)))))

(defgeneric local-part-equal (n1 n2)
  (:method ((n1 string) (n2 string))
           (string= n1 n2)))

(defmethod local-part-equal
           ((n1 symbol) (n2 symbol))
  (or (eq n1 n2)
      (local-part-equal (symbol-name n1) (symbol-name n2))))

(defmethod local-part-equal
           ((n1 symbol) (n2 t))
  (local-part-equal (symbol-name n1) n2))

(defmethod local-part-equal
           ((n1 t) (n2 symbol))
  (local-part-equal n1 (symbol-name n2)))

(defmethod local-part-equal
           ((n1 abstract-name) (n2 abstract-name))
  (or (eq n1 n2)
      (equal (local-part n1) (local-part n2))))

(defmethod local-part-equal
           ((n1 abstract-name) (n2 t))
           (local-part-equal (local-part n1) n2))

(defmethod local-part-equal
           ((n1 t) (n2 abstract-name))
           (local-part-equal n1 (local-part n2)))


;;;
;;; find operators are oportunistic - they look for both namesets and packages

(defgeneric intern-name (namestring namespace)
  (:method ((namestring t) (namespace package))
    (intern namestring namespace))
  (:method ((namestring t) (namespace nameset-tokenizer))
    (or (tk1::get-token namespace namestring)
        (tk1::insert-token namespace
                           (make-instance *class.uname* :local-part namestring
                                          :namespace namespace)
                           namestring)))
  (:method ((namestring t) (namespace string))
    (intern-name namestring (find-namespace namespace  :if-does-not-exist :error)))
  (:method ((namestring t) (namespace null))
    (intern-name namestring *null-namespace*))
  (:method ((namestring t) (namespace symbol))
    (intern-name namestring (symbol-name namespace))))

(defgeneric find-prefix (prefix context)
  (:method ((prefix t) (namespace package))
    (find-symbol prefix namespace))
  (:method ((prefix t) (namespace nameset-tokenizer))
    (find-name prefix namespace)))

(defgeneric intern-prefix (prefix namespace)
  (:method ((prefix t) (namespace package))
    (intern prefix namespace))
  (:method ((prefix t) (namespace nameset-tokenizer))
    (intern-name prefix namespace)))

(defgeneric intern-type (type-name namespace)
  (:method ((type-name t) (namespace package))
    (intern type-name namespace))
  (:method ((type-name t) (namespace nameset-tokenizer))
    (intern-name type-name namespace)))

(defun find-namespace (name &key (if-does-not-exist :error) (if-exists t)
                            (nicknames nil nicknames-p)
                            &allow-other-keys
                            &aux space)
  "Attempt to locate a namespace, first as a nameset tokeinizer, then as a package."
    (declare (special *namespace-dictionary* *null-namespace* *document*))
    (setf space
          (etypecase name
            (null *null-namespace*)     ; mcl 5.2 likes this order better
            (namespace (let ((was-space name))
                         (setf name (name name))
                         (cond ((rest (assoc name *namespace-dictionary* :test #'string=)))
                               (t
                                (warn "unregistered namespace specified: ~s." was-space)
                                was-space))))
            (string (or (rest (assoc name *namespace-dictionary* :test #'string=))
                        (let ((package (find-package name)))
                          (when package 
                            (warn "unregistered package specified as a namespace: ~s." package))
                          package)))))
    (if space
      (case if-exists
        (:error (error 'internal-xml-error
                       :format-control "Attempt to create a previously defined namespace: ~s"
                       :format-arguments (list name)))
        ((nil) nil)
        (t
         (when (and nicknames-p (typep space 'package))
           (rename-package space name nicknames))
         space))
      (case if-does-not-exist
        ((nil) nil)
        (:create
         (setf space (define-namespace name :nicknames nicknames))
         (dolist (name (namespace.nicknames space))
             (setf *namespace-dictionary* (acons name space *namespace-dictionary*)))
         (setf *namespace-dictionary* (acons name space *namespace-dictionary*))
         (when *document* (push space (namespaces *document*)))
         space)
        (:error
         ;; an attempt to find a namespace which was never bound constitues
         ;; an internal error: the parser should not be able to generate such names absent
         ;; the respective binding.
         (error 'internal-xml-error
                :format-control "Attempt to locate an undefined namespace: ~s"
                :format-arguments (list name))))))

(defgeneric describe-namespace (namespace &optional stream)
    (:method ((name string) &optional (stream *standard-output*)
              &aux (namespace (find-namespace name :if-does-not-exist nil)))
             (cond (namespace (describe-namespace namespace stream))
                   (t (format stream "~&Tokenizer: ~A not found." name))))
    (:method ((namespace nameset-tokenizer)  &optional (stream *standard-output*))
             (tk1::describe-tokenizer namespace stream))
    (:method ((namespace package) &optional (stream *standard-output*))
             (describe namespace stream)))

;; depending on conditionalization, generate name/namespace constructors to use symbols and packages
;; or name instances and nameset or nameset-tokenizer instances.
;; as most look-up functions are generic (see above), the conditionalization applies to the
;; instantiation functions intended to be used by the parser.

#+xml-symbols
(progn
  (defMacro defNamespace (name &rest options)
    `(define-namespace ,name ,@options))
  (defun define-namespace (name &rest options &key (use nil))
    (apply #'make-package name :use use options))
  
  (defMacro make-name (namestring)
    `(make-symbol ,namestring))
  (defun make-qname (namestring &optional prefix &aux name)
    (setf name (make-symbol namestring))
    (when prefix (setf (prefix name) prefix))
    name)

  )

#+(and (not xml-symbols) nameset-tokenizer)
(progn
  ;; this implements namespaces based on tokenizers.
  ;; the tokenizers exist in two forms: either as static namespaces, within which program code
  ;; can define names, or as dynaimcally generated spaces, which are generated by the parser
  ;; at the point of first reference within a document and which exist only so long as the document
  ;; itself.
  (defMacro defnamespace (name &rest options)
    (let ((export (rest (assoc :export options)))
          (intern (rest (assoc :intern options)))
          (nicknames (rest (assoc :nicknames options)))
          (use (rest (assoc :use options)))
          (import-from (mapcar #'rest (remove-if-not #'(lambda (option) (eq (first option)
                                                                            :import-from))
                                                     options))))
      `(define-namespace ,name
                       ,@(when intern `(:intern (list ,@intern)))
                       ,@(when export `(:export (list ,@export)))
                       ,@(when nicknames `(:nicknames (list ,@nicknames)))
                       ,@(when import-from `(:import-from ',import-from))
                       ,@(when use `(:use (list ,@use))))))

  (defun define-namespace (name &key use nicknames intern import-from export printname &aux
                                namespace old-namespace
                                )
    "create a static namespace and register it in the global namespace dictionary."
    (dolist (n nicknames) (assert (stringp n)))
    (mapc #'(lambda (ns-name &aux ns)
              (when (setf ns (find-namespace ns-name :if-does-not-exist nil ))
                (if old-namespace
                  (unless (eq old-namespace ns)
                    (error "namespace exists: ~s." ns-name))
                  (setf old-namespace ns))))
          (cons name nicknames))
    (unless printname
      (setf printname (first (sort (cons name (copy-list nicknames)) #'< :key #'length))))
    (setf namespace (make-nameset-tokenizer :name name :nicknames nicknames
                                            :intern intern
                                            :use use
                                            :printname printname
                                            :export export))
    (flet ((register-space (ns-name &aux ns-binding)
             (cond ((setf ns-binding (assoc ns-name *namespace-dictionary* :test #'string=))
                    (setf (rest ns-binding) namespace))
                   (t
                    (setf *namespace-dictionary*
                          (acons ns-name namespace *namespace-dictionary*))))))
      (mapc #'register-space nicknames)
      (register-space name))

    (mapc #'(lambda (import-spec &aux (ns-name (pop import-spec)))
              (import-from-namespace ns-name import-spec namespace))
            import-from)
    namespace)

  (defMacro make-name (local-part)
    `(make-instance *class.uname* :local-part ,local-part))
  (defMacro make-qname (local-part &optional prefix)
    (if prefix
      `(make-instance *class.qname* :local-part ,local-part :prefix ,prefix)
      `(make-instance *class.qname* :local-part ,local-part)))
  )

;;
;; cmucl encumbers the keyword package with the "" nickname, which lispworks
;; does not allow one to add a nickname

#+(or clisp cmu scl)
(defNamespace "KEYWORD"
  (:nicknames "")
  (:export "xmlns" "document" "lt" "gt" "amp" "quot" "apos"))
#-(or clisp cmu scl)
(defNamespace ""
  (:export "xmlns" "document" "lt" "gt" "amp" "quot" "apos"))
#| clisp expands this for symbols to
(EVAL-WHEN (LOAD COMPILE EVAL) (SYSTEM::%IN-PACKAGE "" :NICKNAMES 'NIL :USE 'NIL)
 (SYSTEM::INTERN-EXPORT '("xmlns" "document" "lt" "gt" "amp" "quot" "apos") "")
 (FIND-PACKAGE ""))
and then reports the error, that there is no package named "".
|#

(defNamespace "*"
  (:export "*"))

(defparameter +xml-namespace-name+ "http://www.w3.org/XML/1998/namespace")

;; esp for lispworks, be careful not to bash the existing package
#+xml-symbols
(import (mapcar #'(lambda (string) (find-symbol string ""))
                '("" "lt" "gt" "amp" "quot" "apos"))
        "xml")
#-xml-symbols
(let ((as-package (find-package "xml")))
  (when as-package                      ; allow this as a package quietly
    (dolist (name (cons (package-name as-package) (package-nicknames as-package)))
      (unless (assoc name *namespace-dictionary* :test #'string=)
        (setf *namespace-dictionary* (acons name as-package *namespace-dictionary*)))))
  (defNamespace "xml"
    (:nicknames +xml-namespace-name+)
    (:import-from "" "lt" "gt" "amp" "quot" "apos")))
;(describe-namespace "xml")

(defNamespace "xmlns"
  ;; don't do this, it would say that {}xmlns == {xmlns}xmlns" which is not true and
  ;; conflicts with {}xmlns == {xmlns}||
  ;; (:import-from "" "xmlns")
  (:nicknames "http://www.w3.org/XML/1998/namespace/xmlns")
  (:export "xmlns" "xml" "" "*"))


(defparameter +xhtml-system-identifier+ "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
(defparameter +xhtml-public-identifier+ "-//W3C//DTD XHTML 1.0 Transitional//EN")
(defparameter +xhtml-namespace-name+ "http://www.w3.org/1999/xhtml")

(defNamespace "xhtml"
  (:nicknames +xhtml-namespace-name+))


(defparameter +xsd-namespace-name+ "http://www.w3.org/2001/XMLSchema-datatypes")

(defnamespace +xsd-namespace-name+
  (:intern)
  (:export "ENTITIES" "ENTITY" "ID" "IDREF" "IDREFS" "NCName"
           "NMTOKEN" "NMTOKENS" "NOTATION" "Name" "QName" "annotation"
           "anyComplexType" "anyListType" "anySimpleType" "anyTreeType"
           "anyType" "anyURI" "attribute" "attributeGroup" "base64Binary"
           "boolean" "byte" "comment" "complexType" "date" "dateTime"
           "decimal" "documentation" "double" "duration" "element" "float"
           "gDay" "gMonth" "gMonthDay" "gYear" "gYearMonth" "hexBinary"
           "int" "integer" "language" "long" "negativeInteger"
           "nonNegativeInteger" "nonPositiveInteger" "normalizedString"
           "pi" "positiveInteger" "restriction" "schema" "short"
           "simpleType" "string" "time" "token" "unsignedByte"
           "unsignedInt" "unsignedLong" "unsignedShort")
  (:use)
  (:nicknames "xsd"))


(defparameter +xs-namespace-name+ "http://www.w3.org/2001/XMLSchema")

(defnamespace +xs-namespace-name+
  (:import-from "http://www.w3.org/2001/XMLSchema-datatypes"
                "ENTITIES" "ENTITY" "ID" "IDREF" "IDREFS" "NCName" "NMTOKEN"
                "NMTOKENS" "NOTATION" "Name" "QName" "annotation"
                "anyComplexType" "anyListType" "anySimpleType" "anyTreeType"
                "anyType" "anyURI" "attribute" "attributeGroup" "base64Binary"
                "boolean" "byte" "comment" "complexType" "date" "dateTime"
                "decimal" "documentation" "double" "duration" "element" "float"
                "gDay" "gMonth" "gMonthDay" "gYear" "gYearMonth" "hexBinary"
                "int" "integer" "language" "long" "negativeInteger"
                "nonNegativeInteger" "nonPositiveInteger" "normalizedString"
                "pi" "positiveInteger" "restriction" "schema" "short"
                "simpleType" "string" "time" "token" "unsignedByte"
                "unsignedInt" "unsignedLong" "unsignedShort")
  (:intern "all" "any" "anyAttribute" "appinfo" "choice"
           "complexContent" "enumeration" "extension" "field"
           "fractionDigits" "group" "import" "include" "key" "keyref"
           "length" "list" "maxExclusive" "maxInclusive" "maxLength"
           "minExclusive" "minInclusive" "minLength" "notation" "pattern"
           "redefine" "selector" "sequence" "simpleContent" "totalDigits"
           "union" "unique" "whiteSpace")
  (:export)
  (:use "xsd")
  (:nicknames "xs"))


(defparameter +xsi-namespace-name+ "http://www.w3.org/2001/XMLSchema-instance")

(defnamespace +xsi-namespace-name+
  (:nicknames "xsi")
  (:export "type"))


(defun |{-reader|
       (stream char
               &aux
               (namespace (make-array 32 :adjustable t :fill-pointer 0 :element-type 'character))
               (local-part (make-array 32 :adjustable t :fill-pointer 0 :element-type 'character)))
  (declare (ftype (function ((or character integer)) t) xml-namechar?))
  ;; read and intern a qname value
  (setf (fill-pointer namespace) 0
        (fill-pointer local-part) 0)
  (loop (setf char (read-char stream))
        (when (char= char #\})
          (setf namespace (or (find-symbol namespace :keyword)
                              (intern (subseq namespace 0) :keyword)))
          (return))
        (vector-push-extend char namespace))
  (cond ((eql #\| (peek-char t stream))
         ;; where explicitly escaped allow non-name characters
         (read-char stream)
         (loop (setf char (read-char stream nil nil))
               (unless char (return))
               (when (eql #\| char)
                 (return))
               (vector-push-extend char local-part)))
        (t
         (loop (setf char (read-char stream nil nil))
               (unless char (return))
               (unless (xml-namechar? char)
                 (unread-char char stream)
                 (return))
               (vector-push-extend char local-part))))
  
  (let ((uname (or (find-name local-part namespace)
                   (intern-name (subseq local-part 0) namespace))))
    (when (and (symbolp uname) (not (get uname :prefix)))
      (setf (prefix uname) namespace))
    uname))

(defun install-|{-reader| ()
  #-clisp
  (set-macro-character #\{ #'|{-reader| t)

  #+clisp
  (progn
    (defun single-value-|{-reader| (stream char &aux result)
      (setf result (|{-reader| stream char))
      result)
    (set-macro-character #\{ #'single-value-|{-reader| t)))

(install-|{-reader|)


; '{xml}qwe  (quote {xml}qwe) '{xml}|| '{xml}|aa aaa|
; (let ((x '{xml}qwe)) (case x (a 'a) ({xml}qwe x) (t nil)))
;(mapc #'describe-namespace '("" "*" "xml" "xmlns" "xhtml" "xsd"))

:EOF


