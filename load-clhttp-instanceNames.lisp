;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

(in-package :CL-USER)

;;; load configuration without CL-HTTP and with name symbols:

#+CL-HTTP
(cerror "continue load."
        "this is intended to load a configuration without CL-HTTP, yet CL-HTTP is present.")

(load "library:define-system.lisp")

#+(and allegro unix)
(register-system-definition :xparser (merge-pathnames (make-pathname :name "sysdcl"
                                                                     :type "lisp")
                                                      *load-pathname*))
#-(and allegro unix)
(register-system-definition :xparser (merge-pathnames (make-pathname :name "SYSDCL"
                                                                     :type "LISP")
                                                      *load-pathname*))

(pushnew :xml-symbols *features*)
(setf *features* (remove :nameset-tokenizer *features*))
(execute-system-operations :xparser '(:compile :load))

(format *trace-output* "~%cl xml loaded:~%~s" *features*)
(pushnew :cl-xml *features*)
(provide :cl-xml)

;(execute-system-operations :xtests '( :load))
;(execute-system-operations :xpath '( :load))

:EOF
