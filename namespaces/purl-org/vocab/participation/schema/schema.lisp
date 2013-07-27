;;; 20100516T175217Z00
;;; from #<doc-node http://purl.org/vocab/participation/schema-20080925.rdf #x323209EE>

(common-lisp:in-package "http://purl.org/vocab/participation/schema-20080925.rdf")
(de.setf.resource.schema:defclass |Role|
                                  nil
                                  ((|endDate| :type
                                    |http://www.w3.org/2001/XMLSchema#|:|Date|)
                                   (|startDate| :type
                                    |http://www.w3.org/2001/XMLSchema#|:|Date|)
                                   (|holder| :type
                                    |http://xmlns.com/foaf/0.1/|:|Agent|)
                                   (|role_at| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))
