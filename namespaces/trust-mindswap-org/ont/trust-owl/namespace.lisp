;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://trust.mindswap.org/ont/trust.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export "TopicalTrust")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://trust.mindswap.org/ont/trust.owl#")
           (make-package "http://trust.mindswap.org/ont/trust.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("TopicalTrust"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://trust.mindswap.org/ont/trust.owl#" :if-does-not-exist :load)
