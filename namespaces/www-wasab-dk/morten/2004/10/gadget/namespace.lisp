;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.wasab.dk/morten/2004/10/gadget#"
                                         (:use)
                                         (:nicknames)
                                         (:export "Gadget" "generator" "owner")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.wasab.dk/morten/2004/10/gadget#")
           (make-package "http://www.wasab.dk/morten/2004/10/gadget#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s '("Gadget" "generator" "owner"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.wasab.dk/morten/2004/10/gadget#" :if-does-not-exist :load)
