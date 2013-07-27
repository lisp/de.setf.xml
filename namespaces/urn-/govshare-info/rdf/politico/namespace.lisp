;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "urn://govshare.info/rdf/politico/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Country"
                                          "forOffice"
                                          "hasRole"
                                          "Office"
                                          "Organization"
                                          "Politician"
                                          "represents"
                                          "Term")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "urn://govshare.info/rdf/politico/")
           (make-package "urn://govshare.info/rdf/politico/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Country" "forOffice" "hasRole" "Office" "Organization"
             "Politician" "represents" "Term"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "urn://govshare.info/rdf/politico/" :if-does-not-exist :load)
