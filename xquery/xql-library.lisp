(in-package "XML-QUERY")

#|
<DOCUMENTATION>
 <DESCRIPTION>
definitions for functions specific to xml query language.
functions which are identical to those from xpath are imported directly.
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 </DOCUMENTATION>
|#

(in-package "XML-QUERY")

;;
;;


(defun XQL:|comment| (exp)
  (xqa:|comment| exp))

(defun XQL:|date| (exp)
  (error "date: NYI: ~s." exp))

(defun XQL:|distinct| (nodes)
  (remove-duplicates nodes :test #'node-equal))

(defun XQL:|empty| (nodes)
  (null nodes))

(defun XQL:|equal| (n1 n2)
  (node-equal n1 n2))

(defGeneric XQL:|filter| (source constraint)
  (:method ((source elem-node) (constraint t))
           (when (find source constraint)
             (clone-node source
                         :children (xql:|filter| (children source)
                                                 constraint))))
                                   
  (:method ((source string) (constraint t)) nil)
  (:method ((source list) (constraint t) &aux result)
           (mapc #'(lambda (node)
                     (when (setf node (xql:|filter| node constraint))
                       (push node result)))
                 source)
           (nreverse result)))

(defun XQL:|pi| (name target)
  (xqa:|processing_instruction| name target))



:EOF