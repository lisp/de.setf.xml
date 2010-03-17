;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: XML-UTILS; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  simple vector streams for use with cl-xml decoding
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010605' AUTHOR='MS'>lispworks conformance</DELTA>
  <DELTA DATE='20010702'>moved from xparser to xutils to support data url
   </DELTA>
  <DELTA DATE='20020118'>some CormanLisp</DELTA>
  <DELTA DATE='20030602'>scl</DELTA>
  <DELTA DATE='20070404' AUTHOR='jaa'>replaced output methods - which had evidenelt never been used...</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#
(in-package :XML-UTILS)


;;;
;;; abstract

(defClass vector-stream ()
  ((position :initform 0)
   (vector :initarg :vector :reader vector-stream.vector)
   #+(or clisp CMU lispworks sbcl scl clozure-common-lisp) (direction :initarg :direction)
   )
  #+CormanLisp
  (:default-initargs :element-type 'character))

(defMethod stream-state ((stream vector-stream))
  (with-slots (position) stream
    (format nil "@~s" position)))

#+cmu
(let ((old-definition (fdefinition 'stream-element-type)))
  (unless (typep old-definition 'generic-function)
    (fmakunbound 'stream-element-type)
    (defgeneric stream-element-type (stream))
    (setf (documentation 'stream-element-type 'function)
          (documentation old-definition 'function))
    (defmethod stream-element-type (stream)
      (funcall old-definition stream))))

(defMethod stream-element-type ((stream vector-stream))
  '(unsigned-byte 8))

(defMethod stream-position
           ((stream vector-stream) &optional new)
  (with-slots (position) stream
    (if new
      (setf position new)
      position)))

(defMethod stream-eofp
           ((stream vector-stream))
  (with-slots (position vector) stream
    (>= position (length vector))))

(defMethod print-object
           ((vs vector-stream) (stream t)
            &aux (*print-array* t) (*print-length* 32) (*print-base* 16))
  (print-unreadable-object (vs stream :type t)
    (princ (vector-stream.vector vs) stream)))


;;;
;;; input

(defClass vector-input-stream (vector-stream
                               #+ALLEGRO excl::fundamental-binary-input-stream
                               #+clisp gray:fundamental-binary-input-stream
                               #+CMU extensions:fundamental-binary-input-stream
                               #+CormanLisp stream
                               #+LispWorks stream:fundamental-stream
                               #+(and MCL digitool) ccl::input-binary-stream
                               #+clozure-common-lisp ccl:fundamental-binary-input-stream
                               #+sbcl sb-gray:fundamental-binary-input-stream
                               #+scl ext:binary-input-stream
                               )
  ()
  (:default-initargs :direction :input))

(defMethod initialize-instance :after
           ((instance vector-input-stream) &key)
  (with-slots (vector) instance
    (etypecase vector
      (string (setf vector (map 'vector #'char-code vector)))
      (list (setf vector (map 'vector #'(lambda (datum)
                                          (etypecase datum
                                            (fixnum datum)
                                            (character (char-code datum))))
                              vector)))
      (vector t))))

(defMethod stream-tyi ((stream vector-input-stream))
  (with-slots (position vector) stream
    (when (< position (length vector))
      (prog1 (svref vector position)
        (incf position)))))

(defMethod stream-untyi ((stream vector-input-stream) (datum integer))
  (with-slots (position vector) stream
    (cond ((< position 0)
           (decf position)
           (setf (svref vector position) datum))
          (t
           (error 'end-of-file :stream stream)))))

(defMethod stream-reader ((stream vector-input-stream))
  (with-slots (vector position) stream
    (if (typep vector 'simple-vector)
      #'(lambda (ignore) (declare (ignore ignore))
         (when (< position (length vector))
           (prog1 (svref vector position)
             (incf position))))
      #'(lambda (ignore) (declare (ignore ignore))
         (when (< position (length vector))
           (prog1 (aref vector position)
             (incf position)))))))


;;;
;;; output

(defClass vector-output-stream (vector-stream
                                #+ALLEGRO excl::fundamental-binary-output-stream
                                #+clisp gray:fundamental-binary-output-stream
                                #+CMU extensions:fundamental-binary-output-stream
                                #+CormanLisp stream
                                #+LispWorks stream:fundamental-stream
                                #+(and MCL digitool) ccl::output-binary-stream
                                #+clozure-common-lisp ccl:fundamental-binary-output-stream
                                #+sbcl sb-gray:fundamental-binary-output-stream
                                #+scl ext:binary-output-stream
                                )
  ((position :initform 0)
   (vector :initarg :vector :reader vector-stream.vector))
  (:default-initargs :direction :output))

(defMethod initialize-instance :after
           ((instance vector-output-stream) &key)
  (with-slots (vector position) instance
    (if (slot-boundp instance 'vector)
      (etypecase vector
        (vector (assert (adjustable-array-p vector))
                (setf position (setf (fill-pointer vector) 0))))
      (setf vector (make-array 32 :element-type '(unsigned-byte 8) :adjustable t :fill-pointer 0)))))

(defMethod stream-tyo ((stream vector-output-stream) (datum integer))
  (with-slots (position vector) stream
    (setf position (1+ (vector-push-extend datum vector)))
    datum))


(defMethod stream-writer ((stream vector-output-stream))
  (with-slots (vector position) stream
    #'(lambda (next datum)
        (unless (< (setf next (1+ position)) (length vector))
          (adjust-array vector (+ position (/ position 4))
                        :element-type '(unsigned-byte 8)))
        (setf (svref vector position) datum)
        (setf position next))))

#|
(inspect
(mapcar #'(lambda (vector)
            (multiple-value-list 
             (decoding-stream-reader (make-instance 'vector-input-stream :vector vector) nil)))
        '(#(#x00 #x00 #x00 #x3c)
          #(#x3c #x00 #x00 #x00)
          #(#x00 #x00 #x3c #x00)
          #(#x00 #x3c #x00 #x00)
          #(#xff #xfe #x00 #x3c)
          #(#xfe #xff #x3c #x00)
          #(#x00 #x3c #x00 #x3f)
          #(#x3c #x00 #x3f #x00)
          #(#x3c #x3f #x78 #x60)
          #(#x12 #x12 #x3c #x3f))))
;("UCS-4-1234" "UCS-4-4321" "UTF-4-2143" "UCS-4-3412" "UTF-16-21" "UTF-16-12" "UTF-16-21" "UTF-16-12" "UTF-8" "UTF-8")

(defparameter *s* (encoded-stream "<?xml ?><x>asdfgh</x>"))
(inspect *s*)
(peek-char nil *s*)
(loop (unless (princ (encoded-stream-tyi *s*)) (return)))


(with-open-file (stream (choose-file-dialog) :direction :input
                        :element-type '(unsigned-byte 8))
  (let ((c nil)
        (w (make-instance 'fred-window))
        (cs (make-instance 'decoding-stream :stream stream)))
    (print (encoded-stream.encoding cs))
    (loop (unless (setf c (stream-tyi cs)) (return))
          (write-char c w))
    (fred-update w)))
|#             


:EOF

