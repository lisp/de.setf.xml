;;; 20100513T131538Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/ontology/biosphere.owl #x262F605E>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/biosphere.owl#")
(de.setf.resource.schema:defclass |Algae| (|Plant|) nil)

(de.setf.resource.schema:defclass |Amoebae| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Amphibian| (|Animal|) nil)

(de.setf.resource.schema:defclass |Anemone| (|Animal|) nil)

(de.setf.resource.schema:defclass |Animal| (|LivingThing|) nil)

(de.setf.resource.schema:defclass |Arachnid| (|Animal|) nil)

(de.setf.resource.schema:defclass |Arthropod| (|Animal|) nil)

(de.setf.resource.schema:defclass |Bacteria| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Bird| (|Animal|) nil)

(de.setf.resource.schema:defclass |BlueGreenAlgae| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Canopy| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Centipede| (|Animal|) nil)

(de.setf.resource.schema:defclass |Chlorophyll| (|Microbiota|) nil)

(de.setf.resource.schema:defclass |Ciliate| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Coccolithophore| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Conifer| (|Plant|) nil)

(de.setf.resource.schema:defclass |Coral| (|Animal|) nil)

(de.setf.resource.schema:defclass |Crop| (|Plant|) nil)

(de.setf.resource.schema:defclass |Crown| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Crustacean| (|Animal|) nil)

(de.setf.resource.schema:defclass |Dairy| (|Animal|) nil)

(de.setf.resource.schema:defclass |DeciduousVegetation| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Diatom| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |DominantSpecies| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Echinoderm| (|Animal|) nil)

(de.setf.resource.schema:defclass |EvergreenVegetation| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |ExoticSpecies| (|Animal|) nil)

(de.setf.resource.schema:defclass |ExoticVegetation| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Fern| (|Plant|) nil)

(de.setf.resource.schema:defclass |Fish| (|Animal| |MarineAnimal|) nil)

(de.setf.resource.schema:defclass |Flagellate| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Flatworm| (|Animal|) nil)

(de.setf.resource.schema:defclass |FloweringPlant| (|Plant|) nil)

(de.setf.resource.schema:defclass |Foraminifer| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Fungi| (|Plant|) nil)

(de.setf.resource.schema:defclass |FungiTaxonomy| (|Fungi|) nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2002/07/owl#Thing| nil nil)

(de.setf.resource.schema:defclass |Human| (|Mammal|) nil)

(de.setf.resource.schema:defclass |IndigenousSpecies| (|Animal|) nil)

(de.setf.resource.schema:defclass |IndigenousVegetation| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Insect| (|Animal|) nil)

(de.setf.resource.schema:defclass |Invertebrate| (|Animal|) nil)

(de.setf.resource.schema:defclass |Jellyfish| (|MarineAnimal|) nil)

(de.setf.resource.schema:defclass |Leaf| (|Plant|) nil)

(de.setf.resource.schema:defclass |Lichen| (|Plant|) nil)

(de.setf.resource.schema:defclass |Litter| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Liverwort| (|Plant|) nil)

(de.setf.resource.schema:defclass |Livestock| (|Animal|) nil)

(de.setf.resource.schema:defclass |LivingThing| nil nil)

(de.setf.resource.schema:defclass |Macroalgae| (|Plant|) nil)

(de.setf.resource.schema:defclass |Macrophyte| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Mammal| (|Animal|) nil)

(de.setf.resource.schema:defclass |MarineAnimal| nil nil)

(de.setf.resource.schema:defclass |MarineBird| (|MarineAnimal|) nil)

(de.setf.resource.schema:defclass |MarineInvertebrate| (|MarineAnimal|) nil)

(de.setf.resource.schema:defclass |MarineMammal| (|MarineAnimal|) nil)

(de.setf.resource.schema:defclass |MarineMicrobiota| (|MarinePlant|) nil)

(de.setf.resource.schema:defclass |MarinePlant| (|Plant|) nil)

(de.setf.resource.schema:defclass |Microalgae| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Microbiota| (|Plant|) nil)

(de.setf.resource.schema:defclass |MicrobiotaTaxonomy| (|Microbiota|) nil)

(de.setf.resource.schema:defclass |Microphyte| (|Plant|) nil)

(de.setf.resource.schema:defclass |Millipede| (|Animal|) nil)

(de.setf.resource.schema:defclass |Mold| (|FungiTaxonomy|) nil)

(de.setf.resource.schema:defclass |Mollusk| (|Animal|) nil)

(de.setf.resource.schema:defclass |Moss| (|Plant|) nil)

(de.setf.resource.schema:defclass |Mushroom| (|FungiTaxonomy|) nil)

(de.setf.resource.schema:defclass |Nutrient| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Phytoplankton| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Plankton| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Plant| (|LivingThing|) nil)

(de.setf.resource.schema:defclass |Pollen| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Poultry| (|Animal|) nil)

(de.setf.resource.schema:defclass |Protist| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Radiolarian| (|MicrobiotaTaxonomy|) nil)

(de.setf.resource.schema:defclass |Reptile| (|Animal|) nil)

(de.setf.resource.schema:defclass |Roundworm| (|Animal|) nil)

(de.setf.resource.schema:defclass |SegmentedWorm| (|Animal|) nil)

(de.setf.resource.schema:defclass |SlimeMold| (|FungiTaxonomy|) nil)

(de.setf.resource.schema:defclass |Sponge| (|Animal|) nil)

(de.setf.resource.schema:defclass |Sporozoan| (|FungiTaxonomy|) nil)

(de.setf.resource.schema:defclass |TreeRing| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Vegetation| (|Plant|) nil)

(de.setf.resource.schema:defclass |VegetationCover| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |VegetationSpecies| (|Vegetation|) nil)

(de.setf.resource.schema:defclass |Vertebrate| (|Animal|) nil)

(de.setf.resource.schema:defclass |Yeast| (|FungiTaxonomy|) nil)

(de.setf.resource.schema:defclass |Zooplankton| (|Animal|) nil)
