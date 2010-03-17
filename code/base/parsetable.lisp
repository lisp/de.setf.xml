;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-utils; -*-
;;;

#|
<DOCUMENTATION>
 <DESCRIPTION>
  class definitions specific to parsing a standard XML encoding.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010501' AUTHOR='JAA'>
   factored from XQDM model
   </DELTA>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010917'><code>delete</code> in
   <code>clear-parse-tables</code></DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-UTILS")

(defClass parsetable ()
  ((name :initform nil :initarg :name :reader table.name)
   (properties :reader table.properties)
   (macros :initform (make-array 32 :initial-element nil))))

(defMethod table.name ((table null)) nil)

(defMethod table.macros ((table parsetable))
  (with-slots (macros) table
    (if (adjustable-array-p macros)
      (setf macros (concatenate 'vector macros))
      macros)))


(defMethod initialize-instance :after
           ((instance parsetable) &key macros)
  (with-slots (properties) instance
    (setf properties (remove-if (complement #'symbolp) macros))
    (setf macros
          (apply #'concatenate 'vector
                 (mapcar #'(lambda (prop)
                             (mapcar #'(lambda (binding)
                                         (etypecase binding
                                           (cons binding)
                                           (character
                                            (cons binding
                                                  (compute-token-reader
                                                   instance binding)))))
                                     (compute-parser-macros prop)))
                         macros)))
    ;; sort reverse order in order to adjust the table once only.
    (setf macros (sort macros #'char> :key #'first))
    (map nil #'(lambda (binding) (destructuring-bind (char . macro) binding
                                   ; ignore duplicates
                                   (unless (parser-macro char instance)
                                     (setf (parser-macro char instance) macro))))
         macros)))

(defGeneric compute-parser-macros (spec)
  (:method ((characters string)) (concatenate 'list characters))
  (:method ((character character)) (list character)))

(defMethod compute-token-reader ((table parsetable) character)
  (let ((token (intern (make-string 1 :initial-element character)
                       *token-package*)))
    #'(lambda (stream char)
        (declare (ignore stream char))
        token)))

(defMethod print-object ((instance parsetable) stream)
  (with-slots (macros) instance
    (print-unreadable-object (instance stream :identity t :type t)
      (princ (table.name instance) stream)
      (write-char #\[ stream)
      (dotimes (i (length macros))
        (when (aref macros i)
          (write-char #\space stream)
          (prin1 (code-char i) stream)))
      (write-char #\space stream)
      (write-char #\] stream))))
    
(defParameter *parsetables* nil)

(defun clear-parsetables (&optional (type t) &aux table)
  (do-symbols (sym)
    (when (and (setf table (get sym :parsetable))
               (or (typep table type)
                   (and (typep table 'symbol) (boundp table)
                        (typep (setf table (symbol-value table)) type))))
      (remf (symbol-plist sym) :parsetable)
      (setf *parsetables* (delete table *parsetables*)))))

(defun parser-macro (character table)
  (with-slots (macros) table
    (let ((code (char-code character)))
      (and (< code (length macros)) (aref macros code)))))

(defun (setf parser-macro) (function character table)
  ;; always push the new value. this to allow sharing binding lists
  (with-slots (macros) table
    (let ((code (char-code character)))
      (unless (< code (length macros))
        (setf macros (adjust-array macros (1+ code) :initial-element nil)))
      (setf (aref macros code) function)))
  function)

(defun copy-parsetable (&optional original (to (make-instance 'parsetable)))
  (when original
    (with-slots ((original.macros macros)) original
      (with-slots ((to.macros macros)) to
        (setf to.macros (copy-seq original.macros)))))
  to)

(defMethod clear-parsetable ((table parsetable))
  (with-slots (macros) table
    (setf macros (make-array 32 :adjustable t :initial-element nil)))
  table)

(defMacro with-parsetable (table &rest body)
  `(let ((*parsetable* ,(if (consp table) table `(parsetable ',table))))
     ,@body))

(defMacro def-parsetable (name &rest macros &aux table-name table-class)
  "define a respective parameter for the net's readtable and bind it as a property on the
   name symbol for use when generating the compiler."
  (setf table-class (if (consp name) (second name) 'parsetable))
  (when (consp name) (setf name (first name)))
  (setf table-name (intern (concatenate 'string (string name) "-Parsetable")))
  `(progn
     (defParameter ,table-name
       (make-instance ',table-class :name ',name :macros ',macros))
     (setf (get ',name :parsetable) ',table-name)
     ;; avoid compiler warnings
     (push (symbol-value ',table-name) *parsetables*)
     ',table-name))

(defun parsetable (name)
  (when (setf name (get name :parsetable)) (symbol-value name)))

:EOF
