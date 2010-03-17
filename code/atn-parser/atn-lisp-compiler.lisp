;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  this file comprises functions for translating an instantiated atn network into lisp.
  see <A href='ATN-java-compiler.lisp'>ATN-java-compiler</A> for an incarnation which
  rewrites to java.
  the java version rewrote to a collection of related classes, each of which corresponds
  to a single atn net.
  this version maps each node to a single function, a collection of which are defined
  within a main parser function.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010205' AUTHOR='JAA' />
  <DELTA DATE='20010209' AUTHOR='JAA'>
   changed comparisons to focus on symbols, with appropriate provisions for package
   specifications. factored acces functionsinto separate file.</DELTA>
  <DELTA DATE='20010216' AUTHOR='JAA'>
   the code generated for alternative shouldn't be inclusive, since a bnf production
   is intended to be exclusive. to this end the distinction between inclusive and
   exclusive alternative is introduced into the generator.
   note that, alternatives which resolve to terminals, or terminal equivlaents, don't
   have this problem as they generate a predicate which uses an or. as a side-effect
   of the formulation as a predicate, one can't generate the parser for a
   single-production grammar consisting only of an alternative of terminals...
   <BR>
   the generated code effects a direct network traversal. which means that recursive
   grammars must be cut off.</DELTA>
  <DELTA DATE='20010218' AUTHOR='JAA'>
   carried over the well-formed-subtree implementation to deal with deep trees.</DELTA>
  <DELTA DATE='20010301' AUTHOR='JAA'>
   added pathname method to compile function to avoid duplicate copies of the grammar.</DELTA>
  <DELTA DATE='20010302' AUTHOR='JAA">
   added reduction function parameter to compilation</DELTA>
  <DELTA DATE='20010304' AUTHOR='JAA'>
   <UL><LI>make-lisp-subform (bnf-tokenset)</LI>
       <LI>elevated parse-substructure to the system function in order to cache the
           top-level parse in the wfst table as well.</LI>
       <LI>moved input definitions to atn-utils.lisp</LI></UL></DELTA>
  <DELTA DATE='20010311' AUTHOR='JAA'>
   rearranged the compiler to use global functions</DELTA>
  <DELTA DATE='20010517' AUTHOR='JAA'>
   re-introduced multiple values as an option for code generation.
   in the course of optimizing for XML parsing, the code generator was trimmed for single-valued
   parsing. this won't work for ambiguous grammars, such as those for the xml query language.</DELTA>
  <DELTA DATE='20010605' AUTHOR='MS'>
   lispworks/ansi conformance</DELTA>
  <DELTA DATE='20010612'>non-EQ word tests for case-insensitive parsing</DELTA>
  <DELTA DATE='20010922'>specialized constructor methods; eliminated redundant atn-bindings</DELTA>
  <DELTA DATE='20020116'>corrected condition handlers to signal the conditions rather than not
   handling them</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "BNF-PARSER")


;;
;;
;; source management
;;
;; bind the system instance and the source for respective components. the compiler uses the system name
;; as the binding symbol.

(defun symbol-atn-system (symbol) (get symbol :atn-system))
(defsetf symbol-atn-system (symbol) (system) `(setf (get ,symbol :atn-system) ,system))

(defun symbol-atn-source (symbol &optional terminal
                                 &key literal ((:trace *atn-trace*) nil)
                                 &aux (source (get symbol :atn-source)))
  (when terminal
    (setf source (getf source terminal))
    (unless literal (setf source (expand-atn-macros source))))
  source)
(defun (setf symbol-atn-source) (value symbol &optional terminal)
  (if terminal
    (let ((source (get symbol :atn-source)))
      (setf (getf source terminal) value)
      (setf (get symbol :atn-source) source))
    (setf (get symbol :atn-source) value))
  value)

;; expand macros present in the generated source. 
;; SYMBOL-ATN-SOURCE uses this for readability to strip out tracing forms
;; and eliminate unnecessary bindings or conditionals.

(defun expand-atn-macros (sexp &optional all-macros)
  (if (consp sexp)
    (cond ((and (symbolp (first sexp))
                (macro-function (first sexp))
                (>= (length (string (first sexp))) 5)
                (or all-macros (eq (find-package "BNFP") (symbol-package (first sexp)))))
           (expand-atn-macros (macroexpand-1 sexp) all-macros))
          ((consp (rest sexp))
           (setf sexp (mapcar #'(lambda (sexp) (expand-atn-macros sexp all-macros)) sexp))
           (case (first sexp)
             (if
               (if (eq (second sexp) t) (third sexp) sexp))
             (when
               (setf sexp (nconc (subseq sexp 0 2) (remove nil (cddr sexp))))
               (if (eq (second sexp) t)
                 (expand-atn-macros (cons 'progn (cddr sexp)) all-macros)
                 sexp))
             (progn
               (setf sexp (remove nil sexp))
               (when (cdr sexp)
                 (if (cddr sexp)
                   sexp
                   (second sexp))))
             (let
               (setf sexp (nconc (subseq sexp 0 2) (remove nil (cddr sexp))))
               (if (second sexp)
                 sexp
                 (expand-atn-macros (cons 'progn (cddr sexp)) all-macros)))
             (t sexp)))
          (t
           sexp))
    sexp))

(defGeneric atn-pprint (symbol &optional stream)
  (:documentation
   "serves to pprint generated atn function with marcos expanded.")
  (:method ((form cons) &optional (stream *trace-output*))
           (pprint (expand-atn-macros form) stream))
  (:method ((form null) &optional stream)
           (declare (ignore stream))
           (warn "<null> pprint argument."))
  (:method ((atn cl:symbol) &optional (stream *trace-output*))
           (when (fboundp atn) (atn-pprint (symbol-function atn) stream)))
  (:method ((atn function) &optional (stream *trace-output*))
           (atn-pprint (function-lambda-expression atn) stream)))

;; ensure that tokens are present in the right package. terminals are coerced to the
;; token package, non-terminals to the current package

(defun ensure-token (thing)
  (unless (packagep *atn-token-package*)
    (error "token package not bound: ~s" *atn-token-package*))
  (if (stringp thing) (Intern thing *atn-token-package*) thing))
(defun ensure-symbol (thing)
  (if (stringp thing) (intern thing) thing))

;;
;;
;; COMPILE-ATN-SYSTEM handles the various input and output forms and controls the compilation process.

(defGeneric compile-atn-system (system &key)
  (:documentation
   "translate an atn system to lisp source.
    as specified by invocation arguments the definition may be saved to a file and compiled
    or interpreted directly.
    <p>
    keyword arguments
    <ul>
     <li><code>:AMBIGUOUS</code> (bound special to <code>*ATN-AMBIGUOUS</code>)
      when non-null, code is generated parse multiple substructures.
      defaults to <code>NIL<.code>.
     <li><code>:COMPILE</code> when non-null, the definitions are saved to an external file and compiled.
      where no <code>SOURCE-PATHNAME</code> argument is provided, the current load pathname is used. should none
      be available, an error is signaled.</li>
     <li><code>:EXECUTE</code> when non-null, the definition is interpreted directly.</li>
     <li><code>:PACKAGE</code> (bound special to <code>*ATN-TOKEN-PACKAGE*</code>.) 
      specifies the package in which parsed tokens are to be found.
      this must agree with the implemented tokenizer. bound, by default, to <code>*PACKAGE*</code>.</li>
     <li><code>:PATHNAME</code> specifies the destination file for source to be used for compilation.</li>
     <li><code>:REGISTER-WORDS</code> (bound special to <code>*ATN-REGISTER-WORDS</code>.) 
      indicates whether to generate code such that terminal words should appear in the result.</li>
     <li><code>:START-NAME</code> (bound special to <code>*ATN-START-NAME</code>.)
      names the non-terminal to serve as the default target for the parse. 
      the same keyword to the generated parser function also serves to override the default for
      a given parse application.</li>
     <li><code>:PARSER-NAME</code> (bound special to <code>*PARSER-NAME</code>.)
      names the generic parser function. by default the <code>system-parser-name</code> from the system is used,
      which defaults to <code><i>start-name</i>-PARSER</code>.</li>
     <li><code>:TOKENIZER-NAME</code> (bound special to <code>*TOKENIZER-NAME</code>.)
      names the function used to tokenize input to the parser.
      defaults to <code><i>start-name</i>-TOKENIZER</code>
      a function of this name must be bound and accept at least a string input and produce a sequence of tokens.
      should a method be available which accepts a stream, a respective parser method will also be generated.</li>
     <li><code>:TRACE</code> (bound special to <code>*ATN-TRACE*</code>.) when non-null, tracing code is generated.
      the same keyword to the generated parser determines whether and for which non-terminals tracing is activated.</li>
     </ul></p>
   <p>additional special bindings
    <ul>
     <li><code>*GRAMMAR</code> bound special to the string form of the grammar.</li>
     <li><code>*GRAMMAR-PATHNAME</code> bound pathname from which the grammar was read.</li>
     <li><code>*GRAMMAR-SYSTEM</code> bound special to the atn system instance.</li>
     <li><code>*SYSTEM-LEXICON</code> bound special to the lexicon constructed from the bnf.</li>
     </ul>/p>"))

(proclaim '(special *parser-name *atn-stack))

(defMethod compile-atn-system ((*grammar-system atn-system)
                               &key
                               compile (execute t) load
                               fasl-pathname
                               pathname
                               (source-pathname pathname)
                               ((:ambiguous *atn-ambiguous) nil)
                               ((:input-eof-function *atn-input-eof-function) '|input.is-at-end|)
                               ((:input-function *atn-input-function) '|input.item|)
                               ((:package *atn-token-package*) *package*)
                               ((:parser-name *parser-name) (system-parser-name *grammar-system))
                               ((:register-words *atn-register-words) nil)
                               ((:start-name *atn-start-name) (system-main-net-name *grammar-system))
                               ((:tokenizer-name *tokenizer-name)
                                (intern (concatenate 'string (string *atn-start-name) "-Tokenizer")))
                               ((:trace *atn-trace*) *atn-trace*)
                               ((:wfst *atn-wfst) *atn-ambiguous)
                               ((:word-predicate *atn-word-predicate) 'eq)
                               report-recursion
                               &aux
                               ;; grammar-binding
                               (*system-lexicon (system-lexicon *grammar-system)))
  "compile an atn system. may be directly evaluated oremitted to a file and compiled from there."
  (declare (special *grammar-system *parser-name *system-lexicon *tokenizer-name))
  (declare (ignore report-recursion))  ;; to permit the compiler to be used with older parser versions
  (multiple-value-bind (form name)
                       (make-lisp-form *grammar-system)
    #|(setf grammar-binding
          `(defParameter ,(intern (concatenate 'string "*" (string name) "-GRAMMAR*"))
             ,(system-documentation *grammar-system)))|#
    (unless (or source-pathname *compile-file-pathname*)
      (error "no output pathname provided."))
    (let ((output-pathname
           (or source-pathname (make-pathname :name (format nil "~a-grammar" *atn-start-name)
                                       :directory '(:relative "ATN-LIB")
                                       :defaults *compile-file-pathname*))))
      (with-open-file (stream output-pathname
                              :direction :output :if-exists :supersede
                              :if-does-not-exist :create)
        ;; rebind the reader package to this package in order to improve legibility.
        ;; all cl and bnfp symbols should be unprefixed. only application-specifics
        ;; will have prefixes
        (let ((*package* (find-package "BNF-PARSER"))
              (*print-right-margin* 132))
          (print `(in-package ,(package-name *package*)) stream)
          (map nil #'(lambda (definition)
                       (when (and (consp definition) (eq (first definition) 'defun))
                         (print (list 'declaim
                                      ; the &optional is no longer necessary as everything returns all values
                                      ;`(ftype (function (t) (values t &optional t t)) ,(second definition))
                                      `(ftype (function (t) (values t t t)) ,(second definition)))
                                stream)))
               form)
          (if (eq (first form) 'progn)
            (mapcar #'(lambda (form) (pprint form stream)) (rest form))
            (pprint form stream))))
      (when compile
        (setf fasl-pathname
              (cond (fasl-pathname
                     (setf fasl-pathname (translate-logical-pathname fasl-pathname))
                     (ensure-directories-exist fasl-pathname)
                     (compile-file output-pathname :output-file fasl-pathname))
                    (t
                     (compile-file output-pathname)))))
      ;; if the file was compiled, then load from the fasl path, otherwise load the generated source
      (when (or load execute)
        (load (if compile fasl-pathname output-pathname))))
    (when *atn-save-definitions*
      (setf (symbol-atn-system name) *grammar-system))
    name))
    
      
(defMethod compile-atn-system ((*grammar string) &rest keys
                               &key ((:register-words *atn-register-words) nil)
                               &allow-other-keys)
  "compile a bnf grammar to an atn system and from there to a lisp parser implementation."
  (declare (special *grammar))
  (let ((atn-system (bnf-to-atn *grammar)))
    (cond (atn-system
           (apply #'compile-atn-system atn-system keys))
          (t
          (warn "grammar not parsed: ~s."
                (subseq *grammar 0 (min (length *grammar) 128)))))))

(defMethod compile-atn-system ((stream stream) &rest keys &key &allow-other-keys)
  "read a bnf grammar from a stream and compile it to a parser."
  (flet ((stream->string (stream &aux (buffer (make-array 0 :element-type 'character
                                                          :adjustable t
                                                          :fill-pointer 0))
                               character)
           (loop (unless (setf character (read-char stream nil nil))
                   (return buffer))
                 (vector-push-extend character buffer))))
    (apply #'compile-atn-system (stream->string stream) keys)))

(defMethod compile-atn-system ((*grammar-pathname pathname) &rest keys &key &allow-other-keys)
  "read a bnf grammar from a file and compile it to a parser."
  (declare (special *grammar-pathname))
  (with-open-file (stream *grammar-pathname :direction :input)
    (apply #'compile-atn-system stream keys)))
  

;;
;;
;; MAKE-LISP-FORM generates the proper lisp code for the respective atn system component

(defGeneric make-lisp-form (node)
  (:method ((node t)) (error "can't generate form for: ~s." node))
  (:documentation
   "generates the lisp expression for the respective atn system component.
   <p>
   the system is rewritten as a generic function which accepts one argument, the
   input sequence, and produces a sequence of parse states, each of the form
   <code>((<i>term</i> . <i>expression</i>) . <i>input length</i>)</code>,
   ordered by the length parsed.
   a primary wrapper method is specialized on the class <code>ATN-INPUT</code> token source which
   comprises an internal function for each non-terminals modeled in the system to implement
   the respective state machine. this method binds state variables for the results and for the
   input source as well as for internal functions to manipulate the parse state.</p>
   <p>
   additional auxiliary methods are provided to accept a token sequence - which wraps the
   sequence in an <code>ATN-INPUT</code> and delegates to that method, or a string - which
   tokenizes the string and delegates to the method for token sequences, or - where a tokenizer method
   is available for a stream, to accept a stream or a pathname as input.</p>
   <p>
   the generated function bind three special variables. the nature is not significant internal to the
   parser, as all functions are present withn the same lexical environment. the nbinding form facilitates
   access from external functions:
   <ul>
    <li><code>*ATN-INPUT</code> binds the input source</LI>
    <li><code>*ATN-MODE</code> binds <code>:SINGLE</code> or <code>:MULTIPLE</code> to indicate whether
     a successful parse should continue to seek alternatives.</li>
    <li><code>*ATN-REDUCE</code> indicates whether external reduction should occur where the parser is
     compiled to allow it.</li>
    <li><code>*ATN-REGISTER-WORDS</code> indicates whether terminal words should appear in the
     result where the parser is compiled to allow it.</li></ul></p>"))


(defMethod make-lisp-form ((node atn-system))
  "generates the toplevel expressions for an interpreter for the given atn system."
  (let* (;; (finally (system-finally-forms node))
         (documentation nil)
         (form nil)
         ;;(string-method nil)
         ;;(sequence-method nil)
         (*undefined-constructors nil))
    (declare (special *system-lexicon *parser-name
                      *tokenizer-name *grammar-pathname
                      *undefined-constructors))
    (unless (packagep *atn-token-package*)
      (error "token package not bound: ~s" *atn-token-package*))
    (intern-atn-system node)
    (flet ((date-string (time)
             (if (integerp time)
               (multiple-value-bind (second minute hour day month year)
                                    (decode-universal-time time)
                 (format nil "~2,'0d.~2,'0d.~2,'0dT~2,'0d:~2,'0d:~2,'0d"
                         year month day hour minute second))
               "**.**.**T**:**:**")))
      (setf documentation
            (format nil "// generated ~a~@[ based on ~{~s from ~a~}~].~%~a~%"
                    (date-string (get-universal-time))
                    (when (boundp '*grammar-pathname)
                      (list (namestring *grammar-pathname)
                            (date-string (file-write-date *grammar-pathname))))
                    (system-documentation node))))
    (let ((lexicon-flets
           (mapcar #'(lambda (category) (make-lisp-form category))
                   (atn-predicates *system-lexicon)))
          (net-flets
           (mapcar #'(lambda (net &aux form)
                       (setf form (make-lisp-form net))
                       form)
                   (system-nets node))))
      (flet ((index-variable-name (name)
               (intern (concatenate 'string (string name) "-INDEX") (symbol-package name))))
        (setf form
              `(progn
                 ;; bind the category predicates from the lexicon and
                 ;; the individual node functions. these require cross references.
                 ,@(mapcar #'(lambda (form) (cons 'defun form)) lexicon-flets)
                 ,@(mapcar #'(lambda (form) (cons 'defun form)) net-flets)
                 ,@(mapcar #'(lambda (net) `(setf (get ',(atn-name net) :production)
                                                  ,(atn-documentation net)))
                           (system-nets node))
                 #|(defGeneric ,*parser-name (input &key &allow-other-keys)
                   (:documentation ,documentation)
                   ,@string-method
                   ,@sequence-method)|#
                 ;; always do the main method
                 (defun ,*parser-name (*atn-input
                                       &key
                                       ((:trace *atn-trace*) *atn-trace*)
                                       ((:trace-nets *atn-trace-nets*) *atn-trace-nets*)
                                       ((:start-name *atn-start-name) ',*atn-start-name)
                                       ((:mode *atn-mode) :multiple)
                                       ((:reduce *atn-reduce*) t)
                                       ((:register-words *atn-register-words) nil)
                                       ;; this is likely to be wrapped in other functions, which may
                                       ;; use additional keywords
                                       &allow-other-keys
                                       &aux
                                       #| 20010311 don't capture the package  leave it to the tokenizer
                                          (*package*
                                          (find-package ,(package-name *atn-token-package*)))|#
                                       )
                   ,documentation
                   (declare (special *atn-reduce* *atn-mode *atn-input))
                   ;; bind the runtime state: the results and the level.
                   (let ((*atn-level 0)
                         ,@(when *atn-wfst
                             ;; where a wfst is enabled, use the start term to identify a table repository
                             '((*atn-wfst (|wfst-initialize| (|wfst-pop| *atn-start-name)))))
                         (*atn-stack '(,*parser-name)) ; the outermost term is the name of the function
                         (*atn-node nil)
                         (*atn-properties nil)
                         (*atn-class nil)
                         ;; bind a special variable for each production/net to save the input position 
                         ;; where the net is invoked. this will be used to cut off ineffective recursion.
                         ,@(mapcar #'(lambda (flet &aux (name (first flet)))
                                       (list (index-variable-name name) -1))
                                   net-flets)
                         (atn-net-names ',(mapcar #'first net-flets)))
                     (declare (special ,@(mapcar #'(lambda (flet) (index-variable-name (first flet)))
                                                 net-flets)))
                     (unless (find *atn-start-name atn-net-names)
                       (error "production not defined in system: ~s: ~s." *atn-start-name ',*parser-name))
                     (unless (fboundp *atn-start-name)
                       (error "parse function missing: ~s: ~s." *atn-start-name ',*parser-name))
                     ;; invoke the parser
                     (handler-bind
                       ((continuable-parser-error
                         #'(lambda (condition)
                             ;; continuable errors: signal up to the caller
                             (signal condition)))
                        (terminal-parser-error
                         #'(lambda (condition &aux (action (condition-action condition)))
                             ;; allow the condition to specify either to terminate and return nil, to continue
                             ;; or, otherwise, to signal up to the caller
                             (etypecase action
                               (null ) ; don't do anything
                               (keyword (ecase action
                                          (:abort
                                           (when *atn-trace*
                                             (warn "terminating parse on condition: ~a: Context ~s." condition *atn-input))
                                           (return-from ,*parser-name (values nil condition nil)))
                                          (:continue
                                           (when *atn-trace*
                                             (warn "continuing parse with condition: ~a: Context ~s." condition *atn-input))
                                           (continue condition))
                                          (:signal
                                           (when *atn-trace*
                                             (warn "signaling parse condition: ~a: Context ~s." condition *atn-input))
                                           (signal condition)
                                           (when *atn-trace*
                                             (warn "continuing parse with condition: ~a: Context ~s." condition *atn-input))
                                           (continue condition))))
                               (function (funcall action)))))
                        (error
                         #'(lambda (condition)
                             ;; let unexpected errors just percolate upwards.
                             (when *atn-trace*
                               (warn "parse raised condition: ~a." condition))
                             nil)))
                       (multiple-value-bind ,(if *atn-ambiguous '(result success) '(result index success))
                                            ,(if *atn-ambiguous
                                               '(atn-parse-substructure* *atn-start-name 0)
                                               (if (or *atn-trace* *atn-wfst)
                                                 '(atn-parse-substructure *atn-start-name 0)
                                                 '(funcall *atn-start-name 0)))
                         ,@(when *atn-wfst
                             '((|wfst-push| *atn-start-name *atn-wfst)))
                         (cond (success
                                (return-from ,*parser-name
                                  ,(if *atn-ambiguous
                                     `(progn
                                        (when (cdr result)
                                          (when *atn-trace*
                                            (warn "ambiguous results for term: ~s." *atn-start-name))
                                          ,@(when *atn-trace* '((inspect result)))
                                          (setf result (sort result #'> :key #'rest)))
                                        (destructuring-bind (result . index) (first result)
                                          (values result index (,*atn-input-eof-function index))))
                                     `(values result index (,*atn-input-eof-function index)))))
                               (t
                                (return-from ,*parser-name
                                  ,(if *atn-ambiguous
                                     '(values nil (reduce #'max result :key #'rest :initial-value 0) nil)
                                     '(values nil index nil)))))))))))))
    (when *undefined-constructors
      (warn "no constructors present for terms: ~s"
            (sort *undefined-constructors #'string-lessp)))
    (when *atn-save-definitions*
      (setf (symbol-atn-source *parser-name *parser-name) form))
    (values form *parser-name)))


#|

(cond ((not (eq *atn-start-name ',*atn-start-name))
                          (let ((net-functions
                                 (list ,@(mapcar #'(lambda (flet)
                                                     `(cons ',(first flet) #',(first flet)))
                                                 lexicon-flets)
                                       ,@(mapcar #'(lambda (flet)
                                                     `(cons ',(first flet) #',(first flet)))
                                                 net-flets)))
                                (start-function nil))
                            (setf start-function (rest (assoc *atn-start-name net-functions)))
                            (if start-function
                              (setf register (atn-parse-substructure *atn-start-name 0))
                              (error "production not defined in system: ~s: ~s."
                                     *atn-start-name ',*parser-name))))
                         (t
                          (setf register (atn-parse-substructure ',*atn-start-name 0))))
|#

;;
;;
;; rewrite an individual node within a net

;; i tried to force generation of the "current" item to see if this makes it easier to correlate the
;; bnf with the lexical constraints which apply when a token is generated. in practice, the effect was
;; difficult to predict, so i went back to generating them at the moment they are first demanded.
;; this means that, where lexical constraints are dynamic, they must at least remain constant over all
;; contexts which distinguish based on a given token.

(defun atn-documentation (node)
  (let ((system (atn-system node))
        (grammar nil)
        (rule nil))
    (when (and (typep system 'atn-system) (setf grammar (system-bnf-grammar system)))
      (when (setf rule (find (atn-name node) (bnf-phrase-rules grammar)
                               :key #'(lambda (rule) (bnf-name (bnf-lhs rule)))
                               :test #'string=))
        (with-output-to-string (stream) (pprint rule stream))))))

(defun c-node  (name)
  (declare (special *atn*))
  (or (find name (atn-nodes *atn*) :key #'atn-name)
      (error "node not found in atn: ~s: ~s." name *atn*)))


(defMethod make-lisp-form ((node atn))
  "each net is rewritten as its own function.
   within a net the nodes correspond to an individual production and, within that
   each arc correspond to the clauses of the respective production.
   note that for an EBNF net, the tests which an atn allows are always true.
   the generated function accepts asingle argument, the index in the input source, and
   <ul>
    <li>checks for unsuccessful recursion</li>
    <li>binds the net's result structure</li>
    <li>binds functions to manipulate the structure</li>
    <li>binds internal functions for teh respective nodes in the net.</li></ul>
   the input source is available through bindings provided by the system's outermost function."
  (let* ((net-name (atn-name node))
         (net-terms (atn-term-names node))
         (index-name (intern (concatenate 'string (string net-name) "-INDEX") (symbol-package net-name)))
         (form nil)
         (documentation (atn-documentation node))
         (functions nil))
    ;; (adjust-cardinality node nil)
    ;; (setf (get net-name :internal-time) 0) nb. should one want to enable this, the initialization must also be done at load time
    ;; (setf (get net-name :elapsed-time) 0)
    (setf form
          `(,net-name (index &aux
                             ;; ,@(when *atn-trace* '((start-time (get-internal-run-time)) (original-start-time start-time) (elapsed-time 0)))
                             ,@(mapcar #'(lambda (term) `(,term nil)) net-terms))
                      ,(string-trim #(#\return #\linefeed #\space)
                                    (format nil "~@[~a~%~]~s" documentation net-terms))
                      (declare (special ,index-name))
                      (declare (type fixnum index ,index-name *atn-level))
                      (declare (optimize (speed #+(or CMU scl) 1 #-(or CMU scl) ,(if *atn-trace* 1 3))
                                         (safety #+(or CMU scl) 3 #-(or CMU scl) ,(if *atn-trace* 3 0))))
                      (if ,(ecase (atn-recursion node)
                             ((:report :suppress) ;; if no progress has been made, cut off the parse
                              `(< ,index-name index))
                             (:allow t))
                        (let ((,index-name index)
                              (*atn-level (1+ *atn-level))
                              (*atn-stack (cons ',net-name *atn-stack))
                              ,@(when *atn-ambiguous '((atn-structure nil)))
                              ,@(atn-bindings node))
                          (declare (special ,index-name))
                          (declare (dynamic-extent *atn-stack))
                          (declare (type cons *atn-stack))
                          ;; otherwise bind the structure for use by the internal node functions
                          ;; and set the node name to the current position to check for recursion
                          (symbol-macrolet ((|item| (,*atn-input-function index)))
                            (%atn-block ,net-name
                              (labels ((succeed (index result)
                                         (setf *atn-term* ',net-name)
                                         ,@(atn-succeed-actions node)
                                         #|,@(when *atn-trace*
                                             `((incf (get ',net-name :internal-time) (+ elapsed-time (- (get-internal-run-time) start-time)))
                                               (setf (get ',net-name :elapsed-time)  (- (get-internal-run-time) original-start-time))))|#
                                         ,(if *atn-ambiguous
                                            (if (eq *atn-start-name net-name)
                                              ;; save parsed start terms only if they complete
                                              `(when (,*atn-input-eof-function index)
                                                 (push (cons result index) atn-structure))
                                              '(push (cons result index) atn-structure))
                                            `(return-from ,net-name (values result index t))))
                                       (fail (index)
                                         ,@(atn-fail-actions node)
                                         #|,@(when *atn-trace*
                                             `((incf (get ',net-name :internal-time) (+ elapsed-time (- (get-internal-run-time) start-time)))
                                               (setf (get ',net-name :elapsed-time)  (- (get-internal-run-time) original-start-time))))|#
                                         ,(if *atn-ambiguous
                                            'index
                                            `(return-from ,net-name (values nil index nil))))
                                       ,@(progn
                                             (setf functions (sort (mapcar #'make-lisp-form (atn-nodes node))
                                                                   #'string-lessp :key #'first))
                                           ;; ensure a refernce to allow #-Lispworks later
                                           functions))
                                ,@(unless *atn-ambiguous
                                    `((declare (inline succeed fail
                                                       #-(and LispWorks (or win32 (not lispworks4.3)))
                                                       ,@(mapcar #'first functions)))))
                                ;; to start invoke the function for the initial arc
                                ,@(atn-initial-actions node)
                                (,(atn-start node) index)
                                (setf *atn-node nil)
                                ,(when *atn-trace*
                                    (if *atn-ambiguous
                                      `(%atn-trace " [***/~a returning @ ~s = ~s." ',net-name index atn-structure)
                                      `(%atn-trace " [***/~a failed @ ~s." ',net-name index)))
                                ,(if *atn-ambiguous
                                   '(if atn-structure
                                      ;; if an ambiguous parse succeeded, then eliminate duplicate entries. this can happen where alternative
                                      ;; nonterminal paths yield the same wellformed subtree. for atomic reductions, the equal mthod would
                                      ;; need to be specialized
                                      (values atn-structure t nil)
                                      (values `((nil . ,index)) nil nil))
                                   '(fail index))))))
                        ;; control recursion
                        ,(ecase (atn-recursion node)
                             (:report `(warn "recursive grammar: ~s @ position ~s: ~s" ',net-name index *atn-stack))
                             ((:suppress :allow) 'nil)))))
    (setf (get net-name :terms) net-terms)
    form))

(defMethod make-lisp-form ((node atn-node))
  "generate a function for an individual node which sequences through its arc expressions."
  (let ((node-name (atn-name node))
        (node-bindings (atn-bindings node)))
    `(,node-name (index ,@(when node-bindings `(&aux ,@node-bindings)))
                 (%atn-node-block ,node-name 
                   ;; the java translator had a step here for consume edges. this was
                   ;; inexplicable as all tests are 't, the subsequent generation made
                   ;; no provision to skip consume edges. references to the manipulated
                   ;; 'item' variable were not found
                   ,@(atn-initial-actions node)
                   ,@(mapcar #'(lambda (edge &aux (edge-bindings (atn-bindings edge))
                                             (form (make-lisp-form edge)))
                                 (if edge-bindings
                                   `(let ,edge-bindings ,form)
                                   form))
                             (atn-edges node))))))


;;
;;
;; rewrite edges within a node

(defMethod make-lisp-form ((node cat-atn-edge))
  "rewrite edges to single statements within the body of the node function.
   each clause checks its respective constraint and if that applies, then runs
   any actions and concludes with the operation appropriate for the arc type."
  (let* ((atn (atn-net (atn-node node)))
         (fail (atn-fail node))
         (cat (atn-cat node))
         (end (atn-end node))
         (cat-predicate (make-lisp-predicate-name cat :if-does-not-exist :create))
         (register-name (category-name cat))
         (term-names (atn-term-names node))
         (constructor-specializer (atn-constructor-specializer node)))
    `(%atn-edge-block (cat ,register-name)
       ,@(atn-initial-actions node)
       (cond ((,cat-predicate |item|)
              (setf *atn-term* ',register-name)
              ,@(atn-actions node)
              ,@(subst `(if (eq *atn-reduce* t)
                          ,(if constructor-specializer
                             `(atn-reduce-item-with-context (function ,(make-constructor-name node register-name))
                                                            ,constructor-specializer ,@term-names)
                             `(atn-reduce-item (function ,(make-constructor-name node register-name))
                                               ,@term-names))
                          (if (eq *atn-reduce* 'cons)
                            (list ',register-name |item|)
                            ',register-name))
                       :result
                       (case (atn-term-cardinality atn register-name)
                         ((1 ?) `((setf ,register-name :result)))
                         ((+ *) `((setf ,register-name (cons :result ,register-name))))))
              ,@(atn-succeed-actions node)
              (,end (1+ index)))
             (t
              (setf *atn-term* ',register-name)
              ,@(atn-fail-actions node)
              ,(if fail `(,fail index) nil))))))


(defMethod make-lisp-form ((node cell-atn-edge))
  ;; no translation defined
  (call-next-method))


(defMethod make-lisp-form ((node consume-atn-edge))
  ;; no translation defined
  (call-next-method))


(defMethod make-lisp-form ((node fail-atn-edge))
  #|(let* ((atn-node (atn-node node))
         (net-name (atn-name (atn-net atn-node))))|#
  `(progn ,@(atn-actions node)
          (fail index)))


(defMethod make-lisp-form ((node jump-atn-edge))
  (let ((end (atn-end node)))
    `(%atn-edge-block (jump ,end)
       ,@(atn-actions node)
       (,end index))))


(defMethod make-lisp-form ((node or-atn-edge))
  "a special formulation for bnf disjunctions is plausible. it is a means to optimize parsing where the
   alternatives are exclusive. 
   it is not correct in the general case. where the sequencing is exclusive, the order expressed
   in the bnf could cause parses to fail falsely. in particular where a subtree is shared between
   two dominant forms, the earlier in the bnf may not lead to a complete parse.
   for example, wrt the xpath grammar, 'position()' begins with a QName, which could well begin
   a PathExpr, the success of which should not preclude the continued parse, which would reveal
   the correct FunctionCall parse.
   for example, in xquery of xml grammar, a QName begins with a NCName, which succeeds as such, an
   would preclude the Prefix ':' LocalPart form.
   some cases can be handled by reordering the bnf, but the indirect effects are difficult to
   fathom."
  (let ((fail (atn-fail node)))
    `(%atn-edge-block or
       ,@(atn-initial-actions node)
       (,(if *atn-ambiguous 'progn 'or)
        ,@(mapcar #'make-lisp-form (atn-edges node))
        ,@(atn-fail-actions node)
        ,(if fail `(,fail index) nil)))))
       

(defMethod make-lisp-form ((node pop-atn-edge))
  ;; once a node is satisifed, it augments the state. 
  ;; the edge is at the end of a function body, which means that the process continues
  ;; in the calling function.
  (declare (special *undefined-constructors))
  (let* ((register-name (atn-register node))
         (tests (make-lisp-test-form (atn-pop-tests (atn-net (atn-node node))) node))
         (term-names (atn-term-names node))
         (constructor-specializer (atn-constructor-specializer node)))
    `(%atn-edge-block (pop ,register-name)
       ,@(atn-initial-actions node)
       (when ,(or tests t)
         (setf *atn-term* ',register-name)
         (%atn-trace " [***/~a @ ~s reduce structure: ~a" ',register-name index
                     (list ,@(apply #'append (mapcar #'(lambda (term) `(',term ,term))
                                                     term-names))))
         ,@(atn-actions node)
         (let ((result-structure
                (if (eq *atn-reduce* t)
                  ,(let ((constructor (make-constructor-name node register-name)))
                     (if (find constructor *undefined-constructors)
                       `(if (fboundp ',constructor)
                          ;; if the constructor is still undefined, avoid a warning here
                          ,(if constructor-specializer
                             `(atn-reduce-structure-with-context ',constructor
                                                                 ,constructor-specializer ,@term-names)
                             `(atn-reduce-structure ',constructor ,@term-names))
                          (cons ',register-name (delete nil (list ,@term-names))))
                       (if *atn-trace*
                         (if constructor-specializer
                           `(atn-reduce-structure-with-context (function ,constructor)
                                                               ,constructor-specializer ,@term-names)
                           `(atn-reduce-structure (function ,constructor) ,@term-names))
                         `(,constructor ,@(when constructor-specializer (list constructor-specializer))
                                        ,@term-names))))
                  (if (eq *atn-reduce* 'cons)
                    (cons ',register-name (delete nil (list ,@term-names)))
                    ',register-name))))
           ,@(when *atn-trace*
               `((when (is-atn-trace)
                   (format *trace-output* " -> ~a: ~s" ',register-name result-structure))))
           ,@(atn-succeed-actions node)
           (succeed index result-structure))))))



(defMethod make-lisp-form ((node push-atn-edge))
  (let* ((atn (atn-net (atn-node node)))
         (fail (atn-fail node))
         (term-name (atn-net node))
         (end (atn-end node))
         (cardinality (atn-term-cardinality atn term-name)))
    (setf term-name (ensure-symbol term-name))
    `(%atn-edge-block (push ,term-name)
       ,@(atn-initial-actions node)
       ;; ,@(when *atn-trace* '((incf elapsed-time (- (get-internal-run-time) start-time))))
       (multiple-value-bind ,(if *atn-ambiguous '(result success) '(result result-index success))
                            ,(if *atn-ambiguous
                               `(atn-parse-substructure* ',term-name index)
                               (if (or *atn-trace* *atn-wfst)
                                 `(atn-parse-substructure ',term-name index)
                                 `(,term-name index)))
         ;; ,@(when *atn-trace* '((setf start-time (get-internal-run-time))))
         (cond ,(if *atn-ambiguous  ;; for an ambiguous grammar iterate over the options.
                  (let ((saved-term (gentemp (string term-name))))
                    `(success
                      (setf *atn-term* ',term-name)
                      ,@(atn-actions node)
                      (let ((,saved-term ,term-name))
                        (dolist (result-and-index result)
                          (destructuring-bind (result . result-index) result-and-index
                            ;; (print (list result-index result))
                            ,@(case cardinality
                                ((1 ?) `((when result (setf ,term-name result))))
                                ((+ *) `((when result (setf ,term-name (cons result ,term-name)))))
                                (t '((setf result result))))
                            ,@(atn-succeed-actions node)
                            (,end result-index))
                          (setf ,term-name ,saved-term)))))
                  `(success
                    ,@(atn-actions node)
                    ,@(case cardinality
                        ((1 ?) `((when result (setf ,term-name result))))
                        ((+ *) `((when result (setf ,term-name (cons result ,term-name)))))
                        (t '((setf result result))))
                    ,@(atn-succeed-actions node)
                    (,end result-index)))
               (t
                (setf *atn-term?* ',term-name)
                ,@(atn-fail-actions node)
                ,(if fail `(,fail index) nil)))))))



(defMethod make-lisp-form ((node test-atn-edge))
  (let* ((atn (atn-net (atn-node node)))
         (fail (atn-fail node))
         (test (atn-test node))
         (end (atn-end node))
         (test-predicate nil)
         (cardinality (atn-term-cardinality atn test))
         (term-names (atn-term-names node))
         (constructor-specializer (atn-constructor-specializer node)))
    (setf test-predicate (or (eq test t) (make-lisp-predicate-name test :if-does-not-exist :create)))
    `(%atn-edge-block (test ,test)
       ,@(atn-initial-actions node)
       (cond ((,test-predicate |item|)
              (setf *atn-term* ',test)
              ,@(atn-actions node)
              ,@(when cardinality
                  (subst `(if (eq *atn-reduce* t)
                            ,(if constructor-specializer
                             `(atn-reduce-item-with-context (function ,(make-constructor-name node test))
                                                            ,constructor-specializer ,@term-names)
                             `(atn-reduce-item (function ,(make-constructor-name node test))
                                               ,@term-names))
                            (if (eq *atn-reduce* 'cons)
                              (list ',test |item|)
                              ',test))
                         :result
                         (case cardinality
                           ((1 ?) `((setf ,test :result)))
                           ((+ *) `((setf ,test (cons :result ,test)))))))
              ,@(atn-succeed-actions node)
              (,end (1+ index)))
             (t
              (setf *atn-term?* ',test)
              ,@(atn-fail-actions node)
              ,(if fail `(,fail index) nil))))))             



(defMethod make-lisp-form ((node word-atn-edge))
  (let* ((atn (atn-net (atn-node node)))
         (fail (atn-fail node))
         (end (atn-end node))
         (word (atn-word node))
         (word-test nil)
         ;; intern it into the application's package
         (word-register (when *atn-register-words (intern (format nil "Word-~a" word))))
         (cardinality (atn-term-cardinality atn word-register))
         (term-names (atn-term-names node))
         (constructor-specializer (atn-constructor-specializer node)))
    (setf word (ensure-token word)
          word-test (etypecase word
                      (character `(= (char-code |item|) ,(char-code word)))
                      (cl:symbol `(,*atn-word-predicate |item| ',word))))
    `(%atn-edge-block (word ,word)
       ,@(atn-initial-actions node)
       (cond (,word-test
              (setf *atn-term* ',word)
              ,@(atn-actions node)
              ,@(when (and *atn-register-words cardinality)
                  (subst `(if (eq *atn-reduce* t)
                            ,(if constructor-specializer
                             `(atn-reduce-item-with-context (function ,(make-constructor-name node word-register))
                                                            ,constructor-specializer ,@term-names)
                             `(atn-reduce-item (function ,(make-constructor-name node word-register))
                                               ,@term-names))
                            (if (eq *atn-reduce* 'cons)
                              (list ',word |item|)
                              ',word))
                         :result
                         (case cardinality
                           ((1 ?) `((setf ,word-register :result)))
                           ((+ *) `((setf ,word-register (cons :result ,word-register)))))))
              ,@(atn-succeed-actions node)
              (,end (1+ index)))
             (t
              (setf *atn-term?* ',word)
              ,@(atn-fail-actions node)
              ,(if fail `(,fail index) nil))))))


;;
;;
;; categories

(defMethod make-lisp-form ((category atn-category))
  "rewrite a category to a predicate of one argument which performs the appropriate comparison
   for categories, the primitive and derived categories dominate and comprise either
   lexems or token ranges _or_ further categories. thus the <code>make-lisp-subform</code>
   methods to serve as second level generation operations with a distinct operator space."
  (let ((name (make-lisp-predicate-name category :if-does-not-exist :create))
        (elements (category-elements category)))
    (when (null name) (break))
    `(,name (item)
            (%atn-trace-form (and item (or ,@(mapcar #'make-lisp-subform elements)))))))

(defMethod make-lisp-subform ((node atn-category))
  (let ((name (make-lisp-predicate-name node :if-does-not-exist :create)))
    `(,name item)))

(defmethod make-lisp-subform ((node atn-lexem))
  ;; strings and characters may be present as lexemes
  (let ((name (atn-name node)))
    (if (characterp name)
      `(= (char-code item) ,(char-code name))
      `(,*atn-word-predicate item ',(ensure-token name)))))

(defmethod make-lisp-subform ((node bnf-tokenrange))
  (let ((from (rest (first (bnf-tokens node))))
        (to (rest (second (bnf-tokens node))))
        (negation (bnf-negation node)))
    (flet ((char-value (string)
             ;; check the radix and parse accordingly
             (cond ((and (> (length string) 2) (string-equal "#x" string :end2 2))
                    (parse-integer string :start 2 :radix 16))
                   ((and (> (length string) 1) (string-equal "x" string :end2 1))
                    (parse-integer string :start 1 :radix 16))
                   (t
                    (parse-integer string)))))
      (if negation
        `(not (<= ,(char-value from) (|byte-value| item) ,(char-value to)))
        `(<= ,(char-value from) (|byte-value| item) ,(char-value to))))))

(defmethod make-lisp-subform ((node bnf-tokenset))
  (flet ((char-value (string)
           ;; check the radix and parse accordingly
           (cond ((and (> (length string) 2) (string-equal "#x" string :end2 2))
                  (parse-integer string :start 2 :radix 16))
                 ((and (> (length string) 1) (string-equal "x" string :end2 1))
                  (parse-integer string :start 1 :radix 16))
                 (t
                  (parse-integer string)))))
    `(or ,@(mapcar #'(lambda (token &aux (value (rest token))
                                   (negation (bnf-negation node)))
                      (if negation
                        `(not (= ,(char-value value) (|byte-value| item)))
                        `(= ,(char-value value) (|byte-value| item))))
                  (bnf-tokens node)))))


;;
;;
;; tests

(defun lisp-procedure-call-form (proc)
  `(,(atn-proc-name proc) ,@(atn-proc-arguments proc)))

(defmethod make-lisp-test-form ((object null) (parent t))
  nil)

(defmethod make-lisp-test-form ((object atn-procedure-call) (parent atn-edge))
  (lisp-procedure-call-form object))

(defmethod make-lisp-test-form ((object atn-min-test) (parent pop-atn-edge))
  `(,(atn-proc-name object) index (first (atn-proc-arguments object))))

(defmethod make-lisp-test-form ((object atn-max-test) (parent pop-atn-edge))
  `(,(atn-proc-name object) index (first (atn-proc-arguments object))))

(defmethod make-lisp-test-form ((object atn-range-test) (parent pop-atn-edge))
  ;; max wurde in den cat/word-Kanten geprueft
  (let ((args (atn-proc-arguments object)))
  `(min index ,(first args))))

(defmethod make-lisp-test-form ((object atn-size-test) (parent pop-atn-edge))
  (let ((args (atn-proc-arguments object)))
    `(,(atn-proc-name object) index ,(first args))))


(defMethod make-constructor-name ((node t) name)
  (declare (special *undefined-constructors))
  (setf name (intern (concatenate 'string (string name) "-Constructor")))
  (unless (fboundp name)
    ;; (break)
    (pushnew name *undefined-constructors))
  name)
    




#+:digitool
(progn
  (pushnew '(%atn-edge-block . 1) ccl:*fred-special-indent-alist* :key #'first)
  (pushnew '(%atn-node-block . 1) ccl:*fred-special-indent-alist* :key #'first)
  (pushnew '(%atn-block . 1) ccl:*fred-special-indent-alist* :key #'first)
  nil)


(defGeneric %trace-properties (thing)
  (:method ((node atn))
           nil)
  (:method ((node atn-node))
           nil)
  (:method  :around ((node atn-basic))
           (when *atn-trace* (call-next-method)))
  (:method ((node atn-edge))
           (list* :start (atn-start node) :test (atn-test node)
                  (when (atn-actions node)
                    (list :actions (atn-actions node)))))
  (:method ((node atn-transition))
           (list* :end (atn-end node)
                  (call-next-method)))
  (:method ((node cat-atn-edge))
           (list* :cat (category-name (atn-cat node))
                  (call-next-method)))
  (:method ((node jump-atn-edge))
           `(:end ,(atn-end node)))
  (:method ((node or-atn-edge))
           (call-next-method))
  (:method ((node cell-atn-edge))
           (call-next-method))
  (:method ((node pop-atn-edge))
           (list* :register (atn-register node)
                 (call-next-method)))
  (:method ((node push-atn-edge))
           (list* :net (atn-net node)
                  (call-next-method)))
  (:method ((node test-atn-edge))
           (call-next-method))
  (:method ((node word-atn-edge))
           (list* :word (atn-word node)
                  (call-next-method))))
           



#|
(walk-atn-net (ccl:top-inspect-form) #'print 'atn-edge)
(let ((result nil))
  (walk-atn-net (ccl:top-inspect-form) #'(lambda (e) (push e result)) 'atn-edge)
  result)

(intern-atn-net (top-inspect-form))

;; obsolete
(defMethod translate-atn ((node atn-basic) (form (eql :lisp))
                          &key ((:register-words *atn-register-words) nil)
                          pathname stream (pretty t)
                          &aux result)
  (setf result (make-lisp-form node))
  (flet ((do-output (stream)
           (write result :stream stream :pretty pretty)
           (finish-output stream)))
    (cond (stream (do-output stream))
          (pathname
           (with-open-file (stream pathname :direction :output
                                   :if-does-not-exist :create
                                   :if-exists :supersede)
             (do-output stream))))
    result))

|#

:EOF

