;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/bio/0.1/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Birth"
                                          "date"
                                          "Death"
                                          "event"
                                          "Event"
                                          "keywords"
                                          "Marriage"
                                          "olb"
                                          "place")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/bio/0.1/")
           (make-package "http://purl.org/vocab/bio/0.1/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Birth" "date" "Death" "event" "Event" "keywords" "Marriage" "olb"
             "place"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/bio/0.1/" :if-does-not-exist :load)
