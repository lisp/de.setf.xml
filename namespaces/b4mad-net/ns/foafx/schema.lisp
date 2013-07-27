;;; 20100513T131822Z00
;;; from #<doc-node http://b4mad.net/ns/foafx/index.rdf #x29BE211E>

(common-lisp:in-package "http://b4mad.net/ns/foafx/")
(de.setf.resource.schema:defclass |http://b4mad.net/ns/foafx/OnlineEmailAccount|
                                  (|http://xmlns.com/foaf/0.1/|:|OnlineAccount|)
                                  nil)

(de.setf.resource.schema:defclass |http://b4mad.net/ns/foafx/PreferredOnlineAccount|
                                  (|http://xmlns.com/foaf/0.1/|:|OnlineAccount|
                                   |http://xmlns.com/wordnet/1.6|:|Preference|
                                   |OnlineEmailAccount|)
                                  nil)
