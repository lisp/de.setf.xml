;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-utils; -*-
;;;

#|
<DOCUMENTATION>
 <DESCRIPTION>
  this file contains global parameters for all components of the system.
  there are two sections:
  <ul><li>rec/wd/rfc... specify adherence to specifications</li>
   <li>*...* are global bindings shared among the various modules</li>
   </ul>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010608'>added rfc1738</DELTA>
  <DELTA DATE='20010618'>*parsetable*</DELTA>
  <DELTA DATE='20010914'>encoding map as util parameter</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|# 

;;; 

(in-package "XUTILS")

;;
;;
;; standards

(defParameter |NOTE-newline-200101314| t
  "specifies whether newline handling should follow this note wrt the NEL
   character.")

(defParameter |REC-xml-names-19990114| t
  "specifies whether qualified names are recognized and expected where the
   recommendation specifies. <code>T</code> indicates that qualified names
   are recognized and modeled as symbols. <code>NIL</code> indicates that
   names are either modeled as unqualified symbols or left as uninterned
   strings, depending on the value bound to <code>*NAMESPACE</code>.")

(defParameter |REC-xml-19980210.End-of-Line Handling| t
  "that eol characters are to be normalized.
   see also <code>|NOTE-newline-200101314|</code>.")

(defParameter |REC-xml-19980210.Validate Attribute Defaults| t
  "specifies that attribute default values will be validate as per
   <code>|REC-xml-19980210|</code>, section 3.3. this has the side-effect, that
   <em>both</em> entites and notations must be declared prior to appearance
   as attribute values.")

(defParameter |REC-xml-19980210.PEs in Internal Subset| t
  "specifies that parameter entities in the internal subset are permitted
   only as substitutions for (a) distinct declaration(s).
   the default value, <code>T</code>, indicates conformance.
   may be disabled for testing.")

(defParameter |REC-xml-names-19990114.VC: Attribute Declared| nil
  "the validity constraint on ns node declaration proscribes matching
   distinct qnames to the same universal name between the document entity
   and the DTD. by default the constraint is suppressed.")
(defParameter |REC-xml-names-19990114.NSC: Prefix Immutable| t
  "the namespace constraint on rebinding the xmlns and xml namespaces.")

(defParameter |rfc1738| nil
  "when compiled for cl-http, specifies that uri literals must be
   syntatically correct references. by default a warning is issued.")


;;
;;
;; globals

(defParameter *parsetable* nil
  "binds the respective parsetable for the current lexical context.
   where no specific table applies, the enclsoigncontext controls.")

(defVar *xml-base* nil
  "binds the base uri to serve as the context when resoving identifiers to URLs.
   parsers bind it to each entity's url to enable rrealtive url references.")

(defVar *xml-verbose* nil
  "controls diagnostic messages.")

(defParameter *encoding-map*
  '((:UTF-8 :UTF8)
    (:UTF-16 :UTF16)
    (:UTF-16-12 :UTF1612 :UTF16BE)
    (:UTF-16-21 :UTF1621 :UTF16LE)
    (:US-ASCII :USASCII :ASCII)
    (:ISO-8859-1 :ISO88591))
  "specify alternative encoding names.
   in particular, support punctuation variations.")

:EOF


