;;; -*- package: WILBUR; Syntax: Common-lisp; Base: 10 -*-

(in-package "WILBUR")

;; an xmlp-based rdf parser drives the wilbur event-based counterpart based on
;; inline parser construction operations 

(defClass rdf-xmlp-parser (rdf-parser)
  ()
  (:default-initargs
    :producer (make-instance 'nox::sax-construction-context
                :consumer (make-instance 'rdf-syntax-normalizer))))

;;
;;
;; the top-level parse function

(defGeneric parse-db-from-xmlp-stream (source &rest options)
  (:documentation
   "generate an rdf database from an input source.
    uses an rdf parser specialized to translate xmlp parse events into the required
    SAX-equivalent events.
    includes a somewhat redundant method to map a string source to an URI as the
    rdf parsing interface required that before the xmlp parser itself is called. ")
  (:method ((source t) &rest options)
           (apply #'parse-db-from-stream source (xqdm:uri source)
                  :parser-class 'rdf-xmlp-parser
                  options))
  (:method ((source string) &rest options)
           (cond ((char= (char source 0) #\<)
                  (apply #'parse-db-from-xmlp-stream
                         (make-instance 'vector-input-stream :vector source)
                         options))
                 (t
                  (apply #'parse-db-from-xmlp-stream (xutils:make-uri source)
                         options)))))

:EOF
