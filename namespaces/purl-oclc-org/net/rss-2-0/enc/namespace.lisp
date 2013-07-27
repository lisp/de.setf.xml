;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.oclc.org/net/rss_2.0/enc#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "enclosure"
                                          "Enclosure"
                                          "enclosures"
                                          "length"
                                          "type"
                                          "url")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.oclc.org/net/rss_2.0/enc#")
           (make-package "http://purl.oclc.org/net/rss_2.0/enc#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("enclosure" "Enclosure" "enclosures" "length" "type" "url"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.oclc.org/net/rss_2.0/enc#" :if-does-not-exist :load)
