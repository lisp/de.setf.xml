;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

(defParameter *email-dom* nil)
(defparameter *xml-dom* nil)
(defparameter *html-dom* nil)

;;
;; load the system definition facility
#-CL-HTTP
(load "entwicklung@bataille:source:lisp:xml:define-system.lisp")

;; set this pathname appropriately and load the xml parser
(register-system-definition :xparser
                            "entwicklung@bataille:source:lisp:xml:sysdcl.lisp")
(unless (system-loaded-p :xparser)
  (execute-system-operations :xparser '(:load)))

;; load the grapher
(load "xml:demos;graphs;xqdm-graph.lisp")


;; for 0.908 add (export 'xqdm::write-node-graph "XQDM")
;; nb. this example is coded for symbol-implemented names

;; load and graph the channel document and its document definition
(defParameter *channel-dom* (document-parser #P"xml:tests;xml;channel.xml"))
(defParameter *channel-dom* (document-parser "file://xml/tests/xml/channel.xml"))
(write-node-graph *channel-dom* "channelDOM.dot")
(write-node-graph (find-def-type '||::|Channel| *channel-dom*) "channelDTD.dot")


(defParameter *email-dom* (document-parser #P"xml:tests;xml;email.xml"))
(write-node-graph *email-dom* "emailDOM.dot")
(write-node-graph (find-def-type '||::|Email| *email-dom*) "emailDTD.dot")


(defParameter *xml-dom* (document-parser #P"www:Dokumente:Standards:XML:REC-xml-20001006.xml"))
;;(setf *xml-dom* (document-parser "http://www.w3.org/TR/2000/REC-xml-20001006.xml"))
(write-node-graph (find-def-type '||::|spec| *xml-dom*) "xmlSpecDTD.dot")


(defParameter *html-dom* (document-parser #P"www:dokumente:standards:xml:XHTML1+DTD:REC-xhtml1-20000126.html"))
(write-node-graph (find-def-type '|http://www.w3.org/1999/xhtml|::|html| *html-dom*) "xhtmlHtmlDTD.dot")

(let ((count 0) (content-count 0) (content-max 0) (content-min 100))
  (maphash #'(lambda (key def &aux cc)
               (declare (ignore key))
               (incf count)
               (setf cc (length (collect-model-names (first (bnfp::bnf-rhs (model def))))))
               (setf content-max (max content-max cc))
               (setf content-min (min content-min cc))
               (incf content-count cc))
           (types *html-dom*))
  (list :count count :average (float (/ content-count count)) :min content-min :max content-max))

(inspect *)



:EOF
