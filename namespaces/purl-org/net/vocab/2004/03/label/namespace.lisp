;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/net/vocab/2004/03/label#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "inversePlural"
                                          "inverseSingular"
                                          "plural"
                                          "singular")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/net/vocab/2004/03/label#")
           (make-package "http://purl.org/net/vocab/2004/03/label#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("inversePlural" "inverseSingular" "plural" "singular"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/net/vocab/2004/03/label#" :if-does-not-exist :load)
