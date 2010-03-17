
(in-package :xqdm)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (export '(xqdm::destructure-element
            xqdm::destructure-element-attributes
            xqdm::destructure-element-annotation)
          :xqdm))

(defun nconc! (list &rest components &aux (result list))
  (declare (dynamic-extent components))
  (dolist (c components)
    (dolist (cc c) (setf (car list) cc) (pop list)))
  result)


(defmacro destructure-element-attributes
    (bindings element &rest body
     &aux (element-binding (if (symbolp element)
                               element (gensym "ELEMENT-"))))
  (declare (ftype (function (t) symbol) name-symbol))
  `(let* (,@(unless (eq element-binding element) `((,element-binding ,element)))
          ,@(mapcar
             #'(lambda (binding)
                 (etypecase binding
                   (cons )
                   (name (setf binding (list (name-symbol binding) binding))))
                 (destructuring-bind (variable name &optional default) binding
                   `(,variable (annotation-attribute ,element-binding
                                                     ,(if (symbolp name)
                                                          `(quote ,name) name)
                                                     ,@(when default
                                                         (list default))))))
             bindings))
     ,@body))

(defmacro destructure-element
    (((name &rest attributes) &rest contents) element &rest body
     &aux (element-binding (if (symbolp element) element (gensym "ELEMENT-"))))
  (if (consp contents)
    (if (eq (first contents) '&rest)
        (setf body `((let ((,(second contents) (children ,element-binding)))
                       ,@body)))
      (setf body
        `((symbol-macrolet ,(let ((count -1))
                              (mapcar #'(lambda (variable)
                                          `(,variable
                                            (nth ,(incf count)
                                                 (children ,element-binding))))
                                contents))
            ,@body))))
    (if contents
        (setf body `((let ((,contents (children ,element-binding))) ,@body)))))
  `(let* (,@(unless (eq element-binding element) `((,element-binding ,element)))
          (,name (name ,element-binding)))
     ,name
     ,(if (consp attributes)
        (if (eq (first attributes) '&rest)
          (let ((length (gensym)))
            `(let* ((,length (+ (length (attributes ,element-binding))
                                (length (namespaces ,element-binding))))
                    (,(second attributes) (list ,length)))
               (nconc! ,(second attributes)
                       (attributes ,element-binding)
                       (namespaces ,element-binding))
               ,@body))
          `(destructure-element-attributes ,attributes ,element-binding
                                              ,@body))
        (if attributes
          (let ((length (gensym)))
            `(let* ((,length (+ (length (attributes ,element-binding))
                                (length (namespaces ,element-binding))))
                    (,(second attributes) (list ,length)))
               (nconc! ,(second attributes)
                       (attributes ,element-binding)
                       (namespaces ,element-binding))
               ,@body))
          `(locally ,@body)))))


#+digitool
(pushnew '(destructure-element . 2) *fred-special-indent-alist*)

:eof
