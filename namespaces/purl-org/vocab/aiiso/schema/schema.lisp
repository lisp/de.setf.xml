;;; 20100516T170417Z00
;;; from #<doc-node http://purl.org/vocab/aiiso/schema-20080925.rdf #x31E294F6>

(common-lisp:in-package "http://purl.org/vocab/aiiso/schema-20080925.rdf")
(de.setf.resource.schema:defclass |Center|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |College|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |Course| (|KnowledgeGrouping|) nil)

(de.setf.resource.schema:defclass |Department|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |Division|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |Faculty|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |Institute|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |Institution|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |KnowledgeGrouping| nil nil)

(de.setf.resource.schema:defclass |Module| (|KnowledgeGrouping|) nil)

(de.setf.resource.schema:defclass |organizationalUnit| nil nil)

(de.setf.resource.schema:defclass |Programme| (|KnowledgeGrouping|) nil)

(de.setf.resource.schema:defclass |ResearchGroup|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |School|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |Subject| (|KnowledgeGrouping|) nil)
