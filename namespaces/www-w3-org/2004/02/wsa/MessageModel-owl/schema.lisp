;;; 20100513T120751Z00
;;; from #<doc-node http://www.w3.org/2004/02/wsa/MessageModel.owl #x26608BF6>

(common-lisp:in-package "http://www.w3.org/2004/02/wsa/MessageModel.owl#")
(de.setf.resource.schema:defclass |Address|
                                  nil
                                  ((|realizedBy| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::uri)
                                   (|contained_in_msg_env| :type
                                    |Message_Envelope|)))

(de.setf.resource.schema:defclass |Delivery_Policy|
                                  (|http://www.w3.org/2004/02/wsa/PolicyModel.owl#|:|Policy|)
                                  ((|constrains| :type |Message_Transport|)
                                   (|expressedIn| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|PolicyDescriptionLanguage|)))

(de.setf.resource.schema:defclass |http://www.w3.org/2004/02/wsa/ServiceModel.owlService_Intermediary|
                                  (|Message_Receiver| |Message_Sender|)
                                  nil)

(de.setf.resource.schema:defclass |Message|
                                  nil
                                  ((|part_of_sequence| :type
                                    |Message_Sequence|)
                                   (|describedUsing| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)
                                   (|message_sender| :type |Message_Sender|)
                                   (|message_recipient| :type
                                    |Message_Receiver|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|message_body| :type |Message_Body|)
                                   (|message_header| :type |Message_Header|)
                                   (|message_envelope| :type
                                    |Message_Envelope|)
                                   (|message_transport| :type
                                    |Message_Transport|)
                                   (|associated_policy| :type
                                    |Delivery_Policy|)
                                   (|correlation_id| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|part_of_sequence| :type
                                    |Message_Sequence|)
                                   (|describedUsing| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)
                                   (|message_sender| :type |Message_Sender|)
                                   (|message_recipient| :type
                                    |Message_Receiver|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|message_body| :type |Message_Body|)
                                   (|message_header| :type |Message_Header|)
                                   (|message_envelope| :type
                                    |Message_Envelope|)
                                   (|message_transport| :type
                                    |Message_Transport|)
                                   (|associated_policy| :type
                                    |Delivery_Policy|)
                                   (|correlation_id| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|part_of_sequence| :type
                                    |Message_Sequence|)
                                   (|describedUsing| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)
                                   (|message_sender| :type |Message_Sender|)
                                   (|message_recipient| :type
                                    |Message_Receiver|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|message_body| :type |Message_Body|)
                                   (|message_header| :type |Message_Header|)
                                   (|message_envelope| :type
                                    |Message_Envelope|)
                                   (|message_transport| :type
                                    |Message_Transport|)
                                   (|associated_policy| :type
                                    |Delivery_Policy|)
                                   (|correlation_id| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|part_of_sequence| :type
                                    |Message_Sequence|)
                                   (|describedUsing| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)
                                   (|message_sender| :type |Message_Sender|)
                                   (|message_recipient| :type
                                    |Message_Receiver|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|message_body| :type |Message_Body|)
                                   (|message_header| :type |Message_Header|)
                                   (|message_envelope| :type
                                    |Message_Envelope|)
                                   (|message_transport| :type
                                    |Message_Transport|)
                                   (|associated_policy| :type
                                    |Delivery_Policy|)
                                   (|correlation_id| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|part_of_sequence| :type
                                    |Message_Sequence|)
                                   (|describedUsing| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)
                                   (|message_sender| :type |Message_Sender|)
                                   (|message_recipient| :type
                                    |Message_Receiver|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|message_body| :type |Message_Body|)
                                   (|message_header| :type |Message_Header|)
                                   (|message_envelope| :type
                                    |Message_Envelope|)
                                   (|message_transport| :type
                                    |Message_Transport|)
                                   (|associated_policy| :type
                                    |Delivery_Policy|)
                                   (|correlation_id| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|part_of_sequence| :type
                                    |Message_Sequence|)
                                   (|describedUsing| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|ServiceDescriptionLanguage|)
                                   (|message_sender| :type |Message_Sender|)
                                   (|message_recipient| :type
                                    |Message_Receiver|)
                                   (|has_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|message_body| :type |Message_Body|)
                                   (|message_header| :type |Message_Header|)
                                   (|message_envelope| :type
                                    |Message_Envelope|)
                                   (|message_transport| :type
                                    |Message_Transport|)
                                   (|associated_policy| :type
                                    |Delivery_Policy|)
                                   (|correlation_id| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)))

(de.setf.resource.schema:defclass |Message_Body|
                                  nil
                                  ((|contained_by| :type |Message_Envelope|)
                                   (|content| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|Body_Content|)))

(de.setf.resource.schema:defclass |Message_Correlation| nil nil)

(de.setf.resource.schema:defclass |Message_Envelope|
                                  nil
                                  ((|me_message_header| :type
                                    |Message_Header|)))

(de.setf.resource.schema:defclass |Message_Exchange_Pattern|
                                  nil
                                  ((|mep_identifier| :type
                                    |http://www.w3.org/2004/02/wsa/ResourceModel.owl#|:|Identifier|)
                                   (|realize_correlation| :type
                                    |Message_Correlation|)
                                   (|describe_service_invocation| :type
                                    |http://www.w3.org/2004/02/wsa/Extensions.owl#|::|Service_Invocation|)))

(de.setf.resource.schema:defclass |Message_Header|
                                  nil
                                  ((|service_role| :type
                                    |http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Service_Role|)))

(de.setf.resource.schema:defclass |Message_Receiver|
                                  (|http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Agent|)
                                  nil)

(de.setf.resource.schema:defclass |Message_Reliability|
                                  nil
                                  ((|reliability_realized_by| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|realized_by| :type |Message_Transport|)))

(de.setf.resource.schema:defclass |Message_Sender|
                                  (|http://www.w3.org/2004/02/wsa/ServiceModel.owl#|:|Agent|)
                                  nil)

(de.setf.resource.schema:defclass |Message_Sequence|
                                  nil
                                  ((|realize_mep| :type
                                    |Message_Exchange_Pattern|)))

(de.setf.resource.schema:defclass |Message_Transport|
                                  nil
                                  ((|constrained_by| :type |Delivery_Policy|)))
