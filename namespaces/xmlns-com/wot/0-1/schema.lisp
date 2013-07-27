;;; 20100513T120744Z00
;;; from #<doc-node http://xmlns.com/wot/0.1/index.rdf #x26118ACE>

(common-lisp:in-package "http://xmlns.com/wot/0.1/")
(de.setf.resource.schema:defclass |http://xmlns.com/wot/0.1/EncryptedDocument|
                                  (|http://xmlns.com/foaf/0.1/|:|Document|
                                   |http://xmlns.com/wordnet/1.6|:|Endorsement-4|)
                                  nil)

(de.setf.resource.schema:defclass |http://xmlns.com/wot/0.1/Endorsement|
                                  (|http://xmlns.com/foaf/0.1/|:|Document|
                                   |http://xmlns.com/wordnet/1.6|:|Endorsement-4|)
                                  nil)

(de.setf.resource.schema:defclass |http://xmlns.com/wot/0.1/PubKey|
                                  (|http://xmlns.com/wordnet/1.6|:|Credential|)
                                  nil)

(de.setf.resource.schema:defclass |http://xmlns.com/wot/0.1/SigEvent|
                                  (|http://www.w3.org/2002/12/cal/ical#|:|Vevent|
                                   |http://xmlns.com/wordnet/1.6|:|Event|)
                                  nil)

(de.setf.resource.schema:defclass |http://xmlns.com/wot/0.1/User|
                                  (|http://xmlns.com/foaf/0.1/|:|Agent|)
                                  nil)
