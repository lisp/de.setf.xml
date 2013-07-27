;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/2004/02/wsa/MessageModel.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Address"
                                          "Delivery_Policy"
                                          "Message"
                                          "Message_Body"
                                          "Message_Correlation"
                                          "Message_Envelope"
                                          "Message_Exchange_Pattern"
                                          "Message_Header"
                                          "Message_Receiver"
                                          "Message_Reliability"
                                          "Message_Sender"
                                          "Message_Sequence"
                                          "Message_Transport")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/2004/02/wsa/MessageModel.owl#")
           (make-package "http://www.w3.org/2004/02/wsa/MessageModel.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Address" "Delivery_Policy" "Message" "Message_Body"
             "Message_Correlation" "Message_Envelope"
             "Message_Exchange_Pattern" "Message_Header" "Message_Receiver"
             "Message_Reliability" "Message_Sender" "Message_Sequence"
             "Message_Transport"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/2004/02/wsa/MessageModel.owl#" :if-does-not-exist :load)
