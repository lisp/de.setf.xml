;;; 20100513T132009Z00
;;; from #<doc-node http://www.purl.org/net/ontology/beer.owl #x2C566A6E>

(common-lisp:in-package "http://www.purl.org/net/ontology/beer#")
(de.setf.resource.schema:defclass |Ale| (|TopFermentedBeer|) common-lisp:nil)

(de.setf.resource.schema:defclass |Association|
                                  (|Organization|)
                                  ((|sponsors| :type |Festival|)))

(de.setf.resource.schema:defclass |Award|
                                  common-lisp:nil
                                  ((|awardCategory| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|awardedAt| :type |Festival|)))

(de.setf.resource.schema:defclass |Barley| (|Grain|) common-lisp:nil)

(de.setf.resource.schema:defclass |Beer|
                                  common-lisp:nil
                                  ((|madeFrom| :type |Ingredient|)
                                   (|awarded| :type |Award|)
                                   (|brewedBy| :type |Brewery|)))

(de.setf.resource.schema:defclass |Bitter| (|Ale|) common-lisp:nil)

(de.setf.resource.schema:defclass |Black| (|Malt|) common-lisp:nil)

(de.setf.resource.schema:defclass |Bock|
                                  (|BottomFermentedBeer|)
                                  common-lisp:nil)

(de.setf.resource.schema:defclass |BottomFermentedBeer|
                                  (|Beer|)
                                  common-lisp:nil)

(de.setf.resource.schema:defclass |Brewery|
                                  (|Organization|)
                                  ((|locatedIn| :type |Region|)
                                   (|brews| :type |Beer|)))

(de.setf.resource.schema:defclass |BrownAle| (|Ale|) common-lisp:nil)

(de.setf.resource.schema:defclass |Caramel| (|Malt|) common-lisp:nil)

(de.setf.resource.schema:defclass |Carapils| (|Malt|) common-lisp:nil)

(de.setf.resource.schema:defclass |Cascade| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Chinook| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Chocolate| (|Malt|) common-lisp:nil)

(de.setf.resource.schema:defclass |DryStout| (|Stout|) common-lisp:nil)

(de.setf.resource.schema:defclass |Festival| common-lisp:nil common-lisp:nil)

(de.setf.resource.schema:defclass |Galena| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Grain|
                                  (|Ingredient|)
                                  ((|maltedTo| :type |Malt|)))

(de.setf.resource.schema:defclass |Hallertau| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Hops| (|Ingredient|) common-lisp:nil)

(de.setf.resource.schema:defclass |ImperialStout| (|Stout|) common-lisp:nil)

(de.setf.resource.schema:defclass |IndiaPaleAle| (|Ale|) common-lisp:nil)

(de.setf.resource.schema:defclass |Ingredient| common-lisp:nil common-lisp:nil)

(de.setf.resource.schema:defclass |KentGoldings| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Lager|
                                  (|BottomFermentedBeer|)
                                  common-lisp:nil)

(de.setf.resource.schema:defclass |Malt| (|Ingredient|) common-lisp:nil)

(de.setf.resource.schema:defclass |Microbrewery| (|Brewery|) common-lisp:nil)

(de.setf.resource.schema:defclass |Mild| (|Ale|) common-lisp:nil)

(de.setf.resource.schema:defclass |MountHood| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Munich| (|Malt|) common-lisp:nil)

(de.setf.resource.schema:defclass |Pale| (|Malt|) common-lisp:nil)

(de.setf.resource.schema:defclass |PaleAle| (|Ale|) common-lisp:nil)

(de.setf.resource.schema:defclass |Perle| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Pilsner|
                                  (|BottomFermentedBeer|)
                                  common-lisp:nil)

(de.setf.resource.schema:defclass |Porter| (|TopFermentedBeer|) common-lisp:nil)

(de.setf.resource.schema:defclass |Region| common-lisp:nil common-lisp:nil)

(de.setf.resource.schema:defclass |Saaz| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |ScotchAle| (|Ale|) common-lisp:nil)

(de.setf.resource.schema:defclass |Stout| (|Porter|) common-lisp:nil)

(de.setf.resource.schema:defclass |SweetStout| (|Stout|) common-lisp:nil)

(de.setf.resource.schema:defclass |Tettnang| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |TopFermentedBeer| (|Beer|) common-lisp:nil)

(de.setf.resource.schema:defclass |Town| (|Region|) common-lisp:nil)

(de.setf.resource.schema:defclass |Water| (|Ingredient|) common-lisp:nil)

(de.setf.resource.schema:defclass |Wheat| (|Grain|) common-lisp:nil)

(de.setf.resource.schema:defclass |White| (|TopFermentedBeer|) common-lisp:nil)

(de.setf.resource.schema:defclass |Willamette| (|Hops|) common-lisp:nil)

(de.setf.resource.schema:defclass |Yeast| (|Ingredient|) common-lisp:nil)
