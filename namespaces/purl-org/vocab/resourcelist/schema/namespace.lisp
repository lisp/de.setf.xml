;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/resourcelist/schema"
                                         (:use)
                                         (:nicknames "resource")
                                         (:export
                                          "alternative"
                                          "AlternativeItem"
                                          "contains"
                                          "created"
                                          "description"
                                          "Item"
                                          "list"
                                          "List"
                                          "next"
                                          "previous"
                                          "resource"
                                          "Section"
                                          "usedBy"
                                          "usesList")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/resourcelist/schema")
           (make-package "http://purl.org/vocab/resourcelist/schema"
                         :use
                         nil
                         :nicknames
                         '("resource")))))
  (dolist (xml-query-data-model::s
           '("alternative" "AlternativeItem" "contains" "created" "description"
             "Item" "list" "List" "next" "previous" "resource" "Section"
             "usedBy" "usesList"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/resourcelist/schema" :if-does-not-exist :load)
