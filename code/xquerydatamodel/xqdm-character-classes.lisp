;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  <H3>character classification</H3>
  each entity / element / parse domain in an xml document constrains the characters
  which may appear to be of a specific 'class'. these classes are implemented here as
  predicates which check character codes against a value range tree.
  <p>
  the present xmlp version performs internal processing on characters.
  the codes are implemented and tested in the binary character code domain.
  this means that arguments are mapped back to integers as necessary prior to
  testing.</p>
  <p>
  the predicates are generated from tables taken from PR-xml-971208
  there are two options: then can be precompiled or they can be interpreted.
  the former takes about half as long to execute.</p>
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='19981017' AUTHOR='jaa'>
   removed spurious #\return valued characters from the tables - must have come
   from the cut-and-paste from the html texts. they were read as whitespace in
   mcl, but allegro saw them as symbols</DELTA>
  <DELTA DATE='19981027'>
   added class predicate for characters which require entity-encoding</DELTA>
  <DELTA DATE='20010311' AUTHOR='JAA'>
   changed the name character predicates to reflect the QName/NCName criteria and
   eliminated the predicate for initial name characters, as the respective parser
   defines a predicate for the appropriate character sequences.</DELTA>
  <DELTA DATE='20010319' AUTHOR='JAA'>
   NEL support</DELTA>
  <DELTA DATE='20010507'>moved export to unified package file</DELTA>
  <DELTA DATE='20010605' AUTHOR='MS'>lispworks conformance</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
 |#

(in-package "XML-QUERY-DATA-MODEL")

;;
;; the environment constraints cause the tables to be defined when compiling or executing only.
;; they are not defined when loading from binary as the functions have encoded them literally.
;; the compilation step takes about 56K for the tables, while the functions take onlz about 30K when
;; loaded on their own.

(eval-when (:compile-toplevel :execute)  ;; not for loading
  (defun make-character-code-vector (sequence &aux result)
    (map nil #'(lambda (entry)
                 (etypecase entry
                   (fixnum (push entry result))
                   (character (push (char-code entry) result))
                   (cons (let ((min (etypecase (first entry)
                                      (character (char-code (first entry)))
                                      (fixnum (first entry))))
                               (max (etypecase (rest entry)
                                      (character (char-code (rest entry)))
                                      (fixnum (rest entry)))))
                           (dotimes (i (1+ (- max min))) (push (+ i min) result))))
                   (sequence (map nil #'(lambda (c)
                                          (etypecase c
                                            (fixnum (push c result))
                                            (character (push (char-code c) result))))
                                  entry))))
         sequence)
    (concatenate 'vector (sort result #'<)))
  
  (defParameter *xml-char-table*
    '(#x09
      #x0A
      #x0D
      (#x0020 . #xD7FF)
      (#xE000 . #xFFFD)
      (#x10000 . #x10FFFF))
    "the table of all legal xml character codes.
   it includes, for reference, characters which outside of the cl character code domain.")
  
  (defParameter *xml-space-table*
    (if xutils::|NOTE-newline-200101314|
      #(#x09 #x0A #x0D #x20 #x85)
      #(#x09 #x0A #x0D #x20)))
  
  (defParameter *xml-initial-eolchar-table*
    (if xutils::|NOTE-newline-200101314|
      #(#x0A #x0D #x85)
      #(#x0A #x0D)))
  
  (defParameter *xml-successor-eolchar-table*
    (if xutils::|NOTE-newline-200101314|
      #(#x0A #x85)
      #(#x0A)))
  
  ;; 20010311 removed #\: for namespace conformance.
  (defParameter *xml-namechar-table*
    `(xml-letter? xml-digit? ,(make-character-code-vector #(#\. #\- #\_ #|#\:|#))
                  xml-combiningchar? xml-extender?))
  
  (defParameter *xml-initial-namechar-table*
    '(xml-letter? #\_  #|#\:|#) )
  
  (defParameter *xml-letter-table*
    '(xml-basechar? xml-ideographic?))
  
  (defParameter *xml-model-operator-table*
    (make-character-code-vector #(#\* #\, #\| #\& #\? #\+)))
  
  (defParameter *xml-markupchar-table*
    (make-character-code-vector #(#\< #\& #\% #\" #\')))
  
  ;;;   [13]     PubidChar ::= #x20 | #xD | #xA | [a-zA-Z0-9] | [-'()+,./:=?]
  (defParameter *xml-pubidchar-table*
    (make-character-code-vector
     '(#x0020 #x000D #x000A (#\a . #\z) (#\A . #\Z) (#\0 . #\9) "-'()+,./:=?;!*#@$_%")))
  
  (defParameter *xml-latinalphachar-table*
    (make-character-code-vector `((#.(char-code #\a) . #.(char-code #\z))
                                  (#.(char-code #\A) . #.(char-code #\Z)))))
  
  (defParameter *xml-latinchar-table*
    (make-character-code-vector '((#.(char-code #\a) . #.(char-code #\z))
                                  (#.(char-code #\A) . #.(char-code #\Z))
                                  (#.(char-code #\0) . #.(char-code #\9))
                                  #.(map 'vector #'char-code "-._"))))
  
  (defParameter *xml-languageidchar-table*
    (make-character-code-vector '((#.(char-code #\a) . #.(char-code #\z))
                                  (#.(char-code #\A) . #.(char-code #\Z))
                                  (#.(char-code #\0) . #.(char-code #\9))
                                  #\-)))
  
  (defParameter *xml-versionnumchar-table*
    (make-character-code-vector '((#.(char-code #\a) . #.(char-code #\z))
                                  (#.(char-code #\A) . #.(char-code #\Z))
                                  (#.(char-code #\0) . #.(char-code #\9))
                                  #.(map 'vector #'char-code "-._:"))))
  
  (defParameter *xml-basechar-table*
    '((#x0041 . #x005A)
      (#x0061 . #x007A)
      (#x00C0 . #x00D6)
      (#x00D8 . #x00F6)
      (#x00F8 . #x00FF)
      (#x0100 . #x0131) 
      (#x0134 . #x013E)
      (#x0141 . #x0148)
      (#x014A . #x017E)
      (#x0180 . #x01C3)
      (#x01CD . #x01F0)
      (#x01F4 . #x01F5)
      (#x01FA . #x0217)
      (#x0250 . #x02A8)
      (#x02BB . #x02C1)
      #x0386
      (#x0388 . #x038A)
      #x038C
      (#x038E . #x03A1)
      (#x03A3 . #x03CE)
      (#x03D0 . #x03D6)
      #x03DA
      #x03DC
      #x03DE
      #x03E0
      (#x03E2 . #x03F3)
      (#x0401 . #x040C)
      (#x040E . #x044F)
      (#x0451 . #x045C)
      (#x045E . #x0481)
      (#x0490 . #x04C4)
      (#x04C7 . #x04C8)
      (#x04CB . #x04CC)
      (#x04D0 . #x04EB)
      (#x04EE . #x04F5)
      (#x04F8 . #x04F9)
      (#x0531 . #x0556)
      #x0559
      (#x0561 . #x0586)
      (#x05D0 . #x05EA)
      (#x05F0 . #x05F2)
      (#x0621 . #x063A)
      (#x0641 . #x064A)
      (#x0671 . #x06B7)
      (#x06BA . #x06BE)
      (#x06C0 . #x06CE)
      (#x06D0 . #x06D3)
      #x06D5
      (#x06E5 . #x06E6)
      (#x0905 . #x0939)
      #x093D
      (#x0958 . #x0961)
      (#x0985 . #x098C)
      (#x098F . #x0990)
      (#x0993 . #x09A8)
      (#x09AA . #x09B0)
      #x09B2
      (#x09B6 . #x09B9)
      (#x09DC . #x09DD)
      (#x09DF . #x09E1)
      (#x09F0 . #x09F1)
      (#x0A05 . #x0A0A)
      (#x0A0F . #x0A10)
      (#x0A13 . #x0A28)
      (#x0A2A . #x0A30)
      (#x0A32 . #x0A33)
      (#x0A35 . #x0A36)
      (#x0A38 . #x0A39)
      (#x0A59 . #x0A5C)
      #x0A5E
      (#x0A72 . #x0A74)
      (#x0A85 . #x0A8B)
      #x0A8D
      (#x0A8F . #x0A91)
      (#x0A93 . #x0AA8)
      (#x0AAA . #x0AB0)
      (#x0AB2 . #x0AB3)
      (#x0AB5 . #x0AB9)
      #x0ABD
      #x0AE0
      (#x0B05 . #x0B0C)
      (#x0B0F . #x0B10)
      (#x0B13 . #x0B28)
      (#x0B2A . #x0B30)
      (#x0B32 . #x0B33)
      (#x0B36 . #x0B39)
      #x0B3D
      (#x0B5C . #x0B5D)
      (#x0B5F . #x0B61)
      (#x0B85 . #x0B8A)
      (#x0B8E . #x0B90)
      (#x0B92 . #x0B95)
      (#x0B99 . #x0B9A)
      #x0B9C
      (#x0B9E . #x0B9F)
      (#x0BA3 . #x0BA4)
      (#x0BA8 . #x0BAA)
      (#x0BAE . #x0BB5)
      (#x0BB7 . #x0BB9)
      (#x0C05 . #x0C0C)
      (#x0C0E . #x0C10)
      (#x0C12 . #x0C28)
      (#x0C2A . #x0C33)
      (#x0C35 . #x0C39)
      (#x0C60 . #x0C61)
      (#x0C85 . #x0C8C)
      (#x0C8E . #x0C90)
      (#x0C92 . #x0CA8)
      (#x0CAA . #x0CB3)
      (#x0CB5 . #x0CB9)
      #x0CDE
      (#x0CE0 . #x0CE1)
      (#x0D05 . #x0D0C)
      (#x0D0E . #x0D10)
      (#x0D12 . #x0D28)
      (#x0D2A . #x0D39)
      (#x0D60 . #x0D61)
      (#x0E01 . #x0E2E)
      #x0E30
      (#x0E32 . #x0E33)
      (#x0E40 . #x0E45)
      (#x0E81 . #x0E82)
      #x0E84
      (#x0E87 . #x0E88)
      #x0E8A
      #x0E8D
      (#x0E94 . #x0E97)
      (#x0E99 . #x0E9F)
      (#x0EA1 . #x0EA3)
      #x0EA5
      #x0EA7
      (#x0EAA . #x0EAB)
      (#x0EAD . #x0EAE)
      #x0EB0
      (#x0EB2 . #x0EB3)
      #x0EBD
      (#x0EC0 . #x0EC4)
      (#x0F40 . #x0F47)
      (#x0F49 . #x0F69)
      (#x10A0 . #x10C5)
      (#x10D0 . #x10F6)
      #x1100
      (#x1102 . #x1103)
      (#x1105 . #x1107)
      #x1109
      (#x110B . #x110C)
      (#x110E . #x1112)
      #x113C
      #x113E
      #x1140
      #x114C
      #x114E
      #x1150
      (#x1154 . #x1155)
      #x1159
      (#x115F . #x1161)
      #x1163
      #x1165
      #x1167
      #x1169
      (#x116D . #x116E)
      (#x1172 . #x1173)
      #x1175
      #x119E
      #x11A8
      #x11AB
      (#x11AE . #x11AF)
      (#x11B7 . #x11B8)
      #x11BA
      (#x11BC . #x11C2)
      #x11EB
      #x11F0
      #x11F9
      (#x1E00 . #x1E9B)
      (#x1EA0 . #x1EF9)
      (#x1F00 . #x1F15)
      (#x1F18 . #x1F1D)
      (#x1F20 . #x1F45)
      (#x1F48 . #x1F4D)
      (#x1F50 . #x1F57)
      #x1F59
      #x1F5B
      #x1F5D
      (#x1F5F . #x1F7D)
      (#x1F80 . #x1FB4)
      (#x1FB6 . #x1FBC)
      #x1FBE
      (#x1FC2 . #x1FC4)
      (#x1FC6 . #x1FCC)
      (#x1FD0 . #x1FD3)
      (#x1FD6 . #x1FDB)
      (#x1FE0 . #x1FEC)
      (#x1FF2 . #x1FF4)
      (#x1FF6 . #x1FFC)
      #x2126
      (#x212A . #x212B)
      #x212E
      (#x2180 . #x2182)
      (#x3041 . #x3094)
      (#x30A1 . #x30FA)
      (#x3105 . #x312C)
      (#xAC00 . #xD7A3)))
  
  
  (defParameter *xml-ideographic-table*
    '((#x4E00 . #x9FA5)
      #x3007
      (#x3021 . #x3029)))
  
  (defParameter *xml-combiningchar-table*
    '((#x0300 . #x0345)
      (#x0360 . #x0361)
      (#x0483 . #x0486)
      (#x0591 . #x05A1)
      (#x05A3 . #x05B9)
      (#x05BB . #x05BD)
      #x05BF
      (#x05C1 . #x05C2)
      #x05C4
      (#x064B . #x0652)
      #x0670
      (#x06D6 . #x06DC)
      (#x06DD . #x06DF)
      (#x06E0 . #x06E4)
      (#x06E7 . #x06E8)
      (#x06EA . #x06ED)
      (#x0901 . #x0903)
      #x093C
      (#x093E . #x094C)
      #x094D
      (#x0951 . #x0954)
      (#x0962 . #x0963)
      (#x0981 . #x0983)
      #x09BC
      #x09BE
      #x09BF
      (#x09C0 . #x09C4)
      (#x09C7 . #x09C8)
      (#x09CB . #x09CD)
      #x09D7
      (#x09E2 . #x09E3)
      #x0A02
      #x0A3C
      #x0A3E
      #x0A3F
      (#x0A40 . #x0A42)
      (#x0A47 . #x0A48)
      (#x0A4B . #x0A4D)
      (#x0A70 . #x0A71)
      (#x0A81 . #x0A83)
      #x0ABC
      (#x0ABE . #x0AC5)
      (#x0AC7 . #x0AC9)
      (#x0ACB . #x0ACD)
      (#x0B01 . #x0B03)
      #x0B3C
      (#x0B3E . #x0B43)
      (#x0B47 . #x0B48)
      (#x0B4B . #x0B4D)
      (#x0B56 . #x0B57)
      (#x0B82 . #x0B83)
      (#x0BBE . #x0BC2)
      (#x0BC6 . #x0BC8)
      (#x0BCA . #x0BCD)
      #x0BD7
      (#x0C01 . #x0C03)
      (#x0C3E . #x0C44)
      (#x0C46 . #x0C48)
      (#x0C4A . #x0C4D)
      (#x0C55 . #x0C56)
      (#x0C82 . #x0C83)
      (#x0CBE . #x0CC4)
      (#x0CC6 . #x0CC8)
      (#x0CCA . #x0CCD)
      (#x0CD5 . #x0CD6)
      (#x0D02 . #x0D03)
      (#x0D3E . #x0D43)
      (#x0D46 . #x0D48)
      (#x0D4A . #x0D4D)
      #x0D57
      #x0E31
      (#x0E34 . #x0E3A)
      (#x0E47 . #x0E4E)
      #x0EB1
      (#x0EB4 . #x0EB9)
      (#x0EBB . #x0EBC)
      (#x0EC8 . #x0ECD)
      (#x0F18 . #x0F19)
      #x0F35
      #x0F37
      #x0F39
      #x0F3E
      #x0F3F
      (#x0F71 . #x0F84)
      (#x0F86 . #x0F8B)
      (#x0F90 . #x0F95)
      #x0F97
      (#x0F99 . #x0FAD)
      (#x0FB1 . #x0FB7)
      #x0FB9
      (#x20D0 . #x20DC)
      #x20E1
      (#x302A . #x302F)
      #x3099
      #x309A))
  
  (defParameter *xml-digit-table*
    '((#x0030 . #x0039)
      (#x0660 . #x0669)
      (#x06F0 . #x06F9)
      (#x0966 . #x096F)
      (#x09E6 . #x09EF)
      (#x0A66 . #x0A6F)
      (#x0AE6 . #x0AEF)
      (#x0B66 . #x0B6F)
      (#x0BE7 . #x0BEF)
      (#x0C66 . #x0C6F)
      (#x0CE6 . #x0CEF)
      (#x0D66 . #x0D6F)
      (#x0E50 . #x0E59)
      (#x0ED0 . #x0ED9)
      (#x0F20 . #x0F29)))
  
  (defParameter *xml-extender-table*
    '(#x00B7
      #x02D0
      #x02D1
      #x0387
      #x0640
      #x0E46
      #x0EC6
      #x3005
      (#x3031 . #x3035)
      (#x309D . #x309E)
      (#x30FC . #x30FE)))
  
  ;;; in an attribute: encode single quote, <, and & as character entities.
  ;;; < and & are required; the single quote is encoded since that is used as the delimiter when
  ;;; serializing
  
  (defParameter *xml-attvalue-entitychar-table*
    (make-character-code-vector  "'<&"))
  
  ;;; in character data: encode element tag delimiters and entity markers
  (defParameter *xml-chardata-entitychar-table*
    (make-character-code-vector "<>&%]"))
  
  ;;; in cdata: encode the terminator markers
  (defParameter *xml-cdata-entitychar-table*
    (make-character-code-vector ">]")))

;;;
;;; the predicate is generated from the table via a macro.
;;; depending on whether the table is specified as a symbol or
;;; a literal table either an interpreted form or an expanded literal for is generated.
;;; nb. for the expanded form, the compiled predicates must be generated in an order
;;; which permits dereferencing predicate cross references...

(defMacro def-character-class-predicate
          (name table)
  "if provided with a literal table, the predicate is compiled.
   if the table is a symbol, then the predicate is interpreted."
  (labels ((ensure-code (datum)
             (etypecase datum
               (integer datum)
               (character (char-code datum))))
           #|(char-code-vector (string)
           (let ((vector (make-array (length string)
                                     :element-type '(UNSIGNED-BYTE 16))))
             (dotimes (i (length string))
               (setf (aref vector i) (char-code (aref string i))))
             vector))|#
           (unwrap-or (forms)
             `(cond ,@(mapcar #'(lambda (form) `(,form t)) forms)))
           (bit-vector-test (constraint)
             ;; the break-even point for coding as a test against the bit vector is between 3 and 4 elements
             (if (<= (length constraint) 3)
               `(or ,@(map 'list #'(lambda (test) `(= code ,(ensure-code test))) constraint))
               (let* ((min (ensure-code (svref constraint 0)))
                      (max (ensure-code (svref constraint (1- (length constraint)))))
                      (length (* 8 (1+ (floor (/ (- max min) 8)))))
                      (bit-vector (make-array length :element-type 'bit :initial-element 0)))
                 (map nil #'(lambda (code) (setf (sbit bit-vector (- code min)) 1))
                      constraint)
                 `(and (<= ,min code) (<= code ,max) (> (sbit ,bit-vector (- code ,min)) 0))))))
    `(defun ,name (datum &aux (code 0))
       (declare (optimize (speed 3) (safety 0))
                (type fixnum code))
       (etypecase datum
         (fixnum (setf code datum))
         (character (setf code (char-code datum))))
       ;; if a symbol is provided interpret it at runtime, otherwise unwrap the tests
       ;; for the literal value
       ,(typecase table
          (symbol
           (warn "character predicate defered to runtime: ~s." table) (break)
          `(dolist (constraint ,table)
             (when (etypecase constraint
                     (symbol (funcall (symbol-function constraint) code))
                     (fixnum (= constraint code))
                     (sequence (when (find code constraint) t))
                     (cons (and (<= (the fixnum (first constraint)) code)
                                (<= code (the fixnum (rest constraint))))))
               (return t))))
          (list
           #|`(or ,@(mapcar #'(lambda (constraint)
                              (etypecase constraint
                                (symbol `(,constraint code))
                                (integer `(= ,constraint code))
                                (character `(= ,(char-code constraint) code))
                                ;; in isolation the first is faster, but not in a compiled function
                                ;(string `(find (code-char code) ,constraint))
                                (vector #|`(when (find code ,constraint) t)|#
                                        (bit-vector-test constraint))
                                (cons `(and (<= ,(ensure-code (first constraint)) code)
                                            (<= code ,(ensure-code (rest constraint)))))))
                          table))|#
           (unwrap-or (mapcar #'(lambda (constraint)
                              (etypecase constraint
                                (symbol `(,constraint code))
                                (integer `(= ,constraint code))
                                (character `(= ,(char-code constraint) code))
                                ;; in isolation the first is faster, but not in a compiled function
                                ;(string `(find (code-char code) ,constraint))
                                (vector #|`(when (find code ,constraint) t)|#
                                        (bit-vector-test constraint))
                                (cons `(and (<= ,(ensure-code (first constraint)) code)
                                            (<= code ,(ensure-code (rest constraint)))))))
                          table))
           )
          (vector
           (bit-vector-test table))))))

(defun check-character-class
       (datum table &aux constraint)
  (etypecase datum
    (integer )
    (character (setf datum (char-code datum))))
  (if (listp table)
    (dotimes (i (length table))
      (setf constraint (svref table i))
      (when (typecase constraint
              (integer (= datum constraint))
              (cons (<= (first constraint) datum (rest constraint)))
              (sequence (find  datum constraint)))
        (return t)))
    (find datum table)))


;;;
;;; the base predicates as required by the standard.
;;; once again, note the order.

(def-character-class-predicate xml-char? #.*xml-char-table*)
(def-character-class-predicate xml-markupchar? #.*xml-markupchar-table*)
(def-character-class-predicate xml-space? #.*xml-space-table*)
(def-character-class-predicate xml-initial-eolchar? #.*xml-initial-eolchar-table*)
(def-character-class-predicate xml-successor-eolchar? #.*xml-successor-eolchar-table*)
(def-character-class-predicate xml-ideographic? #.*xml-ideographic-table*)
(def-character-class-predicate xml-basechar? #.*xml-basechar-table*)
(def-character-class-predicate xml-letter? #.*xml-letter-table*)
(def-character-class-predicate xml-digit? #.*xml-digit-table*)
(def-character-class-predicate xml-combiningchar? #.*xml-combiningchar-table*)
(def-character-class-predicate xml-extender? #.*xml-extender-table*)
(def-character-class-predicate xml-namechar? #.*xml-namechar-table*)
(def-character-class-predicate xml-initial-namechar? #.*xml-initial-namechar-table*)
(def-character-class-predicate xml-pubidchar? #.*xml-pubidchar-table*)
(def-character-class-predicate xml-latinalphachar? #.*xml-latinalphachar-table*)
(def-character-class-predicate xml-latinchar? #.*xml-latinchar-table*)
(def-character-class-predicate xml-languageidchar? #.*xml-languageidchar-table*)
(def-character-class-predicate xml-versionnumchar? #.*xml-versionnumchar-table*)
(def-character-class-predicate xml-model-op-char? #.*xml-model-operator-table*)
;; there is no encoding character table: the sequence criteria is initial letter followed by latin...

#|
not used in this version
(defun xml-attribute-char? (c)
  (declare (special *current-quote-delimiter*))
  (unless (or (char= c #\<) (char= c #\&) (char-equal c *current-quote-delimiter*))
    (xml-char? c)))
(defun xml-entity-char? (c)
  (declare (special *current-quote-delimiter*))
  (unless (or (char= c #\%) (char= c #\&) (char-equal c *current-quote-delimiter*))
    (xml-char? c)))
(defun xml-skiplit-char? (c)
  (declare (special *current-quote-delimiter*))
  (unless (char-equal c *current-quote-delimiter*)
    (xml-char? c)))
(defun xml-quoted-pubidchar? (c)
  (declare (special *current-quote-delimiter*))
  (unless (char-equal c *current-quote-delimiter*)
    (xml-pubidchar? c)))
(let ((initial t))
  (defun xml-namechar-w-initial-exception? (c)
    (if initial
      (when (xml-initial-namechar? c)
        (not (setf initial nil)))
      (or (xml-namechar? c)
          (not (setf initial t))))))
;(map 'list #'xml-namechar-w-initial-exception? "9asdf _9asd*")

(let ((initial t))
  (defun xml-latinchar-w-initial-alpha? (c)
     (if initial
       (when (alpha-char-p c)
         (not (setf initial nil)))
       (or (xml-latinchar? c)
           (not (setf initial t))))))
;(map 'list #'xml-latinchar-w-initial-alpha? "9asdf a9sd_.\"")

(let ((radix nil))
  (defun xml-charnamechar? (c)
     (if radix
       (if (digit-char-p c radix)
         t
         (setf radix nil))
       (cond ((char-equal c #\x)
              (setf radix 16)
              t)
             ((digit-char-p c)
              (setf radix 10)
              t)
             (t
              nil)))))
;(map 'list #'xml-charnamechar? "9012 xad9 x10ad ")
|#

;;;
;;; compound predicates to provide named functions
(defun xml-digit-or-letter? (x) (or (xml-digit? x) (xml-letter? x)))

;;;
;;; serialization predicates
(def-character-class-predicate xml-attvalue-entitychar? #.*xml-attvalue-entitychar-table*)
(def-character-class-predicate xml-chardata-entitychar? #.*xml-chardata-entitychar-table*)
(def-character-class-predicate xml-cdata-entitychar? #.*xml-cdata-entitychar-table*)

(defun expunge-character-tables
       ()
  (dolist (table '(*XML-CHAR-TABLE*
                   *XML-SPACE-TABLE*
                   *XML-INITIAL-EOLCHAR-TABLE*
                   *XML-SUCCESSOR-EOLCHAR-TABLE*
                   *XML-NAMECHAR-TABLE*
                   *XML-INITIAL-NAMECHAR-TABLE*
                   *XML-LETTER-TABLE*
                   *XML-MODEL-OPERATOR-TABLE*
                   *XML-MARKUPCHAR-TABLE*
                   *XML-PUBIDCHAR-TABLE*
                   *XML-LATINALPHACHAR-TABLE*
                   *XML-LATINCHAR-TABLE*
                   *XML-LANGUAGEIDCHAR-TABLE*
                   *XML-VERSIONNUMCHAR-TABLE*
                   *XML-BASECHAR-TABLE*
                   *XML-IDEOGRAPHIC-TABLE*
                   *XML-COMBININGCHAR-TABLE*
                   *XML-DIGIT-TABLE*
                   *XML-EXTENDER-TABLE*
                   *XML-ATTVALUE-ENTITYCHAR-TABLE*
                   *XML-CHARDATA-ENTITYCHAR-TABLE*
                   *XML-CDATA-ENTITYCHAR-TABLE*))
    (setf (symbol-value table) nil)))
(defun expunge-character-functions
       ()
  (dolist (function '(XML-CHAR?
                      XML-MARKUPCHAR?
                      XML-SPACE?
                      XML-INITIAL-EOLCHAR?
                      XML-SUCCESSOR-EOLCHAR?
                      XML-IDEOGRAPHIC?
                      XML-BASECHAR?
                      XML-LETTER?
                      XML-DIGIT?
                      XML-COMBININGCHAR?
                      XML-EXTENDER?
                      XML-NAMECHAR?
                      XML-INITIAL-NAMECHAR?
                      XML-PUBIDCHAR?
                      XML-LATINALPHACHAR?
                      XML-LATINCHAR?
                      XML-LANGUAGEIDCHAR?
                      XML-VERSIONNUMCHAR?
                      XML-MODEL-OP-CHAR?
                      XML-DIGIT-OR-LETTER?
                      XML-ATTVALUE-ENTITYCHAR?
                      XML-CHARDATA-ENTITYCHAR?
                      XML-CDATA-ENTITYCHAR?))
    (fmakunbound function)))


#|

the tables themselves take about 7K. the compilation function takes 4K.
the generated predicates take about 24K
(expunge-character-tables)
(expunge-character-functions)
the alternative version, with storage as a vector, was about 10% slower

(defun check-character-class
       (datum table &aux constraint)
  (etypecase datum
    (integer )
    (character (setf datum (char-code datum))))
  (dotimes (i (length table))
    (setf constraint (svref table i))
    (when (if (integerp constraint)
            (= datum constraint)
            (<= (svref constraint 0) datum (svref constraint 1)))
      (return t))))

(time (dotimes (x 1000) (xml-letter? #\Z)))
(time (dotimes (x 1000000) (xml-char? 0)))
(time (dotimes (x 1000) (xml-letter? #.(code-char #x30FE))))

(time (dotimes (x 1000) (xml-digit? #\9)))
(time (dotimes (x 1000) (xml-space? #\return)))
(time (dotimes (x 1000) (xml-namechar? #\a)))
(time (dotimes (x 1000) (xml-digit? (code-char #x06f9))))
(remove-if-not #'xml-pubidchar? "  [13]     PubidChar ::= #x20 | #xD | #xA | [a-zA-Z0-9] | [-'()+,./:=?]")
(time (dotimes (x 1000) (xml-pubidchar? #\.)))


 |#

:EOF

