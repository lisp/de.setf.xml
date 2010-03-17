(in-package :isc)

(isc::record-source-file "$Revision: 1.1.1.1 $" "$State: Exp $" "$Source: /home/cvs/repository/Library/de/setf/cl-xml/demos/saxandsoap/system-isc.lisp,v $")

(define-icad-system :LISP-XML-CL-XML-CODE-SAX-API
 :options
 (:system-directory "lisp-xml:cl-xml;code;sax-api;"
  :pretty-name "lisp-xml component cl-xml code sax-api ")
 
 :module-definitions
 (
  (code 
   "sax-package"
   "sax-basics"
   "sax-construction-context"
   "null-construction-context"
   "empty-consumer" ;; base class for SAX consumers
   "simple-xml" ;; test case for SAX api
   "simple-soap" ;; SOAP reader -- does not do arrays yet
   )))
;;; -----
;;; $Log: system-isc.lisp,v $
;;; Revision 1.1.1.1  2004/06/12 14:24:38  janderson
;;; this is the initial module import of unverified library sources
;;;
