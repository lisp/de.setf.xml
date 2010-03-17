;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  query algrbra library
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20011220' AUTHOR='MS'>
   fix to spefcialization for xqa:|namespace|</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>

|#
(in-package "XML-QUERY")


;;
;;

(defun xqa:AND (x y) (xqa:|and| x y))

(defun xqa:OR (x y) (xqa:|or| x y))

(defun xqa:|avg| (exp)
  (/ (apply #'+ exp) (length exp)))

(defGeneric xqa:|bagtolist| (nodes)
  (:method ((nodes list))
           (sort (copy-list nodes) #'<
                 :key #'(lambda (x) (if (is-ordinal-node x) (ordinality x) -1)))))

(defun xqa:|cdata| (datum)
  ;; it's not clear if the argument is intended to be a literal string, or
  ;; is to allow a node set.
  (value-string datum))

(defGeneric xqa:|comment| (exp)
  (:method ((exp t))
           (warn "comment node for expression: ~s." exp)
           (make-comment-node :children (list (value-string exp))))
  (:method ((exp string))
           (make-comment-node :children (list exp))))

(defGeneric xqa:|data| (object)
  (:method ((object elem-node)) (value-string object))
  (:method ((object elem-property-node)) (value object)))

(defGeneric xqa:|deref| (node)
  (:method ((node ref-node)) (value node))
  (:method ((node elem-node)) node)
  (:method ((node elem-property-node)) node))

(defun xqa:|difference| (s1 s2) (set-difference s1 s2))

(defGeneric xqa:|distinct_nodes| (nodes)
  (:method ((nodes list)) (remove-duplicates nodes)))

(defGeneric xqa:|distinct_value| (nodes)
  (:method ((nodes list)) (remove-duplicates nodes)))

(defun xqa:|empty| (datum)
  (null datum))

(defGeneric xqa:|index| (exp)
  (:method ((exp list) &aux (index 0))
           (mapcar #'(lambda (exp)
                       (cons (incf index) (make-ref-node :value exp)))
                   exp)))

(defun xqa:|intersection| (s1 s2) (intersection s1 s2))

(defGeneric xqa:|localname| (uname)
  (:method ((uname symbol)) (string uname)))

(defGeneric xqa:|listtobag| (nodes)
  (:method ((nodes list)) nodes))

(defun xqa:|max| (exp)
  (apply #'max exp))

(defun xqa:|min| (exp)
  (apply #'min exp))

(defGeneric xqa:|namespace| (name)
  #+xml-symbols
  (:method ((name symbol)) (package-name (symbol-package name)))
  #-xml-symbols
  (:method ((name abstract-name)) (namespace-name name)))

(defGeneric xqa:|nodes| (node)
  (:method ((node elem-property-node)) (children node))
  (:method ((node elem-node)) (children node))
  (:method ((node ref-node)) (xqa:|nodes| (value node)))
  (:method ((x list)) x)
  (:method ((x t)) (list x)))

(defun xqa:|parent| (node) (parent node))

(defGeneric xqa:|processing_instruction| (name target)
  (:method ((name symbol) (target string))
           (make-pi-node :name name :children (list target))))

(defGeneric xqa::|ref| (node)
  (:method ((node elem-property-node)) (make-ref-node :value node))
  (:method ((node elem-node)) (make-ref-node :value node))
  (:method ((node ref-node)) (make-ref-node :value (value node))))
  
(defun xqa:|sequence| (&rest args) args)

(defun xqa:|sort| (sequence &rest functions-and-keys &aux fun key)
  (declare (dynamic-extent functions-and-keys))
  (loop (unless (and (setf fun (pop functions-and-keys))
                     (setf key (pop functions-and-keys)))
          (return sequence))
        (setf sequence (sort sequence fun :key key))))

(defGeneric xqa:|target| (node)
  (:method ((node pi-node)) (target node)))

(defGeneric xqa:|value| (node)
  (:method ((node comment-node)) (value node))
  (:method ((node pi-node)) (value node)))

(defGeneric xqa:|<| (o1 o2)
  (:method ((e1 ordinal-node) (e2 ordinal-node))
           (< (ordinality e1) (ordinality e2)))
  (:method ((o1 t) (o2 t))
           (xpa:|<| o1 o2)))

(defGeneric xqa:|>| (o1 o2)
  (:method ((e1 ordinal-node) (e2 ordinal-node))
           (> (ordinality e1) (ordinality e2)))
  (:method ((o1 t) (o2 t))
           (xpa:|>| o1 o2)))

(defGeneric xqa:|=| (o1 o2)
  (:method ((e1 ordinal-node) (e2 ordinal-node))
           (eq e1 e2))
  (:method ((n1 number) (n2 number))
           (= n1 n2)))

(defun xqa:|<=| (o1 o2) (if (xqa:|<| o1 o2) t (xqa:|=| o1 o2)))

(defun xqa:|>=| (o1 o2) (if (xqa:|>| o1 o2) t (xqa:|=| o1 o2)))


:EOF