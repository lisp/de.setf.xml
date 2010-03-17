(in-package :xml-sax)

;;; This "sax consumer" parses soap format XML document
;;; NOTE: this can't handle everything in soap yet.

#+isc
(isc::record-source-file "$Revision: 1.1.1.1 $" "$State: Exp $" "$Source: /home/cvs/repository/Library/de/setf/cl-xml/demos/saxandsoap/simple-soap.lisp,v $")

(eval-when (compile load eval)
  (defclass soap-xml-parser (empty-sax-consumer)
    ((pending-tags :initform nil
		   :documentation "stores the pending tags as (tag elem)")
     (open-tag :initform nil :documentation "Current tag")
     (open-element :initform nil :documentation "Current element")
     (open-element-type :initform nil :documentation "soap-type object")
     (document :initform nil)
     ))
  
  (defclass soap-xml-container ()
    ((children :initform nil :accessor xml-children)))
  
  (defclass soap-xml-document (soap-xml-container)
    ((ids :initform (make-hash-table :test #'equalp))))

  ;; structures are simple objects
  (defclass soap-xml-structure (soap-xml-container)
    ((name :initform nil :accessor xml-name :initarg :name)
     (attributes :initform nil :accessor xml-attributes :initarg :attributes)
     (value :initform nil :accessor xml-value)))

  ;; the array class is temporary during parsing
  (defclass soap-xml-array (soap-xml-structure)
    ((array :initform nil)
     (next-element :initform 0)))

  ;;---
  (defclass soap-type-info ()
    ((name :initarg :name :accessor soap-type-name)
     (func :initarg :function :accessor soap-type-function)
     (parse-element-type :initarg :parse-element-type
			 :initform 'soap-xml-structure
			 :accessor soap-type-parse-element-type)
     (collapse-whitespace-p :initarg :collapse-whitespace-p
			    :accessor soap-type-collapse-whitespace-p)))
  
  (defvar *soap-type-table* (make-hash-table :test #'equalp))
  
  (defun declare-soap-type (name func &key collapse-whitespace-p
					   (parse-element-type 'soap-xml-structure))
    (let* ((type (make-instance 'soap-type-info
		   :function func
		   :name name
		   :parse-element-type parse-element-type
		   :collapse-whitespace-p collapse-whitespace-p)))
      (setf (gethash name *soap-type-table*) type)))
		    
  ;; The predefined soap types -> function, collapse-whitespacep
  (declare-soap-type "xsd:int" 'soap-int-element)
  (declare-soap-type "xsd:boolean" 'soap-boolean-element)
  (declare-soap-type "xsd:float" 'soap-float-element)
  (declare-soap-type "xsd:double" 'soap-double-element)
  (declare-soap-type "xsd:string" 'soap-string-element)
  ;;?? what is the real type here?
  (declare-soap-type "xsd:string-with-whitespace" 'soap-string-element
		     :collapse-whitespace-p t)
  ;; TBW: "SOAP-ENC:base64" soap-base64-element

  (declare-soap-type "SOAP-ENC:Array" 'soap-array-element
		     :parse-element-type 'soap-xml-array)

  (declare-soap-type "default" 'soap-simple-element)
  )


(defun soap-xml-parse (source)
  (parse-object source :consumer 'soap-xml-parser))

(defmethod start-document ((xml-consumer soap-xml-parser) locator mode)
  "Receive notification of the beginning of a document."
  (declare (ignore locator mode))
  (call-next-method) ;; stores the locator
  (with-slots (document) xml-consumer
    (setf document (make-instance 'soap-xml-document))))

(defmethod end-document ((xml-consumer soap-xml-parser) mode)
  "Receive notification of the end of a document.
Returns two values: the document and the parser"
  (declare (ignore mode))
  (call-next-method)
  (with-slots (document) xml-consumer
    (values document xml-consumer)))


;;; ?? may need to retain namespaces
(defmethod start-element ((xml-consumer soap-xml-parser)
			  element-tag attributes namespaces mode)
  (declare (ignore mode namespaces))
  (with-slots (open-tag open-element open-element-type 
	       pending-tags document) xml-consumer
    (push (list open-tag open-element open-element-type) pending-tags)
    (setf open-tag element-tag)
    (let* ((attr+val (assoc "xsi:type" attributes :test #'equalp))
	   (type (if attr+val
		     (gethash (second attr+val) *soap-type-table*))))
      (if (and attr+val (null type))
	  (warn "~s ignored" attr+val))
      (if (null type)
	  (setf type (gethash "default" *soap-type-table*)))
      (setf open-element (make-instance (soap-type-parse-element-type type)
			 :name (tag-original-name element-tag)
			 :attributes attributes))
      (initialize-parse open-element)
      (setf open-element-type type))))

(defmethod end-element ((xml-consumer soap-xml-parser)
			element-tag content mode)
  (declare (ignore element-tag mode))
  (with-slots (open-tag open-element open-element-type
	       pending-tags document) xml-consumer
    (let* ((outer (pop pending-tags))
	   ;; content is the value to be stored
	   ;; so dispatch by the type if we know it
	   (func (if open-element-type
		     (soap-type-function open-element-type)))
	   ;; process the content
	   (real-value (funcall (or func #'soap-simple-element)
				open-element content))
	   ;; now store into the appropriate object.
	   (to-store (or (second outer) document)))
      ;; add the new element to the appropriate parent
      ;; the container called dispatchs for arrays/structs 
      (add-soap-child to-store open-element real-value)

      ;; now proceed with outer info
      (setf open-tag (first outer))
      (setf open-element (second outer))
      (setf open-element-type (third outer)))))

;;; --------------------------------------------------
;;; Type-specific code

;;; NOTE: 
;;; the implementation here is deferring the read 
;;; until after all of the char-data has been accumulated.
;;; This results in unnecessary consing since the list of the string is created
;;; I don't know if multiple call to char-content might be made

(defun soap-int-element (element content)
  (declare (ignore element))
  (read-from-string (first content)))

;;; Booelans are 0 or 1
(defun soap-boolean-element (element content)
  (declare (ignore element))
  (string= (first content) "1"))

(defun soap-float-element (element content)
  (declare (ignore element))
  (read-from-string (first content)))

(defun soap-double-element (element content)
  (declare (ignore element))
  (read-from-string (first content)))

(defun soap-string-element (element content)
  (declare (ignore element))
  (if (eq (length content) 1)
      (first content)
    (apply #'concatenate 'string content)))

;;; For types we don't handle yet, just store the element
(defun soap-simple-element (element content)
  (declare (ignore content))
  element)

(defmethod initialize-parse ((element soap-xml-structure))
  element)

;;; Create an array
;;; Note the length must be specified
;;; [we don't yet deal with typed arrays, everything is a general array]
(defmethod initialize-parse ((element soap-xml-array))
  (with-slots (attributes) element
    ;; attribute info is SOAP-ENC:arrayType="xsd:ur-type[4]"
    (let* ((attr+val (assoc "SOAP-ENC:arrayType" attributes :test #'equalp))
	   (val (second attr+val))
	   (size (let* ((len (length val)))
		   (unless (and val (> len 12)
				(string-equal val "xsd:ur-type[" :end1 12))
		     (xml-error *construction-context*
				"No array size specified - SOAP-ENC:arrayType is ~s"
				val))
		   (read-from-string val nil nil :start 12 :end (1- len)))))
      (unless (and (typep size 'fixnum)
		   (< 0 size 10000000))
	(xml-error "Specified arrayType ~s is not valid" val))
      (with-slots (array next-element) element
	(setf array (make-array size))
	(setf next-element 0)))))

;;; for arrays, there is not supposed to be any other content
;;; so the result is the array that was collected
(defun soap-array-element (element content)
  (declare (ignore content))
  (with-slots (array) element
    array))
	
(defmethod collapse-whitespace-p ((consumer soap-xml-parser))
  (with-slots (open-element-type) consumer
    (if open-element-type
	(soap-type-collapse-whitespace-p open-element-type)
      t)))

;;; create plist of name and child value [as for a structure]
(defmethod add-soap-child ((container soap-xml-container) open-element child)
  (with-slots (children) container
    (with-slots (name) open-element
      (push child children)
      (push (construct-attribute-name xmlp::*construction-context* name) 
	    children))))

(defmethod add-soap-child ((container soap-xml-array) open-element child)
  (declare (ignore open-element))
  (with-slots (array next-element) container
    (if (>= next-element (length array))
	;; too much data, print a warning and ignore it
	(warn "Too much data in array ~s, more than ~d elements"
	      (xml-name container) (length array))
      (progn
	(format t "stored ~s in ~d~%" child next-element)
	;; for arrays, the name is ignored
	(setf (aref array next-element) child)
	(incf next-element)))))

;;; --------------------------------------------------
;;; methods on the document and elements

(defmethod print-as-tree ((document soap-xml-document)
			  &key (stream t) (indent 0) &allow-other-keys)
  (format stream "~vTXML Document~%" indent)
  ;; call the soap-xml-container version
  (call-next-method))

(defmethod print-as-tree ((node soap-xml-container)
			  &key (stream t) (indent 0) (index '())
			  &allow-other-keys)
  (with-slots (children) node
    (let* ((this-index 0))
      (loop for val on children by #'cddr
	  do
	    (let* ((name (first val))
		   (data (second val)))
	      (format stream "~vT ~s = " indent name)
	      (if (typep data 'soap-xml-structure)
		  (progn
		    (format stream "~%")
		    (print-as-tree data :stream stream 
				   :indent (+ 2 indent)
				   :index (append index (list (incf this-index)))))
		(format stream "~s~%" data)))))))



(defmethod print-as-tree ((node soap-xml-structure)
			  &key (stream t) (indent 0) (index '())
			  &allow-other-keys)
  (with-slots (name attributes value) node
    (format stream "~vT~s Node ~s~%" indent index name)
    (format stream "~vT   Value ~s~%" indent value)
    (format stream "~vT   Attrs ~s~%" indent attributes)
    ;; call container version to deal with children
    (call-next-method)))
