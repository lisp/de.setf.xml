;;; 20100516T153112Z00
;;; from #<doc-node http://vocab.org/bio/0.1/.rdf #x30A883CE>

(common-lisp:in-package "http://purl.org/vocab/bio/0.1/")
(de.setf.resource.schema:defclass |Birth| (|Event|) nil)

(de.setf.resource.schema:defclass |Death| (|Event|) nil)

(de.setf.resource.schema:defclass |Event|
                                  nil
                                  ((|place| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|date| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Marriage| (|Event|) nil)

(de.setf.resource.schema::extclass |http://xmlns.com/foaf/0.1/|:|Person| nil
 (|olb| :type |http://www.w3.org/2000/01/rdf-schema#|:|Literal| |keywords|
  :type |http://www.w3.org/2000/01/rdf-schema#|:|Literal| |event| :type
  |Event|))
