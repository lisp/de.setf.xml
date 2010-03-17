;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  iterative form model navigation operators for the xml query data model
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20020630' AUTHOR='JAA'>
   factored out from xqdm-operators as separate file</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :xml-query-data-model)


(defun walk-list-reversed (list function)
  (when list
    (walk-list-reversed (rest list) function)
    (walk-self (first list) function)))

(defMethod walk-attributes ((node abstract-elem-node) function)
  (dolist (node (attributes node)) (walk-self node function)))

(defMethod walk-children ((node abstract-elem-node) function)
  (dolist (node (children node)) (walk-self node function)))

(defMethod walk-children ((node document) function)
  (dolist (node (children node)) (walk-self node function)))

(defMethod walk-children-reversed ((node abstract-elem-node) function)
  (walk-list-reversed (children node) function))

(defMethod walk-children-reversed ((node document) function)
  (walk-list-reversed (children node) function))

(defMethod walk-namespaces ((node abstract-elem-node) function)
  (dolist (node (namespaces node)) (walk-self node function)))

(defMethod walk-root ((node abstract-elem-node) function)
  (walk-root (document node) function))

(defMethod walk-root ((node document-scoped-node) function)
  (walk-root (document node) function))

(defMethod walk-root-and-descendants ((node abstract-elem-node) function)
  (walk-root-and-descendants (document node) function))

(defMethod walk-root-and-descendants ((node document-scoped-node) function)
  (walk-root-and-descendants (document node) function))

;;
;;
;; abbreviated names

(defun .@-walk-model (node function) (walk-annotations node function))
(defun .-walk-model (element function) (walk-self element function))
(defun ./-walk-model (element function) (walk-self-and-children element function))
(defun .//-walk-model (element function) (walk-self-and-descendants element function))
(defun /-walk-model (element function) (walk-children element function))
(defun //-walk-model (element function) (walk-descendants element function))


:EOF
