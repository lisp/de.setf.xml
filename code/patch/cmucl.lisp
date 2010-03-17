#+(or cmu scl)
(unless (find-package "DE.SETF.UTILITY.TEST")
  (defpackage "DE.SETF.UTILITY.TEST"))

#+cmu
(in-package :pcl)

#+cmu
(defun optimizing-generator (ctor ii-methods si-methods)
  (multiple-value-bind (body before-method-p)
      (fake-initialization-emf ctor ii-methods si-methods)
    (setf (ctor-state ctor) 'optimized)
    `(kernel:instance-lambda ,(make-ctor-parameter-list ctor)
       ,(wrap-in-allocate-forms ctor body before-method-p))))
