;;; 20100513T131708Z00
;;; from #<doc-node http://www.daml.org/services/owl-s/1.1/Profile.owl #x27BE5A66>

(common-lisp:in-package "http://www.daml.org/services/owl-s/1.1/Profile.owl#")
(de.setf.resource.schema:defclass |Profile|
                                  (|http://www.daml.org/services/owl-s/1.1/Service.owl#|::|ServiceProfile|)
                                  ((|contactInformation| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|has_process| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|:|Process|)
                                   (|serviceCategory| :type |ServiceCategory|)
                                   (|serviceParameter| :type
                                    |ServiceParameter|)
                                   (|hasParameter| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|::|Parameter|)
                                   (|hasPrecondition| :type
                                    |http://www.daml.org/services/owl-s/1.1/generic/Expression.owl#|:|Condition|)
                                   (|hasResult| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|:|Result|)
                                   (|contactInformation| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|has_process| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|:|Process|)
                                   (|serviceCategory| :type |ServiceCategory|)
                                   (|serviceParameter| :type
                                    |ServiceParameter|)
                                   (|hasParameter| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|::|Parameter|)
                                   (|hasPrecondition| :type
                                    |http://www.daml.org/services/owl-s/1.1/generic/Expression.owl#|:|Condition|)
                                   (|hasResult| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|:|Result|)
                                   (|contactInformation| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|has_process| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|:|Process|)
                                   (|serviceCategory| :type |ServiceCategory|)
                                   (|serviceParameter| :type
                                    |ServiceParameter|)
                                   (|hasParameter| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|::|Parameter|)
                                   (|hasPrecondition| :type
                                    |http://www.daml.org/services/owl-s/1.1/generic/Expression.owl#|:|Condition|)
                                   (|hasResult| :type
                                    |http://www.daml.org/services/owl-s/1.1/Process.owl#|:|Result|)))

(de.setf.resource.schema:defclass |ServiceCategory| nil nil)

(de.setf.resource.schema:defclass |ServiceParameter|
                                  nil
                                  ((|sParameter| :type
                                    |http://www.w3.org/2002/07/owl#|:|Thing|)
                                   (|sParameter| :type
                                    |http://www.w3.org/2002/07/owl#|:|Thing|)
                                   (|sParameter| :type
                                    |http://www.w3.org/2002/07/owl#|:|Thing|)))
