;;
;; how to collect the values of specific attributes

(in-package :web-user)


<h2>CL-XML: How To: Accessing Document Components: Compiling Path Accessors</h2>
<p>20031024  <br/>
<a href="mailto:James.Anderson@setf.de">james anderson</a> (c)2003</p>

<table border="1" cellpadding="0" cellspacing="0" width="100%">
  <tr>
   <td align="center">
    [<a href="./load.html">loading</a>]
    [<a href="./parse.html">parsing</a>]
    [<a href="./functional-accessors.html">accessor functions</a>]
    [<a href="#PathAccessors">paths</a>]
    [<a href="./combined-methods.html">combinations</a>]
    [<a href="./transformations.html">transformations</a>]
    <a name="TOP"></a></td></tr>
  </table>

<a name='PathAccessors'><hr /></a>
<h2>Path Accessors</h2>
(defVar *dm* )
<p>
in addition to the elementary access functions, it is possible to use the xpath module to translate xml path expressions into lisp functions which navigate a document instance graph and operate on matching nodes. this mechanism can be used, for example, to collect those nodes or to change their contents. since the xpath compiler is used in various contexts, its immediate results are a lambda expression. it defines a function which when applied to a target node to return a closure which is called repeatedly to generate the matching nodes. in order to use that, it must be imbedded in an application function and compiled. this is accomplished in two steps. first one defines a utility function to perform the compilation with whatever settings and debugging information might be appropriate</p>

(defun translate-xpath-accessor (string &key trace production pprint)
  (multiple-value-bind (result index complete)
                       (apply #'xpath-parser string
                              :trace trace
                              (when production
                                (list :start-name production)))
    (when pprint (pprint result))
    (cond (complete result)
          (t
           (warn "incomplete parse of xpath expression (@~s): ~s" index string)))))

<div>
then one defines macros to make it easy to define functions and other binding forms. note that the function <code>call-with-collector</code> accepts the function result of applying a path function to a target node, repeatedly invokes that function and collects the nodes. it can be used to implement a form which accepts a source node and returns a list of the matching nodes, or to implement a form which binds a set of variables to the designated nodes in specified sources.</div>

(defmacro ?> (string target)
  `(call-with-collector (,(translate-xpath-accessor string) , target)))

(defmacro ?>let (bindings &rest body)
  (flet ((compute-xpa (string)
           `((target) (call-with-collector (,(translate-xpath-accessor string) target)))))
    `(flet ,(mapcar #'(lambda (v&p) `(,(first v&p) ,@(compute-xpa (second v&p))))
                    bindings)
       ,@body)))

<div>
these forms combine the tasks of compiling and applying the path expression to amke it easy to use path expressions to manipulate documents. in oder to see what the do, simply expand a simple example, such as <code>(?> "//@upc" *dm*)</code>, expands to
<code><pre>
(XPA::CALL-WITH-COLLECTOR
 ((LAMBDA (XPA:*CONTEXT-NODE*)
    (XPA::APPLY-PATH
     (XPA:PATH (XPA:ROOT-STEP)
               (XPA:WILD-INFERIOR-STEP)
               (XPA:STEP (XPA:ATTRIBUTE)
                         (XPA:NAME-TEST :NAME (XPA:UNAME :LOCAL-PART "upc"))))
     XPA:*CONTEXT-NODE*))
  *DM*))</pre></code>
it would be used as follows:</div>

(mapcar #'(lambda (a) (cons (name a) (value a))) (?> "//@upc" *dm*))
<div>
== <code>((||::|upc| . "123456789") (||::|upc| . "445322344") (||::|upc| . "485672034") (||::|upc| . "132957764"))</code>
</div>
(defun get-upc-bindings (document)
  (?>let ((get-upcs "//@upc")
          (get-stock "@stock")
          (section-name "../@name"))
     (mapcar #'(lambda (upc &aux (item (parent upc)))
                 (list (value-string (section-name item))
                       (value upc)
                       (value-string (get-stock item))))
             (get-upcs document))))

(get-upc-bindings *dm*)
<div>
== <code>(("health" "123456789" "12") ("health" "445322344" "18")
          ("food" "485672034" "653") ("food" "132957764" "44"))</code></div>


:eof

