;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

(in-package "COMMON-LISP-USER")

(asdf:defsystem :de.setf.xml.xrpc
  :pathname "LIBRARY:de;setf;xml;xrpc;"
  :depends-on (:de.setf.xml :de.setf.xiod :net.common-lisp.closer-mop)
  :components
  ((:file "xmlrpc-allegro")
   (:file "package" :depends-on ("xmlrpc-allegro"))
   (:file "xmlrpc" :depends-on ("package"))))

:de.setf.xml.xrpc

