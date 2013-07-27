;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2000/10/swap/util/sniffSchema#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "domainIntersects"
                                          "intersectsDomainOf"
                                          "label"
                                          "rangeIntersects")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2000/10/swap/util/sniffSchema#")
           (make-package "http://www.w3.org/2000/10/swap/util/sniffSchema#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("domainIntersects" "intersectsDomainOf" "label"
             "rangeIntersects"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2000/10/swap/util/sniffSchema#" :if-does-not-exist :load)
