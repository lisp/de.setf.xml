;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://139.91.183.30:9090/RDF/VRP/Examples/moviedatabase.rdf#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Action"
                                          "ActionIn"
                                          "Actor"
                                          "Adult"
                                          "Adventure"
                                          "Animation"
                                          "AnimationCompany"
                                          "Apperance"
                                          "ArtDepartmentIn"
                                          "ArtDepartmentPerson"
                                          "ArtDirectionIn"
                                          "ArtDirector"
                                          "AssistantDirectionIn"
                                          "AssistantDirector"
                                          "AudioCompany"
                                          "AwardsandNominated"
                                          "CameraequipmentCompany"
                                          "CastIn"
                                          "CastingBy"
                                          "CastingCompany"
                                          "Cinematographer"
                                          "CinematographyIn"
                                          "Comedy"
                                          "Company"
                                          "Composer"
                                          "ComputerequipmentCompany"
                                          "CostumeCompany"
                                          "CostumeDesigner"
                                          "CostumesIn"
                                          "Crime"
                                          "DecorationIn"
                                          "Decorator"
                                          "DesignIn"
                                          "DialoguerecordingCompany"
                                          "DigitalcompositingCompany"
                                          "DirectionIn"
                                          "Director"
                                          "DistributionCompany"
                                          "Documentary"
                                          "Drama"
                                          "EditingIn"
                                          "Editor"
                                          "ElectronicInkandPaintCompany"
                                          "Family"
                                          "Fantasy"
                                          "Film-Noir"
                                          "FireprotectionCompany"
                                          "FundingCompany"
                                          "GripequipmentCompany"
                                          "Guest"
                                          "HairstylistCompany"
                                          "Horror"
                                          "LightingCompany"
                                          "MakeupIn"
                                          "MakeupPerson"
                                          "Movie"
                                          "MoviePerson"
                                          "Musical"
                                          "MusicandSoundeffectsCompany"
                                          "MusicrecordingCompany"
                                          "Mystery"
                                          "Post_productionservicesCompany"
                                          "Producer"
                                          "ProductionCompany"
                                          "ProductionDesigner"
                                          "ProductionIn"
                                          "ProductionManager"
                                          "ProductionManagmentIn"
                                          "PublicationCompany"
                                          "Qualification"
                                          "Role"
                                          "Romance"
                                          "SafetyCompany"
                                          "SalesrepresentationCompany"
                                          "Sci-Fi"
                                          "Short"
                                          "SoundandEditingCompany"
                                          "SoundCompany"
                                          "SoundIn"
                                          "SoundPerson"
                                          "SoundrecordingCompany"
                                          "SpecialEffectsCompany"
                                          "SpecialEffectsIn"
                                          "SpecialEffectsPerson"
                                          "SponsorsCompany"
                                          "Stunt"
                                          "Thriller"
                                          "TitlesandopticalsCompany"
                                          "Videopost_productionCompany"
                                          "VisualEffectsIn"
                                          "VisualEffectsPerson"
                                          "War"
                                          "Western"
                                          "Writer"
                                          "WrittenWorkIn")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://139.91.183.30:9090/RDF/VRP/Examples/moviedatabase.rdf#")
           (make-package "http://139.91.183.30:9090/RDF/VRP/Examples/moviedatabase.rdf#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Action" "ActionIn" "Actor" "Adult" "Adventure" "Animation"
             "AnimationCompany" "Apperance" "ArtDepartmentIn"
             "ArtDepartmentPerson" "ArtDirectionIn" "ArtDirector"
             "AssistantDirectionIn" "AssistantDirector" "AudioCompany"
             "AwardsandNominated" "CameraequipmentCompany" "CastIn" "CastingBy"
             "CastingCompany" "Cinematographer" "CinematographyIn" "Comedy"
             "Company" "Composer" "ComputerequipmentCompany" "CostumeCompany"
             "CostumeDesigner" "CostumesIn" "Crime" "DecorationIn" "Decorator"
             "DesignIn" "DialoguerecordingCompany" "DigitalcompositingCompany"
             "DirectionIn" "Director" "DistributionCompany" "Documentary"
             "Drama" "EditingIn" "Editor" "ElectronicInkandPaintCompany"
             "Family" "Fantasy" "Film-Noir" "FireprotectionCompany"
             "FundingCompany" "GripequipmentCompany" "Guest"
             "HairstylistCompany" "Horror" "LightingCompany" "MakeupIn"
             "MakeupPerson" "Movie" "MoviePerson" "Musical"
             "MusicandSoundeffectsCompany" "MusicrecordingCompany" "Mystery"
             "Post_productionservicesCompany" "Producer" "ProductionCompany"
             "ProductionDesigner" "ProductionIn" "ProductionManager"
             "ProductionManagmentIn" "PublicationCompany" "Qualification"
             "Role" "Romance" "SafetyCompany" "SalesrepresentationCompany"
             "Sci-Fi" "Short" "SoundandEditingCompany" "SoundCompany" "SoundIn"
             "SoundPerson" "SoundrecordingCompany" "SpecialEffectsCompany"
             "SpecialEffectsIn" "SpecialEffectsPerson" "SponsorsCompany"
             "Stunt" "Thriller" "TitlesandopticalsCompany"
             "Videopost_productionCompany" "VisualEffectsIn"
             "VisualEffectsPerson" "War" "Western" "Writer" "WrittenWorkIn"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://139.91.183.30:9090/RDF/VRP/Examples/moviedatabase.rdf#" :if-does-not-exist :load)