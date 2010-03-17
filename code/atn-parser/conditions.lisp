;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  condition definitions atn-based parser
  </DESCRIPTION>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20030319'>separated from "atn-runtime.lisp"; read-only conditions</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20030816'>clisp</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "BNF-PARSER")


;;
;;
;; parse state and conditions

(defParameter *terminal-parser-error-action* nil
  "specifies how parser reacts to non-continuable errors.
   the value NIL, the default value, allows the signalled error to pass up to the caller.
   the value :CONTINUE permits the parse to continue, but uses NIL as the effective
   parse for the respective term.
   the value :ABORT terminates the parse with the value NIL.
   a function is called with no arguments.")



(defClass parse-state ()
  ((condition :initform nil :reader parse-state-condition :type (or null condition)
              :documentation "binds the condition related to this parse state")
   (source :initform (atn-input) :reader parse-state-source
           :documentation
           "the slot source binds the active input source. it serves as an indicator whether other access is within the parser's dynamic context.")
   (term :initform *atn-term?* :reader parse-state-term :type common-lisp:symbol
         :documentation
         "the slot term binds the pending bnf r-h-s term symbol.")
   (non-terminal :initform *atn-term* :reader parse-state-non-terminal :type common-lisp:symbol
                 :documentation
                 "the slot non-terminal binds the active bnf non-terminal symbol.")
   (stack :type list
          :documentation
          "the slot stack binds the active list of non-terminals. as that value has dynamic extent, it must be copied if used outside of the parser's dynamic context. this is checked at the point where it is first referenced.")))

(defGeneric parse-state-active-p (state)
  (:method ((state parse-state))
           (with-slots (source) state
             (and source (eq source (atn-input))))))

(defMethod parse-state-stack ((state parse-state))
  "reifies the stack list. the slot is initially unbound; upon first reference the accessor checcks if the dynamic parse state still exists by comparing its cached input with the current binding. if they match, then the current stack is reified and cached. otherwise a null value is asserted."
  (with-slots (source stack) state
    (if (slot-boundp state 'stack)
      stack
      (setf stack (when (and (parse-state-active-p state) (boundp '*atn-stack))
                    (copy-list *atn-stack))))))

(defGeneric print-parse-state (state stream)
  #-(or scl clisp) (:method-combination condition-report :fresh-line-p nil)
  (:method ((state parse-state) stream)
           (format stream ":source ~s :term ~s :non-terminal ~s :stack ~s "
                   (parse-state-source state) (parse-state-term state)
                   (parse-state-non-terminal state) (parse-state-stack state))))

(defGeneric make-parse-state (context)
  (:method ((context null)) (make-instance 'parse-state)))

(defMethod print-object ((instance parse-state) stream)
  (print-unreadable-object (instance stream :type t)
    (print-parse-state instance stream)))



(define-condition parser-error ()
  ((parse-state :initform (make-parse-state (atn-input)) :reader condition-parse-state
                :type parse-state))
  (:documentation
   "the class parser-error is the abstract, general form of conditions related to errors during parsing.
    it provides a cached description of the parser's state at the point where the condition is created.
    as much of the state may initially have dynamic extent, an additional reader, condition-parse-state, is exported
    to ensure that state information is rendered permanent when needed.")
  (:report report-condition))

(defMethod report-condition ((condition parser-error) stream)
  (format stream "parser error~@[ with-state ~s~]."
          (condition-parse-state condition)))

(defMethod initialize-condition :after ((condition parser-error) &key)
  (setf (slot-value (condition-parse-state condition) 'condition) condition))

         

(define-condition terminal-parser-error (parser-error)
  ((action :initform *terminal-parser-error-action* :reader condition-action)))


(define-condition continuable-parser-error (parser-error continuable-error)
  ())

(define-condition parser-eof-error (terminal-parser-error end-of-file) ())



:eof