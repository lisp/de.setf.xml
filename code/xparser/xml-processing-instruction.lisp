;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  processing instruction definitions
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010502' AUTHOR='JAA'/>
  <DELTA DATE='20010722'>reworked for namespace/package distinction</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")

(defun (setf pi-function) (function name)
  (setf (gethash name *processing-instructions* ) function))

(defun pi-function (name)
  (gethash name *processing-instructions*))

(defMacro def-pi-function (name args &rest body)
  "defines a functions of two arguments (target-name string-value), which
   and makes it known to the parser as a processing instruction.
   nb. <em>trailing</em> whitespace in the string argument is <em>not</em>
   trimmed."
  `(progn (defun ,name ,args ,@body)
          (setf (pi-function ',(intern-name (string name) "")) (function ,name))
          ',name))

;;
;;
;;

;; processing instructions for the example of namespace operations.

(defParameter *pi-namespaces* nil
  "binds those namespaces availailable for pi-encoded operations.")

(defun find-pi-namespace (name &key (if-does-not-exist :error) &aux ns)
  (if (setf ns (find name *pi-namespaces* :test #'string= :key #'namespace-name))
    ns
    (case if-does-not-exist
      ((nil) nil)
      (:create (setf ns (find-namespace name :if-does-not-exist :create
                                        :if-exists :error))
               (push ns *pi-namespaces*)
               ns)
      (:error
       (xml-error "Attempt to locate an undefined namespace: ~s" name)))))



(def-pi-function |ns_export| (name arg)
  (declare (ignore name))
  (destructuring-bind (ns &rest names)
                      (split-sequence arg #'xml-space?)
    (setf ns (find-pi-namespace ns))
    (setf names (mapcar #'(lambda (name) (intern-name name ns)) names))
    (export-names names ns)))

(def-pi-function |ns_import| (name arg)
  (declare (ignore name))
  (destructuring-bind (ns &rest names)
                      (split-sequence arg #'xml-space?)
    (setf ns (find-pi-namespace ns))
    (setf names
          (mapcar #'(lambda (name &aux ns (colon (position #\: name)))
                      (cond (colon
                             (setf ns (find-pi-namespace (subseq name 0 colon)))
                             (or (find-name (subseq name (1+ colon)) ns)
                                 (xml-error
                                  "name not present in space: ~s." name)))
                            (t
                             (or (find-name name *null-namespace*)
                                 (xml-error
                                  "name not present in space: ~s." name)))))
                  names))
    (import names ns)))

(def-pi-function |ns_make| (target arg)
  (declare (ignore target))
  #+namespace-algebra
  (destructuring-bind (ns-name &rest nicknames)
                      (split-sequence arg #'xml-space?)
    (let ((ns (find-pi-namespace ns-name :if-does-not-exist :create)))
      (rename-namespace ns ns-name nicknames)
      ns))
  #-namespace-algebra
  (find-pi-namespace arg :if-does-not-exist :create))


#+namespace-algebra
(def-pi-function |ns_nickname| (name arg)
  (|ns_make| name arg))

#+namespace-algebra
(def-pi-function |ns_shadow| (name arg)
  (declare (ignore name))
  (destructuring-bind (ns &rest names)
                      (split-sequence arg #'xml-space?)
    (setf ns (find-pi-namespace ns))
    (shadow-names names ns)))

#+namespace-algebra
(def-pi-function |ns_unuse| (name arg)
  (declare (ignore name))
  (destructuring-bind (using &rest to-use)
                      (mapcar #'find-pi-namespace (split-sequence arg #'xml-space?))
    (unuse-namespace to-use using)))

#+namespace-algebra
(def-pi-function |ns_use| (name arg)
  (declare (ignore name))
  (destructuring-bind (using &rest to-use)
                      (mapcar #'find-pi-namespace (split-sequence arg #'xml-space?))
    (use-namespace to-use using)))


:EOF
