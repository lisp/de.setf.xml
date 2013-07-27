;;; 20100512T222219Z00
;;; from #<doc-node http://www.ldodds.com/projects/musicbrainz/schema/index.rdf #x19D1D736>

(common-lisp:in-package "http://musicbrainz.org/mm/mm-2.1#")
(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|Album|
                                  (|http://xmlns.com/wordnet/1.6|:|AudioCD|)
                                  ((|http://musicbrainz.org/mm/mm-2.1|:|releaseStatus|
                                    :type
                                    |http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|releaseType|
                                    :type
                                    |http://musicbrainz.org/mm/mm-2.1|:|Status|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|trackList|
                                    :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Seq|)))

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|Artist|
                                  nil
                                  ((|http://musicbrainz.org/mm/mm-2.1|:|sortName|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|albumList|
                                    :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Bag|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|cdindexidList|
                                    :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Bag|)))

(de.setf.resource.schema:defclass |http://xmlns.com/wordnet/1.6|:|Musician|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Artist|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|Status|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|StatusBootleg|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Status|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|StatusOfficial|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Status|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|StatusPromotion|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Status|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|Track|
                                  nil
                                  ((|http://musicbrainz.org/mm/mm-2.1|:|trackNum|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|duration|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|trmid|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|http://musicbrainz.org/mm/mm-2.1|:|trmidList|
                                    :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Bag|)))

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|Type|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeAlbum|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeAudiobook|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeCompilation|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeEP|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeInterview|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeLive|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeOther|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeRemix|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeSingle|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeSoundtrack|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)

(de.setf.resource.schema:defclass |http://musicbrainz.org/mm/mm-2.1|:|TypeSpokenword|
                                  (|http://musicbrainz.org/mm/mm-2.1|:|Type|)
                                  nil)
