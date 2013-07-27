;;; 20100513T131919Z00
;;; from #<doc-node http://www.daml.org/2001/03/daml+oil #x2A825416>

(common-lisp:in-package "http://www.daml.org/2001/03/daml+oil#")
(de.setf.resource.schema:defclass |Class|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Class|)
                                  nil)

(de.setf.resource.schema:defclass |Datatype|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Class|)
                                  nil)

(de.setf.resource.schema:defclass |DatatypeProperty|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Property|)
                                  nil)

(de.setf.resource.schema:defclass |List|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Seq|)
                                  nil)

(de.setf.resource.schema:defclass |Literal| nil nil)

(de.setf.resource.schema:defclass |ObjectProperty|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Property|)
                                  nil)

(de.setf.resource.schema:defclass |Ontology| nil nil)

(de.setf.resource.schema:defclass |Property| nil nil)

(de.setf.resource.schema:defclass |Restriction| (|Class|) nil)

(de.setf.resource.schema:defclass |TransitiveProperty| (|ObjectProperty|) nil)

(de.setf.resource.schema:defclass |UnambiguousProperty| (|ObjectProperty|) nil)

(de.setf.resource.schema:defclass |UniqueProperty|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Property|)
                                  nil)
