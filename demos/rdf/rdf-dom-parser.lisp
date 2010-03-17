;;; -*- package: WILBUR; Syntax: Common-lisp; Base: 10 -*-

(in-package "WILBUR")

;; a dom-based rdf parser

(defClass dom-parser (nox:sax-producer)
  ())

(defClass rdf-dom-parser (rdf-parser)
  ()
  (:default-initargs
    :producer (make-instance 'dom-parser
                :consumer (make-instance 'rdf-syntax-normalizer))))

(defMethod nox:parse ((parser dom-parser) (source xqdm:doc-node) locator)
  (let ((nox:*current-parser* parser)
        (consumer (nox:sax-producer-consumer parser)))
    (nox:start-document consumer locator)
    (parse-dom parser (xqdm:root source))
    (nox:end-document consumer (nox:sax-consumer-mode consumer))))

(defMethod open-tag ((node xqdm:elem-node))
  (let ((tag (make-instance 'nox:open-tag))
        (name (xqdm:name node)))
    (flet ((tag-attribute (attr-node)
             (let* ((name (xqdm:name attr-node))
                    (value (xqdm:value attr-node))
                    (namespace (xqdm:namespace-name name))
                    (local-part (xqdm:local-part name)))
               (cons (concatenate 'string namespace local-part)
                     value)))
           (tag-namespace (ns-node)
             (let* ((name (xqdm:name ns-node))
                    (value (xqdm:value ns-node)))
               (cons (if (eq name xqdm:*default-namespace-attribute-name*)
                       nil
                       (xqdm:local-part name))
                     value))))
      (setf (nox:token-string tag)
            (if (eq (xqdm:namespace name) xqdm:*null-namespace*)
              (string name)
              (concatenate 'string
                           (xqdm:namespace-name name)
                           ;; "#"
                           (string name)))
            (nox::tag-original-name tag)
            (if (xqdm:prefix name)
              (format nil "~a:~a" (xqdm:prefix name) (string name))
              (string name))
            (nox:tag-attributes tag)
            (mapcar #'tag-attribute (xqdm:attributes node))
            (nox:tag-empty-p tag)
            (null (xqdm:children node))
            (nox:tag-namespaces tag)
            (mapcar #'tag-namespace (xqdm:namespaces node)))
      tag)))
          
(defMethod close-tag ((node xqdm:elem-node))
  (make-instance 'nox:close-tag))

(defMethod parse-dom ((parser dom-parser) (source xqdm:elem-node))
  (let ((open-tag (open-tag source))
        (close-tag (close-tag source)))
    (setf (nox:tag-counterpart open-tag) close-tag
          (nox:tag-counterpart close-tag) open-tag)
  (nox:start-element (nox:sax-producer-consumer parser) open-tag
                     (nox:sax-consumer-mode (nox:sax-producer-consumer parser)))
  (dolist (node (xqdm:children source))
    (parse-dom parser node))
  (nox:end-element (nox:sax-producer-consumer parser) open-tag
                   (nox:sax-consumer-mode (nox:sax-producer-consumer parser)))))

(defMethod instruction ((node xqdm:pi-node))
  (format nil "~a ~a" (xqdm:target node) (xqdm:value node)))

(defMethod parse-dom ((parser dom-parser) (source xqdm:pi-node))
  (nox:proc-instruction (nox:sax-producer-consumer parser)
                    (instruction source)
                    (nox:sax-consumer-mode (nox:sax-producer-consumer parser))))

(defMethod parse-dom ((parser dom-parser) (source string))
  (setf source (nox::collapse-whitespace source))
  (when (plusp (length source))
    (nox:char-content (nox:sax-producer-consumer parser)
                      source
                      (nox:sax-consumer-mode (nox:sax-producer-consumer parser)))))

(defun parse-db-from-dom (document &rest options)
  (apply #'parse-db-from-stream document (xqdm:uri document)
         :parser-class 'rdf-dom-parser
         options))

:EOF
