;;; 20100513T120749Z00
;;; from #<doc-node http://www.w3.org/2004/02/wsa/ServiceModel.owl #x2644A27E>

(common-lisp:in-package "http://www.w3.org/2004/02/wsa/ServiceModel.owl#")
(de.setf.resource.schema:defclass |Action| nil ((|result| :type |Goal_State|)))

(de.setf.resource.schema:defclass |Agent|
                                  (|http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Resource|
                                   |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|Computational_Resource|)
                                  ((|realize_service| :type |Service|)
                                   (|request_service| :type |Service|)
                                   (|advertised_by| :type |Capability|)
                                   (|required_by| :type |Capability|)))

(de.setf.resource.schema:defclass |Capability|
                                  nil
                                  ((|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|capability_semantics| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|Capability_Semantics|)))

(de.setf.resource.schema:defclass |Choreography|
                                  nil
                                  ((|uses| :type |Service_Interface|)
                                   (|expressedIn| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ChoreographyDescriptionLanguage|)))

(de.setf.resource.schema:defclass |Goal_State|
                                  (|http://www.w3.org/2004/02/wsa/Extensions.owl#|::|State|)
                                  ((|desired_goal_state| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|desired_goal_state| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)))

(de.setf.resource.schema:defclass |ProcessingAction| (|Action|) nil)

(de.setf.resource.schema:defclass |Provider_Agent|
                                  (|Agent|)
                                  ((|pa_acts_on_behalf| :type
                                    |Provider_Entity|)))

(de.setf.resource.schema:defclass |Provider_Entity|
                                  (|http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                  ((|offers| :type |Service|)
                                   (|offers| :type |Service|)))

(de.setf.resource.schema:defclass |Requester_Agent|
                                  (|Agent|)
                                  ((|ra_acts_on_behalf| :type
                                    |Requester_Entity|)))

(de.setf.resource.schema:defclass |Requester_Entity|
                                  (|http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                  nil)

(de.setf.resource.schema:defclass |SendingAction| (|Action|) nil)

(de.setf.resource.schema:defclass |Service|
                                  (|http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Resource|)
                                  ((|perform_task| :type |Service_Task|)
                                   (|service_description| :type
                                    |Service_Description|)
                                   (|service_interface| :type
                                    |Service_Interface|)
                                   (|service_semantics| :type
                                    |Service_Semantics|)
                                   (|service_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|service_role| :type |Service_Role|)
                                   (|policy| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)
                                   (|owned_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|provided_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|perform_task| :type |Service_Task|)
                                   (|service_description| :type
                                    |Service_Description|)
                                   (|service_interface| :type
                                    |Service_Interface|)
                                   (|service_semantics| :type
                                    |Service_Semantics|)
                                   (|service_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|service_role| :type |Service_Role|)
                                   (|policy| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)
                                   (|owned_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|provided_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|perform_task| :type |Service_Task|)
                                   (|service_description| :type
                                    |Service_Description|)
                                   (|service_interface| :type
                                    |Service_Interface|)
                                   (|service_semantics| :type
                                    |Service_Semantics|)
                                   (|service_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|service_role| :type |Service_Role|)
                                   (|policy| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)
                                   (|owned_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|provided_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|perform_task| :type |Service_Task|)
                                   (|service_description| :type
                                    |Service_Description|)
                                   (|service_interface| :type
                                    |Service_Interface|)
                                   (|service_semantics| :type
                                    |Service_Semantics|)
                                   (|service_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|service_role| :type |Service_Role|)
                                   (|policy| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)
                                   (|owned_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|provided_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|perform_task| :type |Service_Task|)
                                   (|service_description| :type
                                    |Service_Description|)
                                   (|service_interface| :type
                                    |Service_Interface|)
                                   (|service_semantics| :type
                                    |Service_Semantics|)
                                   (|service_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|service_role| :type |Service_Role|)
                                   (|policy| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)
                                   (|owned_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)
                                   (|provided_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)))

(de.setf.resource.schema:defclass |Service_Description|
                                  nil
                                  ((|has_capability| :type |Capability|)
                                   (|sd_service_interface| :type
                                    |Service_Interface|)
                                   (|sd_service_semantics| :type
                                    |Service_Semantics|)
                                   (|sd_expressed_in| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)))

(de.setf.resource.schema:defclass |Service_Interface|
                                  nil
                                  ((|define| :type
                                    |http://www.w3.org/2004/02/wsa/MessageModel.owl#|::|Message|)))

(de.setf.resource.schema:defclass |Service_Intermediary|
                                  (|Service|)
                                  ((|has_role| :type |Service_Role|)
                                   (|preserves| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|Message_Semantics|)))

(de.setf.resource.schema:defclass |Service_Role|
                                  (|Service_Task|)
                                  ((|associated_with| :type |Service_Task|)
                                   (|sr_defined_by| :type
                                    |http://www.w3.org/2004/02/wsa/PolicyModel.owl#|::|Person_or_Organization|)))

(de.setf.resource.schema:defclass |Service_Semantics|
                                  nil
                                  ((|ss_described_in| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceSemanticsDescriptionLanguage|)))

(de.setf.resource.schema:defclass |Service_Task|
                                  (|Action|)
                                  ((|st_service_interface| :type
                                    |Service_Interface|)))
