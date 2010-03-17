;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <COPYRIGHT YEAR='2009' AUTHOR='james adam anderson' MARK='(C)'
            href='file:license.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20031111'>standalone for isolated parser use</DELTA>
  <DELTA DATE='20090101'>repackaged w/ asdf</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "CL-USER")

(defpackage :de.setf.clifs
  (:nicknames :clifs)
  (:use :common-lisp :de.setf.utility)
  ;;(:shadow "SYMBOL")
  #+ccl (:import-from :ccl :validate-superclass :class-precedence-list)
  #+Allegro (:import-from "EXCL" "WITHOUT-INTERRUPTS")
  #+(and Allegro (version>= 6 0)) (:import-from "MOP" "CLASS-PRECEDENCE-LIST")
  #+(and Allegro (version< 6 0)) (:import-from "CLOS" "CLASS-PRECEDENCE-LIST")
  #+Genera (:import-from "CLOS-INTERNALS" "CLASS-PRECEDENCE-LIST" "FUNCALLABLE-STANDARD-CLASS" "VALIDATE-SUPERCLASS")
  #+Genera(:import-from "SCL" "WITHOUT-INTERRUPTS")
  #+Genera(:shadowing-import-from "SI" "STREAM")
  #+lispworks (:import-from :lispworks :without-interrupts :validate-superclass)
  #+CMU (:import-from "SYSTEM" "WITHOUT-INTERRUPTS")
  #+PCL (:shadowing-import-from "PCL" "CLASS-PRECEDENCE-LIST"
				"FUNCALLABLE-STANDARD-CLASS"
				"VALIDATE-SUPERCLASS"
				"STANDARD-CLASS" "BUILT-IN-CLASS"
				"FIND-CLASS" "CLASS-NAME" "CLASS-OF")
  #+SBCL (:import-from "SB-SYS" "WITHOUT-INTERRUPTS")
  #+sbcl (:shadowing-import-from "SB-PCL" "CLASS-PRECEDENCE-LIST"
                                 "FUNCALLABLE-STANDARD-CLASS"
                                 "VALIDATE-SUPERCLASS"
                                 "STANDARD-CLASS" "BUILT-IN-CLASS"
                                 "FIND-CLASS" "CLASS-NAME" "CLASS-OF")
  #+scl (:import-from :clos
                      :class-precedence-list
                      :funcallable-standard-class
                      :validate-superclass)
  (:export
   :*inference-systems*
   :*source-recording*
   :*system*
   :clause
   :control-rule
   :definite-goal
   :definite-logic-procedure
   :definite-program-clause
   :definite-rule
   :find-system
   :flops-rule
   :fuzzy-control-rule
   :horn-clause
   :inference-unit
   :inference-system
   :inference-systems
   :initialize-system
   :insert-system
   :logic-rule
   :logic-procedure
   :mamdani-rule
   :ops5-rule
   :poslog-procedure
   :production
   :prolog-procedure
   :reset-system
   :rule
   :rule-documentation
   :rule-name
   :rule-sources
   :spii-rule
   :sugeno-rule
   :suplog-procedure
   :system
   :system-documentation
   :system-name
   :system-plist
   :system-procedure
   :system-property
   :unit-clause
   :vdg-clause
   :vdr-clause
   :vdu-clause
   :vprolog-procedure
   ))


:EOF


