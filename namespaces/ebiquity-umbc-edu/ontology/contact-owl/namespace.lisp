;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://ebiquity.umbc.edu/ontology/contact.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export "ContactInformation")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://ebiquity.umbc.edu/ontology/contact.owl#")
           (make-package "http://ebiquity.umbc.edu/ontology/contact.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("ContactInformation"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://ebiquity.umbc.edu/ontology/contact.owl#" :if-does-not-exist :load)
