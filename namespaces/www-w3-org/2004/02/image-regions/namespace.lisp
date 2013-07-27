;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/image-regions#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "#boundingBox"
                                          "#Circle"
                                          "#coords"
                                          "#Ellipse"
                                          "#Polygon"
                                          "#Rectangle"
                                          "#region"
                                          "#Region"
                                          "#regionDepicts")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/image-regions#")
           (make-package "http://www.w3.org/2004/02/image-regions#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("#boundingBox" "#Circle" "#coords" "#Ellipse" "#Polygon"
             "#Rectangle" "#region" "#Region" "#regionDepicts"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/image-regions#" :if-does-not-exist :load)
