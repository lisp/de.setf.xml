;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.utility.implementation; -*-

(in-package :de.setf.utility.implementation)

<DOCUMENTATION>
 <DESCRIPTION>
  a simplistic http server to handle xml-rpc requests.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2003' AUTHOR='james adam anderson'>all rights reserved. no warranty.
  <a href='http://www.setf.de/library/ncsl.html'>[0]</a>
  <a href='ncsl.html'>[1]</a></COPYRIGHT>
  <CHRONOLOGY>
   <DELTA DATE='20031110'></DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>

(defPackage :de.setf.http
  (:use )
  (:export :get-http-request :parse-url-keywords :serve-http :write-http-response :open-http-stream-p))

(use-package :de.setf.http :de.setf.utility.implementation)

(defParameter *crlf* (make-array 2 :element-type 'character :initial-contents '(#\return #\linefeed)))

(defun write-http-response (stream code writer &optional (mime "text/html")
                                   &aux (crlf #.(make-array 2 :element-type 'character :initial-contents '(#\return #\linefeed)))
                                   (phrases '((200 . "OK") (404 . "Not Found"))))
  (format stream "HTTP/1.0 ~a ~a~aContent-Type: ~(~a~)~a~a"
          code (or (rest (assoc code phrases :test #'eql)) "Unknown") crlf mime crlf crlf)
  (funcall writer stream)
  (write-string crlf stream)
  (force-output stream))

(defun read-http-request (stream &aux (buffer (make-array  32 :element-type 'character :fill-pointer 0 :adjustable t))
                                 byte space1 space2)
  (loop (unless (setf byte (read-byte stream nil nil)) (return))
        (when (eql byte #.(char-code #\return))
          (read-byte stream)
          (return))
        (vector-push-extend (code-char byte) buffer))
  (setf space1 (position #\space buffer)
        space2 (position #\space buffer :from-end t))
  (when (and space1 space2)
    (values (subseq buffer (1+ space1) space2) (subseq buffer 0 space1))))

(defun parse-url-keywords (string &aux (next-keyword (position #\? string)) plist =position)
  (when (find #\+ string)
    (setf string (substitute #\space #\+ string)))
  (loop (unless next-keyword (return (nreverse plist)))
        (incf next-keyword)
        (unless (setf =position (position #\= string :start next-keyword))
          (error "bad keywords: ~s" string))
        (push (intern (subseq string next-keyword =position) "KEYWORD") plist)
        (setf next-keyword (position #\& string :start =position))
        (push (subseq string (1+ =position) (or next-keyword (length string))) plist)))

(defun open-http-stream-p (stream)
  (when (streamp stream)
    #+mcl (let ((conn (ccl::stream-io-buffer stream nil)))
            (not (or (null conn) (ccl::ot-conn-closed-p conn))))
    #-mcl (open-stream-p stream)))

(defun serve-http (&key port handlers verbose &aux #+allegro (socket nil) (http-stream nil) (uri nil))
  (unwind-protect
    (progn
      (setf http-stream
            #+(and mcl digitool) (ccl::open-tcp-stream nil port :element-type '(unsigned-byte 8))
            #+(and allegro) (socket::accept-connection
                             (or socket
                                 (setf socket (socket::make-socket :connect :passive :local-port port :format :binary :reuse-address t)))
                             :wait t)
            #-(or mcl allegro) (error "add socket-open implementation"))
      (when verbose
        (format *trace-output* "~%http://localhost:~d/ " port))
      (loop (handler-case
              (progn
                (setf uri (read-http-request http-stream))
                (when verbose
                  (format *trace-output* "~s~%" uri))
                (let ((handler (rest (find-if #'(lambda (predicate)
                                                  (etypecase predicate
                                                    (function (funcall predicate uri))
                                                    (string (string-equal uri predicate :end1 (min (length uri) (length predicate))))))
                                              handlers))))
                  (if handler
                    (funcall handler uri http-stream)
                    (write-http-response http-stream 404
                                         #'(lambda (stream)
                                             (format stream "<html><head/><body>not found: '~a'</body></html>"
                                                     uri))))))
              (error (condition)
                     (if (open-http-stream-p http-stream)
                       (write-http-response http-stream 200
                                            #'(lambda (stream) (format stream "error:~%~a" condition)))
                       (progn (warn "http stream error: %~a" condition)
                              (return-from serve-http nil)))))))
    (when (open-http-stream-p http-stream)
      (close http-stream))))

:EOF
