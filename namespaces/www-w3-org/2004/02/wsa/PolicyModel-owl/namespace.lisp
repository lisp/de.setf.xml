;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/wsa/PolicyModel.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Audit_Guard"
                                          "Domain"
                                          "Obligation"
                                          "Permission"
                                          "Permission_Guard"
                                          "Person_or_Organization"
                                          "Policy"
                                          "Policy_Description"
                                          "Policy_Guard")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/wsa/PolicyModel.owl#")
           (make-package "http://www.w3.org/2004/02/wsa/PolicyModel.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Audit_Guard" "Domain" "Obligation" "Permission"
             "Permission_Guard" "Person_or_Organization" "Policy"
             "Policy_Description" "Policy_Guard"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/wsa/PolicyModel.owl#" :if-does-not-exist :load)
