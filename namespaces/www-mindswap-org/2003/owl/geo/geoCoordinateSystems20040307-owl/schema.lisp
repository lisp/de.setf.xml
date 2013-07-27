;;; 20100513T131805Z00
;;; from #<doc-node http://www.mindswap.org/2003/owl/geo/geoCoordinateSystems.owl #x28FBC96E>

(common-lisp:in-package "http://www.mindswap.org/2003/owl/geo/geoCoordinateSystems20040307.owl#")
(de.setf.resource.schema:defclass |Continental|
                                  (|ProjectedCoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |CoordinateOrigin| nil nil)

(de.setf.resource.schema:defclass |CoordinateSystem| nil nil)

(de.setf.resource.schema:defclass |GaussKruger|
                                  (|ProjectedCoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |GeographicCoordinateSystem|
                                  (|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |LocalCoordinateSystem|
                                  (|CoordinateSystem|)
                                  ((|hasCoordinateOrigin| :type
                                    |CoordinateOrigin|)
                                   (|xOrigin| :type
                                    |http://www.mindswap.org/2003/owl/geo/geoFeatures20040307.owl#|::|SpatialThing|)
                                   (|yOrigin| :type
                                    |http://www.mindswap.org/2003/owl/geo/geoFeatures20040307.owl#|::|SpatialThing|)
                                   (|zOrigin| :type
                                    |http://www.mindswap.org/2003/owl/geo/geoFeatures20040307.owl#|::|SpatialThing|)
                                   (|hasXAxisReference| :type
                                    |http://www.mindswap.org/2003/owl/geo/geoFeatures20040307.owl#|::|Point|)
                                   (|hasYAxisReference| :type
                                    |http://www.mindswap.org/2003/owl/geo/geoFeatures20040307.owl#|::|Point|)))

(de.setf.resource.schema:defclass |NationalGrids|
                                  (|ProjectedCoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Polar| (|ProjectedCoordinateSystem|) nil)

(de.setf.resource.schema:defclass |ProjectedCoordinateSystem|
                                  (|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |StatePlane|
                                  (|ProjectedCoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass utm (|ProjectedCoordinateSystem|) nil)

(de.setf.resource.schema:defclass |World| (|ProjectedCoordinateSystem|) nil)
