;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.purl.org/net/ontology/order.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Address"
                                          "Agent"
                                          "ItemsCollection"
                                          "Organization"
                                          "Person"
                                          "Personnel"
                                          "PurchasedItem"
                                          "PurchaseOrder"
                                          "Shipper"
                                          "Supplier")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.purl.org/net/ontology/order.owl#")
           (make-package "http://www.purl.org/net/ontology/order.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Address" "Agent" "ItemsCollection" "Organization" "Person"
             "Personnel" "PurchasedItem" "PurchaseOrder" "Shipper" "Supplier"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.purl.org/net/ontology/order.owl#" :if-does-not-exist :load)
