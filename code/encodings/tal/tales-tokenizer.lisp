;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: tal; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  a tokenizer for XPath is implemented based on the cl reader. this performs the lexical
  transform only.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)' />
 <CHRONOLOGY>
  <DELTA DATE='20010118' AUTHOR='jaa'>initial version</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "TAL")


(eval-when (:execute :load-toplevel :compile-toplevel)
  (labels ((_token-reader (name)
             #'(lambda (stream char)
                 (declare (ignore stream char))
                 name))
           (_alternative-token-reader (name1 name2 test-char)
             #'(lambda (stream char)
                 (declare (ignore char))
                 (cond ((eql test-char (peek-char t stream nil nil))
                        ;; discard the second character in the token
                        (read-char stream)
                        name2)
                       (t name1))))
           (set-token-macro-character (character &optional (non-terminating nil))
             ;; a single-character token maps to a specific token, with termination by default
             (let ((token (intern (make-string 1 :initial-element character)
                                  *token-package*)))
               (set-macro-character character (_token-reader token) non-terminating *tal-readtable*)))
           )

    (setf *tal-readtable* (copy-readtable nil))
    (setf (readtable-case *tal-readtable*) :preserve)
    (set-macro-character #\$ #'(lambda (stream char)
                                (cond ((eql (setf char (read-char stream)) #\$)
                                       '|xml|::|$$|)
                                      ((eql (setf char (read-char stream)) #\{)
                                       '|xml|::|${|)
                                      (char
                                       (unread-char char stream)
                                       '|xml|::|$|)))
                         nil *tal-readtable*)
    (map nil #'set-token-macro-character ";:{}|/")
    ;; end of xpath tokens
    ))


(defun token-reader (&aux
                     (*readtable* *tal-readtable*)
                     (*package* *token-package*)
                     #+:aclpc (allegro::*read-case* :leave)
                     char input)
  (flet ((next-char (&optional (eof-error t) (eof-value nil))
           (if *input-reread-char*
             (shiftf *input-reread-char* nil)
             (read-char *input-source* eof-error eof-value))))
    (flet ((name-token (char)
             (setf (fill-pointer *input-buffer*) 0)
             (loop (unless (xml-space? char)
                     (return))
                   (unless (setf char (next-char nil nil))
                     (setf *input-eof*  t)
                     (return-from name-token nil)))
             (loop (unless (xml-namechar? char)
                     (unread-char char *input-source*)
                     (return))
                   (vector-push-extend char *input-buffer*)
                   (unless (setf char (next-char nil nil))
                     (setf *input-eof*  t)
                     (return)))
             (subseq *input-buffer* 0))
           (maybe-meta-token (char)
             (cond ((rest (assoc char '((#\: . |xml|::|:|)
                                        (#\; . |xml|::|;|)
                                        (#\; . |xml|::|;|)
                                        (#\/ . |xml|::|/|)
                                        (#\\ . |xml|::|\\|)))))
                   ((eql char #\$)
                    (setf char (next-char))
                    (cond ((null char) '|xml|::|$|)
                          ((eql char #\$) '|xml|::|$$|)
                          ((eql char #\{) '|xml|::|${|)
                          (t
                           (unread-char char *input-source*)
                           '|xml|::|$|)))))
           (read-StringData (&aux char)
             (setf (fill-pointer *input-buffer*) 0)
             (loop (unless (setf char (next-char nil nil))
                     (setf *input-eof* t)
                     (return (subseq *input-buffer* 0)))
                   (if (member char *string-data-terminator* :test #'eql)
                     (let ((next-char (peek-char nil *input-source* nil nil)))
                       (cond ((and next-char (eql char next-char))
                              (read-char *input-source*)
                              (vector-push-extend char *input-buffer*))
                             (next-char
                              (setf *input-reread-char* char)
                              (return (subseq *input-buffer* 0)))
                             (t
                              (unread-char char *input-source*)
                              (return (subseq *input-buffer* 0)))))
                     (vector-push-extend char *input-buffer*)))))
      (unless *input-eof*
        (setf input
              (cond ((and *string-data-terminator* (eql *string-data-colon* '|xml|:|:|))
                     (read-StringData))
                    ((setf char (next-char nil nil))
                     (or (maybe-meta-token char)
                         (name-token char)))
                    (t
                     nil)))
        (setq *string-data-colon* 
              (when (and *string-data-terminator* (eq input '|xml|::|:|))
                '|xml|::|:|))
        ;; if the last character is a ';', ignore it.
        ;; the example often have a trailing delimiter even thoug the grammar does not permit it
        (when (and (eq input '|xml|::|;|) (not (peek-char t *input-source* nil nil)))
          (setf *input-eof*  t)
          (setf input nil))
        input))))


;(locationpath-tokenizer "$x!=\"foo\"")

:EOF
