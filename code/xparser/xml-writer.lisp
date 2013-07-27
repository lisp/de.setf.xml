;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  immediate serialization macros.
  <p>
  adapted from html-gen.slik. the resemblance remains, but is remote.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010621' AUTHOR='JAA'>
   new. adapted html-gen to the encoding serialization functions.</DELTA>
  <DELTA DATE='20011219'>*generated-ns-bindings*as a special binding with
  a single global handler;<br />corrections for name instances.</DELTA>
  <DELTA DATE='20041025' AUTHOR='janderson'>
   added cons/lisp option xo xml macro attribute processing<DELTA>
  <DELTA DATE='20090415' AUTHOR='janderson'>
    allow non-constant namespace names for xmlns bindings in XML macro.
    </DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")

(defun normalize-attribute-form (attr)
  (if (consp attr)
      (if (and (consp (rest attr))
               (= (length attr) 2))
          attr
        (cons (first attr) (list (rest attr))))
    (list attr (string attr))))

(defmacro xml (tag &rest content)
  "Write a tag with contents, xs.  form can be:
  tag -> name
  tag -> (name . attribute ...)
  name -> a symbol naming an HTML element, like h1. (nb. unquoted is normal)
  attribute -> a symbol naming an attribute with a declare value, 
               like compact.
  attribute -> (name value)
  value -> will be turned into a string and escaped properly.
  nb. intended to be used within an an <code>WITH-XML-WRITER</code>."
  (let* ((need-namespaces nil)
         (tag-name (etypecase tag
                     (string tag)
                     (symbol
                      (setf need-namespaces t)
                      tag)
                     (abstract-name
                      (setf need-namespaces t)
                      tag)
                     (cons
                      (setf need-namespaces t)
                      (if (and (= (length tag) 2) (eq (car tag) 'quote))
                        (second tag)
                        (if (and (consp (first tag)) (eq (caar tag) 'quote))
                          (second (first tag))
                          (first tag))))))
         (attributes (etypecase tag
                       (string nil)
                       (symbol nil)
                       (abstract-name nil)
                       (cons (if (and (= (length tag) 2) (eq (car tag) 'quote))
                                 nil
                               (mapcar #'normalize-attribute-form
                                       (cdr tag))))))
         (namespace-bindings
          (remove nil
                  (mapcar #'(lambda (attr)
                              (destructuring-bind (name value) attr
                                ;; check if a new namespace binding is implied
                                (etypecase name
                                  (string nil)
                                  ((or symbol abstract-name)
                                   (when (string= (namespace-name (namespace name))
                                                  *xmlns-prefix-namestring*)
                                     (setf need-namespaces t)
                                     (when (and (constantp value)
                                                (not (find-namespace value :if-does-not-exist nil)))
                                       (warn "namespace not defined: '~a'" value))
                                     `(setf *namespace-bindings* (acons ',name (find-namespace ,value)
                                                                        *namespace-bindings*)))))))
                          attributes))))
    (flet ((needs-quoting? (v)
             ;; this test applies only to static strings in element content...
             (not (find-if #'(lambda (c) (find c "<>&")) v))))
      (when (and (symbolp tag-name) (xqdm::uname-p tag-name))
        (setf tag-name `(quote ,tag-name)))
      `(let (,@(when need-namespaces
                 `((*namespace-bindings* *namespace-bindings*)
                   (*generated-ns-bindings* nil)))
             ,@(when (and (consp tag-name) (not (eq (car tag-name) 'quote)))
                 (let ((binding (gensym "TAG-NAME")))
                   `((,binding ,(shiftf tag-name binding)))))
             (*node-level* (1+ *node-level*)))
         ,@namespace-bindings
         (when *print-pretty*
           (encode-char #\newline)
           (dotimes (i *node-level*) (encode-char #\space)))
         (encode-char #\<)
         (encode-node ,tag-name)
         ,@(when attributes
             (mapcar #'(lambda (attr)
                         (destructuring-bind (name value) attr
                           `(let ((attribute-value ,value))
                              ;; skip the attribute if the effective value is null
                              (when attribute-value
                                (encode-char #\space)
                                (encode-node ',name)
                                (encode-char #\=)
                                (encode-char *attribute-value-delimiter*)
                                ;; need different escaping (encode-node attribute-value)
                                (encode-attribute-value attribute-value)
                                (encode-char *attribute-value-delimiter*)))))
                     attributes))
         ,@(if need-namespaces
            `((when *generated-ns-bindings*
                (encode-generated-ns-bindings *generated-ns-bindings*))))
         ,(if content '(encode-char #\>) '(encode-string " />"))
         ;; if the form is an expression, then presume it is to be included for the side effect
         ;; a string or a symbol is written directly
         ,@(mapcar #'(lambda (form)
                       (if (consp form)
                         (if (or (consp (first form)) (xqdm::uname-p (first form)))
                           (cons 'xml form)
                           form)
                         (if (stringp form)
                           (if (needs-quoting? form)
                             `(encode-character-data ,form)
                             `(encode-string ,form))
                           `(encode-node ,form))))
                   content)
         (when *print-pretty*
           (encode-char #\newline)
           (dotimes (i (1+ *node-level*)) (encode-char #\space)))
         ,@(when content
             `((encode-string "</")
               (encode-node ,tag-name)
               (encode-string ">")))))))

#|
(with-xml-writer (*trace-output*)
  (xml tag "test 1 2 3"))

(with-xml-writer (*trace-output*)
  (xml "tag" "test 1 2 3"))

(with-xml-writer (*trace-output*)
  (xml ({xhtml}tag ({xmlns}|| "http://www.w3.org/1999/xhtml")) "test 1 2 3"))

(with-xml-writer (*trace-output*)
  (xml ("tag" ({xmlns}|| "http://www.w3.org/1999/xhtml")) "test 1 2 3"))

(with-xml-writer (*trace-output*)
  (format *writer-stream* "test ~a" 1))

|#
:EOF
