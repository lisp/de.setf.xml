;;; 20100513T120750Z00
;;; from #<doc-node http://www.w3.org/2004/02/wsa/PolicyModel.owl #x265ACF66>

(common-lisp:in-package "http://www.w3.org/2004/02/wsa/PolicyModel.owl#")
(de.setf.resource.schema:defclass |Audit_Guard|
                                  (|Policy_Guard|)
                                  ((|monitor| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Resource|)))

(de.setf.resource.schema:defclass |Domain|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|List|)
                                  ((|scopeOf| :type |Policy|)))

(de.setf.resource.schema:defclass |Obligation| (|Policy|) nil)

(de.setf.resource.schema:defclass |Permission|
                                  (|Policy|)
                                  ((|enable_action| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Action|)
                                   (|enable_state| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|State|)))

(de.setf.resource.schema:defclass |Permission_Guard|
                                  (|Policy_Guard|)
                                  ((|enforce| :type |Permission|)
                                   (|control| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Resource|)))

(de.setf.resource.schema:defclass |Person_or_Organization|
                                  nil
                                  ((|owner| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Agent|)
                                   (|member_of| :type |Domain|)))

(de.setf.resource.schema:defclass |Policy|
                                  nil
                                  ((|constraints_action| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Action|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|describedBy| :type |Policy_Description|)
                                   (|capability| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Capability|)))

(de.setf.resource.schema:defclass |Policy_Description| nil nil)

(de.setf.resource.schema:defclass |Policy_Guard|
                                  nil
                                  ((|has_a| :type |Person_or_Organization|)))
