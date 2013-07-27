;;; 20100512T202630Z00
;;; from #<doc-node http://www.w3.org/TR/owl-guide/food.rdf #x181415E6>

(common-lisp:in-package "http://www.w3.org/TR/2003/CR-owl-guide-20030818/food#")
(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|BlandFish|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fish|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|BlandFishCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|CheeseNutsDessert|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Dessert|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|CheeseNutsDessertCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|ConsumableThing|
                                  nil
                                  ((|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|madeFromFruit|
                                    :type
                                    |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fruit|)))

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|DarkMeatFowl|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fowl|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|DarkMeatFowlCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Dessert|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|DessertCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EatingGrape|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Grape|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|ConsumableThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fish|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Seafood|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|FishCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fowl|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fruit|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|FruitCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Grape|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|SweetFruit|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Juice|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PotableLiquid|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|LightMeatFowl|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fowl|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|LightMeatFowlCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Meal|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|ConsumableThing|)
                                  ((|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|course|
                                    :type
                                    |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|MealCourse|)))

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|MealCourse|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|ConsumableThing|)
                                  ((|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|hasDrink|
                                    :type
                                    |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PotableLiquid|)
                                   (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|hasFood|
                                    :type
                                    |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)))

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Meat|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonBlandFish|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Fish|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonBlandFishCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonConsumableThing|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonOysterShellfish|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Shellfish|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonOysterShellfishCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonRedMeat|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Meat|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonRedMeatCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonSpicyRedMeat|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|RedMeat|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonSpicyRedMeatCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonSweetFruit|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|NonSweetFruitCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|OtherTomatoBasedFood|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|OtherTomatoBasedFoodCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|OysterShellfish|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Shellfish|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|OysterShellfishCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Pasta|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithHeavyCreamCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithHeavyCreamSauce|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithWhiteSauce|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithLightCreamCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithLightCreamSauce|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithWhiteSauce|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithNonSpicyRedSauce|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|PastaWithRedSauce|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithNonSpicyRedSauceCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|PastaWithRedSauce|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Pasta|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithSpicyRedSauce|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|PastaWithRedSauce|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithSpicyRedSauceCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PastaWithWhiteSauce|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Pasta|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|PotableLiquid|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|ConsumableThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|RedMeat|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Meat|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|RedMeatCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Seafood|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|SeafoodCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Shellfish|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|Seafood|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|ShellfishCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|SpicyRedMeat|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|RedMeat|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|SpicyRedMeatCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|SweetDessert|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Dessert|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|SweetDessertCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|:|SweetFruit|
                                  (|http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|EdibleThing|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|SweetFruitCourse|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/TR/2003/PR-owl-guide-20031209/food#|::|Wine|
                                  nil
                                  nil)
