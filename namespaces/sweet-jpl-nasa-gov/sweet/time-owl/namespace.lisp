;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://sweet.jpl.nasa.gov/sweet/time.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "ARCHAEAN"
                                          "Autumn"
                                          "Beginning"
                                          "CAMBRIAN"
                                          "CARBONIFEROUS"
                                          "CENOZOIC"
                                          "Century"
                                          "CRETACEOUS"
                                          "CurrentTime"
                                          "Day"
                                          "Daytime"
                                          "Decade"
                                          "Delay"
                                          "DEVONIAN"
                                          "Duration"
                                          "End"
                                          "EOCENE"
                                          "Evening"
                                          "Event"
                                          "Fall"
                                          "History"
                                          "HOLOCENE"
                                          "Hour"
                                          "Instant"
                                          "JURASSIC"
                                          "MESOZOIC"
                                          "Millennium"
                                          "Minute"
                                          "MIOCENE"
                                          "MISSISSIPPIAN"
                                          "Month"
                                          "Morning"
                                          "NEOGENE"
                                          "Nighttime"
                                          "Occurrence"
                                          "OLIGOCENE"
                                          "ORDOVICIAN"
                                          "PALEOCENE"
                                          "PALEOGENE"
                                          "PALEOZOIC"
                                          "PENNSYLVANIAN"
                                          "Period"
                                          "PERMIAN"
                                          "PLEISTOCENE"
                                          "PLIOCENE"
                                          "PRECAMBRIAN"
                                          "Prehistoric"
                                          "PROTEROZOIC"
                                          "QUATERNARY"
                                          "Season"
                                          "Second"
                                          "SILURIAN"
                                          "Spring"
                                          "Start"
                                          "Summer"
                                          "TemporalEntity"
                                          "TemporalObject"
                                          "TemporalReference"
                                          "TemporalRelation"
                                          "TERTIARY"
                                          "TimeInterval"
                                          "TRIASSIC"
                                          "UniversalTime"
                                          "UT"
                                          "Week"
                                          "Winter"
                                          "Year")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://sweet.jpl.nasa.gov/sweet/time.owl#")
           (make-package "http://sweet.jpl.nasa.gov/sweet/time.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("ARCHAEAN" "Autumn" "Beginning" "CAMBRIAN" "CARBONIFEROUS"
             "CENOZOIC" "Century" "CRETACEOUS" "CurrentTime" "Day" "Daytime"
             "Decade" "Delay" "DEVONIAN" "Duration" "End" "EOCENE" "Evening"
             "Event" "Fall" "History" "HOLOCENE" "Hour" "Instant" "JURASSIC"
             "MESOZOIC" "Millennium" "Minute" "MIOCENE" "MISSISSIPPIAN" "Month"
             "Morning" "NEOGENE" "Nighttime" "Occurrence" "OLIGOCENE"
             "ORDOVICIAN" "PALEOCENE" "PALEOGENE" "PALEOZOIC" "PENNSYLVANIAN"
             "Period" "PERMIAN" "PLEISTOCENE" "PLIOCENE" "PRECAMBRIAN"
             "Prehistoric" "PROTEROZOIC" "QUATERNARY" "Season" "Second"
             "SILURIAN" "Spring" "Start" "Summer" "TemporalEntity"
             "TemporalObject" "TemporalReference" "TemporalRelation" "TERTIARY"
             "TimeInterval" "TRIASSIC" "UniversalTime" "UT" "Week" "Winter"
             "Year"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://sweet.jpl.nasa.gov/sweet/time.owl#" :if-does-not-exist :load)
