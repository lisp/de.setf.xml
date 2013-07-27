;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://rdfs.org/sioc/ns#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "account"
                                          "Agent"
                                          "date"
                                          "depiction"
                                          "description"
                                          "Document"
                                          "OnlineAccount"
                                          "references"
                                          "subject"
                                          "title")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://rdfs.org/sioc/ns#")
           (make-package "http://rdfs.org/sioc/ns#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("account" "Agent" "date" "depiction" "description" "Document"
             "OnlineAccount" "references" "subject" "title"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://rdfs.org/sioc/ns#" :if-does-not-exist :load)
