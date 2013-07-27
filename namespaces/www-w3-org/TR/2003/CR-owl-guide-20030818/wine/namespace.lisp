;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/TR/2003/CR-owl-guide-20030818/wine#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "AlsatianWine"
                                          "AmericanWine"
                                          "Anjou"
                                          "Beaujolais"
                                          "Bordeaux"
                                          "Burgundy"
                                          "CabernetFranc"
                                          "CabernetSauvignon"
                                          "CaliforniaWine"
                                          "Chardonnay"
                                          "CheninBlanc"
                                          "Chianti"
                                          "CotesDOr"
                                          "DessertWine"
                                          "DryRedWine"
                                          "DryRiesling"
                                          "DryWhiteWine"
                                          "DryWine"
                                          "EarlyHarvest"
                                          "FrenchWine"
                                          "FullBodiedWine"
                                          "Gamay"
                                          "GermanWine"
                                          "IceWine"
                                          "ItalianWine"
                                          "LateHarvest"
                                          "Loire"
                                          "Margaux"
                                          "Medoc"
                                          "Meritage"
                                          "Merlot"
                                          "Meursault"
                                          "Muscadet"
                                          "Pauillac"
                                          "PetiteSyrah"
                                          "PinotBlanc"
                                          "PinotNoir"
                                          "Port"
                                          "RedBordeaux"
                                          "RedBurgundy"
                                          "RedTableWine"
                                          "RedWine"
                                          "Region"
                                          "Riesling"
                                          "RoseWine"
                                          "Sancerre"
                                          "Sauternes"
                                          "SauvignonBlanc"
                                          "Semillon"
                                          "SemillonOrSauvignonBlanc"
                                          "StEmilion"
                                          "SweetRiesling"
                                          "SweetWine"
                                          "TableWine"
                                          "TexasWine"
                                          "Tours"
                                          "Vintage"
                                          "VintageYear"
                                          "WhiteBordeaux"
                                          "WhiteBurgundy"
                                          "WhiteLoire"
                                          "WhiteNonSweetWine"
                                          "WhiteTableWine"
                                          "WhiteWine"
                                          "Wine"
                                          "WineBody"
                                          "WineColor"
                                          "WineDescriptor"
                                          "WineFlavor"
                                          "WineGrape"
                                          "Winery"
                                          "WineSugar"
                                          "WineTaste"
                                          "Zinfandel")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/TR/2003/CR-owl-guide-20030818/wine#")
           (make-package "http://www.w3.org/TR/2003/CR-owl-guide-20030818/wine#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("AlsatianWine" "AmericanWine" "Anjou" "Beaujolais" "Bordeaux"
             "Burgundy" "CabernetFranc" "CabernetSauvignon" "CaliforniaWine"
             "Chardonnay" "CheninBlanc" "Chianti" "CotesDOr" "DessertWine"
             "DryRedWine" "DryRiesling" "DryWhiteWine" "DryWine" "EarlyHarvest"
             "FrenchWine" "FullBodiedWine" "Gamay" "GermanWine" "IceWine"
             "ItalianWine" "LateHarvest" "Loire" "Margaux" "Medoc" "Meritage"
             "Merlot" "Meursault" "Muscadet" "Pauillac" "PetiteSyrah"
             "PinotBlanc" "PinotNoir" "Port" "RedBordeaux" "RedBurgundy"
             "RedTableWine" "RedWine" "Region" "Riesling" "RoseWine" "Sancerre"
             "Sauternes" "SauvignonBlanc" "Semillon" "SemillonOrSauvignonBlanc"
             "StEmilion" "SweetRiesling" "SweetWine" "TableWine" "TexasWine"
             "Tours" "Vintage" "VintageYear" "WhiteBordeaux" "WhiteBurgundy"
             "WhiteLoire" "WhiteNonSweetWine" "WhiteTableWine" "WhiteWine"
             "Wine" "WineBody" "WineColor" "WineDescriptor" "WineFlavor"
             "WineGrape" "Winery" "WineSugar" "WineTaste" "Zinfandel"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/TR/2003/CR-owl-guide-20030818/wine#" :if-does-not-exist :load)
