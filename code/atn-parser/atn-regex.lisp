;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <DESCRIPTION>
  a string regular expression matcher based on the bnf->atn parser
  </DESCRIPTION>
 <CHRONOLOGY>
  <DELTA DATE='20010620' AUTHOR='JAA'>
   adapted the xml validation methods for character strings
   </DELTA>
  <DELTA DATE='20010718' AUTHOR='JCMA">cleaned up package references</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "BNFP")

(defun bnf-to-regex-atn (bnf-string &aux system)
  "translate a bnf phrase expression to a regex atn."
  (unless (setf system (intern-atn-system (bnf-to-atn bnf-string)))
    (error "bnf parse failed: ~s." bnf-string))
  (bind-net (first (system-nets system))))

(defGeneric match-regex (atn string)
  (:documentation
   "matches <code><i>STRING</i></code> against the regular expression encoded
    in <code><i>ATN</i></code>, as generated with
    <code><i>bnf-to-regex</i></code>.")
  (:method ((node atn) (string string))
           (match-regex@ (atn-start node) string 0)))

(defGeneric match-regex@ (node datum position)
  (:method ((node null) (datum array) (position t))
           nil)
  (:method ((node atn-node) (datum array) (position t))
           (some #'(lambda (edge) (match-regex@ edge datum position))
                 (atn-edges node)))
  (:method ((node pop-atn-edge) (datum array) position)
           (>= position (length datum)))
  (:method ((node fail-atn-edge) (datum t) (position t))
           nil)
  (:method ((edge or-atn-edge) (datum array) position &aux fail)
           (or (some #'(lambda (edge) (match-regex@ edge datum position))
                     (atn-edges edge))
               (when (setf fail (atn-fail edge))
                 (match-regex@ fail datum position))))
  (:method ((edge jump-atn-edge) (datum array) position)
           (match-regex@ (atn-end edge) datum position))
  (:method ((edge cat-atn-edge) (datum array) position &aux fail)
           (if (and (< position (length datum))
                    (funcall (atn-test edge) (aref datum position)))
             (match-regex@ (atn-end edge) datum (1+ position))
             (when (setf fail (atn-fail edge))
               (match-regex@ fail datum position))))
  (:method ((edge push-atn-edge) (datum array) position &aux fail)
           (if (and (< position (length datum))
                    (funcall (atn-test edge) (aref datum position)))
             (match-regex@ (atn-end edge) datum (1+ position))
             (when (setf fail (atn-fail edge))
               (match-regex@ fail datum position))))
  (:method ((edge test-atn-edge) (datum array) position &aux fail
            (test (atn-test edge)))
           (cond ((and (< position (length datum))
                       (etypecase test
                         ((or cl:symbol function) (funcall test (aref datum position)))
                         (character (eql test (aref datum position)))
                         (list
                          (ecase (first test)
                            (tokenset (find (aref datum position) (second test)))
                            (tokenset-not (not (find (aref datum position) (second test))))
                            (token-range (char<= (second test) (aref datum position) (third test)))
                            (token-range-not
                             (not (<= (second test) (aref datum position) (third test))))))))
                  (match-regex@ (atn-end edge) datum (1+ position)))
                 ((setf fail (atn-fail edge))
                  (match-regex@ fail datum position))
                 (t
                  nil)))
  (:method ((edge word-atn-edge) (datum array) position &aux fail
            (word (atn-word edge)))
           (if (and (< position (length datum))
                    (etypecase word
                      (character (eql word (aref datum position)))
                      (string (find (aref datum position) word))))
             (match-regex@ (atn-end edge) datum (1+ position))
             (when (setf fail (atn-fail edge))
               (match-regex@ fail datum position)))))


;;
;; form for standard regular expressions

(defun regular-expression-to-regex-atn (regex-string &aux system)
  "translate a regular expression to a regex atn."
  (unless (setf system (intern-atn-system (bnf-to-regex-atn regex-string)))
    (error "regex parse failed: ~s." regex-string))
  (bind-net (first (system-nets system))))

:EOF
