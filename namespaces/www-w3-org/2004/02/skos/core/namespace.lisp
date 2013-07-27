;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/skos/core#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "altLabel"
                                          "broader"
                                          "broaderTransitive"
                                          "broadMatch"
                                          "changeNote"
                                          "closeMatch"
                                          "Collection"
                                          "Concept"
                                          "ConceptScheme"
                                          "definition"
                                          "editorialNote"
                                          "exactMatch"
                                          "example"
                                          "hasTopConcept"
                                          "hiddenLabel"
                                          "historyNote"
                                          "inScheme"
                                          "mappingRelation"
                                          "member"
                                          "memberList"
                                          "narrower"
                                          "narrowerTransitive"
                                          "narrowMatch"
                                          "notation"
                                          "note"
                                          "OrderedCollection"
                                          "prefLabel"
                                          "related"
                                          "relatedMatch"
                                          "scopeNote"
                                          "semanticRelation"
                                          "topConceptOf")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/skos/core#")
           (make-package "http://www.w3.org/2004/02/skos/core#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("altLabel" "broader" "broaderTransitive" "broadMatch" "changeNote"
             "closeMatch" "Collection" "Concept" "ConceptScheme" "definition"
             "editorialNote" "exactMatch" "example" "hasTopConcept"
             "hiddenLabel" "historyNote" "inScheme" "mappingRelation" "member"
             "memberList" "narrower" "narrowerTransitive" "narrowMatch"
             "notation" "note" "OrderedCollection" "prefLabel" "related"
             "relatedMatch" "scopeNote" "semanticRelation" "topConceptOf"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/skos/core#" :if-does-not-exist :load)
