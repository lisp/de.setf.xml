;;; 20100513T131613Z00
;;; from #<doc-node http://www.w3.org/1999/02/22-rdf-syntax-ns #x26B2EE16>

(common-lisp:in-package "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
(de.setf.resource.schema:defclass |Alt|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Container|)
                                  nil)

(de.setf.resource.schema:defclass |Bag|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Container|)
                                  nil)

(de.setf.resource.schema:defclass |List|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  ((|first| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                   (|rest| :type |List|)))

(de.setf.resource.schema:defclass |Property|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |Seq|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Container|)
                                  nil)

(de.setf.resource.schema:defclass |Statement|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  ((|subject| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                   (|predicate| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                   (|object| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)))
