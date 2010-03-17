;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

;; 20010914 0.913
;;
;;
;; tests for distinguishing xhtml versions this was started when there were to be three difference
;; namespaces. that is no longer true...

(setf *strict-dtd*
      (time (parse-external-subset-toplevel #p"www:dokumente:standards:xml:xhtml1+DTD:xhtml1-strict.dtd" :intern-names nil)))
(setf *strict-dtd*
      (time (parse-external-subset-toplevel #p"www:dokumente:standards:xml:xhtml1+DTD:xhtml1-strict.dtd")))
(pprint (find "p" (children *strict-dtd*) :key #'name :test #'string=))
(inspect (find "html" (children *strict-dtd*) :key #'name :test #'string=))


(setf *transitional-dtd*
      (time (parse-external-subset-toplevel #p"www:dokumente:standards:xml:xhtml1+DTD:xhtml1-transitional.dtd" :intern-names nil)))
(setf *transitional-dtd*
      (time (parse-external-subset-toplevel #p"www:dokumente:standards:xml:xhtml1+DTD:xhtml1-transitional.dtd")))
(pprint (find "p" (children *transitional-dtd*) :key #'name :test #'string=))

(setf *frameset-dtd*
      (time (parse-external-subset-toplevel #p"www:dokumente:standards:xml:xhtml1+DTD:xhtml1-frameset.dtd" :intern-names nil)))
(setf *frameset-dtd*
      (time (parse-external-subset-toplevel #p"www:dokumente:standards:xml:xhtml1+DTD:xhtml1-frameset.dtd")))
(pprint (find "p" (children *frameset-dtd*) :key #'name :test #'string=))

:EOF
