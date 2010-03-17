;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.names.implementation; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this file provides the basic condition-handling for names.
  the model definition includes additional conditions for document model and
  parsing constraints.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20030110'>isolated from "xml:utils;conditions"</DELTA>
  <DELTA DATE='20030330'>immutable conditions</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.xml.names.implementation)

(define-condition namespace-condition (condition)
  ((namespace :initform nil :initarg :namespace :reader condition-namespace)))

(define-condition namespace-error (namespace-condition continuable-error xml-error )
   ((name :initform nil :initarg :name :reader condition-name)) )

(defMacro def-nsc (name &optional super slots &rest options)
  `(def-exception (,name "NSC") ,(or super '(namespace-error))
     ,slots
     ,@options))

#+digitool
(dolist (sym '(def-nsc))
  (pushnew (cons sym 2) *FRED-SPECIAL-INDENT-ALIST* :key #'first))

;;
;;
;;

(def-nsc "Namespace Full" ()
  ()
  (:default-initargs :continue-format-control "permit addition.")
  (:report-condition
   (lambda (condition stream)
     (format stream "attempt to add name to full namespace: ~s: ~s."
             (condition-namespace condition) (condition-name condition)))))

(def-nsc "Namespace Readonly" ()
  ()
  (:default-initargs :continue-format-control "permit addition.")
  (:report-condition
   (lambda (condition stream)
     (format stream "attempt to add name to read-only namespace: ~s: ~s."
             (condition-namespace condition) (condition-name condition)))))

(def-nsc "Undefined Namespace" ()
  ()
  (:report-condition
   (lambda (condition stream)
     (format stream "Attempt to locate an undefined namespace: ~s."
             (condition-name condition)))))

(def-nsc "Namespace Declared" (namespace-error continuable-parser-error)
  ((continue-format-control :initform "use generated prefix." :allocation :class))
  (:report-condition 
   (lambda (condition stream)
       (format stream "no visible binding for namespace: ~s."
               (condition-namespace condition)))))

(def-nsc "Prefix Declared" (namespace-error continuable-parser-error)
  ((continue-format-control :initform "ascribe name to null namespace." :allocation :class))
  (:report-condition
   (lambda (condition stream)
     (format stream "no visible binding for prefix: ~s."
             (condition-name condition)))))

(def-nsc "Undefined Package" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (format stream "Attempt to locate an undefined package: ~s."
             (condition-name condition)))))


:EOF