;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  print methods for simplified xquery models
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010305' AUTHOR='JAA'/>
  <DELTA DATE='20010805'>*namespaces* -> *namespace-bindings*</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-QUERY")


(defMethod write-node-xq
           ((node doc-node) stream)
  (mapl #'(lambda (rest &aux (node (first rest)))
            (fresh-line stream)
            (write-node-xq node stream)
            (when (rest rest)
              (write-string ", " stream)))
        (children node))
  node)

(defMethod write-node-xq
           ((node elem-node) stream
            &aux
            (*namespace-bindings* *namespace-bindings*)
            (*node-level* (1+ *node-level*))
            (column nil) (previous nil))
  (flet ((new-line ()
           (when (and previous *print-pretty*)
             (write-char #\, stream)
             (fresh-line stream)
             (dotimes (x column) (write-char #\space stream)))
           (setf previous t)))
    (with-slots (name children attributes namespaces) node
      (dolist (ns-node namespaces)
        (setf (prefix-value (name ns-node)) (uri ns-node)))
      (write-node name stream)
      (write-string " [ " stream)
      (setf column (or (stream-column stream) *node-level*))
      (dolist (node namespaces)
        (new-line)
        (write-node-xq node stream))
      (dolist (node attributes)
        (new-line)
        (write-node-xq node stream))
      (dolist (node children)
        (new-line)
        (write-node-xq node stream))
      (write-char #\] stream)))
  node)

(defMethod write-node-xq
           ((node elem-property-node) stream)
  (with-slots (name children) node
    (write-char #\@ stream)
    (write-node name stream)
    (write-string " [ " stream)
    (mapl #'(lambda (rest &aux (node (first rest)))
            (write-node-xq node stream)
            (when (rest rest)
              (write-string ", " stream)))
        children)
    (write-string " ]" stream))
  node)

(defMethod write-node-xq
           ((string string) stream &aux char)
  (multiple-value-bind (writer arg)
                       (stream-writer stream)
    (funcall writer arg #\')
    (dotimes (x (length string))
      (setf char (char string x))
      (case char
        (#\< (write-string "&lt;" stream))
        (#\> (write-string "&gt;" stream))
        (#\&
         ; here an attempt to both escape and not
         (if (position #\; string :start x)
           (funcall writer arg char)
           (write-string "&amp;" stream)))
        (t (funcall writer arg char))))
    (funcall writer arg #\'))
  string)

(defMethod write-node-xq
           ((node number) stream)
  (write node :stream stream))

(defMethod write-node-xq
           ((node symbol) stream)
  (write-string (symbol-name node) stream))

(defmethod write-node-xq
           ((node pi-node) stream)
  (write-char #\? stream)
  (write-node (name node) stream)
  (write-string " [" stream)
  (mapl #'(lambda (rest &aux (node (first rest)))
            (write-node-xq node stream)
            (when (rest rest)
              (write-string ", " stream)))
        (children node))
  (write-string " ]" stream)
  node)

(defmethod write-node-xq
           ((node comment-node) stream)
  (write-string "( " stream)
  (dolist (node (children node))
    (write-node-xq node stream)
    (write-char #\space stream))
  (write-char #\) stream)
  node)

(defMethod write-node-xq
           ((node ref-entity) stream)
  (with-slots (name) node
    (write-char #\& stream)
    (write-node name stream)
    (write-char #\; stream))
  node)


:EOF
