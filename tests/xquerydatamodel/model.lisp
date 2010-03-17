;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  demonstrates a simple model definition and its serialization.
  note the effect of undeclared namespaces: the requisite nodes are generated on-demand based
  on static namespaces
  </DESCRIPTION
 <CHRONOLOGY>
  <DELTA DATE='20010906'>names recoded for instance names v/s symbols</DELTA>
  <CHRONOLOGY>
 <DOCUMENTATION>
|#

;; 20030328 0.949

(in-package "XML-QUERY-DATA-MODEL")


;; now generate and serialize a simple model

(write-node (make-doc-node :root (make-elem-node :name '{}xml)) *trace-output*)

(with-namespaces (("data,ns1" (:intern "a1" "e1" "e2")))
  (let* ((attr-name (find-name "a1" "data,ns1"))
         (root-node (make-elem-node
                     :name (find-name "e1" "data,ns1")
                     :namespaces (list (make-ns-node :name '{xmlns}p1
                                                     :children (list "data,ns1")))
                     :attributes (list (make-string-attr-node :name attr-name
                                                              :children (list "attribute value")))
                     :children (list (make-elem-node
                                      :name (intern-name "e2" "data,ns1")
                                      :attributes (list (make-string-attr-node
                                                         :name (intern-name "x" "data,ns1")
                                                         :children (list "some data")))
                                      :children (list (make-elem-node
                                                       :name (intern-name "e3" "data,ns1"))))
                                     (make-comment-node
                                      :children '("a comment text"))
                                     (make-pi-node
                                      :target '{}aPiNode
                                      :children '("with some text")))))
         (doc-node (make-doc-node :root root-node))
         (*print-pretty* t))
    ;; write the original
    (format *trace-output* "~%~%initial document: ~a.~%" doc-node)
    (write-node doc-node *trace-output*)
    ;; modify it
    (setf (value (./@ root-node attr-name)) "modified value")
    ;; add an attribute
    (push (make-string-attr-node :name (intern-name "aNew" "data,ns1")
                                 :children (list "new attribute value"))
          (attributes root-node))
    (format *trace-output* "~%~%modified document: ~a.~%" doc-node)
    (write-node doc-node *trace-output*)))
  

:EOF
