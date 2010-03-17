;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: tal; -*-


#|
<DOCUMENTATION>
 <p>package definition for xhtml</p>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20030713'>added to adapt to 9-949</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :tal)

(export (mapcar #'(lambda (key)
                    (find-symbol (string key) :xmlp))
                '(:defliteralpredicates
                   :make-uname
                   :prefix-namespace))
        :xmlp)

(export (mapcar #'(lambda (key)
                    (find-symbol (string key) :xqdm))
                '(:name-symbol
                  :annotation-attribute))
        :xqdm)


(defun (setf PREFIX-NAMESPACE) (namespace prefix)
  (setf (prefix-value prefix) namespace))

(defun parse-document (&rest args)
  (apply #'document-parser args))

(defun get-iso-time-string ()
  (multiple-value-bind (second minute hour day month year)
                       (get-decoded-time)
    (declare (ignore second))
    (format nil "~4,'0d~2,'0d~2,'0dT~2,'0d~2,'0d"
            year month day hour minute)))

(defMethod encode-xml-declaration
           ((node doc-node-interface)
            &aux
            (xmlp::*prefix-count* xmlp::*prefix-count*)
            (*namespace-bindings* *namespace-bindings*)
            (*default-namespace* *default-namespace*)
            (encoding (encoding node))
            (standalone (standalone node))
            (version (version node)))
  (encode-string "<?xml")
  (when (zerop (length version))
    (setf version xmlp::*xml-version*))
  (encode-string " version='")
  (encode-string version)
  (encode-char #\')
  (when encoding
    (encode-string " encoding='")
    (encode-string (string encoding))
    (encode-char #\'))
  (encode-string " standalone='")
  (encode-string (if standalone "yes" "no"))
  (encode-string "' ?>"))

(defMethod encode-doctype
           ((node doc-node-interface)
            &aux
            (xmlp::*prefix-count* xmlp::*prefix-count*)
            (*namespace-bindings* *namespace-bindings*)
            (*default-namespace* *default-namespace*)
            (name nil))
  (setf name (name (entity-info node)))
  (when (or (eq name *null-name*) (null name))
    (setf name (name (root node))))
  (when (or (plusp (hash-table-count (notations node)))
            (> (hash-table-count (general-entities node)) 5)
            (plusp (hash-table-count (parameter-entities node)))
            (plusp (hash-table-count (types node)))
            (attributes node))
    (encode-char #\newline)
    (encode-string "<!DOCTYPE ")
    (encode-node (local-part name))  ;; force the literal name w/o ns|prefix
    (encode-string " [")
    (flet ((encode-def (key def)
             (declare (ignore key))
             (encode-newline)
             (encode-node def)))
      (maphash #'encode-def (notations node))
      (maphash #'encode-def (parameter-entities node))
      (maphash #'encode-def (general-entities node)))
    (let* ((root (root node))
           (root-type (when root (ignore-errors (def root))))
           (*node-cache* nil))
      (flet ((encode-def (key def)
               (declare (ignore key))
               (unless (find def *node-cache*)
                 (push def *node-cache*)
                 (encode-newline)
                 (encode-node def))))
        ;; encode the root definition first. the method proceeds recursively,
        ;; which generates sensible namespace prefixes. any remaining
        ;; definitions are done subsequently
        (if root-type
          (encode-def nil root-type)
          (encode-string " <!-- no root element definition present -->"))
        (maphash #'encode-def (types node))))
    (encode-newline)
    (encode-string " ]>"))
  (dolist (child (children node))
    (encode-newline)
    (encode-node child)))

(defun name-function-symbol (&rest args)
  (apply #'name-symbol args))

(defMethod ./@* ((context abstract-elem-node) (name t) &aux result)
  (dolist (node (attributes context))
    (when (xsd:validate-name (name node) name) (push node result)))
  (dolist (node (namespaces context))
    (when (xsd:validate-name (name node) name) (push node result)))
  (nreverse result))

(defun |{-reader|
       (stream char
               &aux
               (namespace (make-array 32 :adjustable t :fill-pointer 0 :element-type 'character))
               (local-part (make-array 32 :adjustable t :fill-pointer 0 :element-type 'character)))
  (declare (ftype (function ((or character integer)) t) xml-namechar?))
  ;; read and intern a qname value
  (setf (fill-pointer namespace) 0
        (fill-pointer local-part) 0)
  (loop (setf char (read-char stream))
        (when (char= char #\}) (return))
        (vector-push-extend char namespace))
  (cond ((eql #\| (peek-char t stream))
         ;; where explicitly escaped allow non-name characters
         (read-char stream)
         (loop (setf char (read-char stream nil nil))
               (unless char (return))
               (when (eql #\| char)
                 (return))
               (vector-push-extend char local-part)))
        (t
         (loop (setf char (read-char stream nil nil))
               (unless char (return))
               (cond ((xml-namechar? char)
                      (vector-push-extend char local-part))
                     ((and (eql char #\*) (zerop (length local-part)))
                      (vector-push-extend char local-part)
                      (return))
                     (t
                      (unread-char char stream)
                      (return))))))
  (intern-name (subseq local-part 0) (subseq namespace 0)))

(set-macro-character #\{ #'|{-reader| t)


(defMethod annotation-attribute ((context null) (name t))
  nil)

:EOF
