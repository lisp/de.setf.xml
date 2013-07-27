;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.w3.org/TR/2003/CR-owl-guide-20030818/food#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "BlandFish"
                                          "BlandFishCourse"
                                          "CheeseNutsDessert"
                                          "CheeseNutsDessertCourse"
                                          "ConsumableThing"
                                          "DarkMeatFowl"
                                          "DarkMeatFowlCourse"
                                          "Dessert"
                                          "DessertCourse"
                                          "EatingGrape"
                                          "EdibleThing"
                                          "Fish"
                                          "FishCourse"
                                          "Fowl"
                                          "Fruit"
                                          "FruitCourse"
                                          "Grape"
                                          "Juice"
                                          "LightMeatFowl"
                                          "LightMeatFowlCourse"
                                          "Meal"
                                          "MealCourse"
                                          "Meat"
                                          "NonBlandFish"
                                          "NonBlandFishCourse"
                                          "NonConsumableThing"
                                          "NonOysterShellfish"
                                          "NonOysterShellfishCourse"
                                          "NonRedMeat"
                                          "NonRedMeatCourse"
                                          "NonSpicyRedMeat"
                                          "NonSpicyRedMeatCourse"
                                          "NonSweetFruit"
                                          "NonSweetFruitCourse"
                                          "OtherTomatoBasedFood"
                                          "OtherTomatoBasedFoodCourse"
                                          "OysterShellfish"
                                          "OysterShellfishCourse"
                                          "Pasta"
                                          "PastaWithHeavyCreamCourse"
                                          "PastaWithHeavyCreamSauce"
                                          "PastaWithLightCreamCourse"
                                          "PastaWithLightCreamSauce"
                                          "PastaWithNonSpicyRedSauce"
                                          "PastaWithNonSpicyRedSauceCourse"
                                          "PastaWithRedSauce"
                                          "PastaWithSpicyRedSauce"
                                          "PastaWithSpicyRedSauceCourse"
                                          "PastaWithWhiteSauce"
                                          "PotableLiquid"
                                          "RedMeat"
                                          "RedMeatCourse"
                                          "Seafood"
                                          "SeafoodCourse"
                                          "Shellfish"
                                          "ShellfishCourse"
                                          "SpicyRedMeat"
                                          "SpicyRedMeatCourse"
                                          "SweetDessert"
                                          "SweetDessertCourse"
                                          "SweetFruit"
                                          "SweetFruitCourse"
                                          "Wine")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.w3.org/TR/2003/CR-owl-guide-20030818/food#")
           (make-package "http://www.w3.org/TR/2003/CR-owl-guide-20030818/food#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("BlandFish" "BlandFishCourse" "CheeseNutsDessert"
             "CheeseNutsDessertCourse" "ConsumableThing" "DarkMeatFowl"
             "DarkMeatFowlCourse" "Dessert" "DessertCourse" "EatingGrape"
             "EdibleThing" "Fish" "FishCourse" "Fowl" "Fruit" "FruitCourse"
             "Grape" "Juice" "LightMeatFowl" "LightMeatFowlCourse" "Meal"
             "MealCourse" "Meat" "NonBlandFish" "NonBlandFishCourse"
             "NonConsumableThing" "NonOysterShellfish"
             "NonOysterShellfishCourse" "NonRedMeat" "NonRedMeatCourse"
             "NonSpicyRedMeat" "NonSpicyRedMeatCourse" "NonSweetFruit"
             "NonSweetFruitCourse" "OtherTomatoBasedFood"
             "OtherTomatoBasedFoodCourse" "OysterShellfish"
             "OysterShellfishCourse" "Pasta" "PastaWithHeavyCreamCourse"
             "PastaWithHeavyCreamSauce" "PastaWithLightCreamCourse"
             "PastaWithLightCreamSauce" "PastaWithNonSpicyRedSauce"
             "PastaWithNonSpicyRedSauceCourse" "PastaWithRedSauce"
             "PastaWithSpicyRedSauce" "PastaWithSpicyRedSauceCourse"
             "PastaWithWhiteSauce" "PotableLiquid" "RedMeat" "RedMeatCourse"
             "Seafood" "SeafoodCourse" "Shellfish" "ShellfishCourse"
             "SpicyRedMeat" "SpicyRedMeatCourse" "SweetDessert"
             "SweetDessertCourse" "SweetFruit" "SweetFruitCourse" "Wine"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.w3.org/TR/2003/CR-owl-guide-20030818/food#" :if-does-not-exist :load)
