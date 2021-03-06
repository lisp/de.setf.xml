;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://kanzaki.com/ns/dpd#"
                                         (:use)
                                         (:nicknames)
                                         (:export "GenerationEvent" "Place")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://kanzaki.com/ns/dpd#")
           (make-package "http://kanzaki.com/ns/dpd#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("GenerationEvent" "Place"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://kanzaki.com/ns/dpd#" :if-does-not-exist :load)
