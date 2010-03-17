;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010318' AUTHOR='jaa'>initial version</DELTA>
  <DELTA DATE='20010530' VERSION='0.501'>
   first version of the parser / compiler combination</DELTA>
  <DELTA DATE='20010610' VERSION='0.502'>clos access</DELTA>
  <DELTA DATE='20010910' VERSION='0.503'>parallel to xparser tokenizers</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PATH")

(defParameter *version* "0.503")

(defParameter *documents* nil
  "a process document cache which binds document instances by uri")


(eval-when (:compile-toplevel :load-toplevel :execute)
  (defTokens
    "("   ")"   "["   "]"   "."   ".."  "@"    ","   "::"
    "/"   "//"  "|"   "+"   "-"   "="   "!="   "<"   "<="   ">"   ">="
    "and" "or"  "mod" "div" "not" "union"
    "*"
    "$" 
    ":" 
    "comment" "text" "processing-instruction" "node"  
    "ancestor" "ancestor-or-self" "attribute" "child" "descendant"
    "descendant-or-self" "following" "following-sibling" "namespace"
    "parent" "preceding" "preceding-sibling" "self"
    "id" "key" "root"
    "comment" "text" "processing-instruction" "node"
    ))

(defParameter *xpath-readtable* nil)

(defParameter *xpath-token* nil)

(defParameter *axis-names*
  '(|xml|:|ancestor| |xml|:|ancestor-or-self| |xml|:|attribute| |xml|:|child| |xml|:|descendant|
    |xml|:|descendant-or-self| |xml|:|following| |xml|:|following-sibling| |xml|:|namespace|
    |xml|:|parent| |xml|:|preceding| |xml|:|preceding-sibling| |xml|:|self|
    ;; wd-xslt1.1-2001212
    |xml|:|id| |xml|:|key|
    ;; in addition to the spec
    |xml|:|root|))
(defParameter *node-types*
  '(|xml|:|comment| |xml|:|text| |xml|:|processing-instruction| |xml|:|node|))


(defParameter *XPA-PACKAGE* (find-package "XPA"))
(defParameter xpa:*context-node* nil)
(defParameter xpa:*position* -1)
(defParameter xpa:*count* -1)

:EOF
