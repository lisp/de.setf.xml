;;; 20100513T131601Z00
;;; from #<doc-node http://purl.oclc.org/net/rss_2.0/enc #x268F47E6>

(common-lisp:in-package "http://purl.oclc.org/net/rss_2.0/enc#")
(de.setf.resource.schema:defclass |Enclosure|
                                  (|http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Resource|)
                                  ((|type| :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Literal|)
                                   (|length| :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Literal|)
                                   (|url| :type
                                    |http://www.w3.org/1999/02/22-rdf-syntax-ns#|:|Literal|)))
