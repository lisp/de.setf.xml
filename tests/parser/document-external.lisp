;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")


;;
;; this file demonstates simple parsing and serialization operations on external
;; document sources which are identified by pathname, http url, and file url.

(defParameter *external-dom* nil)
(defParameter *serialized-p-default* t) ; (setq *serialized-p-default* nil)
(defParameter *time-p-default* nil)

(format *trace-output* "~%~%various examples parsing and serializing documents from external sources:~%")
        
(flet ((parse-and-report (source &rest args &key (serialize-p *serialized-p-default*) trace-p (reduce-p t) (time-p *time-p-default*)
                                 encoding)
         (format *trace-output* "~%~%;; source: ~@[~s~]~%~s" args source)
         (handler-case
           (handler-bind  ((continuable-error
                            #'(lambda (condition)
                                (format *trace-output* "continuable condition ignored: ~a."
                                        condition)
                                (continue condition))))
             (setq * nil)               ; clear last value otherwise it may hold too much memory
             (let ((result (if time-p
                             (time (apply #'document-parser source :trace trace-p :reduce reduce-p
                                          (when encoding (list :encoding encoding))))
                             (apply #'document-parser source :trace trace-p :reduce reduce-p
                                    (when encoding (list :encoding encoding))))))
               (format *trace-output* "~%;; parsed result:~%~s" result)
               (describe result)
               (when serialize-p
                 (format *trace-output* "~%;; serializes as:~%" )
                 (write-node result *trace-output* :encoding :us-ascii))))
           (error (condition)
                  (format *trace-output* "~%;* signaled error:~%~a" condition)))))
  "parse and report result for external document sources.
   note that the file url form permits logical hosts in the initial position."
  (map nil #'(lambda (args) (if (consp args) (apply #'parse-and-report args) (parse-and-report args)))
       '((#P"xml:Tests;xml;channel.xml"  :serialize-p nil)
         "file://xml/Tests/xml/channel.xml"
         #P"xml:Tests;xml;email.xml"
         #P"xml:Tests;xml;lisp.xml"
         #P"xml:Tests;xml;real-mini-aleph-het.xml"
         ; resuires a remote connection
         ; "http://www.w3.org/TR/2000/REC-xml-20001006.xml"
         ; requires a local http server
         ("http://localhost/standards/XML/REC-xml-20001006.xml" :serialize-p nil)
         (#P"xml:standards;XML;REC-xml-20001006.xml" :serialize-p nil)
         ("file://xml/standards/XML/REC-xml-20001006.xml" :serialize-p nil)
         (#P"xml:standards;XML;W3CSchema;XMLSchema.xsd" :serialize-p nil)

         ;; xml benchmark timings.
         ;; see http://www.xml.com/pub/a/Benchmark/article.html http://www.xml.com/Benchmark/xmlbench.tar.gz
         ;; note that the larger documents are several megabytes and take roughly three times as much memory as
         ;; the initial encoded length, which means this will need about 15M worth of heap to run all examples.
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;REC.xml" :reduce-p nil :time-p t :encoding :iso-8859-1 :serialize-p nil)
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;REC.xml" :reduce-p t :time-p t :serialize-p nil)
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;chrmed.xml" :reduce-p nil :time-p t :serialize-p nil)
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;chrmed.xml" :reduce-p t :time-p t :serialize-p nil)
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;med.xml" :reduce-p nil :time-p t :encoding :iso-8859-1 :serialize-p nil)
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;med.xml" :reduce-p t :time-p t :serialize-p nil)
         ;; 14,365 milliseconds 604/200 mcl4.2
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;chrbig.xml" :reduce-p nil :time-p t :serialize-p nil)
         ;; 12,959 milliseconds 604/200 mcl4.2
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;chrbig.xml" :reduce-p t :time-p t :serialize-p nil)
         ;; 190,737 - 21,178 milliseconds 604/200 mcl4.2
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;big.xml" :reduce-p nil :time-p t :encoding :iso-8859-1 :serialize-p nil)
         ;; based on before/after gc 14664K for the 4.8M file
         (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;big.xml" :reduce-p t :time-p t :serialize-p nil)
         ; would be interesting, but won't work as it does not handle the dtd
         ; (#P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;big.xml" :reduce-p 'cons :time-p t  :encoding :iso-8859-1 :serialize-p nil)
         )))

;;(document-parser #P"xml:standards;XML;W3CSchema;XMLSchema.xsd")
;;(document-parser #P"xml:Tests;xml;lisp.xml")
;;(document-parser #P"xml:standards;XML;XMLConf;xmlbench;Benchmark;Data;big.xml"))

;; schema document components are parsed as part of the larger document, but
;; could also be parsed as external subsets
;; "xml:standards;XML;W3CSchema;XMLSchema.dtd"
;; "xml:standards;XML;W3CSchema;datatypes.dtd"
;;
;; (inspect (stream->vector #P"xml:Tests;xml;real-mini-aleph-het.xml"))

;; alternative settings:
;; first, without either reduction or namespaces. the result is the production id
;; one would need to specialize the reduction context instances and generate results from constructor calls
;; see "xml:code;xparser;xml-constructors.lisp"

(handler-bind  ((xqdm::namespace-condition
                 #'(lambda (condition)
                     (format *trace-output* "expected condition ignored: ~a."
                             condition)
                     (continue condition))))
  (let ((xutils::|REC-xml-names-19990114| nil))
    (time (setq *external-dom* (document-parser "file://xml/standards/xml/rec-xml-20001006.xml"
                                                :trace nil :reduce nil
                                                ;; where reduction is disabled, the declared encoding must be correct
                                                :encoding :ISO-8859-1))))
  ;; 8,015 milliseconds
  (let ((xutils::|REC-xml-names-19990114| nil))
    (time (setq *external-dom* (document-parser "file://xml/standards/XML/REC-xml-20001006.xml"
                                                :trace nil :reduce t))))
  
  ;; 17,519 milliseconds 604/200 mcl4.2
  ;; 2,106 milliseconds G4/1.25 mcl5.0
  (time (setq *external-dom* (document-parser "file://xml/standards/XML/REC-xml-20001006.xml"
                                              :trace nil :reduce t))))

(format *trace-output*
        ";;~%;;  an exmample from xhtml modularization:
;;  nothing special is needed for the entity-based identifier generation,
;;  but the dtd has no danespace declarations, which means that the definition is recognized as a homograph:~%~s~% ==>~%"
        (setq *external-dom*
              (document-parser #P"xml:standards;XML;XHTML-MODULAR;examples;inventory.xml" :trace nil)))
(describe *external-dom*)
(write-node *external-dom* *trace-output*)


(format *trace-output*
        "the dtd itself can also be loaded, so long as one observes the entity dependancies:~%~s~% ==>~%"
        (setq *external-dom*
              (document-parser #P"xml:standards;XML;XHTML-MODULAR;examples;inventory-1.dtd"
                               :start-name '|ExtSubset|)))
(describe *external-dom*)

;; macbeth.xml in the 1999 version, approximately 160Kbytes
;; 8.031, 7.644, 7.521 seconds 604/200 mcl4.2
(format *trace-output*
        "the macbeth example loaded both as an instacne model and as an s-expression model:~%~s~% ==>~%"
        (setq *external-dom*
              (time (document-parser #p"xml:standards;XML;XMLConf;macbeth.xml"))))
(describe *external-dom*)

(let ((*print-length* 5) (*print-level* 8))
  (format *trace-output*
          "~%;; when :reduce is CONS, reduction is to an s-expression representation of the parse tree.
;; the tags are taken from the bnf grammar.
;; the order within a given production is alphabetical.
;; sequence values appear as an untagged list:~%~:W"
          (setq *external-dom*
                (time (document-parser #p"xml:standards;XML;XMLConf;macbeth.xml" :reduce 'cons))))
  (describe *external-dom*))



:EOF
