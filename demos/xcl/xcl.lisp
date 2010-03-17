;;; -*- package: common-lisp-user; Syntax: Common-lisp; Base: 10 -*-

(in-package :common-lisp-user)

(defPackage :de.setf.xcl
  (:use :common-lisp
        :xqdm :xml-parser :xml-utils)
  (:export
   :xcl-parser
   :xcl-construction-context
   :asexp-construction-context
   :parse
   ))

(let ((*default-pathname-defaults* *load-pathname*))
  (map #'load
       '("xcl-construction-context"
         "conditions"
         "parse")))

:EOF
