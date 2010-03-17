(in-package :xml-sax)

;;; This "sax api" is modeled after java 
;;; with some differences for lisp style

#+isc
(isc::record-source-file "$Revision: 1.1.1.1 $" "$State: Exp $" "$Source: /home/cvs/repository/Library/de/setf/cl-xml/demos/saxandsoap/empty-consumer.lisp,v $")

(eval-when (compile load eval)
  (defclass empty-sax-consumer ()
    ((locator :initform nil
	      :documentation "stores the locator if one is available.")
     )
    (:documentation
     "The empty-sax-consumer is a sample class that
 can be subclassed to do custom parsing of XML documents.
 The methods here process notification of the logical content 
of a document during reading of an XML file.

<p>This is the main interface that most SAX applications
 implement: if the application needs to be informed of basic parsing 
 events, it subclasses empty-sax-consumer and passes an instance to
 the XML parser using argument.
 The parser uses the instance to report 
 basic document-related events like the start and end of elements 
 and character data.</p>

<p>The order of events in this interface is very important, and
 mirrors the order of information in the document itself.  For
 example, all of an element's content (character data, processing
 instructions, and/or subelements) will appear, in order, between
 the startElement event and the corresponding endElement event.</p>")))

(defmethod set-locator ((self empty-sax-consumer) doc-locator)
  "Receive an object for locating the origin of SAX document events.

<p>SAX parsers are strongly encouraged (though not absolutely
required) to supply a locator: if it does so, it must supply
the locator to the application by invoking this method before
invoking any of the other methods in the ContentHandler
interface.</p>

<p>The locator allows the application to determine the end
position of any document-related event, even if the parser is
not reporting an error.  Typically, the application will
use this information for reporting its own errors (such as
character content that does not match an application's
business rules).  The information returned by the locator
is probably not sufficient for use with a search engine.
The locator's primary functions are document-location and document-position</p>

<p>Note that the locator will return correct information only
during the invocation of the events in this interface.  The
application should not attempt to use it at any other time.</p>

:PARAM doc-locator An object that can return the location of any SAX document event.
:SEE org.xml.sax.Locator"
  (with-slots (locator) self
    (setf locator doc-locator)))

(defmethod start-document ((self empty-sax-consumer) locator mode)
  "Receive notification of the beginning of a document.

<p>The SAX parser will invoke this method only once, before any
other methods in this interface (except for :SEE set-document-locator )
PARAM locator is a document locator object implementing 
document-location and document-position.
PARAM mode is a mode variable stored in the ?? object
"
  (declare (ignore mode))
  (set-locator self locator)
  nil)

(defmethod end-document ((self empty-sax-consumer) mode)
  "Receive notification of the end of a document.

<p>The SAX parser will invoke this method only once, and it will
be the last method invoked during the parse.  The parser shall
not invoke this method until it has either abandoned parsing
 (because of an unrecoverable error) or reached the end of
input.</p>"
  (declare (ignore mode))
  nil)

(defmethod start-prefix-mapping ((self empty-sax-consumer) prefix uri mode)
  "Begin the scope of a prefix-URI Namespace mapping.

<p>The information from this event is not necessary for
 normal Namespace processing: the SAX XML reader will 
 automatically replace prefixes for element and attribute
 names when the <code>http://xml.org/sax/features/namespaces</code>
 feature is <var>true</var> (the default).</p>

 <p>There are cases, however, when applications need to
 use prefixes in character data or in attribute values,
 where they cannot safely be expanded automatically; the
 start/endPrefixMapping event supplies the information
 to the application to expand prefixes in those contexts
 itself, if necessary.</p>

 <p>Note that start/endPrefixMapping events are not
 guaranteed to be properly nested relative to each-other:
 all startPrefixMapping events will occur before the
 corresponding {@link #startElement startElement} event, 
 and all {@link #endPrefixMapping endPrefixMapping}
 events will occur after the corresponding {@link #endElement
 endElement} event, but their order is not otherwise 
 guaranteed.</p>

 <p>There should never be start/endPrefixMapping events for the
 'xml' prefix, since it is predeclared and immutable.</p>

:PARAM prefix The Namespace prefix being declared.
:PARAM uri The Namespace URI the prefix is mapped to.
:SEE end-prefix-mapping
:SEE start-element
"
  (declare (ignore prefix uri mode))
  nil)

(defmethod end-prefix-mapping ((self empty-sax-consumer) prefix mode)
  "End the scope of a prefix-URI mapping.

 <p>See :SEE start-prefix-mapping for 
 details.  This event will always occur after the corresponding 
 :SEE end-element event, but the order of 
 end-prefix-mapping events is not otherwise
 guaranteed.</p>

:PARAM prefix The prefix that was being mapping.
:SEE start-prefix-mapping
:SEE end-element
"
  (declare (ignore prefix mode))
  nil)

(defmethod start-element ((self empty-sax-consumer) element-name attributes namespaces mode)
  "Receive notification of the beginning of an element.

 <p>The Parser will invoke this method at the beginning of every
 element in the XML document; there will be a corresponding
 :SEE end-element event for every start-element event
 (even when the element is empty). All of the element's content will be
 reported, in order, before the corresponding end-element
 event.</p>

<p>The element-name is a symbol giving the qualified name (namespace:localname)
for this element.

 <p>Note that the attribute list provided will contain only
 attributes with explicit values (specified or defaulted):
 #IMPLIED attributes will be omitted.  The attribute list
 will contain attributes used for Namespace declarations
 (xmlns* attributes) only if the
 <code>http://xml.org/sax/features/namespace-prefixes</code>
 property is true (it is false by default, and support for a 
 true value is optional).</p>

<p>The default implementation pushes the element name and attributes
on a stack, for return via the default end-element operation.</p>

:PARAM element-name is the symbol naming the element
This symbol is a direct intern of the string given in the document,
so it is often printed (for example) as <code>|my-ns:my-element|</code>

<p>The default behavior is to do nothing.

:PARAM tag is the name of the tag

:PARAM atts The attributes attached to the element as a list of keyword/value
  pairs. If there are no attributes, the value is nil.

:PARAM mode is the result of the sax-consumer-mode function.
It is neither used or set by the XML parser, and instead a convience 
for SAX handlers that need to access internal state on every event.

:SEE end-element
"
  (declare (ignore element-name attributes namespaces mode))
  nil)

(defmethod end-element ((self empty-sax-consumer) element-name content-data mode)
  "Receive notification of the end of an element.

 <p>The SAX parser will invoke this method at the end of every
 element in the XML document; there will be a corresponding
 :SEE start-element event for every end-element 
 event (even when the element is empty).</p>

<p>The primary result of end-element is to return an 'element value'
to be added into the containing element's 'content data'.

<p>The default here is to return <code>(values nil t)</code>
so as to indicate 'no value'.

:RETURN end-element returns TWO values:  
<br>the first value is the 'element value' to be accumulated
for a containing element
<br>the second value is 'suppress accumulation' meaning the
element value is not to be accumulated.
:PARAM element-name is the symbol naming this element.
:PARAM content-data is a list of the elements found between
the begin and end operations.  This is just an accumulated list
of the results for the end-element operations performed.
"
  (declare (ignore element-name content-data mode))
  (values nil t))

(defmethod char-content ((self empty-sax-consumer) char-data mode)
  "Receive notification of character data. Result is collected to become the
content passed to end-element"
  (declare (ignore mode))
  char-data)

#+not-used
(defmethod add-ignorable-whitespace ((self empty-sax-consumer) ch-array start length mode)
  "Receive notification of ignorable whitespace in element content.

 <p>Validating Parsers must use this method to report each chunk
 of whitespace in element content (see the W3C XML 1.0 recommendation,
 section 2.10): non-validating parsers may also use this method
 if they are capable of parsing and using content models.</p>

 <p>SAX parsers may return all contiguous whitespace in a single
 chunk, or they may split it into several chunks; however, all of
 the characters in any single event must come from the same
 external entity, so that the Locator provides useful
 information.</p>

 <p>The application must not attempt to read from the array
 outside of the specified range.</p>

<p>The default behavior is to do nothing

:PARAM ch-array The characters from the XML document.
:PARAM start The start position in the array.
:PARAM length The number of characters to read from the array.
"
  (declare (ignore ch-array start length mode))
  nil)

(defmethod processing-instruction ((self empty-sax-consumer) target data mode)
  "Receive notification of a processing instruction.

 <p>The Parser will invoke this method once for each processing
 instruction found: note that processing instructions may occur
 before or after the main document element.</p>

 <p>A SAX parser must never report an XML declaration (XML 1.0,
 section 2.8) or a text declaration (XML 1.0, section 4.3.1)
 using this method.</p>

:PARAM target The processing instruction target.
:PARAM data The processing instruction data, or nil if
        none was supplied.  The data does not include any
        whitespace separating it from the target.
"
  (declare (ignore target data mode))
  nil)

#+not-used
(defmethod skipped-entity ((self empty-sax-consumer) name mode)
  "Receive notification of a skipped entity.

 <p>The Parser will invoke this method once for each entity
 skipped.  Non-validating processors may skip entities if they
 have not seen the declarations (because, for example, the
 entity was declared in an external DTD subset).  All processors
 may skip external entities, depending on the values of the
 <code>http://xml.org/sax/features/external-general-entities</code>
 and the
 <code>http://xml.org/sax/features/external-parameter-entities</code>
 properties.</p>

:PARAM name The name of the skipped entity.  If it is a 
        parameter entity, the name will begin with '%', and if
        it is the external DTD subset, it will be the string
        \"[dtd]\".
"
  (declare (ignore name mode))
  nil)

(defmethod start-cdata ((self empty-sax-consumer) mode)
  "Report the start of a CDATA section.

 <p>The contents of the CDATA section will be reported through
 the regular :SEE add-characters event; this event is intended only to report
 the boundary.</p>
"
  (declare (ignore mode))
  nil)

(defmethod end-cdata ((self empty-sax-consumer) mode)
  "Report the start of a CDATA section.

 <p>The contents of the CDATA section will be reported through
 the regular :SEE add-characters event; this event is intended only to report
 the boundary.</p>
"
  (declare (ignore mode))
  nil)


(defmethod sax-consumer-mode ((self empty-sax-consumer))
  "Return a mode indicative of current state.
Passed as argument to the various state transition functions"
  nil)

(defmethod collapse-whitespace-p ((self empty-sax-consumer))
  "Return T if the contents of the current element are have
whitespace condensed. Default is t."
  t)