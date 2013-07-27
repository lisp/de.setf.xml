;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://vocab.org/reuters_topics/1.0/"
                                         (:use)
                                         (:nicknames "")
                                         (:export)
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://vocab.org/reuters_topics/1.0/")
           (make-package "http://vocab.org/reuters_topics/1.0/"
                         :use
                         nil
                         :nicknames
                         '("")))))
  (dolist (xml-query-data-model::s 'nil)
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://vocab.org/reuters_topics/1.0/" :if-does-not-exist :load)
