;;; -*- package: de.setf.xcl; Syntax: Common-lisp; Base: 10 -*-

(in-package :de.setf.xcl)

(defmethod check-constraint ((condition |WFC: Unique Att Spec|) (node cons)
                             &aux duplicates)
  "this check is applied to the annotation list: (name . (name . value)* )"
  (flet ((check-node (node list &aux (name (first node)))
           (map nil
                #'(lambda (test)
                    (when (and (not (eq test node))
                               (uname-equal (first test) name))
                      (push test duplicates)))
                list)))
    (mapl #'(lambda (nodes) (check-node (first nodes) (rest nodes)))
          (rest node))
    (when duplicates
      (xml-error |WFC: Unique Att Spec| :attributes duplicates))))

:eof
