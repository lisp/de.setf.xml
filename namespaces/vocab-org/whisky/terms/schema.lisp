;;; 20100516T160439Z00
;;; from #<doc-node http://vocab.org/whisky/terms.rdf #x31610FEE>

(common-lisp:in-package "http://vocab.org/whisky/terms/")
(de.setf.resource.schema:defclass |Brand| nil nil)

(de.setf.resource.schema:defclass |Cask|
                                  nil
                                  ((|previousContents| :type
                                    |http://umbel.org/umbel/ac|:|LiquidTangibleThing|)
                                   (|material| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|material| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|previousContents| :type
                                    |http://umbel.org/umbel/ac|:|LiquidTangibleThing|)))

(de.setf.resource.schema:defclass |Distillery|
                                  nil
                                  ((|waterSource| :type |WaterSource|)
                                   (|owner| :type
                                    |http://xmlns.com/foaf/0.1/|:|Organization|)
                                   (|region| :type |Region|)
                                   (|region| :type |Region|)
                                   (|owner| :type
                                    |http://xmlns.com/foaf/0.1/|:|Organization|)
                                   (|waterSource| :type |WaterSource|)))

(de.setf.resource.schema:defclass |WaterSource| nil nil)

(de.setf.resource.schema:defclass |Whisky|
                                  nil
                                  ((|distillery| :type |Distillery|)
                                   (|agingCask| :type |Cask|)
                                   (|grain| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|abv| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|colourDescription| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|character| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|expressionLabel| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|finishingCask| :type |Cask|)
                                   (|brand| :type |Brand|)
                                   (|age| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|age| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|brand| :type |Brand|)
                                   (|finishingCask| :type |Cask|)
                                   (|expressionLabel| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|character| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|colourDescription| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|abv| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|grain| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|agingCask| :type |Cask|)
                                   (|distillery| :type |Distillery|)))

(de.setf.resource.schema:defclass |WhiskyReview|
                                  nil
                                  ((|finish| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|body| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|palate| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|nose| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|colour| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|colour| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|nose| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|palate| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|body| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|finish| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))
