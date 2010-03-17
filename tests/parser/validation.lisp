;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

#|
 <DOCUMENTATION>
  <DESCRIPTION>
   examples for element/default value agreement for attributes and namespace declarations.
   they demonstrate the cases where agreement is required and the consequences in cases where
   disagreements are accommodated.
   </DESCRIPTION>
  <CHRONOLOGY>
   <DELTA DATE='20030326' VERSION='0.949'>enumerated possible cases
   </CHRONOLOGY>
  </DOCUMENTATION>
|#



;;
;; namespace agreement

(format *trace-output*
        "~%~%;;
;; examples which demonstrate the difference between a namespace default and
;; a fixed attribute default: where the former differ, the parse may
;; fail independant of validation while in the latter case, it fails under
;; validation only.~%")


(format *trace-output*
        "~%~%;;~%;; namespace declarations (-validation): element = x /= default = y ==> error:~%")
(handler-case (write-node
               (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    xmlns CDATA #FIXED 'http://java.sun.com/historical'
    >
    <!-- tests the 'ns attribute default' vc -->
]>
<palimpest xmlns='http://over.the.rainbow.com/somewhere'/>"
                :validate nil)
               *trace-output*)
  (namespace-error  (condition)
                     (format *trace-output* "~%as expected: ~a~%" condition))
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%;;~%;; namespace declarations (-validation): element = x == default = x ==> ok:~%")
(handler-case (write-node
               (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    xmlns CDATA #FIXED 'http://over.the.rainbow.com/somewhere'
    >
    <!-- tests the 'ns attribute default' vc -->
]>
<palimpest xmlns='http://over.the.rainbow.com/somewhere'/>"
                :validate nil)
               *trace-output*)
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))

(format *trace-output*
        "~%~%;;~%;; namespace declarations (-validation): element = x /= default = nil ==> ok:~%")

(handler-case (write-node
               (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    >
    <!-- tests the 'ns attribute default' vc -->
]>
<palimpest xmlns='http://over.the.rainbow.com/somewhere'/>"
                :validate nil)
               *trace-output*)
  (namespace-error  (condition)
                     (format *trace-output* "~%as expected: ~a~%" condition))
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%;;~%;; namespace declarations (-validation): element = nil == default = x ==> ok:~%")

(handler-case (write-node
               (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    xmlns CDATA #FIXED 'http://over.the.rainbow.com/somewhere'
    >
    <!-- tests the 'ns attribute default' vc -->
]>
<palimpest />"
                :validate nil)
               *trace-output*)
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%;;~%;; namespace declarations (-validation): element = nil == default = nil ==> ok:~%")

(handler-case (write-node
               (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    >
    <!-- tests the 'ns attribute default' vc -->
]>
<palimpest />"
                :validate nil)
               *trace-output*)
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


;;
;; fixed attribute default value agreement

(format *trace-output*
        "~%~%;;~%;; attributes (+validation): element = x /= default = y ==> error:~%")
(handler-case
  (handler-bind
    ((validity-cerror #'(lambda (condition)
                          (format *trace-output* "~%as expected: ~a~%" condition)
                          (continue))))
    (write-node
     (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    attr CDATA #FIXED 'http://java.sun.com/historical'
    >
    <!-- tests the 'fixed attribute default' vc -->
]>
<palimpest attr='http://over.the.rainbow.com/somewhere'/>"
                     :validate t)
     *trace-output*))
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%;;~%;; attributes (-validation): element = x /= default = y ==> ok:~%")
(handler-case
  (write-node
   (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    attr CDATA #FIXED 'http://java.sun.com/historical'
    >
    <!-- tests the 'fixed attribute default' vc -->
]>
<palimpest attr='http://over.the.rainbow.com/somewhere'/>"
                   :validate nil)
   *trace-output*)
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%;;~%;; attributes (+validation): element = x == default = y ==> ok:~%")
(handler-case
  (handler-bind
    ((validity-cerror #'(lambda (condition)
                          (format *trace-output* "~%as expected: ~a~%" condition)
                          (continue))))
    (write-node
     (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    attr CDATA #FIXED 'http://java.sun.com/historical'
    >
    <!-- tests the 'fixed attribute default' vc -->
]>
<palimpest attr='http://java.sun.com/historical'/>"
                     :validate t)
     *trace-output*))
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))


(format *trace-output*
        "~%~%;;~%;; attributes (-validation): element = x == default = y ==> ok:~%")
(handler-case
  (write-node
   (parse-document "<!DOCTYPE palimpest [
<!ELEMENT palimpest EMPTY>
<!ATTLIST palimpest
    attr CDATA #FIXED 'http://java.sun.com/historical'
    >
    <!-- tests the 'fixed attribute default' vc -->
]>
<palimpest attr='http://java.sun.com/historical'/>"
                   :validate nil)
   *trace-output*)
  (error (condition)
         (warn "unexpected parse error: ~a" condition)))




:EOF
