;;; 20100513T131918Z00
;;; from #<doc-node http://kanzaki.com/ns/dpd #x2A7D237E>

(common-lisp:in-package "http://www.kanzaki.com/ns/dpd#")
(de.setf.resource.schema:defclass |GenerationEvent|
                                  nil
                                  ((|near| :type |Place|)))

(de.setf.resource.schema:defclass |http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://xmlns.com/foaf/0.1/Document| nil nil)

(de.setf.resource.schema:defclass |http://xmlns.com/foaf/0.1/Image| nil nil)

(de.setf.resource.schema:defclass |Place|
                                  (|http://www.w3.org/2003/01/geo/wgs84_pos#|:|SpatialThing|)
                                  nil)
