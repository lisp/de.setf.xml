;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  these classes and method implement an element validator in the form of a
  conten-model -> atn compiler and the respective interpreter for content
  sequences. it comprises
  <ul><li>replacements for the parser constructors for content model
   productions (Cardinality, Children, Choice, ContentSpec, Mixed,
   MixedCardinality, Seq).</li>
   <li>bnf model components</li>
   <li>a model-atn interpreter which reacts to repeated application to model
    children by traversing the atn. the traversal will either fail where the
    specified child cannot be accommodated, or traverse to a concluding pop
    edge. once the children are exhausted, a concluding call which specifies
    a <code>NULL</code> child wille either yield <code>T</code> or the
    value <code>NIL</code> paired with the next edge to be traversed.
    note that this concluding step also serves as the only operation when there
    are no children,</li>
   </ul>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010323' AUTHOR='JAA'>new</DELTA>
  <DELTA DATE='20010714'>namespace/package distinction</DELTA>
  <DELTA DATE='20010914'>validation based on name instances</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-QUERY-DATA-MODEL")


(defun compile-model (model) (bnfp::build-atn model))

;;
;;
;; constructors to gererate a bnf model

#|
{46} ContentSpec ::= EMPTY | ANY | Mixed | Children
{47} Children ::= (Choice | Seq) Cardinality?
{48} Cp ::= ( QName | Choice | Seq) Cardinality?
{49} Choice ::= '(' S? Cp ( S? '|' S?  Cp )+ S? ')'
{50} Seq ::= '(' S? Cp ( S? ',' S? Cp )* S? ')'
{51} Mixed ::= ( '(' S? PCDATA ( S? '|' S? QName )* S? ')' MixedCardinality )
             | ( '(' S? PCDATA S? ')' )
     Cardinality ::= '?' | '+' | '*'
     MixedCardinality ::= '*'
|#


;;
;;
;; model compilation

(defMethod value ((node def-elem-type))
  (with-slots (value children) node
    (or value (setf value (compute-validation-function children)))))

(defMethod compute-validation-function ((definition null))
  #'(lambda (x) (declare (ignore x)) nil))

(defMethod compute-validation-function ((definition |content-model|))
  (let ((atn nil)
        (*class.atn* (typecase (first (bnfp::bnf-rhs definition))
                       (|MIXED-content| 'mixed-atn)
                       (t 'element-atn)))
        (name (name definition)))
    (typecase name
      (symbol (handler-case (let ((*package* (namespace name)))
                                ;; compile the bnf into an atn in the package of the nonterminal
                                (when (setf atn (compile-model definition))
                                  (bind-net atn)))
                  (error (condition)
                         (warn "validation grammar caused compilation error (~a): ~:W"
                               condition definition)
                         (compute-validation-function nil))))
      #|(abstract-name (handler-case (let ((*package* (namespace name)))
                                     ;; compile the bnf into an atn in the package of the nonterminal
                                     (when (setf atn (compile-model definition))
                                       (bind-net atn)))
                       (error (condition)
                              (warn "validation grammar caused compilation error (~a): ~:W"
                                    condition definition)
                              (compute-validation-function nil))))|#
      (abstract-name (handler-bind
                       ((error (lambda (condition)
                                 (warn "validation grammar caused compilation error (~a): ~:W"
                                       condition definition)
                                 (break)
                                 (return-from compute-validation-function
                                   (compute-validation-function nil)))))
                       (let ((*namespace* (namespace name)))
                         ;; compile the bnf into an atn in the package of the nonterminal
                         (when (setf atn (compile-model definition))
                           (bind-net atn)))))
      (t
       (warn "validation not supported for name: ~s." name)
       (compute-validation-function nil)))))

;; 20010619 a general version now exists in bnfp.
;; this should now be factored into a call to that and a second pass
;; tp generate the predicate function

(defMethod bind-net ((node atn) &aux nodes)
  (flet ((find-node (name)
           (etypecase name
             (null nil)
             (symbol
              (or (rest (assoc name nodes)) (error "node not found: ~s." name)))
             (bnfp::atn-unit
              name)))
         (make-element-predicate (name &aux type def)
           (cond 
             ((eq name *mixed-name*) #'(lambda (x)
                                         (typecase x
                                           (string t)
                                           (pi-node t)
                                           (comment-node t))))
             ((eq name *wild-name*) #'(lambda (x) x))
             ((eq name *empty-name*) #'(lambda (x) (not x)))
             (t
              (setf type (find-def-elem-type name *document* :if-does-not-exist nil))
              (setf def (if type type name))
              #'(lambda (element)
                  (when (is-elem-node element)
                    (validate-content def element)))))))
    (map nil #'(lambda (node)
                 (push (cons (atn-name node) node) nodes))
         (bnfp::atn-nodes node))
    (setf (bnfp::atn-start node) (find-node (bnfp::atn-start node)))
    (bnfp::walk-atn-net node
                        #'(lambda (edge)
                            (etypecase edge
                              (bnfp:push-atn-edge
                               (setf (bnfp::atn-test edge)
                                     (make-element-predicate (bnfp::atn-net edge))
                                     (bnfp::atn-end edge)
                                     (find-node (bnfp::atn-end edge))
                                     (bnfp::atn-fail edge)
                                     (find-node (bnfp::atn-fail edge))))
                              (bnfp:jump-atn-edge
                               (setf (bnfp::atn-end edge)
                                     (find-node (bnfp::atn-end edge))))
                              (bnfp:or-atn-edge
                               (setf (bnfp::atn-end edge)
                                     (find-node (bnfp::atn-end edge))
                                     (bnfp::atn-fail edge)
                                     (find-node (bnfp::atn-fail edge))))
                              (bnfp:test-atn-edge
                               (setf (bnfp::atn-end edge)
                                     (find-node (bnfp::atn-end edge))
                                     (bnfp::atn-fail edge)
                                     (find-node (bnfp::atn-fail edge))))
                              (bnfp:word-atn-edge
                               (setf (bnfp::atn-end edge)
                                     (find-node (bnfp::atn-end edge))
                                     (bnfp::atn-fail edge)
                                     (find-node (bnfp::atn-fail edge))))
                              (bnfp::fail-atn-edge )
                              (bnfp::pop-atn-edge )))
                        #'(lambda (edge) (typep edge 'bnfp::atn-edge))))
  node)

(defMethod is-valid ((node elem-node))
  (with-slots (valid) node
    (if (slot-boundp node 'valid)
      valid
      (setf valid (validate-content node node)))))

(defMethod validate-content
           ((def def-elem-type) (datum elem-node))
  "validate an element against a type by checking the type instance against that associated with
   the instanes and then checking the content against the model.
   nb. this does not compare type names in order to allow variations between type and name."
  (with-slots (valid) datum
    (when (eq def (def datum))
      (if (slot-boundp datum 'valid)
        valid
        (setf valid (validate-content def (children datum)))))))

(defMethod validate-content
           ((def symbol) (elem elem-node))
  (with-slots (valid) elem
    (when (eq def (name (def elem)))
      (if (slot-boundp elem 'valid)
        valid
        (setf valid (validate-content (def elem) (children elem)))))))

(defMethod validate-content
           ((def uname) (elem elem-node))
  (with-slots (valid) elem
    (when (eq def (name (def elem)))
      (if (slot-boundp elem 'valid)
        valid
        (setf valid (validate-content (def elem) (children elem)))))))

(defMethod validate-content
           ((elem elem-node) (datum t))
  (validate-content (def elem) datum))

(defMethod validate-content
           ((def null) (datum t))
  nil)

(defMethod validate-content
           ((type def-elem-type) datum)
  (let ((validation-net (value type)))
    ;; (break)
    ;; (inspect validation-net)
    (validate-content validation-net datum)))

#|(defMethod validate-content
           ((net mixed-atn) (datum t) &aux (node (bnfp::atn-start net)))
  ;; mixed content permits character data anywhere
  (validate-content
   #'(lambda (datum)
       (etypecase datum
         ((or elem-node null)
          (multiple-value-bind (next-node last-node)
                               (compute-next-edge datum node)
            (setf node next-node)
            (values next-node last-node)))
         (string (values node node))
         (pi-node (values node node))
         (comment-node (values node node))))
   datum))|#

(defMethod validate-content
           ((net mixed-atn) (datum t) &aux (node (bnfp::atn-start net)))
  ;; mixed content permits character data anywhere
  (validate-content
   #'(lambda (datum)
       (multiple-value-bind (next-node last-node)
                            (compute-next-edge datum node)
         (setf node next-node)
         (values next-node last-node)))
   datum))

(defMethod validate-content
           ((net element-atn) (datum t) &aux (node (bnfp::atn-start net)))
  ;; element content permits whitespace anywhere
  (validate-content
   #'(lambda (datum)
       (etypecase datum
         ((or elem-node null)
          (multiple-value-bind (next-node last-node)
                               (compute-next-edge datum node)
            (setf node next-node)
            (values next-node last-node)))
         (string (unless (find-if (complement #'xml-space?) datum)
                   (values node node)))
         (pi-node (values node node))
         (comment-node (values node node))))
   datum))


(defMethod validate-content
           ((generator function) (list list) &aux edge)
  (dolist (datum list)
    (setf edge (funcall generator datum))
    (unless (typep edge 'bnfp::atn-unit)
      (return-from validate-content nil)))
  (funcall generator nil))

(defParameter *validation-nodes* nil)

(defGeneric compute-next-edge (datum edge)
  (:method ((datum t) (node null)) nil)
  (:method ((datum t) (edge bnfp::pop-atn-edge)) (not datum))
  (:method ((datum t) (edge bnfp::fail-atn-edge)) nil)
  (:method ((datum t) (node atn-node))
           (if (member node *validation-nodes*)
             (values nil node)
             (let ((*validation-nodes* (cons node *validation-nodes*)))
               (declare (dynamic-extent *validation-nodes*))
               (some #'(lambda (edge) (compute-next-edge datum edge))
                 (bnfp::atn-edges node)))))
  (:method ((datum t) (edge bnfp::push-atn-edge) &aux fail)
           (if (funcall (bnfp::atn-test edge) datum)
             (bnfp::atn-end edge)
             (when (setf fail (bnfp::atn-fail edge))
               (compute-next-edge datum fail))))
  (:method ((datum t) (edge bnfp::jump-atn-edge))
           (compute-next-edge datum (bnfp::atn-end edge)))
  (:method ((datum t) (edge bnfp::or-atn-edge) &aux fail)
           (or (some #'(lambda (edge) (compute-next-edge datum edge))
                     (bnfp::atn-edges edge))
               (when (setf fail (bnfp::atn-fail edge))
                 (compute-next-edge datum fail)))))

           
:EOF
