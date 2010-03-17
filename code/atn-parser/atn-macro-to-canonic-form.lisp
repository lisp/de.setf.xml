;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  this file comprises the methods for <code>atn-canonic-form</code>, which rewrites
  S-expression forms for ATN nodes to node instances. it accomplishes the 'same' thing as
  <a href='ATN-macros.lisp'>ATN-macros</a>, but does not depend on macro evaluation.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='19980203' AUTHOR='BB' />
  <DELTA DATE='19980325' AUTHOR='BB' />
  <DELTA DATE='20010205' AUTHOR='JAA'>
   added ATN-BUILTIN-PREDICATE-CATEGORY to denote builtin, primitives</DELTA>
  <DELTA DATE='20010303' AUTHOR='JAA'>
   parameterized the node classes</DELTA>
  <DELTA DATE='20010331' AUTHOR='JAA'>
   added explicit failure control path</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package"BNFP")

;;;
;;; Netze
;;;

(defmethod atn-canonic-form ((object (eql 'defatn)) forms)
   (destructuring-bind (name start &key nodes finally) forms
     (let ((net (make-instance *class.atn* :name name :start start
                               :finally finally)))
        (flet ((mknode (l) 
                (let ((node (atn-canonic-form 'defnode l)))
                   (setf (atn-net node) net)
                   node)))
          (setf (atn-nodes net) (mapcar #'mknode nodes))
          net))))

;;;
;;; Knoten
;;;

(defmethod atn-canonic-form ((object (eql 'defnode)) forms)
   (let ((node (make-instance *class.atn-node* :name (first forms))))
      (flet ((edge (l) 
              (let ((edge (atn-canonic-form (first l) (rest l))))
                 (setf (atn-node edge) node)
                 edge)))
         (setf (atn-edges node) (mapcar #'edge (rest forms)))
        node)))

;;;
;;; Kanten
;;;

(defmethod atn-canonic-form (test forms)
   (let ((edge (atn-canonic-form (first forms) (rest forms))))
      (setf (atn-test edge) test)
      edge))

(defmethod atn-canonic-form ((object (eql 'push)) forms)
   (destructuring-bind (subnet target fail &rest actions) forms
     (make-instance *class.push-atn-edge*
       :net subnet
       :end target
       :fail fail
       :actions actions)))

(defmethod atn-canonic-form ((object (eql 'pop)) forms)
   (let ((register (first (last forms)))
         (actions (butlast forms)))
     (make-instance *class.pop-atn-edge*
       :register register
       :actions actions)))

(defmethod atn-canonic-form ((object (eql 'fail)) forms)
   (make-instance *class.fail-atn-edge*
     :actions forms))

(defmethod atn-canonic-form ((object (eql 'word)) forms)
  ;; no check as the term may be internal and not in the bnf
  ;; in which case a warning has already appeared
  (destructuring-bind (word target fail . actions) forms
    (make-instance *class.word-atn-edge*
      :word word
      :end target
      :fail fail
      :actions actions)))

(defMethod atn-canonic-form ((object (eql 'or)) forms)
  ;; carry a disjunction over
  (destructuring-bind (edges target fail . actions) forms
    (make-instance *class.or-atn-edge*
      :edges (mapcar #'(lambda (l) (atn-canonic-form (first l) (rest l))) edges)
      :end target
      :fail fail
      :actions actions)))

;; 20010205.jaa
(defmethod atn-canonic-form ((object (eql 'test)) forms)
  (ensure-uncategorialized-lexem (first forms))
  (destructuring-bind (test target fail . actions) forms
    (make-instance *class.test-atn-edge*
      :test test
      :end target
      :fail fail
      :actions actions)))

(defmethod atn-canonic-form ((object (eql 'cat)) forms)
  (destructuring-bind (cat target fail . actions) forms
    (make-instance *class.cat-atn-edge*
      :cat cat
      :end target
      :fail fail
      :actions actions)))

(defmethod atn-canonic-form ((object (eql 'jump)) forms)
  (destructuring-bind (target . actions) forms
    (make-instance *class.jump-atn-edge*
      :end target
      :actions actions)))

(defmethod atn-canonic-form ((object (eql 'cell)) forms)
  (destructuring-bind (name to . actions) forms
    (make-instance *class.cell-atn-edge*
      :name name
      ;      :row row
      :end to
      ;      :column column
      ;      :value value
      :actions actions
      )))

;;;
;;; Lexikon
;;;

(defmethod atn-canonic-form ((object (eql 'deflexicon)) forms)
   (destructuring-bind (&key lexems predicates) forms
     ;; :lexems jedem Lexem wird eine Liste von Kategorien zugeordnet
     ;; :predicates jedem predicate wird eine Liste von Kategorien bzw. Terminalen
     ;; zugeorndet
     ;; :categories jeder category wird eine Liste von terminalen Symbolen zugeordnet
     (let ((lexicon (make-instance *class.atn-lexicon*))
           (*lexems nil)
           (*categories nil))
       (declare (special *categories *lexems))
       (flet ((ensure-defs (cat def)
                (setf (category-elements cat)
                      (mapcar #'ensure-def-object def))
                cat)
              (table-cells-p (def)
                ;;;(inspect (list 'table-cells-p def))
                (if (consp def)
                  (every #'(lambda (x) (typep x 'bnf-table-cell)) def)
                  (typep def 'bnf-table-cell))))
         ;;;(setf (category-elements cat) (atn-canonic-form cat def))
         (setf *lexems
               (delete-duplicates
                (mapcar #'(lambda (x) (atn-canonic-form (make-atn-lexem (first x)) (rest x))) 
                        lexems))
               (atn-lexems lexicon)
               *lexems)
         ;(inspect predicates)
         (loop for (cat . def) in predicates
               collect
               (make-instance 
                 (if (table-cells-p def)
                   *class.atn-cell-category* 
                   *class.atn-derived-category*)
                 :name cat) into cats
               collect def into defs
               finally ;; do ;; allegro loop doesn't recognize addenda to finally
               (progn
               (loop for i from 0
                     for c in *categories
                     do (setf (category-flag-id c) (expt 2 i)))
               (setf *categories (append cats *categories))
               (map nil #'ensure-defs cats defs)
               (setf (atn-predicates lexicon) *categories))))
       lexicon)))

(defun make-atn-lexem (name)
  (declare (special *lexems))
  (or (find name *lexems :key #'atn-name :test #'equal)
      (let ((lexem (make-instance *class.atn-lexem* :name name)))
        (push lexem *lexems)
        lexem)))

(defun ensure-def-object (def)
  (declare (special *categories *lexems))
  (if (consp def)
    (cond ((eq (first def) 'not)
           (make-instance *class.atn-negated-alternatives*
             :elements (mapcar #'ensure-def-object (rest def))))
          ((eq (first def) 'and)
           (make-instance *class.atn-conjunction*
             :elements (mapcar #'ensure-def-object (rest def))))
          (t (error "Syntaxfehler ~A" def)))
    (cond ((find def *categories :key #'category-name :test #'equal))
          ((find def *lexems :key #'atn-name :test #'equal))
          ((typep def 'bnf-tokenset) def)
          ((typep def 'bnf-table-cell) def)
          ((predicate-terminal-p def)
           (make-instance *class.atn-builtin-predicate-category* :name def))
          ((uncategorialized-terminal-p def)
           (ensure-uncategorialized-lexem def))
          (t
           (warn "~A wurde nicht deklariert!" def)
           (make-instance *class.atn-undeclared-category* :name def)))))

(defun ensure-uncategorialized-lexem (name)
  (or (find name *atn-words* :test #'equal :key #'atn-name)
      (let ((lexem (make-instance *class.atn-lexem* :name name)))
        (push lexem *atn-words*)
        lexem)))

(defun uncategorialized-terminal-p (object)
  (and (stringp object)
       (or (null (setf object (make-lisp-predicate-name object :if-does-not-exist nil)))
           (not (fboundp object)))))

(defun predicate-terminal-p (object)
  (and (stringp object)
       (setf object (make-lisp-predicate-name object :if-does-not-exist nil))
       (fboundp object)))


;;; Lexeme

(defmethod atn-canonic-form ((object atn-lexem) form)
  (flet ((ensure-atn-category (cat)
           (declare (special *categories))
           (let ((category (find cat *categories :key #'category-name :test #'equal)))
             (unless category
               (setf category (make-instance *class.atn-primitive-category*
                                :name cat))
               (push category *categories))
             (push object (category-elements category))
             category)))
    (setf (atn-categories object) 
          (union (atn-categories object) (mapcar #'ensure-atn-category form))))
  object)

;;; Abgeleitete Kategorien

(defmethod atn-canonic-form ((object atn-derived-category) form)
  (flet ((ensure-element (elt)
           (declare (special *categories))
           (or (find elt *categories :key #'category-name :test #'equal)
               (make-atn-lexem elt))))
    (let ((catname (first form))
          (defs (rest form)))
      (setf (category-name object) catname)
      (cond ((eq (first defs) 'not)
             (change-class object *class.atn-complement-category*)
             (setf (category-elements object)
                   (mapcar #'ensure-element (rest (first defs)))))
            (t (change-class object *class.atn-alternative-category*)
               (setf (category-elements object) (mapcar #'ensure-element defs))))))
  object)

:EOF
