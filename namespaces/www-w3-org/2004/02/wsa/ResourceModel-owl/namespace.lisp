;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/wsa/ResourceModel.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Discovery"
                                          "Discovery_Service"
                                          "Identifier"
                                          "Representation"
                                          "Resource"
                                          "Resource_Description")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/wsa/ResourceModel.owl#")
           (make-package "http://www.w3.org/2004/02/wsa/ResourceModel.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Discovery" "Discovery_Service" "Identifier" "Representation"
             "Resource" "Resource_Description"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/wsa/ResourceModel.owl#" :if-does-not-exist :load)
