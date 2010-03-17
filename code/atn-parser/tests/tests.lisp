;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Package: bnf-parser; Base: 10 -*-

(in-package "BNF-PARSER")

;#-Genera(load "defSystem")
#+Genera(sct:load-system "BNFP" :query nil)

(bnf-to-atn "x ::= y y ::= z? ('b' | 'c')* z ::= 'd' 'e'")
(bnf-reader "x ::= '.' | #x20")
(callparser 'ebnf  (bnf-reader "x ::= '.'? | #x20"))
(bnf-reader "x ::= '/' | #x20")
(callparser 'ebnf  (bnf-reader "x ::=  ('/' asd) | qwe "))

(bnf-object-tree
 (caar (callparser 'ebnf (bnf-reader "x ::= y y ::= z? ('b' | 'c')* z ::= 'd' 'e'"))))

(defun file->string (pathname &aux (buffer (make-array 0 :element-type 'character
                                                       :adjustable t
                                                       :fill-pointer 0))
                              character)
  (with-open-file (stream pathname :direction :input)
    (loop (unless (setf character (read-char stream nil nil))
            (return buffer))
          (vector-push-extend character buffer))))

;; (defun window->string (window)
;;   (multiple-value-bind (start end) (ccl:selection-range window)
;;     (when (= start end)
;;       (setf start 0 end (ccl:buffer-size (ccl:fred-buffer window))))
;;     (ccl:buffer-substring (ccl:fred-buffer window) start end)))
;; (defun window-line->string (window &optional (trim " "))
;;   (let ((start (ccl:buffer-line-start (ccl:fred-buffer window)))
;;         (end (ccl:buffer-line-end (ccl:fred-buffer window))))
;;     (unless (= start end)
;;       (string-trim trim (ccl:buffer-substring (ccl:fred-buffer window) start end)))))

(print-first-result
(callparser 'ebnf 
(bnf-reader (file->string
                (make-pathname :name "XPath" :type "bnf"
                               :defaults (pathname (first (ccl:windows))))))))

(inspect *test-atn*)
(defParameter *test-atn*
  (bnf-to-atn (file->string
               (make-pathname :name "XPath" :type "bnf"
                              :defaults (pathname (first (ccl:windows)))))))

(defParameter *test-atn*
  (bnf-to-atn (window->string (second (ccl:windows)))))

(inspect
 (bnf-object-tree
  (caar
   (callparser 'ebnf 
               (bnf-reader (window->string (second (ccl:windows))))))))

(callparser 'BNF-PARSER::|subject|
            (bnf-reader (window->string (second (ccl:windows)))))



(defVar *bnf*)

(setq *bnf* "phrase ::= (term | (term and phrase) | (term or phrase) | ' ')*
             term ::= text+
             comma ::= ','
             or ::= '|' | '+'
             and ::= '&' | '*'
             text ::= [#x30-#x39] | [#x61-#x7a] | [#x41-#x5a]
             ")
(setq *bnf* (window->string (second (ccl:windows))))
(phrase-parser "s&a" :atn-trace t :atn-mode :single)
(setq *atn-save-definitions* t)
(compile-atn-system *bnf*)
(pprint (symbol-atn-node-source 'nntp::subject-parser 'subject-parser))
(pprint (symbol-atn-node-source 'nntp::subject-parser 'nntp::|term|))
(pprint (symbol-atn-node-source 'phrase-parser 'phrase-parser))
(phraseparser "s&s|s&s")
(inspect (symbol-atn-system 'subject-parser))
(pprint (first
 (subject-parser (window-line->string (second (ccl:windows)) " 0123456789")
                 :atn-trace nil :atn-mode :single)))

(pprint (make-lisp-form (top-inspect-form)))
(java-form (top-inspect-form))
(inspect (subject-reader (window-line->string (second (ccl:windows)) " 0123456789")))

(defun map-window (window function)
  (file-position window 0)
  (flet ((next-line ()
           (when (<= (1+ (ccl:buffer-line-end (ccl:fred-buffer window)))
                     (ccl:buffer-size (ccl:fred-buffer window)))
             (file-position window (1+ (ccl:buffer-line-end (ccl:fred-buffer window)))))))
      (loop (when (= (file-position window) (ccl:buffer-size (ccl:fred-buffer window)))
              (return))
            (funcall function window)
            (unless (next-line) (return)))))

(defun parse-window (window &key atn-trace)
  (let ((line nil)
        (results nil)
        (result nil))
    (map-window window
                #'(lambda (window)
                    (setf line (window-line->string window " 0123456789"))
                    (when (plusp (length line))
                      ;(format *trace-output* "~%~%~a ->" line)
                      (setf line (subject-reader line))
                      (setf result (first (subject-parser line :atn-trace atn-trace)))
                      ;(format *trace-output* "~%   ~a" (write-to-string result))
                      (push (or result line) results))))
    (nreverse results)))
(defun tokenize-window (window)
  (let ((line nil)
        (results nil)
        (result nil))
    (map-window window
                #'(lambda (window)
                    (setf line (window-line->string window " 0123456789"))
                    (when (plusp (length line))
                      (setf result (subject-reader line))
                      (push result results))))
    (nreverse results)))

(inspect (parse-window (second (ccl:windows))))
(subject-parser (top-inspect-form) :atn-trace nil :atn-mode :single)
(inspect (tokenize-window (second (ccl:windows))))
(defun get-term (term parsed-subject)
 (rest (second (rassoc term (rest parsed-subject)
                  :key #'(lambda (x) (when (consp x) (caar x)))))))

(inspect (let ((result nil))
           (dolist (r (top-inspect-form))
             (destructuring-bind (parse tokens &aux term) r
               (when (setf term (get-term '|imageName| parse))
                 (push (cons term tokens) result))))
           (nreverse result)))

;; note that a range with an occurrence works only where they range is factored
;; into its own lexical rule. the generation of the range as a phrase rule does not work.

(callparser 'ebnf 
            (bnf-reader "Names ::= Name (S+ Name)* Name ::= [0-9]+ S ::= ' '"))
(bnf-to-atn "Names ::= Name (S+ Name)* Name ::= [0-9]+ S ::= ' '") => error on range
(bnf-to-atn "Names ::= Name (S+ Name)* Name ::= D+ D ::= [0-9] S ::= ' '")
(bnf-to-atn "Names ::= Name (S+ Name)* Name ::= [0-9] S ::= ' '")

;;
;; tests from the readme file

(defparameter *phrase-bnf*
  "phrase ::= (term | (term and phrase) | (term or phrase) | ' ')*
   term ::= text+
   comma ::= ','
   or ::= '|' | '+'
   and ::= '&' | '*'
   text ::= ('.' [#x30-#x39]+) | [#x61-#x7a] | [#x41-#x5a]
   "
   "the bnf for subject text")

(defun phrase-reader (s) (concatenate 'vector  s))
(intern-atn-system (bnf-to-atn *phrase-bnf*))
(compile-atn-system *phrase-bnf* :execute t)
(|phrase|-parser "a&b" :reduce 'cons)
(inspect *)
;(trace tokenset tokenset1 tokenset2)


;; 20010620 regular expressions


(defParameter *number-bnf*
 "number::= (('.' [0-9]+) | ([0-9]+ ('.' [0-9]+)?)) ([eE] ('+' | '-')? [0-9]+)?")
(defParameter *number-atn* (bnf-to-regex *number-bnf*))

(trace match-regex@)
(untrace match-regex@)
(mapcar #'(lambda (test) (match-regex *number-atn* test))
        '(".0" ".9" ".00" ".09" ".90" ".99"
          "0" "00" "09" "9" "90" "99"
          "0.0" "00.0" "09.0" "9.0" "90.0" "99.0" "0.9" "00.9" "09.9" "9.9" "90.9" "99.9"
          "0e0" "00e0" "09e0" "9e9" "90e9" "99e9"
          "0.0e0" "0.0e-0" "0.0e+0" "0.0E0" "0.0E-0" "0.0E+0" "0.0e09" "0.0e-09" "0.0e+09" 
          "." ".e1" "0 0" "a" "1a" "0.0e--0" "0.0-e0" ""))
(match-regex *number-atn* "00")
(match-regex *number-atn* "")
  
