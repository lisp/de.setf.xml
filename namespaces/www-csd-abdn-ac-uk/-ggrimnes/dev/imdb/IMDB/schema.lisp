;;; 20100513T131756Z00
;;; from #<doc-node http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB.rdfs #x28BDFA1E>

(common-lisp:in-package "http://www.csd.abdn.ac.uk/~ggrimnes/dev/imdb/IMDB#")
(de.setf.resource.schema:defclass |Movie|
                                  nil
                                  ((|rating| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|stunt_performer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|production_designer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|votes| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|producer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|art_department| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|director| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|make_up| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|languages| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|teammember| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|casting_director| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|production_manager| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|certificate| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|special_effects| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|sound_mix| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|country| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|set_decorator| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|art_director| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|assistant_director| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|runtime| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|composer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|year| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|production_companies| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|distributor| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|cast| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|company| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|color_info| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|crewmember| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|genres| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|cinematographer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|writer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|misc_companies| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|sound_crew| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|plot| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|editor| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|costume_designer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)))

(de.setf.resource.schema:defclass |Role| nil ((|film| :type |Movie|)))
