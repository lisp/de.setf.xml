;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

(in-package "COMMON-LISP-USER")

(asdf:defsystem :de.setf.xml.xquery
  :depends-on (:de.setf.xml)
  :components
  ((:file "xq-parameters")
   (:file "xqa-classes" :depends-on ("xq-parameters"))
   (:file "xqa-operators" :depends-on ("xq-parameters"))
   (:file "xql-operators" :depends-on ("xqa-operators"))
   (:file "xqa-library" :depends-on ("xqa-operators"))
   (:file "xql-library" :depends-on ("xql-operators"))
   (:file "xql-tokenizer" :depends-on ("xq-parameters"))
   (:file "xql-constructors" :depends-on ("xql-operators"))
   (:file "xql-parser" :depends-on ("xql-constructors" "xql-tokenizer"))
   (:module :grammar
            :depends-on ("xql-parser")    ; this source is generated from there
            :components ((:file "xql-grammar")))
   (:file "xq-printer" :depends-on ("xq-parameters"))))

:de.setf.xml.xquery

