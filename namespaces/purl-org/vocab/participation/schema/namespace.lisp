;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/participation/schema#"
                                         (:use)
                                         (:nicknames "participation")
                                         (:export
                                          "endDate"
                                          "holder"
                                          "holder_of"
                                          "role"
                                          "Role"
                                          "role_at"
                                          "startDate")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/participation/schema#")
           (make-package "http://purl.org/vocab/participation/schema#"
                         :use
                         nil
                         :nicknames
                         '("participation")))))
  (dolist (xml-query-data-model::s
           '("endDate" "holder" "holder_of" "role" "Role" "role_at"
             "startDate"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/participation/schema#" :if-does-not-exist :load)
