;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://usefulinc.com/ns/doap#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "anon-root"
                                          "ArchRepository"
                                          "audience"
                                          "BazaarBranch"
                                          "BKRepository"
                                          "blog"
                                          "browse"
                                          "bug-database"
                                          "category"
                                          "created"
                                          "CVSRepository"
                                          "DarcsRepository"
                                          "description"
                                          "developer"
                                          "documenter"
                                          "download-mirror"
                                          "download-page"
                                          "file-release"
                                          "GitRepository"
                                          "helper"
                                          "HgRepository"
                                          "homepage"
                                          "implements"
                                          "language"
                                          "license"
                                          "location"
                                          "mailing-list"
                                          "maintainer"
                                          "module"
                                          "name"
                                          "old-homepage"
                                          "os"
                                          "platform"
                                          "programming-language"
                                          "Project"
                                          "release"
                                          "repository"
                                          "Repository"
                                          "revision"
                                          "screenshots"
                                          "service-endpoint"
                                          "shortdesc"
                                          "Specification"
                                          "SVNRepository"
                                          "tester"
                                          "translator"
                                          "vendor"
                                          "Version"
                                          "wiki")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://usefulinc.com/ns/doap#")
           (make-package "http://usefulinc.com/ns/doap#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("anon-root" "ArchRepository" "audience" "BazaarBranch"
             "BKRepository" "blog" "browse" "bug-database" "category" "created"
             "CVSRepository" "DarcsRepository" "description" "developer"
             "documenter" "download-mirror" "download-page" "file-release"
             "GitRepository" "helper" "HgRepository" "homepage" "implements"
             "language" "license" "location" "mailing-list" "maintainer"
             "module" "name" "old-homepage" "os" "platform"
             "programming-language" "Project" "release" "repository"
             "Repository" "revision" "screenshots" "service-endpoint"
             "shortdesc" "Specification" "SVNRepository" "tester" "translator"
             "vendor" "Version" "wiki"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://usefulinc.com/ns/doap#" :if-does-not-exist :load)
