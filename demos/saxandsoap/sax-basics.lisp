(in-package :xml-sax)

;;; ----------------------------------------------------------------------------
;;;
;;;   Much of the contents of this file are subject to the NOKOS License Version 1.0a
;;;   (the "License"); you may not use this file except in compliance with
;;;   the License. 
;;;
;;;   Software distributed under the License is distributed on an "AS IS"
;;;   basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
;;;   License for the specific language governing rights and limitations under
;;;   the License. 
;;;
;;;   The Original Software is 
;;;     WILBUR: Nokia RDF/XML Processor for CLOS
;;;
;;;   Copyright (c) 2001 Nokia and others. All Rights Reserved.
;;;   Portions Copyright (c) 1989-1992 Ora Lassila. All Rights Reserved.
;;;
;;;   Contributor(s): Ora Lassila (mailto:ora.lassila@nokia.com)
;;;                   Louis Theran <theran@pobox.com>
;;;
;;;  NOTE: only the SAX api definition portion of wilbur-xml is being used.
;;;     the underlying parser is cl-xml
;;;
;;; ----------------------------------------------------------------------------
;;; Extracted from file windows/core/source/xml-utils.lisp
;;; from distribution at http://wilbur-rdf.sourceforge.net.

;;; 7-27-01: Stanley Knutson (knewt@alum.mit.edu): modified to not
;;; specialize based on open-tag type, for easier migration to CL-XML

;;; 18-sep-01: added locator slot

;;; ----------------------------------------------------------------------------
;;;
;;;   XML TOKEN CLASSES
;;;
;;;   The SAX parser uses some tag classe
;;;
;;;   TOKEN [removed]                abstract
;;;     TAG                       abstract
;;;       OPEN-TAG                processed
;;;       CLOSE-TAG               processed

(defclass tag ()  
  ((string
    :initarg :string
    :accessor token-string)
   (counterpart
    :initform nil
    :accessor tag-counterpart)))

(defmethod print-object ((self tag) stream)
  (print-unreadable-object (self stream :type t)
    (princ (token-string self) stream)))

(defclass open-tag (tag)
  ((original-name
    :initform nil
    :accessor tag-original-name)
   (attributes
    :initform nil
    :accessor tag-attributes)
   (emptyp
    :initform nil
    :accessor tag-empty-p)
   (namespaces
    :initarg :namespaces
    :accessor tag-namespaces)))

(defclass close-tag (tag)
  ())

;;; ----------------------------------------------------------------------------
;;;
;;;   CLASS SAX-CONSUMER
;;;   SIMPLE SAX 1 -LIKE INTERFACE ("CL-SAX")
;;;

(defclass sax-consumer ()
  ((producer
    :initarg :producer
    :initform nil
    :accessor sax-consumer-producer)
   (locator
    :initarg :locator
    :initform nil
    :accessor sax-consumer-locator)
   (debugp
    :initarg :debugp
    :initform nil
    :reader sax-consumer-debug-p)))

(defgeneric start-element (consumer tag attributes namespaces mode))

(defgeneric end-element (consumer tag content mode))

#+java-form-not-used
(defgeneric add-characters (consumer char-array start length mode))

(defgeneric char-content (consume string mode))

(defgeneric processing-instruction (consumer instruction data mode))

(defgeneric start-document (consumer locator mode))

(defgeneric end-document (consumer mode))

(defgeneric character-events-p (consumer mode))

(defgeneric cdata-events-p (consumer mode))

(defgeneric collapse-whitespace-p (consume))

;;; The locator protocol [probably provided by the producer]
(defgeneric document-location (locator))
(defgeneric document-position (locator))

;;; XML-error can be specialized by a consumer (or producer) if needed
(defmethod xml-error ((self t) msg &rest args)
  "Signal an error in processing of this document.

<p>The default behavior is to invoke the error function with 
'XML text not well formed' in front of the msg

:PARAM msg is the format string
:PARAM args are the arguments to format"
  (apply #'error msg args))

;;; --------------------------------------------------
(defun debug-format (consumer string &rest args)
  (when (sax-consumer-debug-p consumer)
     (apply #'format *debug-io* string args)))

(defmethod find-first-producer ((consumer sax-consumer))
  (find-first-producer (sax-consumer-producer consumer)))

;;; Mode is an extension to assist in creating parsers
;;; that have state to be accessed on every sax event
(defmethod sax-consumer-mode ((self sax-consumer))
  nil)

;;; SGK 7/27/01: modified the following to dispatch on first arg only
;;; for improved speed in ACL6 (also allows open-tag class to be defined later)
(defmethod start-element ((self sax-consumer) tag attributes namespaces mode)
  (when (sax-consumer-debug-p self)
    (debug-format self "~&START ~A ~S ~s ~S" tag attributes namespaces mode)))

(defmethod end-element ((self sax-consumer) tag content mode)
  (debug-format self "~&END ~A ~s ~S" tag content mode))

(defmethod add-characters ((self sax-consumer) char-array start length mode)
  (debug-format self "~&CHARACTERS ~S ~S" (subseq char-array start (+ start length))
		mode))

(defmethod processing-instruction ((self sax-consumer) tag data mode)
  (debug-format self "~&PI ~S ~s ~S" tag data mode))

(defmethod start-document ((self sax-consumer) locator mode)
  (setf (slot-value self 'locator) locator)
  (debug-format self "~&START DOCUMENT ~S ~s" locator mode))

(defmethod end-document ((self sax-consumer) mode)
  (debug-format self "~&END DOCUMENT ~S" mode))

;;; Indicate we do not need individual character events at this time
(defmethod character-events-p ((self sax-consumer) mode)
  (declare (ignore mode))
  nil)

;;; Indicate we do not need individual CDATA events at this time
(defmethod cdata-events-p ((self sax-consumer) mode)
  (declare (ignore mode))
  nil)

;;; ----------------------------------------------------------------------------
;;;
;;;   CLASS SAX-PRODUCER
;;;

(defclass sax-producer ()
  ((consumer
    :accessor sax-producer-consumer)))

(defmethod find-first-producer ((producer sax-producer))
  producer)

(defmethod initialize-instance :after ((self sax-producer)
                                       &key (consumer
                                             (make-instance 'sax-consumer
                                               :debugp t))
                                       &allow-other-keys)
  (setf (sax-producer-consumer self) consumer))

(defmethod (setf sax-producer-consumer) :after ((consumer sax-consumer)
                                                (producer sax-producer))
  (setf (sax-consumer-producer consumer) producer))


;;; ----------------------------------------------------------------------------
;;;
;;;   CLASS SAX-FILTER
;;;

(defclass sax-filter (sax-consumer sax-producer)
  ((blockp
    :initform nil
    :initarg :blockp
    :accessor sax-filter-block-p)))

(defmethod start-element ((self sax-filter) tag attributes namespaces mode)
  (unless (sax-filter-block-p self)
    (start-element (sax-producer-consumer self)
		   tag attributes namespaces mode)))

(defmethod end-element ((self sax-filter) tag content mode)
  (unless (sax-filter-block-p self)
    (end-element (sax-producer-consumer self) tag content mode)))

(defmethod char-content ((self sax-filter) (content string) mode)
  (unless (sax-filter-block-p self)
    (char-content (sax-producer-consumer self) content mode)))

(defmethod processing-instruction ((self sax-filter) tag data mode)
  (unless (sax-filter-block-p self)
    (processing-instruction (sax-producer-consumer self) tag data mode)))

(defmethod start-document ((self sax-filter) locator mode)
  (unless (sax-filter-block-p self)
    (start-document (sax-producer-consumer self) locator mode)))


(defmethod end-document ((self sax-filter) mode)
  (unless (sax-filter-block-p self)
    (end-document (sax-producer-consumer self) mode)))

;;; --------------------------------------------------
;;; added 18-sep-01 knewt@alum.mit.edu

;;; ?? Needs a rethink -- the problem with xqdm-conditions
;;; is mostly the document source and position should be displayed
;;; and that may already be handled

(defmethod xml-error ((self sax-consumer) msg &rest args)
  "Signal an error in processing of this document.

Uses the current locator to include the document position

:PARAM msg is the format string
:PARAM args are the arguments to format"
  (with-slots (locator) self
    (if locator
	(apply #'error 
	       (concatenate 'string
		 msg "~%Document ~s position ~s")
	       (append args 
		       (list (document-location locator)
			     (document-position locator))))
      (apply #'error msg args))))

;;; --------------------------------------------------
(defun xml-space-p (char)
  (declare (optimize (speed 3) (safety 1)))
  (let ((code (char-code char)))
    (declare (type fixnum code))
    (or (eq code #x20)
	(eq code #x9)
	(eq code #xD)
	(eq code #xA))))

;;; Collapse-whitespace removes extra space
;;; rewritten to be efficient for Allegro: arrays with fill pointers are slow
;;; As a result, there are no function calls -- everything is inlined
(defun collapse-whitespace (string)
  (declare (type simple-string string)
	   (optimize speed)
	   ;; (:explain :types :calls) ;; show allegro optimizations
	   )
  ;; give up if they give use a variable string or one with a fill pointer
  (check-type string simple-string)
  (let* ((mode :start)
         (n (length string))
         (result nil)
	 (pass-two nil)
	 (pos 0))
    (declare (type fixnum pos n)(type simple-string result))
    (flet ((pushit (char)
	     (if pass-two
		 (setf (aref result pos) char))
	     (incf pos)))
      (dotimes (pass 2)
	;; first pass: compute size
	;; second pass: fill the string
	(if (eq pass 1) ;; 0,1 are the passes
	    (progn
	      (if (plusp pos)
		  (setq result (make-string pos))
		(progn
		  (setq result "")
		  (return result)))
	      (setq pass-two t pos 0)))
	(loop for i fixnum from 0 below n
	    do
	      (let ((c (aref string i)))
		(case mode
		  (:collect
		   (if (xml-space-p c)
		       (setf mode :white)
		     (pushit c)))
		  (:white
		   (unless (xml-space-p c)
		     (pushit #\Space)
		     (pushit c))
		   (setf mode :collect))
		  (:start
		   (unless (xml-space-p c)
		     (pushit c))
		   (setf mode :collect)))))))
    result))
