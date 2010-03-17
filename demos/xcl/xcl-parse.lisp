;;; -*- package: de.setf.xcl; Syntax: Common-lisp; Base: 10 -*-

(defPackage :de.setf.xcl
  (:use :common-lisp
        :xqdm :xml-parser :xml-utils))

(in-package :de.setf.xcl)

;; an xmlp-based xcl parser drives the constructs annotated s-expressions based
;; on inline parser construction operations 

(defClass xcl-xmlp-parser (rdf-parser)
  ()
  (:default-initargs
    :producer (make-instance 'nox::sax-construction-context
                :consumer (make-instance 'rdf-syntax-normalizer))))

(defun make-xcl-xmlp-parser (&key args)
  (apply #'make-instance 'xcl-construction-context args))


;;
;;
;; the top-level parse function

(defun parse (source &rest args
                     &key (construction-context (make-xcl-xmlp-parser)))
  "parse a document source as an xml-encoded common-logic expression"
  (apply #'xmlp:document-parser source
         :construction-context construction-context))

:EOF
