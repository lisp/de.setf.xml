;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://musicbrainz.org/mm/mm-2.1#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "#Album"
                                          "#albumList"
                                          "#Artist"
                                          "#cdindexidList"
                                          "#duration"
                                          "#releaseStatus"
                                          "#releaseType"
                                          "#sortName"
                                          "#Status"
                                          "#StatusBootleg"
                                          "#StatusOfficial"
                                          "#StatusPromotion"
                                          "#Track"
                                          "#trackList"
                                          "#trackNum"
                                          "#trmid"
                                          "#trmidList"
                                          "#Type"
                                          "#TypeAlbum"
                                          "#TypeAudiobook"
                                          "#TypeCompilation"
                                          "#TypeEP"
                                          "#TypeInterview"
                                          "#TypeLive"
                                          "#TypeOther"
                                          "#TypeRemix"
                                          "#TypeSingle"
                                          "#TypeSoundtrack"
                                          "#TypeSpokenword")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://musicbrainz.org/mm/mm-2.1#")
           (make-package "http://musicbrainz.org/mm/mm-2.1#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("#Album" "#albumList" "#Artist" "#cdindexidList" "#duration"
             "#releaseStatus" "#releaseType" "#sortName" "#Status"
             "#StatusBootleg" "#StatusOfficial" "#StatusPromotion" "#Track"
             "#trackList" "#trackNum" "#trmid" "#trmidList" "#Type"
             "#TypeAlbum" "#TypeAudiobook" "#TypeCompilation" "#TypeEP"
             "#TypeInterview" "#TypeLive" "#TypeOther" "#TypeRemix"
             "#TypeSingle" "#TypeSoundtrack" "#TypeSpokenword"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://musicbrainz.org/mm/mm-2.1#" :if-does-not-exist :load)
