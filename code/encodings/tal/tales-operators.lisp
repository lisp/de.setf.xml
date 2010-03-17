;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: tal; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  constructor methods use within the tales parser.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20020212' AUTHOR='JAA'/>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "TAL")

(defun parse-python-expression (expression)
  `(python ,(string-trim #(#\space #\tab #\return #\linefeed) expression)))

(defun parse-lisp-expression (expression &aux (*read-eval* nil))
  (read-from-string expression))

:EOF
