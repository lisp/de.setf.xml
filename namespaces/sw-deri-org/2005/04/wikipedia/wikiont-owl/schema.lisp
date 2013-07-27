;;; 20100513T120746Z00
;;; from #<doc-node http://sw.deri.org/2005/04/wikipedia/wikiont.owl #x263ABA2E>

(common-lisp:in-package "http://sw.deri.org/2005/04/wikipedia/wikiont.owl#")
(de.setf.resource.schema:defclass |Article| nil nil)

(de.setf.resource.schema:defclass |Category|
                                  (|http://sw.deri.org/2005/04/wikipedia/index.rdf#|:|Article|)
                                  nil)

(de.setf.resource.schema:defclass |Image| nil nil)

(de.setf.resource.schema:defclass |Stub|
                                  (|http://sw.deri.org/2005/04/wikipedia/index.rdf#|:|Article|)
                                  nil)
