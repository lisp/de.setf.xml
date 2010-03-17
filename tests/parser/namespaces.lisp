;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

#|
 <DOCUMENTATION>
  <DESCRIPTION>
   test for namespaces.
   see also test-validation and test-qnames
   </DESCRIPTION>
  </DOCUMENTATION>
|#


;; 
;;

(format *trace-output*
        "~%~%;; this illustrates the consequences of attempts to bind standard namespaces.~%;; 0.949 fails these tests")

(flet ((test-document (string)
         (type-of (handler-bind
                    ((error #'(lambda (condition) (return-from test-document (type-of condition))))
                     (warning #'(lambda (condition) (return-from test-document (type-of condition)))))
                    (parse-document string)))))
  (let ((xml-dtd-same "<!DOCTYPE doc [<!ELEMENT doc EMPTY ><!ELEMENT tick EMPTY><!ATTLIST tick xmlns:xml CDATA 'http://www.w3.org/XML/1998/namespace'>]> <doc></doc>")
        (xml-dtd-changed "<!DOCTYPE doc [<!ELEMENT doc EMPTY ><!ELEMENT tick EMPTY><!ATTLIST tick xmlns:xml CDATA 'http://www.w3.org/XML/0000/namespace'>]> <doc></doc>")
        (xmlns-dtd-same "<!DOCTYPE doc [<!ELEMENT doc EMPTY ><!ELEMENT tick EMPTY><!ATTLIST tick xmlns:xmlns CDATA 'http://www.w3.org/XML/1998/namespace/xmlns'>]> <doc></doc>")
        (xmlns-dtd-changed "<!DOCTYPE doc [<!ELEMENT doc EMPTY ><!ELEMENT tick EMPTY><!ATTLIST tick xmlns:xmlns CDATA 'http://www.w3.org/XML/0000/namespace'>]> <doc></doc>")
        (xml-element-same "<doc xmlns:xml='http://www.w3.org/XML/1998/namespace'/>")
        (xml-element-changed "<doc xmlns:xml='http://www.w3.org/XML/0000/namespace'/>")
        (xmlns-element-same "<doc xmlns:xmlns='http://www.w3.org/XML/1998/namespace/xmlns'/>")
        (xmlns-element-changed "<doc xmlns:xmlns='http://www.w3.org/XML/0000/namespace/xmlns'/>"))
    (defTests
      :eval-when :load
      (xparser
       (namespaces
        (dtd
         :form (list (test-document xml-dtd-same)
                     (test-document xml-dtd-changed)
                     (let ((*constant-prefix-strings* (cons "xml" *constant-prefix-strings*))) (test-document xml-dtd-same))
                     (let ((*constant-prefix-strings* (cons "xml" *constant-prefix-strings*))) (test-document xml-dtd-changed))
                     (test-document xmlns-dtd-same)
                     (test-document xmlns-dtd-changed)
                     (let ((*unbindable-prefix-strings* nil)) (test-document xmlns-dtd-same))
                     (let ((*unbindable-prefix-strings* nil)) (test-document xmlns-dtd-changed))
                     (test-document xml-element-same)
                     (test-document xml-element-changed)
                     (let ((*constant-prefix-strings* (cons "xml" *constant-prefix-strings*))) (test-document xml-element-same))
                     (let ((*constant-prefix-strings* (cons "xml" *constant-prefix-strings*))) (test-document xml-element-changed))
                     ;; by default xmlns is specified unbindable
                     (test-document xmlns-element-same)
                     (test-document xmlns-element-changed)
                     (let ((*unbindable-prefix-strings* nil)) (test-document xmlns-element-same))
                     (let ((|REC-xml-names-19990114.NSC: Prefix Immutable| nil)) (test-document xmlns-element-same))
                     (let ((|REC-xml-names-19990114.NSC: Prefix Immutable| nil)) (test-document xmlns-element-changed)))
         :value '(doc-node doc-node doc-node
                  |NSC: Prefix Immutable| |NSC: Prefix Immutable| |NSC: Prefix Immutable|
                  doc-node doc-node

                  doc-node doc-node doc-node
                  |NSC: Prefix Immutable| |NSC: Prefix Immutable| |NSC: Prefix Immutable|
                  doc-node doc-node doc-node)
         :verbose nil))))))

;(parse-document "<!DOCTYPE doc [<!ELEMENT doc EMPTY ><!ELEMENT tick EMPTY><!ATTLIST tick xmlns:xml CDATA 'http://www.w3.org/XML/0000/namespace'>]> <doc></doc>")
;(let ((*constant-prefix-strings* (cons "xml" *constant-prefix-strings*))) (parse-document "<!DOCTYPE doc [<!ELEMENT doc EMPTY ><!ELEMENT tick EMPTY><!ATTLIST tick xmlns:xml CDATA 'http://www.w3.org/XML/0000/namespace'>]> <doc></doc>"))
;(let ((|REC-xml-names-19990114.NSC: Prefix Immutable| nil)) (parse-document "<doc xmlns:xmlns='http://www.w3.org/XML/0000/namespace/xmlns'/>"))

:EOF
