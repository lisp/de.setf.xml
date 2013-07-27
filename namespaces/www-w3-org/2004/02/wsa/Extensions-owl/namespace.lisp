;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/wsa/Extensions.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Body_Content"
                                          "Capability_Semantics"
                                          "ChoreographyDescriptionLanguage"
                                          "Computational_Resource"
                                          "Language"
                                          "Message_Acknowledgements"
                                          "Message_Semantics"
                                          "NetworkAddress"
                                          "PolicyDescriptionLanguage"
                                          "Semantics"
                                          "Service_Invocation"
                                          "ServiceDescriptionLanguage"
                                          "ServiceSemanticsDescriptionLanguage"
                                          "State"
                                          "URI")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/wsa/Extensions.owl#")
           (make-package "http://www.w3.org/2004/02/wsa/Extensions.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Body_Content" "Capability_Semantics"
             "ChoreographyDescriptionLanguage" "Computational_Resource"
             "Language" "Message_Acknowledgements" "Message_Semantics"
             "NetworkAddress" "PolicyDescriptionLanguage" "Semantics"
             "Service_Invocation" "ServiceDescriptionLanguage"
             "ServiceSemanticsDescriptionLanguage" "State" "URI"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/wsa/Extensions.owl#" :if-does-not-exist :load)
