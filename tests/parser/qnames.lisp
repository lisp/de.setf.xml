;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

;; tests for qname interpretation in context of xml-parsing

(in-package "XML-PARSER")

#|
<DOCUMENTATION>
 <DESCRIPTION>
  this demonstrates the effect of conflicting prefix bindings.
  the homographic relation among the "a:x" names within
  the same declaration path is distinguished in the second example based ont he
  presence of an explicit declaration in the scope of the doc element declaration,
  which causes the document to be invalid.
  </DESCRIPTION>
 </DOCUMENTATION>
|#

;; 20030324 0.9498

(defParameter *doc-qnames1*
  (concatenate 'string "<!DOCTYPE doc [
    <!ELEMENT doc (a:x)* >
    <!ATTLIST doc xmlns CDATA 'data:,ns-top'>
    <!ELEMENT a:x EMPTY>
    <!ATTLIST a:x
              xmlns:a CDATA 'data:,ns-a'
              a:qname "
               (if *permit-dtd-schema-extensions* "QNAME" "CDATA")
               " 'a:test'>
    ]>

   <doc xmlns='data:,ns-top'
        xmlns:a='data:,ns-a'>
     <x xmlns='data:,ns-a'></x>
     </doc>"))

(defParameter *doc-node-qnames*
  (document-parser *doc-qnames1* :validate t))

;; note that, in the serialization, the "a" prefix on the doc content changes, becuase the last time
;; {data:,ns-a}x is seen, it has a "" prefix, which conflicts on re-serialization with the
;; preceeding default prefix on doc itself...

(format *trace-output* "~%~%the qname test document:~%~a~%~%reserializes as~%" *doc-qnames1*)
(write-node *doc-node-qnames* *trace-output* :encoding :us-ascii)

(format *trace-output* "~%~%./{*}doc element:~%")
(write-node (./ *doc-node-qnames* '{*}doc) *trace-output* :encoding :us-ascii)

(format *trace-output* "~%~%.//{*}x element:~%")
(write-node (.// *doc-node-qnames* '{*}x) *trace-output* :encoding :us-ascii)

(format *trace-output* "~%~%(.//{*}x/@{*}qname) attribute:~%")
(describe (./@ (.// *doc-node-qnames* '{*}x) '{*}qname) *trace-output*)

(format *trace-output* "~%~%(.//{*}x/@{*}qname/text()) attribute:~%")
(print (./@-string (.// *doc-node-qnames* '{*}x) '{*}qname) *trace-output*)

(format *trace-output* "~%~%(.//{*}x/@{*}qname/value()) attribute:~%")
(describe (./@-value (.// *doc-node-qnames* '{*}x) '{*}qname) *trace-output*)

(let* ((*namespace-bindings* (cons (cons "a" "data:,ns-a") *namespace-bindings*))
       (*namespace-dictionary* (append (mapcar #'(lambda (ns) (cons (namespace-name ns) ns))
                                               (namespaces *doc-node-qnames*))
                                       *namespace-dictionary*))
       (uname-value (if *permit-dtd-schema-extensions*
                      (./@-value (./ (root *doc-node-qnames*) '{*}x) '{*}qname)
                      (make-uname (./@-value (./ (root *doc-node-qnames*) '{*}x) '{*}qname))))
       (elem-uname (intern-name "newElement" (namespace uname-value)))
       (element (make-elem-node :name elem-uname
                                :attributes
                                (list (make-qname-attr-node :name uname-value
                                                            :value uname-value
                                                            :children nil))
                                :children
                                '("this demonstrates benefits"
                                  "of first-class names. it doesn't"
                                  "matter, whether prefixes are retained...")))
       (*print-pretty* t))
  (setf (prefix elem-uname) "aPrefix")
  (format *trace-output* "~%~%an element with reused names:~%")
  (write-node element *trace-output* :encoding :us-ascii))

(let* ((*namespace-bindings* (cons (cons "a" "data:,ns-a") *namespace-bindings*))
       (*namespace-dictionary* (append (mapcar #'(lambda (ns) (cons (namespace-name ns) ns))
                                               (namespaces *doc-node-qnames*))
                                       *namespace-dictionary*))
       (uname-value (if *permit-dtd-schema-extensions*
                      (./@-value (./ (root *doc-node-qnames*) '{*}x) '{*}qname)
                      (make-uname (./@-value (./ (root *doc-node-qnames*) '{*}x) '{*}qname))))
       (elem-uname (intern-name "newElement" (namespace uname-value)))
       (element (make-elem-node :name elem-uname
                                :attributes
                                (list (make-qname-attr-node :name uname-value
                                                            :value uname-value
                                                            :children nil))
                                :children
                                '("... or not. if the model is complete,"
                                  "operations are closed and the serialized form is NS-valid."
                                  "...")))
       (*print-pretty* t))
  (setf (prefix elem-uname) nil)
  (format *trace-output* "~%~%an element with reused names, but with cleared prefixes:~%")
  (describe elem-uname)
  (terpri)
  (describe element)
  (terpri)
  (write-node element *trace-output* :encoding :us-ascii))


;; ns propagation with multiple unambiguous prefix bindings. in this case, the dominant declaration
;; preceeds the dependant declarations but has its own prefix
(defParameter *doc-node-combination*
  (document-parser
  "<!DOCTYPE doc [
    <!ELEMENT compound:doc (x, y)* >
    <!ATTLIST compound:doc xmlns:compound CDATA 'data:,ns-doc'>
    <!ATTLIST x xmlns CDATA 'data:,ns-a'>
    <!ENTITY % dtd1 SYSTEM 'data:,<!ELEMENT x (a)*> <!ELEMENT a EMPTY>'>
    %dtd1;
    <!ATTLIST y xmlns CDATA 'data:,ns-b'>
    <!ENTITY % dtd2 SYSTEM 'data:,<!ELEMENT y (b)*> <!ELEMENT b EMPTY>'>
    %dtd2;
    ]>

   <compound:doc xmlns='data:,ns-doc'>
     <x xmlns='data:,ns-a'><a/></x>
     <y xmlns='data:,ns-b'><b/></y>
     </doc>"))

(write-node *doc-node-combination* *trace-output* :encoding :us-ascii)

(format *trace-output*
        "~%~%an examination of the document entitiy demonstrates that element names are resolved:~%   ")
(xqdm::walk-elements  *doc-node-combination*
                      #'(lambda (element) (format *trace-output* " ~:W" (name element)) element))
(format *trace-output*
        "~%and, in addition, the nems in element definitions are alos resolved:~%   ")
(xqdm::walk-element-definitions *doc-node-combination*
                                #'(lambda (def) (format *trace-output* " ~:W" (name def)) def))



(format *trace-output*
        "~%~%this demonstrates ns propagation with multiple unambiguous prefix bindings.
in this case, the dominant declaration preceeds the dependant declarations and shares a prefix.")

(handler-case
  (write-node
   (document-parser
    "<!DOCTYPE doc [
    <!ELEMENT doc (a:x, b:y)* >
    <!ATTLIST doc xmlns CDATA 'data:,ns-top'>
    <!ATTLIST a:x
              xmlns:a CDATA 'data:,ns-a'
              xmlns CDATA 'data:,ns-a'>
    <!ELEMENT a:x (a)*>
    <!ELEMENT a EMPTY>
    <!ATTLIST b:y
              xmlns:b CDATA 'data:,ns-b'
              xmlns CDATA 'data:,ns-b'>
    <!ELEMENT b:y (b)*>
    <!ELEMENT b EMPTY>
    ]>

   <doc xmlns='data:,ns-top'>
     <x xmlns='data:,ns-a'><a/></x>
     <y xmlns='data:,ns-b'><b/></y>
     </doc>")
   *trace-output* :encoding :us-ascii)
  (error (condition)
         (warn "unexpected error: ~a" condition)))


(format *trace-output*
        "~%~%this demonstrates the problmes which arise where declaration either are missing in the document
and/or declaration or do not match.")

(handler-case
  (handler-bind
    ((validity-condition #'(lambda (condition)
                                 (format *trace-output* "~%validity condition as expected: ~a~%" condition)
                                 (continue)))
     (warning (lambda (condition)
                (format *trace-output* "~%warning as expected: ~a~%" condition)
                (muffle-warning))))
    (write-node
     (document-parser
      "<!DOCTYPE doc [
    <!ELEMENT doc (a:x, b:y)* >
    <!ATTLIST doc xmlns CDATA 'data:,ns-top'>
    <!ELEMENT a:x (a)*>
    <!ATTLIST a:x
              xmlns:a CDATA 'data:,ns-a'
              xmlns CDATA 'data:,ns-a'>
    <!ELEMENT a EMPTY>
    <!ELEMENT b:y (b)*>
    <!ATTLIST b:y
              xmlns:b CDATA 'data:,ns-b'
              xmlns CDATA 'data:,ns-b'>
    <!ELEMENT b EMPTY>
    ]>

   <doc >
     <x ><a/></x>
     <y ><b/></y>
     </doc>" :validate t)
     *trace-output* :encoding :us-ascii))
  (error (condition)
         (warn "unexpected error: ~a" condition)))

(format *trace-output*
        "~%~%namespace declarations are propagation with multiple unambiguous prefix bindings.
in this case, the dominant declaration follows the dependant declarations.~%")
(handler-case
  (write-node
   (document-parser
    "<!DOCTYPE doc [
    <!ELEMENT a:x (a)*>
    <!ATTLIST a:x
              xmlns:a CDATA 'data:,ns-a'
              xmlns CDATA 'data:,ns-a'>
    <!ELEMENT a EMPTY>
    <!ELEMENT b:y (b)*>
    <!ATTLIST b:y
              xmlns:b CDATA 'data:,ns-b'
              xmlns CDATA 'data:,ns-b'>
    <!ELEMENT b EMPTY>
    <!ELEMENT doc (a:x, b:y)* >
    <!ATTLIST doc xmlns CDATA 'data:,ns-top'>
    ]>

   <doc xmlns='data:,ns-top'>
     <x xmlns='data:,ns-a'><a/></x>
     <y xmlns='data:,ns-b'><b/></y>
     </doc>"  :validate t)
   *trace-output* :encoding :us-ascii)
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))

(format *trace-output*
        "~%~%this example notes the ambiguous namespace bindings.
and signal validation errors for the content and the missing definition.~%")

(handler-case
  (handler-bind
    ((validity-condition #'(lambda (condition)
                              (format *trace-output* "~%as expected: ~a~%" condition)
                              (continue)))
     (warning #'(lambda (condition)
                              (format *trace-output* "~%as expected: ~a~%" condition)
                              (muffle-warning))))
    (write-node
     (document-parser
      "<!DOCTYPE doc [
    <!ELEMENT doc (a:x)* >
    <!ATTLIST doc xmlns CDATA 'data:,ns-top'
                  xmlns:a CDATA 'data:,ns-b'>
    <!ELEMENT a:x EMPTY>
    <!ATTLIST a:x xmlns:a CDATA 'data:,ns-a'>
    ]>

   <doc xmlns='data:,ns-top'
        xmlns:a='data:,ns-b'>  <!-- nb. as xmlns:a='data:,ns-a' this causes a ns default error instance -->
     <x xmlns='data:,ns-a'></x>
     </doc>"
      :validate t)
     *trace-output*))
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%this example demonstrate the effects of changing a namespace name v/s changing the value in a namespace node.~%")

(defParameter *doc-qnames2* 
  "<doc xmlns='data:,ns-top' xmlns:a='data:,ns-a' >
     <x xmlns='data:,ns-a'><z/></x>
     <y xmlns='data:,ns-b'></y>
     </doc>")

;; change the prefix. NB. one _doesn't_ want to change the local part of the name
;; as that changes the local part of the interned name

(let ((count 0))
  (flet ((report-mutation (document operator &aux result)
           (setf result (multiple-value-list (funcall operator document)))
           (apply #'format *trace-output* "~%~%~@R. ~@? :~%"
                  (incf count) (or (rest result) (list "original serialized.")))
           (write-node (root (first result)) *trace-output* :encoding :us-ascii)))
    (format *trace-output* "~%original. :~%~a" *doc-qnames2*)
    (map nil #'(lambda (test-fun) (report-mutation (document-parser *doc-qnames2*) test-fun))
         (list #'identity
               #'(lambda (doc-node
                          &aux (child-elem (.// doc-node "x"))
                          (child-ns-node (./@ child-elem "")))
                   (setf (name child-ns-node) (intern-name "aChanged" "xmlns"))
                   (values doc-node
                           "a change of the prefix specified for a local namespace binding has the expected effect on the serialized document, even though~%~s.name.prefix remains = ~s"
                           child-elem (prefix (name child-elem))))
               #'(lambda (doc-node
                          &aux (root-node (root doc-node))
                          (child-elem-0 (./ root-node 1))
                          (child-elem-1 (./ root-node "y"))
                          (child-child-elem (./ child-elem-0 1)))
                   (setf (children child-elem-0) (remove child-child-elem (children child-elem-0)))
                   (push child-child-elem (children child-elem-1))
                   (values doc-node
                           "moving the element does not cause the artifactual null prefix to be captured.~%~s.name.prefix remains = ~s. the serializer uses the binding visible in the root node.~%~s.namespaces = ~s."
                           child-child-elem (prefix (name child-child-elem))
                           child-elem-1 (namespaces child-elem-1)))
               #'(lambda (doc-node
                          &aux (root-node (root doc-node))
                          (child-elem-0 (./ root-node 1))
                          (child-elem-1 (./ root-node "y")))
                   (setf (namespaces child-elem-0) nil)
                   (setf (namespaces child-elem-1) nil)
                   (values doc-node
                           "the prefixes are serialization artifacts, where the local namespace nodes have been deleted, the serializer either generates new ones, or uses other apparent bindings.~%~s.namespaces = ~s.~%~s.namespaces = ~s."
                           child-elem-0 (namespaces child-elem-0)
                           child-elem-1 (namespaces child-elem-1)))
               #'(lambda (doc-node
                          &aux (root-node (root doc-node))
                          (child-elem (./ root-node "x"))
                          (child-ns-node (./@ child-elem "")))
                   (setf (namespaces child-elem)
                         (substitute (make-ns-node :name (intern-name "" "xmlns")
                                                   :namespace (find-namespace "")
                                                   :value "")
                                     child-ns-node
                                     (namespaces child-elem)))
                   (values doc-node
                           "the effect of a change to the value of a namespace node is limited to that node. it has no affect on the names within its scope...~%~s.namespaces = ~s."
                           child-elem (namespaces child-elem)))
               #'(lambda (doc-node
                          &aux (root-node (root doc-node))
                          (x-node (./ root-node "x"))
                          (y-node (./ root-node "y")))
                   (setf (namespaces x-node)
                         (substitute (make-ns-node :name (name (./@ x-node ""))
                                                   :namespace nil
                                                   :value "data:,ns-nonexistant1")
                                     (./@ x-node "")
                                     (namespaces x-node)))
                   (setf (namespaces y-node)
                         (substitute (make-ns-node :name (name (./@ y-node ""))
                                                   :namespace nil
                                                   :value "data:,ns-nonexistant2")
                                     (./@ y-node "")
                                     (namespaces y-node)))
                   (values doc-node
                           "the effect of a change to the value of a namespace node is limited to that node. it has no affect on the names within its scope...~%~s.namespaces = ~s.~%~s.namespaces = ~s."
                           (./ root-node "x") (namespaces (./ root-node "x"))
                           (./ root-node "y") (namespaces (./ root-node "y"))))
               #'(lambda (doc-node
                          &aux (root-node (root doc-node))
                          (child-elem (./ root-node "x"))
                          (child-ns-node (./@ child-elem "")))
                   (setf (namespaces child-elem)
                         (substitute (make-ns-node :name (intern-name "" "xmlns")
                                                   :namespace (find-namespace "")
                                                   :value "")
                                     child-ns-node
                                     (namespaces child-elem)))
                   (push (make-ns-node :name (intern-name "a" "xmlns")
                                       :namespace (find-namespace ""))
                         (namespaces child-elem))
                   (values doc-node
                           "... even where new nodes supplant all original prefix/namespace bindings.~%~s.namespaces = ~s."
                           child-elem (namespaces child-elem)))
               #|changing the namespace's name is better left alone
               #'(lambda (doc-node
                          &aux (root-node (root doc-node))
                          ;; this isn't strictly necessary, but serves to effect re-registration
                          ;; of the namespace in the document namespace registry
                          (*namespace-dictionary* (namespaces doc-node))
                          (child-elem (./ root-node "x"))
                          (child-ns-node (./@ child-elem "")))
                   ;; this is pretty treacherous where the namespaces are packages...
                   ;; it leaves the package with a name which does not agree with the namespace state...
                   (with-namespace (namespace (namespace child-ns-node))
                     (setf (namespace-name namespace) "data:,ns-nefarious!")
                     (values doc-node
                             "... even where the name of the namespace is changed.~@
                           ~s.namespaces = ~s."
                             child-elem (namespaces child-elem))))|#
               ))))


:EOF
