;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://sw.deri.org/2005/04/wikipedia/wikiont.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Article"
                                          "Category"
                                          "Image"
                                          "Stub")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://sw.deri.org/2005/04/wikipedia/wikiont.owl#")
           (make-package "http://sw.deri.org/2005/04/wikipedia/wikiont.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("Article" "Category" "Image" "Stub"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://sw.deri.org/2005/04/wikipedia/wikiont.owl#" :if-does-not-exist :load)
