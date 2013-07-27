;;; 20100513T131555Z00
;;; from #<doc-node http://rdfs.org/sioc/ns #x26723C96>

(common-lisp:in-package "http://rdfs.org/sioc/ns#")
(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Community| nil nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Container| nil nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Forum|
                                  (|Container|)
                                  nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Item| nil nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Post|
                                  (|Item|
                                   |http://xmlns.com/foaf/0.1/|:|Document|)
                                  nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Role| nil nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Site| (|Space|) nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Space| nil nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Thread|
                                  (|Container|)
                                  nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#UserAccount|
                                  (|http://xmlns.com/foaf/0.1/|:|OnlineAccount|)
                                  nil)

(de.setf.resource.schema:defclass |http://rdfs.org/sioc/ns#Usergroup| nil nil)
