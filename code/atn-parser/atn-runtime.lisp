;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  definitions for input sources and routines to access the atn parse result tree
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010209' AUTHOR='JAA'>
   new</DELTA>
  <DELTA DATE='20010520'>reintroduced ambiguous parses with tree pruning</DELTA>
  <DELTA DATE='20010625' AUTHOR='RFL'>fixed arguments in INPUT.LAST-ITEM</DELTA>
  <DELTA DATE='20020115'>added report-parse-condition to allow call-next method</DELTA>
  <DELTA DATE='20030319'>conditions removed to conditions.lisp</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "BNF-PARSER")

;;
;;
;; diagnostic macros.
;; defined here in order to permit a parser to load from source without
;; the rest of the compiler

;;
;;
;; macros for the end-compilation to incorporate or eliminate tracing

(defun is-atn-trace (&optional (stack *atn-stack))
  ;; if trace is on and either the stack contains a net which is being traced as a whole,
  ;; or the immediate net is being traced internally, then print the message.
  (flet ((net-is-traced () (or (eq *atn-trace* t)
                               (and (consp *atn-trace*)
                                    (dolist (name stack)
                                      (when (member name *atn-trace*) (return name)))))))
    (and #+digitool (not (ccl:shift-key-p))
         (net-is-traced))))

(defParameter *atn-print-length* 5)

(defun print-node-stack (stream stack at colon &optional
                                (length *atn-print-length*)
                                &rest args)
  (declare (ignore  at colon args))
  (labels ((do-print (stack level)
             (when (and (or (null level) (plusp level)) (first stack))
               (when (rest stack)
                 (cond ((> level 1)
                        (do-print (rest stack) (when level (1- level)))
                        (write-char #\/ stream))
                       (t
                        (write-string ".../" stream))))
               (princ (first stack) stream)
               )))
    (write-char #\[ stream)
    (do-print stack length)
    (write-char #\] stream)))
;(format t "test: ~2/bnfp:print-node-stack/ test" '(a s d f g h h j k))
;(format t "test: ~/bnfp:print-node-stack/ test" '(a s d f g h))

(defMacro %atn-trace
          (&rest args)
  (if *atn-trace*
    `(when (is-atn-trace)
       (%atn-format ,@args))
    (values)))

(defmacro %atn-format (&rest args)
  `(progn (format *trace-output* "~%~VT|" (+ 4 *atn-level))
          (format *trace-output* ,@args)))

(defMacro %atn-trace-form
          (form-to-trace &aux (result (gensym "RESULT-")))
  (if *atn-trace*
    `(let ((,result ,form-to-trace))
       (when (is-atn-trace)
         (format *trace-output* "~2/bnfp:print-node-stack/ =[~s']"
                 *atn-node ,result))
       ,result)
    form-to-trace))

(defMacro %atn-block (name &rest body)
  (if *atn-trace*
    `(progn
       (when (is-atn-trace)
         (format *trace-output* "~%~VT|~3,'0d| ~/bnfp:print-node-stack/ (~s @ ~d last='~s') "
                 *atn-level  *atn-level *atn-stack
                 ',name index (|input.peek| index)))
       #+digitool (when (and (ccl:option-key-p) (ccl:command-key-p)) (break))
       ,@body)
    (if (cdr body)
      `(progn ,@body)
      (first body))))

(defMacro %atn-node-block (name &rest body)
  (if *atn-trace*
    `(progn
       (when (is-atn-trace)
         (format *trace-output* "~%~VT| ~3/bnfp:print-node-stack/ (~s @ ~d last='~s')"
                 (+ 4 *atn-level)  *atn-stack
                 ',name index (|input.peek| index)))
       ,@body)
    (if (cdr body)
      `(progn ,@body)
      (first body))))

(defMacro %atn-edge-block (name &rest body)
  (if *atn-trace*
    `(progn (when (is-atn-trace)
              (format *trace-output* "~%~VT| edge ~s @ ~d='~s' : "
                      (+ 4 *atn-level) ',name index (|input.peek| index)))
            ,@body)
    (if (rest body)
      `(progn ,@body)
      (first body))))

;(setf *atn-trace* nil) (setf *atn-trace* t)
;(%atn-block ((test 1) (*atn-node t)) (print 2))

;;
;;
;; well-formed subtree management: once a sequence has been parsed, it is cached at
;; the position at which it commenced annotated by the tree recognized.
;; any attempt to parse from that point on, examines the cache to determine whether a
;; parse already exists for the respective goal.

(defun |wfst-initialize| (&optional (cache (make-array 8 :adjustable t
                                                      :element-type 'cons
                                                      :initial-element nil)))
  (dotimes (i (length cache)) (setf (elt cache i) nil))
  cache)

(defun |wfst-adjust| (cache size)
  (adjust-array cache size :element-type 'cons :initial-element nil))

(defun |wfst-pop| (term-name)
  (without-interrupts
   (or (pop (get term-name :atn-wfst))
       (make-array 8 :adjustable t :element-type 'list :initial-element nil))))

(defun |wfst-push| (term-name cache)
  (without-interrupts
   (push cache (get term-name :atn-wfst))))
       
(defun |wfst-entry| (net index &aux cache-entry)
  (cond ((and *atn-wfst
              (> (length *atn-wfst) index)
              (setf cache-entry (assoc net (aref *atn-wfst index))))
         (%atn-trace " wfst-get: ~a ~d: ~s." net index (cdr cache-entry))
         (values (cdr cache-entry) t))
        (t
         (%atn-trace " wfst-get: ~a ~d: no value." net index)
         nil)))

(defun |wfst-push-entry| (net index structure)
  (when *atn-wfst
    (when (>= index (length *atn-wfst))
      (setf *atn-wfst (|wfst-adjust| *atn-wfst (* 2 index))))
    (%atn-trace " wfst-push: ~a ~d: ~s." net index structure)
    (push (cons net structure) (aref *atn-wfst index)))
  structure)
                        


;;
;;
;; a default class to manage a sequence of tokens as an input source.
;; followed by the miniam functions to use with the generated parser. if the keywords
;; :input-function and :input-eof-function are not provided, then the default functions
;; are called, which use the dynamic binding created be the parser call as the value for
;; the input source.


(defClass atn-input () ())
(defun atn-input () (when (boundp '*atn-input) *atn-input))
(defClass atn-sequence-input (atn-input)
  ((sequence :initarg :sequence :reader input.sequence)))
(defMethod input.item ((input atn-sequence-input) position)
  (when (< -1 position (length (input.sequence input)))
    (elt (input.sequence input) position)))
(defMethod input.last-item ((input atn-sequence-input))
  (input.item input (1- (length (input.sequence input)))))
(defMethod (setf input.last-item) (item (input atn-sequence-input))
  (let ((position (1- (length (input.sequence input)))))
    (when (> item -1)
      (setf (elt (input.sequence input) position) item))))
(defMethod input.is-at-end ((input atn-sequence-input) position)
  (>= position (length (input.sequence input))))
(defMethod input.length ((input atn-sequence-input))
  (length (input.sequence input)))
(defMethod input.peek-item ((input atn-sequence-input) position)
  "the method for sequences is the same input.item.
   where the input is generated or read
(defun atn-stack ()
  (declare (special *atn-stack))
  (when (boundp '*atn-stack) (copy-list *atn-stack))), this will differ."
  (input.item input position))

#|
(defMethod parse-state ((input atn-input))
  (list :lexical-stack (atn-stack)
        :term *atn-term*
        :term? *atn-term?*))
(defMethod parse-state ((input null)) '(:source nil))
|#

(defun |input.item| (position) (input.item *atn-input position))
(defun |input.peek| (position) (input.peek-item *atn-input position))
(defun |input.is-at-end| (position) (input.is-at-end *atn-input position))
   
;;
;;
;; parser state

#|
(defun |is-main-pop-edge| (name)
  (and (= *atn-level 1) (eq name *atn-start-name)))

(defun |is-at-end| (index)
  (input.is-at-end *atn-input index))

(defun |last-item| ()
  (input.last-item *atn-input))

(defun |peek-item| (index)
  ;; returns an item only if it is ready
  (input.peek-item *atn-input index))
  
(defun |symbol=| (item value)
  ;; value is a symbol
  ;; item should be a character or a string/symbol to test
  ;; other items fail
  (or (eq item value)
      (typecase item
        (character (setf value (string value))
                   (char= item (char value 0)))
        (string (string= item value))))) ;; (eq (find-symbol item) value)))))

(defun |char=| (item value)
  ;; value is a character
  ;; item should be a character or a string/symbol to test
  ;; other items fail
  (when (symbolp item) (setf item (string item)))
  (typecase item
    (character (char= item value))
    (string (and (plusp (length item))
                 (char= (char item 0) value)))
    (symbol (setf item (string item))
            (and (plusp (length item))
                 (char= (char item 0) value)))))

(defun |byte-value| (item)
  (etypecase item
    (symbol (char-code (char (string item) 0)))
    (string (char-code (char item 0)))
    (character (char-code item))
    (integer item)))
|#

(defun is-reduction-enabled ()
  (and *atn-reduce*))

(defun atn-reduce-structure (constructor &rest structure)
  (declare (dynamic-extent structure))
  ;; controlled terminal errors may be ignored if so specified; continuables are passed on silently
  ;; uncontrolled errors are
  (handler-bind ((continuable-parser-error
                  #'(lambda (condition)
                      (declare (ignore condition))
                      ;; continuable errors always travel up to the caller
                      nil))
                 (terminal-parser-error
                  #'(lambda (condition)
                      ;; if terminating, then just let the condition go further up to the
                      ;; parse wrapper function. otherwise suppress it
                      (when (eq (condition-action condition) :continue)
                        (warn "reduction raised condition: ~a: Term ~s: Structure ~s."
                              condition *atn-term* structure)
                        (return-from atn-reduce-structure structure)))))
    (apply constructor structure)))

(defMethod atn-reduce-structure-with-context (constructor context &rest structure)
  (declare (dynamic-extent structure))
  ;; controlled terminal errors may be ignored if so specified; continuables are passed on silently
  ;; uncontrolled errors are
  (handler-bind ((continuable-parser-error
                  #'(lambda (condition)
                      (declare (ignore condition))
                      ;; continuable errors always travel up to the caller
                      nil))
                 (terminal-parser-error
                  #'(lambda (condition)
                      ;; if terminating, then just let the condition go further up to the
                      ;; parse wrapper function. otherwise suppress it
                      (when (eq (condition-action condition) :continue)
                        (warn "reduction raised condition: ~a: Term ~s: Structure ~s."
                              condition *atn-term* structure)
                        (return-from atn-reduce-structure-with-context structure)))))
    (apply constructor context structure)))

(defun atn-noop (&rest structure)
  (declare (dynamic-extent structure))
  (warn "no operator for arguments: ~s." structure)
  nil)

#|
(defun atn-reduce-structure (constructor structure *atn-index)
  (flet ((reverse-to-plist (list &aux result)
           (dolist (cons list) (push (rest cons) result) (push (first cons) result))
           result))
    (declare (inline alist-to-plist))
    (setf structure
          (if (eq *atn-reduce-arglist :PLIST)
            (reverse-to-plist structure)
            (reverse structure)))
    ;; controlled terminal errors may be ignored if so specified; continuables are passed on silently
    ;; uncontrolled errors are
    (if *atn-reduce
      (handler-bind ((continuable-parser-error
                     #'(lambda (condition)
                         (declare (ignore condition))
                         ;; continuable errors always travel up to the caller
                         nil))
                     (terminal-parser-error
                      #'(lambda (condition)
                          ;; if terminating, then just let the condition go further up to the
                          ;; parse wrapper function. otherwise suppress it
                          (when (eq (condition-action condition) :continue)
                            (warn "reduction raised condition: ~a: Context ~s/~s: Structure ~s."
                                  condition *atn-term* *atn-index structure)
                            (return-from atn-reduce-structure structure)))))
        (funcall constructor structure))
      structure)))
|#

(defun atn-reduce-item (constructor structure)
  ;; the structure in this case is atomic, so there is no need to distinguish whether
  ;; or not to copy it
  (if *atn-reduce*
    (handler-bind ((continuable-parser-error
                    #'(lambda (condition) (declare (ignore condition)) nil))
                   (terminal-parser-error
                    #'(lambda (condition)
                        (unless (condition-action condition)
                          (warn "reduction raised condition: ~a: Term ~s: Structure ~s."
                                condition *atn-term* structure)
                          (return-from atn-reduce-item structure)))))
      (funcall constructor structure))
    structure))

(defun atn-reduce-item-with-context (constructor context structure)
  ;; the structure in this case is atomic, so there is no need to distinguish whether
  ;; or not to copy it
  (if *atn-reduce*
    (handler-bind ((continuable-parser-error
                    #'(lambda (condition) (declare (ignore condition)) nil))
                   (terminal-parser-error
                    #'(lambda (condition)
                        (unless (condition-action condition)
                          (warn "reduction raised condition: ~a: Term ~s: Structure ~s."
                                condition *atn-term* structure)
                          (return-from atn-reduce-item-with-context structure)))))
      (funcall constructor context structure))
    structure))


;;
;; the parser compiler recognizes this function and uses it to perform
;; reduction


#|
the atn-parse-substructure and -substructure* methods are similar in that they invoke
the parse function for the specified method. the former version is used only when either
tracing code is generated, ot when a well-formed subtree cache is enabled.
the latter method is ued with ambiguous grammars, to manage the multiple values.

well formed subtrees were necessary when the parser was written so as
to parse exhaustively the parser parses exhaustively. otherwise the repeated reparsing,
which an ambiguous grammar (such as the xpath grammar) requires, precludes working on
expressions of meaningful length.
|#

(defun atn-parse-substructure (name index)
  (multiple-value-bind (substructure is-cached)
                       (|wfst-entry| name index)
    (cond (is-cached
           (cond (substructure
                  (destructuring-bind (result . new-index) substructure
                    (when (is-atn-trace)
                      (format *trace-output* "~%~VT|->| ~a/~a (~d->~d) -> ~a"
                              (+ 4 *atn-level) (first *atn-stack) name
                              index new-index result))
                    (values result new-index t)))
                 (t
                  (when (is-atn-trace)
                    (format *trace-output* "~%~VT|->| ~a (~d) failed"
                            (+ 4 *atn-level) name index))
                  nil)))
          (t
           (multiple-value-bind (result new-index success)
                                (funcall name index)
             (cond (success
                    (|wfst-push-entry| name index (cons result new-index))
                    (when (is-atn-trace)
                      (format *trace-output* "~%~VT|->| ~a/~a (~d) -> ~a" 
                              (+ 4 *atn-level) (first *atn-stack) name index result))
                    (values result new-index t))
                   (new-index
                    (|wfst-push-entry| name index nil)
                    (values result new-index nil))
                   (t ;; no parse was attempted (recursion guard...)
                    (values result nil nil))))))))

(defun atn-parse-substructure* (name index)
  (multiple-value-bind (substructure is-cached)
                       (|wfst-entry| name index)
    ;(when (eq name 'xq::|EqualityExpr|) (break))
    (cond (is-cached
           (cond (substructure
                  (when (is-atn-trace)
                      (format *trace-output* "~%~VT|->| ~a/~a (~d) -> ~a"
                              (+ 4 *atn-level) (first *atn-stack) name
                              index substructure))
                    (values substructure t))
                 (t
                  (when (is-atn-trace)
                    (format *trace-output* "~%~VT|->| ~a (~d) failed"
                            (+ 4 *atn-level) name index))
                  nil)))
          (t
           (multiple-value-bind (result success)
                                (funcall name index)
             (cond (success
                    (setf result (remove-duplicates result :test #'atn-structure-equalp))
                    (|wfst-push-entry| name index result)
                    (when (is-atn-trace)
                      (format *trace-output* "~%~VT|->| ~a/~a (~d) -> ~a" 
                              (+ 4 *atn-level) (first *atn-stack) name index result))
                    (values result t))
                   (result
                    (|wfst-push-entry| name index nil)
                    (values nil nil))
                   (t ;; no parse was attempted (recursion guard...)
                    nil)))))))

(defGeneric atn-structure-equalp (s1 s2)
  (:documentation "function used to prune result trees for an ambiguous grammar.
    must be specialized for atomic values should the wfst cache be disabled.")
  (:method ((s1 t) (s2 t)) (equalp s1 s2)))

#|

(defun |parse-substructure| (name index)
  (funcall name index))

|#

;;
;;
;; access to the results

;; the parser generates a list of possible parses. the list is of the form
;;  ( ((<production> . <result>) . length) ... )
;;
;; multiple results are sorted to prefer those which consumed more input.
;; where the parse mode is :single this is done internally with the results from each net.
;; by multiple results it is done one only, at the conclusion, to select the (more)
;; complete results.

(defun sort-parse-results (results)
  (if (cdr results)
    (flet ((test (p1 p2)
             (flet ((result-length (r)
                      (if (consp r) (length r) (if r 1 most-positive-fixnum))))
               (or (> (rest p1) (rest p2))
                   (and (= (rest p1) (rest p2))
                        (< (result-length (rest (first p1))) (result-length (rest (first p2)))))))))
      (sort results #'test))
    results))

(defun nth-parse-result (results &optional (position 0))
  (cdar (nth position results)))

(defun parse-result (results) (nth-parse-result results 0))

;; mechanism to bind to elements deep within parsed structure
(defun find-parsed-term (parse term &key count)
  (when (consp parse)
    (cond ((eq (first parse) term)
           (if count
             (list (rest parse))
             (rest parse)))
          ((consp (rest parse))
           (let ((results nil) (result nil))
             (dolist (parse (rest parse) results)
               (when (setf result (find-parsed-term parse term :count count))
                 (cond (count
                        (setf results (nconc results result))
                        (decf count (length result))
                        (unless (plusp count) (return results)))
                       (t
                        (return result))))))))))

(defun call-with-parsed-terms (function parse terms)
  (let ((results (mapcar #'(lambda (term)
                       (destructuring-bind (name &optional count) term
                         (find-parsed-term parse name :count count)))
                   terms)))
    (apply function results)))

(defMacro with-parsed-terms
          (binding-forms parse &rest body)
  `(call-with-parsed-terms (function (lambda ,(mapcar #'(lambda (term)
                                                          (if (consp term)
                                                            (second term)
                                                            term))
                                                      binding-forms)
                                       ,@body))
                           ,parse
                           ',(mapcar #'(lambda (term)
                                         (if (consp term)
                                           (destructuring-bind (name binding &optional count) term
                                             (declare (ignore binding))
                                             (list name
                                                   (when count
                                                     (if (numberp count)
                                                       count
                                                       most-positive-fixnum))))
                                           (list term)))
                                     binding-forms)))

;; mechanism to bind to elements at the top level of a parsed structure

(defun call-with-parsed-alist (function alist terms)
  (flet ((collect-attribute (name count &aux result)
           (dolist (cons alist)
             (unless (plusp count) (return))
             (when (eq (first cons) name)
               (push (rest cons) result)
               (decf count)))
           (nreverse result)))
    (let ((results (mapcar #'(lambda (term)
                               (destructuring-bind (name &optional count) term
                                 (if (numberp count)
                                   (collect-attribute name count)
                                   (rest (assoc name alist)))))
                           terms)))
      (apply function results))))

(defMacro with-parsed-alist
          (binding-forms parse &rest body &aux (parse-binding (gensym)) form)
  (setf form
        `(funcall
          (function (lambda ,(mapcar #'(lambda (term) (if (consp term) (second term) term))
                                     binding-forms)
                      ,@body))
          ,@(mapcar #'(lambda (term)
                        (if (consp term)
                          (destructuring-bind (name binding &key type count) term
                            (declare (ignore binding))
                            (if count
                              `(,(ecase type
                                   ((list nil) 'collect-association-list)
                                   (vector 'collect-association-list))
                                ',name ,parse-binding
                                ,(if (numberp count) count most-positive-fixnum))
                              `(rest (assoc ',name ,parse-binding))))
                          `(rest (assoc ',term ,parse-binding))))
                    binding-forms)))
  (if (symbolp parse)
    (nsubst parse parse-binding form)
    `(let ((,parse-binding ,parse))
       ,form)))

;; nb. this does not reverse, as it is intended to be used on parse results, which
;; are orderd opposite from the original
(defun collect-association-list
       (property alist &optional (count most-positive-fixnum) &aux cons results)
  (declare (optimize (speed 3) (safety 1)) (type list alist) (type fixnum count)
           (type list cons))
  (check-type count fixnum)
  (check-type alist list)
  (loop (unless (setf cons (pop alist)) (return))
        (when (eq (first cons) property)
          (push (rest cons) results)
          (unless (plusp (decf count)) (return))))
  results)

(defun collect-association-vector
       (property alist &optional (count most-positive-fixnum)
                 &aux cons (results (make-array 4 :adjustable t :fill-pointer 0)))
  (declare (optimize (speed 3) (safety 1)) (type list alist) (type fixnum count)
           (type list cons))
  (check-type count fixnum)
  (check-type alist list)
  (loop (unless (setf cons (pop alist)) (return))
        (when (eq (first cons) property)
          (vector-push-extend (rest cons) results)
          (unless (plusp (decf count)) (return))))
  results)

(defun collect-property (property plist count &aux results)
  (loop (unless plist (return (nreverse results)))
        (cond ((eq (pop plist) property)
               (when (null count)
                 (return (pop plist)))
               (push (pop plist) results)
               (when (and (numberp count) (<= (decf count) 0)) (return (nreverse results))))
              (t
               (pop plist)))))

(defMacro with-parsed-plist
          (bindings parse &rest body &aux collecting-parameters (parse-name (gensym "PARSE-"))
                    )
  `(let ((,parse-name ,parse))
     (destructuring-bind ,(nconc
                           (cons '&key
                                 (remove nil
                                         (mapcar #'(lambda (binding)
                                                     (unless (consp binding) (setf binding (list binding binding)))
                                                     (destructuring-bind (term parameter
                                                                               &key count default svar)
                                                                         binding
                                                       (cond (count (push binding collecting-parameters)
                                                                    nil)
                                                             (t `((,term ,parameter) ,default
                                                                  ,@(when svar `(,svar)))))))
                                                 bindings)))
                           (list* '&allow-other-keys
                                  (when collecting-parameters
                                    (cons '&aux
                                          (mapcar #'second collecting-parameters)))))
                         ,parse-name
       ,@(mapcar #'(lambda (binding)
                     (destructuring-bind (term parameter &key count default)
                                         binding
                       `(setf ,parameter (or (collect-property ',term ,parse-name ,count)
                                             ,default))))
                 collecting-parameters)
       ,@body)))


#+digitool
(progn (pushnew '(with-parsed-plist . 2) *FRED-SPECIAL-INDENT-ALIST* :key #'first)
       (pushnew '(with-parsed-alist . 2) *FRED-SPECIAL-INDENT-ALIST* :key #'first)
       nil)

#|

(with-parsed-terms ((|xxxx| xx 2) (|yyyy| y) zzz) '(testing) (print (list xx y zzz)))
(with-parsed-alist ((a asdf) (s s t)) '((s . 2) (a . 1) (s . 3)) (list asdf s))
(with-parsed-plist ((a asdf) (s s :count t)) '(s  2 a  1 s  3) (list asdf s))

;; the form without functional realization
(defMacro with-parsed-terms
          (binding-forms parse &rest body)
  (let ((parse-symbol (gensym "PARSE-")))
    (flet ((rewrite-term-binding (name binding &optional count)
             `(,binding (find-parsed-term ,parse-symbol ',name
                                          ,@(when count `(:count ,count))))))
      `(let ((,parse-symbol ,parse))
         (let ,(mapcar #'(lambda (b) (apply #'rewrite-term-binding b))
                       binding-forms)
           ,@body)))))

(defMacro with-parsed-term
          (parse name bindings &rest body)
  (let ((parse-symbol (gensym "PARSE")))
    `(let ((,parse-symbol ,parse))
       (destructuring-bind ,bindings
                           (rest
                            (second
                             (rassoc ,name (rest ,parse-symbol)
                                     :key #'(lambda (x) (when (consp x) (caar x))))))
         ,@body))))
|#


:eof