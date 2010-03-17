;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010205' AUTHOR='JAA'>
   added ATN-BUILTIN-PREDICATE-CATEGORY to denote builtin predicate functions
   </DELTA>
  <DELTA DATE='20010507'>replaced ENSURE-SYMBOL reference with equivalent code
   </DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#


(in-package "BNFP")

(defclass atn-basic ()
    ())

(defclass atn-system (inference-system atn-basic)
  ((parser-name :accessor system-parser-name :initform nil)
   (main-net-name :accessor system-main-net-name :initform nil)
   (finally-forms :accessor system-finally-forms :initform nil)
   (nets :accessor system-nets :initform nil)
   (lexicon :accessor system-lexicon :initform nil)
   (bnf-grammar :accessor system-bnf-grammar :initform nil)
    ;;; wird ueberfluessig
   ;(grammar :accessor system-grammar :initform nil :initarg :grammar)
   (source-file :accessor system-source-file :initform nil)
   (parser :accessor system-parser :initform nil)))

(defmethod atn-predicates ((object atn-system))
  (let ((lexicon (system-lexicon object)))
    (if lexicon (atn-predicates lexicon))))

(defmethod print-object ((object atn-system) stream)
  (print-unreadable-object (object stream :type t :identity nil)
    (format stream "~A {~D, ~D}"
            (system-name object)
            (length (system-nets object))
            (length (atn-predicates object)))))

(defmethod get-atn ((object atn-system) (name cl:symbol))
  (find name (system-nets object) :key #'atn-name))

(defmethod get-atn ((object atn-system) (name string))
  (flet ((name-equal (x) (string-equal (string (atn-name x)) name)))
    (find-if #'name-equal (system-nets object))))

#|
(defmethod system-lexical-rules ((system atn-system))
  (lexical-rules (system-grammar system)))

(defmethod system-phrase-rules ((system atn-system))
  (phrase-rules (system-grammar system)))
|#
;;;
;;; Netz-Einheiten
;;;

(defclass atn-unit (inference-unit atn-basic)
    ())

;; these are likely to be generated dynamically, based on
;; node content...

(defGeneric atn-succeed-actions (node)
  (:method ((node atn-unit)) (atn-continue-actions node)))

(defGeneric atn-fail-actions (node)
  (:method ((node atn-unit)) (atn-continue-actions node)))

(defGeneric atn-continue-actions (node)
  (:method ((node atn-unit)) nil))

(defGeneric atn-initial-actions (node)
  (:method ((node atn-unit)) nil))

(defGeneric atn-bindings (node)
  (:method ((node atn-unit)) nil)) 


;;; Netze

(defclass atn (atn-unit)
    ((name :accessor atn-name :initform nil :initarg :name)
     (system :accessor atn-system :initform nil :initarg :name)
     (nodes :accessor atn-nodes :initform nil :initarg :nodes)
     (start :accessor atn-start :initform nil :initarg :start)
     (pop-edges :accessor atn-pop-edges :initform 'null :initarg :ends)
     (callers :accessor atn-caller-edges :initform 'null :initarg :callers)
     (size-test :accessor atn-limit ;; deprecated
                :accessor atn-size-test
                 :initform 'null :initarg :size-test)
     (procedures :accessor atn-procedures :initform nil :initarg :procedures)
     (terms :accessor atn-terms :initform nil :initarg :terms
            :documentation
            "binds an a-list of terms and their effective cardinality. this
             is used to determine how to collect results.")
     (recursion :accessor atn-recursion :initform :report :initarg :recursion
                :documentation
                "specifies how to handle recursive activation. a left-recursive
                 grammar is likely to recursively iterate over optional phrases
                 and must be allowed to recurse for those terms.
                 (member :report :suppress :allow)")
     ;; finally deprecated
     (finally :accessor atn-finally :initform nil :initarg :finally)))

(defmethod basic-net-p ((object atn))
  (flet ((no-push-edge-p (node) (notany #'push-edge-p (atn-edges node))))
    (every #'no-push-edge-p (atn-nodes object))))

(defmethod print-object ((object atn) stream)
  (if *print-pretty*
    (format stream "(defatn ~A ~A ~@[~%  :nodes (~{~A~^~%~})~])"
            (atn-name object)
            (atn-start object)
            (atn-nodes object))
    (print-unreadable-object (object stream :type t)
      (format stream "~A {~D}" (atn-name object) (length (atn-nodes object))))))

(defMethod atn-term-cardinality ((node atn) name)
  (rest (assoc name (atn-terms node) :test #'string=)))

(defun procedure-limit-list (procedure)
  (mapcar #'(lambda (x) (if (stringp x) (parse-integer x) x))
          (atn-proc-arguments procedure)))

(defmethod atn-caller-edges :around ((object atn))
  (let ((callers (call-next-method)))
    (if (eq callers 'null)
      (setf (atn-caller-edges object)
            (compute-atn-caller-edges (system-nets (atn-system object)) (atn-name object)))
      callers)))

(defmethod atn-pop-edges :around ((object atn))
  (let ((pops (call-next-method)))
    (if (eq pops 'null)
      (setf (atn-pop-edges object)
            (compute-atn-pop-edges (atn-nodes object)))
      pops)))

(defun compute-atn-pop-edges (nodes)
  (loop for node in nodes
        append (remove-if (complement #'pop-edge-p) (atn-edges node))))

(defun compute-atn-caller-edges (nets name &aux edges)
  (dolist (net nets edges)
    (dolist (node (atn-nodes net))
      (dolist (edge (atn-edges node))
        (if (and (push-edge-p edge) (equal (atn-name edge) name))
          (push edge edges))))))

;;; Knoten

(defclass atn-node (atn-unit)
    ((net :accessor atn-net :initform nil :initarg :net)
     (name :accessor atn-name :initform nil :initarg :name)
     (edges :accessor atn-edges :initform nil :initarg :edges)))

(defmethod print-object ((object atn-node) stream)
  (if *print-pretty*
    (format stream "(~A ~{~%~A~})"
            (atn-name object)
            (atn-edges object))
    (print-unreadable-object (object stream :type t)
      (write (atn-name object) :stream stream))))

;;; Kanten

(defclass atn-edge (atn-unit)
    ((node :accessor atn-node :initarg :node :initform nil)
     (start :accessor atn-start :initarg :start :initform nil)
     (test :accessor atn-test :initarg :test :initform t)
     (actions :accessor atn-actions :initarg :actions :initform nil)
     (constructor-specializer :accessor atn-constructor-specializer
                              :initarg :constructor-specializer :initform nil)))

(defmethod print-object ((object atn-edge) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "~s/?~s/~s"
            (atn-start object) (atn-test object) (atn-actions object))))

;; 20010331.jaa added an explicit fail continuation to the transition edge.
;; otherwise an edge sequenc eis necessary, whereby the succeedor transition
;; in the sequence is taken both for success and failure.
;; this makes it difficult to code for tail calls when translating.
(defclass atn-transition (atn-edge)
    ((end :accessor atn-end :initarg :end :initform nil)
     (fail :accessor atn-fail :initarg :fail :initform nil)))

(defmethod print-object ((object atn-transition) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "~s/?~s/~s -> ~s|~s"
            (atn-start object) (atn-test object) (atn-actions object)
            (atn-end object) (atn-fail object))))

(defclass consume-atn-edge (atn-transition)
  ())

(defclass pop-atn-edge (atn-edge)
    ((register :accessor atn-register :initarg :register)))

(defmethod print-object ((object pop-atn-edge) stream)
  (if *print-pretty*
    (format stream "(pop ~A)"
            (atn-register object))
    (call-next-method)))

(defClass fail-atn-edge (atn-edge) ())

(defmethod print-object ((object fail-atn-edge) stream)
  (if *print-pretty*
    (format stream "(fail ~A)"
            (atn-register object))
    (call-next-method)))

(defclass word-atn-edge (consume-atn-edge)
    ((word :accessor atn-word :initform nil :initarg :word)))

(defmethod print-object ((object word-atn-edge) stream)
  (if *print-pretty*
    (format stream "(word |~A| ~A)"
            (atn-word object)
            (atn-end object))
    (print-unreadable-object (object stream :type t)
      (format stream "~s ~s/~s/~s"
              (atn-word object)
              (atn-start object) (atn-test object) (atn-actions object)))))

(defclass cat-atn-edge (consume-atn-edge)
    ((cat :accessor atn-cat :initform nil :initarg :cat)))

(defmethod print-object ((object cat-atn-edge) stream)
  (if *print-pretty*
    (format stream "(cat ~A ~A)"
            (atn-cat object)
            (atn-end object))
    (call-next-method)))

(defclass push-atn-edge (atn-transition)
    ((net :accessor atn-net :initform nil :initarg :net)))

(defmethod print-object ((object push-atn-edge) stream)
  (if *print-pretty*
    (format stream "(push ~A ~A)"
            (atn-net object)
            (atn-end object))
    (call-next-method)))

(defclass jump-atn-edge (atn-transition)
    ())

(defmethod print-object ((object jump-atn-edge) stream)
  (if *print-pretty*
    (format stream "(jump ~A)"
            (atn-end object))
    (call-next-method)))

(defclass test-atn-edge (atn-transition)
  ())

(defmethod print-object ((object test-atn-edge) stream)
  (if *print-pretty*
    (format stream "(test ~A ~{~%~A~})"
            (atn-test object) (atn-actions object))
    (call-next-method)))
    


(defclass cell-atn-edge (consume-atn-edge)
  ((row :accessor atn-row :initform nil :initarg :row)
   (column :accessor atn-column :initform nil :initarg :column)
   (name :accessor atn-name :initform nil :initarg :name)
   (value :accessor atn-value :initform nil :initarg :value)))

(defclass or-atn-edge (consume-atn-edge)
  ((edges :accessor atn-edges :initform nil :initarg :edges)))

(defmethod print-object ((object or-atn-edge) stream)
  (if *print-pretty*
    (format stream "(or ~a ~s)"
            (atn-edges object)
            (atn-end object))
    (call-next-method)))

(defMethod (setf atn-node) (node (edge or-atn-edge))
  (dolist (edge (atn-edges edge)) (setf (atn-node edge) node)))

(defmethod pop-edge-p ((object t)) nil)
(defmethod pop-edge-p ((object pop-atn-edge)) t)
(defmethod push-edge-p ((object t)) nil)
(defmethod push-edge-p ((object push-atn-edge)) t)
(defmethod or-edge-p ((object t)) nil)
(defmethod or-edge-p ((object or-atn-edge)) t)

(defGeneric atn-term-names (node)
  (:documentation
   "generates a list of names of the terms entailed by a given node or edge.
    the base methods for category, test, and ... return '(|item|) as they
    reduce the input token directly. the base method for a pop edge delegates
    to the respective phrase node, which yields a list of all terms in the phrase.
    in all cases, if the function atn-constructor-specializer returns a non null
    value, when applied to the <em>edge</em> node, this is prepended to the
    argument list.")
  (:method ((node atn))
           (mapcar #'(lambda (term.cardinality &aux (c (first term.cardinality)))
                       (if (stringp c) (intern c) c))
                   (atn-terms node)))
  (:method ((node pop-atn-edge))
           (atn-term-names (atn-net (atn-node node))))
  (:method ((node atn-edge))
           '(|item|)))

;;;
;;; Lexikon-Einheiten
;;;

;;; Lexikon

(defclass atn-lexicon (atn-unit)
    ((lexems :accessor atn-lexems :initform nil :initarg :lexems)
     (words :accessor atn-words :initform nil :initarg :words)
     ;; nicht kategorialisierte Lexeme
     (predicates :accessor atn-predicates :initarg :predicates)))

(defclass atn-byte-lexicon (atn-lexicon)
  ())

(defclass atn-character-lexicon (atn-lexicon)
  ())

(defclass atn-symbol-lexicon (atn-lexicon)
  ())

(defclass atn-string-lexicon (atn-lexicon)
  ())

;;; Lexikalische Eintraege / Kategorien

(defclass atn-category (atn-unit)
  ((name :accessor category-name :initarg :name)
   (elements :accessor category-elements :initarg :elements :initform nil)))

(defmethod print-object ((object atn-category) stream)
  (print-unreadable-object (object stream :type t :identity t)
    (format stream "~A" (category-name object))))

(defclass atn-undeclared-category (atn-category)
  ())

(defclass atn-primitive-category (atn-category)
  ((flag-id :accessor category-flag-id :initarg :flag-id :initform nil)))

(defclass atn-derived-category (atn-category)
  ())

(defclass atn-builtin-predicate-category (atn-category)
  ()
  (:documentation
   "denotes a primitive predicate constituent in lexical predicates"))

(defclass atn-cell-category (atn-derived-category)
  ())

(defclass atn-complement-category (atn-derived-category)
  ())

(defclass atn-alternative-category (atn-derived-category)
  ())

(defclass atn-junction ()
  ((elements :accessor atn-elements :initarg :elements :initform nil)))

(defclass atn-conjunction (atn-junction)
  ())

(defclass atn-negated-alternatives (atn-junction)
  ())


;;; Lexeme

(defclass atn-lexem (atn-unit)
  ((name :accessor atn-name :initarg :name :initform nil)
   (categories :accessor atn-categories :initarg :categories :initform nil)))

(defmethod print-object ((object atn-lexem) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "~A" (atn-name object))))

;;; Procedure-Calls

(defclass atn-procedure-call (atn-unit)
  ((name :accessor atn-proc-name :initform nil :initarg :name)
   (arguments :accessor atn-proc-arguments :initform nil :initarg :arguments)
   (calltime :accessor atn-proc-calltime :initform 'after :initarg :calltime)
   (kind :accessor atn-proc-kind :initform nil :initarg :kind)))

;;; Erweiterung der externen Schnittstelle von atn-procedure-call

(defclass atn-size-test (atn-procedure-call)
  ())

(defmethod atn-size-test :around ((object atn))
  (let ((test 'null)) ;(call-next-method)))
    (if (eq test 'null)
      (setf (atn-size-test object)
            (let ((test-proc (find-if #'(lambda (x) (typep x 'atn-size-test))
                                       (atn-procedures object))))
              (when test-proc
                (setf (atn-proc-arguments test-proc)
                      (procedure-limit-list test-proc))
                test-proc)))
      test)))

(defclass atn-min-test (atn-size-test)
  ())

(defclass atn-max-test (atn-size-test)
  ())

(defclass atn-range-test (atn-size-test)
  ())

;;((limit :accessor atn-proc-limit :initform nil :initarg :limit)))

(defmethod atn-initially-tests ((object atn))
  (collect-initially-tests (atn-procedures object)))

(defmethod atn-finally-tests ((object atn))
  (collect-finally-tests (atn-procedures object)))

(defmethod atn-finally-actions ((object atn))
  (collect-finally-actions (atn-procedures object)))

(defmethod atn-initially-actions ((object atn))
  (collect-initially-actions (atn-procedures object)))

(defmethod atn-pop-tests ((object atn))
  (let ((size-test (atn-size-test object))
        (after-tests (collect-after-tests (atn-procedures object))))
    (if size-test (cons size-test after-tests) after-tests)))

;;; *** 
(defmethod atn-pop-actions ((object atn))
  (collect-after-actions (atn-procedures object)))

(defmethod atn-push-tests ((object atn))
  (collect-before-tests (atn-procedures object)))

(defmethod atn-push-actions ((object atn))
  (collect-before-actions (atn-procedures object)))

;;; interne Schnittstelle atn-procedure-call

(defmethod initially-call-p ((object atn-procedure-call))
  (equal (atn-proc-calltime object) "initially"))
(defmethod finally-call-p ((object atn-procedure-call))
  (equal (atn-proc-calltime object) "finally"))
(defmethod do-call-p ((object atn-procedure-call))
  (equal (atn-proc-kind object) "do"))
(defmethod test-call-p ((object atn-procedure-call))
  (equal (atn-proc-kind object) "test"))
(defmethod before-call-p ((object atn-procedure-call))
  (equal (atn-proc-calltime object) "before"))
(defmethod after-call-p ((object atn-procedure-call))
  (equal (atn-proc-calltime object) "after"))

(defmethod initially-test-call-p ((object atn-procedure-call))
  (and (test-call-p object) (initially-call-p object)))
(defmethod initially-do-call-p ((object atn-procedure-call))
  (and (do-call-p object) (initially-call-p object)))
(defmethod finally-do-call-p ((object atn-procedure-call))
  (and (do-call-p object) (finally-call-p object)))
(defmethod finally-test-call-p ((object atn-procedure-call))
  (and (test-call-p object) (finally-call-p object)))

(defmethod before-test-call-p ((object atn-procedure-call))
  (and (test-call-p object) (before-call-p object)))
(defmethod before-do-call-p ((object atn-procedure-call))
  (and (do-call-p object) (before-call-p object)))
(defmethod after-do-call-p ((object atn-procedure-call))
  (and (do-call-p object) (after-call-p object)))
(defmethod after-test-call-p ((object atn-procedure-call))
  (and (test-call-p object) (after-call-p object)))

(defun collect-initially-tests (procedures)
  (remove-if (complement #'initially-test-call-p) procedures))
(defun collect-finally-tests (procedures)
  (remove-if (complement #'finally-test-call-p) procedures))
(defun collect-finally-actions (procedures)
  (remove-if (complement #'finally-do-call-p) procedures))
(defun collect-initially-actions (procedures)
  (remove-if (complement #'initially-do-call-p) procedures))

(defun collect-before-tests (procedures)
  (remove-if (complement #'before-test-call-p) procedures))
(defun collect-after-tests (procedures)
  (remove-if (complement #'after-test-call-p) procedures))
(defun collect-after-actions (procedures)
  (remove-if (complement #'after-do-call-p) procedures))
(defun collect-before-actions (procedures)
  (remove-if (complement #'before-do-call-p) procedures))


;;
;;
;; atn traversal utilities

(defMethod walk-atn-net (node function (type cl:symbol))
  (walk-atn-net node function #'(lambda (node) (typep node type))))

(defMethod walk-atn-net ((node null) (function t) (constraint t))
  nil)

(defMethod walk-atn-net ((node atn-system) function (predicate function))
  (when (funcall predicate node) (funcall function node))
  (dolist (net (system-nets node))
    (walk-atn-net net function predicate))
  (walk-atn-net (system-lexicon node) function predicate))

(defMethod walk-atn-net ((node atn) function (predicate function))
  (when (funcall predicate node) (funcall function node))
  (dolist (net (atn-nodes node))
    (walk-atn-net net function predicate)))

(defMethod walk-atn-net ((node atn-node) function (predicate function))
  (when (funcall predicate node) (funcall function node))
  (dolist (net (atn-edges node))
    (walk-atn-net net function predicate)))

(defMethod walk-atn-net ((node atn-edge) function (predicate function))
  (when (funcall predicate node) (funcall function node)))

(defMethod walk-atn-net ((node or-atn-edge) function (predicate function))
  (when (funcall predicate node) 
    (call-next-method)
    (dolist (edge (atn-edges node)) (walk-atn-net edge function predicate))))

(defMethod walk-atn-net ((node atn-category) function (predicate function))
  (when (funcall predicate node) (funcall function node)))

(defMethod walk-atn-net ((node atn-lexicon) function (predicate function))
  (when (funcall predicate node) (funcall function node))
  (dolist (node (atn-lexems node)) (walk-atn-net node function predicate))
  (dolist (node (atn-words node)) (walk-atn-net node function predicate))
  (dolist (node (atn-predicates node)) (walk-atn-net node function predicate)))

(defMethod walk-atn-net ((node atn-lexem) function predicate)
  (when (funcall predicate node) (funcall function node))
  (dolist (node (atn-categories node)) (walk-atn-net node function predicate)))

(macrolet
  ;; this walks the net and interns the node names. it shoud not intern values
  ;; which are tested against input, since that package may be different from
  ;; the source package
  ((maybe-intern (slot) `(when (stringp ,slot) (setf ,slot (intern ,slot))))
   (maybe-intern-slots (slots instance)
     `(progn (with-slots ,slots ,instance
               ,@(mapcar #'(lambda (slot) `(maybe-intern ,slot)) slots)))))
  (defGeneric intern-atn-node (node)
    ;; nb. some of the slots are present even though they are bound to an instance rather than
    ;; the name
    (:method ((node atn-system))
             (maybe-intern-slots (parser-name main-net-name) node))
    (:method ((node atn-procedure-call))
             (maybe-intern-slots (name) node))
    (:method ((node atn-lexem)) )
    (:method ((node atn-category))
             (maybe-intern-slots (name) node))
    (:method ((node atn-node))
             (maybe-intern-slots (name net) node))
    (:method ((node atn-edge))
             (maybe-intern-slots (start system) node))
    (:method ((node atn-transition))
             (call-next-method)
             (maybe-intern-slots (end) node))
    (:method ((node word-atn-edge))
             (call-next-method)
             ;; the word should wait until the compiler decides what to do with it.
             ;; (maybe-intern-slots (word) node)
             )
    (:method ((node test-atn-edge))
             (call-next-method)
             (maybe-intern-slots (test) node))
    (:method ((node pop-atn-edge))
             (call-next-method)
             (maybe-intern-slots (register) node))
    (:method ((node push-atn-edge))
             (call-next-method)
             (maybe-intern-slots (net) node))
    (:method ((node atn-basic)))))


(defun intern-atn-system (node)
  (walk-atn-net node #'intern-atn-node t)
  node)


(defMethod bind-net ((node atn) &aux nodes)
  (flet ((find-node (name)
           (etypecase name
             (null nil)
             (cl:symbol
              (or (rest (assoc name nodes)) (error "node not found: ~s." name)))
             (atn-unit
              name))))
    (map nil #'(lambda (node)
                 (push (cons (atn-name node) node) nodes))
         (atn-nodes node))
    (setf (atn-start node) (find-node (atn-start node)))
    (walk-atn-net node
                  #'(lambda (edge)
                      (etypecase edge
                        (bnfp:push-atn-edge
                         (setf (atn-end edge)
                               (find-node (atn-end edge))
                               (atn-fail edge)
                               (find-node (atn-fail edge))))
                        (bnfp:jump-atn-edge
                         (setf (atn-end edge)
                               (find-node (atn-end edge))))
                        (bnfp:or-atn-edge
                         (setf (atn-end edge)
                               (find-node (atn-end edge))
                               (atn-fail edge)
                               (find-node (atn-fail edge))))
                        (bnfp:test-atn-edge
                         (setf (atn-end edge)
                               (find-node (atn-end edge))
                               (atn-fail edge)
                               (find-node (atn-fail edge))))
                        (bnfp:word-atn-edge
                         (setf (atn-end edge)
                               (find-node (atn-end edge))
                               (atn-fail edge)
                               (find-node (atn-fail edge))))
                        (fail-atn-edge )
                        (pop-atn-edge )))
                  #'(lambda (edge) (typep edge 'atn-edge))))
  node)

:EOF
