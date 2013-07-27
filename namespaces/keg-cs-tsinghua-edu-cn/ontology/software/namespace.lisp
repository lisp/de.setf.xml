;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://keg.cs.tsinghua.edu.cn/ontology/software#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Category"
                                          "Developer"
                                          "Discussion"
                                          "Help"
                                          "Member"
                                          "Message"
                                          "Person"
                                          "Project"
                                          "Project_Admin"
                                          "Public_Forums"
                                          "Release_Package"
                                          "Statistic_Record"
                                          "Usage_Statistics"
                                          "Version")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://keg.cs.tsinghua.edu.cn/ontology/software#")
           (make-package "http://keg.cs.tsinghua.edu.cn/ontology/software#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Category" "Developer" "Discussion" "Help" "Member" "Message"
             "Person" "Project" "Project_Admin" "Public_Forums"
             "Release_Package" "Statistic_Record" "Usage_Statistics"
             "Version"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://keg.cs.tsinghua.edu.cn/ontology/software#" :if-does-not-exist :load)
