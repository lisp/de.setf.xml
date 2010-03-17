;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.node.implementation; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this file provides the basic condition-handling frame work for xml.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20021020'>
   factored conditions relevant to abstract model.</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.xml.node.implementation)

(define-condition graph-condition (condition) ())

(define-condition node-graph-error (graph-condition xml-error) ())

(defMacro def-ngc (name &optional super slots &rest options)
  `(def-exception (,name "NGC") ,(or super '(node-graph-error))
     ,slots
     ,@options))




#+digitool
(dolist (sym '(def-ngc ))
  (pushnew (cons sym 2) *FRED-SPECIAL-INDENT-ALIST* :key #'first))

;;
;;
;; conditions relevant to abstract model




(def-ngc "NCName Required" ()
  ((node :initform nil :initarg :node :reader condition-node))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((node condition-node)) condition
       (format stream "nc-name required for node: ~s." node))))
  (:check (lambda (constraint (instance ncnamed-node))
            (let ((name (name instance)))
              (unless (or (typep name 'name) (typep name 'string))
                (|NGC: NCName Required| :node instance))))))

(defMethod initialize-instance :after
           ((instance ncnamed) &key)
  (check-constraint |NGC: NCName Required| instance))




(def-ngc "QName Required" ()
  ((node :initform nil :initarg :node :reader condition-node))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((node condition-node)) condition
       (typecase node
         (named-node
          (format stream "q-name required for node: ~s." node))
         (t
          (format stream "cannot generate q-name: ~a." node))))))
  (:check (lambda (constraint (instance unamed))
            (let ((name (name instance)))
              (unless (or (typep name 'name) (typep name 'string))
                (|NGC: QName Required| :node instance))))))

(defMethod initialize-instance :after
           ((instance unamed) &key)
  (check-constraint |NGC: QName Required| instance))



(def-ngc "Unique Root Element Required" ()
  ()
  (:check (lambda (constraint (instance document) &aux root&rest)
            (when (or (null (setf root&rest (member-if #'element-p (children instance))))
                      (not (eq (first root&rest) (document-element instance)))
                      (member-if #'element-p (rest root&rest)))
              (|NGC: Unique Root Element Required|
               :format-control "document element required: ~s."
               :format-arguments (list instance))))))

(defMethod (setf children) :after
           ((new-value t) (doc document))
  (check-constraint |NGC: Unique Root Element Required| doc))

(defMethod initialize-instance :after ((instance document)
                                       &key (children nil children-p))
  "when children are specified, then enforce the uniqueness constraint."
  (declare (ignore children))
  (when children-p
    (check-constraint |NGC: Unique Root Element Required| instance)))




:EOF