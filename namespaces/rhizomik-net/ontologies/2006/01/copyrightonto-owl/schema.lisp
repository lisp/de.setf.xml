;;; 20100513T131927Z00
;;; from #<doc-node http://rhizomik.net/ontologies/2006/01/copyrightonto.owl #x2A90F61E>

(common-lisp:in-package "http://rhizomik.net/ontologies/2006/01/copyrightonto.owl#")
(de.setf.resource.schema:defclass |Access|
                                  (|duration| |start| |theme| |theme| |Use|
                                   |medium| |manner| |Ambient| |medium|
                                   |Transfer|)
                                  nil)

(de.setf.resource.schema:defclass |Action|
                                  (|Verb|)
                                  ((|effector| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Adapt| (|Derive| |AdaptationRight|) nil)

(de.setf.resource.schema:defclass |AdaptationRight| (|TransformationRight|) nil)

(de.setf.resource.schema:defclass |Agree| (|Ambient|) nil)

(de.setf.resource.schema:defclass |Aim|
                                  (|http://www.w3.org/2002/07/owl#|:|Thing|)
                                  nil)

(de.setf.resource.schema:defclass |Ambient|
                                  (|Verb|)
                                  ((|consequence| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|reason| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Attend| (|theme| |theme| |Use|) nil)

(de.setf.resource.schema:defclass |Attribute| (|Action| |AttributionRight|) nil)

(de.setf.resource.schema:defclass |AttributionRight| (|MoralRights|) nil)

(de.setf.resource.schema:defclass |Broadcast|
                                  (|Communicate| |BroadcastingRight| |medium|
                                   |result|)
                                  nil)

(de.setf.resource.schema:defclass |BroadcastedCommunication|
                                  (|Communication|)
                                  nil)

(de.setf.resource.schema:defclass |BroadcastersRights| (|RelatedRights|) nil)

(de.setf.resource.schema:defclass |BroadcastingRight|
                                  (|CommunicationRight|)
                                  nil)

(de.setf.resource.schema:defclass |BroadcastMedium| (|CommunicationMedium|) nil)

(de.setf.resource.schema:defclass |Cite| (|QuotationRight| |Action|) nil)

(de.setf.resource.schema:defclass |Collective| nil nil)

(de.setf.resource.schema:defclass |Communicate|
                                  (|theme| |origin| |recipient| |Transfer|
                                   |result| |medium| |CommunicationRight|
                                   |medium| |theme| |result|)
                                  nil)

(de.setf.resource.schema:defclass |Communication| (|CreationProcess|) nil)

(de.setf.resource.schema:defclass |CommunicationMedium| nil nil)

(de.setf.resource.schema:defclass |CommunicationRight|
                                  (|essence| |EconomicRights|)
                                  nil)

(de.setf.resource.schema:defclass |Copy|
                                  (|result| |result| |ReproductionRight|
                                   |theme| |theme|)
                                  nil)

(de.setf.resource.schema:defclass |Copyright|
                                  (|Spatial|
                                   |http://www.w3.org/2002/07/owl#|:|Thing|
                                   |Action| |Temporal|)
                                  nil)

(de.setf.resource.schema:defclass |CounterOffer| (|Ambient|) nil)

(de.setf.resource.schema:defclass |CreationConcept| (|Creation|) nil)

(de.setf.resource.schema:defclass |CreationObject| (|Creation|) nil)

(de.setf.resource.schema:defclass |CreationProcess| (|Creation|) nil)

(de.setf.resource.schema:defclass |Derive|
                                  (|result| |aim| |TransformationRight| |theme|
                                   |result| |Ambient| |theme| |aim|)
                                  nil)

(de.setf.resource.schema:defclass |DisclosureRight| (|MoralRights|) nil)

(de.setf.resource.schema:defclass |Distribute|
                                  (|recipient| |DistributionRight| |theme|
                                   |theme| |recipient| |Transfer|)
                                  nil)

(de.setf.resource.schema:defclass |DistributionContract| (|IPRAgreement|) nil)

(de.setf.resource.schema:defclass |DistributionRight|
                                  (|essence| |EconomicRights|)
                                  nil)

(de.setf.resource.schema:defclass |EconomicRights|
                                  (|agent| |pointInTime| |essence| |Copyright|
                                   |location| |essence| |agent|)
                                  nil)

(de.setf.resource.schema:defclass |EconomicTransfer|
                                  (|agent| |recipient| |agent| |aim| |theme|
                                   |recipient| |Transfer|)
                                  nil)

(de.setf.resource.schema:defclass |EditionContract| (|IPRAgreement|) nil)

(de.setf.resource.schema:defclass |EducationRight| (|UsersRights|) nil)

(de.setf.resource.schema:defclass |Fixation| (|CreationObject|) nil)

(de.setf.resource.schema:defclass |FixationRight|
                                  (|EconomicRights| |essence|)
                                  nil)

(de.setf.resource.schema:defclass |Give|
                                  (|duration| |condition| |Distribute|)
                                  nil)

(de.setf.resource.schema:defclass |ImportationRight|
                                  (|origin| |DistributionRight|)
                                  nil)

(de.setf.resource.schema:defclass |Improvisation| (|CreationProcess|) nil)

(de.setf.resource.schema:defclass |Improvise|
                                  (|theme| |result| |location| |Action| |agent|
                                   |Spatial| |theme| |agent| |Temporal|
                                   |result| |pointInTime|)
                                  nil)

(de.setf.resource.schema:defclass |InformationRight| (|UsersRights|) nil)

(de.setf.resource.schema:defclass |Instance| (|CreationObject|) nil)

(de.setf.resource.schema:defclass |IntegrityRight| (|MoralRights|) nil)

(de.setf.resource.schema:defclass |InteractiveCommunication|
                                  (|Communication|)
                                  nil)

(de.setf.resource.schema:defclass |InteractiveMedium|
                                  (|CommunicationMedium|)
                                  nil)

(de.setf.resource.schema:defclass |IPRAgreement| (|Agree|) nil)

(de.setf.resource.schema:defclass |LegalPerson| (|Person|) nil)

(de.setf.resource.schema:defclass |Lend|
                                  (|duration| |Distribute| |condition|)
                                  nil)

(de.setf.resource.schema:defclass |LiveCommunicate| (|Communicate| |theme|) nil)

(de.setf.resource.schema:defclass |LiveCommunication|
                                  (|Communication| |isCommunicationOf|)
                                  nil)

(de.setf.resource.schema:defclass |MakeAvailable|
                                  (|Communicate| |medium| |theme| |result|
                                   |MakingAvailableRight|)
                                  nil)

(de.setf.resource.schema:defclass |MakingAvailableRight|
                                  (|CommunicationRight|)
                                  nil)

(de.setf.resource.schema:defclass |Manifest|
                                  (|Spatial| |theme| |result| |theme| |Action|
                                   |agent| |pointInTime| |Temporal| |result|
                                   |location| |agent|)
                                  nil)

(de.setf.resource.schema:defclass |Manifestation| (|CreationObject|) nil)

(de.setf.resource.schema:defclass |MoralRights|
                                  (|essence| |agent| |pointInTime| |agent|
                                   |essence| |location| |Copyright|)
                                  nil)

(de.setf.resource.schema:defclass |MotionPicture| (|Fixation|) nil)

(de.setf.resource.schema:defclass |MotionPictureRight|
                                  (|result| |FixationRight|)
                                  nil)

(de.setf.resource.schema:defclass |NaturalPerson| (|Person|) nil)

(de.setf.resource.schema:defclass |Offer| (|Ambient|) nil)

(de.setf.resource.schema:defclass |OfficialActRight| (|UsersRights|) nil)

(de.setf.resource.schema:defclass |ParodyRight| (|UsersRights|) nil)

(de.setf.resource.schema:defclass |Perform|
                                  (|theme| |pointInTime| |result| |theme|
                                   |location| |PublicPerformanceRight|
                                   |result|)
                                  nil)

(de.setf.resource.schema:defclass |Performance|
                                  (|CreationProcess|)
                                  ((|isPerformanceOf| :type |Manifestation|)
                                   (|hasFixation| :type |Fixation|)))

(de.setf.resource.schema:defclass |PerformersRights| (|RelatedRights|) nil)

(de.setf.resource.schema:defclass |Person| nil nil)

(de.setf.resource.schema:defclass |PrivateCopyRight| (|UsersRights|) nil)

(de.setf.resource.schema:defclass |Process|
                                  (|Verb|)
                                  ((|matter| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |ProducersRights| (|RelatedRights|) nil)

(de.setf.resource.schema:defclass |ProductionContract| (|IPRAgreement|) nil)

(de.setf.resource.schema:defclass |PublicPerformanceRight|
                                  (|EconomicRights|)
                                  nil)

(de.setf.resource.schema:defclass |PublicPlace| nil nil)

(de.setf.resource.schema:defclass |QuotationRight| (|UsersRights|) nil)

(de.setf.resource.schema:defclass |Record|
                                  (|result| |FixationRight| |theme| |result|
                                   |theme|)
                                  nil)

(de.setf.resource.schema:defclass |RecordedCommunication|
                                  (|Communication| |isCommunicationOf|)
                                  nil)

(de.setf.resource.schema:defclass |RecordingCommunicate|
                                  (|Communicate| |theme|)
                                  nil)

(de.setf.resource.schema:defclass |RelatedRights| (|Copyright|) nil)

(de.setf.resource.schema:defclass |Rent|
                                  (|duration| |Distribute| |RentalRight|
                                   |condition|)
                                  nil)

(de.setf.resource.schema:defclass |RentalRight| (|DistributionRight|) nil)

(de.setf.resource.schema:defclass |ReproductionRight|
                                  (|EconomicRights| |essence|)
                                  nil)

(de.setf.resource.schema:defclass |Sell|
                                  (|Distribute| |condition| |duration|)
                                  nil)

(de.setf.resource.schema:defclass |SoundRecording| (|Fixation|) nil)

(de.setf.resource.schema:defclass |SoundRecordingRight|
                                  (|result| |FixationRight|)
                                  nil)

(de.setf.resource.schema:defclass |Spatial|
                                  (|Verb|)
                                  ((|destination| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|path| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Temporal|
                                  (|Verb|)
                                  ((|completion| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |TemporaryReproductionRight|
                                  (|UsersRights|)
                                  nil)

(de.setf.resource.schema:defclass |Transfer|
                                  (|Verb|)
                                  ((|experiencer| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |TransformationRight|
                                  (|EconomicRights| |essence|)
                                  nil)

(de.setf.resource.schema:defclass |Translate| (|Derive| |TranslationRight|) nil)

(de.setf.resource.schema:defclass |TranslationRight|
                                  (|TransformationRight|)
                                  nil)

(de.setf.resource.schema:defclass |Tune|
                                  (|medium| |manner| |duration| |Use| |theme|
                                   |start| |theme| |medium| |Transfer|
                                   |Ambient|)
                                  nil)

(de.setf.resource.schema:defclass |Use|
                                  (|Temporal| |agent| |pointInTime| |location|
                                   |Action| |Spatial| |agent|)
                                  nil)

(de.setf.resource.schema:defclass |UsersRights| (|Copyright|) nil)

(de.setf.resource.schema:defclass |Verb| nil nil)

(de.setf.resource.schema:defclass |Withdraw| (|Action| |WithdrawalRight|) nil)

(de.setf.resource.schema:defclass |WithdrawalRight| (|MoralRights|) nil)

(de.setf.resource.schema:defclass |Work|
                                  (|CreationConcept|)
                                  ((|hasManifestation| :type |Manifestation|)
                                   (|isDerivationOf| :type |Work|)))
