;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
 implementation packages for
  <ul>
   <li> XQDM: an xml document model which follows the xml-query document
    model.</li>
   <li> XQ: a serializer (parser/reader and writer functions) for the document
    aspects of xml-query algebra expressions based on the XQDM.</li>
   <li> XPATH: a parser/reader and interpreter for xpath expressions.</li>
   <li> XMLP: a parser for xml expressions based onthe XQDM.</li>
   <!-- <li> XMLP: a compatibility package downwards compatible to the older XMLP
    package.</li> was considered, but not implemented -->
   </ul>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            mailto='james.anderson@setf.de' />
 <LICENSE href='file://xml/LGPL.txt' >
    This library is free software;
    With the exceptions noted below, you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version,
    as ammended below.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    The terms of the GNU Lesser General Public License are ammended to include
    the stipulation, as paragraph 2.e, that any modifications to the library for
    the purpose of correcting bugs must be returned to the copyright holder
    for inclusion in future versions of the library.
  </LICENSE>
 <LICENSE href='file://xml/base/tokenizer.lisp'>
  the license terms for tokenizer implementation are described in the
  respective source file.
  </LICENSE>
 <LICENSE href='file://xml/bnf/xml-grammar.bnf'>
  the www-consortium retains license rights to the respective bnf.
  it is distributed herewith under the terms of their software license.</LICENSE>
 <LICENSE href='file://xml/bnf/xpath-grammar.bnf'>
  the www-consortium retains license rights to the respective bnf.
  it is distributed herewith under the terms of their software license.</LICENSE>
 <LICENSE href='file://xml/bnf/xql-grammar.bnf'>
  the www-consortium retains license rights to the respective bnf.
  it is distributed herewith under the terms of their software license.</LICENSE>
 <LICENSE href='file://xml/demos/saxandsoap/*.lisp'>
  <COPYRIGHT YEAR='2001' AUTHOR='Stanley Knutson' MARK='(C)'
            mailto='knewt@alum.mit.edu' />
  for information on this module, please contact the author.</LICENSE>
 <CHRONOLOGY>
  <!-- nb. this version number tracks that of the 'parser' module.
       the others vary independently. -->
  <DELTA DATE='20010605' AUTHOR='MS' VERSION='0.907'>
   lispworks/ansi conformance</DELTA>
  <DELTA DATE='20010608' VERSION='0.908'>
   CL-HTTP in ALLEGRO</DELTA>
  <DELTA DATE='20010621'>xml-writer</DELTA>
  <DELTA DATE='20010702'>vector-stream moved to utils for data-url support</DELTA>
  <DELTA DATE='20010910' VERSION='0.912'>xparser tokenizers</DELTA>
  <DELTA DATE='20010910' VERSION='0.914'>0.912+lw/allegro tests</DELTA>
  <DELTA DATE='20010918' VERSION='0.915'>first-level tokenization</DELTA>
  <DELTA DATE='20011203' VERSION='0.916'>fixes for instance name compilation;<br />
   lispworks comm package(including conditionalization 20020115)</DELTA>
  <DELTA DATE='20020117'>lispworks charachter element set for two-byte characters</DELTA>
  <DELTA DATE='20030408' VERSION='0.949'>
  <DELTA DATE='20041104' >added hook for acl bin directory distinction by architecture</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "CL-USER")

(eval-when (:load-toplevel :compile-toplevel :execute)
  (let* ((defaults
           #+allegro (or *load-truename* *load-pathname* *compile-file-truename*)
           #+ccl *load-truename*
           #+clisp *load-truename*
           #+cmu *load-truename*
           #+cormanlisp #p"d:\\Source\\Lisp\\XML-0-918\\sysdcl.lisp"
           #+lispWorks (truename (lw:current-pathname))
           #+sbcl (or *load-truename* *load-pathname*)
           #+scl *load-truename*
           #+clisp *load-truename*
	   )
         (bin-target nil)
         (root-target (make-pathname :name :wild :type :wild :version :newest
                                     :directory (append (pathname-directory defaults)
                                                        '(:wild-inferiors))
                                     :defaults defaults)))
    ;; w/o bootstrap lispworks collapsed the bin target to host and type
    (setf (logical-pathname-translations "xml")
          `(("root;**;*.*.*" ,root-target)))
    (setf bin-target
      (make-pathname :name :wild
                     :type (pathname-type (compile-file-pathname "xml:name.lisp"))
                     :version :newest
                     :defaults
                     (or
                      #+(and clozure-common-lisp ccl-1.2) "xml:root;bin;ccl-1-2;**;*.*.*"
                     #+(and digitool (not ccl-5.2)) "xml:root;bin;digifasl;**;*.*.*"
                     #+(and digitool ccl-5.2) "xml:root;bin;digifasl-5.2;**;*.*.*"
                     #+(and mcl m68k) "xml:root;bin;digim68kfasl;**;*.*.*"
                     #+(and allegro allegro-version>= (not (version>= 6 0)))
                     "xml:root;bin;acl5fasl;**;*.*.*"
                     #+(and allegro allegro-version>= (version>= 6 0)  (not (version>= 7 0)) mswindows)
                     "xml:root;bin;acl6fasl-windows;**;*.*.*"
                     #+(and allegro allegro-version>= (version>= 8 0)  mswindows)
                     "xml:root;bin;acl8fasl-windows;**;*.*.*"
                     #+(and allegro allegro-version>= (version>= 8 0)  linux)
                     "xml:root;bin;acl8fasl-linux;**;*.*.*"
                     #+(and allegro allegro-version>= (version>= 6 0)  (not (version>= 7 0)) osx)
                     "xml:root;bin;acl6fasl-mac;**;*.*.*"
                     #+(and allegro allegro-version>= (version>= 6 0) (not (version>= 7 0)) (not (or mswindows osx)))
                     "xml:root;bin;acl6fasl-unix;**;*.*.*"
                     #+(and lispworks (not mac)) "xml:root;bin;lwfasl;**;*.*.*"
                     #+(and lispworks mac) "xml:root;bin;lwppcfasl;**;*.*.*"
                     #+cormanlisp "xml:root;bin;corfasl;**;*.*.*"
                     #+openmcl "xml:root;bin;omclfasl;**;*.*.*"
                     #+cmu "xml:root;bin;cmuclfasl;**;*.*.*"
                     #+scl "file://home/documents/opt/xml/bin/sclfasl/**/*.*.*"
                     #+sbcl "xml:root;bin;sbclfasl;**;*.*.*"
                     #+clisp "xml:root;bin;clispfasl;**;*.*.*")
                     ))
    (when *load-verbose*
      (format *trace-output* "~%load defaults: ~s.~%source translation: ~s.~%compile target: ~s."
              defaults root-target bin-target))
    (setf (logical-pathname-translations "xml")
          `(("**;*.bin" ,(make-pathname :version nil :defaults bin-target))
            ("**;*.BIN" ,(make-pathname :version nil :defaults bin-target))
            ("code;**;*.*" "xml:root;code;**;*.*")
            ("root;**;*.*" ,(make-pathname :version nil :defaults root-target))
            ("**;*.bnf" "xml:root;bnf;*.*")
            ("**;*.BNF" "xml:root;bnf;*.*")
            ("**;*.*" "xml:root;**;*.*")
            ("**;*.bin.*" ,bin-target)
            ("**;*.BIN.*" ,bin-target)
            ("code;**;*.*.*" "xml:root;code;**;*.*.*")
            ("root;**;*.*.*" ,root-target)
            ("**;*.bnf.*" "xml:root;bnf;*.*.*")
            ("**;*.BNF.*" "xml:root;bnf;*.*.*")
            ("**;*.*.*" "xml:root;**;*.*.*")
            ))
    #| 20040515.jaa eliminated in favour of a single library logical host
    (unless (ignore-errors (LOGICAL-PATHNAME-TRANSLATIONS "Packages"))
      (setf (logical-pathname-translations "Packages")
            `(("**;*.bin.*" ,bin-target)
              ("**;*.BIN.*" ,bin-target)
              ("**;*.*.*" "xml:Library;**;*.*")
              ("*.*.*"  "xml:Library;**;*.*"))))|#
    ))

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
  (require :gray-streams)
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

(eval-when (:compile-toplevel :execute :load-toplevel)

  (define-system
    (:base)
    ()
    "xml:code;patch;cmucl"
    "xml:code;patch;clisp"
    "library:de;setf;utility;package"
    "library:de;setf;utility;string"
    "library:de;setf;utility;conditions"
    "library:de;setf;utility;test"
    "xml:code;base;package"
    )
  
  (define-system 
    (:bnfp)
    ()
    :base
    ; merged into common package file "xml:code;packages;atn-package"
    "xml:code;atn-parser;clifs;inference-system-classes"
    "xml:code;atn-parser;clifs;inference-units"
    "xml:code;atn-parser;atn-parameters"
    "xml:code;atn-parser;atn-classes"
    "xml:code;atn-parser;atn-macros"
    "xml:code;atn-parser;ebnf-tokenizer"
    "xml:code;atn-parser;ebnf-to-atn-translator"
    "xml:code;atn-parser;atn-macro-to-canonic-form"
    "xml:code;atn-parser;ebnf-grammar.atn" ;; the bnf grammar is coded in a "atn" syntax lisp file.
    "xml:code;atn-parser;atn-runtime"
    "xml:code;atn-parser;conditions"
    "xml:code;atn-parser;atn-lisp-compiler"
    "xml:code;atn-parser;atn-regex"
    ;; the java translator is present here as documentation, as of 20010208 it has
    ;; not been reintegrated with the changes to compile to lisp.
    #+bnfp-java "xml:code;atn-parser;atn-java-compiler"
    )
  
  (define-system
    (:xutil :description "xml base utilities")
    ()
    :bnfp
    "xml:code;base;parameters"
    "xml:code;base;cllib"
    #+CL-HTTP "xml:code;base;cl-http-utils"
    "xml:code;base;utils"
    "xml:code;base;parsetable"
    "xml:code;base;vector-stream"
    #-CL-HTTP "xml:code;base;www-utils-ersatz"
    #-CL-HTTP "xml:code;base;tokenizer"
    "xml:code;base;conditions")
  
  (define-system
    (xqdm :description "model from the x-query data model")
    ()
    :xutil
    ;; for 0.918 namespaces operations must be defined first
    "xml:code;xquerydatamodel;xqdm-namespaces"
    "xml:code;xquerydatamodel;xqdm-parameters"
    "xml:code;xquerydatamodel;xqdm-character-classes"
    "xml:code;xquerydatamodel;xqdm-classes"
    "xml:code;xquerydatamodel;xsd-types"
    "xml:code;xquerydatamodel;conditions;names;conditions"
    "xml:code;xquerydatamodel;conditions;node;conditions"
    "xml:code;xquerydatamodel;conditions;model;conditions"
    "xml:code;xquerydatamodel;xqdm-operators"
    ;; "xml:code;xquerydatamodel;xqdm-qnames"
    "xml:code;xquerydatamodel;xqdm-validation"
    "xml:code;xquerydatamodel;qname-resolution"
    "xml:code;xquerydatamodel;xqdm-graph"
    "xml:code;xquerydatamodel;node-path-walk"
    "xml:code;xquerydatamodel;xqdm-walk"
    "xml:code;xquerydatamodel;xqdm-walk-accessors")
  
  (define-system
    (xparser :description "xml processor: parsing/serialization for xqdm with standard encoding")
    ()
    :xutil :xqdm
    "xml:code;xparser;xml-parameters"
    "xml:code;xparser;conditions;codec;conditions"
    "xml:code;xparser;xml-stream-coding"
    "xml:code;xparser;xml-operators"
    "xml:code;xparser;xml-readers"
    "xml:code;xparser;xml-tokenizer"
    "xml:code;xparser;xml-processing-instruction"
    "xml:code;xparser;xml-constructors"
    "xml:code;xparser;xml-parser"
    "xml:code;xparser;xml-printer"
    "xml:code;xparser;xml-writer")
  
  (define-system
      (xclos)
      ()
    :xparser
    "xml:code;xclos;xclos-serialize"
    )
  
  (define-system
    (:xpath :description "xml path model and encoding to extend the processor")
    ()
    :xparser
    "xml:code;xpath;xpath-parameters"
    "xml:code;xpath;xpath-tokenizer"
    "xml:code;xpath;xpath-classes"
    "xml:code;xpath;xpath-operators"
    "xml:code;xpath;xpath-constructors"
    "xml:code;xpath;xpath-parser"
    "xml:code;xpath;xpath-printer"
    "xml:code;xpath;xpath-library")
  
  (define-system
    (:xquery :description "xml query processor based on xml processor and xml path")
    ()
    :xparser :xpath
    "xml:code;xquery;xq-parameters"
    "xml:code;xquery;xqa-classes"
    "xml:code;xquery;xqa-operators"
    "xml:code;xquery;xql-operators"
    "xml:code;xquery;xqa-library"
    "xml:code;xquery;xql-library"
    "xml:code;xquery;xql-tokenizer"
    "xml:code;xquery;xql-constructors"
    "xml:code;xquery;xql-parser"
    "xml:code;xquery;xq-printer"
    )

  (define-system
      (:cl-xml.xmlrpc
       :description "xmlrpc based on cl-xml w/ allegro-compatible interface")
      ()
    :xparser
    "library:de;setf;utility;meta"
    "library:de;setf;utility;date;parameters"
    "library:de;setf;utility;date;macros"
    "library:de;setf;utility;date;operators"
    "LIBRARY:DE;setf;xiod;package"
    "LIBRARY:DE;setf;xiod;parameters"
    "LIBRARY:DE;setf;xiod;model"
    "LIBRARY:DE;setf;xiod;parse"
    "LIBRARY:DE;setf;xiod;annotation"
    "xml:code;xquerydatamodel;destructure"
    "xml:code;xmlrpc;xmlrpc-allegro"
    "xml:code;xmlrpc;package"
    "xml:code;xmlrpc;xmlrpc"
    )
  
  (define-system
    (:xtests
     :description
     "loads test files")
    ()
    :xparser

    "xml:tests;xquerydatamodel;model"
    
    "xml:tests;parser;bom"
    "xml:tests;parser;document-internal"
    "xml:tests;parser;document-external"
    "xml:tests;parser;document-specialized"
    "xml:tests;parser;qnames.lisp"
    "xml:tests;parser;validation.lisp"
    "xml:tests;parser;namespaces.lisp"
    "xml:tests;parser;oasis.lisp"
    )

  (define-system
    (:xrelease
     :description
     "loads test files")
    ()
    :xtests
    "xml:code;base;release"
    "xml:*.lisp"
    "xml:demos;**;*.*"
    "library:define-system.lisp"
    "xml:**;*.bnf"
    "xml:**;*.htm"
    "xml:**;*.gif"
    "xml:**;*.xql"
    "xml:**;*.xml*"
    "xml:**;*.dtd"
    "xml:**;*.xmlq"
    "xml:**;*.txt"
    )

  (define-system
    (:xconformance
     :description
     "incorporates conformance data files")
    ()
    "xml:standards;XML;XMLConf;**;*.xml"
    "xml:standards;XML;XMLConf;**;*.mod"
    "xml:standards;XML;XMLConf;**;*.dtd"
    "xml:standards;XML;XMLConf;**;*.ent"
    "xml:standards;XML;REC-xml-20001006.xml"
    "xml:standards;XML;xmlspec-v21.dtd"
    "xml:standards;XML;W3CSchema;*.xsd"
    "xml:standards;XML;W3CSchema;*.dtd"
    "xml:standards;XML;XHTML-MODULAR;**;*.*"
    )
  )


;; see also xml:tests;test.lisp
;; (load "entwicklung@paz:sourceServer:lisp:xml:define-system.lisp")
;; (register-system-definition :xparser "entwicklung@paz:sourceServer:lisp:xml:sysdcl.lisp")
;; (execute-system-operations :xutil '(:load))
;; (execute-system-operations :xparser '(:load))

;; to test if the pathnames are ok.
;; (execute-system-operations :xparser '(:probe))

;; to load
;; (execute-system-operations :xparser '(:load))
;; (execute-system-operations :xquery '(:load))

;; to compile / load
;; (execute-system-operations :xparser '(:compile))
;; (execute-system-operations :xparser '(:compile :load))
;; (execute-system-operations :xquery '(:compile :load))

;; (execute-system-operations :xquery #'print)

;; (translate-logical-pathname "xml:xxx;yyy;xml-grammar.bnf")
;; (translate-logical-pathname "xml:bnfp;sysdcl")
;; (translate-logical-pathname "xml:code;xquery;xq-printer.lisp")
;; (translate-logical-pathname "xml:code;xquery;xq-printer.bin")
;; (translate-logical-pathname "xml:demo;xq-printer.lisp")
;; (translate-logical-pathname "xml:demo;xq-printer.bin")

:EOF
