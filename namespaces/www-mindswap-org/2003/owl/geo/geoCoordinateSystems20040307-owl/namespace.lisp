;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.mindswap.org/2003/owl/geo/geoCoordinateSystems20040307.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Continental"
                                          "CoordinateOrigin"
                                          "CoordinateSystem"
                                          "GaussKruger"
                                          "GeographicCoordinateSystem"
                                          "LocalCoordinateSystem"
                                          "NationalGrids"
                                          "Polar"
                                          "ProjectedCoordinateSystem"
                                          "StatePlane"
                                          "UTM"
                                          "World")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.mindswap.org/2003/owl/geo/geoCoordinateSystems20040307.owl#")
           (make-package "http://www.mindswap.org/2003/owl/geo/geoCoordinateSystems20040307.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Continental" "CoordinateOrigin" "CoordinateSystem" "GaussKruger"
             "GeographicCoordinateSystem" "LocalCoordinateSystem"
             "NationalGrids" "Polar" "ProjectedCoordinateSystem" "StatePlane"
             "UTM" "World"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.mindswap.org/2003/owl/geo/geoCoordinateSystems20040307.owl#" :if-does-not-exist :load)
