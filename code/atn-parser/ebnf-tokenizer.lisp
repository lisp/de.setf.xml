;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='19980331' AUTHOR='BB'>added ',' and '->' to grammar</DELTA>
  <DELTA DATE='20010605' AUTHOR='MS'>explicit quoted string reader</DELTA>
  <DELTA DATE='20010605' AUTHOR='JAA'>productions id for [[#]]</DELTA>
  <DELTA DATE='20010618'>fixed incorrect readers for square brackets</DELTA>
  <DELTA DATE='20010719' AUTHOR='JCMA'>readtable mods as function</DELTA>
  <DELTA DATE='20010931'>fixed premature termination bug in comment-reader</DELTA>
  <DELTA DATE='20030529'>corrected eof errors in [,] readers</DELTA>
  <DELTA DATE='20030601'>modified // comment reader to recognize both (CR LF) newline forms</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "BNF-PARSER")

(defparameter *bnf-readtable* (copy-readtable nil))
(defparameter *ansi-cl-readtable* (copy-readtable nil))
(defparameter *metasymbols*
  '(|\|| * ? + - |)| |(| |'| |::=| |#[| |^| |[| |[[| |]| |]]| |/*| |/**| |//| |*/| \; \, |->| |{| |}| |'(|
    )
  "nb. all metasymbols must appear here. any other text is coerced to a string.
   they must also be correctly categorized in ebnf-grammar.atn. anything else
   will aslo be treated as a symbol.")

(defun defsymbol-reader (stream char)
  (declare (ignore char))
  (set-macro-character  #\: #'(lambda (s c) (declare (ignore s c))) 
                        nil
                        *bnf-readtable*)
  (read-char stream)
  (read-char stream)
  (set-macro-character #\: #'defsymbol-reader nil *bnf-readtable*)
  '|::=| )

(defun \'reader (stream term-char)
  (coerce (loop for char = (read-char stream)
                until (eql char term-char)
                collect (if (eql char #\\) (read-char stream) char))
          'string))

(defun [reader (stream char)
  (declare (ignore char))
  (cond ((char= #\[ (peek-char nil stream nil nil))
         (read-char stream)
         '[[)
        (t '[)))

(defun ]reader (stream char)
  (declare (ignore char))
  (cond ((char= #\] (peek-char nil stream nil nil))
         (read-char stream)
         ']])
        (t '])))

(defun \#reader (stream char)
  (set-macro-character #\[ #'(lambda (s c) (declare (ignore s c)) #\[)
                       nil
                       *bnf-readtable*)
  (prog1
    (cond ((eql (peek-char nil stream nil nil) #\[)
           (read-char stream)
           '|#[|)
          ((eql (peek-char nil stream nil nil) #\')
           #\#)
          (t (read-number-string stream char)))
    (set-macro-character #\[ #'[reader nil *bnf-readtable*)))

(defun /reader (stream char)
  (cond ((char= (peek-char nil stream nil nil) #\/)
         (read-char stream)
         (let ((char nil))
           (loop (unless (setf char (read-char stream nil nil)) (return))
                 (when (member char '(#\return #\linefeed)) (return)))
           :comment))
        ((char= (peek-char nil stream nil nil) #\*)
         (read-comment-string stream)
         :comment)
        (t char)))

(defun read-comment-string (stream &aux (output (make-string-output-stream)))
  (write-char #\/ output)
  (write-char (read-char stream) output)
  (loop with dispatch-char 
        for char = (read-char stream nil nil)
        while char
        do (cond ((and dispatch-char (char= #\/ char))
                  (write-char char output)
                  (return-from read-comment-string (get-output-stream-string output)))
                 ((char= char #\*) (setf dispatch-char t))
                 (t (setf dispatch-char nil)))
        (write-char char output)))

(defun read-number-string (stream char &aux (output (make-string-output-stream)))
  (let ((*readtable* (copy-readtable nil)))
     (set-syntax-from-char #\- #\a *readtable*)
     (set-syntax-from-char #\# #\a *readtable*)
     (write-char char output)
     (do ((i 0 (1+ i))
          (nc (peek-char nil stream nil nil)
            (peek-char nil stream nil nil)))
         ((or (null nc) (member nc '(#\] #\- #\space)))
          (get-output-stream-string output))
        (write-char (read-char stream) output))))

(defun -reader (stream char)
  (declare (ignore char))
  (let ((next (peek-char nil stream nil nil)))
    (if (eql next #\>) 
      (progn (read-char stream) '|->|)
      '-)))

(defun initialize-bnf-readtable (readtable)
  (flet ((char-name-reader (name)
           #'(lambda (stream char)
               (declare (ignore stream char))
               name)))
    (if (fboundp 'readtable-case) (setf (readtable-case readtable) :preserve))
    (set-macro-character #\| (char-name-reader '\|) nil readtable)
    (set-macro-character #\* (char-name-reader '*) nil readtable)
    (set-macro-character #\? (char-name-reader '?) nil readtable)
    (set-macro-character #\+ (char-name-reader '+) nil readtable)
    (set-macro-character #\( (char-name-reader '\() nil readtable)
    (set-macro-character #\) (char-name-reader '\)) nil readtable)
    (set-macro-character #\- #'-reader nil readtable)
    (set-macro-character #\^ (char-name-reader '\^) nil readtable)
    (set-macro-character #\[ '[reader nil readtable)
    (set-macro-character #\] ']reader nil readtable)
    (set-macro-character #\{ (char-name-reader '\{) nil readtable)
    (set-macro-character #\} (char-name-reader '\}) nil readtable)
    (set-macro-character #\# #'\#reader nil readtable)
    (set-macro-character #\, (char-name-reader '\,) nil readtable)
    (set-macro-character #\:  #'defsymbol-reader nil readtable)
    (set-macro-character #\; (char-name-reader '\;) nil readtable)
    ;; (set-syntax-from-char #\/ #\" readtable)
    (set-macro-character #\/ #'/reader nil readtable)
    (set-syntax-from-char #\" #\a readtable)
    ;; 20010301.jaa reinstated
    (set-syntax-from-char #\# #\a readtable)  
    ;; 20010605.ms (set-syntax-from-char #\' #\" readtable)
    (set-macro-character #\' '\'reader nil readtable)
    ;; 20010122.jaa
    (set-macro-character #\. (char-name-reader '\.) nil readtable)
    ))

(initialize-bnf-readtable *bnf-readtable*)


(defun bnf-reader (bnf-str &aux (*readtable* *bnf-readtable*) 
                              #+:aclpc (allegro::*read-case* :leave))
  (loop with bnf-length = (length bnf-str)
        with open-range
        with tokens
        with start = 0
        if (< start bnf-length)
        do
        (multiple-value-bind (expr end)
                             (read-from-string bnf-str nil nil :start start)
          ;; (print expr)
          (cond ((null expr)
                 (return-from bnf-reader (nreverse tokens)))
                ((eq expr :comment)
                 (setf start end))
                (t 
                 (cond ((member expr *metasymbols*)
                        (cond ((eq expr '\[) (setf open-range t))
                              ((eq expr '\]) (setf open-range nil)))
                        (push expr tokens))
                       ((stringp expr) ;; terminale 
                        (cond ((and (> (length expr) 0) (char= (char expr 0) #\#) ;; leave non-hex as string
                                    (not (find-if #'(lambda (c) (not (digit-char-p c 16))) expr)))
                               (cond (open-range
                                      ;; Range ohne terminale delimiter
                                      (push expr tokens))
                                     (t (push '\' tokens)
                                        ;; the originl pushed a number ?
                                        ;; (push (hex-string-to-number expr) tokens)
                                        (push (make-string 1 :initial-element (code-char (hex-string-to-number expr))) tokens)
                                        (push '\' tokens))))
                              (t (push '\' tokens)
                                 (push expr tokens)
                                 (push '\' tokens))))
                       ((numberp expr)
                        (push (format nil "~A" expr) tokens))
                       (t (push (string expr) tokens)))
                 (setf start end))))
        else return (nreverse tokens)))

(defun hex-string-to-number (expr)
  (let ((*readtable* *ansi-cl-readtable*))
    (read-from-string expr)))

(defun alternative-chars (str)
  (format nil "~{'~A'~^ | ~}" (coerce str 'list)))

(defun sequence-chars (str)
  (format nil "~{'~A'~^ ~}" (coerce str 'list)))

(defmethod hexstring ((object character))
  (let ((*print-base* 16))
    (format nil "#x~A" (char-code object))))

#|
(hexstring #\a)
(alternative-chars "adfa")
(sequence-chars "adf")
(bnf-reader "[a b c]")
(defun hex-string-to-char (expr)
  (let ((*readtable* *ansi-cl-readtable*))
    (code-char (read-from-string expr))))

(defun read-number-string (stream char &aux (output (make-string-output-stream)))
  (write-char char output)
  (let ((*readtable* (copy-readtable nil)))
     (set-syntax-from-char #\- #\a *readtable*)
     (loop 
        for nc = (peek-char nil stream nil nil)
        for i from 0
        while (and nc (char/= nc #\] #\- #\# #\space))
        do  (write-char (read-char stream) output))
  (get-output-stream-string output)))



;; Beispiele

(bnf-reader "// doc Dies 
s ::= /* comment */ 'a'")

;; note the escaping form when evaluating tests strings ...

(bnf-reader "SingleQuote ::= '\\'' ")
(bnf-reader "DoubleQuote ::= '\"' ")

(bnf-to-atn
 (bnf-object-tree
  (caar (callparser 'ebnf
                    (bnf-reader "root ::= cell+ cell ::= [2,3 -> 'foo']")))))

(bnf-to-atn
 (bnf-object-tree
  (caar (callparser 'ebnf
                    (bnf-reader "s ::= #[print foo] [^#xd-#xh] | [^#x45#x45] | [#x45-#x65] #[print a]")))))

(write-source
 (bnf-to-atn
  "test ::= 'a' range '.' range ::= [a-z] | [^U-Z]")
 "TestParser")

;;; #[print a] 
;;; terminal-delimiter ::= '''

(bnf-object-tree
 (callparser 'ebnf
             (bnf-reader

  "ebnf ::= definition+
  definition ::= symbol defsymbol rhs

  rhs ::= qexpr+ | alternative
  qexpr ::= (symbol | group) occurrence?
  group ::= leftpar (qexpr+ | alternative) rightpar
  alternative ::= qexpr oneof (qexpr | alternative) 

  symbol ::= terminal | nonterminal
  nonterminal ::= token
  terminal ::= terminal-delimiter token terminal-delimiter
  
  leftpar ::= '('
  rightpar ::= ')'
  oneof ::= '|'
  defsymbol ::= '::='
  occurrence ::= '+' | '*' | '?'") ) )

|#