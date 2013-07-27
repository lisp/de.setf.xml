;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.purl.org/net/ontology/beer#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Ale"
                                          "Association"
                                          "Award"
                                          "Barley"
                                          "Beer"
                                          "Bitter"
                                          "Black"
                                          "Bock"
                                          "BottomFermentedBeer"
                                          "Brewery"
                                          "BrownAle"
                                          "Caramel"
                                          "Carapils"
                                          "Cascade"
                                          "Chinook"
                                          "Chocolate"
                                          "DryStout"
                                          "Festival"
                                          "Galena"
                                          "Grain"
                                          "Hallertau"
                                          "Hops"
                                          "Hops"
                                          "ImperialStout"
                                          "IndiaPaleAle"
                                          "Ingredient"
                                          "KentGoldings"
                                          "Lager"
                                          "Malt"
                                          "Microbrewery"
                                          "Mild"
                                          "MountHood"
                                          "Munich"
                                          "Organization"
                                          "Pale"
                                          "PaleAle"
                                          "Perle"
                                          "Pilsner"
                                          "Porter"
                                          "Region"
                                          "Saaz"
                                          "ScotchAle"
                                          "Stout"
                                          "SweetStout"
                                          "Tettnang"
                                          "TopFermentedBeer"
                                          "Town"
                                          "Water"
                                          "Wheat"
                                          "White"
                                          "Willamette"
                                          "Yeast")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.purl.org/net/ontology/beer#")
           (make-package "http://www.purl.org/net/ontology/beer#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Ale" "Association" "Award" "Barley" "Beer" "Bitter" "Black"
             "Bock" "BottomFermentedBeer" "Brewery" "BrownAle" "Caramel"
             "Carapils" "Cascade" "Chinook" "Chocolate" "DryStout" "Festival"
             "Galena" "Grain" "Hallertau" "Hops" "Hops" "ImperialStout"
             "IndiaPaleAle" "Ingredient" "KentGoldings" "Lager" "Malt"
             "Microbrewery" "Mild" "MountHood" "Munich" "Organization" "Pale"
             "PaleAle" "Perle" "Pilsner" "Porter" "Region" "Saaz" "ScotchAle"
             "Stout" "SweetStout" "Tettnang" "TopFermentedBeer" "Town" "Water"
             "Wheat" "White" "Willamette" "Yeast"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.purl.org/net/ontology/beer#" :if-does-not-exist :load)
