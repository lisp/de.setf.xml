;;; 20100513T131441Z00
;;; from #<doc-node http://trust.mindswap.org/ont/trust.owl #x21650D06>

(common-lisp:in-package "http://trust.mindswap.org/ont/trust.owl#")
(de.setf.resource.schema:defclass |TopicalTrust|
                                  nil
                                  ((|trustSubject| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|trustedAgent| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|trustedPerson| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))
