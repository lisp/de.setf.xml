;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/changeset/schema#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "addition"
                                          "changeReason"
                                          "ChangeSet"
                                          "createdDate"
                                          "creatorName"
                                          nil
                                          "precedingChangeSet"
                                          "removal"
                                          "statement"
                                          "subjectOfChange")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/changeset/schema#")
           (make-package "http://purl.org/vocab/changeset/schema#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("addition" "changeReason" "ChangeSet" "createdDate" "creatorName"
             nil "precedingChangeSet" "removal" "statement" "subjectOfChange"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/changeset/schema#" :if-does-not-exist :load)
