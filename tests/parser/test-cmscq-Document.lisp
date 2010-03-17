;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

;; 20010914 0.913

(in-package "XML-PARSER")

;; valid
(let ((document
       (document-parser
        "<!DOCTYPE doc [
    <!ELEMENT doc (a:x | b:x)* >
    <!ATTLIST doc xmlns CDATA 'http://www.example.org/ns-bare'>
    <!ELEMENT a:x (tick, tock)>
    <!ATTLIST a:x xmlns:a CDATA 'http://www.example.org/ns-a'>
    <!ELEMENT b:x (tick, tick, tock)>
    <!ATTLIST b:x xmlns:b CDATA 'http://www.example.org/ns-b'>
    <!ELEMENT tock ANY>
    <!ELEMENT tick ANY>
    ]>

   <doc xmlns='http://www.example.org/ns-bare'
        xmlns:c='http://www.example.org/ns-bare'>
     <x xmlns='http://www.example.org/ns-a'><c:tick/><c:tock/></x>
     <x xmlns='http://www.example.org/ns-b'><c:tick/><c:tick/><c:tock/></x>
     <x xmlns='http://www.example.org/ns-a'><c:tick/><c:tock/></x>
     </doc>"
        :validate t)))
  (setf (encoding document) :ascii)
  (write-node document *trace-output*))

;; invalid
(write-node
 (document-parser
  "<!DOCTYPE doc [
    <!ELEMENT doc (a:x | b:x)* >
    <!ATTLIST doc xmlns CDATA 'http://www.example.org/ns-bare'>
    <!ELEMENT a:x (tick, tock)>
    <!ATTLIST a:x xmlns:a CDATA 'http://www.example.org/ns-a'>
    <!ELEMENT b:x (tick, tick, tock)>
    <!ATTLIST b:x xmlns:b CDATA 'http://www.example.org/ns-b'>
    <!ELEMENT tock ANY>
    <!ELEMENT tick ANY>
    ]>

   <doc xmlns='http://www.example.org/ns-bare'
        xmlns:c='http://www.example.org/ns-bare'>
     <x xmlns='http://www.example.org/ns-b'><c:tick/><c:tock/></x>
     <x xmlns='http://www.example.org/ns-a'><c:tick/><c:tick/><c:tock/></x>
     <x xmlns='http://www.example.org/ns-a'><c:tick/><c:tock/></x>
     </doc>"
  :validate t)
 *trace-output*)




:EOF
