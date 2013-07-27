;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/net/vocab/2004/07/visit#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "CanadianRegion"
                                          "caregion"
                                          "country"
                                          "usstate")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/net/vocab/2004/07/visit#")
           (make-package "http://purl.org/net/vocab/2004/07/visit#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("CanadianRegion" "caregion" "country" "usstate"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/net/vocab/2004/07/visit#" :if-does-not-exist :load)
