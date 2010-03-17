;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  iterative form model navigation operators for the xml query data model
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20020723' AUTHOR='JAA'>factored out from path-relative behaviour</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :xml-query-data-model)

(defGeneric walk-ancestors (node function)
  (:documentation
   "iterate with a function over the parent closure of a node.
    child implements this in terms of parent.")
  (:method ((node t) (function t)))
  (:method ((node abstract-node) function) (walk-self-and-ancestors (parent node) function))
  (:method ((node document) (function t))))

(defGeneric walk-annotations (element function)
  (:documentation
   "iterate with a function first over the declarations and then the attributes of a node.
    an element implementes this in terms of walk-declarations and walk-attributes")
  (:method ((node t) (function t)))
  (:method ((node abstract-elem-node) function)
           (walk-declarations node function)
           (walk-attributes node function)))

(defGeneric walk-attributes (element function)
  (:documentation
   "iterate with a function over the attributes of a node.
    an element specialization must implement this function.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) (function t)) ))

(defGeneric walk-children (element function)
  (:documentation
   "iterate over the children of a document model node.
    an parent specialization must implement this function.")
  (:method ((node t) (function t)))
  (:method ((node abstract-elem-property-node) (function t))))

(defGeneric walk-children-reversed (element function)
  (:documentation
   "iterate in reverse document order with over the children of a document model node.
    an parent specialization must implement this function.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-elem-property-node) (function t)) ))

(defGeneric walk-descendants (element function)
  (:documentation
   "iterate with over the child closure of a node.
    parent implements this in terms of walk-children.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) function)
           (walk-children node #'(lambda (node)
                                   (walk-self node function)
                                   (walk-descendants node function))))
  (:method ((node abstract-elem-property-node) (function t)) ))

(defGeneric walk-descendants-reversed (element function)
  (:documentation
   "iterate over the child closure of a node in reverse document order.
    parent implements this in terms of generate-children-reversed.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) function)
           (walk-children-reversed node #'(lambda (node)
                                            (walk-descendants-reversed node function)
                                            (walk-self node function))))
  (:method ((node abstract-elem-property-node) (function t)) ))

(defGeneric walk-declarations (element function)
  (:documentation
   "iterate with a function over the attributes of a node.
    an element specialization must implement this function.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) (function t)) ))

(defGeneric walk-parent (node function)
  (:documentation
   "apply a function to the parent of a node.
    child implements this in terms of parent.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) function) (walk-self (parent node) function))
  (:method ((node document) (function t)) ))
           
(defgeneric walk-predecessor-siblings (node function)
  (:documentation
   "iterate with a function over the siblings which preceed a node.
    element implements this in terms of parent and walk-children-reversed.")
  (:method ((node t) (function t)) nil)
  (:method ((node abstract-elem-node) (function t) &aux (found nil))
           (walk-children-reversed (parent node)
                                   #'(lambda (sibling)
                                       (if found
                                         (walk-self sibling function)
                                         (when (eq sibling node) (setf found t))))))
  (:method ((node document) (function t)) )
  (:method ((node abstract-elem-property-node) (function t)) ))

(defgeneric walk-predecessors (node function)
  (:documentation
   "iterate over the siblings which preceed a node, the predecessors of the nodes ancestors,
    and the siblings' and predecessors' descendants.
    element implements this in terms of parent, walk-children-reversed, and
    walk-self-and-descendants-reversed.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-elem-node) (function t) &aux (found nil) (parent (parent node)))
           (when parent
             (walk-children-reversed node #'(lambda (p-sibling)
                                              (if found
                                                (walk-self-and-descendants-reversed p-sibling function)
                                                (when (eq p-sibling node) (setf found t)))))
             (walk-predecessors parent function)))
  (:method ((node abstract-elem-property-node) (function t)) ))

(defGeneric walk-root (element function)
  (:documentation
   "apply function to the respective document node.")
  (:method ((node t) (function t)))
  (:method ((node abstract-node) function) (walk-root (root node) function))
  (:method ((node document) function) (walk-self node function)))

(defGeneric walk-root-and-descendants (element function)
  (:documentation
   "apply function to the respective document node.")
  (:method ((node t) (function t)))
  (:method ((node abstract-node) function) (walk-root-and-descendants (root node) function))
  (:method ((node document) function) (walk-self-and-descendants node function)))

(defGeneric walk-self (element function)
  (:documentation
   "apply a given function to a node.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) function) (funcall function node))
  (:method ((node string) function) (funcall function node)))

(defGeneric walk-self-and-ancestors (node function)
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) function)
           (walk-self node function)
           (walk-self-and-ancestors (parent node) function))
  (:method ((node document) (function t)) ))

(defGeneric walk-self-and-children (element function)
  (:documentation
   "iterate with walk-self over a document model node and its children.")
  (:method ((node t) (function t)) )
  (:method ((node abstract-node) function)
           (walk-self node function)
           (walk-children node function))
  (:method ((node abstract-elem-property-node) function) (walk-self node function)))

(defGeneric walk-self-and-descendants (element function)
  (:documentation
   "iterate over the child closure of a node.")
  (:method ((node t) (function t)) (walk-self node function))
  (:method ((node abstract-node) function)
           (walk-self node function)
           (walk-descendants node function))
  (:method ((node abstract-elem-property-node) function) (walk-self node function)))

(defGeneric walk-self-and-descendants-reversed (element function)
  (:documentation
   "iterate with over the child closure of a node in reverse order.")
  (:method ((node t) (function t)) (walk-self node function))
  (:method ((node abstract-node) function)
           (walk-descendants-reversed node function)
           (walk-self node function))
  (:method ((node abstract-elem-property-node) function) (walk-self node function)))

(defgeneric walk-successor-siblings (node function)
  (:method ((node t) (function t)) nil)
  (:method ((node abstract-elem-node) function &aux (found nil))
           (walk-children (parent node) #'(lambda (sibling)
                                            (if found
                                              (walk-self sibling function)
                                              (when (eq sibling node) (setf found t))))))
  (:method ((node abstract-elem-property-node) (function t)) nil))

(defgeneric walk-successors (node function)
  (:method ((node t) (function t)) nil)
  (:method ((node abstract-node) function &aux (found nil) (parent (parent node)))
           (when parent
             (walk-children node #'(lambda (sibling)
                                     (if found
                                       (walk-self-and-descendants sibling function)
                                       (when (eq sibling node) (setf found t)))))
             (walk-successors parent function)))
  (:method ((node abstract-elem-property-node) (function t)) ))


:EOF
