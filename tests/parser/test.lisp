;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

(in-package "CL-USER")

#|
there are four distinct test files - one each for the combinations
with cl-htpp or without and with instance names or symbol names.
load the appropriate one of the files from among
  "xml:tests:test*clhttp*instanceNames.lisp"
to test the desired configuration.

the individual modules for are loaded respectively as follows:

;; utils
(execute-system-operations :xutil '(:compile))

;; query domain model
(execute-system-operations :xqdm '(:load))
(execute-system-operations :xqdm '(:compile))

;; xml parser

(register-system-definition :xparser "entwicklung@paz:sourceServer:lisp:xml:sysdcl.lisp")
(execute-system-operations :xparser '(:compile :load))

;; xml paths
(register-system-definition :xpath "entwicklung@paz:sourceServer:lisp:xml:sysdcl.lisp")
(execute-system-operations :xpath '(:load))
(execute-system-operations :xpath '(:compile))
(execute-system-operations :xpath '(:compile :load))


;; xml query
(register-system-definition :xquery "entwicklung@paz:sourceServer:lisp:xml:sysdcl.lisp")
(execute-system-operations :xquery '(:load))
(execute-system-operations :xquery '(:compile))
(execute-system-operations :xquery '(:compile :load))

|#

;; simple tests

;; w/o namespaces
(print (xmlp:document-parser "<test attr='1234'>asdf</test>"))

;; with namespaces
(print (xmlp:document-parser "<ns:test attr='1234' xmlns:ns='ns1'>asdf</ns:test>"))

;; for a simple document
(let ((doc (time (xmlp:document-parser "file://xml/tests/xml/channel.xml"))))
  (print doc)
  (xmlp:write-node doc *standard-output*))


;; oasis tests
(load #4p"xml:tests;xparser;test-oasis.lisp")

:EOF
