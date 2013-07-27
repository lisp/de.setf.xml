;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.mindswap.org/2003/vegetarian.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "LactoVegetarian"
                                          "LactoVegetarianFood"
                                          "Meat"
                                          "Omnivore"
                                          "Ovo-LactoVegetarian"
                                          "OvoLactoVegetarianFood"
                                          "OvoVegetarian"
                                          "OvoVegetarianFood"
                                          "Vegan"
                                          "VeganFood"
                                          "Vegetarian"
                                          "VegetarianFood")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.mindswap.org/2003/vegetarian.owl#")
           (make-package "http://www.mindswap.org/2003/vegetarian.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("LactoVegetarian" "LactoVegetarianFood" "Meat" "Omnivore"
             "Ovo-LactoVegetarian" "OvoLactoVegetarianFood" "OvoVegetarian"
             "OvoVegetarianFood" "Vegan" "VeganFood" "Vegetarian"
             "VegetarianFood"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.mindswap.org/2003/vegetarian.owl#" :if-does-not-exist :load)
