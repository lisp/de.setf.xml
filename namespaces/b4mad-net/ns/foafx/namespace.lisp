;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://b4mad.net/ns/foafx/"
                                         (:use)
                                         (:nicknames)
                                         (:export "mbox" "mbox_sha1sum")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://b4mad.net/ns/foafx/")
           (make-package "http://b4mad.net/ns/foafx/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("mbox" "mbox_sha1sum"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://b4mad.net/ns/foafx/" :if-does-not-exist :load)
