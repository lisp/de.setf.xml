;;; 20100512T202623Z00
;;; from #<doc-node http://ebiquity.umbc.edu/ontology/event.owl #x17FBA266>

(common-lisp:in-package "http://ebiquity.umbc.edu/ontology/event.owl#")
(de.setf.resource.schema:defclass |http://ebiquity.umbc.edu/ontology/event.owl#event|::|Event|
                                  nil
                                  ((|http://ebiquity.umbc.edu/ontology/event.owl#event|:|speaker|
                                    :type
                                    |http://ebiquity.umbc.edu/ontology/person.owl#|:|Person|)
                                   (|http://ebiquity.umbc.edu/ontology/event.owl#event|:|host|
                                    :type
                                    |http://ebiquity.umbc.edu/ontology/person.owl#|:|Person|)
                                   (|http://ebiquity.umbc.edu/ontology/event.owl#event|:|isPartOf|
                                    :type
                                    |http://ebiquity.umbc.edu/ontology/event.owl#event|:|EventSeries|)))

(de.setf.resource.schema:defclass |http://ebiquity.umbc.edu/ontology/event.owl#event|:|EventSeries|
                                  nil
                                  ((|http://ebiquity.umbc.edu/ontology/event.owl#event|:|defaultHost|
                                    :type
                                    |http://ebiquity.umbc.edu/ontology/person.owl#|:|Person|)
                                   (|http://ebiquity.umbc.edu/ontology/event.owl#event|:|includes|
                                    :type
                                    |http://ebiquity.umbc.edu/ontology/event.owl#event|::|Event|)))
