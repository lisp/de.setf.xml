;;
;; how to parse

(in-package :web-user)

<h2>CL-XML: How To: Parsing Documents</h2>
<p>20031024  <br/>
<a href="mailto:James.Anderson@setf.de">james anderson</a></p>
<hr/>
<br/>

<table border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
   <td align="center">
    [<a href="./load.html">loading</a>]
    [<a href="#Parse">parsing</a>]
    [<a href="./functional-accessors.html">accessor functions</a>]
    [<a href="./path-accessors.html">paths</a>]
    [<a href="./combined-methods.html">combinations</a>]
    [<a href="./transformations.html">transformations</a>]
    <a name="TOP"></a></td></tr>
  </table>


(defVar *dm* nil)

<p>
the primary interface function for parsing is <code>parse-document</code>. It is a generic function with a method which which accepts streams and parsed the content tp produce a document data instance. in addition, it comprises methods which accept universal resource identifiers, or, more conveniently, strings designators for URI and operate on the indicated resource.
it is possible to parse a document from any of various sources.</p>
<p>
parse a document from an http server by passing an http uri designator. nb: the illustrated address,<code>127.0.0.1</code> is the tcp "loopback" address, which means that the <a href='./howto.xml'><i>howto</i></a> file must be present in the local server's root in order for the retrieval to succeed.</p>

(setq *dm* (parse-document "http://127.0.0.1/howto.xml"))
<p><code>
== #&lt;DOC-NODE &lt;no uri> #x186EC1E></code></p>

(describe *dm*)
<p><code><pre>
== #&lt;DOC-NODE &lt;no uri> #x186EC1E>
Class: #&lt;STANDARD-CLASS DOC-NODE>
Wrapper: #&lt;CCL::CLASS-WRAPPER DOC-NODE #xD53A26>
Instance slots
PARENT: NIL
CHILDREN: (#&lt;ELEM-NODE ||::|inventory| 1 #x18710D6>)
ENTITY-INFO: #&lt;ENTITY-INFORMATION-NODE ||::|| #x1874666>
ROOT: #&lt;ELEM-NODE ||::|inventory| 1 #x18710D6>
STANDALONE: T
VERSION: NIL
NOTATIONS: #&lt;HASH-TABLE :TEST EQL size 0/60 #x186EF8E>
XML-QUERY-DATA-MODEL::IDS: #&lt;HASH-TABLE :TEST EQL size 0/60 #x186F266>
GENERAL-ENTITIES: #&lt;HASH-TABLE :TEST EQL size 5/60 #x186EBC6>
PARAMETER-ENTITIES: #&lt;HASH-TABLE :TEST EQL size 0/60 #x186F816>
TYPES: #&lt;HASH-TABLE :TEST EQL size 0/60 #x186FAEE>
ATTRIBUTES: NIL
XML-QUERY-DATA-MODEL::VALIDATE: NIL
NAMESPACES: NIL
</pre></code><br />
parse a document which is located in the file system by passing a file url designator.</p>

(setq *dm* (parse-document "file://xml/documentation/howto/howto.xml"))
<p>
parse a document which is contained in a string by passing the string. Note that the initial character mut be a #\&lt; in order that the string is recognized as a literal document.
note also, in this care, must be taken to escape delimiters or use apostrophe rather
than quotation delimiters.</p>

(setq *dm* (parse-document "<inventory title='OmniCorp Store #45x10^3'>
  <section name='health'>
    <item upc='123456789' stock='12'>
      <name>Invisibility Cream</name>
      <price>14.50</price>
      <description>Makes you invisible</description>
    </item>
    <item upc='445322344' stock='18'>
      <name>Levitation Salve</name>
      <price>23.99</price>
      <description>Levitate yourself for up to 3 hours per application</description>
    </item>
  </section>
  <section name='food'>
    <item upc='485672034' stock='653'>
      <name>Blork and Freen Instameal</name>
      <price>4.95</price>
      <description>A tasty meal in a tablet; just add water</description>
    </item>
    <item upc='132957764' stock='44'>
      <name>Grob winglets</name>
      <price>3.56</price>
      <description>Tender winglets of Grob. Just add water</description>
    </item>
  </section>
</inventory>"))

<p>
alternative to the file url, a pathname designator may be used to identify a file source.</p>
(parse-document #p"xml:documentation;howto;howto.xml")

<p> or from a stream</p>
(with-open-file (stream #p"xml:documentation;howto;howto.xml")
  (parse-document stream))

<p>
in addition to the common forms, the parser accepts alternatives such as byte vectors, and url instances.</p> 

(mapcar #'class-name
        (mapcar #'first
                (mapcar #'method-specializers (generic-function-methods #'document-parser))))
<p><code>
== (STREAM PATHNAME DATA-URL HTTP-URL FILE-URL VECTOR STRING)</code></p>
<p>
namespaces are handled transparently, in that names are automatically interned into packages or namesets. by default, the null namespace is modeled with a concrete nameset with the name <code>""</code>. in event that it is desired to intern those names in some other nameset, the <code>*null-namespace*</code> should be bound to the desired package/nameset while the document is parsed.</p>

(let ((*null-namespace* *package*))
  (name (root (parse-document "<element/>"))))
<p>
== <code>WEB-USER::|element|</code></p>

:eof

