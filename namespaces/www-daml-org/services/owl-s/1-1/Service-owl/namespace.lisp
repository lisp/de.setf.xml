;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.daml.org/services/owl-s/1.1/Service.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Service"
                                          "ServiceGrounding"
                                          "ServiceModel"
                                          "ServiceProfile")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.daml.org/services/owl-s/1.1/Service.owl#")
           (make-package "http://www.daml.org/services/owl-s/1.1/Service.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Service" "ServiceGrounding" "ServiceModel" "ServiceProfile"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.daml.org/services/owl-s/1.1/Service.owl#" :if-does-not-exist :load)
