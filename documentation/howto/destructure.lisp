;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xqdm ; -*-

<DOCUMENTATION>
 <title>a destructuring macro for document model elements</title>
 <DESCRIPTION>
  implements a macro, destructure-element, which established bindings for a given element's annotation and content components. the target may be an instance element or an annotated expression. the annotation may be bound to keyword or a rest parameter while the content my be bound to positionla, keword, or a rest parameter.
  </DESCRIPTION>
 <COPYRIGHT DATE='2003' AUTHOR='james anderson'/>
 <CHRONOLOGY>
  <DELTA DATE='20031014'>version with single binding phrase and uniform keyword parameters</DELTA>
  <DELTA DATE='20031022'>xqdm package version</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>


(in-package :xqdm)

(export '(destructure-element)
        :xqdm)

(defun nconc! (list &rest components &aux (result list))
  (declare (dynamic-extent components))
  (dolist (c components)
    (dolist (cc c) (setf (car list) cc) (pop list)))
  result)


(defMacro destructure-element (((name &rest annotation-bindings) &rest content-bindings) element &rest body
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
    (flet ((aspects (binding)             ; returns the variable, default, and keyword/name components
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
                                          (multiple-value-bind (variable default name) (aspects binding)
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
                      (if (and (consp annotation-bindings) (not (eq (first annotation-bindings) '&rest)))
                        (mapcar #'(lambda (binding)
                                    (multiple-value-bind (variable default name) (aspects binding)
                                      (when (symbolp name) (setf name `(quote ,name)))
                                      `(,variable (annotation-attribute ,element-binding ,name
                                                                        ,@(when default (list default))))))
                                (if (eq (first annotation-bindings) '&key) (rest  annotation-bindings)  annotation-bindings))
                        (let ((length (gensym))
                              (variable (if (consp annotation-bindings) (second annotation-bindings) annotation-bindings)))
                          (setf body `((declare (fixnum ,length) (dynamic-extent ,variable))
                                       (nconc! ,variable (attributes ,element-binding) (namespaces ,element-binding))
                                       ,@body))
                          `((,length (+ (length (attributes ,element-binding)) (length (namespaces ,element-binding))))
                            (,variable (list ,length))))))))
      `(let* ,bindings
         ,@preface
         ,@body))))

#+digitool
(pushnew '(destructure-element . 2) *fred-special-indent-alist*)


;(destructure-element ((name . attributes) . content) (an element) name)
;(destructure-element ((name a1) . content) (an element) name)
;(destructure-element ((name &key a1 (a2 2) ((n3 a3) 3)) . content) (an element) name)
:eof
