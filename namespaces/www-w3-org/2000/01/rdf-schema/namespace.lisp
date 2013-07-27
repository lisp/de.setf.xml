;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2000/01/rdf-schema#"
                                         (:use)
                                         (:nicknames "rdfs")
                                         (:export
                                          "Class"
                                          "comment"
                                          "Container"
                                          "ContainerMembershipProperty"
                                          "Datatype"
                                          "domain"
                                          "isDefinedBy"
                                          "label"
                                          "Literal"
                                          "member"
                                          "range"
                                          "Resource"
                                          "seeAlso"
                                          "subClassOf"
                                          "subPropertyOf")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2000/01/rdf-schema#")
           (make-package "http://www.w3.org/2000/01/rdf-schema#"
                         :use
                         nil
                         :nicknames
                         '("rdfs")))))
  (dolist (xml-query-data-model::s
           '("Class" "comment" "Container" "ContainerMembershipProperty"
             "Datatype" "domain" "isDefinedBy" "label" "Literal" "member"
             "range" "Resource" "seeAlso" "subClassOf" "subPropertyOf"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2000/01/rdf-schema#" :if-does-not-exist :load)
