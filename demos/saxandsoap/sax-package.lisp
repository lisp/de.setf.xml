(in-package :cl-user)

(defpackage xml-sax
  (:nicknames sax)
  (:use common-lisp xmlp)
  (:export

   ;; the classes
   #:empty-consumer
   #:sax-consumer
   #:sax-producer
   #:sax-filter
   #:struct-parser
   
   ;; The methods/generic functions
   #:start-document
   #:end-document
   #:start-element
   #:end-element
   #:xml-error
   #:processing-instruction
   #:add-characters
   #:character-events-p
   #:cdata-events-p
   #:sax-consumer-mode

   ;; accessors for locators [which are not defined here btw]
   #:document-location
   #:document-position

   ;; stuff for SOAP
   #:soap-xml-parse

   ))

  