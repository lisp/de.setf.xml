;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "urn://govshare.info/rdf/vote/"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Abstention"
                                          "ApprovalVote"
                                          "Aye"
                                          "Ballot"
                                          "default"
                                          "hasBallot"
                                          "hasOption"
                                          "heldBy"
                                          "Nay"
                                          "NoVote"
                                          "option"
                                          "Option"
                                          "PluralityVote"
                                          "procedure"
                                          "threshold"
                                          "TwoThirdsVote"
                                          "Vote"
                                          "voter"
                                          "winner")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "urn://govshare.info/rdf/vote/")
           (make-package "urn://govshare.info/rdf/vote/"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Abstention" "ApprovalVote" "Aye" "Ballot" "default" "hasBallot"
             "hasOption" "heldBy" "Nay" "NoVote" "option" "Option"
             "PluralityVote" "procedure" "threshold" "TwoThirdsVote" "Vote"
             "voter" "winner"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "urn://govshare.info/rdf/vote/" :if-does-not-exist :load)
