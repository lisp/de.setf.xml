;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://vocab.org/whisky/terms/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "abv"
                                          "age"
                                          "agingCask"
                                          "body"
                                          "brand"
                                          "Brand"
                                          "Cask"
                                          "character"
                                          "colour"
                                          "colourDescription"
                                          "distillery"
                                          "Distillery"
                                          "expressionLabel"
                                          "finish"
                                          "finishingCask"
                                          "grain"
                                          "material"
                                          "nose"
                                          "owner"
                                          "palate"
                                          "previousContents"
                                          "region"
                                          "waterSource"
                                          "WaterSource"
                                          "Whisky"
                                          "WhiskyReview")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://vocab.org/whisky/terms/")
           (make-package "http://vocab.org/whisky/terms/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("abv" "age" "agingCask" "body" "brand" "Brand" "Cask" "character"
             "colour" "colourDescription" "distillery" "Distillery"
             "expressionLabel" "finish" "finishingCask" "grain" "material"
             "nose" "owner" "palate" "previousContents" "region" "waterSource"
             "WaterSource" "Whisky" "WhiskyReview"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://vocab.org/whisky/terms/" :if-does-not-exist :load)
