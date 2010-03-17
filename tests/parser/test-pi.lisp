;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

#|
<DOCUMENTATION>
 <DESCRIPTION>
  an example which uses the processing instructions for managing names
  </DESCRIPTION>
 </DOCUMENTATION>

|#

;; 20010914 0.913

(defParameter *document-string*
  "<!DOCTYPE doc [
     <?ns_make   namespace/1?>
     <?ns_export namespace/1 a b c?>
     <?ns_make   namespace/2?>
     <?ns_shadow namespace/2 c?>
     <?ns_use    namespace/2 namespace/1?>
     <!ELEMENT ns1:doc (ns1:a, ns1:b)>
     <!ATTLIST ns1:doc xmlns:ns1 CDATA 'namespace/1'
                       xmlns:ns2 CDATA 'namespace/2' >
     <!ELEMENT ns1:a ANY>
     <!ATTLIST ns1:a ns1:att1 CDATA ' a default' >
     <!ELEMENT ns1:b ANY>
     <!ELEMENT ns1:c ANY>
     <!ELEMENT ns2:c ANY>
     <!ATTLIST ns2:c ns1:att2 CDATA 'present in namespace/2 c only' >
     ]>
   <ns1:doc>
     <ns2:a xmlns:qwerty='namespace/1' qwerty:att1='explicitly'
            xmlns='namespace/2'>
      <b>
       <c/></b></ns2:a>
     </ns1:doc>")

(write-node (root (document-parser *document-string*)) *trace-output*)

;; should yield something like

"<ns1:doc xmlns:ns2='namespace/2' xmlns:ns1='namespace/1' xmlns=''>
     <qwerty:a xmlns:qwerty='namespace/1' xmlns='namespace/2' qwerty:att1='explicitly'>
      <qwerty:b>
       <c qwerty:att2='present in namespace/2 c only' /></qwerty:b></qwerty:a>
     </ns1:doc>"

:EOF


