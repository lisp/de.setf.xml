;;; 20100512T202636Z00
;;; from #<doc-node http://www.bnowack.de/w3photo/specs/ontology8 #x187183FE>

(common-lisp:in-package "http://www.w3.org/2004/02/image-regions#")
(de.setf.resource.schema:defclass |http://www.w3.org/2004/02/image-regions|:|Circle|
                                  (|http://www.w3.org/2004/02/image-regions|:|Region|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2004/02/image-regions|:|Ellipse|
                                  (|http://www.w3.org/2004/02/image-regions|:|Region|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2004/02/image-regions|:|Polygon|
                                  (|http://www.w3.org/2004/02/image-regions|:|Region|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2004/02/image-regions|:|Rectangle|
                                  (|http://www.w3.org/2004/02/image-regions|:|Region|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2004/02/image-regions|:|Region|
                                  nil
                                  ((|http://www.w3.org/2004/02/image-regions|:|coords|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|http://www.w3.org/2004/02/image-regions|:|regionDepicts|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                   (|http://www.w3.org/2004/02/image-regions|:|boundingBox|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))
