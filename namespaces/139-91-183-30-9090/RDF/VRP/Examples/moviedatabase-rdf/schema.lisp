;;; 20100513T185539Z00
;;; from #<doc-node http://139.91.183.30:9090/RDF/VRP/Examples/moviedatabase.rdf #x2D0FA7D6>

(common-lisp:in-package "http://139.91.183.30:9090/RDF/VRP/Examples/moviedatabase.rdf#")
(de.setf.resource.schema:defclass |Action| (|Movie|) nil)

(de.setf.resource.schema:defclass |ActionIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Actor| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |Adult| (|Movie|) nil)

(de.setf.resource.schema:defclass |Adventure| (|Movie|) nil)

(de.setf.resource.schema:defclass |Animation| (|Movie|) nil)

(de.setf.resource.schema:defclass |AnimationCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Apperance| (|Qualification|) nil)

(de.setf.resource.schema:defclass |ArtDepartmentIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |ArtDepartmentPerson| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |ArtDirectionIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |ArtDirector| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |AssistantDirectionIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |AssistantDirector| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |AudioCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |AwardsandNominated|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |CameraequipmentCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |CastIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |CastingBy| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |CastingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Cinematographer| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |CinematographyIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Comedy| (|Movie|) nil)

(de.setf.resource.schema:defclass |Company|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |Composer| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |ComputerequipmentCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |CostumeCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |CostumeDesigner| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |CostumesIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Crime| (|Movie|) nil)

(de.setf.resource.schema:defclass |DecorationIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Decorator| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |DesignIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |DialoguerecordingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |DigitalcompositingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |DirectionIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Director| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |DistributionCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Documentary| (|Movie|) nil)

(de.setf.resource.schema:defclass |Drama| (|Movie|) nil)

(de.setf.resource.schema:defclass |EditingIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Editor| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |ElectronicInkandPaintCompany|
                                  (|Company|)
                                  nil)

(de.setf.resource.schema:defclass |Family| (|Movie|) nil)

(de.setf.resource.schema:defclass |Fantasy| (|Movie|) nil)

(de.setf.resource.schema:defclass |Film-Noir| (|Movie|) nil)

(de.setf.resource.schema:defclass |FireprotectionCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |FundingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |GripequipmentCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Guest| (|Actor|) nil)

(de.setf.resource.schema:defclass |HairstylistCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Horror| (|Movie|) nil)

(de.setf.resource.schema:defclass |LightingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |MakeupIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |MakeupPerson| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |Movie|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |MoviePerson|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |Musical| (|Movie|) nil)

(de.setf.resource.schema:defclass |MusicandSoundeffectsCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |MusicrecordingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Mystery| (|Movie|) nil)

(de.setf.resource.schema:defclass |Post_productionservicesCompany|
                                  (|Company|)
                                  nil)

(de.setf.resource.schema:defclass |Producer| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |ProductionCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |ProductionDesigner| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |ProductionIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |ProductionManager| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |ProductionManagmentIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |PublicationCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Qualification|
                                  (|http://www.w3.org/2000/01/rdf-schema#|:|Resource|)
                                  nil)

(de.setf.resource.schema:defclass |Role| (|Qualification|) nil)

(de.setf.resource.schema:defclass |Romance| (|Movie|) nil)

(de.setf.resource.schema:defclass |SafetyCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |SalesrepresentationCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Sci-Fi| (|Movie|) nil)

(de.setf.resource.schema:defclass |Short| (|Movie|) nil)

(de.setf.resource.schema:defclass |SoundandEditingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |SoundCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |SoundIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |SoundPerson| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |SoundrecordingCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |SpecialEffectsCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |SpecialEffectsIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |SpecialEffectsPerson| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |SponsorsCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Stunt| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |Thriller| (|Movie|) nil)

(de.setf.resource.schema:defclass |TitlesandopticalsCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |Videopost_productionCompany| (|Company|) nil)

(de.setf.resource.schema:defclass |VisualEffectsIn| (|Qualification|) nil)

(de.setf.resource.schema:defclass |VisualEffectsPerson| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |War| (|Movie|) nil)

(de.setf.resource.schema:defclass |Western| (|Movie|) nil)

(de.setf.resource.schema:defclass |Writer| (|MoviePerson|) nil)

(de.setf.resource.schema:defclass |WrittenWorkIn| (|Qualification|) nil)
