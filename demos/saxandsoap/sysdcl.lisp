(in-package :cl-user)

(define-system (:LISP-XML-CL-XML-CODE-SAX-API)
   ()
   "xml:demos;saxandsoap;sax-package"
   "xml:demos;saxandsoap;sax-basics"
   "xml:demos;saxandsoap;sax-construction-context"
   "xml:demos;saxandsoap;null-construction-context"
   "xml:demos;saxandsoap;empty-consumer" ;; base class for SAX consumers
   "xml:demos;saxandsoap;simple-xml" ;; test case for SAX api
   "xml:demos;saxandsoap;simple-soap" ;; SOAP reader -- does not do arrays yet
   )

;(execute-system-operations :LISP-XML-CL-XML-CODE-SAX-API '(:probe))
(execute-system-operations :LISP-XML-CL-XML-CODE-SAX-API '(:load))