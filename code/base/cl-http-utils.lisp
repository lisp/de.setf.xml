;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: www-utils; -*-
;;;

#|
<DOCUMENTATION>
 <DESCRIPTION>
  used when compiled for cl-http.
  this contains direct patches and extensions to existing code/classes.
  uniform uri management is implemented in the "tuils.lisp" file.
  </DESCRIPTION>
 <CHRONOLOGY>
  <DELTA DATE='20011220'>fixed '/' position in file url directory name string</DELTA>
  <DELTA DATE='20031008'>%pop-connection-from-pool now correct on 70-177b</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "WWW-UTILS")

;; this was grouped incorrectly at :version and the path had a doubled head
(defun default-pathname (&optional defaults host default-type default-version)
  (let ((default-path http::*default-pathname*))
    (cond ((or defaults host default-type default-version)
           (when (or (eq host :unspecific) (zerop (length host))) (setf host (pathname-host default-path)))
           (when (or (eq host :unspecific) (zerop (length host))) (setf host nil))
           (let*  ((default-dir (pathname-directory default-path))
                   (path (make-pathname :host host
                                        :device (and (not host) (pathname-device default-path))
                                        :directory (and default-dir (cons :absolute (rest default-dir)))
                                        :type (pathname-type default-path)
                                        :version (pathname-version default-path))))
             (if defaults
                 (merge-pathnames path defaults)
                 path)))
          (t default-path))))

(in-package "URL")

;; this is additional
(defmethod directory-name-string ((url file-url) &optional recompute-p)
    (with-value-cached (url :directory-name-string :recompute-p recompute-p)
      (with-output-to-string (stream)
        (write-scheme-prefix url stream)
        (write-host-port-string url stream)
        (write-char #\/ stream)
        (write-path url stream))))

(defmethod local-url-p ((url file-url) &aux (host (host-string url)))
  ;; either no host, a device, or a known logical host
  (or (zerop (length host))
      (char= (char host (1- (length host))) #\:)
      (ignore-errors (logical-pathname-translations (host-string url)))
      (call-next-method)))

(defmethod host-for-pathname ((url file-url) &optional null-local-host-p)
  (declare (ignore null-local-host-p))
  (host-string url))

#|
;; one would think path-mixin would suffice, but object-mixin has precedence in the case of file urls
(defmethod translated-pathname ((url path-mixin))
  (let ((directory `(:absolute ,. (path url)))
        (host (host-for-pathname url t)))
    (when (zerop (length host)) (setf host nil))
    (make-pathname :host host
                   :device (device-for-pathname url)
                   :directory directory)))

(defmethod translated-pathname ((url object-mixin))
  (let ((directory `(:absolute ,. (path url)))
        (host (host-for-pathname url t)))
    (when (zerop (length host)) (setf host nil))
    (make-pathname :host host
                   :device (device-for-pathname url)
                   :directory directory
                   :name (object url)
                   :type (extension url)
                   :version nil)))
|#

(in-package "HTTP")

; this was missing a :deallocated option, which can make it impossible to use an aborted connection
#|
(defun %pop-connection-from-pool (connection port)
  (declare (values connection new-top-conn))
  (loop with new-top-conn and prev
        for conn = connection then next
        for next = (and conn (connection-next conn))
        while conn
        do (cond ((= port (connection-port conn))
		  (if prev
		      (setf (connection-next prev) next)
		      (setq new-top-conn (or next :clear-entry)))
		  (ecase (connection-state conn)
		    (:open
		      (return-from %pop-connection-from-pool
			(values conn new-top-conn)))
		    (:closed
		      (deallocate-connection conn))
                    (:deallocated ; was missing
		      )))
		 (t (setq prev conn)))
        finally (return (values nil new-top-conn))))
|#

(define-mime-content-type
  :text
  :minor-types (:plain :html :xml)
  :parameters ((:charset :us-ascii :iso-8859-1 :iso-8859-2 :iso-8859-3 :iso-8859-4
                         :iso-8859-5 :iso-8859-6 :iso-8859-7 :iso-8859-8 :iso-8859-9
                         :iso-2022-jp :iso-2022-jp :iso-2022-kr 
                         :unicode-1-1 :unicode-2-2-utf-7 :unicode-2-2-utf-7
			 :koi8-r)))

:EOF
