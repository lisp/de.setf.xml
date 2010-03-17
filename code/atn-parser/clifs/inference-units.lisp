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
  <DELTA DATE='20010619'>procedure-metaobject-class also compile-time</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20050614'>acl version 7.0 ansi mods</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.clifs)

(defparameter *source-recording* t)

(defclass inference-unit ()
  ((system :accessor system :initarg :system :initform *system*)))

(defclass rule (inference-unit)
  ((sources :accessor rule-sources 
            :initarg :sources 
            :initform nil)
   (name :accessor rule-name :initarg :name)
   (documentation :accessor rule-documentation
                  :initarg :documentation)))

(defmethod documentation ((x rule) #-(or CMU LispWorks4 sbcl openmcl scl
                                         (and allegro allegro-version>= (version>= 7 0))
                                         ) &optional doc-type)
  (declare (ignore doc-type))
  (slot-value x 'documentation))

(defmethod (setf documentation) (doc-string (x rule) #-(or CMU LispWorks4 sbcl openmcl scl
                                                           (and allegro allegro-version>= (version>= 7 0))
                                                           ) &optional doc-type)
  (declare (ignore doc-type))
  (setf (slot-value x 'documentation) doc-string))

#|
   (wfc :accessor well-formed-conditions 
        :initform nil
        :initarg nil)
   (wfa :accessor well-formed-actions
        :initform nil
        :initarg nil)))
|#
(defmethod ensure-sources ((object rule) definition)
  (if *source-recording*
      (setf (rule-sources object) definition)))

(defclass control-rule (rule)
  ((condition :accessor rule-condition :initarg :condition)
   (action :accessor rule-action :initarg :action)))

(defclass fuzzy-control-rule (control-rule)
  ())

(defclass sugeno-rule (fuzzy-control-rule)
  ())

(defclass mamdani-rule (fuzzy-control-rule)
  ())

(defclass production (rule)
  ())

(defclass ops5-rule (production)
  ((locn :accessor local-nodes :initform nil)
   (sysn :accessor system-nodes :initform nil)
   (spec :accessor rule-specifity 
         :initform 0
         :initarg :specifity)
   (prio :accessor rule-priority
         :initform 0
         :initarg :priority)
   (acfn :accessor rule-action-function)
   (eqfn :accessor general-equal-function
	 :initform 'equal 
         :initarg :equal-function-name)))

(defmethod print-object ((x ops5-rule) stream)
  (print-unreadable-object (x stream :type nil :identity t)
    (format stream "~s [~d] ~s" 
            (rule-name x) 
            (rule-specifity x)
            (system-name (system x)))))

(defclass flops-rule (ops5-rule)
  ())

(defclass spii-rule (production)
  ())

(defclass clause (inference-unit)
  ((source :accessor clause-source-code)))

(defclass logic-rule (clause rule)
  ())

#|(antecedent :accessor antecedent :initarg :antecedent)
   (consequent :accessor consequent :initarg :antecedent)))
|#

(defclass horn-clause (clause)
  (#-:lispworks(fn :accessor funcallable-instance-function)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defclass funcallable-clause-metaobject-class 
    (#+:lispworks funcallable-standard-class #-:lispworks standard-class)
    ()
    #+clisp (:metaclass structure-class))
  
  (defmethod validate-superclass 
             ((class funcallable-clause-metaobject-class)
              (superclass standard-class))
    t)
  )

(defclass definite-program-clause (horn-clause)
  ((procedure :accessor clause-procedure :initarg :procedure))
  (:metaclass funcallable-clause-metaobject-class))

(defclass definite-goal (horn-clause)
  ((user-goals :accessor clause-user-goals)
   (system-goal :accessor clause-system-goal))
  (:metaclass funcallable-clause-metaobject-class))

(defclass definite-rule (definite-program-clause logic-rule)
  ()
#|  ((antecedent :accessor clause-body :initarg :body)
   (consequent :accessor clause-head :initarg :head))
|#
  (:metaclass funcallable-clause-metaobject-class))

(defclass unit-clause (definite-program-clause)
  () 
;;; ((consequent :accessor clause-head :initarg :head))
  (:metaclass funcallable-clause-metaobject-class))

(defclass vdu-clause (unit-clause)
  ((valuation :accessor clause-valuation :initarg :valuation))
  (:metaclass funcallable-clause-metaobject-class))

(defclass vdg-clause (definite-goal)
  ((valuation :accessor clause-valuation :initarg :valuation))
  (:metaclass funcallable-clause-metaobject-class))

(defclass vdr-clause (definite-rule)
  ((valuation :accessor clause-valuation :initarg :valuation))
  (:metaclass funcallable-clause-metaobject-class))

;;; logische Prozeduren

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defclass procedure-metaobject-class (#+:lispworks funcallable-standard-class #-:lispworks standard-class)
    ()
    #+clisp (:metaclass structure-class))
  
  (defmethod validate-superclass 
             ((class procedure-metaobject-class)
              (superclass standard-class))
    t)
  )

(defclass system-procedure (inference-unit)
  ((name :accessor procedure-name :initarg :name)
   (arity :accessor procedure-arity :initarg :arity)
   #-:lispworks(fn :accessor funcallable-instance-function))
  (:metaclass procedure-metaobject-class))

(defclass logic-procedure (inference-unit)
  ((system :accessor procedure-system :initarg :system)
   (cardinality :accessor procedure-cardinality :initform 0)
   (name :accessor procedure-name :initarg :name)
   (arity :accessor procedure-arity :initarg :arity)
   #-:lispworks(fn :accessor funcallable-instance-function)
;   (sources :accessor procedure-sources :initarg :sources :initform nil)
   (clauses :accessor procedure-clauses :initform nil))
  (:metaclass procedure-metaobject-class))

(defmethod procedure-sources ((x logic-procedure))
  (mapcar #'clause-source-code (procedure-clauses x)))

(defmethod print-object ((x logic-procedure) stream)
  (print-unreadable-object (x stream :type nil :identity nil)
    (format stream "~s [~d] {~s}" 
            (procedure-name x)
            (system-name (procedure-system x))
            (procedure-cardinality x))))

(defclass definite-logic-procedure (logic-procedure)
  ()
  (:metaclass procedure-metaobject-class))

(defclass prolog-procedure (definite-logic-procedure)
  ()
  (:metaclass procedure-metaobject-class))

(defclass suplog-procedure (definite-logic-procedure)
  ()
  (:metaclass procedure-metaobject-class))

(defclass poslog-procedure (logic-procedure)
  ()
  (:metaclass procedure-metaobject-class))

(defclass vprolog-procedure (prolog-procedure)
  ()
  (:metaclass procedure-metaobject-class))
