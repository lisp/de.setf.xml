;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.base.implementation; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>
  this file provides the basic condition-handling frame work for xml and
  xml-related processing.</p>
  the processing conditions are organized into an hierarchy rooted at the class xml-condition. this class is specialized as xml-warning and xml-error, which is further specialized as continuable-xml-error and internal-xml-error.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2002' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20021020'>
   factored non-module-specific conditions, the function interface, and
   the abstract reporting methods out of xqdm-conditions.lisp.
   the abstract conditions don't entail the parse-error behaviour implemented
   in the , but
   the reporting methods are defined with a progn method combination so that
   they can be 
   eliminated "XML-ERROR-" prefix on condition function names.</DELTA>
  <DELTA DATE='20030110'> isolated conditions for respective modules -
   encoding, names, document model, parsing, ...</DELTA>
  <DELTA DATE='20030319'>abstracted base instantiation and printing protocol to de.setf.utility's
    conditions</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.xml.base.implementation)

;;
;;
;; abstract conditions

(define-condition xml-condition (simple-condition)
  ((document :initarg :document :initform nil :reader condition-document))
  (:report report-condition)
  (:default-initargs :format-control nil :format-arguments nil))

(define-condition xml-error (xml-condition simple-error) ()
  )
(defParameter xml-error 'xml-error)

(define-condition xml-warning (xml-condition simple-warning) ()
  )
(defParameter xml-warning 'xml-warning)


(define-condition internal-xml-error (xml-error) ())

(defParameter internal-xml-error 'internal-xml-error)


(defGeneric xml-error (condition &rest args)
  (:documentation
   "distinguish error handling for terminal/continuable/validity error.
    allow as specification<ul>
    <li>a symbol with args, which generates the respective condition instance,</li>
    <li>a condition, which uses it as is</li>
    </ul>")
  (:method ((condition null) &key &allow-other-keys)
           ; error is ignored
           nil)
  (:method ((condition symbol) &rest args)
           (declare (dynamic-extent args))
           (xml-error (if (stringp (first args))
                        (make-condition condition :format-control (first args) :format-arguments (rest args))
                        (apply #'make-condition condition args))))
  (:method ((condition continuable-error) &rest args)
           (when args (setf condition (apply #'make-initialized-condition condition args)))
           (apply #'cerror (condition-continue-format-control condition)
                  condition (condition-continue-format-arguments condition)))
  (:method ((condition error) &rest args)
           (when args (setf condition (apply #'make-initialized-condition condition args)))
           (error condition))
  (:method ((condition warning) &rest args)
           (when args (setf condition (apply #'make-initialized-condition condition args)))
           (warn condition))
  (:method ((message string) &rest args)
           (xml-error 'xml-error :format-control message :format-arguments args)))
;(xml-error "testing ~a, ~a, ~a" 1 2 3)
;(xml-error 'xml-error "testing ~a, ~a, ~a" 1 2 3)

(defGeneric xml-warn (datum &rest args)
  (:method ((format-control string) &rest args)
           (apply #'warn xml-warning :format-control format-control :format-arguments args))
  (:method ((condition symbol) &rest args)
           (declare (dynamic-extent args))
           (apply #'warn condition args)))

(defun internal-xml-error (format-control &rest format-args)
  (xml-error internal-xml-error
             :format-control format-control :format-arguments format-args))

;;
;;
;; condition definition macros

(defMacro def-exception
          ((name kind) super slots &rest options
           &aux (checks (remove :check options :test-not #'eq :key #'first))
           (report (find :report-condition options :key #'first))
           (format-arguments (find :format-arguments options :key #'first))
           (initialize (find :initialize options :key #'first))
           (c-string (concatenate 'string (string kind) ": " (string name)))
           (c-name nil))
  (cond ((setf c-name (find-symbol c-string *package*))
         (unintern c-name *package*)
         (import c-name :de.setf.xml.conditions))
        (t
         (setf c-name (intern c-string :de.setf.xml.conditions))))
  (when report (setf options (remove report options)
                     report (second report)))
  (when format-arguments (setf options (remove format-arguments options)
                               format-arguments (rest (second format-arguments))))
  (when initialize (setf options (remove initialize options)
                     initialize (rest (second initialize))))
  (when checks (setf options (set-difference options checks)))
  `(progn (eval-when (:compile-toplevel :load-toplevel :execute)
            (export ',c-name :de.setf.xml.conditions)
            (import ',c-name :de.setf.xml)
            (export ',c-name :de.setf.xml)
            (import ',c-name  :de.setf.xml.interface)
            (export ',c-name  :de.setf.xml.interface)
            (defParameter ,c-name nil))
          (define-condition ,c-name ,super ,slots
            ,@options)
          (setq ,c-name (make-condition ',c-name))
          (defun ,c-name (&rest args)
            (apply #'xml-error ,c-name args))
          ,@(when report
              (destructuring-bind (lambda (name stream &rest parms) &rest body) report
                (unless (eq lambda 'lambda)
                  (error "illegal exception definition clause: ~s." report))
                `((defMethod report-condition ((,name ,c-name) ,stream ,@parms)
                    ,@body))))
          ,@(when format-arguments
              (destructuring-bind ((name &rest parms) &rest body) format-arguments
                `((defMethod simple-condition-format-arguments ((,name ,c-name) ,@parms)
                    ,@body))))
          ,@(when initialize
              (destructuring-bind ((name &rest parms) &rest body) initialize
                `((defMethod initialize-instance ((,name ,c-name) ,@parms)
                    ,@body))))
          ,@(mapcar #'(lambda (check)
                        (destructuring-bind ((condition instance
                                                        &rest parameter-list)
                                             &rest body)
                                            (rest (second check))
                          `(defMethod check-constraint
                                      (,(if (symbolp condition)
                                          `(,condition ,c-name)
                                          condition)
                                       ,instance
                                       ,@parameter-list)
                             ,@body)))
                    checks)
          ',c-name))

;;
;;
;; 

(defGeneric check-constraint (constraint-condition instance)
  (:method ((constraint null) (instance t)) nil)
  #|20020820 the normal case specializes based on condition name
   otherwise, where make-condition is used (for portability) checking a constraint would initialize
   the constraint, which would include, for instance, capturing the parse state.
  (:method ((constraint symbol) (instance t))
           ;; generate an instance for a constraint name
           (check-constraint (make-condition constraint) instance))|#
  (:method ((constraint t) (instance t))
           (warn "cannot be deterimined how to apply to instance: ~s: ~s."
                 constraint instance))
  (:documentation
   "collects the condition/instance related constraints in a single generic function.
    implementations are provided for the initial values for the respective conditions.
    a method for the <code>NULL</code> case permits an application to disable a constraint
    by rebinding a condition variable to <code>NIL</code>.
    in the normal case, the condition is bound to a symbol and methods are specialized on symbols.
    where it is necessary to parameterize the constraints or to refine and combine conditions,
    the method can be specialized on the class
    and the condition can be instantiated as the point where the constraint is applied."))



:EOF