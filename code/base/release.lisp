;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-
;;;

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <p>utilities to extract and format version/changes and to copy sources for release.
  requires the loaded system for system description, packages, and for the
  documentation parser.
   </p>
  </DESCRIPTION>
 <CHRONOLOGY>
  <DELTA DATE='20010910'>
   <ul><li>adpated to new sysdcl form</li>
       <li>now distinguishing pc and mac release only</li></ul></DELTA>
  <DELTA DATE='20030329'>modified to run without loading the system</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(unless (or (find-package :xml-parser)
            (find-package :de.setf.xml.parser))
  (defpackage :xml-parser (:use :common-lisp :ccl) (:nicknames :xmlp)))

(in-package :xml-parser)

(defParameter *release-origin* #p"xml:**;*.*")

;; when the source is not loaded, this generates lots of warnings, but it is usable

(cond ((macro-function 'xml)
       )
      (t
       (warn "no xml parser present")
       (defmacro xml (&rest args) (declare (ignore args)) nil)
       (defmacro with-xml-writer (&rest args) (declare (ignore args)) nil)
       (declaim (ftype function attributes children document name object pathname-file-url root value))))

(unless (fboundp 'base-uri)
  (locally (declare (ftype function uri (setf uri))))
  (defun base-uri (x) (uri x))
  (defun (setf base-uri) (uri x) (setf (uri x) uri)))

(unless (fboundp 'define-system)
  (load (merge-pathnames (make-pathname :name "define-system" :directory '(:relative :up :up "library"))
                       *load-pathname*)))

(unless (ignore-errors (logical-pathname-translations "xml"))
  (load (merge-pathnames (make-pathname :name "sysdcl" :directory '(:relative :up :up))
                          *load-pathname*)))

(defun date-string (date)
  (multiple-value-bind (second minute hour day month year)
                       (decode-universal-time date)
    (declare (ignore second))
    (format nil "~2,'0d.~2,'0d.~4,'0d ~2,'0d:~2,'0d"
            day month year hour minute)))

(defun get-iso-time-string ()
  (multiple-value-bind (second minute hour day month year)
                       (get-decoded-time)
    (declare (ignore second))
    (format nil "~4,'0d~2,'0d~2,'0dT~2,'0d~2,'0d"
            year month day hour minute)))

(defMethod to-crlf ((from stream) (to stream) &aux byte (~-count 0))
  (multiple-value-bind (reader reader-arg) (stream-reader from)
    (multiple-value-bind (writer writer-arg) (stream-writer to)
      (loop (unless (fixnump (setf byte (funcall reader reader-arg))) (return))
            (cond ((= byte #.(char-code #\return))
                   (unless (oddp ~-count)
                     (funcall writer writer-arg byte))
                   (setf ~-count 0)
                   (funcall writer writer-arg #.(char-code #\linefeed)))
                  (t
                   (if (= byte #.(char-code #\~))
                     (incf ~-count)
                     (setf ~-count 0))
                   (funcall writer writer-arg byte))))))
  (set-mac-file-type (pathname to) :TEXT))

(defMethod to-crlf ((from pathname) (to t))
  (with-open-file (from from :direction :input :element-type 'unsigned-byte)
    (to-crlf from to)))

(defMethod to-crlf ((from t) (to pathname))
  (with-open-file (to to :direction :output
                      :if-does-not-exist :create :if-exists :supersede
                      :element-type 'unsigned-byte)
    (to-crlf from to)))



(defGeneric copy-release-file (target-form file-type source-pathname destination-pathname)
  (:method ((target-form (eql :macos)) (file-type t) source-pathname destination-pathname)
           (when *load-verbose*
             (format *trace-output* "~%copy ~s -> ~s" source-pathname destination-pathname))
           (copy-file source-pathname destination-pathname :if-exists :supersede)
           (write-char #\. *trace-output*))
  (:method ((target-form (eql :crlf)) (file-type t) source-pathname destination-pathname)
           (when *load-verbose*
             (format *trace-output* "~%convert ~s -> ~s" source-pathname destination-pathname))
           (to-crlf source-pathname destination-pathname)
           (write-char #\. *trace-output*)))




(defGeneric copy-release (systems version encoding)
  (:method ((system t) (version string) (encoding string))
           (copy-release system version (intern encoding :keyword)))
  (:method ((system t) (version string) (encoding symbol))
           (let ((destination (make-pathname :directory (append (butlast (pathname-directory (probe-file #4p"xml:")))
                                                                (list (concatenate 'string  "XML-" version "-"
                                                                                   (get-iso-time-string) "-" (string encoding))
                                                                      :wild-inferiors))
                                             :name :wild
                                             :type :wild)))
             (format *trace-output* "~%release destination: ~s" destination)
             (copy-release system destination encoding)))
  (:method ((system null) (version t) (encoding t)))
  (:method ((system symbol) (destination pathname) (encoding symbol))
           (when *load-verbose*
             (format *trace-output* "~%including system: ~s." system))
           (copy-release (cl-user::execute-system-operations system '(:files :force)) destination encoding))
  (:method ((sources cons) (destination pathname) (encoding symbol))
           (dolist (source sources)
             (copy-release source destination encoding)))
  (:method ((source string) (destination pathname) (encoding symbol))
           (copy-release (pathname source) destination encoding))
  (:method ((source pathname) (destination pathname) (encoding symbol))
           (flet ((wildp (x) (or (equal x "*") (equal x "**") (eq x :wild) (eq x :wild-inferiors))))
             (cond ((wild-pathname-p source)
                    (let* ((destination (translate-pathname source *release-origin* destination))
                           (wild-inferiors-p (wildp (first (last (pathname-directory source)))))
                           (wild-name-p (wildp (pathname-name source)))
                           (wild-type-p (wildp (pathname-type source)))
                           (*release-origin* (make-pathname :directory (if wild-inferiors-p
                                                                         (butlast (pathname-directory source))
                                                                         (pathname-directory source))
                                                            :name (if (or wild-name-p wild-type-p) nil (pathname-name source))
                                                            :type (if (or wild-name-p wild-type-p) nil (pathname-type source))
                                                            :defaults source)))
                      (setf *release-origin* (truename *release-origin*))
                      (when (or wild-inferiors-p wild-name-p wild-type-p)
                        (setf *release-origin* (make-pathname :directory (if wild-inferiors-p
                                                                           (append (pathname-directory *release-origin*) (list :wild-inferiors))
                                                                           (pathname-directory *release-origin*))
                                                              :name (pathname-name source)
                                                              :type (pathname-type source)
                                                              :defaults *release-origin*)))
                      (when *load-verbose*
                        (format *trace-output* "~%including origin: ~s (~s)." source *release-origin*))
                      (copy-release (directory source) destination encoding)))
                   (t
                    (let ((destination-pathname nil)
                          (origin *release-origin*))
                      (when (and (null (probe-file source)) (null (pathname-type source)))
                        (setf source (make-pathname :type "lisp" :defaults source)))
                      (unless (typep source 'logical-pathname)
                        (setf origin (translate-logical-pathname *release-origin*)))
                      (setf destination-pathname (translate-pathname source origin destination))
                      (when *load-verbose*
                        (format *trace-output* "~%including source: ~s -> ~s." source destination-pathname))
                      (let ((namestring (namestring destination-pathname)))
                        (when (find-if #'upper-case-p namestring)
                          (setf destination-pathname (string-downcase namestring))))
                      (copy-release-file encoding (pathname-type source) source (pathname destination-pathname)))))))
  (:documentation
   "the function copy-release copies all components of a release to a time-and-encoding-specific directory tree. it accepts three arguments: a source, a version marker, and an encoding keyword. the source may be specified as a symbol, which designates a system known to the system definition tools, as a list of sources, or as a pathname. a wild pathname is equivalent to the list of designated files. an effort is made to accommodate symbolic links, but the translation effective only at the point where a wild pathname is recognized."))
      

;; when cl-http is running

#+CL-HTTP
(http:export-url (URL:INTERN-URL (HTTP:MERGE-URL '"/lisp/releases/" (HTTP:LOCAL-CONTEXT)) :IF-DOES-NOT-EXIST :CREATE)
                 :directory :pathname #4P"entwicklung@paz:sourceserver:lisp:releases:")

;; avoid reader macro for when cl http is not present...
;; (http:export-url #u"/lisp/releases/" :directory :pathname #4P"entwicklung@paz:sourceserver:lisp:releases:")


;(copy-release :xrelease "0-949" :macos)
;(copy-release :xrelease "0-949" :crlf)
;(copy-release :xconformance "conform" :macos)
; to edit version markers
;(mapc #'ed '("xml:code;xparser;xml-parameters.lisp" "xml:code;xquery;xq-parameters.lisp" "xml:code;xpath;xpath-parameters.lisp" "xml:code;xquerydatamodel;xqdm-parameters.lisp" "xml:sysdcl.lisp"))

;;
;;
;;

(defun print-package-defs (package-name)
  (let ((library nil)
        (forms nil)
        (args nil)
        (w (make-instance 'fred-window :scratch-p t)))
    (do-external-symbols (sym (find-package package-name))
      (when (fboundp sym)
        (let ((fun (symbol-function sym)))
          (when (functionp fun)
            (if (CCL::STANDARD-GENERIC-FUNCTION-P fun)
              (setf args (nthcdr 2 (second (function-lambda-expression
                                            (method-function (elt (generic-function-methods fun) 0))))))
              (setf args (second (function-lambda-expression fun))))
            (if (find-if #'upper-case-p (string sym))
              (push (cons sym args) forms)
              (push (cons sym args) library))))))
    (write-string "<table border='1'>" w)
    (terpri w)
    (write-string "<tr><th colspan='2'>XPath forms</td></tr>" w)
    (dolist (sym-args (sort forms #'string-lessp :key #'first))
      (destructuring-bind (sym . args) sym-args
        (format w "~%<tr><td  width='160 pixels'>~a</td><td>~{~a~^ ~}</td></tr>"
                sym args)))
    (format w "~%</table>")
    
    (write-string "<table border='1'>" w)
    (terpri w)
    (write-string "<tr><th colspan='2'>XPath library functions</td></tr>" w)
    (dolist (sym-args (sort library #'string-lessp :key #'first))
      (destructuring-bind (sym . args) sym-args
        (format w "~%<tr><td  width='160 pixels'>~a</td><td>~{~a~^ ~}</td></tr>"
                sym args)))
    (format w "~%</table>")))

;(print-package-defs "XPA")
;(print-package-defs "XQL")


;;
;;
;;



(defGeneric read-documentation (source)
  (:method ((pathname pathname))
           (with-open-file (stream (merge-pathnames *.lisp-pathname* pathname) :direction :input)
             (read-documentation stream)))
  (:method ((pathname string))
           (read-documentation (pathname pathname)))
  (:method ((stream stream) &aux (buffer (make-array 256 :fill-pointer 0
                                                     :adjustable t
                                                     :element-type 'character)))
           (declare (ftype (function (t) t) document-parser))
           (flet ((read-docstring (stream &aux char)
                    (loop (unless (setf char (read-char stream nil nil))
                            (return-from read-docstring nil))
                          (when (and (char= char #\#) (eql #\| (peek-char nil stream nil nil)))
                            (read-char stream) (return)))
                    (loop (unless (setf char (read-char stream nil nil))
                            (return-from read-docstring nil))
                          (when (and (char= char #\|) (eql #\# (peek-char nil stream nil nil)))
                            (read-char stream) (return))
                          (vector-push-extend char buffer))
                    (setf buffer (string-trim #(#\space #\return #\linefeed #\tab) buffer))))
             (when (and (plusp (length (read-docstring stream))) (eql (char buffer 0) #\<))
               (handler-case
                 (let ((doc-node
                        (document-parser (string-trim #(#\space #\return #\linefeed) buffer))))
                   (when doc-node
                     (setf (base-uri doc-node) (pathname-file-url (pathname stream))))
                   doc-node)
                 (error (condition)
                        (warn "error parsing documentation: ~s: ~a."
                              stream condition)
                        condition))))))

(defun get-deltas (doc-node)
  (typecase doc-node
    (doc-node
     (dolist (e (children (root doc-node)))
       (typecase e
         (elem-node
          (when (string-equal (name e) "CHRONOLOGY")
            (return
             (remove-if-not #'(lambda (n) (string-equal n "DELTA")) (children e)
                            :key #'name)))))))
    (null
     nil)
    (t
     (warn "no deltas from: ~s." doc-node)
     nil)))

(defun collect-system-files (system)
  (let ((files nil))
    (cl-user::execute-system-operations system #'(lambda (name) (pushnew name files :test #'equalp)))
    (sort files #'string-lessp :key #'namestring)))

(defGeneric print-version-chronology (destination &key key)
  (:method ((pathname pathname) &rest args)
           (with-open-file (stream pathname :direction :output
                                   :if-exists :supersede :if-does-not-exist :create)
             (apply #'print-version-chronology stream args)))
  (:method ((pathname string) &rest args)
           (apply #'print-version-chronology (pathname pathname) args))
  (:method ((stream stream) &key (key :date) &aux (files (collect-system-files :xquery)))
           (labels ((select-files (directory)
                      (remove-if-not #'(lambda (pathname) (find directory (pathname-directory pathname)
                                                                :test #'string-equal))
                                     files))
                    (collect-deltas (paths)
                      (apply #'append (mapcar #'get-deltas
                                              (mapcar #'read-documentation paths))))
                    (delta-date (delta &aux (date@ (find "date" (attributes delta)
                                                         :key #'name :test #'string-equal))
                                       date)
                      (cond ((and date@ (setf date (value date@))
                                  (= (length date) 8))
                             date)
                            (t
                             (error "bad date: ~a: ~s." date@ date)
                             "")))
                    (delta-version (delta &aux (version@ (find "version" (attributes delta)
                                                               :key #'name :test #'string-equal)))
                      (when version@ (value version@))))
             (let* ((xqdm-deltas (collect-deltas (select-files "xquerydatamodel")))
                    (xml-deltas (collect-deltas (select-files "xparser")))
                    (xp-deltas (collect-deltas (select-files "xpath")))
                    (xq-deltas (collect-deltas (select-files "xquery")))
                    (base-deltas (collect-deltas (cons "xml:sysdcl" (select-files "base")))))
               (declare (ignore-if-unused xqdm-deltas xml-deltas xp-deltas xq-deltas base-deltas)
                        (ignoreable xqdm-deltas xml-deltas xp-deltas xq-deltas base-deltas))
               (flet ((extract-versions (deltas)
                        (sort (remove nil
                                      (remove-duplicates (mapcar #'(lambda (d &aux v)
                                                                     (when (setf v (delta-version d))
                                                                       (list v (delta-date d))))
                                                                 deltas)
                                                         :test #'equalp))
                              #'string-lessp :key #'first))
                      (assign-deltas (v-infos deltas &aux (previous-date "") version-alist)
                        ;; collect everything up to the first version
                        (setf version-alist
                              (nconc (mapcar #'(lambda (v-info)
                                                 (destructuring-bind (version date) v-info
                                                   (prog1 (list (list version previous-date date))
                                                     (setf previous-date date))))
                                             v-infos)
                                     ;; add an ultimate entry for canges since the last version
                                     (list (list (list "?" previous-date "?")))))
                        
                        (map nil #'(lambda (delta &aux (date (delta-date delta)) entry)
                                     (unless (setf entry (find-if
                                                          #'(lambda (v-info)
                                                              (and (string< (second v-info)
                                                                            date)
                                                                   (string<= date
                                                                             (third v-info))))
                                                          version-alist :key #'first))
                                       (error "missing v-info."))
                                     (push delta (rest entry)))
                             deltas)
                        (map nil #'(lambda (v-info)
                                     (setf (rest v-info)
                                           (sort (rest v-info)
                                                 (ecase key
                                                   (:file
                                                    #'(lambda (di1 di2)
                                                        (if (string= (first di1) (first di2))
                                                          (string< (rest di1) (rest di2))
                                                          (string< (first di1) (first di2)))))
                                                   (:date
                                                    #'(lambda (di1 di2)
                                                        (if (string= (rest di1) (rest di2))
                                                          (string< (first di1) (first di2))
                                                          (string< (rest di1) (rest di2))))))
                                                 :key #'(lambda (delta)
                                                          (cons (object (uri (document delta)))
                                                                (delta-date delta))))))
                             version-alist)
                        version-alist)
                      (format-deltas (module versions)
                        (xml "hr")
                        (xml "h2" module)
                        (xml "hr")
                        (xml "dl"
                                  (dolist (v-info versions)
                                    (destructuring-bind ((name from to) &rest deltas &aux prev-header) v-info
                                      (if (string= name "?")
                                        (setf name "Open")
                                        (setf name (format nil "Version ~a" name)))
                                      (if (string= from "")
                                        (setf from "........"))
                                      (if (string= to "?")
                                        (setf to "present"))
                                      (xml "dt"
                                                name " (covers " from " - " to "):")
                                      (xml "dd"
                                                (dolist (delta deltas)
                                                  (let ((name (object (uri (document delta))))
                                                        (date (delta-date delta)))
                                                    (ecase key
                                                      (:file
                                                       (unless (equalp name prev-header)
                                                         (when prev-header (encode-string "</p>"))
                                                         (encode-string "<p>")
                                                         (xml "b" name)
                                                         (encode-string "<br />")
                                                         (setf prev-header name))
                                                       (encode-string date)
                                                       (encode-string "<br />")
                                                       (encode-string (value-string delta)))
                                                      (:date
                                                       (unless (equalp date prev-header)
                                                         (when prev-header (encode-string "</p>"))
                                                         (encode-string "<p>")
                                                         (xml "b" date)
                                                         (encode-string "<br />")
                                                         (setf prev-header date))
                                                       (encode-string name)
                                                       (encode-string "<br />")
                                                       (encode-string (value-string delta))))
                                                    (xml "p"))))))
                                  (xml "hr"))))
                 (with-xml-writer (stream)
                   (xml "html"
                             (xml ("head" ("title" (date-string (get-universal-time)))))
                             (xml "body"
                                       (xml "hr")
                                       (encode-string (date-string (get-universal-time)))
                                       (encode-string "<br />")
                                       "[" (xml ("a" ("href" "#base")) "Base") "] ["
                                       (xml ("a" ("href" "#xqdm")) "XQDM") "] ["
                                       (xml ("a" ("href" "#xparser")) "XParser") "] ["
                                       (xml ("a" ("href" "#xpointer")) "XPointer") "] ["
                                       (xml ("a" ("href" "#xquery")) "XQuery") "]"
                                       (xml ("a" ("name" "base")))
                                       (format-deltas "Base"
                                                      (assign-deltas (extract-versions base-deltas)
                                                                     base-deltas))
                                       (xml ("a" ("name" "xqdm")))
                                       (format-deltas "XML Query Data Model"
                                                      (assign-deltas (extract-versions xqdm-deltas)
                                                                     xqdm-deltas))
                                       (xml ("a" ("name" "xparser")))
                                       (format-deltas "XML Parser"
                                                      (assign-deltas (extract-versions xml-deltas)
                                                                     xml-deltas))
                                       (xml ("a" ("name" "xpointer")))
                                       (format-deltas "X Pointer"
                                                      (assign-deltas (extract-versions xp-deltas)
                                                                     xp-deltas))
                                       (xml ("a" ("name" "xquery")))
                                       (format-deltas "X Query"
                                                      (assign-deltas (extract-versions xq-deltas)
                                                                     xq-deltas))
                                       (xml "hr")))))))))


#|
;; this produces the complete version documentation
(print-version-chronology "xml:documentation;version-0-918.html")

;; these test aspects of the process
(read-documentation "entwicklung@bataille:Source:LISP:xml:xpath:XPath-parameters.lisp")

(get-deltas (read-documentation "entwicklung@bataille:Source:LISP:xml:xpath:XPath-parameters.lisp"))
|#

:EOF
