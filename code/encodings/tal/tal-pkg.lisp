;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

#|
<DOCUMENTATION>
 <p>package definition for xhtml</p>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20020121'>WD-xhtml1-20011004</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "CL-USER")

(defPackage "TAL" (:use "COMMON-LISP" "XMLP" "XQDM" "XML-UTILS" #+CCL "CCL")
  #+CCL (:shadow "TARGET")
  (:export "*ATTRS*"
           "*CONTENT*"
           "*DEFAULT*"
           "*HERE*"
           "*GLOBAL-VARIABLES*"
           "*NAME*"
           "*NOTHING*"
           "*ROOT*"
           "*TEMPLATE*"
           "*USER*"
           "PYTHON"
           "LISP"
           "THIS"
           "TRANSLATE-TAL-DEFINITION")
  )



:EOF
