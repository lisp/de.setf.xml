;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/relationship/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "acquaintanceOf"
                                          "ambivalentOf"
                                          "ancestorOf"
                                          "antagonistOf"
                                          "apprenticeTo"
                                          "childOf"
                                          "closeFriendOf"
                                          "collaboratesWith"
                                          "colleagueOf"
                                          "descendantOf"
                                          "employedBy"
                                          "employerOf"
                                          "enemyOf"
                                          "engagedTo"
                                          "friendOf"
                                          "grandchildOf"
                                          "grandparentOf"
                                          "hasMet"
                                          "influencedBy"
                                          "knowsByReputation"
                                          "knowsInPassing"
                                          "knowsOf"
                                          "lifePartnerOf"
                                          "livesWith"
                                          "lostContactWith"
                                          "mentorOf"
                                          "neighborOf"
                                          "parentOf"
                                          "participant"
                                          "participantIn"
                                          "Relationship"
                                          "siblingOf"
                                          "spouseOf"
                                          "worksWith"
                                          "wouldLikeToKnow")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/relationship/")
           (make-package "http://purl.org/vocab/relationship/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("acquaintanceOf" "ambivalentOf" "ancestorOf" "antagonistOf"
             "apprenticeTo" "childOf" "closeFriendOf" "collaboratesWith"
             "colleagueOf" "descendantOf" "employedBy" "employerOf" "enemyOf"
             "engagedTo" "friendOf" "grandchildOf" "grandparentOf" "hasMet"
             "influencedBy" "knowsByReputation" "knowsInPassing" "knowsOf"
             "lifePartnerOf" "livesWith" "lostContactWith" "mentorOf"
             "neighborOf" "parentOf" "participant" "participantIn"
             "Relationship" "siblingOf" "spouseOf" "worksWith"
             "wouldLikeToKnow"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/relationship/" :if-does-not-exist :load)
