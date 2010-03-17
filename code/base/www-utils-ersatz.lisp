;;;-*- Syntax: Ansi-Common-Lisp; Base: 10; Mode: lisp; Package: www-utils -*-

#|
<DOCUMENTATION>
 <CHRONOLOGY>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20030816'>clisp</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#
(in-package "WWW-UTILS")

;;
;;
;; implementation-specific macro to execute the body under a lock

;;; from cl-http:clim;clim-sys;process.lisp
#+allegro
(defmacro with-lock-held ((lock &optional (mode :write) (whostate "Wait for Lock")) &body body)
  "Executes BODY with LOCK held in MODE, which is one of :READ or :WRITE."
  (declare (ignore mode))
  `(mp:with-process-lock (,lock :norecursive t :whostate ,whostate) ,@body))

#+clisp
(defmacro with-lock-held ((lock &optional (mode :write)
				(whostate "Wait for Lock")) &body body)
  "without mp, with-lock-held devolves to a progn"
  (declare (ignore mode whostate lock))
  `(progn
     ,@body))

;;; from cl-http:cmucl;server;unix.lisp
#+(and CMU mp)
(defmacro with-lock-held ((lock &optional (mode :write) (whostate "Wait for Lock")) &body body)
  "Executes BODY with LOCK held in MODE, which is one of :READ or :WRITE."
  (declare (ignore mode))
  `(mp:with-lock-held (,lock ,whostate)
     ,@body))

#+(and CMU (not mp))
(defmacro with-lock-held ((lock &optional (mode :write)
				(whostate "Wait for Lock")) &body body)
  "without mp, with-lock-held devolves to a progn"
  (declare (ignore mode whostate lock))
  `(progn
     ,@body))

#+CormanLisp
(defmacro with-lock-held ((lock &optional (mode :write)
				(whostate "Wait for Lock")) &body body)
  "Executes BODY with LOCK held in MODE, which is one of :READ or :WRITE."
  (declare (ignore mode whostate lock))
  `(progn
     ,@body))

;;; from cl-http:clim;clim-sys;process.lisp
#+lispworks
(defmacro with-lock-held ((lock &optional (mode :write) (whostate "Wait for Lock")) &body body)
  "Executes BODY with LOCK held in MODE, which is one of :READ or :WRITE."
  (declare (ignore mode))
  `(mp:with-lock (,lock ,whostate) ,@body))

;;; from cl-http:mcl;server;mcl.lisp
#+MCL
(defmacro with-lock-held ((lock &optional (mode :write) (whostate "Wait for Lock")) &body body)
   "Executes BODY with LOCK held in MODE, which is one of :READ or :WRITE."
   #-:multiple-reader-locks (declare (ignore mode))
   #-:multiple-reader-locks
   `(ccl:with-lock-grabbed 
       (,lock ccl::*current-process* ,whostate)
       . ,body)
   #+:multiple-reader-locks
   `(ccl::with-lock (,lock :mode ,mode :lock-value ccl::*current-process* :whostate ,whostate)
       . ,body))

#+sbcl
(defmacro with-lock-held ((lock &optional (mode :write)
				(whostate "Wait for Lock")) &body body)
  "without mp, with-lock-held devolves to a progn"
  (declare (ignore mode whostate lock))
  `(progn
     ,@body))

#+scl
(defmacro with-lock-held ((lock &optional (mode :write) (whostate "Wait for Lock")) &body body)
  (declare (ignore mode))
  `(thread:with-lock-held (,lock ,whostate)
     ,@body))

#+(and ccl clozure)
(defmacro with-lock-held ((lock &optional (mode :write) (whostate "Wait for Lock")) &body body)
   "Executes BODY with LOCK held in MODE, which is one of :READ or :WRITE."
   (declare (ignore mode))
   `(ccl:with-lock-grabbed 
       (,lock ,whostate)
       . ,body))

;;
;;
;; implementation-specific macro to construct a lock


;;; from cl-http:clim;clim-sys;process.lisp
#+allegro
(defun make-lock (name &key type &allow-other-keys)
  "Returns a lock named name that is suitable for use with with-lock-held."
  (declare (ignore type ignore))
  (mp:make-process-lock :name name))

#+clisp
(defun make-lock (name &key (type :simple))
  (declare (ignore name type))
  nil)

;;; from cl-http:cmucl;server;unix.lisp
#+(and CMU mp)
(defun make-lock (name &key (type :simple))
  "Returns a lock named name that is suitable for use with with-lock-held.
  TYPE can be either :SIMPLE (the default) or :MULTIPLE-READER-SINGLE-WRITER.
  A simple lock queues all operations whereas a :MULTIPLE-READER-SINGLE-WRITER
  lock allows multiple read threads but only a single writer thread."
  (declare (ignore type))
  (mp:make-lock name))

#+(and CMU (not mp))
(defun make-lock (name &key (type :simple))
  (declare (ignore name type))
  nil)

#+CormanLisp
(defun make-lock (name &key (type :simple))
  (declare (ignore name type))
  nil)

;;; from cl-http:clim;clim-sys;process.lisp
#+lispworks
(defun make-lock (name &key type &allow-other-keys)
  "Returns a lock named name that is suitable for use with with-lock-held."
  (declare (ignore type ignore))
  (mp:make-lock :name name))

;;; from cl-http:mcl;server;mcl.lisp
#+digitool
(defun make-lock (name &key type)
  "Returns a lock named NAME that is suitable for use with WITH-LOCK-HELD.
TYPE is one of :SIMPLE or :MULTIPLE-READER-SINGLE-WRITER.
In the later case, multiple readers can access lock protected data simultaneously."
  #-:multiple-reader-locks (declare (ignore name type))
  #-:multiple-reader-locks (ccl:make-lock)
  #+:multiple-reader-locks (ccl:make-lock name type))

#+sbcl
(defun make-lock (name &key (type :simple))
  (declare (ignore name type))
  nil)

#+scl
(defun make-lock (name &key (type :simple))
  (declare (ignore type))
  (thread:make-lock name))

#+clozure
(defun make-lock (name &key type)
  "Returns a lock named NAME that is suitable for use with WITH-LOCK-HELD.
TYPE is one of :SIMPLE or :MULTIPLE-READER-SINGLE-WRITER.
In the later case, multiple readers can access lock protected data simultaneously."
  (declare (ignore name type))
  (ccl:make-lock))

;;
;;
;;
;; implementation-specific macro to execute the body without interrupts

#+scl
(defMacro without-interrupts (&rest body)
  `(thread:with-exclusive-execution ,@body))

#+clisp
(defMacro without-interrupts (&rest body)
  `(progn ,@body))

#+(and ccl clozure)
(defmacro without-interrupts (&rest body)
  `(ccl:without-interrupts ,@body))

;;; from cl-http:mcl;server;www-utils.lisp

(defmacro with-fast-array-references (bindings &body body)
   "Declares the arrays in bindings (var value &optional type)
as type and sets speed to 3 with safety 0 within its scope."
   (loop for (var val type) in bindings
            collect `(,var ,val) into n-bindings
            when type
            collect `(type ,type ,var) into type-dcls
            finally (return `(let ,n-bindings
                                      (locally 
                                         (declare (optimize (speed 3) (safety 0)) . ,type-dcls)
                                         ,@body)))))

#-genera
(defun http::copy-vector-portion (from-vector from-start from-end to-vector to-start to-end)
  (with-fast-array-references ((from-vector from-vector vector)
			       (to-vector to-vector vector))
    (loop for idx1 upfrom from-start below from-end
	  for idx2 upfrom to-start below to-end
	  do (setf (aref to-vector idx2) (aref from-vector idx1)))
    t))

(unless (boundp 'http:*standard-character-type*)
  (defParameter http:*standard-character-type* 'character))
