;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-
;;;
;;; package for xml-rpc

(in-package :cl-user)

(export '(xmlp::xml*) :xml-parser)

(modPackage :de.setf.xml.xml-rpc
  (:use :common-lisp :xml-parser :xml-query-data-model)
  (:ensure :de.setf.utility.date)
  (:export 
   :xml-rpc-type
   :perform-method-call
   :intern-function
   :xml-rpc-decode-value
   :xml-rpc-encode-value
   )
  (:import-from :de.setf.utility.meta
                :with-meta
                :match
                :with-string-meta
                )
  (:import-from :xml-parser
                :xml*
                :make-uname
                )
  (:import-from :de.setf.utility.date
                :universal-time
                )
  (:import-from :xqdm
                :destructure-element
                )
  (:import-from :de.setf.http
                :serve-http
                )
  (:import-from :ccl
                :stream-close
                :generic-function-methods
                :method-specializers
                )
  (:import-from :date
                "yyyyMMddTHH:mm:ss"
                )
  (:import-from :xutils :with-http-stream)
  )



:EOF
