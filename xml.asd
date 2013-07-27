;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

;;; 20090323  janderson  repackaged for asdf:
;;;  rearranged immediate atn parser sources
;;;  explicit external library dependency
;;;  distinct modules for xquery and xpath
;;; 20090330  janderson  added xqdm/destructure

(in-package "COMMON-LISP-USER")

(unless (find-package :de.setf.utility)
  (load (merge-pathnames (make-pathname :directory '(:relative :up "utility")
                                        :name "pathnames")
                         *load-pathname*)))

(de.setf.utility:set-relative-logical-pathname-translations
   "XML")

(unless (find-class 'atn-file nil)
  (defclass atn-file (asdf:cl-source-file) ()))
(defmethod asdf:source-file-type ((c atn-file) (s asdf:module)) "atn")

(asdf:defsystem :de.setf.xml
  :pathname #P"XML:code;"
  ;; :class asdf:nicknamed-system
  ;; :nicknames (:setf.xml)
  ;; leave out by default :weakly-depends-on (:org.cl-http)
  :depends-on (:net.common-lisp.usocket
               :de.setf.utility
               ; :de.setf.utility.bsd ;; if one wants to open dom graphs automatically in a browser
               :de.setf.utility.mime
	       :de.setf.atn-parser
               )
  :components
  (#+(or)
   (:module :bnfp
    :pathname #P"XML:code;atn-parser;"
    :components ((:module :clifs
                  :components ((:file "package")
                               (:file "inference-system-classes" :depends-on ("package"))
                               (:file "inference-units" :depends-on ("package"))))
                 (:file "package" :depends-on (:clifs))
                 (:file "atn-parameters" :depends-on ("package"))
                 (:file "atn-classes" :depends-on ("atn-parameters"))
                 (:file "atn-macros" :depends-on ("atn-classes"))
                 (:file "ebnf-tokenizer" :depends-on ("atn-macros"))
                 (:file "ebnf-to-atn-translator" :depends-on ("ebnf-tokenizer"))
                 (:file "atn-macro-to-canonic-form" :depends-on ("ebnf-to-atn-translator"))
                 ;; the bnf grammar is coded in a "atn" syntax lisp file.
                 (:atn-file "ebnf-grammar" :depends-on ("atn-macro-to-canonic-form"))
                 (:file "atn-runtime" :depends-on ("atn-classes"))
                 (:file "conditions" :depends-on ("atn-classes"))
                 (:file "atn-lisp-compiler" :depends-on ("atn-runtime" "conditions"))
                 (:file "atn-regex" :depends-on ("atn-classes"))
                 ;; the java translator is present here as documentation, as of 20010208 it has
                 ;; not been reintegrated with the changes to compile to lisp.
                 #+bnfp-java "xml:code;atn-parser;atn-java-compiler"))
   (:module :base
    :depends-on () #+(or) (:bnfp)
    :serial t
    :components ((:file "implementation-dependencies")
                 #+cl-http (:file "package+http" :depends-on ("implementation-dependencies"))
                 #-ch-http (:file "package" :depends-on ("implementation-dependencies"))
                 (:file "parameters" :depends-on ("implementation-dependencies"))
                 #+cl-http (:file "utils+http" :depends-on ("package"))
                 #-cl-http (:file "utils" :depends-on ("package"))
                 (:file "parsetable" :depends-on ("package"))
                 (:file "vector-stream" :depends-on ("package"))
                 (:file "www-utils-ersatz" :depends-on ("package"))
                 (:file "tokenizer" :depends-on ("www-utils-ersatz"))
                 (:file "conditions" :depends-on ("package"))))

   (:module :xqdm
    :depends-on (:base)
    :pathname #p"XML:code;xquerydatamodel;"
    :serial t
    :components ((:file "xqdm-namespaces")
                 (:file "xqdm-parameters" :depends-on ("xqdm-namespaces"))
                 (:file "xqdm-character-classes" :depends-on ("xqdm-parameters"))
                 (:file "xqdm-classes" :depends-on ("xqdm-character-classes"))
                 (:file "xsd-types" :depends-on ("xqdm-classes"))
                 (:module :conditions
                  :depends-on ("xsd-types")
                  :components ((:file "namespace-condition")
                               (:file "document-model-condition" :depends-on ("namespace-condition"))
                               (:file "graph-condition")))
                 (:file "xqdm-operators" :depends-on (:conditions))
                 (:file "xqdm-qnames" :depends-on ("xqdm-operators"))
                 (:file "xqdm-validation" :depends-on ("xqdm-qnames"))
                 (:file "xqdm-graph" :depends-on ("xqdm-validation"))
                 (:file "destructure" :depends-on ("xqdm-qnames"))
                 (:file "node-path-walk" :depends-on ("xqdm-classes"))
                 (:file "xqdm-walk" :depends-on ("node-path-walk"))
                 (:file "xqdm-walk-accessors" :depends-on ("xqdm-walk"))))
  

   (:module :xparser
    :depends-on (:base :xqdm)
    :serial t
    :components ((:file "xml-parameters")
                 (:module :conditions
                  :components ((:file "encoding-condition")))
                 (:file "xml-stream-coding" :depends-on (:conditions))
                 (:file "xml-operators")
                 (:file "xml-readers")
                 (:file "xml-tokenizer")
                 (:file "xml-processing-instruction")
                 (:file "xml-constructors")
                 (:file "xml-parser" :depends-on ("xml-constructors"))
                 (:module :grammar
                  :depends-on ("xml-parser")    ; this source is generated from there
                  :components ((:file "xml-grammar")))
                 (:file "xml-printer" :depends-on ("xml-operators"))
                 (:file "xml-writer" :depends-on ("xml-operators"))))))


;;; configuation

;; configuration
;;

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
  (unless (find-package :sb-gray)       ; now included
    (require :gray-streams))
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


(pushnew :de.setf.xml *features*)
