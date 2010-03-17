;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package :xml-parser)

<DOCUMENTATION>
 <DESCRIPTION>
  immediate serialization macros.
  <p>
  adapted from html-gen.slik. the resemblance remains, but is remote.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson'>all rights reserved. no warranty.
  <a href='http://www.setf.de/library/ncsl.html'>[0]</a>
  <a href='ncsl.html'>[1]</a></COPYRIGHT>
 <CHRONOLOGY>
  <DELTA DATE='20010621' AUTHOR='JAA'>
   new. adapted html-gen to the encoding serialization functions.</DELTA>
  <DELTA DATE='20011219'>*generated-ns-bindings*as a special binding with
   a single global handler;<br />corrections for name instances.</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>

(defMacro xml (expression)
  (when (eq (first expression) 'annotation) (setf expression (rest expression)))
  `(xml* ,(first expression) ,@(mapcar #'(lambda (exp)
                                           (typecase exp
                                             (cons (if (consp (first exp)) `(xml ,exp) exp))
                                             (t exp)))
                                       (rest expression))))

(setq de.setf.xiod.implementation::*xml-hook*
      #'(lambda (expression) (cons 'annotation expression)))

(defMacro annotation (&rest expression)
  (cons 'de.setf.xiod.implementation::comment expression))
  


(defmacro xml* (tag &rest content)
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
                     (symbol (progn (setf need-namespaces t) tag))
                     (abstract-name (progn (setf need-namespaces t) tag))
                     (cons (if (and (= (length tag) 2) (eq (car tag) 'quote))
                             (second tag)
                             (if (consp (first tag))
                               (second (first tag))
                               (first tag))))))
	 (attributes (etypecase tag
                       (string nil)
                       (symbol nil)
                       (abstract-name nil)
                       (cons (if (and (= (length tag) 2) (eq (car tag) 'quote))
                               nil (cdr tag)))))
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
                                     (unless (find-namespace value :if-does-not-exist nil)
                                       (warn "namespace not defined: '~a'" value))
                                     `(setf *namespace-bindings* (acons ',name (find-namespace ,value)
                                                                        *namespace-bindings*)))))))
                          attributes))))
    (flet ((needs-quoting? (v)
             ;; this test applies only to static strings in element content...
             (not (find-if #'(lambda (c) (find c "<>&")) v))))
      (when (symbolp tag-name) (setf tag-name `(quote ,tag-name)))
      `(let (,@(when need-namespaces
                 `((*namespace-bindings* *namespace-bindings*)
                   (*generated-ns-bindings* nil)))
             (*node-level* (1+ *node-level*)))
         ,@namespace-bindings
         (when *print-pretty*
           (encode-char #\newline)
           (dotimes (i *node-level*) (encode-char #\space)))
         (encode-char #\<)
         (encode-node ,tag-name)
         ,@(when attributes
             (mapcar #'(lambda (attr &aux name value)
                         (if (consp attr)
                           (setf name (first attr)
                                 value (second attr))
                           (setf name attr value (string attr)))
                         `(let ((attribute-value ,value))
                            ;; skip the attribute if the effective value is null
                            (when attribute-value
                              (encode-char #\space)
                              (encode-node ',name)
                              (encode-char #\=)
                              (encode-char #\')
                              (encode-node attribute-value)
                              (encode-char #\'))))
                     attributes))
         ,@(if need-namespaces
            `((when *generated-ns-bindings*
                (encode-generated-ns-bindings *generated-ns-bindings*))))
         ,(if content '(encode-char #\>) '(encode-string " />"))
         ;; if the form is an expression, then presume it is to be included for the side effect
         ;; a string or a symbol is written directly
         ,@(mapcar #'(lambda (form)
                       (if (consp form)
                         form
                         (if (and (stringp form) (not (needs-quoting? form)))
                           `(encode-string ,form)
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
