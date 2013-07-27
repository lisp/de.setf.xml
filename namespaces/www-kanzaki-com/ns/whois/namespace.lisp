;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.kanzaki.com/ns/whois#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Education"
                                          "Job"
                                          "Place"
                                          "Stage")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.kanzaki.com/ns/whois#")
           (make-package "http://www.kanzaki.com/ns/whois#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("Education" "Job" "Place" "Stage"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.kanzaki.com/ns/whois#" :if-does-not-exist :load)
