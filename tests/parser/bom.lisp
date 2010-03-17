;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

#|
<DOCUMENTATION>
 <DESCRIPTION>
  an xml-dev posting april 2001 rasied the question as to which BOMs were
  recognized. of the test cases, one is unambiguously invalid (with ent2x.ent).
  that one causes an well-formednes exception. the others all parse.
  <DESCRIPTION>
 </DOCUMENTATION>
|#


;; 20010915 0.913

(pprint
 (mapcar #'(lambda (path)
             (handler-case
               (let* ((document (document-parser path))
                      (x (find-def-general-entity '{}x document :if-does-not-exist nil)))
                 ; (inspect document)
                 (list path document (encoding document)
                       (when x (encoding x))))
               (condition (condition)
                          (princ condition)
                          (list path condition))))
         (directory #p"xml:standards;XML;XMLConf;bomtest;*.xml")))

#|
;; to examine the file contents

(defMethod stream->vector ((stream stream)
                           &aux (buffer (make-array 0 :element-type 'cons
                                                    :adjustable t
                                                    :fill-pointer 0))
                           byte)
  (loop (unless (setf byte (read-byte stream nil nil))
          (return buffer))
        (vector-push-extend (cons byte (code-char byte)) buffer)))
(defMethod stream->vector ((pathname pathname))
  (with-open-file (stream pathname :direction :input :element-type '(unsigned-byte 8))
    (stream->vector stream)))

(document-parser #P"www:Dokumente:Standards:XML:XMLConf:bomtest:ent2x.xml")

(let ((*print-base* 16))
  (print (stream->vector #P"www:Dokumente:Standards:XML:XMLConf:bomtest:ent2x.ent")))

|#

:EOF
