;;; 20100516T184119Z00
;;; from #<doc-node http://vocab.org/resourcelist/schema-20080519.rdf #x33240DAE>

(common-lisp:in-package "http://purl.org/vocab/resourcelist/schema#")
(de.setf.resource.schema:defclass |AlternativeItem| (|Item|) nil)

(de.setf.resource.schema:defclass |Item|
                                  (|http://rdfs.org/sioc/spec|:|Item|)
                                  ((|alternative| :type |AlernativeItem|)
                                   (|resource| :type
                                    |http://purl.org/ontology/bibo|:|Document|)))

(de.setf.resource.schema:defclass |List|
                                  (|http://rdfs.org/sioc/spec|:|Container|)
                                  ((|description| :type
                                    |http://www.w3.org/2001/XMLSchema|:|string|)
                                   (|usedBy| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|contains| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Section|
                                  (|http://rdfs.org/sioc/spec|:|Container|)
                                  nil)
