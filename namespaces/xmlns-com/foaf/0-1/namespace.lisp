;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://xmlns.com/foaf/0.1/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "account"
                                          "accountName"
                                          "accountServiceHomepage"
                                          "age"
                                          "Agent"
                                          "aimChatID"
                                          "based_near"
                                          "birthday"
                                          "currentProject"
                                          "depiction"
                                          "depicts"
                                          "dnaChecksum"
                                          "Document"
                                          "family_name"
                                          "familyName"
                                          "firstName"
                                          "fundedBy"
                                          "geekcode"
                                          "gender"
                                          "givenname"
                                          "givenName"
                                          "Group"
                                          "holdsAccount"
                                          "homepage"
                                          "icqChatID"
                                          "Image"
                                          "img"
                                          "interest"
                                          "isPrimaryTopicOf"
                                          "jabberID"
                                          "knows"
                                          "LabelProperty"
                                          "logo"
                                          "made"
                                          "maker"
                                          "mbox"
                                          "mbox_sha1sum"
                                          "member"
                                          "membershipClass"
                                          "msnChatID"
                                          "myersBriggs"
                                          "name"
                                          "nick"
                                          "OnlineAccount"
                                          "OnlineChatAccount"
                                          "OnlineEcommerceAccount"
                                          "OnlineGamingAccount"
                                          "openid"
                                          "Organization"
                                          "page"
                                          "pastProject"
                                          "Person"
                                          "PersonalProfileDocument"
                                          "phone"
                                          "plan"
                                          "primaryTopic"
                                          "Project"
                                          "publications"
                                          "schoolHomepage"
                                          "sha1"
                                          "skypeID"
                                          "status"
                                          "surname"
                                          "theme"
                                          "thumbnail"
                                          "tipjar"
                                          "title"
                                          "topic"
                                          "topic_interest"
                                          "weblog"
                                          "workInfoHomepage"
                                          "workplaceHomepage"
                                          "yahooChatID")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://xmlns.com/foaf/0.1/")
           (make-package "http://xmlns.com/foaf/0.1/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("account" "accountName" "accountServiceHomepage" "age" "Agent"
             "aimChatID" "based_near" "birthday" "currentProject" "depiction"
             "depicts" "dnaChecksum" "Document" "family_name" "familyName"
             "firstName" "fundedBy" "geekcode" "gender" "givenname" "givenName"
             "Group" "holdsAccount" "homepage" "icqChatID" "Image" "img"
             "interest" "isPrimaryTopicOf" "jabberID" "knows" "LabelProperty"
             "logo" "made" "maker" "mbox" "mbox_sha1sum" "member"
             "membershipClass" "msnChatID" "myersBriggs" "name" "nick"
             "OnlineAccount" "OnlineChatAccount" "OnlineEcommerceAccount"
             "OnlineGamingAccount" "openid" "Organization" "page" "pastProject"
             "Person" "PersonalProfileDocument" "phone" "plan" "primaryTopic"
             "Project" "publications" "schoolHomepage" "sha1" "skypeID"
             "status" "surname" "theme" "thumbnail" "tipjar" "title" "topic"
             "topic_interest" "weblog" "workInfoHomepage" "workplaceHomepage"
             "yahooChatID"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://xmlns.com/foaf/0.1/" :if-does-not-exist :load)
