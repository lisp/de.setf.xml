;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://kmi.open.ac.uk/semanticweb/ontologies/owl/kmi-basic-portal-ontology.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "electronic-newsletter"
                                          "has-story-category"
                                          "has-story-content"
                                          "kmi-academic-staff-member"
                                          "kmi-academic-support-staff-member"
                                          "kmi-graphic-designer"
                                          "kmi-multimedia-designer"
                                          "kmi-phd-student"
                                          "kmi-planet-news-item"
                                          "kmi-research-staff-member"
                                          "kmi-staff-member"
                                          "kmi-story-category"
                                          "kmi-system-administrator"
                                          "mentions-organization"
                                          "mentions-person"
                                          "mentions-project"
                                          "mentions-research-area"
                                          "mentions-technology")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://kmi.open.ac.uk/semanticweb/ontologies/owl/kmi-basic-portal-ontology.owl#")
           (make-package "http://kmi.open.ac.uk/semanticweb/ontologies/owl/kmi-basic-portal-ontology.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("electronic-newsletter" "has-story-category" "has-story-content"
             "kmi-academic-staff-member" "kmi-academic-support-staff-member"
             "kmi-graphic-designer" "kmi-multimedia-designer" "kmi-phd-student"
             "kmi-planet-news-item" "kmi-research-staff-member"
             "kmi-staff-member" "kmi-story-category" "kmi-system-administrator"
             "mentions-organization" "mentions-person" "mentions-project"
             "mentions-research-area" "mentions-technology"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://kmi.open.ac.uk/semanticweb/ontologies/owl/kmi-basic-portal-ontology.owl#" :if-does-not-exist :load)
