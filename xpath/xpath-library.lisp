;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
 bindings for the xpath function library.
 <p>
 distinguished values are modeled as singleton instances.
 node sets are modeled as lists.</p>
 <p>
 the lower case functions are exported and intended to be used in expressions.
 the upper case functions remain internal.</p>
 </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010716'>name/symbol distinction;</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
 
|#

(in-package "XML-PATH")

(defClass singleton-class (standard-class)
  ((instance :initform nil :reader class.instance)))
(defClass singleton (named-value-node) ()
  (:metaclass abstract-class))
(defMethod make-instance ((class singleton-class) &key)
  (or (and (slot-boundp class 'instance)
           (slot-value class 'instance))
        (setf (slot-value class 'instance) (call-next-method))))
(defMethod (setf value) ((value t) (singleton singleton))
  (unless (eq value singleton)
    (error "singleton value is immutable: ~s: ~s." singleton value)))

(defMacro defSingleton (name super namestring &optional slots)
  `(progn ; (setf (find-class ',name) nil)
          (defclass ,name ,super
            ((name :initform ,namestring :allocation :class)
             ,@slots)
            (:metaclass singleton-class))
          (defParameter ,name (make-instance ',name))
          (setf (slot-value ,name 'value) ,name)))
(defSingleton xpa:|NaN| (number-value singleton) "NaN")
(defClass xpa::|zero| (number-value singleton)
  ((value :initform 0 :allocation :class))
  (:metaclass abstract-class))
(defSingleton xpa:|0+| (xpa::|zero|) "0")
(defSingleton xpa:|0-| (xpa::|zero|) "0")
(defClass xpa::|infinity| (number-value singleton) ()
  (:metaclass abstract-class))
(defSingleton xpa:|infinity+| (xpa::|infinity|) "Infinity")
(defSingleton xpa:|infinity-| (xpa::|infinity|) "-Infinity")
(defClass xpa::|boolean| (bool-value) ()
  (:metaclass abstract-class))
(defSingleton xpa:|true| (xpa::|boolean| singleton) "true" )
(defSingleton xpa:|false| (xpa::|boolean| singleton) "false" )


;(defMethod value-number ((object node-set)) (value-number (first-node object)))
(defMethod value-number ((object list)) (value-number (first object)))

(defMethod value-boolean ((object xpa::|zero|)) xpa:|false|)
(defMethod value-boolean ((object xpa:|NaN|)) xpa:|false|)
; (defMethod value-boolean ((object node-set)) (plusp (length (nodes object))))
(defMethod value-boolean ((object list)) (if object xpa:|true| xpa:|false|))
(defMethod value-boolean ((object number-value))
  (let ((value (value object)))
    (and (numberp value) (= value (xpa:|position|)))))

;(defMethod value-string ((object node-set)) (value-string (first-node object)))
(defMethod value-string ((object singleton)) (string (name object)))


;;
;;
;; interpreter

(defGeneric xpa::EVAL (x)
  (:method ((x value-node)) (value x))
  (:method ((x string)) x)
  (:method ((x symbol)) x)
  (:method ((x number)) x)
  (:method ((x t)) x)
  (:method ((x cons))
           (destructuring-bind (function . arguments) x
             (etypecase function
               (symbol
                (setf function (xpa::SYMBOL-FUNCTION function)))
               (function)
               ;; (function-value)
               )
             (apply function
                    (mapcar #'(lambda (arg) (xpa::EVAL arg))
                            arguments)))))

;;
;;
;; library

(defGeneric xpa:|and| (arg1 arg2)
  (:method ((arg1 xpa:|true|) (arg2 xpa:|true|)) xpa:|true|)
  (:method ((arg1 xpa:|false|) (arg2 xpa:|true|)) xpa:|false|)
  (:method ((arg1 xpa:|true|) (arg2 xpa:|false|)) xpa:|false|)
  (:method ((arg1 xpa:|false|) (arg2 xpa:|false|)) xpa:|false|)
  (:method ((arg1 function) (arg2 t)) (xpa:|and| (xpa::path-nodes arg1) arg2))
  (:method ((arg1 t) (arg2 function)) (xpa:|and| arg1 (xpa::path-nodes arg2)))
  (:method ((arg1 t) (arg2 t))
           (xpa:|and| (value-boolean arg1) (value-boolean arg2))))

(defun xpa:|ceiling| (number)
  (unless (numberp number) (setf number (value-number number)))
  (ceiling number))

(defun xpa::|concat| (&rest objects)
  (apply #'concatenate 'string (mapcar #'value-string objects)))

(defGeneric xpa:|contains| (string1 string2)
  (:method ((s1 string) (s2 string))
           (search s2 s1))
  (:method ((s1 string) (s2 t))
           (xpa:|contains| s1 (value-string s2)))
  (:method ((s1 t) (s2 t))
           (xpa:|contains| (value-string s1) s2)))

(defun xpa:|count| (nodes)
  "returns the number of nodes in the argument node-set"
  (length nodes))

(defun xpa:|boolean| (object)
  (value-boolean object))

(defun xpa:|document| (uri)
  (or (rest (assoc uri *documents* :test #'equalp))
      (setf (xpa:|document| uri)
            (xmlp::document-parser uri))))

(defun (setf xpa:|document|) (instance uri)
  (setf *documents* (acons uri instance *documents*))
  instance)

(defun xpa:|false| ()
  xpa:|false|)

(defun xpa:|floor| (number)
  (unless (numberp number) (setf number (value-number number)))
  (floor number))

(defGeneric xpa:|id| (object)
  (:documentation "selects elements by their unique ID")
  (:method ((object string))
           (cond ((position-if #'xml-space? object)
                  (xpa:|id| (split-string object #'xml-space?)))
                 (t (find-element-by-id xpa:*context-node* object))))
  (:method ((object list))
           (apply #'union (mapcar #'(lambda (id) (xpa:|id| id)) object)))
  #|(:method ((object node-set))
           (xpa:|id| (mapcar #'value-string (nodes object))))|#
  (:method ((object abstract-node))
           (xpa:|id| (value-string object))))

(defun xpa:|last| ()
  "returns the context size from the expression evaluation context.
   this number is not constant: it increases as the size of the set increases."
  xpa:*count*)

(defun xpa:|lang| (string)
  (xpa::language-equal xpa:*context-node* string))

(defun xpa:|local-name| (&optional (node xpa:*context-node*))
  "returns the local part of the expanded-name of the node in the argument
          node-set that is first in document order."
  (when node (symbol-name (name node))))

(defGeneric xpa::LANGUAGE-EQUAL (target lang)
  (:method (target (lang t))
           (xpa::language-equal target (value-string lang)))
  (:method ((target string) (lang string))
           (or (string-equal target lang)
               (and (> (length target) (length lang)
                       (char= #\- (char target (length lang)))
                       (string-equal target lang :end1 (length lang))))))
  (:method ((target attr-node) (lang string))
           (xpa::language-equal (value target) lang))
  (:method ((target elem-node) (lang string))
           (or (find-if #'(lambda (attr)
                            (and (eq *lang-name* (name attr))
                                 (xpa::language-equal attr lang)))
                        (attributes target))
               (xpa::language-equal (parent target) lang)))
  (:method ((target null) (lang t))
           nil)
  (:method ((target doc-node) (lang t))
           nil))
  
(defun xpa:|mod| (arg1 arg2)
  (if (and (setf arg1 (value-number arg1)) (setf arg2  (value-number arg2)))
    (mod arg1 arg2)
    xpa:|NaN|))

(defGeneric xpa:|name| (node)
  (:documentation
   "returns a string containing a QName representing the expanded-name of the node in
          the argument node-set that is first in document order.")
  (:method ((node null)) nil)
  (:method ((node named-node)) (name node))
  (:method ((node ref-node)) (xqa::|name| (value node))))

(defun xpa:|namespace-uri| (&optional (node xpa:*context-node*))
  "returns the namespace URI of the expanded-name of the node in the
          argument node-set that is first in document order."
  (when node (uri (namespace (name node)))))

(defun xpa:|normalize-space| (&optional (string xpa:*context-node*))
  (unless (stringp string) (setf string (value-string string)))
  (format nil "~{~a~^ ~}" (split-string string
                                        #(#\space #\linefeed #\return #\tab))))

(defGeneric xpa:|not| (object)
  (:method ((object null)) t)
  (:method ((object xpa:|false|)) t)
  (:method ((object function)) (xpa:|not| (xpa::path-nodes object)))
  (:method ((object t)) (eq (value-boolean object) xpa:|false|)))

(defun xpa:|number| (&optional (object xpa:*context-node*))
  (xpa::number object))

(defGeneric xpa::number (object)
  (:method ((object number)) object)
  (:method ((object function)) (xpa::number (xpa::path-nodes object)))
  (:method ((object t)) (value-number object)))

(defGeneric xpa:|or| (arg1 arg2)
  (:method ((arg1 xpa:|true|) (arg2 xpa:|true|)) xpa:|true|)
  (:method ((arg1 xpa:|false|) (arg2 xpa:|true|)) xpa:|true|)
  (:method ((arg1 xpa:|true|) (arg2 xpa:|false|)) xpa:|true|)
  (:method ((arg1 xpa:|false|) (arg2 xpa:|false|)) xpa:|false|)
  (:method ((arg1 function) (arg2 t)) (xpa:|or| (xpa::path-nodes arg1) arg2))
  (:method ((arg1 t) (arg2 function)) (xpa:|or| arg1 (xpa::path-nodes arg2)))
  (:method ((arg1 t) (arg2 t))
           (xpa:|or| (value-boolean arg1) (value-boolean arg2))))

(defun xpa:|position| ()
  "returns the context position from the expression evaluation context."
  xpa:*position*)

(defun xpa:|round| (number)
  (unless (numberp number) (setf number (value-number number)))
  (round number))

(defun xpa:|string| (&optional (object xpa:*context-node*))
  (value-string object))

(defun xpa:|starts-with| (string1 string2)
  (unless (stringp string1) (setf string1 (value-string string1)))
  (unless (stringp string2) (setf string2 (value-string string2)))
  (and (>= (length string1) (length string2))
       (string= string1 string2 :end1 (length string2))))

(defun xpa:|substring-after| (string1 string2)
  (unless (stringp string1) (setf string1 (value-string string1)))
  (unless (stringp string2) (setf string2 (value-string string2)))
  (let ((position (search string2 string1)))
    (if position (subseq string1 (+ (length string2) position)) "")))

(defun xpa:|substring-before| (string1 string2)
  (unless (stringp string1) (setf string1 (value-string string1)))
  (unless (stringp string2) (setf string2 (value-string string2)))
  (let ((position (search string2 string1)))
    (if position (subseq string1 0 position) "")))

(defun xpa:|substring| (string start &optional end)
  (unless (stringp string) (setf string (value-string string)))
  (unless (numberp start) (setf start (value-number start)))
  (setf start (round start))
  (when end
    (unless (numberp end) (setf end (value-number end)))
    (setf end (round end)))
  (if end
    (subseq string start end)
    (subseq string start)))

(defun xpa:|string-length| (&optional (string xpa:*context-node*))
  (unless (stringp string) (setf string (value-string string)))
  (length string))

(defun xpa:|sum| (nodes)
  (if (null nodes)
    0
    (unless (find-if (complement #'numberp) nodes)
      (apply #'+ nodes))))

(defun xpa::SYMBOL-FUNCTION (name)
  (or (and (eq (namespace name) *token-package*)
           (fboundp name)
           (symbol-function name))
      (error 'undefined-function :name name)))

(defun xpa:|translate| (string from to)
  (unless (stringp string) (setf string (value-string string)))
  (unless (stringp from) (setf from (value-string from)))
  (unless (stringp to) (setf to (value-string to)))
  (let ((result (make-array (length string) :element-type 'character
                            :adjustable t :fill-pointer 0)))
    (map 'nil #'(lambda (c &aux (pos (position c from)))
                   (if pos 
                     (when (< pos (length to))
                       (vector-push-extend (char to pos) result))
                     (vector-push-extend c result)))
         string)
    result))

(defun xpa:|true| ()
  xpa:|true|)

(defun xpa:|union| (arg1 arg2)
  (union arg1 arg2))

;;
;;
;; comparison operators

(defun xpa::compare-2 (predicate arg1 arg2)
  (dolist (node1 arg1)
    (dolist (node2 arg2)
      (when (funcall predicate (value-string node1) (value-string node2))
        (return t)))))

(defGeneric xpa::compare-1 (predicate arg1 arg2)
  (:method (predicate (arg1 list) (arg2 number))
           (dolist (node arg1)
             (when (funcall predicate (value-number node) arg2)
               (return t))))
  (:method (predicate (arg1 list) (arg2 string))
           (dolist (node arg1)
             (when (funcall predicate (value-string node) arg2)
               (return t))))
  (:method (predicate (arg1 list) (arg2 xpa::|boolean|))
           (dolist (node arg1)
             (when (funcall predicate (value-boolean node) arg2)
               (return t))))
  (:method (predicate (arg1 number) (arg2 list))
           (dolist (node arg2)
             (when (funcall predicate arg1 (value-number node))
               (return t))))
  (:method (predicate (arg1 string) (arg2 list))
           (dolist (node arg2)
             (when (funcall predicate arg1 (value-string node))
               (return t))))
  (:method (predicate (arg1 xpa::|boolean|) (arg2 list))
           (dolist (node arg2)
             (when (funcall predicate arg1 (value-boolean node))
               (return t)))))

(defMacro defInequalityOp (name number-op string-op)
  `(defGeneric ,name (arg1 arg2)
     (:method ((arg1 function) arg2) (,name (xpa::path-nodes arg1) arg2))
     (:method (arg1 (arg2 function)) (,name arg1 (xpa::path-nodes arg2)))
     (:method ((arg1 list) (arg2 function)) (,name arg1 (xpa::path-nodes arg2)))
     (:method ((arg1 list) arg2) (xpa::compare-1 #',name arg1 arg2))
     (:method (arg1 (arg2 list)) (xpa::compare-1 #',name arg1 arg2))
     (:method ((arg1 list) (arg2 list)) (xpa::compare-2 #',name arg1 arg2))
     (:method ((arg1 number) (arg2 number)) (,number-op arg1 arg2))
     (:method ((arg1 string) (arg2 string)) (,string-op arg1 arg2))
     (:method ((arg1 t) (arg2 t))
              (,name (value-number arg1) (value-number arg2)))))

(defInequalityOp xpa:|<| < string<=)
(defInequalityOp xpa:|<=| <= string<=)
(defInequalityOp xpa:|>| > string<=)
(defInequalityOp xpa:|>=| >= string<=)

(defMacro defEqualityOp (name number-op string-op bool-op)
  `(defGeneric ,name (arg1 arg2)
     (:method ((arg1 function) arg2) (,name (xpa::path-nodes arg1) arg2))
     (:method (arg1 (arg2 function)) (,name arg1 (xpa::path-nodes arg2)))
     (:method ((arg1 list) (arg2 function)) (,name arg1 (xpa::path-nodes arg2)))
     (:method ((arg1 list) arg2) (xpa::compare-1 #',name arg1 arg2))
     (:method (arg1 (arg2 list)) (xpa::compare-1 #',name arg1 arg2))
     (:method ((arg1 list) (arg2 list)) (xpa::compare-2 #',name arg1 arg2))
     (:method ((arg1 number) (arg2 number)) (,number-op arg1 arg2))
     (:method ((arg1 string) (arg2 string)) (,string-op arg1 arg2))
     (:method ((arg1 bool-value) (arg2 bool-value)) (,bool-op arg1 arg2))
     (:method ((arg1 elem-node) (arg2 elem-node)) (node-equal arg1 arg2))
     (:method ((arg1 elem-property-node) (arg2 elem-property-node)) (node-equal arg1 arg2))
     (:method ((arg1 t) (arg2 t))
              (cond ((or (typep arg1 'bool-value) (typep arg2 'bool-value))
                     (,name (value-boolean arg1) (value-boolean arg2)))
                    ((or (typep arg1 'number) (typep arg2 'number))
                     (,name (value-number arg1) (value-number arg2)))
                    (t
                     (,name (value-string arg1) (value-string arg2)))))))

(defEqualityOp xpa:|=| = string= eq)

(defun xpa:|!=| (arg1 arg2)
  (not (xpa:|=| arg1 arg2)))

;;
;;
;; aritmetic operators

(defun xpa:|+| (arg1 arg2)
  (+ (value-number arg1) (value-number arg2)))

(defun xpa:|-| (arg1 &optional (arg2 nil arg2-supplied))
  (if arg2-supplied
    (- (value-number arg1) (value-number arg2))
    (- (value-number arg1))))

(defun xpa:|*| (arg1 arg2)
  (* (value-number arg1) (value-number arg2)))

(defun xpa:|/| (arg1 arg2)
  (if (and (setf arg1 (value-number arg1)) (setf arg2  (value-number arg2)))
    (/ arg1 arg2)
    xpa:|NaN|))



#|

(xpa::EVAL nil `(xpa:|not| ,*false*))

|#

:EOF