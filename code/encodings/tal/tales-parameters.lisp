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

(defParameter *attrs* nil)

(defParameter *container* nil)

(defParameter *default* t)

(defParameter *global-variables* nil)

(defParameter *here* nil)

(defParameter *string-data-terminator* nil)
(defParameter *string-data-colon* nil)

(defParameter *input-datum* nil)
(defParameter *input-buffer* nil)
(defParameter *input-eof* nil)
(defParameter *input-index* nil)
(defParameter *input-last* nil)
(defParameter *input-reader* nil)
(defParameter *input-reread-char* nil)
(defParameter *input-reader-arg* nil)
(defParameter *input-token-cache* nil)
(defParameter *tal-input nil)
(defParameter *tal-readtable* nil)

(defParameter *nothing* nil)

(defParameter *options* nil)

(defParameter *request* nil)

(defParameter *root* nil)

(defParameter *template* nil)

(defParameter *user* nil)

:EOF
