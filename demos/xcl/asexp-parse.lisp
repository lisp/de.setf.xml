;;; -*- package: de.setf.xcl; Syntax: Common-lisp; Base: 10 -*-

(defPackage :de.setf.xcl
  (:use :common-lisp
        :xqdm :xml-parser :xml-utils))

(in-package :de.setf.xcl)

;; an xmlp-based xcl parser drives the constructs annotated s-expressions based
;; on inline parser construction operations 

(defun make-asexp-xmlp-parser (&key args)
  (apply #'make-instance 'asexp-construction-context args))


;;
;;
;; the top-level parse function

(defun parse-asexp (source &rest args
                          &key (construction-context (make-asexp-xmlp-parser)))
  "parse a document source as an xml-encoded common-logic expression"
  (apply #'xmlp:document-parser source
         :construction-context construction-context
         args))

#|
(parse-asexp "<asdf>testing</asdf>")

|#

:EOF
