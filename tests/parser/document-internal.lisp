;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

;;
;; this file demonstates simple parsing and serialization operations on immediate
;; string or model data.


;;
;; elemantary parsing:  minimal, w/o namespaces, w/ namespaces 

(document-parser "<document/>")

(flet ((parse-and-report (source)
         (format *trace-output* "~%~%source:~%~s" source)
         (handler-case (let ((result (document-parser source)))
                         (format *trace-output* "~%parsed result:~%~s" result)
                         (format *trace-output* "~%serializes as:~%" )
                         (write-node result *trace-output* :encoding :us-ascii))
           (error (condition)
                  (format *trace-output* "~%signaled error:~%~a" condition)))))
  (map nil #'parse-and-report
       (list "<document/>"
             "data:,<document/>"
             "<document att='qwer'><?pi?><!-- ... --></document>
<?pi note that a processing instruction is not <em>not</em> part of a document's
     character data. thus entities (&#63; and &#62; too) remain unexpanded.?>
<!-- comment -->"
             "<document attr='value'>content</document>"
             "<ns:document attr='value' xmlns:ns='ns1' xmlns='ns2' ns:attr='value'>asdf<element/></ns:document>"
             "file://xml/tests/xml/channel.xml"
             )))


;; an example from "electric xml":
;; the first version of the parser, working with strings, tracing, and unoptimized
;; managed at best 100 milliseconds for a single parse on a 604/200 under mcl4.2 - two orders of magnitude
;; over the quoted java times.
;; the first released version, binary-based, optimised and untraced required 40 for the
;; first call and around 21 for successive calls.

(defNamespace "http://schemas.xmlsoap.org/soap/envelope/"
  (:nicknames "soap")
  (:intern "Body" "Envelope" "encodingStyle")
  (:shadow nil))

(defParameter *exml-document*
  "<SOAP-ENV:Envelope
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
  </SOAP-ENV:Envelope>")
(defParameter *soap-dom* (document-parser *exml-document*))

(format *trace-output* "~%~%~a~% timings:~%" *exml-document*)
(time (dotimes (x 10) (document-parser *exml-document*)))

(with-namespaces (("xmlns:ns1='urn:demo1:exchange" (:shadow nil) (:export "getRate")
                   ;(:permission :read-only)
                   ))
  (format *trace-output* "~% with prebound namespace (+/-0 for packages):~%")
  (time (dotimes (x 10) (document-parser *exml-document*))))
                  

(defParameter *exml-document/null*
  "<Envelope >
     <Body>
        <getRate xmlns:ns1='urn:demo1:exchange' 
           encodingStyle='http://schemas.xmlsoap.org/soap/encoding/'>
           <country2 type='xsd:string'>japan</country2>
        </getRate>
     </Body>
  </Envelope>")
(format *trace-output* "~%~%a document which uses the null namespace only~%~a~% timings:~%" *exml-document/null*)
(time (dotimes (x 10) (document-parser *exml-document/null*)))


;;
;; dtd qname resolution

(defParameter *dtd-document*
  "<!DOCTYPE ns:doc [
     <!ELEMENT ns:doc (a, b)>
     <!ATTLIST ns:doc xmlns:ns CDATA 'a namespace' >
     <!ELEMENT a ANY>
     <!ATTLIST a ns:att1 CDATA ' a default' >
     <!ELEMENT b ANY>
     <!ELEMENT c ANY>
     ]>
   <ns:doc>
     <a xmlns:qwerty='a namespace' qwerty:att1='explicitly'><b><c/></b></a>
     </ns:doc>")

(format *trace-output* "~%~%~a~% timings:~%" *dtd-document*)
(time (dotimes (x 10) (document-parser *dtd-document*)))
(format *trace-output* "~% serialized:~%")
(write-node (document-parser *dtd-document*) *trace-output* :encoding :us-ascii)


;;
;; define a static namespace and intern the attribute name in the static null namespace

(defNamespace "data:,lc.setf.de"
  (:nicknames "lc")
  (:export "book" "title" "author" "library" "index" "key" "isbn" "entry"))
(intern-name "isbn" "")

(defParameter *library-document*
  "<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE library [
  <!ELEMENT library (book*) >
  <!ELEMENT book (author, title) >
  <!ELEMENT author (#PCDATA) >
  <!ELEMENT title (#PCDATA) >
  <!ATTLIST library xmlns CDATA 'data:,lc.setf.de' >
  <!ATTLIST book isbn CDATA #REQUIRED >
  <!ENTITY isbn 'isbn:' >
  ] >
<library >
  <book isbn='&lt;0-312-85172-3&gt;'>
    <title>Aristoi</title>
    <author>Walter Jon Williams</author>
    </book>
  <book isbn='&isbn;0-812-51349-5'>
    <title>Enders Game</title>
    <author>Orson Scott Card</author>
    </book>
  <book isbn='&isbn;0-812-51349-5'>
    <title>Enders Game</title>
    <author>Orson Scott Card</author>
    </book>
  </library>")

(defParameter *library-dom* (document-parser *library-document*))

(format *trace-output* "~%~%~a~% timings:~%" *library-document*)
(time (dotimes (x 10) (document-parser *library-document*)))
(format *trace-output* "~% serialized:~%")
(write-node *library-dom* *trace-output* :encoding :us-ascii)


;;
;; simple access and construction

(defParameter *index-dom*
  (make-doc-node :root (make-elem-node :name '{lc}index
                                       :children
                                       (apply #'append
                                              (mapcar #'(lambda (book &aux (isbn (./@ book '{}isbn)))
                                                          (list
                                                           (make-elem-node
                                                            :name '{lc}entry
                                                            :attributes
                                                            (list (make-string-attr-node :name '{lc}key
                                                                                         :children (list (./-string book '{lc}title)))
                                                                  isbn))
                                                           (make-elem-node
                                                            :name '{lc}entry
                                                            :attributes
                                                            (list (make-string-attr-node :name '{lc}key
                                                                                         :children (list (./-string book '{lc}author)))
                                                                  isbn))))
                                                      (.//* *library-dom* '{lc}book))))))

(format *trace-output* "~%~% reorganized as an index model:~%")
(let ((*print-pretty* t)) (write-node *index-dom* *trace-output* :encoding :us-ascii))

(setf (prefix '{lc}index) "LC")
(format *trace-output* "~%~% serialized directly:~%")
(let ((*print-pretty* t))
  (with-output-to-string (stream)
    (with-xml-writer (stream :encoding :us-ascii)
      (xml ({lc}index ({xmlns}lc "data:,lc.setf.de"))
           (map nil #'(lambda (book &aux (isbn (./@ book '{}isbn)))
                        (xml ({lc}entry ({lc}key (./-string book '{lc}title))) isbn)
                        (xml ({lc}entry ({lc}key (./-string book '{lc}author))) isbn))
                (.//* *library-dom* '{lc}book))))))

(fresh-line *trace-output*)
(let ((document "
 <LC:index xmlns:LC='data:,lc.setf.de'>
  <LC:entry LC:key='Aristoi' isbn='0-312-85172-3' />
  <LC:entry LC:key='Walter Jon Williams' isbn='0-312-85172-3' />
  <LC:entry LC:key='Enders Game' isbn='0-812-51349-5' />
  <LC:entry LC:key='Orson Scott Card' isbn='0-812-51349-5' />
 </LC:index>"))
  (format *trace-output* "document:~%~a~%==>~%" document)
  (write-node (document-parser document) *trace-output*))


(defTests
  (nil :form (document-parser "<document />") :type doc-node)
  (nil :form (document-parser "<unbound:document />") :type |NSC: Prefix Declared|)
  (nil :form (document-parser "<!DOCTYPE document [ <!ENTITY external SYSTEM 'data:,external data'><!ELEMENT document ANY > ] > <document attr='&external;'/>")
       :type |WFC: No External Entity References|))


;;;
;;; namespace value divergence
;;; iff the value is declare, it must match. otherwise (especially for implied values)
;;; no error should be signeled

(let ((document "<!DOCTYPE amqp [
<!ELEMENT amqp (doc|type)*>
<!ATTLIST amqp
    xmlns CDATA 'asdf'
	major CDATA #REQUIRED
	minor CDATA #REQUIRED
	port CDATA #REQUIRED
	comment CDATA #IMPLIED
>
<!ELEMENT type (doc)*>
<!ELEMENT doc (#PCDATA)>
]>
 <amqp xmlns='test'/>"
                ))
  (typep (nth-value 1 (ignore-errors (document-parser document)))
         'xml-utils:|NSC: Namespace Attribute Default|))

(let ((document "<!DOCTYPE amqp [
<!ELEMENT amqp (doc|type)*>
<!ATTLIST amqp
    xmlns CDATA #IMPLIED
	major CDATA #REQUIRED
	minor CDATA #REQUIRED
	port CDATA #REQUIRED
	comment CDATA #IMPLIED
>
<!ELEMENT type (doc)*>
<!ELEMENT doc (#PCDATA)>
]>
 <amqp xmlns='test'/>"
                ))
   (typep (ignore-errors (document-parser document)) 'doc-node))


:EOF
