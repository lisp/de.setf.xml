;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: tal; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>this file implements a TAL (Template Attribute Langauge) in lisp.
  the language syntax follows that of the the ZPT (Zope Page Template) attribute language,
  whereby python expressions are supplanted by lisp expressions and maro definitions/invocations
  by definitions and applications of encoding functions. </p>
  <p>see <a href='file://xml/documentation/tal.html">tal/lisp</a>
   <p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20020210'>new</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>

|#

(in-package "TAL")

(eval-when (:compile-toplevel :load-toplevel :execute)
  
  (defNamespace "http://xml.zope.org/namespaces/tal"
    (:nicknames "tal")
    (:export "define" "attributes" "condition" "content" "replace" "repeat" "on-error" "omit-tag"
             ;; identifiers inaddition to the standard
             "stylesheet" "*")
    ;; (:determinant nil)
    ;; (:permission :read-only)
    )
  
  #+xml-name-instances
  (defPackage "tal" (:use))

  (defNamespace "http://xml.zope.org/namespaces/metal"
    (:nicknames "metal")
    (:export "define-macro" "use-macro" "*")
    ;; (:determinant nil)
    ;; (:permission :read-only)
    )

  )

(defVar *tal-macros* nil
  "binds macro forms as extracted from a page template.")

(defGeneric translate-tal-definition (source destination &rest args)
  (:documentation
   "translate a TAL expression from a specified source into a lisp function and write it to the
    specified destination."))



(defun read-tal-lambda-list (string)
  (read-from-string (concatenate 'string "(" string ")")))

(defMethod translate-tal-definition ((source t) (destination t) &rest args
                                     &key (entity-cache nil entity-cache-p)
                                     &aux source-node)
  (when *xml-verbose*
    (format *trace-output* "~%;; translating tal definition ~s -> ~s." source destination))
  (when entity-cache-p (remf args :entity-cache))
  (handler-bind ((|WFC: Entity Declared|
                  (lambda (condition) (declare (ignore condition))
                          (continue))))
    (setf source-node (parse-document source :entity-cache entity-cache)))
  (typecase source-node
    (doc-node (apply #'translate-tal-definition source-node destination args))
    (t
     (error "source produced intractable tal definition: ~s: ~s." source source-node))))

(defMethod translate-tal-definition ((source t) (destination-pathname pathname) &rest args)
  (with-open-file (output destination-pathname :direction :output
                          :if-exists :supersede :if-does-not-exist :create)
    (apply #'translate-tal-definition source output args)))

(defMethod translate-tal-definition ((definition doc-node) (destination stream) &rest args)
  (format destination ";;;~%;;; ~s " (uri definition))
  (format destination "~%;;; ~a ~%;;; " (get-iso-time-string))

  (dolist (form  (apply #'translate-tal-definition definition nil args))
    (pprint form destination))

  (format destination "~%~%:EOF~%"))

(defMethod translate-tal-definition ((definition doc-node) (destination null) &rest args
                                     &aux (root (root definition))
                                     (root-function-name (name-function-symbol (name root) *package*))
                                     root-form 
                                     (*tal-macros* nil)
                                     top-level-function)
  ;; generate the encoder for the root element
  (setf root-form (apply #'translate-tal-definition root nil args))

  (flet ((top-level-function (body-form
                                   &aux (prologue (with-output-to-string (prologue-stream)
                                                    (with-xml-writer (prologue-stream)
                                                      (encode-xml-declaration definition)
                                                      (encode-newline)
                                                      (encode-doctype definition)
                                                      (encode-newline)))))
           `(defMethod ,root-function-name ((tal:this t) &rest options)
              (encode-string ,prologue)
              ,body-form)))
    
    ;; if the root form is not a macro form, then incorporate it into the top-level function, otherwise
    ;; just call it from the top-level function
    (cond (root-form
           (setf top-level-function (top-level-function root-form)))
          (t
           (let* ((root-macro-expression (ignore-errors (translate-tal-define-macro (./@ root '{metal}define-macro))))
                  (root-macro-name (first root-macro-expression)))
             (unless root-macro-name
               (warn "neither form nor macro definition produced: ~s." root))
             (setf top-level-function (top-level-function `(apply (function ,root-macro-name) options)))))))
  (cons top-level-function *tal-macros*))

  



(defMethod translate-tal-definition ((definition elem-node) (destination stream) &rest args)
  (pprint (apply #'translate-tal-definition definition nil args) destination))

(defMethod translate-tal-definition ((definition string) (destination null) &rest args)
  (declare (ignore args))
  `(encode-node ,definition))

(defMethod translate-tal-definition ((node abstract-node) (destination null) &rest args)
  (declare (ignore args))
  `(encode-node ,node))

(defun translate-tal-expression (expression) expression)

(defGeneric translate-tal-attributes (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-attributes (value-string expression)))
  (:method ((expression string))
           (parse-attributes expression)))

(defGeneric translate-tal-condition (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-condition (value-string expression)))
  (:method ((expression string))
           (parse-condition expression)))

(defGeneric translate-tal-content (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-content (value-string expression)))
  (:method ((expression string)) (parse-content expression)))

(defGeneric translate-tal-define (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-define (value-string expression)))
  (:method ((expression string)) (parse-define expression)))

(defGeneric translate-tal-define-macro (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-define-macro (value-string expression)))
  (:method ((expression string)  &aux (space (position-if #'xml-space? expression)))
           ;; the first term is interned in the namespace's corresponding package.
           ;; the rest of the expression is read normally
           (if space
             (list (name-function-symbol (make-uname (subseq expression 0 space)))
                   (read-from-string expression t nil :start space))
             (list (name-function-symbol (make-uname expression))))))

(defGeneric translate-tal-omit-tag (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-omit-tag (value-string expression)))
  (:method ((expression string))
           (setf expression (string-trim #(#\linefeed #\tab #\space #\return) expression))
           (if (zerop (length expression))
             t
             (parse-omit-tag expression))))

(defGeneric translate-tal-on-error (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-on-error (value-string expression)))
  (:method ((expression string))
           (parse-on-error expression)))

(defGeneric translate-tal-repeat (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-repeat (value-string expression)))
  (:method ((expression string))
           (parse-repeat expression)))

(defGeneric translate-tal-replace (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-replace (value-string expression)))
  (:method ((expression string))
           (parse-replace expression)))

(defGeneric translate-tal-use-macro (expression)
  (:method ((expression null)) nil)
  (:method ((expression attr-node)) (translate-tal-use-macro (value-string expression)))
  (:method ((expression string) &aux (space (position-if #'xml-space? expression)))
           ;; the first term is interned in the namespace's corresponding package.
           ;; the rest of the expression is read normally
           (if space
             (cons (name-function-symbol (make-uname (subseq expression 0 space)))
                   (let ((arguments nil) (argument nil))
                     (with-input-from-string (stream expression :start space)
                       (loop (unless (setf argument (read stream nil nil))
                               (return (nreverse arguments)))
                             (push argument arguments)))))
             (list (name-function-symbol (make-uname expression))))))



(defMethod translate-tal-definition ((definition elem-node) (destination null) &rest args
                                     &aux
                                     (name (name definition))
                                     (*attributes* (concatenate 'list
                                                                (attributes definition)
                                                                (namespaces definition)))
                                     (*namespace-bindings* *namespace-bindings*)
                                     (tal-ns-node (find '{xmlns}tal (namespaces definition) :key #'name))
                                     (tal-statements (./@* definition '{tal}*))
                                     (metal-statements (./@* definition '{metal}*)))
  "generate a function of one argument, <code>this</code>, which transforms the argument according to the
   template."
  (declare (special *attributes*))
  (dolist (ns-node (namespaces definition))
    (setf (prefix-namespace (prefix ns-node)) (namespace ns-node)))
  (when tal-ns-node (setf *attributes* (remove tal-ns-node *attributes*)))
  (cond ((or tal-statements metal-statements)
         (let* ((tal-define-macro (translate-tal-define-macro
                                   (./@ metal-statements '{metal}define-macro)))
                (tal-use-macro (translate-tal-use-macro
                                (./@ metal-statements '{metal}use-macro)))
                (tal-definitions (translate-tal-define (find '{tal}define tal-statements  :key #'name)))
                (local-definitions (remove 'setq tal-definitions :key #'first))
                (global-definitions (remove 'let tal-definitions :key #'first))
                (tal-attributes (translate-tal-attributes (find '{tal}attributes tal-statements :key #'name)))
                (tal-condition (translate-tal-condition (find '{tal}condition tal-statements :key #'name)))
                (tal-content (translate-tal-content (find '{tal}content tal-statements :key #'name)))
                (tal-replace (translate-tal-replace (find '{tal}replace tal-statements :key #'name)))
                (tal-repeat (translate-tal-repeat (find '{tal}repeat tal-statements :key #'name)))
                (tal-on-error (translate-tal-on-error (find '{tal}on-error tal-statements :key #'name)))
                (tal-omit-tag (translate-tal-omit-tag (find '{tal}omit-tag tal-statements :key #'name))))
           (when (or (and tal-content (or tal-replace tal-use-macro))
                     (and tal-replace tal-use-macro))
             (error "multiple replacement statements in form: ~a." definition))
           (when tal-statements
             (setf *attributes* (set-difference *attributes* tal-statements)))
           (when metal-statements
             (setf *attributes* (set-difference *attributes* metal-statements)))
           (setf tal-attributes (mapcar #'(lambda (attr-plist &aux attr)
                                            (destructuring-bind (&key qname expression) attr-plist
                                              (cond ((setf attr (find qname *attributes* :key #'name))
                                                     (list qname
                                                           `(restart-case ,expression
                                                              (abort (&rest args) (declare (ignore args))
                                                                     ',(children attr)))))
                                                    (t
                                                     (list qname expression)))))
                                        tal-attributes))
           (setf *attributes* (remove nil (mapcar #'(lambda (attr)
                                                      (unless (find (name attr) tal-attributes :key #'first)
                                                        `(,(name attr)
                                                          ',(children attr))))
                                                  *attributes*)))
           (let* ((do-with-tag-form `(xml (,name ,@*attributes*
                                                 ,@tal-attributes)
                                          (encode-children)))
                  (body `(flet ((encode-children ()
                                  ,(let ((children-form
                                          `(progn ,@(remove nil
                                                            (mapcar #'(lambda (child) (apply #'translate-tal-definition child nil args))
                                                                    (children definition))))))
                                     (if tal-content 
                                       `(restart-case ,tal-content
                                          (abort (&rest args) (declare (ignore args))
                                                 ,children-form))
                                       children-form))))
                           ,(case tal-omit-tag
                              ((nil) do-with-tag-form)
                              ((t) `(encode-children))
                              (t `(if (|tal|::true
                                       (restart-case ,tal-omit-tag
                                         (abort (&rest args) (declare (ignore args)) nil)))
                                    (encode-children) ,do-with-tag-form))))))
             (when tal-repeat
               (destructuring-bind (&key ncname expression &aux (repeat (intern (concatenate 'string "REPEAT/" (string ncname)))))
                                   tal-repeat
                 (setf body `(let ((,repeat 0))
                               (map nil #'(lambda (,ncname)
                                            ,body
                                            (incf ,repeat))
                                    ,expression)))))
             (when tal-condition
               (setf body `(when (|tal|::true
                                  (restart-case ,tal-condition
                                    (abort (&rest args) (declare (ignore args)) t)))
                             ,body)))
             (when local-definitions
               (setf body `(let ,(mapcar #'rest local-definitions) ,body)))
             (when global-definitions
               (setf body `(progn (progn ,@global-definitions) ,body)))
             (cond (tal-replace
                    (setf body
                          `(restart-case ,tal-replace
                             (abort (&rest args) (declare (ignore args))
                                    ,body))))
                   (tal-use-macro
                    (setf body
                          `(restart-case ,tal-use-macro
                             (abort (&rest args) (declare (ignore args))
                                    ,body)))))
             (when tal-on-error
               (setf body `(handler-bind ,body ,@tal-on-error)))

             ;; now, either return the form as a constituent, or add it to the global definitions
             (cond (tal-define-macro
                    (push `(defmethod ,@tal-define-macro ,body) *tal-macros*)
                    nil)
                   (t
                    body)))))
        (t
         (tal-element name (set-difference *attributes* tal-statements) (children definition)))))


(defMethod tal-element (name attributes children)
  `(xml ,(if attributes
           (list* name (mapcar #'(lambda (node) (list (name node) (value-string (children node))))
                               attributes))
           name)
        ,@(mapcar #'(lambda (child) (translate-tal-definition child nil))
                  children)))

(defun |tal|::true (x)
  (typecase x
    (null nil)
    (string (not (find-if #'(lambda (c) (not (find c "-.0 "))) x)))
    (number (not (zerop x)))
    (t t)))

(defun |tal|::false (x) (not (|tal|::true x)))

#|
(translate-tal-definition (root (parse-document "<asdf tal:replace='lisp:1234' xmlns:tal='tal'>qwer</asdf>")) nil)

(trace translate-tal-replace ./@)
|#

:EOF
