;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                                         (:use)
                                         (:nicknames "rdf")
                                         (:export
                                          "Alt"
                                          "Bag"
                                          "first"
                                          "List"
                                          "object"
                                          "predicate"
                                          "Property"
                                          "rest"
                                          "Seq"
                                          "Statement"
                                          "subject"
                                          "type"
                                          "value")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
           (make-package "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                         :use
                         nil
                         :nicknames
                         '("rdf")))))
  (dolist (xml-query-data-model::s
           '("Alt" "Bag" "first" "List" "object" "predicate" "Property" "rest"
             "Seq" "Statement" "subject" "type" "value"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/1999/02/22-rdf-syntax-ns#" :if-does-not-exist :load)
