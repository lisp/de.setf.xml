;; -*- mode: lisp; package: cl-user -*-

;; 20030212 : 5.0b / 10.2 (via presence in the application folder)
;; 20030326 : openmcl (via a link from the "home:open-mcl.lisp" file

(in-package "CL-USER")

(setq *load-verbose* nil)
(setq *verbose-eval-selection* nil)
(setq *next-screen-context-lines* 7)

(defPackage :utility
  (:use )
  (:nicknames :de.setf.utility))

(defPackage :de.setf.utility.implementation
  (:use #+:ccl :ccl :common-lisp :de.setf.utility))

;; bootstrap logical pathnames
(setf (logical-pathname-translations "Development")
      `(("**;*.*" ,(merge-pathnames (make-pathname :name :wild :type :wild :directory '(:relative  :wild-inferiors))
                                    ;; each represents the root directory differently
                                    #+openmcl (truename (make-pathname :directory '(:absolute  "Development")))
                                    #+digitool (truename (make-pathname :directory '(:absolute "osx.tschichold" "Development")))))))

(setf (logical-pathname-translations "Packages")
      `(("**;*.bin" ,(merge-pathnames #p"Development:Source;Library;LISP;" (compile-file-pathname "*.lisp")))
        ("**;*.*" #p"Development:Source;Library;LISP;**;*.*")
        ("*.*"  #p"Development:Source;Library;LISP;*.*")))

#+(and mcl DIGITOOL)
(progn
  (if (find-symbol "*CHECK-SLOT-TYPE*" "CCL")
    (setf (symbol-value (find-symbol "*CHECK-SLOT-TYPE*" "CCL")) t)
    (warn "no *check-slot-type* found"))
  (load "Packages:fred-tools.lisp")
  (load "Packages:fred-eol.lisp")
  (load "Packages:fred-window-titles.lisp"))

#+openmcl
(load "Packages:com;clozure;patch.lisp")

(load "Packages:de;setf;utility;package")



:EOF
