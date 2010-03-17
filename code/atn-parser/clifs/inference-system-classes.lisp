;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.clifs; -*-

#|
<DOCUMENTATION>
  <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <COPYRIGHT DATE='19971108' AUTHOR='mecom gmbh' />
 <COPYRIGHT DATE='19971107' AUTHOR='benno biewer' />
 <CHRONOLOGY>
  <DELTA DATE='20010122' AUTHOR='JAA'>
   cleaned up for compiler warnings. eliminated use of eval in initialization
   </DELTA>
  <DELTA DATE='20010605' AUTHOR='MS'>
   lispworks/ansi conformance</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20050614'>acl version 7.0 ansi mods</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.clifs)

(defvar *system* nil)
(defvar *inference-systems* nil)
(defvar *overwrite-without-question* t)

(defun inference-systems ()
  *inference-systems*)

(defun (setf inference-systems) (&optional systems)
  (setf *inference-systems* systems))

(defun insert-system (system)
  (flet ((frage ()
           (format nil "Es existiert bereits ein System namens ~a~
                     ~%Soll es ersetzt werden?" 
                   (system-name system))))
    (let ((old (find-system (system-name system))))
      (if old
          (if (or *overwrite-without-question*
                  (y-or-n-p (frage)))
	      (setf *inference-systems*
                    (cons system (delete old *inference-systems*))))
        (push system *inference-systems*)))))

(defmethod erase ((objects list))
  (dolist (x objects (values))
    (erase x)))

(defun default-system-name (class-name)
  (gentemp (string class-name)))

(defun parse-system-declaration (description)
  (flet ((make (class-name)
	  (apply #'make-instance 
                 class-name 
	         :name (default-system-name class-name)
                 (rest description))))
    (let (system)
      (setf system
            (if (rest description)
                (let ((class (first description))
                      (name (second description)))
                  (or (find name *inference-systems* 
                            :key #'system-name)
                      (apply #'make-instance class :name name
                             (cddr description))))
              (or (find (first description) *inference-systems*
                        :key #'system-name)
                  (make (first description)))))
      (pushnew system *inference-systems*)
      (setf *system* system))))

(defun class-name-p (x &optional superclass-name)
  (and (symbolp x)
       (if superclass-name 
           (and (find-class x nil)
                (subtypep x superclass-name))
         (find-class x nil))))

(defun find-system (x)
  (or (if (and *system* (eq (system-name *system*) x))
          *system*)
      (if *inference-systems* 
          (find x *inference-systems* :key #'system-name))))

;;; redundant
(defun system-name-p (x)
  (if (find x *inference-systems* :key #'system-name) t))

;;; Inferenzsysteme

(defclass inference-system ()
  ((name :accessor system-name :initarg :name :initform 'anonym)
   (plist :accessor system-plist :initform nil)
   (doc :accessor system-documentation :initarg :documentation
        :initform nil)))

(defun system-property (system indicator &optional default)
  (getf (system-plist system) indicator default))

(defun (setf system-property) (value system indicator)
  (setf (getf (system-plist system) indicator) value))

;; wg. CL-Konformitaet
#-clisp
(defmethod documentation ((x inference-system) #-(or CMU LispWorks4 sbcl openmcl scl
                                                     (and allegro allegro-version>= (version>= 7 0))
                                                     ) &optional type)
  (declare (ignore type))
  (slot-value x 'doc))

#-clisp
(defmethod (setf documentation) (doc (x inference-system) #-(or CMU LispWorks4 sbcl openmcl scl
                                                                (and allegro allegro-version>= (version>= 7 0))
                                                                ) &optional type)
  (declare (ignore type))
  (setf (slot-value x 'doc) doc))

(defmethod print-object ((x inference-system) stream)
  (print-unreadable-object (x stream :type t :identity t)
    (format stream "~s" (system-name x) )))

(defmethod erase ((x inference-system))
  (setf *inference-systems* (delete x *inference-systems*))
  (if (eq *system* x)
      (setf *system* (first *inference-systems*)))
  (values))

(defmethod build-system-fn-name ((system inference-system) fnname)
  (intern 
   (concatenate 'string (string (system-name system)) "-" (string fnname))))

(defun find-system-class-name (form)
  (flet ((class-name-p (x)
           (if (consp x)
               (and (eq (first x) ':system-class)
                    (class-name-p (second x) 'inference-system))
             (class-name-p x 'inference-system))))
    (find-if #'class-name-p form)))

(defclass production-system (inference-system)
  ((rules :accessor system-rules :initarg :rules :initform nil)
   (cycfn :accessor system-cycle-function :initarg :cycle-function)
   (rule-set-card :accessor system-rule-set-card :initform 0)
   (reset-function :accessor reset-function :initarg :reset-function
                   :initform #'(lambda () (values)))))

(defmethod reset-system ((x production-system) &rest args)
  (declare (ignore args))
  (funcall (reset-function x)))

(defmethod initialize-system ((x production-system) &rest initargs)
  ;; jaa changes to allow a function in order to avoid eval
  (let ((initform (system-property x 'initform)))
    (etypecase initform
      (null nil)
      (cons (eval initform))
      (function (apply initform x initargs)))))
      

#|
(defclass clifs-ops5 (production-system)
  ((working-memory :accessor system-working-memory
    :initform (make-hash-table :test #'eq))
   (rete-root-table
    :accessor rete-root-table
    :initform (make-hash-table :test #'eq))
   (browser
    :accessor system-browser
    :initform nil)
   (conflict-set 
    :reader conflict-set :initform (menge nil))
   (conflict-resolution-strategy
    :accessor conflict-resolution-strategy
    :initform 'mea)))

(defmethod default-system-unit-class ((system clifs-ops5) form)
  'ops5-rule)

(defmethod print-object ((x clifs-ops5) stream)
  (print-unreadable-object (x stream :type t :identity t)
    (format stream "~a {~a ~d}" 
            (system-name x)
            (conflict-resolution-strategy x)
            (system-rule-set-card x))))

(defmethod system-rete-roots ((system clifs-ops5))
  (loop for class being the hash-key 
        in (rete-root-table system) using (hash-value node)
        collect (cons class node)))

(defmethod initialize-instance :after ((system clifs-ops5) &rest initargs)
  (make-make-function system)
  (make-erase-function system)
;  (make-modify-function system)
  (make-cycle-function system))

(defmethod make-cycle-function ((system clifs-ops5))
  (let ((name (build-system-fn-name system 'run-cycle)))
    (let ((cs (conflict-set system)))
      (setf (system-cycle-function system)
            name
            (symbol-function name)
	    #'(lambda () 
                (fire-production (menge-pop cs)))))))

(defmethod make-make-function ((system clifs-ops5))
  (let ((name (build-system-fn-name system 'make))
        (wm (system-working-memory system))
        (rete (rete-root-table system)))
    (setf (symbol-function name)
          #'(lambda (class-name &rest args)
              (let ((wme (apply #'make-instance class-name args)))
                (setf (gethash wme wm) (gentimetag))
                (dolist (root (gethash class-name rete))
                  (enter-make root wme))
                wme)))))

(defmethod make-erase-function ((system clifs-ops5))
  (let ((fname (build-system-fn-name system 'erase))
        (wm (system-working-memory system))
        (rete (rete-root-table system)))
    (setf (symbol-function fname)
          #'(lambda (wme)
	      (dolist (root (gethash (class-name (class-of wme)) rete))
                  (enter-erase root wme))
	      (remhash wme wm)))))

|#

#| aktuell: Inline-Kodierung

(defmethod make-modify-function ((system clifs-ops5))
  (let ((modify-name (build-system-fn-name system 'modify))
        (wm (system-working-memory system))
        (rete (rete-root-table system)))
    (setf (symbol-function modify-name)
          #'(lambda (wme writers values-list)
              (let* ((class-name (class-name (class-of wme)))
                     (roots (gethash class-name rete)))
                (dolist (root roots) (enter-erase root wme))
	        (loop for w in writers
		      and n in values-list
		      do (funcall (fdefinition w) n wme))
                (setf (gethash wme wm) (gentimetag))
                (dolist (root roots)
                  (enter-make root wme)))))))
|#

(defclass fuzzy-system (inference-system)
  ())

(defclass logic-system (inference-system)
  ;; ueberfluessig
  ((basic-procedures :accessor system-basic-procedures
                     :allocation :class)))

(defclass definite-logic-system (logic-system)
  ((metapredicate :accessor system-metapredicate)
    (clause-procedure-p :accessor clause-procedure-p :initform t)
   (metasystem :accessor system-metasystem :initform nil)
   (compiler-macros :accessor system-compiler-macros
                    :initform '())
   (procedures-table :accessor system-procedures-table
                     :initarg :procedures-table
                     :initform (make-hash-table :test 'eq))))

(defmethod system-procedures ((system logic-system))
  (loop for procedure being the hash-value of 
        (system-procedures-table system)
        collect procedure))

(defmethod erase :after ((x definite-logic-system))
  (if (system-metasystem x)
      (erase (system-metasystem x))))

(defun get-metasystem (system)
  ;; kopieren
  (get (type-of system) 'clifs-metasystem))

(defmethod initialize-instance :after ((system definite-logic-system) 
                                       &rest initargs)
  (declare (ignore initargs))
#|  (setf (symbol-function (build-system-fn-name system 'get-procedure))
        (make-procedure-access-function 
         (system-procedures-table system)))
|#
  (import-compiler-macros 
   system
   (most-specific-plist system 'clifs-system-compiler-macros))
  (import-procedures 
   system
   (most-specific-plist system 'clifs-system-basic-procedures)))

(defun make-procedure-access (table name)
  #'(lambda ()
      (or (gethash name table)
          (error "Eine Prozedur namens ~s ist nicht definiert!" name))))
  
(defmethod print-object ((x definite-logic-system) stream)
  (print-unreadable-object (x stream :type t :identity t)
    (format stream "~a {~d}"
            (system-name x)
            (hash-table-count (system-procedures-table x)))))

(defclass vdl-system (definite-logic-system fuzzy-system)
  ())

(defun most-specific-plist (system indicator)
  (loop for class in (class-precedence-list (class-of system))
	for class-name = (class-name class)
	thereis (get class-name indicator)
	if (eq class-name 'inference-system) return nil))

(defmethod import-procedures ((system definite-logic-system) plist)
  (loop with table = (system-procedures-table system)
        for (name fn #|. tail|#) on plist by #'cddr
        do (setf (gethash name table) fn)))

(defmethod import-compiler-macros ((system definite-logic-system) plist)
  (loop for (name fn #|. tail|#) on plist by #'cddr
        do (setf (getf (system-compiler-macros system) name) fn)))

(defmethod default-system-unit-class ((system definite-logic-system) form)
  (if (> (length form) 1) 'definite-rule 'unit-clause))

(defclass poslog (logic-system fuzzy-system)
  ())

(defclass suplog (vdl-system)
  ())

(defclass prolog (definite-logic-system)
  ())

#|
(defmethod erase :before ((system prolog))
  (erase (system-procedures system))
  (setf (system-procedures system) nil))
|#

(defmethod system-metapredicate :before ((system prolog))
  (unless (slot-boundp system 'metapredicate)
    (setf (system-metapredicate system)
          (intern (concatenate 'string "SOLVE-" 
                               (string (class-name (class-of system))))))))

;;; Defaultbeweismethode fuer bewertete Hornlogik-Systeme benutzt den
;;; Metainterpreter! (Metapraedikate: clause/3 solve/2

#|
(defmethod toplevel-prove-using-system ((system prolog) args)
  (standard-toplevel-prove args))
|#

(defclass v-prolog (prolog vdl-system)
  ())

#|
(defmethod toplevel-prove-using-system ((system v-prolog) args)
  (let ((metagoals (build-metagoals system args)))
;    (break "V: ~a G: ~a MG: ~a" valuation goals metagoals)
    (standard-toplevel-prove metagoals)))
|#

;;; ueberfluessig?
(defmethod build-metagoals ((system v-prolog) args)
  (let* ((last2 (last args 2))
         (valuation (first last2))
         (threshold (second last2))
         (goals (butlast args 2))
         (metapredicate (system-metapredicate system)))
    (labels ((build (goals)
               (if (first goals) (list (first goals) (build (rest goals))))))
      `((,metapredicate ,(build goals) ,valuation ,threshold)))))

(defclass f-prolog (v-prolog)
  ())

;;; ueberfluessig?
(defmethod build-metagoals ((system f-prolog) args)
  (let* ((valuation (first (last args)))
         (goals (butlast args))
         (metapredicate (system-metapredicate system)))
    (labels ((build (goals)
               (if (first goals) (list (first goals) (build (rest goals))))))
      `((,metapredicate ,(build goals) ,valuation)))))

(defclass fs-prolog (v-prolog)
  ())

(defclass p-prolog (v-prolog)
  ())

;; ueberfluessig?
(defmethod build-metagoals ((system p-prolog) args)
  (let* ((valuation (first (last args)))
         (goals (butlast args))
         (metapredicate (system-metapredicate system)))
    (labels ((build (goals)
               (if (first goals) (list (first goals) (build (rest goals))))))
      `((,metapredicate ,(build goals) ,valuation)))))

(defclass fuzzy-control-system (fuzzy-system)
  ((cc-fn-name :accessor control-cycle-function-name
	       :initarg :control-cycle-function-name)
   (inference-engine :accessor inference-engine)
   (rules :accessor fuzzy-controller-rules 
          :accessor system-rules :initarg :rules)
   (input-variables :accessor input-variables 
		    :initarg :input-variables)
   (output-variables :accessor output-variables 
		     :initarg :output-variables)
   (input-vector :accessor input-vector :initarg :input-vector)
   (synonyms :accessor fuzzy-controller-synonyms 
	     :initarg :synonyms :initform nil)
   (fuzzification-method :accessor fuzzification-method)
   (condition-vector :accessor condition-vector 
		     :initarg :condition-vector)
   (input-terms :accessor input-terms :initarg :input-terms)
   (output-terms :accessor output-terms :initarg :output-terms)))

(defclass sugeno-controller (fuzzy-control-system)
  ())

(defclass simple-sugeno-controller (fuzzy-control-system)
  ())

(defclass mamdani-controller (fuzzy-control-system)
  ((defuzzification-method :accessor defuzzification-method)
   (aggegation-function :accessor aggregation-function :initform 'minimum)))

(defclass simple-mamdani-controller (mamdani-controller)
  ())