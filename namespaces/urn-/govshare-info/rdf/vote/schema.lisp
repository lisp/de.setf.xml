;;; 20100512T225721Z00
;;; from #<doc-node http://www.govtrack.us/share/vote.rdf #x224C9D16>

(common-lisp:in-package "urn://govshare.info/rdf/vote/")
(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|Abstention|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Option|)
                                  nil
                                  (:documentation
                                    "An 'abstain'-type choice, to be used when a voter cast a ballot with none of the customary options chosen."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|ApprovalVote|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Vote|)
                                  nil
                                  (:documentation
                                    "A type of Vote in which voters vote for as many options as they want, and the winner is the single option with the most number of votes."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|Aye|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Option|)
                                  nil
                                  (:documentation "An Aye vote."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|Ballot|
                                  nil
                                  ((|http://www.rdfabout.com/rdf/schema/vote/|:|voter|
                                    :type |http://xmlns.com/foaf/0.1/|:|Agent|
                                    :documentation
                                    "Indicates the agent that cast the ballot.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|option|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|
                                    :documentation
                                    "Indicates the option chosen on a Ballot."))
                                  (:documentation
                                    "A choice made by a voter in a Vote."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|Nay|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Option|)
                                  nil
                                  (:documentation "A Nay vote."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|NoVote|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Option|)
                                  nil
                                  (:documentation
                                    "An 'absent'-type option, to be used when a voter did not cast a Ballot but a positive record of the voter's inaction needs to be recorded."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|Option|
                                  nil
                                  nil
                                  (:documentation
                                    "The parent class of all of the ballot options defined in this specification, although any resource can be used as an option."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|PluralityVote|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Vote|)
                                  nil
                                  (:documentation
                                    "A type of Vote in which the winner is the single option with the most number of votes."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|TwoThirdsVote|
                                  (|http://www.rdfabout.com/rdf/schema/vote/|:|Vote|)
                                  nil
                                  (:documentation
                                    "A type of Vote in which the default option wins unless two-thirds or more voters choose the alternative."))

(de.setf.resource.schema:defclass |http://www.rdfabout.com/rdf/schema/vote/|:|Vote|
                                  nil
                                  ((|http://www.rdfabout.com/rdf/schema/vote/|:|heldBy|
                                    :type
                                    |http://xmlns.com/foaf/0.1/|:|Organization|
                                    :documentation
                                    "Indicates the organization that held the vote.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|procedure|
                                    :type
                                    |http://www.w3.org/2001/XMLSchema|:|string|
                                    :documentation
                                    "Indicates the voting procedures, in natural language.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|threshold|
                                    :type
                                    |http://www.w3.org/2001/XMLSchema|:|string|
                                    :documentation
                                    "For a plurality vote, the threshold of votes needed for the plurality choice to be deemed a winner. Valid values are any fraction expressed as an integer numerator, a slash, and an integer denominator.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|hasOption|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|
                                    :documentation
                                    "Specifies that an option is available for voters in a Vote.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|default|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|
                                    :documentation
                                    "Specifies the default option in Votes that have such an option.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|winner|
                                    :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|
                                    :documentation
                                    "Indicates the winning option(s) in a vote, if the winner is known.")
                                   (|http://www.rdfabout.com/rdf/schema/vote/|:|hasBallot|
                                    :type
                                    |http://www.rdfabout.com/rdf/schema/vote/|:|Ballot|
                                    :documentation
                                    "Specifies that a Ballot was cast in a Vote."))
                                  (:documentation
                                    "A vote in which agents cast choices."))
