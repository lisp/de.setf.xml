;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/wsa/ServiceModel.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Action"
                                          "Agent"
                                          "Capability"
                                          "Choreography"
                                          "Goal_State"
                                          "ProcessingAction"
                                          "Provider_Agent"
                                          "Provider_Entity"
                                          "Requester_Agent"
                                          "Requester_Entity"
                                          "SendingAction"
                                          "Service"
                                          "Service_Description"
                                          "Service_Interface"
                                          "Service_Intermediary"
                                          "Service_Role"
                                          "Service_Semantics"
                                          "Service_Task")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/wsa/ServiceModel.owl#")
           (make-package "http://www.w3.org/2004/02/wsa/ServiceModel.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Action" "Agent" "Capability" "Choreography" "Goal_State"
             "ProcessingAction" "Provider_Agent" "Provider_Entity"
             "Requester_Agent" "Requester_Entity" "SendingAction" "Service"
             "Service_Description" "Service_Interface" "Service_Intermediary"
             "Service_Role" "Service_Semantics" "Service_Task"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/wsa/ServiceModel.owl#" :if-does-not-exist :load)
