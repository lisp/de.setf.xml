;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  collected parameter definitions
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010311' AUTHOR='JAA'/>
  <DELTA DATE='20010612'>non-EQ word tests for case-insensitive parsing</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package"BNFP")

;; parameters/variables
;; those in the form *<name> are bound within the compiler and parser only.
;; those in the form *<name>* have global bindings.

(defMacro defUnboundVar (name &optional documentation)
  `(prog1 (defVar ,name)
     (makunbound ',name)
     #+Genera(declaim (special ,name))
     ,@(when documentation
         `((setf (documentation ',name 'variable) ,documentation)))))

(defparameter *atn-words* nil)

(defParameter *class.atn* 'atn)
(defParameter *class.atn-node* 'atn-node)
(defParameter *class.push-atn-edge* 'push-atn-edge)
(defParameter *class.pop-atn-edge* 'pop-atn-edge)
(defParameter *class.fail-atn-edge* 'fail-atn-edge)
(defParameter *class.word-atn-edge* 'word-atn-edge)
(defParameter *class.or-atn-edge* 'or-atn-edge)
(defParameter *class.test-atn-edge* 'test-atn-edge)
(defParameter *class.cat-atn-edge* 'cat-atn-edge)
(defParameter *class.jump-atn-edge* 'jump-atn-edge)
(defParameter *class.cell-atn-edge* 'cell-atn-edge)
(defParameter *class.atn-lexicon* 'atn-lexicon)
(defParameter *class.atn-cell-category* 'atn-cell-category)
(defParameter *class.atn-derived-category* 'atn-derived-category)
(defParameter *class.atn-lexem* 'atn-lexem)
(defParameter *class.atn-negated-alternatives* 'atn-negated-alternatives)
(defParameter *class.atn-conjunction* 'atn-conjunction)
(defParameter *class.atn-builtin-predicate-category* 'atn-builtin-predicate-category)
(defParameter *class.atn-undeclared-category* 'atn-undeclared-category)
(defParameter *class.atn-primitive-category* 'atn-primitive-category)
(defParameter *class.atn-complement-category* 'atn-complement-category)
(defParameter *class.atn-alternative-category* 'atn-alternative-category)

(defUnboundVar *atn-ambiguous
  "specifies that code be generated to parse ambiguous grammars.
   this entails exhaustive parsing for disjunctive phrases and collecting multiple
   results. otherwise code for such phrases is exclusive, with the first result
   only used.")
(defUnboundVar *atn-class
  "when tracing, binds the atn node type within the parser when tracing is enabled.")
(defUnboundVar *constructor-name
  "names the function to be used to construct instances from within the parser.
   bound to <code>:CONSTRUCTOR-NAME</code> at invocation of the compiler.")
(defUnboundVar *atn-input
  "binds the parsed input source." )
(defUnboundVar *atn-index
  "binds the position parsed input source during reduction." )
(defUnboundVar *atn-input-eof-function
  "binds the name of the function to test for end of file")
(defUnboundVar *atn-input-function
  "binds the name of the function to get input tokens")
(defUnboundVar *atn-level
  "binds the production depth within the parser.")
(defUnboundVar *atn-net
  "when tracing,  binds the name of the current atn net." )
(defUnboundVar *atn-mode
  "controls the reduction mode in the parser: <code>:SINGLE</code> continues a parse with the
   first result only, while <code>:MULTIPLE</code>, the default, continues all possibilities." )
(defUnboundVar *atn-node
  "when tracing,  binds the name of current internal node within an atn net.
   is null initially at the start of each a net." )
(defUnboundVar *atn-properties
  "when tracing,  binds the parsing properties of the current net or node.")
(defVar *atn-reduce* t
  "specifies whether the parser should reduce results.")
(defVar *atn-return-structure* nil
  "governs whether the parsed structure is returned when not reducing.
   the default value is nil, which causes the term name to be returned as a success
   indicator.")
(defUnboundVar *atn-register-words
  "specifies whether the parser should record parsed terminal words in the result.
   by default nil.")
(defParameter *atn-save-definitions* t
  "when non-nil, definitions for individual non-terminal functions are saved as properties
   of the system name. note that this applies to the active interpretation environment only.
   see <code>SYMBOL-ATN-SOURCE</code>.")
(defUnboundVar *atn-stack
  "binds a stack of non-terminal production names within the parser.")
#+Genera(declaim (special *atn-stack))
(defun atn-stack ()
  (declare (special *atn-stack))
  (when (boundp '*atn-stack) (copy-list *atn-stack)))
(defUnboundVar *atn-start-name
  "names the target production for a given parser invocation.")
(defVar *atn-structure* nil
  "binds the last reduced result in a parse.")
(defVar *atn-term* nil
  "binds the respective terms after they have been matched or parsed as substructures.
   in the case of a substructure the binding is effected immediately prior to reduction.
   the binding is global, which means it retains the last successfully parsed term.
   this will differ from the <code>*ATN-NET</CODE> binding
   for categories which do not generate their own parse functions.")
(defVar *atn-term?* nil
  "binds the next term for which a parse or match will be attempted.")
(defVar *atn-token-package* nil
  "this package is used by the compiler to intern grammar tokens.
   the tokenizer should intern into the same package.
   bound by the compiler to the :PACKAGE keyword argument")
(defParameter *atn-runtime-files* '("ATN-package" "ATN-runtime")
  "defines the files which are to be made availble to the compiled parser.")
(defParameter *atn-trace* nil
  "specifies whether to generate and to activate tracing code.
   bound to the <code>:TRACE</code> keywords to the compiler and respective parser.")
(defParameter *atn-trace-nets* nil
  "determines for which, if any, nets the internal node functions are traced.
   bound to the <code>:TRACE-NETS</code> keyword respective parser.")
(defVar *atn-wfst nil
  "during a parse this binds the 'well-formed subtree' cache with the parser.
   the cache is bound as a property of the system name.
   when compiling, a non-NULL value generated code for subtree-processing.
   when, as by default, NULL, no wfst is used.
   should be set to <code>T<code> for recursive grammars.")
(defUnboundVar *atn-word-predicate
  "specifies the predicate used to compare words. by default <code>EQ</code>.")
(defUnboundVar *system-lexicon)

:EOF
