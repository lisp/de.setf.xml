;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

(in-package "XML-QUERY")

;;
;; tokenize the use cases

(defMethod tokenize ((stream stream) &aux (tokens nil) token
                     (|xml|:|{| 0) (|xml|:|(| 0) (|xml|:|[| 0))
  (loop (setf token (xq-token-reader stream))
        (unless token
          (return (nreverse tokens)))
        (push token tokens)))

(defMethod tokenize ((source pathname))
  (with-open-file (stream source :direction :input)
    (tokenize stream)))

(let ((*package* (find-package "xml")))
  (pprint (tokenize #p"xml:tests;use-cases.xmlq")))

;;
;; parse the use cases to trees - that is without reduction.

;; note that it's not possible to parse a file incrementally, as the last token
;; read from an initial parse is then missing as the first token of the next
;; parse.

(defMethod window-xquery ((item window-fred-item)
                          &optional (start-name '|Query|))
  (window-xquery (view-window item) start-name))

(defMethod window-xquery ((window window)
                          &optional (start-name '|Query|))
  (multiple-value-bind (start end) (selection-range window)
    (cond ((eql start end) (ed-beep))
          (t
           (let ((string (buffer-substring (fred-buffer window) start end)))
             (with-input-from-string (stream string)
               (multiple-value-bind (result index complete)
                                    (query-parser stream
                                                     ; :reduce 'cons
                                                     :trace nil
                                                     :start-name start-name)
                 (values result index complete))))))))

(defMethod window-tokenize ((window window))
  (multiple-value-bind (start end) (selection-range window)
    (cond ((eql start end) (ed-beep))
          (t
           (let ((string (buffer-substring (fred-buffer window) start end)))
             (with-input-from-string (stream string)
               (tokenize stream)))))))

(defMethod window-tokenize ((item window-fred-item))
  (window-tokenize (view-window item)))

;(pprint (window-xquery (second (windows)) '|Query|))
;(pprint (window-xquery (second (windows)) '|Expr|))
;(inspect (window-tokenize (second (windows))))


(def-fred-command (:command #\[)
  #'(lambda (w) (eval-enqueue `(pprint (window-xquery ,w)))))





(setf (xpa:|document| "soap")
      (xmlp::document-parser  "<SOAP-ENV:Envelope
     xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/'
     xmlns:xsi='http://www.w3.org/1999/XMLSchema-instance'
     xmlns:xsd='http://www.w3.org/1999/XMLSchema'>
     <SOAP-ENV:Body>
        <ns1:getRate xmlns:ns1='urn:demo1:exchange' 
           SOAP-ENV:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'>
           <country1 xsi:type='xsd:string'>USA</country1>
           <country2 xsi:type='xsd:string'>japan</country2>
        </ns1:getRate>
     </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>"))

(setf (xpa:|document| "bib.xml")
      (xmlp::document-parser
"<!DOCTYPE bib [
  <!ELEMENT bib  (book* )>
  <!ELEMENT book  (title,  (author+ | editor+ ), publisher, price )>
  <!ATTLIST book  year CDATA  #REQUIRED >
  <!ELEMENT author  (last, first )>
  <!ELEMENT editor  (last, first, affiliation )>
  <!ELEMENT title  (#PCDATA )>
  <!ELEMENT last  (#PCDATA )>
  <!ELEMENT first  (#PCDATA )>
  <!ELEMENT affiliation  (#PCDATA )>
  <!ELEMENT publisher  (#PCDATA )>
  <!ELEMENT price  (#PCDATA )>
  ]>
<bib>
    <book year='1994'>
        <title>TCP/IP Illustrated</title>
        <author><last>Stevens</last><first>W.</first></author>
        <publisher>Addison-Wesley</publisher>
        <price> 65.95</price>
    </book>
 
    <book year='1992'>
        <title>Advanced Programming in the Unix environment</title>
        <author><last>Stevens</last><first>W.</first></author>
        <publisher>Addison-Wesley</publisher>
        <price>65.95</price>
    </book>
 
    <book year='2000'>
        <title>Data on the Web</title>
        <author><last>Abiteboul</last><first>Serge</first></author>
        <author><last>Buneman</last><first>Peter</first></author>
        <author><last>Suciu</last><first>Dan</first></author>
        <publisher>Morgan Kaufmann Publishers</publisher>
        <price> 39.95</price>
    </book>
 
    <book year='1999'>
        <title>The Economics of Technology and Content for Digital TV</title>
        <editor>
               <last>Gerbarg</last><first>Darcy</first>
                <affiliation>CITI</affiliation>
        </editor>
            <publisher>Kluwer Academic Publishers</publisher>
        <price>129.95</price>
    </book>
 
</bib>
"))
(setf (xpa:|document| "http://www.bn.com") (xpa:|document| "bib.xml"))

(inspect (xpa:|document| "soap"))
(xqa::type xqa::type-x bib)
(xqa::fun funx ((v1 xqa::type-x)) book
          (xqa::for (v2 (xpa::apply-path
                         (xpa:path
                          (xpa:root-step)
                          (xpa:step
                           (xpa:child) nil
                           (xpa:name-test :name
                                          (xpa:uname :local-part "bib")))
                          (xpa:step
                           (xpa:child) nil
                           (xpa:name-test :name
                                          (xpa:uname :local-part "book"))))
                         v1))
            v2))
(xqa::let ((var-x xqa::type-x) (xqa:|document| "bib.xml")))
(funx var-x)

(xql:every var-y (xpa::apply-path
                  (xpa:path
                   (xpa:root-step)
                   (xpa:step
                    (xpa:child) nil
                    (xpa:name-test :name
                                   (xpa:uname :local-part "book"))))
                  var-x)
           (xpa:|contains| var-y "x"))

(xql:some var-y (xpa::apply-path
                  (xpa:path
                   (xpa:root-step)
                   (xpa:step
                    (xpa:child) nil
                    (xpa:name-test :name
                                   (xpa:uname :local-part "book"))))
                  (xqa:|document| "bib.xml"))
           (xpa:= "TCP/IP Illustrated"
                  (xpa::apply-path
                   (xpa:path
                    (xpa:step
                     (xpa:child) nil
                     (xpa:name-test :name
                                    (xpa:uname :local-part "title"))))
                   var-y)))


#|
;; below follows the xqa syntax

;;
;; the parser generates document instances. 
;; this one includes an xml declaration
;; a root element, and a succeeding processing instruction.
;; note the comment in the middle of the element...

(inspect
 (query-parser
  "query
    processing_instruction( 'an initial pi' ),
    book [ @year  [ 2001 ],  @isbn  [ '1-XXXXX-YYY-Z' ], @xmlns:a ['asdf'],
         title  [ 'XML Query' ], 
         author [ 'Fernandez' ], 
         author [ 'Suciu' ],
         'text content',
         a:* [ 'Suciu' ] , (
         'text in a comment',
         ?aPi [ 'within the element' ] )
         ],
    PROCESSING-INSTRUCTION( 'a final pi' )"
  :trace nil))

(query-parser
  "PROCESSING-INSTRUCTION()"
  :trace nil)

(query-parser
  "fun  fun1( a : string ) : string = a"
  :trace nil)

(query-parser
  "x : string = -- a comment
    ('asdf' - -1)"
  :trace nil)

(query-parser
  "type tx = string"
  :trace nil)

(query-parser
  "query fun1(x)"
  :trace t)

(pprint
(query-parser
  "fun  fun1( a : string ) : string = a,
   type tx = string,
   x : string = 'asdf',
   y : string = 'asdf',
   z : string = 'asdf',
   query processing_instruction('api', 'an initial pi' ),
         ( fun1(x) ^ fun1(y) ) - fun1(z + 3),
         if 1 < 2 then 3 else -4 mod 2
   "
  :trace nil))

(pprint
(query-parser
  "query let x = elem [ 'asdf' ]
   "
  :trace nil))

(pprint
 (mapcar #'(lambda (x) (query-parser x :start-name '|Node| :trace nil))
         '("elem [ 'asdf' ]"
           "{''}elem ['asdf']")))

(query-parser "{''}elem ['asdf']" :start-name '|Node| :trace nil)

;|Exp|

;;
;; the reader macro recognizes the '[' ... ']' as delimiters for a query
;; expression

(defParameter *document*
  #![book [ @year  [ 2001 ],  @isbn  [ '1-XXXXX-YYY-Z' ], @xmlns:a ['asdf'],
         title  [ 'XML Query' ], 
         author [ 'Fernandez' ], 
         author [ 'Suciu', 'John' ],
         'asasas'
         ] ] )

(inspect *document*)

(write-node-xq *document* *trace-output*)
|#

;; use cases in file-form

(xmlp::document-parser #P"xml:Tests;xql;xmp;bib.xml" :trace nil)
:EOF
