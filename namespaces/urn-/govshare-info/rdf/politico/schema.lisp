;;; 20100512T222245Z00
;;; from #<doc-node http://www.govtrack.us/share/politico.rdf #x1AB1294E>

(common-lisp:in-package "urn://govshare.info/rdf/politico/")
(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/politico/|:|Country|
                                  (|http://www.rdfabout.com/rdf/schema/politico/|:|Organization|)
                                  nil
                                  (:documentation "A country."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/politico/|:|Office|
                                  (|http://www.rdfabout.com/rdf/schema/politico/|:|Organization|)
                                  nil
                                  (:documentation
                                    "A political position filled by one or more people."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/politico/|:|Organization|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  ((|http://www.rdfabout.com/rdf/schema/politico/|:|represents|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|
                                    :documentation
                                    "Relates an organization to an entity represented by the organization."))
                                  (:documentation
                                    "A political or governmental organization."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/politico/|:|Politician|
                                  (|http://xmlns.com/foaf/0.1/|:|Person|)
                                  ((|http://www.rdfabout.com/rdf/schema/politico/|:|hasRole|
                                    :type
                                    |http://www.rdfabout.com/rdf/schema/politico/|:|Term|
                                    :documentation
                                    "Points to a role held by a politician."))
                                  (:documentation
                                    "A person in the political world."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/politico/|:|Term|
                                  nil
                                  ((|http://www.rdfabout.com/rdf/schema/politico/|:|forOffice|
                                    :type
                                    |http://www.rdfabout.com/rdf/schema/politico/|:|Organization|
                                    :documentation
                                    "Designates the office fulfilled by a Term."))
                                  (:documentation
                                    "A term in which a Politician held a position in an Organization."))
