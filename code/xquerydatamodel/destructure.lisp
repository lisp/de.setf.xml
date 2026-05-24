;;;
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

(defmacro destructure-element (((name &rest annotation-bindings) &rest content-bindings) element &rest body
                               &environment env)
  "generate bindings which destructure either an element node instance or an annotated expression."
  (let* ((element-binding (if (and (symbolp element) (eq element (macroexpand element env)))
                           element (gensym "ELEMENT-")))
         (bindings (unless (eq element-binding element) `((,element-binding ,element))))
         (preface nil))
    (when (and (rest body) (stringp (first body)))
      (push (pop body) preface))
    (loop (if (and (consp (first body)) (eq (caar body) 'declare))
            (push (pop body) preface)
            (return)))
    (setf preface (nreverse preface))
    (flet ((binding-aspects (binding)             ; returns the variable, default, and keyword/name components
             (if (consp binding)
               (if (consp (first binding))
                 (values (cadar binding) (cadr binding) (caar binding))
                 (values (car binding) (cadr binding) (car binding)))
               (values binding nil binding))))
      (setf bindings
            (append bindings
                    ;; add the name
                    `((,name (name ,element-binding)))
                    ;; if content bindings are specified, add bindings for content components by name or by position
                    (if (consp content-bindings)
                      (case (first content-bindings)
                        (&rest `((,(second content-bindings) (children ,element-binding))))
                        (&key (mapcar #'(lambda (binding)
                                          (multiple-value-bind (variable default name)
                                                               (binding-aspects binding)
                                            (when (symbolp name) (setf name `(quote ,name)))
                                            `(,variable ,(if default `(or (child ,element-binding ',name) ,default)
                                                             `(child ,element-binding ',name)))))
                                      (rest content-bindings)))
                        (t (let ((children (gensym "CHILDREN-"))
                                 (count -1)) ;; when using children, must start at -1
                             (cons `(,children (children ,element-binding))
                                   (mapcar #'(lambda (binding)
                                               (multiple-value-bind (variable default name) (aspects binding)
                                                 (when (symbolp name) (setf name `(quote ,name)))
                                                 `(,variable ,(if default `(or (nth ,(incf count) ,children) ,default)
                                                                  `(nth ,(incf count) ,children)))))
                                           content-bindings)))))
                      (if content-bindings
                        `((,content-bindings (children ,element-binding)))))
                    ;; if attribute bindings are specified, add bindings for attribute components by name or by position
                    (when annotation-bindings
                      (cond ((and (consp annotation-bindings) (not (eq (first annotation-bindings) '&rest)))
                             (mapcar #'(lambda (binding)
                                         (multiple-value-bind (variable default name) (binding-aspects binding)
                                           (when (symbolp name) (setf name `(quote ,name)))
                                           `(,variable (annotation-attribute ,element-binding ,name
                                                                             ,@(when default (list default))))))
                                     (if (eq (first annotation-bindings) '&key) (rest  annotation-bindings)  annotation-bindings)))
                            (t
                             (let ((variable (if (consp annotation-bindings) (second annotation-bindings) annotation-bindings)))
                               `((,variable (append (attributes ,element-binding) (namespaces ,element-binding))))))))))
      `(let* ,bindings
         ,@preface
         ,@body))))


#+digitool
(pushnew '(destructure-element . 2) *fred-special-indent-alist*)

:eof
