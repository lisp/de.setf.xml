;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/net/vocab/2003/11/photo#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "flashBiasValue"
                                          "fovCropFactor"
                                          "histogram"
                                          "LensRange"
                                          "maxFocalLength"
                                          "minFocalLength"
                                          "owner"
                                          "range"
                                          "similarity_hash")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/net/vocab/2003/11/photo#")
           (make-package "http://purl.org/net/vocab/2003/11/photo#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("flashBiasValue" "fovCropFactor" "histogram" "LensRange"
             "maxFocalLength" "minFocalLength" "owner" "range"
             "similarity_hash"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/net/vocab/2003/11/photo#" :if-does-not-exist :load)
