;;
;; how to collect of specific document components

(in-package :web-user)

<h2>CL-XML: How To: Access Document Components</h2>
<p>20040209  <br/>
<a href="mailto:James.Anderson@setf.de">james anderson</a> (c)2004, </p>
<hr/>
<br/>

<table border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
   <td align="center">
    [<a href="./load.html">loading</a>]
    [<a href="./parse.html">parsing</a>]
    [<a href="#Accessors">accessor functions</a>]
    [<a href="./path-accessors.html">paths</a>]
    [<a href="./combined-methods.html">combinations</a>]
    [<a href="./transformations">transformations</a>]
    <a name="TOP"></a></td></tr>
  </table>

<a name='Accessors'><hr /></a>
<h2>functional accessors</h2>
(defVar *dm* )
<p>
here is how to use cl-xml to get at components in documents. to begin one needs a document</p>

(setq *dm* (parse-document #p"xml:documentation;howto;howto.xml"))

<p>
once the document is parsed, one can use standard common-lisp operators as well as the document component access functions to extract components. for example, in order to print all attributes with the identifier "name" in the element children of the document's root element, one combines standard operators to iterate over the child list, select the element children and ignore the character data, and find the attributes named "name".</p>

(dolist (child (children (root *dm*)))
  (typecase child
    (elem-node (print (find '{}name (attributes child) :key #'name)))))

<p>
in order to print the attribute value, rather than the node itself, the <code>value</code> operator extracts the value from the attribute nodes.</p>

(dolist (element (children (root *dm*)))
  (typecase element
    (elem-node (print (value (find '{}name (attributes element) :key #'name))))))


<p>
cl-xml defines several kinds of functions which facilitate this kind of access to document components.
the simplest are utility functions which combine traversal, type restrictions, and matching. these include the operators
<ul>
 <li><code>./</code>returns the first element child with a matching name</li>
 <li><code>./*</code> collects all element children with a matching name</li>
 <li><code>.//*</code> collects all element descendants with a matching name</li>
 </ul>
for example, since the root element of the <i>howto</i> document is named <code>{}inventory</code>,</p>

(name (./ *dm* '{}|inventory|))
<div>
== <code>||::|inventory|</code> <br />
the top-level children can be enumerated by selecting with a wild-card name, as in</div>

(mapcar #'name (./* (./ *dm* '{}|inventory|) '{}|*|))
<div>
== <code>(||::|section| ||::|section|)</code>,</div>
<p>
and all of the elements in the document are collected by  </p>

(mapcar #'name (.//* *dm* '{}|*|))
<div>
== <code>(||::|inventory| ||::|section| ||::|item| ||::|name| ||::|price| ||::|description| ||::|item| ||::|name| ||::|price| ||::|description| ||::|section| ||::|item| ||::|name| ||::|price| ||::|description| ||::|item| ||::|name| ||::|price| ||::|description|)</code><br />
if one needed a list of all of the name or upc attribute values in the document, one could combine a selection filter with the the navigation operation</div>

(remove "" (mapcar #'(lambda (e) (./@-string e '{}name)) (.//* *dm* '{}|*|)) :test #'equal)
<div>
== <code>("health" "food")</code></div>

(remove "" (mapcar #'(lambda (e) (./@-string e '{}upc)) (.//* *dm* '{}|*|)) :test #'equal)
<div>
== <code>("123456789" "445322344" "485672034" "132957764")</code>
</div>

<p>
for more complex selection and combination operations, one can use binding macros, like <a href="./destructure.lisp"><code>destructure-element</code></a> to designate components by name, position or relation and bind them to variables. this approach can be used to implement simple filters, for example, to transform the original <i>howto</i> document into
a simple account of the items in each section,</p>

(pprint
 (destructure-element ((root-gi (({}title title))) &rest root-children)
                      (root *dm*)
   `((,root-gi ({}title . ,(value title)))
     ,@(mapcar #'(lambda (section)
                   (destructure-element ((section-gi (({}name name))) &rest section-children)
                                        section
                     `((,section-gi ({}name . ,(value name)))
                       ,@(mapcar #'(lambda (item)
                                     (destructure-element ((gi (({}upc upc)))) item
                                       `(,gi ,(value upc))))
                                 (remove-if #'stringp  section-children)))))
               (remove-if #'stringp root-children)))))

<div><pre>
== <code>((||::|inventory| (||::|title| . "OmniCorp Store #45x10^3"))
     ((||::|section| (||::|name| . "health")) (||::|item| "123456789") (||::|item| "445322344"))
      ((||::|section| (||::|name| . "food")) (||::|item| "485672034") (||::|item| "132957764")))</code></pre></div>



:eof
