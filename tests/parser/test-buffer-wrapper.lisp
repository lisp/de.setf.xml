;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
demonstrates how an input source which comprises a buffer sequence could
be re-presented to the parser as a byte stream.

the key function is that which the stream-reader method yields.
the stream-position result is needed only should the parse fail, as
information for the error message.

;; 20010914 0.913
|#

(in-package "XML-PARSER")

(defClass buffer-wrapper (#-LispWorks stream
                          #+LispWorks stream:fundamental-input-stream)
  ((buffer)
   (start :initarg :start :initform 0)
   (end :initarg :end)
   (reader )
   (position :initform 0)))

(defMethod initialize-instance ((instance buffer-wrapper)
                                &rest initargs
                                &key buffer end stream generator)
  (setf (slot-value instance 'buffer) buffer)
  (with-slots (buffer reader start end position) instance
    (setf reader
          #'(lambda (char)
              (cond ((>= start end)
                     (incf position end)
                     (multiple-value-setq (buffer start end)
                       (funcall generator stream buffer))
                     (when buffer
                       (funcall reader buffer)))
                    ((setf char (aref buffer start))
                     (incf start)
                     char)))))
    
  (apply #'call-next-method instance
         :end (or end (length buffer))
         initargs))

(defMethod stream-reader ((stream buffer-wrapper))
  (with-slots (reader) stream
    (values reader #\null)))

(defMethod stream-position ((stream buffer-wrapper) &optional new)
  (declare (ignore new))
  (with-slots (position start) stream
    (+ start position)))

(defMethod stream-element-type ((stream buffer-wrapper))
  'character)

(let ((buffers '("<asdf>q" "wer&" "#32" ";ty</asdf>"))
      (result nil))
  (setf result
        (document-parser (make-instance 'buffer-wrapper
                           :buffer (pop buffers)
                           :generator #'(lambda (stream buffer)
                                          (declare (ignore stream))
                                          (setf buffer (pop buffers))
                                          (values buffer 0 (length buffer))))))
  (write-node result *trace-output*))


:EOF
