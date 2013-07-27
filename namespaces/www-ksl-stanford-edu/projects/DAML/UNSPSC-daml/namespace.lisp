;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.ksl.stanford.edu/projects/DAML/UNSPSC.daml#"
                                         (:use)
                                         (:nicknames)
                                         (:export)
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.ksl.stanford.edu/projects/DAML/UNSPSC.daml#")
           (make-package "http://www.ksl.stanford.edu/projects/DAML/UNSPSC.daml#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s 'nil)
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.ksl.stanford.edu/projects/DAML/UNSPSC.daml#" :if-does-not-exist :load)
