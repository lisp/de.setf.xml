;;; 20100513T120802Z00
;;; from #<doc-node http://www.mindswap.org/2003/vegetarian.owl #x2682E906>

(common-lisp:in-package "http://www.mindswap.org/2003/vegetarian.owl#")
(de.setf.resource.schema:defclass |LactoVegetarian| (|Ovo-LactoVegetarian|) nil)

(de.setf.resource.schema:defclass |LactoVegetarianFood| nil nil)

(de.setf.resource.schema:defclass |Meat| nil nil)

(de.setf.resource.schema:defclass |Omnivore| nil nil)

(de.setf.resource.schema:defclass |Ovo-LactoVegetarian| (|Vegetarian|) nil)

(de.setf.resource.schema:defclass |OvoLactoVegetarianFood| nil nil)

(de.setf.resource.schema:defclass |OvoVegetarian| (|Ovo-LactoVegetarian|) nil)

(de.setf.resource.schema:defclass |OvoVegetarianFood| nil nil)

(de.setf.resource.schema:defclass |Vegan| (|Vegetarian|) nil)

(de.setf.resource.schema:defclass |VeganFood| nil nil)

(de.setf.resource.schema:defclass |Vegetarian|
                                  (|http://www.isi.edu/webscripter/person.o.daml#|:|Person|
                                   |http://xmlns.com/foaf/0.1/|:|Person|
                                   |http://xmlns.com/foaf/0.1/|:|Person|)
                                  ((|eats| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |VegetarianFood| nil nil)
