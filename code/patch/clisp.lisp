
(in-package :common-lisp-user)

;; 20030816

#+clisp
(ext:without-package-lock
 ()
 (warn "disable lock on common-lisp: ~s" (ext:package-lock (find-package :common-lisp)))
 (let ((def (fdefinition 'documentation)))
   (unless (typep def 'generic-function)
     (warn "redefining ~s" def)
     (fmakunbound 'documentation)
     (defGeneric documentation (datum &optional type)
       (:method ((datum t) &optional doctype) (funcall def datum doctype)))))
 (unless (fboundp '(setf documentation))
   (warn "defining ~s" '(setf documentation))
   (fmakunbound '(setf documentation))
   (defGeneric (setf documentation) (value datum &optional type)
     (:method ((value t) (datum t) &optional doctype) (funcall def value datum doctype)))))


      
:EOF
