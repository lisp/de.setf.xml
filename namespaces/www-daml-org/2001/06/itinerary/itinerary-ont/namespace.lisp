;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.daml.org/2001/06/itinerary/itinerary-ont#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Aircraft"
                                          "Class"
                                          "Flight"
                                          "HotelReservation"
                                          "Itinerary"
                                          "Meal"
                                          "RecordLocatorNumber"
                                          "RentalCar")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.daml.org/2001/06/itinerary/itinerary-ont#")
           (make-package "http://www.daml.org/2001/06/itinerary/itinerary-ont#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Aircraft" "Class" "Flight" "HotelReservation" "Itinerary" "Meal"
             "RecordLocatorNumber" "RentalCar"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.daml.org/2001/06/itinerary/itinerary-ont#" :if-does-not-exist :load)
