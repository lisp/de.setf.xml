;;; -*- Package: "BNF-PARSER"; -*-

#|
<DOCUMENTATION
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 </DOCUMENTATION>

|#
(in-package "BNF-PARSER")

;; runs out of space on a grammar wiht more than a couple of symbols

(defVar *grammar)
(defVar *grammar-stack)
(defVar *grammar-cache)

(defun lookup-grammar-symbol (name)
  (or (find name (bnf-lexical-rules *grammar)
            :key #'bnf-name :test #'string=)
      (find name (bnf-phrase-rules *grammar) :key #'bnf-name :test #'string=)
      (error "symbol not found: ~s." name)))

(defMacro with-collector ((name &optional (results (gensym "results")))
                          &rest body)
  `(let ((,results '(nil)))
     (flet ((,name (&rest options)
              (flet ((augment-results (new)
                       (mapcar #'(lambda (old) (concatenate 'list old new))
                               ,results)))
                (setf ,results 
                      (cond ((rest options)
                             (apply #'concatenate 'list
                                    (mapcar #'augment-results options)))
                            (t
                             (augment-results (first options))))))))
       ,@body
       (remove nil ,results))))

;;
;;
;;

(defun enumerate-grammar (*grammar &aux (*grammar-stack nil)
                                   (*grammar-cache nil))
  (mapcar #'(lambda (result)
              (apply #'concatenate 'string
                           (mapcar #'(lambda (x)
                                       (if (typep x 'sequence) x (list x)))
                                   result)))
          (with-collector (collector)
            (enumerate-grammar-unit *grammar #'collector))))



;;
;;
;;

(defMethod enumerate-grammar-unit :around ((unit t) (collector t))
  (when (can-emit unit) (call-next-method)))

(defMethod enumerate-grammar-unit ((grammar bnf) emitter)
  (let* ((rule (first (bnf-phrase-rules grammar)))
         (reference (make-instance 'bnf-nonterminal-symbol
                      :name (bnf-name rule))))
    (enumerate-grammar-unit reference emitter)))

(defMethod enumerate-grammar-unit ((rule null) (emitter t))
  nil)

(defMethod enumerate-grammar-unit ((rule bnf-definition) collector)
  (let ((level-binding (assoc rule *grammar-stack))
        (*grammar-stack *grammar-stack))
    (when (can-emit rule)
      (push (cons rule (1+ (or (rest level-binding) 0))) *grammar-stack)
      (let ((results (rest (assoc rule *grammar-cache))))
        (unless results
          (setf results
                (with-collector (inner-collector)
                  (mapcar #'(lambda (expr)
                              (enumerate-grammar-unit expr #'inner-collector))
                          (bnf-rhs rule))))
          (push (cons (bnf-name rule) results) *grammar-cache))
        (apply collector results)))))

(defMethod enumerate-grammar-unit ((expr bnf-opt-expr) outer-collector)
  (let ((results
         (with-collector (inner-collector)
           (enumerate-grammar-unit (bnf-expression expr) #'inner-collector))))
    (mapcar #'(lambda (result)
                (funcall outer-collector nil result))
            results)))

(defMethod enumerate-grammar-unit ((expr bnf-rep-expr) collector)
  (let ((results
         (with-collector (inner-collector results)
           (enumerate-grammar-unit (bnf-expression expr) #'inner-collector))))
    (mapcar #'(lambda (result)
                (funcall collector nil (list result) (list result result)))
            results)))

(defMethod enumerate-grammar-unit ((expr bnf-plus-expr) collector)
  (let ((results
         (with-collector (inner-collector results)
           (enumerate-grammar-unit (bnf-expression expr) #'inner-collector))))
    (mapcar #'(lambda (result)
                (funcall collector (list result) (list result result)))
            results)))

(defMethod enumerate-grammar-unit ((expr bnf-one-expr) collector)
  (enumerate-grammar-unit (bnf-expression expr) collector))
    
(defMethod enumerate-grammar-unit ((expr bnf-group) collector)
  (mapcar #'(lambda (expr) (enumerate-grammar-unit expr collector))
          (bnf-expressions expr)))

(defMethod enumerate-grammar-unit ((symbol bnf-terminal-symbol) collector)
  (funcall collector (bnf-name symbol)))

(defMethod enumerate-grammar-unit ((symbol bnf-nonterminal-symbol) collector)
  (enumerate-grammar-unit (lookup-grammar-symbol (bnf-name symbol)) collector))      

(defMethod enumerate-grammar-unit ((expr bnf-tokenset) collector)
  (apply collector (apply #'generate-tokenset
                          (mapcar #'rest (bnf-tokens expr)))))

(defMethod enumerate-grammar-unit ((expr bnf-tokenrange) collector)
  (apply collector (apply #'generate-tokenrange
                          (mapcar #'rest (bnf-tokens expr)))))

(defMethod enumerate-grammar-unit ((expr bnf-alternative) collector)
  (apply collector
         (mapcar #'(lambda (expr)
                     (with-collector (inner-collector)
                       (enumerate-grammar-unit expr #'inner-collector)))
                 (bnf-expressions expr))))

#|
(defMethod enumerate-grammar-unit ((expr symbol) collector)
  (funcall collector expr))

(defMethod enumerate-grammar-unit ((expr string) collector)
  (funcall collector expr))
|#

(defParameter *test-stack nil)
(defGeneric can-emit (unit)
  (:method :around ((unit t))
           (if (member unit *test-stack)
             t
             (let ((*test-stack (cons unit *test-stack)))
               (call-next-method))))
  (:method ((nbf bnf)) t)
  (:method ((unit bnf-definition))
           (let ((level-binding (assoc unit *grammar-stack)))
             (and (or (null level-binding) (< (rest level-binding) 2))
                  (dolist (expr (bnf-rhs unit) t) (unless (can-emit expr) (return nil))))))
  (:method ((expr bnf-qexpr))
           (can-emit (bnf-expression expr)))
  (:method ((expr bnf-group))
           (dolist (expr (bnf-expressions expr) t) (unless (can-emit expr) (return nil))))
  (:method ((symbol bnf-terminal-symbol))
           t)
  (:method ((symbol bnf-nonterminal-symbol))
           (can-emit (lookup-grammar-symbol (bnf-name symbol))))
  (:method  ((expr bnf-tokenset))
            t)
  (:method ((expr bnf-tokenrange))
           t)
  (:method ((expr bnf-alternative))
           (dolist (expr (bnf-expressions expr) t) (unless (can-emit expr) (return nil)))))


;;
;;
;;

(defMethod generate-tokenrange ((from t) (to t))
  (list from to))

(defun generate-tokenset (&rest range)
  (if (cdr range)
    (cons (first range) (last range))
    range))



#|
(inspect (enumerate-grammar (ccl:top-inspect-form)))
(unadvise enumerate-grammar-unit)
        (print (list (first arglist)
                     :stack *grammar-stack
                     :cache (mapcar #'first *grammar-cache))))
(bnf-name (ccl:top-inspect-form))

|#