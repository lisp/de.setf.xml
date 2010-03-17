;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.codec.implementation; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this file provides the condition-handling for names.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20030110'>isolated from "xml:utils;conditions"</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.xml.codec.implementation)

(define-condition encoding-condition (condition) ())

(define-condition encoding-error (encoding-condition xml-error stream-error) ())

(define-condition xml-eof-error (xml-error parser-eof-error) ())

(defun xml-eof-error (&rest args)
  (apply #'xml-error 'xml-eof-error args))

(defMacro def-ec (name &optional super slots &rest options)
  `(def-Exception (,name "EC") ,(or super '(encoding-error))
     ,slots
     ,@options))

#+(and mcl digitool)
(dolist (sym '(defEC))
  (pushnew (cons sym 2) ccl:*FRED-SPECIAL-INDENT-ALIST* :key #'first))

;;
;;
;;

(def-ec "Byte Order Mark" ()
  ((data :initarg :data :initform nil :reader condition-data))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((data condition-data)) condition
       (format stream "Illegal byte order mark: ~s." data)))))

(def-ec "Version Match" ()
  ((name :initarg :name :initform nil :reader condition-name))
  (:report-condition
   (lambda (condition stream)
     (with-accessors ((name condition-name)) condition
       (format stream "Encoding version not supported: ~s." name)))))



:EOF