;;; 20100513T131615Z00
;;; from #<doc-node http://www.w3.org/TR/rdf-schema/rdfs-namespace.xml #x26BA2DE6>

(common-lisp:in-package "http://www.w3.org/2000/01/rdf-schema#")
(de.setf.resource.schema:defclass |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Alt|
                                  (|Container|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Bag|
                                  (|Container|)
                                  nil)

(de.setf.resource.schema:defclass |Class|
                                  (|Resource|)
                                  ((|subClassOf| :type |Class|)))

(de.setf.resource.schema:defclass |Container| (|Resource|) nil)

(de.setf.resource.schema:defclass |ContainerMembershipProperty|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Property|)
                                  nil)

(de.setf.resource.schema:defclass |Datatype| (|Class|) nil)

(de.setf.resource.schema:defclass |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|List|
                                  (|Resource|)
                                  ((|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|first|
                                    :type |Resource|)
                                   (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|rest|
                                    :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|List|)))

(de.setf.resource.schema:defclass |Literal| (|Resource|) nil)

(de.setf.resource.schema:defclass |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Property|
                                  (|Resource|)
                                  ((|subPropertyOf| :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Property|)
                                   (|domain| :type |Class|)
                                   (|range| :type |Class|)))

(de.setf.resource.schema:defclass |Resource|
                                  nil
                                  ((|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|type|
                                    :type |Class|)
                                   (|comment| :type |Literal|)
                                   (|label| :type |Literal|)
                                   (|seeAlso| :type |Resource|)
                                   (|isDefinedBy| :type |Resource|)
                                   (|member| :type |Resource|)
                                   (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|value|
                                    :type |Resource|)))

(de.setf.resource.schema:defclass |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Seq|
                                  (|Container|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Statement|
                                  (|Resource|)
                                  ((|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|subject|
                                    :type |Resource|)
                                   (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|predicate|
                                    :type |Resource|)
                                   (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|object|
                                    :type |Resource|)))
