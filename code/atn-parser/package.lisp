;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2009' AUTHOR='james adam anderson' MARK='(C)'>
  This file is part of '<a href='./atn-parser.asd'>atn-parser</a>'.

  'atn-parser' is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  'atn-parser' is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with 'atn-parser'.  If not, see the GNU <a href='http://www.gnu.org/licenses/'>site</a>.
  </COPYRIGHT>

 <DESCRIPTION>
 nb. see XQueryDataModel:XQDM-classes for exports for class predicate and constructors
  </DESCRIPTION>
 <CHRONOLOGY>
  <DELTA DATE='20031111'>standalone for isolated parser use</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "CL-USER")

(defpackage :de.setf.atn
  (:nicknames :atn)
  (:documentation
   "The home package for ATN element name when used as maro operators.")
  (:use )
  (:export *trace-output*
           :cat
           :jump
           :pop
           :push
           :test
           :trace
           :type
           :word))

(defpackage :atn-parser
  (:nicknames :atnp :bnfp :bnf-parser)
  (:use :common-lisp :de.setf.utility :de.setf.clifs)

  #+allegro (:import-from :excl :without-interrupts)
  #+(and allegro (version>= 6 0)) (:import-from :mop :class-precedence-list)
  #+(and allegro (version< 6 0)) (:import-from :clos :class-precedence-list)
  #+digitool (:import-from :ccl
                           :*fred-special-indent-alist*
                           :validate-superclass
                           :without-interrupts)
  #+genera (:import-from :clos-internals
                         :class-precedence-list
                         :funcallable-standard-class
                         :validate-superclass)
  #+genera(:import-from :scl: without-interrupts)
  #+genera(:shadowing-import-from :si :stream)
  #+lispworks (:import-from :lispworks :without-interrupts :validate-superclass)
  #+cmu (:import-from :system :without-interrupts)
  #+pcl (:shadowing-import-from :pcl :class-precedence-list
				:funcallable-standard-class
				:validate-superclass
				:standard-class :built-in-class
				:find-class :class-name :class-of)
  #+sbcl (:import-from :sb-sys :without-interrupts)
  #+sbcl (:shadowing-import-from :sb-pcl :class-precedence-list
                                 :funcallable-standard-class
                                 :validate-superclass
                                 :standard-class :built-in-class
                                 :find-class :class-name :class-of)
  #+scl (:import-from :clos
                      :class-precedence-list
                      :funcallable-standard-class
                      :validate-superclass)
  (:export
   :*atn-class
   :*atn-level
   :*atn-net
   :*atn-node
   :*atn-properties
   :*atn-register-words
   :*atn-save-definitions*
   :*atn-stack
   :*atn-structure*
   :*atn-term*
   :*atn-term?*
   :*atn-token-package*
   :*atn-trace*
   :*atn-trace-nets*
   :*atn-wfst
   :*class.atn*
   :*class.atn-alternative-category*
   :*class.atn-builtin-predicate-category*
   :*class.atn-cell-category*
   :*class.atn-complement-category*
   :*class.atn-conjunction*
   :*class.atn-derived-category*
   :*class.atn-lexem*
   :*class.atn-lexicon*
   :*class.atn-negated-alternatives*
   :*class.atn-node*
   :*class.atn-primitive-category*
   :*class.atn-undeclared-category*
   :*class.cat-atn-edge*
   :*class.cell-atn-edge*
   :*class.jump-atn-edge*
   :*class.or-atn-edge*
   :*class.pop-atn-edge*
   :*class.push-atn-edge*
   :*class.test-atn-edge*
   :*class.word-atn-edge*
   :*grammar-pathname*
   :*grammar-string*
   :*source-recording*
   :*terminal-parser-error-action*
   :atn
   :atn-alternative-category
   :atn-bindings
   :atn-builtin-predicate-category
   :atn-cell-category
   :atn-complement-category
   :atn-conjunction
   :atn-constructor-specializer
   :atn-continue-actions
   :atn-derived-category
   :atn-fail-actions
   :atn-finally
   :atn-initial-actions
   :atn-input
   :atn-lexem
   :atn-lexicon
   :atn-name
   :atn-negated-alternatives
   :atn-node
   :atn-primitive-category
   :atn-procedure-call
   :atn-recursion
   :atn-reduce-item
   :atn-reduce-structure
   :atn-sequence-input
   :atn-stack
   :atn-succeed-actions
   :atn-term-cardinality
   :atn-term-names
   :atn-undeclared-category
   :bnf-to-regex-atn
   :call-with-parsed-alist
   :call-with-parsed-terms
   :cat-atn-edge
   :cell-atn-edge
   :compile-atn-system
   :constructor-specializers
   :continuable-parser-error
   :find-parsed-term
   :input.is-at-end
   :input.item
   :input.last-item
   :input.length
   :input.peek-item
   :input.replace-item
   :is-atn-trace
   :is-reduction-enabled
   :jump-atn-edge
   :make-lisp-form
   :make-lisp-subform
   :make-lisp-test-form
   :match-regex
   :nth-parse-result
   :or-atn-edge
   :parser-eof-error
   :parser-error
   :parse-result
   :pop-atn-edge
   :pprint-atn
   :push-atn-edge
   :regular-expression-to-regex-atn
   :sort-parse-results
   :system
   :system-documentation
   :system-name
   :system-plist
   :terminal-parser-error
   :test-atn-edge
   :with-parsed-alist
   :with-parsed-plist
   :with-parsed-term
   :word-atn-edge

   ;; for parse states
   :condition-parse-state
   :condition-action
   :parse-state
   :parse-state-condition
   :parse-state-source
   :parse-state-term
   :parse-state-non-terminal
   :parse-state-stack
   :parse-state-active-p
   :print-parse-state
   :make-parse-state

   :|wfst-initialize|
   :|wfst-adjust|
   :*ATN-REDUCE*
   :%ATN-TRACE-FORM
   :%ATN-BLOCK
   :|wfst-entry|
   :%ATN-NODE-BLOCK
   :%ATN-TRACE
   :ATN-PARSE-SUBSTRUCTURE*
   :|wfst-push-entry|
   :%ATN-EDGE-BLOCK
   ))


:EOF


