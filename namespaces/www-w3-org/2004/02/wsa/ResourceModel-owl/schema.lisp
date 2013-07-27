;;; 20100513T120750Z00
;;; from #<doc-node http://www.w3.org/2004/02/wsa/ResourceModel.owl# #x2656729E>

(common-lisp:in-package "http://www.w3.org/2004/02/wsa/ResourceModel.owl#")
(de.setf.resource.schema:defclass |Discovery|
                                  nil
                                  ((|performed_by| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Agent|)
                                   (|discovery_realized_by| :type
                                    |Discovery_Service|)))

(de.setf.resource.schema:defclass |Discovery_Service|
                                  (|http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Service|)
                                  ((|publish| :type |Resource_Description|)
                                   (|search| :type |Resource_Description|)
                                   (|used_by| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Agent|)))

(de.setf.resource.schema:defclass |Identifier|
                                  nil
                                  ((|identify| :type |Resource|)))

(de.setf.resource.schema:defclass |Representation|
                                  nil
                                  ((|representation| :type |Resource|)))

(de.setf.resource.schema:defclass |Resource|
                                  nil
                                  ((|resource_description| :type
                                    |Resource_Description|)
                                   (|owned_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|governed_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)))

(de.setf.resource.schema:defclass |Resource_Description| nil nil)
