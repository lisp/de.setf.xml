;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.xml-rpc; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2005' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' /> <CHRONOLOGY>
  <DELTA DATE='20051107' />i
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :de.setf.xml.xml-rpc)

(defParameter *xml-rpc-package*
  (list (find-package "")))

(defParameter *xml-rpc-to-lisp-type-alist*
  '(("i4" . integer) ("int" . integer) ("double" . double)
    ("dateTime.iso8601" . universal-time) ("base64" . vector) ("struct" . cons)
    ("array" . sequence))
  "defines the mapping from xml-rpc type names to lisp type designators")

(defun validate-gi (name constraint &optional (errorp t))
  (or (eq name constraint)
      (when errorp (xml-error |VC: Element Valid| :name name))))

(defun perform-method-call (expression)
  (destructure-element ((gi) method-name-element arguments-element) expression
    (validate-gi gi '{}methodCall)
    (destructure-element ((gi) method-namestring) method-name-element
      (validate-gi gi '{}methodName)
      (destructure-element ((gi) &rest argument-elements) arguments-element
        (validate-gi gi '{}params)
        (apply (intern-function method-namestring)
               (mapcar #'(lambda (param) (intern-argument (first (children param)))) argument-elements))))))


(defun intern-function (namestring)
  (let* ((name (xmlp::make-uname namestring)))
    (multiple-value-bind (function-name visibility)
                         (find-symbol (local-part name) (namespace-name name))
      (if (and function-name
               (eq visibility :external)
               (find (symbol-package function-name) *exported-packages*))
        (symbol-function function-name) (progn (break)
        (error "undefined method: ~a" namestring))))))

(defun intern-argument (argument-expression)
  (flet ((tws (x) (trim-string-whitespace x)))
    (destructure-element ((gi) encoded-value) argument-expression
      (validate-gi gi '{}value)
      (if (stringp encoded-value)
        encoded-value
        (destructure-element ((type-name) &rest children) encoded-value
          (let ((type (find-symbol (local-part type-name) :xml-rpc-types)))
            (assert (typep type 'xml-rpc-type))
            (ecase type
              ((xml-rpc-types:|i4| xml-rpc-types:|int|)
               (parse-integer (tws (first children))))
              (xml-rpc-types:|double|
                             (parse-double (tws (first children))))
              (xml-rpc-types:|dateTime.iso8601|
                             (date:|yyyyMMddTHH:mm:ss| (first children)))
              (xml-rpc-types:|base64|
                             (parse-base64 (first children)))
              (xml-rpc-types:|struct|
               (mapcar #'(lambda (child)
                           (destructure-element ((gi) name value) child
                             (validate-gi gi '{}member)
                             (unless (and name value)
                               (xml-error |VC: Element Valid| :name gi))
                             (validate-gi (name name) '{}name)
                             (validate-gi (name value) '{}value)
                             (cons (xmlp::make-uname (first (children name)))
                                   (intern-argument value))))
                       children))
              (xml-rpc-types:|array|
               (destructure-element ((gi) &rest values) (first children)
                 (validate-gi gi '{}data)
                 (apply #'vector (mapcar #'intern-argument values)))))))))))



(defGeneric xml-rpc-encode-node (node)
  (:method ((node integer)) (xml* {}int (encode-node node)))
  (:method ((node string)) (encode-node node))
  (:method ((node float)) (xml* {}double (encode-string (write-to-string node))))
  (:method ((node sequence))
           (xml* {}array (xml* {}data (map nil #'(lambda (v) (xml* {}value (xml-rpc-encode-node v))) node))))
  (:method ((node (eql t))) (xml* {}boolean "1"))
  (:method ((node null)) (xml* {}boolean "0"))
  (:method ((node cons))
           (xml* {}struct
                 (dolist (member node)
                   (destructuring-bind (name . value) member
                     (xml* {}member
                           (xml* {}name (encode-node name))
                           (xml* {}value (xml-rpc-encode-node value))))))))


;;;
;;; parsing functions

(defun parse-double (string &aux (s +1) (es +1) (i 0) (f 0) (e 0) (m #\e) (f-count 0) (i-count 0) (e-count 0) (v 0) d)
  (flet ((ctoi (d) (- (char-code d) #.(char-code #\0))))
    (with-string-meta (string)
      (and
       (match
        "[{#\\+ [#\\- !(setq s -1)] []}
          $[@(\"0123456789\" d) !(setf i (+ (* i 10) (ctoi d)) i-count (1+  i-count))]
          {#\\. []}
          $[@(\"0123456789\" d) !(setf f (+ (* f 10) (ctoi d)) f-count (1+ f-count))]
          {@(\"eEsSdDfFlL\" m) []}
          {#\\+ [#\\- !(setq es -1)] []}
          $[@(\"0123456789\" d) !(setf e (+ (* e 10) (ctoi d)) e-count (1+ e-count))]
          ]")
       (when (> (+ f-count i-count) 0)
         (when (> f-count 0) (setf f (/ f (expt 10 f-count))))
         (setf v (+ i f))
         (when e-count (setf v (* v (expt 10 (* es e)))))
         (when (< s 0) (setf v (- v)))
         (case m ((#\E #\e) (float v 0.0e0))
               ((#\S #\s) (float v 0.0s0))
               ((#\D #\d) (float v 0.0d0))
               ((#\F #\f) (float v 0.0s0))
               ((#\L #\l) (float v 0.0s0))))))))

(defun parse-base64 (string)
  (declare (ignore string))
  (error "not implemented"))


;;;
;;; the server kernel

(defun serve-method-call (input-source output-destination)
  (handler-case
    (let* ((document (document-parser input-source :ignore-whitespace t))
           (result nil))
          (handler-bind ((error (lambda (c) (break "error: ~a" c))))
            (let ((*namespace-bindings* '(("" . ""))))
              (setf result (perform-method-call (root document)))))
      (with-xml-writer (output-destination)
        (xml* {}methodResponse
              (xml* {}params
                    (xml* {}param
                          (xml* {}value
                                (xml-rpc-encode-node result)))))))
    (error (condition)
           (with-xml-writer (output-destination)
             (xml <methodResponse>
                  <fault><value>
                  (xml-rpc-encode-node
                   `(({}faultCode . ,(get-universal-time))
                     ({}faultString . ,(format nil "~a" condition))))
                  </value></fault></methodResponse>)))))

(defun issue-method-call (output-destination  method-name &rest arguments)
  (with-xml-writer (output-destination)
    (xml <methodCall><methodName>(encode-string method-name)</methodName>
           <params>(dolist (argument arguments)
                     (xml <param><value>(xml-rpc-encode-node argument)</value></param>))
             </params></methodCall>)))

(defun call-served-method (input-source output-destination method-name &rest arguments)
  (apply #'issue-method-call output-destination method-name arguments)
  (ccl:stream-close output-destination)
  (let* ((*namespace-bindings* '(("" . "")))
         (result (document-parser input-source :ignore-whitespace t)))
    (destructure-element ((gi) response-parameters) (root result)
      (validate-gi gi '{}methodResponse)
      (destructure-element ((gi) response-value) response-parameters
        (cond ((eq gi '{}params)        ; success
               (intern-argument (first (children response-value))))
              ((eq gi '{}fault)
               (let ((error-values (intern-argument response-value)))
                 (error "server-fault: ~s: ~a"
                        (rest (assoc '{}faultCode error-values))
                        (rest (assoc '{}faultString error-values))))))))))
#|

(defParameter *validation-spec*
  '(("ctLeftAngleBrackets" . #\<)
    ("ctRightAngleBrackets" . #\>)
    ("ctAmpersands" . #\&)
    ("ctApostrophes" . #\')
    ("ctQuotes" . #\")))

(export '||::|validator.countTheEntities| "")
(defMethod ||:|validator.countTheEntities| ((param string))
  (mapcar #'(lambda (spec) (destructuring-bind (name . char) spec (cons name (count char param))))
          *validation-spec*))

(||:|validator.countTheEntities| "<><><>&&&\"'")

(with-xml-writer (*trace-output*)
  (let ((*print-pretty* t))
    (mapc #'xml-rpc-encode-node (list t nil 1 1.1 #(1 2)
                                      (||:|validator.countTheEntities| "<><><>&&&\"'")))))

(let ((*namespace-bindings* '(("" . ""))))
  (perform-method-call
   (root (document-parser
          "<methodCall><methodName>validator.countTheEntities</methodName>
          <params><param>&lt;&gt;&lt;&gt;&lt;&gt;&amp;&amp;&amp;\"'</param></params>
          </methodCall>"
          :ignore-whitespace t))))



(let ((*namespace-bindings* '(("" . "")))
      (*print-pretty* t))
  (serve-method-call "<methodCall><methodName>validator.countTheEntities</methodName>
          <params><param>&lt;&gt;&lt;&gt;&lt;&gt;&amp;&amp;&amp;\"'</param></params>
          </methodCall>"
                     *trace-output*))

(defClass pipe (ccl:input-stream ccl:output-stream)
  ((datum :initform nil)
   (status :initform :open)))
(defMethod ccl:stream-tyo ((stream pipe) (char t))
  (with-slots (datum) stream
    (when datum (ccl:process-wait "blocked pipe" #'(lambda () (null datum))))
    (setf datum char)))
(defMethod ccl:stream-tyi ((stream pipe))
  (with-slots (datum status) stream
    (loop (cond (datum (return (shiftf datum nil)))
                ((eq status :closed) (return nil))
                (t (ccl:process-wait "empty pipe"
                                     #'(lambda () (or datum (not (eq status :open))))))))))

(defmethod ccl:stream-close ((stream pipe))
  (with-slots (status) stream
    (call-next-method)
    (setf status :closed)))
(defmethod stream-reopen ((stream pipe))
  (with-slots (status) stream
    (setf status :open)))

(defmethod ccl:stream-eofp ((stream pipe))
  (with-slots (status) stream
    (eq status :closed)))
(defmethod stream-openp ((stream pipe))
  (with-slots (status) stream
    (eq status :open)))


(issue-method-call *terminal-io* "validator.countTheEntities" "<><><>&&&\"'")

(let ((pipe-c2s (make-instance 'pipe))
      (pipe-s2c (make-instance 'pipe)))
  (ccl:process-run-function "server"
                            #'(lambda ()
                                (loop (stream-reopen pipe-s2c)
                                      (serve-method-call pipe-c2s pipe-s2c)
                                      (ccl:stream-close pipe-s2c)
                                      (ccl:process-wait "closed pipe"
                                                        #'(lambda () (stream-openp pipe-c2s))))))
  (let ((input nil))
    (loop (format *terminal-io* "~%?? " )
          (setf input (read-line *terminal-io*))
          (stream-reopen pipe-c2s)
          (format *terminal-io* "~%==~s~%"
                  (call-served-method pipe-s2c pipe-c2s "validator.countTheEntities" input)))))


|#

:EOF