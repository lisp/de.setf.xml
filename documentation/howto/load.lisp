;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: web-user; -*-
;;;
;;; how to load cl-xml

(in-package :web-user)


<h2>CL-XML: How To: Loading the XML Tools</h2>
<p>20031024  <br/>
<a href="mailto:James.Anderson@setf.de">james anderson</a></p>
<hr/>
<br/>

<table border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
   <td align="center">
    [<a href="#Loading">loading</a>]
    [<a href="./parse.html">parsing</a>]
    [<a href="./functional-accessors.html">accessor functions</a>]
    [<a href="./path-accessors.html">paths</a>]
    [<a href="./combined-methods.html">combinations</a>]
    [<a href="./transformations.html">rtansformations</a>]
    <a name="TOP"></a></td></tr>
  </table>
<a name='Loading'><hr /></a>
<h2>loading the libraries</h2>

<p>
in order to load the cl-xml libraries, one must do three things:
<ul><li>ensure that a system definition utility is present, then</li>
 <li>use it to load the system definition and</li>
 <li>to load the desired system components</li>
 </ul>

this example loads a configuration for use without an external http library, and intends to model names with symbols. see the files "xml;load*.lisp" for other configurations.

as the first step, load a definition utility, in this case, the <code>define-system</code> utility. it derives from the definition tool for cl-http, but is extended to support dependancies. the cl-xml release also includes macros which rewrite the definition forms to asdf and mk:defsystem syntax. note that these forms specify the pathnames relative to this particular file.</p>

(load (merge-pathnames (make-pathname :name "define-system" :directory '(:relative :up :up "library"))
                       *load-pathname*))

<p>
next, tell it where to find the system description.</p>

(register-system-definition :xpath
                            (merge-pathnames (make-pathname :name "sysdcl"
                                                            :directory '(:relative :up :up))
                                             *load-pathname*))

<p>
next, indicate which features one wishes the library to support. in this case specify to use symbols for xml names</p>

(pushnew :xml-symbols *features*)
(setf *features* (remove :nameset-tokenizer *features*))

<p>
finally invoke the build process to compile and load the xpath library. since the system description declares it to depend on the document models and the parser, those modules are compiled and loaded as well</p>

(execute-system-operations :xpath '(:compile :load))


<p>
next, define a package for the howto  code itself. this is a "user" package, which means that it is defined separate from the library packages and inherits from the library interface packages and/or imports specific symbols.</p>

(defpackage :web-user
  (:use :common-lisp #+ccl :ccl
        :xqdm :xmlp)
  #+ccl (:shadowing-import-from :xqdm :target)
  (:import-from :xqdm :./* :.//* :./)
  (:import-from :xmlp :parse-document)
  (:import-from :xml-path :xpath-parser :map-nodes))

<p>
finally, as a check, print a list of features</p>

(format *trace-output* "~%cl xml loaded:~%~s" *features*)

:eof


