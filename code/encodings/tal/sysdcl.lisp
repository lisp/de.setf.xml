;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-


#|
<DOCUMENTATION>
 <p>package definition for a tal/tales-based template processor
    the accompanying .bnf goes in the xml:bnf; directory, the others
    as noted below. the tal-0-949 is, as the name implies, to retrofit for 0-949.</p>
 <p>there's been litte work done with this, as i'm still just one person, so the
    separation-of-responsibilities, which is one of the arguments for tal,
    offers no consequent advantages over introspective support when writing the
    macro code. nonetheless, here it is.</p>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20020000'/>
  <DELTA DATE='20030713'>added to adapt to 9-949</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :cl-user)

(define-system
  (xml.tal
   :description "tal generation")
  ()
  xml.encoding
  "xml:code;encodings;tal;tal-pkg"
  "xml:code;encodings;tal;tal-0-949"
  "xml:code;encodings;tal;tales-parameters"
  "xml:code;encodings;tal;tales-operators"
  "xml:code;encodings;tal;tales-tokenizer"
  "xml:code;encodings;tal;tales-constructors"
  "xml:code;encodings;tal;tales-parser"
  "xml:code;encodings;tal;tal")


;(execute-system-operations :xml.tal '(:compile :load))

:EOF
