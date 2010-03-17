(in-package :xmlp)


(defParameter *soap-document-string*
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
        <ns1:setVal xmlns:ns1='urn:demo1:exchange'>
            <attrname xsi:type='xsd:string'>some-parameter</attrname>
            <newval xsi:type='xsd:double'>1.234</newval>
        </ns1:setVal>
     </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>")

#+test
(progn (setq *doc* (sax:soap-xml-parse xmlp::*soap-document-string*))
       (sax::print-as-tree *doc*))

#+file-test
(xmlp:document-parser "file://xml/demos/saxandsoap/soap-1.xml")

#+file-via-soap
(progn (setq *doc* (sax:soap-xml-parse "file://xml/demos/saxandsoap/soap-1.xml"))
       (sax::print-as-tree *doc*))

#+file-via-soap
(progn (setq *doc* (sax:soap-xml-parse "file://xml/demos/saxandsoap/soap-test-2.xml"))
       (sax::print-as-tree *doc*))
