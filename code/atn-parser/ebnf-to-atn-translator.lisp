;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='19980319' AUTHOR='BB' />
  <DELTA DATE='19980330' AUTHOR='BB' />
  <DELTA DATE='20010312' AUTHOR='JAA'>
   added external predicates with alternatives for names</DELTA>
  <DELTA DATE='20010312' AUTHOR='JAA'>
   added support for production id  names in grammar</DELTA>
  <DELTA DATE='20010620'>
   BUILD-ATN-EDGES for tokenset and tokenrange in order to enable regular expressions.
   up until now, they were not necessary, since the parser was directed at tokens.
   </DELTA>
  <DELTA DATE='20010718' AUTHOR='JCMA'>ignore decls cleaned up</DELTA>
  <DELTA DATE='20010909'>added <code>bnf-namestring</code> to allow specialization
   for non-symbol node names</code></DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "BNFP")

;;;
;;; bnf-reader (bnf-grammar :: <string>) => tokens :: <list>
;;; callparser (ebnf :: <symbol>, tokens :: <list>) => atn-structure :: <list>
;;; bnf-object-tree (atn-structure :: <list>) => object-model :: <ebnf-grammar>
;;; bnf-to-atn (object :: <ebnf-grammar>) => system :: <atn-system>
;;; java-form (system :: <atn-system>) => classes :: <java source>
;;; 

;;; 20010122.jaa java-atn-system back to atn-system, first token literally as name
;;; 20010330.jaa force suffix on node names to ensure that they are unique

(defmethod bnf-to-atn ((bnf-grammar-string string) &optional 
                       (atn-system (make-instance 'atn-system) defined-system))
  (let* ((tokens (bnf-reader bnf-grammar-string))
         (atn-structure (callparser 'ebnf tokens))
         (main-net-name nil)
         (bnf-grammar nil))
    (if (rest atn-structure)
      (warn "BNF-Grammatik ist mehrdeutig!"))
    (setf bnf-grammar (bnf-object-tree (caar atn-structure)))
    (when bnf-grammar
      ; (setf main-net-name (intern (string (first tokens))))
      ; (inspect bnf-grammar)
      (setf main-net-name (intern (bnf-name bnf-grammar)))
      (setf (system-parser-name atn-system)
            (intern (format nil "~A-Parser" main-net-name)))
      (unless defined-system
        (setf (system-name atn-system) main-net-name))
      (setf (system-main-net-name atn-system) main-net-name)
      (setf (bnf-documentation bnf-grammar)
            bnf-grammar-string)
      (bnf-to-atn bnf-grammar atn-system))))

#|
(bnf-to-atn "x ::= y y ::= z? ('b' | 'c')* z ::= 'd' 'e'")
;; "d e b b c"
(bnf-object-tree
 (caar (callparser 'ebnf (bnf-reader "x ::= y y ::= z? ('b' | 'c')* z ::= 'd' 'e'"))))
|#

(defparameter *comment-string* ";;;")
(defparameter *expression-cardinality* nil)
(defParameter *expression-terms* nil)
(defGeneric merge-cardinalities (context local)
  (:method ((context null) (local t)) local)
  (:method ((context (eql '*)) (local t)) '*)
  (:method ((context (eql '*)) (local (eql 0))) 0)
  (:method ((context (eql '+)) (local (eql '*))) '*)
  (:method ((context (eql '+)) (local (eql '+))) '+)
  (:method ((context (eql '+)) (local (eql '?))) '+)
  (:method ((context (eql '+)) (local (eql 1))) '+)
  (:method ((context (eql '+)) (local (eql 0))) '0)
  (:method ((context (eql '?)) (local (eql '*))) '*)
  (:method ((context (eql '?)) (local (eql '+))) '+)
  (:method ((context (eql '?)) (local (eql '?))) '?)
  (:method ((context (eql '?)) (local (eql 1))) '?)
  (:method ((context (eql '?)) (local (eql 0))) '0)
  (:method ((context (eql 1)) (local t)) local)
  (:method ((context (eql 0)) (local t)) 0))

(defun local-cardinality (local &optional (context *expression-cardinality*))
  (merge-cardinalities context local))

(defGeneric add-cardinalities (existing new)
  (:documentation "combine cardinalities within a sequence")
  (:method ((existing (eql '*)) (new t)) '*)
  (:method ((existing (eql '*)) (new (eql '+))) '+)
  (:method ((existing (eql '*)) (new (eql 1))) '+)
  (:method ((existing (eql '+)) (new t)) '+)
  (:method ((existing (eql '?)) (new (eql '*))) '*)
  (:method ((existing (eql '?)) (new (eql '+))) '+)
  (:method ((existing (eql '?)) (new (eql '?))) '?)
  (:method ((existing (eql '?)) (new (eql 1))) 1)
  (:method ((existing (eql '?)) (new (eql 0))) '?)
  (:method ((existing (eql 1)) (new (eql '*))) '+)
  (:method ((existing (eql 1)) (new (eql '+))) '+)
  (:method ((existing (eql 1)) (new (eql '?))) 1)
  (:method ((existing (eql 1)) (new (eql 1))) '+)
  (:method ((existing (eql 1)) (new (eql 0))) 1)
  (:method ((existing (eql 0)) (new t)) new))

(defGeneric multiply-cardinalities (existing new)
  (:documentation "combine cardinalities across an alternative")
  (:method ((existing (eql '*)) (new t)) '*)
  (:method ((existing (eql '*)) (new (eql '+))) '+)
  (:method ((existing (eql '*)) (new (eql 1))) '+)
  (:method ((existing (eql '+)) (new t)) '+)
  (:method ((existing (eql '?)) (new (eql '*))) '*)
  (:method ((existing (eql '?)) (new (eql '+))) '+)
  (:method ((existing (eql '?)) (new (eql '?))) '?)
  (:method ((existing (eql '?)) (new (eql 1))) 1)
  (:method ((existing (eql '?)) (new (eql 0))) '?)
  (:method ((existing (eql 1)) (new (eql '*))) '+)
  (:method ((existing (eql 1)) (new (eql '+))) '+)
  (:method ((existing (eql 1)) (new (eql '?))) 1)
  (:method ((existing (eql 1)) (new (eql 1))) 1)
  (:method ((existing (eql 1)) (new (eql 0))) 1)
  (:method ((existing (eql 0)) (new t)) new))
  
(defGeneric name= (name1 name2)
  (:method ((name1 cl:symbol) (name2 t)) (name= (symbol-name name1) name2))
  (:method ((name1 t) (name2 cl:symbol)) (name= name1 (symbol-name name2)))
  (:method ((name1 string) (name2 string)) (string= name1 name2)))

(defGeneric name-lessp (name1 name2)
  (:method ((name1 cl:symbol) (name2 t)) (name-lessp (symbol-name name1) name2))
  (:method ((name1 t) (name2 cl:symbol)) (name-lessp name1 (symbol-name name2)))
  (:method ((name1 string) (name2 string)) (string-lessp name1 name2)))

(defun add-expression-term (name &optional (cardinality  *expression-cardinality*))
  (let ((name.cardinality (assoc name *expression-terms* :test #'name=)))
    (if name.cardinality
      (setf (rest name.cardinality)
            (add-cardinalities (rest name.cardinality) cardinality))
      (setf *expression-terms*
            (acons name cardinality *expression-terms*)))))

(defun multiply-expression-term (name cardinality)
  (let ((name.cardinality (assoc name *expression-terms* :test #'name=)))
    (if name.cardinality
      (setf (rest name.cardinality)
            (multiply-cardinalities (rest name.cardinality) cardinality))
      (setf *expression-terms*
            (acons name cardinality *expression-terms*)))))

;;;
;;; Klassen zur internen BNF-Repraesentation
;;;

;;;
;;; Allgemeine Klassen
;;;

(cl:defclass bnf ()
  ())

(cl:defclass grammar ()
  ())

(cl:defclass bnf-grammar (grammar bnf)
  ((name :accessor bnf-name :initform nil)
   (lexical-rules :accessor bnf-lexical-rules :initform nil)
   (phrase-rules :accessor bnf-phrase-rules :initform nil)
   (documentation :accessor bnf-documentation :initarg :documentation :initform "")))

(defmethod print-object ((object bnf-grammar) stream)
  (if *print-pretty*
    (let ((*print-right-margin* 60))
      (format stream "~A Lexikalische Regeln~%~{~A~}~2%~A Strukturregeln~{~%~A~}"
              *comment-string*
              (bnf-lexical-rules object)
              *comment-string*
              (bnf-phrase-rules object)))
    (call-next-method)))

(cl:defclass ebnf-grammar (bnf-grammar)
  ())

;;; 
;;; BNF-Definition
;;;

(cl:defclass bnf-procedure-context (bnf)
  ((procedures :accessor bnf-procedures :initform nil :initarg :procedures)))

(cl:defclass bnf-definition (bnf-procedure-context)
  ((lhs :accessor bnf-lhs :initform nil :initarg :lhs)
   (rhs :accessor bnf-rhs :initform nil :initarg :rhs)
   (id :accessor bnf-id :initform nil :initarg :id)))

(defmethod initialize-instance :after ((object bnf-definition) &rest args)
  (declare (ignore args))
  (setf (bnf-definition (bnf-lhs object)) object))

(defmethod print-object ((object bnf-definition) stream)
  (if *print-pretty* 
    (format stream "~:[     ~;~:*{~2a} ~]~A ::=~{ ~A~}"
            (bnf-id object) (bnf-lhs object) (bnf-rhs object))
    (print-unreadable-object (object stream :identity t :type t)
      (princ (bnf-name (bnf-lhs object)) stream))))

(cl:defclass bnf-lexical-definition (bnf-definition)
  ())

(cl:defclass bnf-phrase-definition (bnf-definition)
  ())

;;;
;;; BNF-Expr
;;; Unterklassen: bnf-symbol, bnf-qexpr

(cl:defclass bnf-expr (bnf)
  ())

;;;
;;; BNF-QEXPR
;;;

(cl:defclass bnf-qexpr (bnf-expr)
  ((expression :accessor bnf-expression :initform nil :initarg :expression)))

(cl:defclass bnf-one-expr (bnf-qexpr)
  ())

(cl:defclass bnf-plus-expr (bnf-qexpr)
  ())

(cl:defclass bnf-rep-expr (bnf-qexpr)
  ())

(cl:defclass bnf-opt-expr (bnf-qexpr)
  ())

(defmethod print-object ((object bnf-qexpr) stream)
  (if *print-pretty* 
    (format stream "~A" (bnf-expression object)) 
    (print-unreadable-object (object stream :identity t :type t)
      (let ((*print-pretty* t))
        (format stream "~s~@[~a~]" (bnf-expression object)
                (typecase object
                  (bnf-one-expr nil)
                  (bnf-plus-expr "+")
                  (bnf-opt-expr "?")
                  (bnf-rep-expr "*")))))))

;; reformulated all as a normal methods.
;; in particular specialization on repetitions, in order to be able to override it
(defmethod print-object ((object bnf-plus-expr) stream)
  (call-next-method)
  (if *print-pretty* (princ #\+ stream)))

(defmethod print-object ((object bnf-rep-expr) stream)
  (call-next-method)
  (if *print-pretty* (princ #\* stream)))

(defmethod print-object ((object bnf-opt-expr) stream)
  (call-next-method)
  (if *print-pretty* (princ #\? stream)))

;;;
;;; BNF-GROUP
;;; 

(cl:defclass bnf-group (bnf-expr bnf-procedure-context)
  ((expressions :accessor bnf-expressions :initform nil :initarg :expressions)))

(defmethod print-object ((object bnf-group) stream)
  (if *print-pretty*
    (princ (bnf-expressions object) stream)
    (print-unreadable-object (object stream :identity t :type t)
      (let ((*print-pretty* t))
        (princ (bnf-expressions object) stream)))))

;;;
;;; BNF-ALTERNATIVE
;;;

(cl:defclass bnf-alternative (bnf-expr)
  ((expressions :accessor bnf-expressions :initform nil :initarg :expressions)))
   
(defmethod print-object ((object bnf-alternative) stream)
  (if *print-pretty*
    (format stream "(~{~A~^ | ~})" (bnf-expressions object))
    (print-unreadable-object (object stream :identity t :type t)
      (let ((*print-pretty* t))
        (format stream "(~{~A~^ | ~})" (bnf-expressions object))))))

;;;
;;; BNF-TOKENSET
;;;

(defclass bnf-tokenset (bnf-expr)
  ((negation :accessor bnf-negation :initform nil :initarg :negation)
   (tokens :accessor bnf-tokens :initform nil :initarg :tokens)))

(defmethod print-object ((object bnf-tokenset) stream)
  (cond ((null *print-pretty*)
         (call-next-method))
        (t (format stream "[~A~{~A~^ ~}]"
                   (if (bnf-negation object)
                     #\^ "")
                   (mapcar #'cdr (bnf-tokens object))))))

(defclass bnf-tokenrange (bnf-tokenset)
  ())

(defmethod print-object ((object bnf-tokenrange) stream)
  (cond ((null *print-pretty*)
         (call-next-method))
        (t (format stream "[~A~A-~A]"
                   (if (bnf-negation object)
                     #\^ "")
                   (cdr (bnf-range-min object))
                   (cdr (bnf-range-max object))))))

(defmethod bnf-range-min ((object bnf-tokenrange))
  (first (bnf-tokens object)))

(defmethod bnf-range-max ((object bnf-tokenrange))
  (second (bnf-tokens object)))

;;;
;;; BNF-TABLE-CELL
;;;

(defclass bnf-table-cell (bnf-expr)
  ((row :accessor bnf-cell-row :initform nil :initarg :row)
   (column :accessor bnf-cell-column :initform nil :initarg :column)
   (value :accessor bnf-cell-value :initform nil :initarg :value)))

;;;
;;; BNF-SYMBOL
;;; Unterklassen fuer terminale, in/direct-cat- und phrase-symbole 
;;; 

(cl:defclass bnf-symbol (bnf-expr)
  ((name :accessor bnf-name :initform nil :initarg :name)))

(defmethod print-object ((object bnf-symbol) stream)
  (if *print-pretty* (princ (bnf-name object) stream)
      (print-unreadable-object (object stream :type t)
        (format stream "~a" (bnf-name object)))))

(defMethod bnf-name ((object t))
  nil)

(defGeneric bnf-namestring (bnf-symbol)
  (:method ((datum bnf-symbol)) (bnf-namestring (bnf-name datum)))
  (:method ((datum cl:symbol)) (symbol-name datum)))

(cl:defclass bnf-nonterminal-symbol (bnf-symbol)
  ((definition :accessor bnf-definition :initarg :definition :initform nil)))

(cl:defclass bnf-terminal-symbol (bnf-symbol)
  ())

(defmethod print-object :before ((object bnf-terminal-symbol) stream)
  (if *print-pretty* (princ #\' stream)))

(defmethod print-object :after ((object bnf-terminal-symbol) stream)
  (if *print-pretty* (princ #\' stream)))

(defmethod bnf-definition (object)
  (declare (ignore object))
  nil)

(cl:defclass bnf-cat-symbol (bnf-nonterminal-symbol)
  ())

(cl:defclass bnf-direct-cat-symbol (bnf-cat-symbol)
  ())

(cl:defclass bnf-indirect-cat-symbol (bnf-cat-symbol)
  ())

(cl:defclass bnf-cell-symbol (bnf-cat-symbol)
  ())

(cl:defclass bnf-phrase-symbol (bnf-nonterminal-symbol)
  ())

;;;
;;; ATN-Structure Tree to BNF-Object-Tree
;;; 

(defun bnf-object-tree (atn-structure)
  (let ((*bnf-symbols* nil))
    (declare (special *bnf-symbols*))
    (if atn-structure
      (build-bnf-expr (make-instance 'ebnf-grammar)
                      atn-structure))))

(defun ensure-bnf-symbol (name)
  (declare (special *bnf-symbols*))
  (or (find name *bnf-symbols* :key #'bnf-name)
      (let ((bnf-symbol (make-instance 'bnf-symbol :name name)))
        (push bnf-symbol *bnf-symbols*)
        bnf-symbol)))

(defmethod build-bnf-expr ((object bnf-grammar) atn-structure)
  (let ((rules (build-bnf-expr (first atn-structure) (rest atn-structure)))
        (first-rule nil)
        (rule-name nil))
    (reclassify-bnf-symbols rules)
    (multiple-value-bind (lexical-rules phrase-rules)
                         (discriminate-bnf-rules rules)
      (setf (bnf-lexical-rules object) lexical-rules
            (bnf-phrase-rules object) phrase-rules)
      (when (setf first-rule  (or (first phrase-rules) (first lexical-rules)))
        (setf rule-name (bnf-name (bnf-lhs first-rule)))
        (setf (bnf-name object) rule-name))
      object)))

;; BNF-Symbole werden (wg. ihrer unterschiedlichen Behandlung im ATN-Formalismus)
;; in vier disjunkte Symbolklassen unterteilt:
;; eine terminale: bnf-terminal-symbol, drei nonterminale: 
;; bnf-direct-cat-symbol, bnf-indirect-cat-symbol, bnf-phrase-symbol

(defParameter *predicate-patterns*
  '("IS-~aToken" "IS-~:@(~a~)-TOKEN" "IS-~a" #|don't case shift: "IS-~:@(~a~)Token"|#))

(defGeneric make-lisp-predicate-name (category &key if-does-not-exist)
  (:method ((category atn-category) &rest args)
           (apply #'make-lisp-predicate-name (category-name category) args))
  (:method ((name string) &key (if-does-not-exist :error)
            ((:package *package*) *package*) &aux symbol)
           ;; 20010312 try alternatives
           (or (dolist (pattern *predicate-patterns*)
                 (when (and (setf symbol (find-symbol (format nil pattern name)))
                            (fboundp symbol))
                   (return symbol)))
               (ecase if-does-not-exist
                 ((nil) nil)
                 (:create (intern (format nil "IS-~a" name)))
                 (:error (error "no predicate for name: ~a." name))
                 (:warn (warn "no predicate for name: ~a." name)))))
  (:method ((category cl:symbol) &rest args)
           ;; must take care about the package here. that of the original symbol may not
           ;; be the desired one, since tah symbol may have been external in some
           ;; other package and simply visible where used. this was, eg. the case
           ;; with INCLUDE and IGNORE from the xml application
           (apply #'make-lisp-predicate-name (string category) args)))


(defun reclassify-bnf-symbols (rules)
  (declare (special *bnf-symbols*))
  (let (non-terminals)
    (dolist (bnf-symbol *bnf-symbols*)
      (if (typep bnf-symbol 'bnf-nonterminal-symbol)
        (let ((definition (find bnf-symbol rules :key #'bnf-lhs)))
          (if (null definition)
            ;; 20010122.jaa
            (let ((builtin-name (make-lisp-predicate-name (bnf-name bnf-symbol)
                                                          :if-does-not-exist nil)))
              (unless (and builtin-name (fboundp builtin-name) )
                (warn "Nonterminal ~A nicht definiert!?" (bnf-name bnf-symbol))))
            ;; (warn "~A nicht definiert!?" bnf-symbol)
            (let ((rhs (bnf-rhs definition)))
              (push bnf-symbol non-terminals)           
              (if (bnf-cell-descriptions-p rhs)
                (change-class bnf-symbol 'bnf-cell-symbol)
                (if (alternative-of-terminals-p rhs)
                  (change-class bnf-symbol 'bnf-direct-cat-symbol))))))
        (change-class bnf-symbol 'bnf-terminal-symbol)))
    (dolist (bnf-symbol non-terminals)
      (unless (or (typep bnf-symbol 'bnf-direct-cat-symbol)
                  (typep bnf-symbol 'bnf-cell-symbol))
        (let ((definition (find bnf-symbol rules :key #'bnf-lhs)))
          (change-class bnf-symbol
                        (if (alternative-of-cat-symbols-p (bnf-rhs definition))
                          'bnf-indirect-cat-symbol
                          'bnf-phrase-symbol)))))
    (values)))

(defgeneric bnf-cell-descriptions-p (expr)
  (:method (expr) (declare (ignore expr)) nil)
  (:method ((expr cons)) (every #'bnf-cell-descriptions-p expr))
  (:method ((expr bnf-group))
           (bnf-cell-descriptions-p (bnf-expressions expr)))
  (:method ((expr bnf-alternative))
           (every #'bnf-cell-descriptions-p (bnf-expressions expr)))
  (:method ((expr bnf-one-expr))
           (bnf-cell-descriptions-p (bnf-expression expr)))
  (:method ((expr bnf-table-cell))
           t))

(defgeneric alternative-of-terminals-p (expr)
  ;; auch anwendbar, wenn nur die nonterminalen Symbole als solche
  ;; klassifiziert sind
  (:method ((expr t))
           nil)
  (:method ((expr bnf-terminal-symbol)) 
           t)
  (:method ((expr bnf-table-cell)) 
           nil)
  (:method ((expr bnf-alternative))
           (every #'alternative-of-terminals-p (bnf-expressions expr)))
  (:method ((expr list))
           (unless (rest expr) (alternative-of-terminals-p (first expr))))
  (:method ((expr bnf-nonterminal-symbol))
           nil)
  (:method ((expr bnf-group))
           (alternative-of-terminals-p (bnf-expressions expr)))
  (:method ((expr bnf-one-expr))
           (alternative-of-terminals-p (bnf-expression expr))))

#|

(defun alternative-of-terminals-p (rhs)
  (flet ((terminalp (x)
           ;; alle nonterminalen Symbole sind als solche klassifiziert,
           ;; jedoch noch nicht alle terminalen!
           (and (typep x 'bnf-symbol)
                (not (typep x 'bnf-nonterminal-symbol)))))
       (if (typep (first rhs) 'bnf-alternative)
         (every #'terminalp
                (bnf-expressions (first rhs)))
         (typep (first rhs) 'bnf-terminal-symbol))))

(defgeneric terminal-expr-p (expr)
  (:method (expr) (declare (ignore expr)) nil)
  (:method ((expr bnf-terminal-symbol)) t)
  (:method ((expr bnf-group))
           (unless (rest (bnf-expressions expr))
             (terminal-expr-p (first (bnf-expressions expr)))))
  (:method ((expr bnf-one-expr))
           (terminal-expr-p (bnf-expression expr))))
|#

(defmethod alternative-of-cat-symbols-p ((object list))
  (unless (rest object)
    (alternative-of-cat-symbols-p (first object))))

(defmethod alternative-of-cat-symbols-p ((object bnf-symbol))
  ;; zum Zeitpunkt des Aufrufs, sind noch nicht alle Symbole
  ;; disjunkt klassifiziert
  (let ((definition (bnf-definition object)))
    ;; terminal, wenn keine definition
    (if definition
      (alternative-of-cat-symbols-p (bnf-rhs definition))
      t)))

(defmethod alternative-of-cat-symbols-p ((object bnf-tokenset))
  t)

(defmethod alternative-of-cat-symbols-p ((object bnf-one-expr))
  (alternative-of-cat-symbols-p (bnf-expression object)))

(defmethod alternative-of-cat-symbols-p ((object bnf-qexpr))
  nil)

(defmethod alternative-of-cat-symbols-p ((object bnf-table-cell))
  nil)

(defmethod alternative-of-cat-symbols-p ((object bnf-alternative))
  (every #'alternative-of-cat-symbols-p (bnf-expressions object)))

(defmethod alternative-of-cat-symbols-p ((object bnf-group))
  (let ((expressions (bnf-expressions object)))
    (unless (rest expressions)
      (alternative-of-cat-symbols-p (first expressions)))))

#|
(defmethod alternative-of-cat-symbols-p ((object bnf-group))
  (every #'alternative-of-cat-symbols-p (bnf-expressions object)))
|#

(defun discriminate-bnf-rules (rules)
  (let (lexical-rules phrase-rules)
    (dolist (rule rules)
      (cond ((typep (bnf-lhs rule) 'bnf-phrase-symbol)
             (change-class rule 'bnf-phrase-definition)
             (push rule phrase-rules))
            (t (change-class rule 'bnf-lexical-definition)
               (push rule lexical-rules))))
    (values (nreverse lexical-rules) (nreverse phrase-rules))))

(defmethod build-bnf-expr ((object (eql 'ebnf)) definitions)
  (mapcar #'(lambda (x) (build-bnf-expr (first x) (rest x)))
          definitions))

(defmethod build-bnf-expr ((object (eql 'definition)) forms)
  (let* ((symbolname (rest (assoc 'NONTERMINAL forms)))
        (id-form (rest (assoc 'ID forms)))
        (id (rest (assoc 'token id-form)))
        (rhs-forms (rest (assoc 'rhs forms))))
    (unless (and symbolname rhs-forms)
      (error "nonterminal and rule required: ~s." forms))
    (let* ((lhs (ensure-bnf-symbol symbolname))
;           (firstform (first rhs-forms))
           (lastform (first (last rhs-forms)))
;;           (before-proc (if (eq (first firstform) 'procedure) firstform))
           (procedures (if (eq (first lastform) 'procedures) lastform)))
      (change-class lhs 'bnf-nonterminal-symbol)
      ;(break)
      (make-instance 'bnf-definition
        :procedures (if procedures (build-procedures (rest procedures)))
        :id id
        :lhs lhs
        :rhs
        (mapcar #'(lambda (x) (build-bnf-expr (first x) (rest x)))
                (if procedures (butlast rhs-forms) rhs-forms))))))

(defun build-procedures (forms)
    (mapcar #'(lambda (x) (build-procedure (rest x)))
            (remove-if-not #'(lambda (x) (eq (first x) 'proc-call)) forms)))

(defun build-procedure (form)
  (labels ((collect-terminals (args)
             (if args
               (if (eq (caar args) 'token)
                 (cons (cdar args) (collect-terminals (rest args)))))))
    (if (= (length form) 4)
      (destructuring-bind ((r1 . calltime) (r2 . kind) (r3 . name) (r4 . args)) form
        (declare (ignore r1 r2 r3 r4))
        ;; Klassifizierung ausbauen
        (make-instance (determine-atn-procedure-class name)
          :kind kind
          :name name
          :arguments (collect-terminals (butlast (rest args)))
          :calltime calltime))
      (let ((name (cdar form))
            (args (cdadr form)))
        (make-instance (determine-atn-procedure-class name)
          :name name
          :arguments (collect-terminals (butlast (rest args))))))))

(defun determine-atn-procedure-class (name)
  (setf name (string name))
  (cond ((string-equal name "min")
         'atn-min-test)
        ((string-equal name "max")
         'atn-max-test)
        ((string-equal name "range")
         'atn-range-test)
        ((string-equal name "size")
         'atn-size-test)
        (t 'atn-procedure-call)))

(defun one-of-entry (form)
  (and (consp form) (eq (first form) 'oneof)))

(defmethod build-bnf-expr ((object (eql 'alternative)) forms)
  (make-instance 'bnf-alternative
    :expressions
    (mapcar #'(lambda (x) (build-bnf-expr (first x) (rest x)))
            (canonicalize-bnf-alternative forms))))

(defun canonicalize-bnf-alternative (forms)
  (if forms
    (let ((form1 (first forms)))
      (case (first form1)
        (oneof (canonicalize-bnf-alternative (rest forms)))
        (alternative (canonicalize-bnf-alternative (rest form1)))
        (otherwise (cons form1 
                         (canonicalize-bnf-alternative (rest forms))))))))

(defmethod build-bnf-expr ((object (eql 'qexpr)) forms)
  (let ((occurrence (assoc 'occurrence forms)))
    (make-instance (case (cdr occurrence)
                     (\? 'bnf-opt-expr)
                     (\* 'bnf-rep-expr)
                     (\+ 'bnf-plus-expr)
                     (t 'bnf-one-expr))
      :expression
      (let ((next (or (find 'symbol forms :key #'car)
                      (find 'group forms :key #'car)
                      (find 'tokenset forms :key #'car)
                      (find 'table-cell forms :key #'car))))
;        (break)
        (build-bnf-expr (first next) (rest next))))))

(defmethod build-bnf-expr ((object (eql 'tokenset)) forms)
  (setf forms (butlast (rest forms))) ;; Klammern weg
  (let ((tokenset (make-instance 'bnf-tokenset)))
    (when (eq (first (first forms)) 'negation)
      (setf forms (rest forms))
      (setf (bnf-negation tokenset) t))
    (let ((range (assoc 'tokenrange forms)))
      (when range
        (setf forms (list (first (rest range)) (third (rest range))))
        (change-class tokenset 'bnf-tokenrange)))
    (setf (bnf-tokens tokenset) forms)
    tokenset))

(defmethod build-bnf-expr ((object (eql 'table-cell)) forms)
    (setf forms (butlast (rest forms))) ;; Klammern weg
    (destructuring-bind ((reg1 . row) reg2 (reg3 . column) &optional reg4 value) forms
      (declare (ignore reg1 reg2 reg3 reg4))
      (make-instance 'bnf-table-cell
        :row (parse-integer row)
        :column (parse-integer column)
        :value (if value (cdr (third value)) ""))))

(defmethod build-bnf-expr ((object (eql 'group)) forms)
  (let ((procedures (assoc 'procedures forms)))
    (make-instance 'bnf-group
      :procedures (if procedures (build-procedures (rest procedures)))
      :expressions
      (mapcar #'(lambda (x) (build-bnf-expr (first x) (rest x)))
              (butlast (rest (if procedures (remove procedures forms) forms)))))))

(defmethod build-bnf-expr ((object (eql 'symbol)) name)
  (ensure-bnf-symbol name))

(defmethod build-bnf-expr ((object (eql 'symbol)) (subform cons))
  (let ((form (if (rest subform) (second subform) (first subform))))
    (build-bnf-expr (first form) (rest form))))

(defmethod build-bnf-expr ((object (eql 'terminal)) subform)
  (let ((token (cdr (second subform))))
    (change-class (ensure-bnf-symbol token) 'bnf-terminal-symbol)))

(defmethod build-bnf-expr ((object (eql 'nonterminal)) token)
  (change-class (ensure-bnf-symbol token) 'bnf-nonterminal-symbol))

;;;
;;; BNF-Grammar (BNF Object Tree) to ATN-Grammar
;;;


;;;
;;; NETZ-Konstruktion
;;;

(defmethod bnf-to-atn ((bnf-grammar null) &optional system)
  (declare (ignore system))
  nil)

(defmethod bnf-to-atn ((bnf-grammar bnf-grammar)
                       &optional (*system* (make-instance 'atn-system)))
  (let* ((*atn-words* nil)
         (lexical-rules (bnf-lexical-rules bnf-grammar))
         (phrase-rules (bnf-phrase-rules bnf-grammar))
         (lexicon (build-atn-lexicon lexical-rules))
         (predicates (atn-predicates lexicon))
         (*atn-register-words (if (boundp '*atn-register-words) *atn-register-words t))
         (nets (mapcar #'build-atn phrase-rules)))
    ;; includes a binding to the register-words setting to permit translation
    ;; to an atn independent of complete compilation
    ;(break)
    (unless (system-documentation *system*)
      (setf (system-documentation *system*) (bnf-documentation bnf-grammar)))
    (setf (system lexicon) *system*)
    (setf (system-bnf-grammar *system*) bnf-grammar)
    (dolist (net nets)
      (ensure-category-objects (atn-nodes net) predicates)
      (setf (atn-system net) *system*))
    (setf (system-lexicon *system*)
          lexicon
          (system-nets *system*)
          nets)
    (setf (atn-words lexicon) *atn-words*)
    *system*))

;; 20010216.jaa allow for second level in edges for disjunctions
(defun ensure-category-objects (nodes categories)
  (labels ((ensure (edge)
           (typecase edge
             (cat-atn-edge
              (let ((category (find (atn-cat edge) categories :key #'category-name
                                    :test #'equal)))
                (if category (setf (atn-cat edge) category)
                    (warn "Kategorie namens ~A nicht gefunden!" (atn-cat edge)))))
             (or-atn-edge
              (dolist (edge (atn-edges edge)) (ensure edge))))))
    (dolist (node nodes)
      (dolist (edge (atn-edges node))
        (ensure edge)))))

(defmethod build-atn ((object bnf-definition)) ; phrase-rule
  (let ((*counter 0)
        (*netnodes nil)
        (*netname (bnf-namestring (bnf-lhs object)))
        (*expression-terms* nil))
    (declare (special *counter *netname *netnodes))
    (let ((start (build-node-name "start")))
      (build-atn-nodes *netname start (bnf-rhs object) (build-node-name))
      ; (map nil #'print *netnodes)
      (let ((net (atn-canonic-form 'defatn 
                                   (list (intern *netname) start :nodes 
                                         *netnodes))))
        (setf (atn-procedures net) (bnf-procedures object)
              (atn-terms net) (sort *expression-terms* #'name-lessp
                                    :key #'first))
        net))))

(defun build-atn-nodes (netname from transitions to &aux fail)
  (ensure-node-form to `((pop ,netname)))
  (setf fail (build-node-name "fail"))
  (ensure-node-form fail `((fail)))
  (atn-seq-nodes from transitions to fail))

(defun build-node-name (&optional to)
  ;; the name must always get a suffix to distinguish terms which appear more than once
  (declare (special *counter *netname))
  (intern (format nil "~A~@[/~a~].~d" *netname to (incf *counter))))

(defun ensure-node (node-name)
  (declare (special *netnodes))
  (or (find node-name *netnodes :key #'first)
      (let ((node (list node-name)))
        (push  node *netnodes)
        node)))


;; 20010321.jaa factored into two methods to account for an empty RHS.
;; although not expressible as bnf, this is intended to account for EMPTY content

(defMethod atn-seq-nodes (from (transitions cons) to fail &aux names)
  (flet ((build (start transition target)
           (ensure-node-form start (build-atn-edges transition target fail))))
    (dotimes (i (1- (length transitions)))
      (push (build-node-name to) names))
    (setf names (nreverse names))
    (map nil #'build (cons from names) transitions (append names (list to)))))

(defMethod atn-seq-nodes (from (transitions null) to fail)
  (declare (ignore fail))
  (ensure-node-form from `((jump ,to))))

(defun ensure-node-form (name edges)
  (rplacd (ensure-node name) edges))

#|(defun atn-one-expr-nodes (from transition to required)
  (ensure-node-form
   from
   (let ((edges (build-atn-edges transition to)))
     (if required edges (nconc edges `((jump ,from ,to)))))))|#

;; group, qexpr, bnf-terminal-symbol, bnf-cat-symbol, bnf-phrase-symbol

(defmethod build-atn-edges ((object bnf-cat-symbol) to fail)
  (add-expression-term (bnf-name object))
  `((cat ,(bnf-name object) ,to ,fail)))

(defmethod build-atn-edges ((object bnf-phrase-symbol) to fail)
  (add-expression-term (bnf-name object))
  `((push ,(bnf-name object) ,to ,fail)))

(defmethod build-atn-edges ((object bnf-terminal-symbol) to fail)
  (when *atn-register-words
    (add-expression-term (bnf-name object)))
  `((word ,(bnf-name object) ,to ,fail)))

(defmethod build-atn-edges ((object bnf-cell-symbol) to fail)
    `((cell ,(bnf-name object) ,to ,fail)))

;; 20010122.jaa permit this to test with a builtin function
(defmethod build-atn-edges ((object bnf-nonterminal-symbol) (to t) fail)
  ;(error "BUILD-ATN-EDGES fuer (~A ~A) waehrend bauen des ATN!?" (bnf-name object) (type-of object))
  (add-expression-term (bnf-name object))
  `((test ,(bnf-name object) ,to ,fail)))

#|
(defmethod build-atn-edges ((object bnf-table-cell) to)
  (inspect object)
  (error "bae"))
|#

(defmethod build-atn-edges ((object bnf-one-expr) to fail)
  (let ((*expression-cardinality* (local-cardinality 1)))
    (build-atn-edges (bnf-expression object) to fail)))

(defmethod build-atn-edges ((object bnf-opt-expr) to (fail t))
  (let ((*expression-cardinality* (local-cardinality '?)))
    (build-atn-edges (bnf-expression object) to to)))

;;; Problem function call stack
(defun atn-loop-nodes (from transitions to fail)
  (labels ((last-node (node-name)
             (ensure-node-form node-name `((jump ,to) (jump ,from))))
           (nodes (from transitions)
             (if transitions
               (let ((target (build-node-name to)))
                 (ensure-node-form 
                  from
                  (build-atn-edges (first transitions) target fail))
                 (nodes target (rest transitions)))
               (last-node from))))
    (nodes from transitions)))

#|(defmethod build-atn-edges ((object bnf-plus-expr) to)
  (let ((loop-start (build-node-name)))
    (atn-loop-nodes loop-start (list (bnf-expression object)) to)
    `((jump ,loop-start)))) 

(defmethod build-atn-edges ((object bnf-plus-expr) to (fail t))
  (let ((loop-start (build-node-name (bnf-name object)))
        (*expression-cardinality* (local-cardinality '+)))
    (atn-loop-nodes loop-start (list (bnf-expression object)) to nil)
    `((jump ,loop-start))))

(defmethod build-atn-edges ((object bnf-plus-expr) to fail)
  (let ((one-edges (build-atn-edges (bnf-expression object) to fail))
        (loop-start (build-node-name (bnf-name object))))
    (atn-loop-nodes loop-start (list (bnf-expression object)) to to)
    `(,@one-edges (jump ,loop-start))))

(defmethod build-atn-edges ((object bnf-rep-expr) to (fail t))
  (let ((loop-start (build-node-name (bnf-name object))))
    (atn-loop-nodes loop-start (list (bnf-expression object)) to to)
    `((jump ,loop-start))))
|#

(defmethod build-atn-edges ((object bnf-plus-expr) to fail)
  (let ((loop (build-node-name (bnf-name object)))
        (*expression-cardinality* (local-cardinality '+)))
    (ensure-node-form 
     loop
     (build-atn-edges (bnf-expression object) loop to))
    (build-atn-edges (bnf-expression object) loop fail)))

(defmethod build-atn-edges ((object bnf-rep-expr) to (fail t))
  (let ((loop (build-node-name (bnf-name object)))
        (*expression-cardinality* (local-cardinality '*)))
    (let ((edges (build-atn-edges (bnf-expression object) loop to)))
      (ensure-node-form loop edges)
      edges)))

(defmethod build-atn-edges ((object bnf-group) to fail)
  (let* ((expressions (bnf-expressions object))
         (procedures (bnf-procedures object))
         (edges nil))
    (setf edges (if (null (rest expressions))
                  (build-atn-edges (first expressions) to fail)
                  (build-atn-edges expressions to fail)))
    (if procedures
      `(group ,procedures ,edges)
      edges)))

(defmethod build-atn-edges ((objects cons) to fail)
  ;; build sequence without a fail continuation. this will continue with to if it
  ;; succeeds, ot return if it does not, in which case the continuation to fail
  ;; will be with the current state, rather than that accumulated during the sequence
  (let ((next (build-node-name to)))
    (atn-seq-nodes next objects to nil)
    (if fail
      `((jump ,next) (jump ,fail))
      `((jump ,next)))))

#|
;; 20010217.jaa replaced with a form which allows subsequent translation
;; to recognize that thsi was an alternative
(defmethod build-atn-edges ((object bnf-alternative) to)
  (mapcan #'(lambda (x &aux edges branch-terms)
              (let ((*expression-terms* *expression-terms*))
                (setf edges (build-atn-edges x to)
                      branch-terms *expression-terms*))
              (dolist (term.cardinality (butlast branch-terms))
                (add-expression-term (first term.cardinality)
                                     (rest term.cardinality)))
              edges)
          (bnf-expressions object)))


;;
;; 20010401 changed to construct the conditional explicitly

|#
;;(defParameter *cardinalities* nil)

(defmethod build-atn-edges ((object bnf-alternative) to fail
                            &aux collected-branch-terms collected-edges)
  (declare (special *netname))
  ;; (print (list :before *netname object))
  (setf collected-edges (mapcan #'(lambda (branch &aux edges branch-terms)
                                     (let ((*expression-terms* nil))
                                       (setf edges (build-atn-edges branch to nil)
                                             branch-terms *expression-terms*))
                                     (let ((*expression-terms* collected-branch-terms))
                                       (dolist (term.cardinality branch-terms)
                                         (multiply-expression-term (first term.cardinality)
                                                                   (rest term.cardinality))
                                         ;; (print (list term.cardinality *expression-terms*))
                                         )
                                       (setf collected-branch-terms *expression-terms*))
                                     ;; (print (list :after branch branch-terms collected-branch-terms))
                                     edges)
                                (bnf-expressions object)))
  (dolist (term.cardinality collected-branch-terms)
    (add-expression-term (first term.cardinality) (rest term.cardinality))
    ;; (print (list term.cardinality *expression-terms*))
    )
  ;; (print (list :after *netname object *expression-terms*))
  `((or ,collected-edges
       ,to
       ,fail)))


#| this does not work, since the later clauses get the modified state
(defmethod build-atn-edges ((object bnf-alternative) to fail)
  (let* ((base-name (build-node-name (bnf-name object)))
         (this-node (build-node-name base-name))
         (next-node (build-node-name base-name))
         (first-node this-node))
    (dolist (expressions (bnf-expressions object))
      (ensure-node-form this-node (build-atn-edges expressions to next-node))
      (setf this-node next-node
            next-node (build-node-name base-name)))
    (ensure-node-form this-node `((jump ,fail)))
    `((jump ,first-node))))
|#

;; 20010618 - added tokenset and tokenrange

(defmethod build-atn-edges ((object bnf-tokenset) to fail)
  (declare (special *netname))
   (destructuring-bind ((cat . token-string)) (bnf-tokens object)
     (declare (ignore cat))
     (if (bnf-negation object)
       `((test (tokenset (not ,token-string)) ,to ,fail))
       `((test (tokenset ,token-string) ,to ,fail)))))

(defmethod build-atn-edges ((object bnf-tokenrange) to fail)
  (declare (special *netname))
  (destructuring-bind ((cat1 . token-min) (cat2 . token-max)) (bnf-tokens object)
    (declare (ignore cat1 cat2))
    (setf token-min (char token-min 0)
          token-max (char token-max 0))
    (if (bnf-negation object)
      `((test (token-range (not ,token-min ,token-max)) ,to ,fail))
      `((test (token-range ,token-min ,token-max) ,to ,fail)))))


;;;
;;;
;;; 20010219.jaa name generation for expressions
(defMethod bnf-namestring ((object bnf-qexpr))
  (bnf-namestring (bnf-expression object)))
(defMethod bnf-namestring ((object bnf-opt-expr))
  (let ((stem (call-next-method)))
    (when stem (concatenate 'string stem "?"))))
(defMethod bnf-namestring ((object bnf-rep-expr))
  (let ((stem (call-next-method)))
    (when stem (concatenate 'string stem "*"))))
(defMethod bnf-namestring ((object bnf-plus-expr))
  (let ((stem (call-next-method)))
    (when stem (concatenate 'string stem "+"))))
(defMethod bnf-namestring ((object bnf-group))
  (flet ((list-name (list)
           (apply #'concatenate 'string
                  (apply #'append
                         (maplist #'(lambda (list)
                                      (list* (bnf-namestring (first list))
                                             (when (rest list) '(","))))
                                  list)))))
    (concatenate 'string "(" (list-name (bnf-expressions object)) ")")))
(defMethod bnf-namestring ((object bnf-alternative))
  (flet ((list-name (list)
           (apply #'concatenate 'string
                  (apply #'append
                         (maplist #'(lambda (list)
                            (list* (bnf-namestring (first list))
                                   (when (rest list) '("."))))
                                  list)))))
    (concatenate 'string (list-name (bnf-expressions object)))))
(defMethod bnf-namestring ((object bnf-definition)) (bnf-namestring (bnf-lhs object)))
(defMethod bnf-namestring ((object string)) object)
(defMethod bnf-namestring ((object t)) nil)


;;;
;;; Aufbau des LEXIKONS
;;;

(defun build-atn-lexicon (lexical-rules)
  (loop with lexems 
        for rule in lexical-rules
        for lhs = (bnf-lhs rule)
        if (typep lhs 'bnf-direct-cat-symbol)
        do (let ((cat (bnf-name lhs)))
             (dolist (lexem (collect-alternatives rule))
               (push (list lexem cat) lexems)))
        if (or (typep lhs 'bnf-indirect-cat-symbol)
               (typep lhs 'bnf-cell-symbol))
        collect (cons (bnf-name lhs) (collect-alternatives rule)) into predicates
        finally (return ;; allegro does not recognize finally keywords
                 (atn-canonic-form 
                  'deflexicon `(:lexems ,lexems :predicates ,predicates)))))

;; 20010206.jaa modified to support differentiation in later compilation
;; returning the instances rather than just the names
(defmethod collect-alternatives ((object bnf-definition))
  (mapcan #'collect-alternatives (bnf-rhs object)))

(defmethod collect-alternatives ((object bnf-alternative))
  (mapcan #'collect-alternatives (bnf-expressions object)))

(defmethod collect-alternatives ((object bnf-group))
  (mapcan #'collect-alternatives (bnf-expressions object)))

(defmethod collect-alternatives ((object bnf-one-expr))
  (collect-alternatives (bnf-expression object)))

(defmethod collect-alternatives ((object bnf-expr))
  (warn "bnf alternative ignored: ~s." object)
  nil)

(defmethod collect-alternatives ((object bnf-nonterminal-symbol))
  ;; to support non-terminals as primitive references in lexicon
  (list (bnf-name object)))

(defmethod collect-alternatives ((object bnf-terminal-symbol))
  (list (bnf-name object)))

(defmethod collect-alternatives ((object bnf-direct-cat-symbol))
  (list (bnf-name object)))

(defmethod collect-alternatives ((object bnf-indirect-cat-symbol))
  (list (bnf-name object)))

(defmethod collect-alternatives ((object bnf-tokenset))
  (list object))

(defmethod collect-alternatives ((object bnf-table-cell))
  (list object))

;;(mapcar #'collect-alternatives (bnf-lexical-rules bg))

