;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/vann/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "changes"
                                          "example"
                                          "preferredNamespacePrefix"
                                          "preferredNamespaceUri"
                                          "usageNote")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/vann/")
           (make-package "http://purl.org/vocab/vann/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("changes" "example" "preferredNamespacePrefix"
             "preferredNamespaceUri" "usageNote"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/vann/" :if-does-not-exist :load)
