;;; 20100513T120748Z00
;;; from #<doc-node http://www.kanzaki.com/ns/whois.rdf #x263D61B6>

(common-lisp:in-package "http://www.kanzaki.com/ns/whois#")
(de.setf.resource.schema:defclass |Education| (|Stage|) nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2003/01/geo/wgs84_pos#SpatialThing|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |Job| (|Stage|) nil)

(de.setf.resource.schema:defclass |Place|
                                  (|http://www.w3.org/2003/01/geo/wgs84_pos#|:|SpatialThing|)
                                  nil)

(de.setf.resource.schema:defclass |Stage|
                                  nil
                                  ((|where| :type |Place|)
                                   (|what| :type
                                    |http://www.w3.org/2002/07/owl#|:|Thing|)))
