;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.xml-rpc; -*-
;;;
;;; how to implement xml-rpc in lisp

(in-package :de.setf.xml.xml-rpc)

<table border="0" cellpadding="0" cellspacing="0" width="100%" class='header'>
  <tr>
   <td> <h2>CL-XML: How To: XML-RPC</h2>
<p>20031024  <a href="mailto:James.Anderson@setf.de">james anderson</a>,<br />
 all rights reserved. no warranty.
  <a href='http://www.setf.de/library/ncsl.html'>[0]</a>
  <a href='ncsl.html'>[1]</a>
 
 </p>
   </td></tr>
  <tr>
   <td align="center">
    <p align="center">[<a href="#Goal">the goal</a>]
                      [<a href="#Interfaces">program interface</a>]
                      [<a href="#Examples">examples</a>]<a name="TOP"></a></p>
		</td>
	</tr>
  </table>


(defParameter *xml-rpc-package*
  (list (find-package "/RPC2")))

(defparameter *exported-packages* (list *xml-rpc-package*))

<a name='Goal'><hr /></a>
<h2>the goal</h2>
<p>
<a href='http://www.xmlrpc.com/'>xml-rpc</a> was "designed to be as simple as
 possible, while allowing complex data structures to be transmitted, processed
 and returned." it allows for the contradiction in terms which inhers in its
basis, at least the intent appeals to principles shared by lisp developers. one
wonders whether an implementation in lisp can achieve that goal, despite the
circumstances.</p>

<p>
this note describes a step-by-step xml-rpc implementation. it starts by
proposing a simple paradigm for xml-rpc use, discusses the building blocks
contribute to that, describes who on can find them and/or fabricate them, and
concludes with definitions which integrate the components into an xml-based rpc
utility. the implementation is based on the
<a href='http://www.cl-xml.org'>cl-xml</a> xml parser and document model
libraries, and the <a href='www.ai.mit.edu/cl-http'>cl-http</a> http substrate,
but could as well be accomplished with other libraries.</p>


<hr />
<h2>how might the goal be manifest in lisp</h2>
<p>
first, in the ideal case, in order to export an a function as an rpc method, it
should suffice to define the function. perhaps not literally with
<code>defun</code>, for reasons which become apparent later, but at least with
a single form, such as<br />
<code>(defLocalMethod |validator.countTheEntities| ((datum string))
  ;; ...
  )
</code><br />
and likewise to invoke the method as directly as<br />
<code>(|validator.countTheEntities| "<<<?'?>>>")
</code><br /></p>

<hr />
<h2>concrete requirements</h2>
<p>
if one considers that an expression for an xml-rpc method call  is nothing more
that a structured designator for the function and its arguments, while the
response has the analogous relation to the result value, one would think that,
given lisp's introspective capabilities, the goal should be easy to achieve. one
must accomplish just the following
<ul>
<li>implement a one-to-one relation between lisp function designators and the
string value of the <code>methodName</code> element in the request message.</li>
<li>implement a many-to-one relation between lisp data types and the type
designators encoded in the <code>value</code> and <code>fault</code> elements in
request.</li>
<li>implement a one-to-one relation between type designators and lisp data types
for returned data.</li>
<li>provide a mechanism to solicit and decode the request message stream into a
function designator and an argument list</li>
<li>provide a means to apply the function, and to collect the result.</li>
<li>provide a means to encode the result as a response message and furnish it to
the client.</li>
<li>provide a means to define the client and server aspects of the methods, at
least for convenience</li>
</ul>
it's really not much.</p>

<hr />
<h2>interpreting function designators</h2>
<p>
xml-rpc encodes the function designator as a string. this is evidently a
<em>name</em>, implicitly a <em>universal name</em>, and should be suitable for
translation into a function designator. lisp provides mechanisms, in the form of
<code>intern</code> to for map from strings to symbols, and
<code>fdefinition</code>, to interpret a symbol as a function designator. it
remains only to determine which package to use as the second argument to
<code>/intern</code>. that is, without adding anything to the request message.
there are several options.
<dl>
<dt>use qualified names</dt>
<dd>define a relation between expanded names and symbols by identifying package
names and/or nicknames with namespace names.</dd>
<dt>use the request url</dt>
<dd>in a similar fashion, traet the request iri as a namespace name. perhaps as
the default namespace.</dd>
</dl>
actually, there is no reason not to use both.</p>

(defun intern-function (namestring)
  (let* ((name (make-uname namestring)))
    (multiple-value-bind (function-name visibility)
                         (find-symbol (local-part name) (namespace-name name))
      (if (and function-name
               (eq visibility :external)
               (find (symbol-package function-name) *exported-packages*))
        (values (symbol-function function-name) function-name)
        (error 'undefined-function :name (intern-name name ""))))))

<hr />
<h2>interpreting and and encoding data values and type designators</h2>
<p>
request and response messages contain encoded data values. a request contains a
sequence of them, a response contains one, either as a result or as a fault
structure. the type designators which are either present explicitly as wrappers
for a value string, or implicit, in the case of literal string values, stand in
a relation to lisp types similar to that of <code>methodName</code> values to
function designators. the difference is that the specified designators have no
literal counterparts in lisp, and there would be no advantage to allowing for
that. a single decoding function together with an association list suffices.</p>

(defParameter *xml-rpc-to-lisp-type-alist*
  '(("i4" . integer) ("int" . integer) ("double" . double) ("string" . string)
    ("dateTime.iso8601" . universal-time) ("base64" . base64) ("struct" . cons)
    ("array" . vector))
  "defines the mapping from xml-rpc type names to lisp type designators")

(defun xml-rpc-decode-value (argument-expression)
  (destructure-element ((gi) encoded-value) argument-expression
    (validate-gi gi '{}value)
    (if (stringp encoded-value)
      encoded-value
      (destructure-element ((type-name) &rest content) encoded-value
        (xml-rpc-decode-value-string
         (or (rest (assoc type-name *xml-rpc-to-lisp-type-alist*
                          :test #'string=))
             (error "not an xml-rpc data type: ~s." type-name))
         content)))))


(defun string-trim-whitespace (s)
  (string-trim #(#\space #\tab #\return #\linefeed) x))

(defGeneric xml-rpc-decode-value-string (type-name content)
  (:method ((type-name (eql 'integer)) content)
           (parse-integer (string-trim-whitespace (first content))))
  (:method ((type-name (eql 'double)) content)
           (parse-double (string-trim-whitespace (first content))))
  (:method ((type-name (eql 'string)) content)  (first content))
  (:method ((type-name (eql 'universal-time)) content)
           (|yyyyMMddTHH:mm:ss| (first content)))
  (:method ((type-name (eql 'base64)) content) (parse-base64 (first content)))
  (:method ((type-name (eql 'cons)) content)
           (mapcar #'(lambda (child)
                       (destructure-element ((gi) name value) child
                         (validate-gi gi '{}member)
                         (unless (and name value)
                           (xml-error |VC: Element Valid| :name gi))
                         (validate-gi (name name) '{}name)
                         (validate-gi (name value) '{}value)
                         (cons (make-uname (first (children name)))
                               (xml-rpc-decode-value value))))
                     content))
  (:method ((type-name (eql 'vector)) content)
           (destructure-element ((gi) &rest values) (first content)
             (validate-gi gi '{}data)
             (apply #'vector (mapcar #'xml-rpc-decode-value values)))))

<hr />
<h2>receiving and decoding requests</h2>
<p>
in order to receive a request, there must be a process which serves http and
provides the xml-rpc server the request header properties and either the content
string or a readable content stream. there are several native lisp http servers.
any one would do. as this discussion requires rudimentary http support only, for
illustration purposes, it presumes a single-function <a href="http.html">http
server</a>.<br />
<code>(defun serve-http (&key port handlers) )
</code>
which is invoked with a port designator and an alist of <code>(uri . function)</code> pairs.</p>

(defun serve-xml-rpc ()
  (serve-http :port "8080"
              :handlers `(("/RPC2" . ,#'(lambda (uri stream)
                                          (serve-method-call uri
                                                             stream
                                                             stream))))))

<p>
in order to decode a request, one needs to parse the message content, identify
the significant components, extract them and map them into their lisp
equivalents.</p>

<p>identifying and extracting the significant components is a straight-forward
process of destructuring. in a strict sense, as xml encode nothing more than
dominance and sequence, a representation in terms of lists of atomic values is
all that would be required, and <code>car</code> and <code>cdr</code> would
suffice for access. on the other hand, it is sometimes worthwhile to abstract
the implementation from the immediate representation. it would be possible, for
example, to describe the access in terms of abstract paths, but that would
require one to implement those as well, so we take the alternative path of
performing simple abstract destructuring</p>

<p>for the purposes of xml-rpc a simple macro, <code>destructure-element</code>,
allows one to specify bindings for the generic identifier, attributes, and
content components in simple terms.<br />
<pre><code><b>destructure-element</b> &op;&op;<i>gi</i>&cp; { [<b>&amp;rest</b> <i>attributes</i>] | <i>attribute</i>* }&cp;
  { [<b>&amp;rest</b> <i>children</i>] | <i>child</i> } &cp;
   <b>&amp;rest</b> <i>body</i></code></pre>
 </p>

(defun perform-method-call (expression)
  (destructure-element ((gi) method-name-element arguments-element) expression
    (destructure-element ((gi) method-namestring) method-name-element
      (destructure-element ((gi) &rest argument-elements) arguments-element
        (apply (intern-function method-namestring)
               (mapcar #'(lambda (param)
                           (xml-rpc-decode-value (first (children param))))
                       argument-elements))))))

<p>
it is also possible to add simple guard functions, such as</p>

(defun validate-gi (name constraint &optional (errorp t))
  (or (eq name constraint)
      (when errorp (xml-error |VC: Element Valid| :name name))))

<p>
to check the document form, in those situations where the parser does not do
so.</p> 

(defun perform-method-call (expression)
  (destructure-element ((gi) method-name-element arguments-element) expression
    (validate-gi gi '{}methodCall)
    (destructure-element ((gi) method-namestring) method-name-element
      (validate-gi gi '{}methodName)
      (destructure-element ((gi) &rest argument-elements) arguments-element
        (validate-gi gi '{}params)
        (apply (intern-function method-namestring)
               (mapcar #'(lambda (param)
                           (xml-rpc-decode-value (first (children param))))
                       argument-elements))))))

<p>
where <code>xml-rpc-decode-value</code> proceeds as above.
</p>

<hr />
<h2>computing a result</h2>
<p>lisp provides tools to examine the request, determine whether it designates
an applicable function, and compute the function result. it even makes it easy
to control which functions are available to the server. all without additional
definitions.</p>

<p>the introspective facilities in lisp make it possible to determine whether a
symbol names a function, whether the symbol was intended to name an externally
accessible operation, and in some cases the function arity and signature. this
facilities must be present as information is used by the run-time to type-check
function applications. the lisp standard make them available for application use
as well. for the purposes of xml-rpc, they are most effective when the rpc
server methods are defined as generic function methods. where this is done, and
where one follows the convention, that a given server mediates access to
functions exported from a given package, a simple function application is the
only thing required to compute a result, and discovery can be implemented as a
direct encoding of introspection results.</p>


(defun perform-method-call (expression)
  (destructure-element ((gi) method-name-element arguments-element) expression
    (validate-gi gi '{}methodCall)
    (destructure-element ((gi) method-namestring) method-name-element
      (validate-gi gi '{}methodName)
      (destructure-element ((gi) &rest argument-elements) arguments-element
        (validate-gi gi '{}params)
        (apply (intern-function method-namestring)
               (mapcar #'(lambda (param)
                           (xml-rpc-decode-value (first (children param))))
                       argument-elements))))))

<hr />
<h2>encoding and sending responses</h2>
<p></p>

(defGeneric xml-rpc-encode-value (node)
  (:method ((node integer)) (xml* {}int (encode-node node)))
  (:method ((node string)) (encode-node node))
  (:method ((node float))
           (xml* {}double (encode-string (write-to-string node))))
  (:method ((node sequence))
           (if (equal (array-element-type node) '(unsigned-byte 8))
             (xml* {}base64 (encode-base64 node))
             (xml* {}array (xml* {}data
                                 (map nil #'(lambda (v)
                                              (xml* {}value
                                                    (xml-rpc-encode-value v)))
                                      node)))))
  (:method ((node (eql t))) (xml* {}boolean "1"))
  (:method ((node null)) (xml* {}boolean "0"))
  (:method ((node cons))
           (xml* {}struct
                 (dolist (member node)
                   (destructuring-bind (name . value) member
                     (xml* {}member
                           (xml* {}name (encode-node name))
                           (xml* {}value (xml-rpc-encode-value value))))))))

<a name='Interfaces'><hr /></a>
<h2>defining interfaces</h2>
<p>there are three essential interface functions:
<ul>
 <li>one to implement the server side of the protocol process,</li>
 <li>one to implement the client side,</li>
 <li>one to define server function interfaces on the client,</li> and finally,
 <li>one to define server function implementations on the server</li>
 </ul></p>

<p>the first function is expressed in terms of two parameters, an input source
and an output destination.
where the source and destination are streams, one specialization implements the
method call component of the xml-rpc protocol by accepting the request from the
input source, parsing, and decoding the request, performing the designated
operation, encoding the result, and returning it to the client.</p>
<p>
note that the server function accepts both a package for interning </p>

(defun serve-method-call (uri input-source output-destination
                          &key ((:xml-rpc-package *xml-rpc-package*)
                                (or (find-package uri)
                                    (error "package not found: ~s." uri)))
                               (namespace-bindings
                                `(("" . ,*xml-rpc-package*))))
  (handler-case
    (let* ((document (document-parser input-source :ignore-whitespace t))
           (result nil))
          (handler-bind ((error (lambda (c) (break "error: ~a" c))))
            (let ((*namespace-bindings* namespace-bindings))
              (setf result (perform-method-call (root document)))))
      (with-xml-writer (output-destination)
        (xml* {}methodResponse
              (xml* {}params
                    (xml* {}param
                          (xml* {}value
                                (xml-rpc-encode-value result)))))))
    (error (condition)
           (with-xml-writer (output-destination)
             (xml <methodResponse>
                  <fault><value>
                  (xml-rpc-encode-value
                   `(({}faultCode . ,(get-universal-time))
                     ({}faultString . ,(format nil "~a" condition))))
                  </value></fault></methodResponse> )))))

<p>
the server method definition is s simple defmethod form</p>

(defMethod |system.listMethods| ()
  (let ((names (make-array 32 :adjustable t :fill-pointer 0)))
    (with-package-iterator (get-next *xml-rpc-package* :external)
      (loop (multiple-value-bind (next-p symbol) (get-next)
              (if next-p
                (vector-push-extend symbol names)
                (return)))))
    (sort names #'string-lessp)))

(defMethod |system.methodSignature| ((name string))
  (let ((function (intern-function name)))
    (if (typep function 'generic-function)
      (let* ((method (first (generic-function-methods function)))
             (specializers (method-specializers method)))
        (map 'vector #'compute-xml-rpc-type specializers))
      (error 'undefined-function :name (intern-name name "")))))

(defun call-served-method (uri method-name &rest arguments)
  (let* ((request-content
          (with-output-to-string (content-stream)
            (with-xml-writer (content-stream)
              (xml <methodCall>
                    <methodName>(encode-string method-name)</methodName>
                    <params>(dolist (argument arguments)
                              (xml <param><value>(xml-rpc-encode-value argument)
                                    </value></param>))
                     </params></methodCall>))))
         (request-length (length request-content)))
    (with-http-stream (http-stream uri
                                   :method :post
                                   :content-length request-length
                                   :content-type '(:text :xml)
                                   :content
                                   (lambda (destination)
                                     (map nil #'(lambda (char)
                                                  (write-byte (char-code char)
                                                              destination)) 
                                          request-content)))
      (let ((buffer (make-array 1024 :fill-pointer 0
                                :adjustable t
                                :element-type 'character))
            (byte 0))
        (loop (unless (setf byte (read-byte http-stream nil nil)) (return))
              (vector-push-extend (code-char byte) buffer))
        (let* ((result (document-parser buffer :ignore-whitespace t)))
          (destructure-element ((gi) response-parameters) (root result)
            (validate-gi gi '{}methodResponse)
            (destructure-element ((gi) response-value) response-parameters
              (cond ((eq gi '{}params)        ; success
                     (xml-rpc-decode-value (first (children response-value))))
                    ((eq gi '{}fault)
                     (let ((error-values (xml-rpc-decode-value response-value)))
                       (error "server-fault: ~s: ~a"
                              (rest (assoc '{}faultCode
                                           error-values))
                              (rest (assoc '{}faultString
                                           error-values)))))))))))))

(defMacro defRPC (name parameters)
  (let* ((path-object-fragment (symbol-name name))
         (hash (or (position #\# path-object-fragment :from-end t)
                   (error "invalid rpc designator: ~s." name)))
         (protocol-and-authority (package-name (symbol-package name)))
         (path-and-object (subseq path-object-fragment 0 hash))
         (fragment (subseq path-object-fragment (1+ hash))))
    `(defun ,name ,parameters
       (call-served-method ,(format nil "~a/~@[~a~]"
                                    protocol-and-authority path-and-object)
                           ,fragment ,@parameters))))


<hr />
<h2>miscellaneous encoding and decoding functions</h2>
<p>double parsing is accomplished with a function which is based on a
<a href="http://www.cliki.net/Meta">lisp implementation</a> of the
<a href="http://home.pipeline.com/~hbaker1/Prag-Parse.html">meta parser</a></p>

(defun parse-double (string
                     &aux (s +1) (es +1) (i 0) (f 0) (e 0) (m #\e)
                          (f-count 0) (i-count 0) (e-count 0) (v 0) d)
  (flet ((ctoi (d) (- (char-code d) (char-code #\0))))
    (with-string-meta (string)
      (and
       (match
        "[{#\\+ [#\\- !(setq s -1)] []}
          $[@(\"0123456789\" d) !(setf i (+ (* i 10) (ctoi d))
                                       i-count (1+  i-count))]
          {#\\. []}
          $[@(\"0123456789\" d) !(setf f (+ (* f 10) (ctoi d))
                                       f-count (1+ f-count))]
          {@(\"eEsSdDfFlL\" m) []}
          {#\\+ [#\\- !(setq es -1)] []}
          $[@(\"0123456789\" d) !(setf e (+ (* e 10) (ctoi d))
                                       e-count (1+ e-count))]
          ]")
       (when (> (+ f-count i-count) 0)
         (when (> f-count 0) (setf f (/ f (expt 10 f-count))))
         (setf v (+ i f))
         (when e-count (setf v (* v (expt 10 (* es e)))))
         (when (< s 0) (setf v (- v)))
         (case m ((#\E #\e) (float v 0.0e0))
               ((#\S #\s) (float v 0.0s0))
               ((#\D #\d) (float v 0.0d0))
               ((#\F #\f) (float v 0.0s0))
               ((#\L #\l) (float v 0.0s0))))))))

(defun parse-base64 (string)
  (declare (ignore string))
  (error "not implemented"))

(defun encode-base64 (value)
  (declare (ignore value))
  (error "not implemented"))

(defGeneric compute-xml-rpc-type (node)
  (:method ((node integer)) "int")
  (:method ((node string)) "string")
  (:method ((node float)) "double")
  (:method ((node sequence))
           (if (equal (array-element-type node) '(unsigned-byte 8))
             "base64"
             "array"))
  (:method ((node (eql t))) "boolean")
  (:method ((node null)) "boolean")
  (:method ((node cons)) "struct"))



<a name='Examples'><hr /></a>
<h2>examples</h2>
<p>a simple invocation can provide the server, method, and arguments explicitly:
<pre><code>
(call-served-method "http://time.xmlrpc.com/RPC2" "currentTime.getCurrentTime")
</code></pre>
while a frequently used operation might be better supported by defining a
function.
for this alternative, first define a package to own the function names:
<pre><code>
(defpackage "http://www.oreillynet.com"
  (:use )
  (:export "meerkat/xml-rpc/server.php#system.methodSignature"))
</code></pre>
then define the proxy function. each method is defined by combining a fragment
identifier with the absolute uri for the xml-rpc service at the remove host.
<pre><code>
(defRPC |http://www.oreillynet.com|:|meerkat/xml-rpc/server.php#system.methodSignature| (method-name))

(|http://www.oreillynet.com|:|meerkat/xml-rpc/server.php#system.methodSignature|
                            "meerkat.getCategories")
</code></pre>
</p>


:EOF
