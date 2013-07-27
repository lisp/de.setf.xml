;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://lsdis.cs.uga.edu/projects/semdis/opus#"
                                         (:use)
                                         (:nicknames)
                                         (:export)
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://lsdis.cs.uga.edu/projects/semdis/opus#")
           (make-package "http://lsdis.cs.uga.edu/projects/semdis/opus#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s 'nil)
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://lsdis.cs.uga.edu/projects/semdis/opus#" :if-does-not-exist :load)
