;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  iterative form model navigation operators for the xml query data model
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20020630' AUTHOR='JAA'>
   factored out from xqdm-operators as separate file</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :xml-query-data-model)

;;
;; accessors based on seraching/walking

(defGeneric element-property (element name)
  (:method ((context t) (datum t)) nil)
  (:method ((context t) (predicate function))
           (walk-attributes context
                            #'(lambda (node) (when (funcall predicate node) (return-from element-property node)))))
  (:method ((context t) (name string))
           (element-property context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name uname))
           (element-property context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name symbol))
           (element-property context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (index integer))
           (element-property context #'(lambda (child)
                           (cond ((zerop (decf index)) (return-from element-property child))
                                 ((minusp index) (return-from element-property nil))))))
  (:method ((context null) (name t)) nil))

(defGeneric element-properties (context name)
  (:method ((context t) (datum t)) nil)
  (:method ((context t) (predicate function) &aux (results nil))
           (walk-attributes context
                            #'(lambda (node) (when (funcall predicate node) (push node results))))
           (nreverse results))
  (:method ((context t) (name string))
           (element-properties context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name uname))
           (element-properties context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name symbol))
           (element-properties context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context null) (name t)) nil))

(defun element-property-value (element name &aux property)
  (when (setf property (element-property element name))
    (value property)))


(defun element-property-string (element name &aux node)
  "return the <code>value-string</code> of the named property, or <code>NIL</code> if no such
   child is present."
  (when (setf node (element-property element name))
    (value-string node)))


(defGeneric element-child (element name)
  (:method ((context t) (datum t)) nil)
  (:method ((context t) (predicate function))
           (walk-children context #'(lambda (node)
                                     (when (funcall predicate node)
                                       (return-from element-child node)))))
  (:method ((context t) (name string))
           (element-child context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name uname))
           (element-child context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name symbol))
           (element-child context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (index integer))
           (element-child context #'(lambda (child)
                           (cond ((and (element-p child) (zerop (decf index)))
                                  (return-from element-child child))
                                 ((minusp index)
                                  (return-from element-child nil))))))
  (:method ((context null) (name t)) nil))

(defGeneric element-children (context name)
  (:method ((context t) (datum t)) nil)
  (:method ((context t) (predicate function) &aux (results nil))
           (walk-children context #'(lambda (node)
                                     (when (funcall predicate node)
                                       (push node results))))
           (nreverse results))
  (:method ((context t) (name string))
           (element-children context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name uname))
           (element-children context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name symbol))
           (element-children context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context null) (name t)) nil))


(defGeneric element-descendant (element name)
  (:method ((context t) (datum t)) nil)
  (:method ((context t) (predicate function))
           (walk-descendants context #'(lambda (node)
                                         (when (and (element-p node) (funcall predicate node))
                                           (return-from element-descendant node)))))
  (:method ((context t) (name string))
           (element-descendant context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name uname))
           (element-descendant context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name symbol))
           (element-descendant context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (index integer))
           (element-descendant context #'(lambda (child)
                                           (cond ((and (element-p child) (zerop (decf index)))
                                                  (return-from element-descendant child))
                                                 ((minusp index)
                                                  (return-from element-descendant nil))))))
  (:method ((context null) (name t)) nil))

(defGeneric element-descendants (element name)
  (:method ((context t) (name t))
           nil)
  (:method ((context t) (predicate function) &aux results)
           (walk-descendants context #'(lambda (node)
                                     (when (and (element-p node) (funcall predicate node))
                                       (push node results))))
           (nreverse results))
  (:method ((context t) (name string))
           (element-descendants context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name uname))
           (element-descendants context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context t) (name symbol))
           (element-descendants context #'(lambda (element) (xsd:validate-name element name))))
  (:method ((context null) (name t)) nil))




(defGeneric annotation (context name)
  (:method ((context t) (name t)) nil))

(defGeneric annotation-value (context name)
  (:method ((context t) (name t)) nil)
  (:method ((node abstract-elem-node) (name t) &aux annotation)
           (when (setf annotation (annotation-attribute node name))
             (value annotation))))
  

(defGeneric child (context name)
  (:method ((context t) (name t)) nil))

(defGeneric child-value (context name)
  (:method ((context t) (name t)) nil))

(defGeneric anotation-attribute (context name)
  (:method ((context t) (name t)) nil))

(defMethod annotation-attribute ((context abstract-elem-node) (name t))
  (or (dolist (node (attributes context))
        (when (xsd:validate-name (name node) name) (return node)))
      (dolist (node (namespaces context))
        (when (xsd:validate-name (name node) name) (return node)))))

(defMethod child ((context abstract-elem-node) (name t))
  (dolist (node (children context))
    (when (xsd:validate-name (name node) name) (return node))))
(defMethod child ((context abstract-elem-node) (index number))
  (dolist (node (children context))
    (typecase node
      (abstract-elem-node (when (zerop (decf index)) (return node)))
      (t))))
(defMethod child ((context doc-node-interface) (name t))
  (dolist (node (children context))
    (when (xsd:validate-name (name node) name) (return node))))

(defgeneric successor (node)
  (:method ((node abstract-elem-node))
    (first (rest (member node (children (parent node))))))
  (:method ((node abstract-attr-node))
    (first (rest (member node (children (parent node)))))))

(defgeneric successor-element (node)
  (:method ((node abstract-elem-node))
    (find-if #'element-p (rest (member node (children (parent node)))))))

(defun ./* (element name) (element-children element name))
(defun .// (element name) (element-descendant element name))
(defun .//-string (element name) (value-string (element-descendant element name)))
(defun .//* (element name) (element-descendants element name))
(defun ./@ (context name) (annotation-attribute context name))
(defun ./@-string (context name) (value-string (annotation-attribute context name)))
(defun ./@-value (context name) (annotation-value context name))
(defun ./ (element name) (child element name))
(defun ./-string (element name) (value-string (child element name)))
(defun ./-value (element name) (child-value element name))
(defun |..| (node) (parent node))

(defun elem-get-child (element name) (element-child element name))
(defun elem-get-children (element name) (element-children element name))

(defun |.//@|-string-equal (context name value &optional content)
  "return the atribute node whichmatches the given name and value"
  (labels ((test-attribute (attribute)
             (when (and (xsd:validate-name (name attribute) name)
                        (equal (value-string attribute) value))
               (if content
                 (when (equal content
                              (trim-string-whitespace
                               (value-string (parent attribute))))
                   (return-from |.//@|-string-equal attribute))
                 (return-from |.//@|-string-equal attribute))))
           (test-element (elem)
             (walk-attributes elem #'test-attribute)))
    (declare (dynamic-extent #'test-attribute #'test-element))
    (walk-descendants context #'test-element)))

:EOF
