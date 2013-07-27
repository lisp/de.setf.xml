;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.daml.org/services/owl-s/1.1/Profile.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Profile"
                                          "ServiceCategory"
                                          "ServiceParameter")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.daml.org/services/owl-s/1.1/Profile.owl#")
           (make-package "http://www.daml.org/services/owl-s/1.1/Profile.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Profile" "ServiceCategory" "ServiceParameter"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.daml.org/services/owl-s/1.1/Profile.owl#" :if-does-not-exist :load)
