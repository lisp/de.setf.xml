
(in-package "CL-USER")

;;
;; xml processor

#-CL-HTTP
(load "entwicklung@bataille:source:lisp:xml:define-system.lisp")

;; set this pathname appropriately
(register-system-definition :xparser
                            "entwicklung@bataille:source:lisp:xml:sysdcl.lisp")
(unless (system-loaded-p :xparser)
  (execute-system-operations :xparser '(:load)))

;;
;; wilbur

(setf (logical-pathname-translations "wilbur")
      `(("core;*.lisp"  "wilbur:base;source;*.*")
        ("core;*.pfsl"  "wilbur:base;binaries;*.*")
        ("core;*.*"     "wilbur:base;*.*")
        ("schemata;*.*" "wilbur:base;schemata;*.*")
        ("base;**;*.*" "entwicklung@bataille:wilbur-a2-20010719:**:*.*")))

;; (translate-logical-pathname "wilbur:base;source;wilbur.system")
(register-system-definition :wilbur "wilbur:base;source;wilbur.system")

(unless (system-loaded-p :wilbur)
  (let ((*features* (cons :cmu-mk-defsystem *features*)))
    (execute-system-operations :wilbur '(:load))))
;(load "xml:demos;rdf;rdf-dom-parser.lisp")

(load "xml:demos;sax;sax-construction-context.lisp")
(load "xml:demos;rdf;rdf-inline-parser.lisp")


(defParameter *rdf-string*
  "<?xml version='1.0'?>
  <rdf:RDF
    xmlns:rdf='http://www.w3.org/1999/02/22-rdf-syntax-ns#'
    xmlns:s='http://description.org/schema/'>
    <rdf:Description rdf:about='http://www.w3.org/Home/Lassila'>
      <s:Creator>Ora Lassila</s:Creator>
    </rdf:Description>
  </rdf:RDF>")


(with-input-from-string (stream *rdf-string*)
  (wilbur::parse-db-from-stream stream ""))

(let ((dom (xmlp::document-parser *rdf-string*)))
  (wilbur::parse-db-from-dom dom))

(with-input-from-string (stream *rdf-string*)
  (wilbur::parse-db-from-xmlp-stream stream))

(time
 (wilbur::parse-db-from-xmlp-stream "file://wilbur/base/schemata/dc-schema.rdf")
 )
(wilbur::parse-db-from-xmlp-stream "file://wilbur/base/schemata/rdf-schema.rdf")
(wilbur::parse-db-from-xmlp-stream "file://wilbur/base/schemata/rss-schema.rdf")

(time
 (with-open-file (stream #p"wilbur:base;schemata;dc-schema.rdf"
                        :direction :input)
  (wilbur::parse-db-from-stream stream "")))