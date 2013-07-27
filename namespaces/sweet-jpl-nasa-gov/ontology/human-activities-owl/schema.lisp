;;; 20100513T131528Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/ontology/human_activities.owl #x24F97EFE>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/human_activities.owl#")
(de.setf.resource.schema:defclass |Access| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Adult| (|AgeGroup|) nil)

(de.setf.resource.schema:defclass |AerialPhotography| (|Photography|) nil)

(de.setf.resource.schema:defclass |Afforestation|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |AgeGroup| (|HumanCategory|) nil)

(de.setf.resource.schema:defclass |AgriculturalManagement| (|Management|) nil)

(de.setf.resource.schema:defclass |AgriculturalProduct| (|Product|) nil)

(de.setf.resource.schema:defclass |Agriculture| (|Production|) nil)

(de.setf.resource.schema:defclass |Analysis| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |AnatomicalParameters| (|HumanHealth|) nil)

(de.setf.resource.schema:defclass |Anatomy| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |AnimalBehaviorScience|
                                  (|BehavioralScience|)
                                  nil)

(de.setf.resource.schema:defclass |AnimalManagementSystem|
                                  (|ManagementSystem|)
                                  nil)

(de.setf.resource.schema:defclass |AnimalProduction| (|Agriculture|) nil)

(de.setf.resource.schema:defclass |AnimalWaste| (|Waste|) nil)

(de.setf.resource.schema:defclass |Anthropogenic| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Apiculture| (|AnimalProduction|) nil)

(de.setf.resource.schema:defclass |Aquaculture| (|Agriculture|) nil)

(de.setf.resource.schema:defclass |Bathimetry| (|Measurement|) nil)

(de.setf.resource.schema:defclass |BehavioralScience| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |BiochemicalRelease| (|Contamination|) nil)

(de.setf.resource.schema:defclass |Biochemistry| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |BiologicalHazard| (|NaturalHazard|) nil)

(de.setf.resource.schema:defclass |Biology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Birth| (|VitalActivity|) nil)

(de.setf.resource.schema:defclass |Breeding| (|AnimalProduction|) nil)

(de.setf.resource.schema:defclass |Burning| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |ByProductOfHumanActivity|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |Census| (|Sociology|) nil)

(de.setf.resource.schema:defclass |CivilDisturbance| (|SocialActivity|) nil)

(de.setf.resource.schema:defclass |Communications| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Conservation|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |ConsumerBehavior| (|SocialBehavior|) nil)

(de.setf.resource.schema:defclass |Contamination|
                                  (|ByProductOfHumanActivity|)
                                  nil)

(de.setf.resource.schema:defclass |Contours| (|Mapping|) nil)

(de.setf.resource.schema:defclass |CroppingSystem| (|ManagementSystem|) nil)

(de.setf.resource.schema:defclass |CropProduct| (|AgriculturalProduct|) nil)

(de.setf.resource.schema:defclass |CropsProduction| (|PlantProduction|) nil)

(de.setf.resource.schema:defclass |DairyProduct| (|AgriculturalProduct|) nil)

(de.setf.resource.schema:defclass |Death| (|VitalActivity|) nil)

(de.setf.resource.schema:defclass |Desertification|
                                  (|ByProductOfHumanActivity|)
                                  nil)

(de.setf.resource.schema:defclass |Ecology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Ecology-RelatedActivity|
                                  (|HumanActivity|)
                                  nil)

(de.setf.resource.schema:defclass |Economics| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |EducationalLevel| (|HumanCategory|) nil)

(de.setf.resource.schema:defclass |Electricity| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Emission| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Engineering| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |EngineeringActivity| (|Production|) nil)

(de.setf.resource.schema:defclass |EnvironmentalAssessment|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |EquipmentCharacteristic| nil nil)

(de.setf.resource.schema:defclass |Eutropication| (|Contamination|) nil)

(de.setf.resource.schema:defclass |Expansion| (|Ecology-RelatedActivity|) nil)

(de.setf.resource.schema:defclass |Experiment| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Fire| (|Hazard|) nil)

(de.setf.resource.schema:defclass |Fishery| nil nil)

(de.setf.resource.schema:defclass |FishProduction|
                                  (|AnimalProduction| |Aquaculture|)
                                  nil)

(de.setf.resource.schema:defclass |FoodScience| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |ForestProduct| (|Product|) nil)

(de.setf.resource.schema:defclass |FruitProduct| (|HorticulturalProduct|) nil)

(de.setf.resource.schema:defclass |GasFlaring| (|ByProductOfHumanActivity|) nil)

(de.setf.resource.schema:defclass |Genetics| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |GeologicalHazard| (|NaturalHazard|) nil)

(de.setf.resource.schema:defclass |Geology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Harvesting| (|PlantProduction|) nil)

(de.setf.resource.schema:defclass |Hazard| nil nil)

(de.setf.resource.schema:defclass |HazardousLevel| nil nil)

(de.setf.resource.schema:defclass |Hearing| (|Sense|) nil)

(de.setf.resource.schema:defclass |HorticulturalActivity| (|Agriculture|) nil)

(de.setf.resource.schema:defclass |HorticulturalProduct|
                                  (|AgriculturalProduct|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2002/07/owl#Thing| nil nil)

(de.setf.resource.schema:defclass |Human|
                                  nil
                                  ((|belongsToHumanCategory| :type |AgeGroup|)))

(de.setf.resource.schema:defclass |HumanActivity|
                                  nil
                                  ((|hasObjectOfActivity| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |HumanCategory| nil nil)

(de.setf.resource.schema:defclass |HumanHealth| nil nil)

(de.setf.resource.schema:defclass |HydrologicalHazard| (|NaturalHazard|) nil)

(de.setf.resource.schema:defclass |Hydrology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |HypothesisTest| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Imaging| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |IndustrialEmission|
                                  (|Contamination| |Emission|)
                                  nil)

(de.setf.resource.schema:defclass |Industrialization|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |Irrigation|
                                  (|SoilCultivation| |Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |KnowledgeDomain|
                                  nil
                                  ((|studyOf| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |LandCover| (|LandManagement|) nil)

(de.setf.resource.schema:defclass |LandManagement| (|Management|) nil)

(de.setf.resource.schema:defclass |LandResource| (|LandManagement|) nil)

(de.setf.resource.schema:defclass |LandscapeEcology|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |LandscapeManagement| (|Management|) nil)

(de.setf.resource.schema:defclass |LandTenure| (|LandManagement|) nil)

(de.setf.resource.schema:defclass |LandUse| (|LandManagement|) nil)

(de.setf.resource.schema:defclass |Leak| (|Contamination|) nil)

(de.setf.resource.schema:defclass |Limnology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Lithology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |LivestockProduct|
                                  (|AgriculturalProduct|)
                                  nil)

(de.setf.resource.schema:defclass |Management| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |ManagementSystem| nil nil)

(de.setf.resource.schema:defclass |Manure| (|AgriculturalProduct|) nil)

(de.setf.resource.schema:defclass |Mapping| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Measurement| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Meteorology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Monitoring| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |NaturalHazard| (|Hazard|) nil)

(de.setf.resource.schema:defclass |NutritionScience| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Observation| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Oceanography| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Oceanology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Old| (|AgeGroup|) nil)

(de.setf.resource.schema:defclass |Packaging| (|Production|) nil)

(de.setf.resource.schema:defclass |Paleoclimatology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Photography| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Physiology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |PlantProduction| (|Agriculture|) nil)

(de.setf.resource.schema:defclass |PopulationDynamics| (|Sociology|) nil)

(de.setf.resource.schema:defclass |PoultryProduct| (|AgriculturalProduct|) nil)

(de.setf.resource.schema:defclass |Preference| (|SocialBehavior|) nil)

(de.setf.resource.schema:defclass |Processing| (|Production|) nil)

(de.setf.resource.schema:defclass |Product| nil nil)

(de.setf.resource.schema:defclass |Production| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |ProductivityData| nil nil)

(de.setf.resource.schema:defclass |Profession| (|HumanCategory|) nil)

(de.setf.resource.schema:defclass |Protection| (|Ecology-RelatedActivity|) nil)

(de.setf.resource.schema:defclass |Psychology| (|HumanHealth|) nil)

(de.setf.resource.schema:defclass |Quality| nil nil)

(de.setf.resource.schema:defclass |RadiationExposure| (|HumanHealth|) nil)

(de.setf.resource.schema:defclass |Reclamation| (|Ecology-RelatedActivity|) nil)

(de.setf.resource.schema:defclass |Recreation| (|SocialActivity|) nil)

(de.setf.resource.schema:defclass |Reforestation|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |RemoteSensing| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Research-Exploration| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Restoration| (|Ecology-RelatedActivity|) nil)

(de.setf.resource.schema:defclass |Revegetation|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |Sampling| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Seismology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Sense| nil nil)

(de.setf.resource.schema:defclass |Sericulture| (|AnimalProduction|) nil)

(de.setf.resource.schema:defclass |ShellfishProduction|
                                  (|AnimalProduction| |Aquaculture|)
                                  nil)

(de.setf.resource.schema:defclass |Simulation| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |SocialActivity| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |SocialBehavior| (|Sociology|) nil)

(de.setf.resource.schema:defclass |Sociology| (|BehavioralScience|) nil)

(de.setf.resource.schema:defclass |SoilCultivation| (|Agriculture|) nil)

(de.setf.resource.schema:defclass |Spill| (|Contamination|) nil)

(de.setf.resource.schema:defclass |Storage| (|Production|) nil)

(de.setf.resource.schema:defclass |Tomography| (|Research-Exploration|) nil)

(de.setf.resource.schema:defclass |Toxicology| (|KnowledgeDomain|) nil)

(de.setf.resource.schema:defclass |Transportation| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Urbanization|
                                  (|Ecology-RelatedActivity|)
                                  nil)

(de.setf.resource.schema:defclass |VegetableProduct|
                                  (|AgriculturalProduct|)
                                  nil)

(de.setf.resource.schema:defclass |Vision| (|Sense|) nil)

(de.setf.resource.schema:defclass |VitalActivity| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |VitalStatistics| (|Sociology|) nil)

(de.setf.resource.schema:defclass |Waste| (|ByProductOfHumanActivity|) nil)

(de.setf.resource.schema:defclass |WaterManagement| (|Management|) nil)

(de.setf.resource.schema:defclass |Work| (|HumanActivity|) nil)

(de.setf.resource.schema:defclass |Young| (|AgeGroup|) nil)
