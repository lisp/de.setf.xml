(in-package :xml-sax)

;;; This "sax consumer" creates simple structures based on the document content
;;; NOTE: this can't handle everything in xml since namespaces are not really dealt with

;;; The specific goal is to create a sax parser test case

#+isc
(isc::record-source-file "$Revision: 1.1.1.1 $" "$State: Exp $" "$Source: /home/cvs/repository/Library/de/setf/cl-xml/demos/saxandsoap/simple-xml.lisp,v $")

(eval-when (compile load eval)
  (defclass simple-xml-parser (empty-sax-consumer)
    ((pending-tags :initform nil
		   :documentation "stores the pending tags as (tag elem)")
     (open-tag :initform nil :documentation "Current tag")
     (open-element :initform nil :documentation "Current element")
     (document :initform nil)
     ))
  
  (defclass simple-xml-document ()
    ((ids :initform (make-hash-table :test #'equalp))
     (children :initform nil :accessor xml-children)))
  (defclass simple-xml-element ()
    ((name :initform nil :accessor xml-name :initarg :name)
     (attributes :initform nil :accessor xml-attributes :initarg :attributes)
     ;; children is a plist of children tags
     (children :initform nil :accessor xml-children)
     (value :initform nil :accessor xml-value)))
)

(defun simple-xml-parse (source)
  (parse-object source :consumer 'simple-xml-parser))

(defmethod start-document ((xml-consumer simple-xml-parser) locator mode)
  "Receive notification of the beginning of a document."
  (declare (ignore mode))
  (with-slots (document) xml-consumer
    (setf document (make-instance 'simple-xml-document))))

(defmethod end-document ((xml-consumer simple-xml-parser) mode)
  "Receive notification of the end of a document.
Returns two values: the document and the parser"
  (with-slots (document) xml-consumer
    (values document xml-consumer)))


(defmethod start-element ((xml-consumer simple-xml-parser) element-tag attributes namespaces mode)
  (with-slots (open-tag open-element pending-tags document) xml-consumer
    (let* ((outer-element open-element))
      (push (list open-tag open-element) pending-tags)
      (setf open-tag element-tag)
      (setf open-element (make-instance 'simple-xml-element
			   :name (tag-original-name element-tag)
			   :attributes attributes))
      ;; add the new element to the appropriate parent
      (if outer-element
	  (push open-element (xml-children outer-element))
	(push open-element (xml-children document))))
    ))

(defmethod end-element ((xml-consumer simple-xml-parser)
			element-tag content mode)
  (with-slots (open-tag open-element pending-tags) xml-consumer

    (setf (xml-value open-element) content)
    (let* ((outer (pop pending-tags)))
      (setf open-tag (first outer))
      (setf open-element (second outer)))))


;;; --------------------------------------------------
;;; methods on the document and elements

(defmethod print-as-tree ((document simple-xml-document)
			  &key (stream t) (indent 0) &allow-other-keys)
  (format stream "~vTXML Document~%" indent)
  (with-slots (children) document
    (let* ((index 0))
      (dolist (ch children)
	(print-as-tree ch :stream stream 
		       :indent (+ 2 indent)
		       :index (list (incf index)))))))

(defmethod print-as-tree ((node simple-xml-element)
			  &key (stream t) (indent 0) (index '())
			  &allow-other-keys)
  (with-slots (children name attributes value) node
    (format stream "~vT[~s] Node ~s~%" indent index name)
    (format stream "~vT     Value ~s~%" indent value)
    (format stream "~vT     Attrs ~s~%" indent attributes)
    (let* ((this-index 0))
      (dolist (ch children)
	(print-as-tree ch :stream stream 
		       :indent (+ 2 indent)
		       :index (append index (list (incf this-index))))))))