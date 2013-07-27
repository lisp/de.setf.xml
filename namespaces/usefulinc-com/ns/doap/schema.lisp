;;; 20100513T131856Z00
;;; from #<doc-node http://usefulinc.com/ns/doap #x2A2A8F56>

(common-lisp:in-package "http://usefulinc.com/ns/doap#")
(de.setf.resource.schema:defclass |ArchRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |BazaarBranch| (|Repository|) nil)

(de.setf.resource.schema:defclass |BKRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |CVSRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |DarcsRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |GitRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |HgRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |Project|
                                  (|http://xmlns.com/wordnet/1.6|:|Project|
                                   |http://xmlns.com/foaf/0.1/|:|Project|)
                                  ((|homepage| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|old-homepage| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|release| :type |Version|)
                                   (|mailing-list| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|category| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|repository| :type |Repository|)
                                   (|download-page| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|download-mirror| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|wiki| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|bug-database| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|screenshots| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|maintainer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|developer| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|documenter| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|translator| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|tester| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|helper| :type
                                    |http://xmlns.com/foaf/0.1/|:|Person|)
                                   (|programming-language| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|os| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|implements| :type |Specification|)
                                   (|service-endpoint| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                   (|language| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|vendor| :type
                                    |http://xmlns.com/foaf/0.1/|:|Organization|)
                                   (|platform| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|audience| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|blog| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Resource|)))

(de.setf.resource.schema:defclass |Repository|
                                  nil
                                  ((|anon-root| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|browse| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|location| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Specification|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |SVNRepository| (|Repository|) nil)

(de.setf.resource.schema:defclass |Version|
                                  nil
                                  ((|revision| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|file-release| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))
