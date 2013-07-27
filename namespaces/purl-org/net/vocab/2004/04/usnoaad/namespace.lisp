;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/net/vocab/2004/04/usnoaad#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "civil-twilight-begin"
                                          "civil-twilight-end"
                                          "sun-transit"
                                          "sunrise"
                                          "sunset")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/net/vocab/2004/04/usnoaad#")
           (make-package "http://purl.org/net/vocab/2004/04/usnoaad#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("civil-twilight-begin" "civil-twilight-end" "sun-transit"
             "sunrise" "sunset"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/net/vocab/2004/04/usnoaad#" :if-does-not-exist :load)
