;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://vocab.org/evidence/terms/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Conclusion"
                                          "Evidence"
                                          "Hypothesis")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://vocab.org/evidence/terms/")
           (make-package "http://vocab.org/evidence/terms/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("Conclusion" "Evidence" "Hypothesis"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://vocab.org/evidence/terms/" :if-does-not-exist :load)
