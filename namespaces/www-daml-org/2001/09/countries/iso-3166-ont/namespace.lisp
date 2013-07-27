;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.daml.org/2001/09/countries/iso-3166-ont#"
                                         (:use)
                                         (:nicknames)
                                         (:export "Country")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.daml.org/2001/09/countries/iso-3166-ont#")
           (make-package "http://www.daml.org/2001/09/countries/iso-3166-ont#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("Country"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.daml.org/2001/09/countries/iso-3166-ont#" :if-does-not-exist :load)
