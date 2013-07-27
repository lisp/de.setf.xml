;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

(in-package "COMMON-LISP-USER")

;;; this file contains all the require operations and parameter settings for
;;; various lisp implementations.


#+CL-HTTP  ;; nb. this check is effective in the fasl only
(unless (find :cl-http *features*)
  (warn "CL-HTTP not present."))

;;
;; network access 
#+(and MCL (not CL-HTTP) (not openmcl))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (define-declaration values nil)
  (define-declaration arglist nil)
  (require "OPENTRANSPORT"))

#+openmcl
(progn
  (define-declaration values nil)
  (define-declaration arglist nil))

#+(and ALLEGRO (not CL-HTTP))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "SOCK"))
#+LispWorks
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "comm"))

;; to indicate whether or not to model names as symbols or as instances
;; (pushnew :xml-symbols *features*)

;; to specify the instance names should use tokenizers
 (pushnew :nameset-tokenizer *features*)

;; to indicate that all name and string characters are to be checked for legality
;; (pushnew :xml-check-char-codes *features*)
#+Allegro
(when (< excl:real-char-code-limit 65535)
  (pushnew :xml-check-char-codes *features*))

#-Allegro
(when (< char-code-limit 65535)
  (pushnew :xml-check-char-codes *features*))

#|
;; 20020410.jaa setting the value globally turns out to be inappropriate.
;; the alternative, dynamical binding, is said to be insufficient to affect internal
;; state.
#+LispWorks
(lw:set-default-character-element-type 'lw:simple-char)

;; should that change, the alternative would have been
#+LispWorks ; cause lispworks to use wide-character strings
(lw:*default-character-element-type* 'lw:simple-char)
|#

#+cmu
(progn
  (require :gray-streams)
  (setq extensions:*inline-expansion-limit* 2)
  )

#+sbcl
(progn
  (unless (find-package :sb-gray) (require :gray-streams))
  (setq *inline-expansion-limit* 2)
  )

#+scl
(progn
  (setq extensions:*inline-expansion-limit* 5)
  (setf common-lisp::*default-external-format* :iso-8859-1)
  )

#+ccl-5-0-and-0-918
(setq CCL::*CHECK-SLOT-TYPE* nil)
;; the atn-bnf parser must be loaded in order to translate grammars,
;; for regular expressions, and for validation. this is reflected in it presence
;; in the :xparser definition below.
;; nb. this should be refined to load only the minimum for runtime use


:de.setf.xml
