;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/aiiso/schema#"
                                         (:use)
                                         (:nicknames "vann")
                                         (:export
                                          "Center"
                                          "code"
                                          "College"
                                          "Course"
                                          "Department"
                                          "description"
                                          "Division"
                                          "Faculty"
                                          "Institute"
                                          "Institution"
                                          "knowledgeGrouping"
                                          "KnowledgeGrouping"
                                          "Module"
                                          "name"
                                          "organization"
                                          "organizationalUnit"
                                          "organizationalUnit"
                                          "part_of"
                                          "Programme"
                                          "ResearchGroup"
                                          "responsibilityOf"
                                          "responsibleFor"
                                          "School"
                                          "Subject"
                                          "teaches")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/aiiso/schema#")
           (make-package "http://purl.org/vocab/aiiso/schema#"
                         :use
                         nil
                         :nicknames
                         '("vann")))))
  (dolist (xml-query-data-model::s
           '("Center" "code" "College" "Course" "Department" "description"
             "Division" "Faculty" "Institute" "Institution" "knowledgeGrouping"
             "KnowledgeGrouping" "Module" "name" "organization"
             "organizationalUnit" "organizationalUnit" "part_of" "Programme"
             "ResearchGroup" "responsibilityOf" "responsibleFor" "School"
             "Subject" "teaches"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/aiiso/schema#" :if-does-not-exist :load)
