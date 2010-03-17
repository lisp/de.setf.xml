;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

(in-package "COMMON-LISP-USER")

(asdf:defsystem :de.setf.xml.xpath
  :depends-on (:de.setf.xml)
  :components
  ((:file "xpath-parameters")
   (:file "xpath-tokenizer" :depends-on ("xpath-parameters"))
   (:file "xpath-classes" :depends-on ("xpath-parameters"))
   (:file "xpath-operators" :depends-on ("xpath-parameters"))
   (:file "xpath-constructors" :depends-on ("xpath-operators" "xpath-classes"))
   (:file "xpath-parser" :depends-on ("xpath-constructors"))
   (:module :grammar
            :depends-on ("xpath-parser")    ; this source is generated from there
            :components ((:file "xpath-grammar")))
   (:file "xpath-printer" :depends-on ("xpath-parameters"))
   (:file "xpath-library" :depends-on ("xpath-parameters"))))


:de.setf.xml.xpath
