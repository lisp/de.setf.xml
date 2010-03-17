;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  'class' definitions for interpreted XPATH expressions.
  paths are modeled with s-expressions rather than instances.
  this for several reasons:
  <ul>
  <li>they are then more easily incorporated in lisp source without
    the need for reader macros;</li>
  <li>the s-expression representation is readily manipulated;</li>
  <li>no demand for specialization is forseen. an earlier version with instances
    demonstrated that there was little need for initialization - the literal
    path content was sufficient;</li>
  <li>the primary operation is compilation into access functions, so there's
    litte reason to reatain an instantial model.</li>
  </ul>
  this file comprises constructors.
  they exist primarily to control property names.
  the representation is as tagged property lists, which means access can be
  performed with getf or destructuring-bind.
  there's no reason for mutators.</p>
  <p>
  the constructors have the same name as the component and produce a tagged
  property list keywed with the respective token. the effect is that the
  expressions are self-evaluating fixed-points.
  in each case, the default tag is a respective symbol in the package
  "XML-PATH-ALGEBRA". these symbols are bound statically, which means that
  they may be rebound to change the keywords.
  in that event, should the fixed nature be desired, additional respective
  constructors are appropriate</p>
  <p>
  the interpretation/compilation methods are specialized on keyword identity,
  and may be respectively augmented with additional methods for new keywords.
  'inheritance' exists strictly in the method-invocation dependancies.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <DELTA DATE='20010609'>
  fixed type in self-evaluation functions foraxis generators</DELTA>
 </DOCUMENTATION>
|#
(in-package "XML-PATH")

(defParameter xpa:path 'xpa:path
  "a path instance models a location path expression for interpretation
   against a document context.")
(defun xpa:path (&rest steps)
  (list* xpa:path steps))

(defmacro defStepElement (name &optional documentation)
  `(progn
     (defParameter ,name ',name ,@(when documentation (list documentation)))
     (defun ,name (&optional generator test &rest predicates)
       (list* ,name generator test predicates))))

(defStepElement xpa:step 
  "a step instance models an individual step within a path, comprising
    the axis generator the initial node test and the filter predicates.")


;; shorthand forms for steps which require no parameters

(defStepElement xpa:parent-step)
(defStepElement xpa:root-step)
(defStepElement xpa:self-step)
(defStepElement xpa:wild-inferior-step)

;;
;; generators
;; one step generator is defined for each of the axes
;; the class is bound directly to the respective axis name

(defmacro defPathElement (name keywords &optional documentation)
  `(progn
     (defParameter ,name ',name ,@(when documentation (list documentation)))
     (defun ,name (&key ,@keywords)
       (list ,name ,@(apply #'append
                            (mapcar #'(lambda (property)
                                        (when (listp property)
                                          (setf property (first property)))
                                        (when (listp property)
                                          (setf property (second property)))
                                        (list (intern (symbol-name property)
                                                      "KEYWORD")
                                              property))
                                    keywords))))))

(defPathElement xpa:list-generator (elements))

(defMacro defAxisGenerator (name keywords &optional documentation)
  `(progn
     (defParameter ,name ',name ,@(when documentation (list documentation)))
     (defun ,name (&key ,@keywords)
       (list ',name ,@(apply #'append
                             (mapcar #'(lambda (property)
                                         (when (listp property)
                                           (setf property (first property)))
                                         (when (listp property)
                                           (setf property (second property)))
                                         (list (intern (symbol-name property)
                                                       "KEYWORD")
                                               property))
                                     keywords))))))

(defAxisGenerator xpa:ancestor ())
(defAxisGenerator xpa:ancestor-or-self ())
(defAxisGenerator xpa:attribute ())
(defAxisGenerator xpa:child ())
(defAxisGenerator xpa:descendant ())
(defAxisGenerator xpa:descendant-or-self ())
(defAxisGenerator xpa:following ())
(defAxisGenerator xpa:following-sibling ())
(defAxisGenerator xpa:namespace ())
(defAxisGenerator xpa:parent ())
(defAxisGenerator xpa:preceding ())
(defAxisGenerator xpa:preceding-sibling ())
(defAxisGenerator xpa:root ())
(defAxisGenerator xpa:self ())
;; wd-xsl1.1-20001212
(defAxisGenerator xpa:id (value))
(defAxisGenerator xpa:key (name))


;;
;; filters
;; both the initial node test and subsequent predicates are modeled as filters.
;; the predicates bind the expression for interpretation
;; the node tests have special instantiations.
;; name tests specify a universal name. no specilzation are used for wild
;;  names. the distinction is encoded in the name - via the wild package
;;  and/or wild symbol name
(defPathElement xpa:predicate (expression)
  "an predicate binds a single expression in parsed form
    for evaluation when the path is interpreted.")

(defPathElement xpa:type-test (type))
(defPathElement xpa:name-test (name))
(defPathElement xpa:@name-test (name))
(defPathElement xpa:type-name-test (type name))
(defPathElement xpa:pi-test (target data))
(defPathElement xpa:comment-test (literal))
(defPathElement xpa:text-test (literal))

;;
;;
;; miscellaneous components

(defPathElement xpa:uname (local-part namespace prefix))


:EOF