;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: common-lisp-user; -*-

(in-package :common-lisp-user)

(asdf:defsystem :de.setf.xml.rpc
  :pathname "LIBRARY:de;setf;xml;rpc;"
  :components ((:file "package")
               (:file "index" :depends-on ("package"))
               (:file "xml-xiod-writer" :depends-on ("index"))
               (:file "http" :depends-on ("xml-xiod-writer"))))

