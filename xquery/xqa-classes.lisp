;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|

<DOCUMENTATION>
 <DESCRIPTION>
  additional path elements specific to query expressions
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 </DOCUMENTATION>
|#
(in-package "XML-PATH")


(defPathElement xqa:id-test (name type target))
(defPathElement xqa:range-test (min max))


:EOF