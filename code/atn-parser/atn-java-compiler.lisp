;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: bnf-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  this is a translator from an atn-system instance to the java source for the equivalent
  parser. it is not used for a strictly lisp system.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://bnfp/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='19990331' AUTHOR='BB' />
  </CHRONOLOGY>
 </DOCUMENTATION>
|#


#|
Generiert JAVA-Source-Code fuer einen Parser auf der Basis einer erweiterten 
BNF-Grammatik. (vgl. ebnf-grammar.atn) 
Hauptfunktion: (make-parser (bnf :: (string | pathname)) &rest initargs &key)

Die aktuelle Implementierung begrenzt die maximale Anzahl direkter lexikalischer
Kategorien, i.e. Kategorien die unmittelbar ueber eine Alternative (elementarer) 
Lexeme (Zeichen) definiert sind, auf 62. 
Diese Restriktion gilt weder fuer indirekte lexikalische Kategorien (i.e. ueber 
eine logische Verknuefpung anderer lexikalischer Kategorien bzw. Zeichen/Byte-Bereiche definierte Kategorien) noch fuer Strukturkategorien (phrase rules). 
Die Anzahl der nicht-terminalen Symbole ist also (abgesehen von der genannten Einschraenkung) i.a. unbegrenzt. 

Optionen der Parser-Generierung (Keys):

Symbole, die nicht ins DOM aufgenommen werden sollen (nil | (<string>*)
(redundant-dom-symbols nil)

Symbole, die im DOM als preterminale Symbole fungieren sollen (nil | (<string>*)
(preterminal-dom-symbols nil)

Wird dieses Keywort nicht angegeben, so betrachtet das Programm alle Symbole, die
ueber eine Alternative lexikalischer Kategorien definiert sind, als preterminale
Symbole, wird nil angegeben, dann keins. Um der so definierten Menge weitere Elemente
hinzuzufuegen, muss das folgende Keywort benutzt werden:
(adjoin-preterminal-dom-symbols nil)

Elementtyp der Datenquelle (string | character | byte): 
(element-type 'character)

Benutzung von well-formed substring tables (t | nil): 
(use-wfst nil)

Sollen word-Kanten in den Strukturbaum aufgenommen werden (t | nil): 
(register-words nil)

Sollen bedingte Trace-Anweisungen in den Code eingebaut werden (t | nil):
(encode-tracer nil)

Soll der Source-Code in eine Datei geschrieben werden (t | nil):
(write t)

In welches Directory soll der Java-Code geschrieben werden (<dirString>):
(parser-directory *default-java-parser-directory*)

Falls bnf ein unvollstaendiger Pathname ist: Mit welchen Default-Pfadangaben soll
die Pfadangabe (directory, type) ergaenzt werden (<default-pathname>):
(default-grammar-pathname-default *default-grammar-pathname-default*)

Sollen kontextsensitive Symboldefinitionen unterstuetzt werden, so dass der kontextspezifische Namensteil im Syntaxbaum nicht auftaucht. In diesem Fall muss
ein Zeichen angegeben werden, das den kontextspezifischen Postfix-Namensteil
einleitet. (Das Zeichen muss ein zulaessiges Zeichen fuer CL, Java und das 
Dateisystem sein; es darf in der BNF-Grammatik nicht als Symbolzeichen verwandt
werden. In Java-Identifiers sind neben den alphabetischen Buchstaben und Ziffern einzig
die Sonderzeichen $ und _ zugelassen; das erste Zeichen darf keine Ziffer sein.):
(ignorable-context-postfix #\$) 

Beginnt das Symbol mit diesem Postfix, so wird der entsprechende Knoten bei der 
DOM-Generierung als Dummy-Knoten interpretiert. D.h.: Die Kinder dieses Elements
werden seinem Eltern-Knoten als direkte Nachfahren (also nicht, wie im Syntaxbaum, als Enkel) hinzugefuegt. Diese Form der Namensgebung kann daher dazu benutzt werden, 
einen Parser in mehrere Teile aufzuspalten, ohne auf Backtracking zu verzichten.
Eine solche Aufteilung kann bei Definitionen mit einer sehr langen Folge von 
Ersetztungssymbolen (RHS) geboten sein, um einen stack overflow der Java Virtual 
Machine zu verhindern.

Werden Subparser eingesetzt, so kann es notwendig sein, kontextuelle Namenszusaetze
zu bewahren, da fuer die so bezeichneten Elemente spezielle (kontextspezifische)
Parser aufgerufen werden muessen. Derartige Symbole sind unter der folgenden 
Keywort-Liste zu deklarieren:
(preservable-context-names nil)

Allgemeine Substitutitionen von Element-Symbolen und Registernamen koennen in Form
einer Assoziationsliste ((<old1> <new1>) ... (<old-n> <new-n>)) spezifiziert werden:
(mappings nil)
Mappings-Angaben ueberschreiben andere Substitutionen.


Aufrufbeispiele: 

(make-parser #p"KVK")
(make-parser #p"KVK" :redundant-dom-symbols '("PruefSumme" "Length"))
(make-parser #p"KVK" :encode-tracer t :redundant-dom-symbols '("PruefSumme" "Length"))
(make-parser #p"atn-parser:KVK.bnf" 
             :encode-tracer t
             :use-wfst t
             :redundant-dom-symbols '("PruefSumme" "Length")
             :element-type 'character)

Der Klassenname des Java-Parsers (<parserClassname>) setzt sich aus dem ersten 
Symbol der BNF-Grammatik und dem Zusatz "Parser" zusammen. Mit Ausnahme des 
ersten Buchstabens, er wird beim Klassennamen immer grossgeschrieben, wird die
Gross- und Kleinschreibung der Grammatik uebernommen. 
(Abweichend zur CL-Funktion string-capitalize!) Es ist daher unzulaessig,
verschiedene Symbole zu definieren, die sich nur in der Gross- und 
Kleinschreibung des ersten Buchstabens unterscheiden.
(Die Namen verschiedener direkter lexikalischer Kategorien duerfen ueberdies
nicht equalp sein.)

<parserClassname> ::= <BNFRoot>Parser
Oberklasse: AtnParser. Die generierte Parser-Klasse
beinhaltet folgende Konstruktoren:
<parserClassname> (AtnLexicon lexikon, ParseableData datenquelle);
<parserClassname> (ParseableData datenquelle);
<parserClassname> (ParseableData datenquelle, <subAtnParser>);

Zugriffsmethoden:
setData(<ParseableData>);
getData();
syntaxTrees();
FirstSyntaxTree();
getNetTable();

Debugging:
<Parseable...>.unparsedString()

Aufrufsyntax des Parsers:
<parser>.invoke(<methodname>, <ParseableData>);
<parser>.parse();
<parser>.createDom(<boolean>);
<parser>.createDom(<boolean>, <subparser>);

<parser>.createDom(true);
->
<parser>.parse();
<parser>.createDom(false);

|#

;;; Key-Defaults

(defparameter *parser-element-type* 'character)
(defparameter *use-wfst* nil)
(defparameter *encode-tracer* nil)
(defparameter *register-words* nil)
(defparameter *wfst-type* "HashTable")
(defparameter *preterminal-dom-symbols* nil)
(defparameter *adjoin-preterminal-dom-symbols* nil)
(defparameter *redundant-dom-symbols* nil)
(defparameter *ignorable-context-postfix* #\$)
(defparameter *dummy-register* "$")
(defparameter *register-mappings* nil)
(defparameter *preservable-context-names* nil)

;;; Directories & Packages

(defparameter *default-java-parser-directory* 
  #+:mcl "entwicklung:Benno:Java:de:mecom:parser:"
  #+:aclpc "Benno\\Java\\de\\mecom\\parser\\")
(defparameter *default-grammar-pathname-default*
  #+:mcl "entwicklung:Benno:Grammars:*.bnf"
  #+:aclpc "c:\\Benno\\MeCom\\Grammars\\*.bnf")

(defparameter *java-package* "de.mecom")
(defparameter *java-parser-package* 
  #.(format nil "~A.parser" *java-package*))
(defparameter *java-util-list-package*
  #.(format nil "~A.util.list" *java-package*))
(defparameter *java-parser-util-package*
  #.(format nil "~A.util" *java-parser-package*))

(eval-when (:load-toplevel :compile-toplevel :execute)
  (setf (logical-pathname-translations "melis")
        (if (probe-file "entwicklung-server:")
          `(("**;*.*" "entwicklung-server:MeLIS:**:*.*"))
          `(("**;*.*" "entwicklung:Benno:**:*.*"))))
  (setf (logical-pathname-translations "lisp")
        (if (probe-file "entwicklung-server:")
          `(("**;*.*" ,(logical-pathname "melis:Source;LISP;**;*.*")))
          `(("**;*.*" ,(logical-pathname "melis:LISP;**;*.*")))))
  (setf (logical-pathname-translations "dtd")
        `(("**;*.*" ,(logical-pathname "melis:DTD;**;*.dtd"))))
  (setf (logical-pathname-translations "grammars")
        `(("**;*.*" ,(logical-pathname "melis:Grammars;**;*.bnf"))))
  (setf (logical-pathname-translations "clifs")
        `(("**;*.*" ,(logical-pathname "lisp:Clifs;**;*.*"))))
  (setf (logical-pathname-translations "xml-generator")
        `(("**;*.*" ,(logical-pathname "lisp:XML-Generator;**;*.*"))))
  (setf (logical-pathname-translations "parser-generator")
        `(("**;*.*" ,(logical-pathname "lisp:Parser-Generator;**;*.*"))))
  (setf (logical-pathname-translations "java")
        (if (probe-file "entwicklung-server:")
          `(("**;*.*" "entwicklung-server:MeLIS:Source:Java:**:*.*"))
          `(("**;*.*" "entwicklung:Benno:Java:**:*.*"))))
  (setf (logical-pathname-translations "java-parser")
        `(("**;*.*" ,(logical-pathname "java:de;mecom;parser;**;*.*")))))

(defun java-parser-pathname-default (main-net-name)
  (let ((grammar-name (string-downcase main-net-name)))
    (if *default-java-parser-directory*
      (let ((dir (format nil "~A~(~A~)" 
                         *default-java-parser-directory*
                         (string-downcase main-net-name))))
        (make-pathname :directory dir
                       :name :wild
                       :type "java"))
      (translate-logical-pathname 
       (merge-pathnames 
        (logical-pathname "java-parser:")
        (make-pathname :directory grammar-name :name :wild :type "java"))))))

(defun java-parser-package-form (main-net-name)
  (format nil "package ~A.~(~A~);~%"
          *java-parser-package*
          main-net-name))

(defun java-parser-import-form ()
  (flet ((import-form (x)
           (format nil "import ~A.*;" x)))
    (format nil "~%~A~%~A~%~A~%~A~%~A~2%"
            (import-form *java-parser-package*)
            (import-form *java-util-list-package*)
            (import-form *java-parser-util-package*)
            "import java.util.Enumeration;"
            "import java.util.Hashtable;")))

;;;
;;; Class java-atn-system
;;;

(defclass java-atn-system (atn-system)
  ((java-named-forms :accessor system-java-named-forms :initform nil)))

(defmethod system-java-forms ((system java-atn-system))
  (mapcar #'cdr (system-named-java-forms system)))

(defmethod system-compiled-p ((system java-atn-system))
  (if (system-java-named-forms system) t nil))

(defparameter *char-literal-encoding* nil)
#+:mcl(defparameter *filename-counter* 0)

(defclass java-table-atn-system (java-atn-system)
  ())

;;;
;;; make-parser 
;;;


(defmethod make-parser ((bnf string) &rest initargs &key 
                        element-type use-wfst encode-tracer register-words (write t)
                        wfst-type redundant-dom-symbols 
                        (preterminal-dom-symbols *preterminal-dom-symbols* pts-supplied)
                        adjoin-preterminal-dom-symbols
                        ;;java-parser-basic-package
                        parser-super-directory
                        ignorable-context-postfix
                        mappings
                        preservable-context-names
                        columns
                        rows
                        &allow-other-keys)
  (declare (ignore initargs))
  (let* (#+:mcl (*filename-counter* 0)
         ;(*system* (find-system 'ebnf))
         (system (bnf-to-atn bnf))
         ;(*system* system)
         (*parser-element-type* (or element-type *parser-element-type*))
         (*encode-tracer* (or encode-tracer *encode-tracer*))
         (*wfst-type* (or wfst-type *wfst-type*))
         (*default-java-parser-directory* parser-super-directory)
          ;(or parser-directory *default-java-parser-directory*))
         (*preterminal-dom-symbols* 
          (or preterminal-dom-symbols (if pts-supplied '(""))))
         (*adjoin-preterminal-dom-symbols* 
          (or adjoin-preterminal-dom-symbols *adjoin-preterminal-dom-symbols*))
         (*redundant-dom-symbols*
          (or redundant-dom-symbols *redundant-dom-symbols*))
         (*register-words* (or register-words *register-words*))
	 (*print-case* :upcase)
         (*use-wfst* (or use-wfst *use-wfst*))
         (*ignorable-context-postfix* 
          (or ignorable-context-postfix *ignorable-context-postfix*))
         (*register-mappings* (or mappings *register-mappings*))
         (*preservable-context-names*  
          (or preservable-context-names *preservable-context-names*))
         #|(parser-name (if system (string (system-parser-name system))))|#)
    ;;(setf (system-documentation system) bnf)
    ;;geschachtelte Kommentare in Java unzulaessig!
    (cond ((null system)
           (error "Parser konnte nicht generiert werden"))
          (t (let ((duplicated-nets (check-duplicate-nets system)))
               (when duplicated-nets
                 (warn "Die Grammatik ist fehlerhaft")
                 (show-duplicated-symbols duplicated-nets)
                 (return-from make-parser system)))
             (when (or columns rows)
               (cond ((and columns rows)
                      (setf (getf (system-plist system) :columns) columns
                            (getf (system-plist system) :rows) rows)
                      (change-class system 'java-table-atn-system))
                     (columns
                      (error "Angabe der Zeilenanzahl (:rows) fehlt"))
                     (rows
                      (error "Angabe der Spaltenanzahl (:columns) fehlt"))))
             (update-system-plist system)
             (when write (write-source system nil))
             (insert-system system)
             (setf *system* system)))))

(defmethod update-system-plist ((system atn-system))
  (setf (getf (system-plist system) :preterminal-dom-symbols)
        (preterminal-dom-symbols system)
        (getf (system-plist system) :redundant-dom-symbols)
        *redundant-dom-symbols*
        (getf (system-plist system) :register-words)
        *register-words*
        (getf (system-plist system) :ignorable-context-postfix)
        *ignorable-context-postfix*
        (getf (system-plist system) :preservable-context-names)
        *preservable-context-names*))

(defmethod make-parser ((bnf pathname) &rest initargs &key 
                        grammar-pathname-default
                        &allow-other-keys)
  (let ((grammar-path 
         (if grammar-pathname-default
           (merge-pathnames bnf grammar-pathname-default)
           (translate-logical-pathname 
            (merge-pathnames bnf (logical-pathname "grammars:"))))))                     
    (apply #'make-parser (read-bnf-string grammar-path) initargs)))

(defun read-bnf-string (pathname)
  (with-open-file (istream pathname :direction :input)
    (loop with ostream = (make-string-output-stream)
          for char = (read-char istream nil nil)
          while char
          do (write-char char ostream)
          finally return (get-output-stream-string ostream))))

;;;
;;; write-source
;;;


;(write-source *system* #p"atn-parser:test;")
;(write-source *system* t)

(defmethod write-source ((system java-atn-system) (destination (eql t)))
   (if (system-java-forms system)
     (dolist (form (system-java-forms system))
       (write-source form *standard-output*))))

(defmethod write-source :before ((system java-atn-system) destination)
  (declare (ignore destination))
  (unless (system-compiled-p system) (compile-system system)))

(defmethod write-source ((system java-atn-system) (destination null))
   (loop with main-name = (system-main-net-name system)
         with java-default-pathname = (java-parser-pathname-default main-name)
         for (name form) in (system-java-named-forms system)
	 for i from 1
         for file =
	 (merge-pathnames (string name) java-default-pathname)
	 do 
	 (format t "~%; Parser-Generator: Schreibe Datei ~S ..."
              file)
         (with-open-file (stream file :direction :output
				    :if-exists :supersede)
           (format stream (java-parser-package-form main-name))
           (format stream (java-parser-import-form))
           (write-source form stream))
	 (format t " fertig!")
         finally do (format t "~%; Parser-Generator: ~D Java-Dateien geschrieben!" i)))

(defmethod write-source ((system java-atn-system) (destination string))
  (let ((file (merge-pathnames destination *default-java-parser-directory*)))
    (with-open-file (stream file :direction :output
                            :if-exists :supersede)
      (write-source system stream))))

(defun build-file-name (directory filename filetype)
  (merge-pathnames filename (merge-pathnames (format nil "*.~A" filetype) directory)))

(defmethod write-source ((system java-atn-system) (destination stream))
  (if (system-java-forms system)
    (dolist (form (system-java-forms system))
      (write-source form destination))))

(defmethod write-source ((source string) (destination stream))
  (format destination source))

(defmethod write-source ((source list) (destination stream))
  (dolist (form source)
    (write-source form destination)))

;;;
;;; compile-system
;;;

(defmethod compile-system ((system java-atn-system) &key destination)
  (setf (system-java-named-forms system)
        (build-java-named-forms system))
  (if destination (write-source system destination)))

;;;
;;; Java-Form ATN-System
;;;

(defmethod build-java-named-forms ((object java-atn-system))
  (append
   (java-named-parser-forms object)
   (java-named-lexicon-forms object)
   (java-named-net-forms object)))

(defmethod java-named-net-forms ((object java-atn-system))
  (mapcar #'(lambda (net)
              (list #+:mcl (ensure-mac-filename-limit (java-class-name (atn-name net)))
                    #-:mcl (java-class-name (atn-name net))
                    (java-form net)))
          (system-nets object)))

(defmethod java-named-parser-forms ((object java-atn-system))
  `((,(java-class-name 
       #-:aclpc (system-parser-name object)
       #+:aclpc (format nil "~AParser" (system-main-net-name object)))
     ,(java-basic-parser-forms object))))

(defmethod java-named-lexicon-forms ((object java-atn-system))
  (let ((lexicon (system-lexicon object)))
    `((,(java-lexicon-class-name lexicon) ,(java-form lexicon)))))

;; deprecated
(defmethod java-form ((object atn-system))
  (format nil "~A~2%// Lexikon~%~A~2%// Netze~%~{~%~A~}"
          (java-basic-parser-forms object)
          (java-form (system-lexicon object))
          (mapcar #'java-form (system-nets object))))

(defun ensure-register-name (name)
  (let ((map-name (get-map-name name)))
    (or map-name
        (if *ignorable-context-postfix*
          (or (get-pres-name name)
              (ensure-context-free-name name))
          name))))

(defun get-map-name (name)
  (let ((entry (assoc name *register-mappings* :test #'equal)))
    (if entry (second entry))))

(defun get-pres-name (name)
  (find name *preservable-context-names* :test #'equal))

(defun ensure-context-free-name (name)
  (let* ((str (string name))
         (pos (position *ignorable-context-postfix* (string name))))
    (if pos 
      (if (zerop pos) *dummy-register* (subseq str 0 pos))
      str)))

;;;
;;; Java-Forms Lexikon
;;;

(defmethod java-form ((object atn-lexicon))
  (let ((lexicon-class (java-lexicon-class-name object))
        (lexicon-superclass (java-lexicon-superclass-name object))
        (element-type (parser-element-type object)))
    (format nil "~%public class ~A ~
                 extends ~A {~%~A~2%~A~2%~A~2%~{~%~A~}}"
            lexicon-class
            lexicon-superclass
            (java-lexicon-words element-type (atn-words object))
            (java-lexicon-category-flags (atn-primitive-categories object))
            (java-lexicon-constructor lexicon-class (atn-lexems object))
            (mapcar #'java-form (atn-nonprimitive-categories object)))))

(defun java-lexicon-category-flags (categories)
  (flet ((flag-form (cat)
           (format nil "~%~6tprotected static final Long ~A = new Long(~D);"
                   (string-upcase (category-name cat))
                   (category-flag-id cat))))
    (apply #'concatenate 'string
           (mapcar #'flag-form categories))))

(defmethod constant-word-name ((name character))
  (format nil "WORD~d" (char-code name)))

(defmethod constant-word-name ((name number))
  (format nil "WORD~d" name))

(defmethod constant-word-name (name)
  (format nil "WORD~{~d~}"
          (mapcar #'char-code (coerce (string name) 'list))))

;;(constant-word-name #\a)
;;(constant-word-name "d:-")

(defmethod java-lexicon-words (element-type words)
  (flet ((java (lexem)
           (format nil "protected static final ~A ~A = ~A;"
                   (java-element-class-form element-type)
                   (constant-word-name (atn-name lexem))
                   (java-atn-lexem-form element-type lexem))))
    (format nil "~{~%~6t~A~}" (mapcar #'java words))))

(defmethod java-lexicon-constructor (name lexems)
  (format nil "~6tpublic ~A() {~%~{~%~9t~A~}~%}"
          name
          (mapcar #'java-form lexems)))

(defmethod java-lexicon-class-name ((object atn-lexicon))
  (format nil "~ALexicon" (java-class-name (system-main-net-name (system object)))))

(defmethod java-lexicon-superclass-name ((object atn-lexicon))
  (format nil "~AHashTableLexicon"
          (java-element-class-form (parser-element-type object))))

(defmethod atn-nonprimitive-categories ((object atn-lexicon))
  (remove-if #'(lambda (x) (typep x 'atn-primitive-category))
             (atn-predicates object)))

(defmethod atn-primitive-categories ((object atn-lexicon))
  (remove-if #'(lambda (x) (not (typep x 'atn-primitive-category)))
             (atn-predicates object)))

;;; Lexeme

(defmethod java-form ((object atn-lexem))
  (flet ((lexem-flag (categories)
           (reduce #'logior (mapcar #'category-flag-id categories))))
    (format nil "this.lexicalize (~A, new Long(~D));"
            (java-atn-lexem-form (parser-element-type object) object)
            (lexem-flag (atn-categories object)))))

(defmethod java-atn-lexem-form ((element-type (eql 'string)) object)
  (java-atn-word-form element-type object))

(defmethod java-atn-lexem-form ((element-type (eql 'character)) object)
  (format nil "new Character(~A)" (java-atn-word-form element-type object)))

(defmethod java-atn-lexem-form ((element-type (eql 'byte)) object)
  (format nil "new Byte((byte)~A)" (java-atn-word-form element-type object)))

;;; Praedikate

(defmethod java-form ((object atn-primitive-category))
  "")

(defmethod java-predcall-form ((object bnf-tokenset))
  (format nil "~A~{~A~^ || ~}"
          (if (bnf-negation object) #\! "")
          (mapcar #'(lambda (x) (java-token-test-form (cdr x))) (bnf-tokens object))))

(defmethod java-predcall-form ((object bnf-tokenrange))
  (destructuring-bind ((cat1 . token-min) (cat2 . token-max)) (bnf-tokens object)
    (declare (ignore cat1 cat2))
    (format nil "~AinRange(item,~A,~A)"
            (if (bnf-negation object) #\! "")
            (java-token-form token-min)
            (java-token-form token-max))))

(defun java-token-test-form (token)
  (format nil "isElement(item,~A)" (java-token-form token)))

(defun java-token-form (name)
  (if (char-number-code-p name)
    (char-number-code name)
    (format nil "'~A'" name)))

(defun char-number-code (str)
  (read-from-string str))

(defun char-number-code-p (str)
  (and (char= (char str 0) #\#)
       (> (length str) 2)
       (member (char str 1) '(#\x #\X #\b #\B #\o #\O))))

(defmethod java-form ((object atn-derived-category))
  (format nil "~%~6tpublic boolean ~A(Object item) {
        return (~{~A~^ || ~});
   }"
          (java-attribute-name (category-name object))
          (mapcar #'java-predcall-form (category-elements object))))

(defmethod java-predcall-form ((object atn-lexem))
  (format nil "(item.equals(lexicon.~A))" (constant-word-name (atn-name object))))

(defmethod java-predcall-form ((object atn-primitive-category))
;;; primitive Kategorien in abgeleiteten
  (format nil "(hasCategory(item,~A))"
          (string-upcase (category-name object))))

(defmethod java-predcall-form ((object atn-derived-category))
  (format nil "~A(item)"
          (java-attribute-name (category-name object))))

(defmethod java-predcall-form ((object atn-undeclared-category))
  (format nil "lexicon.~A(item) /* VORSICHT, standardmaessig nicht definiert!!! */"
          (java-attribute-name (category-name object))))

(defmethod java-predcall-form ((object atn-conjunction))
  (format nil "(~{~A~^ && ~})"
          (mapcar #'java-predcall-form (atn-elements object))))

(defmethod java-predcall-form ((object atn-negated-alternatives))
  (format nil "!(~{~A~^ || ~})"
          (mapcar #'java-predcall-form (atn-elements object))))

;;; Tabellen-Zellen-Tests

(defmethod java-form ((object atn-cell-category))
  (format nil "~%~6tpublic boolean ~A(int item) {
        return ~A;~%~6t}"
          (java-attribute-name (category-name object))
          (java-predcall-form object)))

(defun build-ranges (numbers)
  ;; numbers aufsteigend sortiert!
  (if (rest numbers)
    (let* ((ranges (build-ranges (rest numbers)))
           (range1 (first ranges)))
      (if range1
        (if (= (first numbers) (1- (first range1)))
          (if (rest range1)
            (cons (cons (first numbers) (rest range1))
                  (rest ranges))
            (cons (cons (first numbers) range1)
                  (rest ranges)))
          (cons (list (first numbers)) ranges))
        (cons (list (first numbers)) (rest ranges))))
    (list (list (first numbers)))))
        
(defmethod java-predcall-form ((object atn-cell-category))
  (let ((table-columns (getf (system-plist (system object)) :columns)))
    (labels ((cell-index (cell)
               (cell-row-major-index cell table-columns))
             (tests (ranges)
               (if ranges
                 (cons (let ((range1 (first ranges)))
                         (if (rest range1)
                           (format nil "(item >= ~D && item <= ~D)"
                                   (first range1) (second range1))
                           (format nil "(item == ~D)" (first range1))))
                       (tests (rest ranges))))))                         
      (let* ((indices  (mapcar #'cell-index (category-elements object)))
             (ranges (build-ranges (sort indices #'<))))
        (format nil "~{~A~^ || ~}" (tests ranges))))))

(defmethod cell-row-major-index ((object bnf-table-cell) table-columns)
  (let ((row (- (bnf-cell-row object) 1))
        (column (- (bnf-cell-column object) 1)))
      (+ (* row table-columns) column)))

;;;
;;; Java-Forms Parser (parser class, net classes)
;;;


(defmethod java-basic-parser-forms ((object java-atn-system))
  (append
   (java-parser-class-documentation-forms object)
   (java-parser-class-declaration-forms object)
   (java-parser-variable-declaration-forms object)
   (java-parser-wfst-forms object)
   (java-parser-constructors-forms object)
   (java-parser-utility-methods-forms object)
   (java-parser-parse-method-forms object)
   (java-parser-net-call-methods-forms object)
   (java-parser-class-end-forms object)))

(defmethod java-main-net-class-name ((object java-atn-system))
  (java-class-name (system-main-net-name object)))

(defmethod java-parser-class-end-forms ((object java-atn-system))
  `(,(format nil "~%}")))

(defmethod java-parser-class-documentation-forms ((object java-atn-system))
  `(,(format nil "~%/**~%~A~%*/~%" (system-documentation object))))

(defmethod java-parser-class-declaration-forms ((object java-atn-system))
  `(,(format nil "public class ~AParser extends AtnParser {~%"
             (java-main-net-class-name object))))

(defmethod java-parser-variable-declaration-forms ((object java-atn-system))
  `(,(format nil "
      public ParseableData data;
      public static Tracer tracer;
      public static ~ALexicon lexicon;~%"
          (java-main-net-class-name object))))

(defmethod java-parser-wfst-forms ((object java-atn-system))
  (if *use-wfst* 
    (let ((net-names (mapcar #'(lambda (n) (java-attribute-name (atn-name n)))
                             (system-nets object))))
      `(,(format nil "~%~{~%~6t~A~}" (mapcar #'java-net-wfst-form net-names))))))

(defmethod java-parser-constructors-forms ((object java-atn-system))
  `(,(format nil "~%// Konstruktoren~%~A"
             (java-basic-constructors object (java-main-net-class-name object)))))

(defmethod java-parser-utility-methods-forms ((object java-atn-system))
  (let ((net-names (mapcar #'(lambda (n) (java-attribute-name (atn-name n)))
                           (system-nets object))))
    `(,(format nil "// Allg. Hilfsmethoden~%~A~%
      public void setData (ParseableData source) {
           data = source;
      }
      public ParseableData getData () {
           return data;
      }~A"
               (if *encode-tracer*
                 (format nil "~%
      public void traceOn () {~%~9Ttracer = new Tracer();~%~6T}~%
      public void traceOff () {~%~9Ttracer = null;~%~6T}")
                 "")
               (java-init-symbols-form object)
               (if *use-wfst* 
                 (format nil "~%~6tpublic static void clearWfstables () {~{~%~6t~AWfst.clear();~}}"
                         net-names))
               ""))))
  
(defmethod java-parser-parse-method-forms ((object java-atn-system))
  `(,(format nil "~%// Allg. Aufrufmethode fuer das Hauptnetz
      public List parse () {
          ~A
          atnStructure = Pair.nil;
          return ~A(~A);
      }"
             (if *use-wfst* "clearWfstables();" "")
             (java-attribute-name (system-main-net-name object))
             (java-data-var-name object))))

(defmethod java-parser-net-call-methods-forms ((object java-atn-system))
  (cons (format nil "~%// Parser call net methods~2%")
        (mapcar #'java-net-parser-methods-form (system-nets object))))

#| alte Version!!!

#-:aclpc
(defun java-basic-parser-form (system)
  (let* ((main-name (system-main-net-name system))
         (nets (system-nets system))
         (net-names (mapcar #'atn-name nets))
         ;;; (start-names (mapcar #'atn-start nets))
         (main-class-name (java-class-name main-name))
         (*print-right-margin* 60))
    ;; package und import statements in write-source method!
    (format nil "public class ~AParser extends AtnParser {~%
/**
~A
*/~%
      public static ParseableData data;
      public static Tracer tracer;
      public static ~ALexicon lexicon;~%~{~%~6t~A~}

      // Konstruktoren~%~A

      // Allg. Hilfsmethoden~%~A~%
      /* public String[] basicSymbols() {
	   return basicSymbols;
      }
      */
      public void setData (ParseableData source) {
           data = source;
      }
      public ParseableData getData () {
           return data;
      }~A

      // Allg. Aufrufmethode fuer das Hauptnetz
      public List parse () {
          ~A
          atnStructure = Pair.nil;
          return ~A();
      }
      // Parser call net methods~{~%~A~}~%~6t}"
      ;;(system-parser-name system) ;;*java-parser-basic-package*
      main-class-name
      (system-documentation (atn-system (first nets)))  
      main-class-name
      (if *use-wfst* (mapcar #'java-net-wfst-form net-names) '(""))
      (java-basic-constructors system main-class-name)
      (java-init-symbols-form system)
      (if *use-wfst* 
        (format nil "
      public static void clearWfstables () {~{~%~6t~AWfst.clear();~}}"
                (mapcar #'java-attribute-name net-names))
        "")
      (if *use-wfst* "clearWfstables();" "")
      (java-attribute-name main-name)
      (mapcar #'java-net-parser-methods-form nets))))

;; #+:aclpc
(defun java-basic-parser-form (system)
    (let* ((main-name (system-main-net-name system))
         (nets (system-nets system))
         (net-names (mapcar #'atn-name nets))
         ;;; (start-names (mapcar #'atn-start nets))
         (main-class-name (java-class-name main-name))
         (*print-right-margin* 60))
    ;; package und import statements in write-source method!
    (cons
     (format nil "public class ~AParser extends AtnParser {~%
/**
~A
*/~%
      public static ParseableData data;
      public static Tracer tracer;
      public static ~ALexicon lexicon;~%~{~%~6t~A~}

      // Konstruktoren~%~A

      // Allg. Hilfsmethoden~%~A~%
      /* public String[] basicSymbols() {
	   return basicSymbols;
      }
      */
      public void setData (ParseableData source) {
           data = source;
      }
      public ParseableData getData () {
           return data;
      }~A

      // Allg. Aufrufmethode fuer das Hauptnetz
      public List parse () {
          ~A
          atnStructure = Pair.nil;
          return ~A();
      }"
      ;;(system-parser-name system) ;;*java-parser-basic-package*
      main-class-name
      (system-documentation (atn-system (first nets)))  
      main-class-name
      (if *use-wfst* (mapcar #'java-net-wfst-form net-names) '(""))
      ;; Konstruktoren
      (java-basic-constructors system main-class-name)
      ;; Allgemeine Hilfsmethoden
      (if *encode-tracer*
        (format nil "~%
      public void traceOn () {~%~9Ttracer = new Tracer();~%~6T}~%
      public void traceOff () {~%~9Ttracer = null;~%~6T}")
        "")
      (java-init-symbols-form system)
      (if *use-wfst* 
        (format nil "~%~6tpublic static void clearWfstables () {~{~%~6t~AWfst.clear();~}}"
                (mapcar #'java-attribute-name net-names))
        "")
      ;; Aufrufmethode parse
      (if *use-wfst* "clearWfstables();" "")
      (java-attribute-name main-name))
      (let ((forms (list (format nil "~%}"))))
	(dolist (net nets)
	   (push (java-net-parser-methods-form net) forms))
	(cons (format nil "~%// Parser call net methods~2%") forms)))))
|#


(defun basic-symbol-names (nets)
  (flet ((java-name (net)
           #+:mcl (ensure-mac-filename-limit (symbol-name (atn-name net)))
           #-:mcl (symbol-name (atn-name net))))
    (loop for net in nets
          if (basic-net-p net)
          collect (java-name net))))

(defun derived-preterminal-dom-symbols (nets)
   (flet ((java-name (net)
            ;; mac file limit bleibt bei den registernamen, also auch hier,
            ;; unberuecksichtigt!
            ;; zu beachten sind allerdings die register mappings!
            (ensure-register-name (symbol-name (atn-name net)))))
    (loop for net in nets
          if (basic-net-p net)
          collect (java-name net))))

(defmethod lexial-preterminal-dom-symbols ((system java-atn-system))
  (mapcar #'category-name (atn-predicates (system-lexicon system))))


;(lexial-preterminal-dom-symbols *system*)

#|(defun java-basic-symbols-array (nets)
  (format nil "{~{~%~10t~S~^, ~}}"
          (basic-symbol-names nets)))
|#

(defun java-string-array-init (strings)
   (format nil "{~{~%~10t~S~^, ~}}" strings))

(defun redundant-dom-symbols (system)
  (declare (ignore system))
  *redundant-dom-symbols*)

(defun preterminal-dom-symbols (system)
  (or *preterminal-dom-symbols*
      (if *adjoin-preterminal-dom-symbols*
        (adjoin *adjoin-preterminal-dom-symbols*
                (derived-preterminal-dom-symbols (system-nets system))
                :test #'equal))
      (derived-preterminal-dom-symbols (system-nets system))))

(defun java-preterminal-dom-symbols-initform (preterminal-symbols)
  (if preterminal-symbols
    (format nil "~%~9tString[] ps = ~A;~%~9tsetPreterminalDomSymbols(ps);"
            (java-string-array-init preterminal-symbols))
    ""))

(defun java-redundant-dom-symbols-initform (redundant-symbols)
  (if redundant-symbols
    (format nil "~%~9tString[] rs = ~A;~%~9tsetRedundantDomSymbols(rs);"
            (java-string-array-init redundant-symbols))
    ""))
     
(defmethod java-basic-constructors ((system java-atn-system) name)
  (declare (ignorable system))
  (format nil "
      public ~AParser (AtnLexicon lexikon, ParseableData datenquelle) {
              super();
	      lexicon = (~ALexicon)lexikon;
	      data = datenquelle;
              initSymbols();
              // tracer = new Tracer();
      }

      public ~AParser(ParseableData datenquelle) {
              super();
	      lexicon = new ~ALexicon();
	      data = datenquelle;
              initSymbols();
              // tracer = new Tracer();
      }

      public ~AParser() {
              super();
              lexicon = new ~ALexicon();
              initSymbols();
              // tracer = new Tracer();
      }"
    name name 
    name name 
    name name))

(defmethod java-init-symbols-form (system)
  (let* ((nettable-initform (java-net-symbols-initform system))
         (redundant-symbols (redundant-dom-symbols system))
         (preterminal-symbols (preterminal-dom-symbols system))
         (redundant-initform (java-redundant-dom-symbols-initform redundant-symbols))
         (preterminal-initform (java-preterminal-dom-symbols-initform preterminal-symbols))
         (initform (concatenate 'string redundant-initform preterminal-initform nettable-initform)))
    (format nil "
         private void initSymbols() {~%~A
         }"
            initform)))

(defmethod java-net-symbols-initform ((system java-atn-system))
  (flet ((putargs (net)
           (let ((name (java-class-name (atn-name net))))
             #+:mcl (setf name (ensure-mac-filename-limit name))
             (format nil "~S,~S" name (java-attribute-name name)))))
      (format nil "
         Hashtable netTable = new Hashtable();
         setNetTable(netTable);~{~%~9TnetTable.put(~A);~}~%"
              (mapcar #'putargs (system-nets system)))))

(defun java-net-wfst-form (netname)
  (format nil "protected static Wfstable ~AWfst = new Wfst~A();" 
          (java-attribute-name netname)
          (java-wfst-type)))

(defun java-wfst-type ()
  *wfst-type*)

#|
(defun java-class-name (name)
  ;;(delete #\- (string-capitalize name))
  (let ((name (string name)))
    (cond ((find #\- name)
           (delete #\- (string-capitalize name)))
          ((upper-case-p (char name 0)) name)
          (t (string-capitalize name)))))
;; fatal error ?
(java-class-name '|Ad-df|)
|#

(defun java-class-name (name)
  (delete #\- (capitalize-namestring (string name))))

#+:mcl
(defparameter *mac-filename-table*
  (make-hash-table :test #'equal))

#+:mcl
(defparameter *warn-if-filename-too-long* nil)

#+:mcl
(defun ensure-mac-filename-limit (str)
  (cond ((> (length str) #.(- 31 6))
         (let ((shortname (gethash str *mac-filename-table*)))
           (unless shortname
             (setf shortname (ensure-mac-shortname str)))
           (if *warn-if-filename-too-long*
             (warn "Klassenname wird gekuerzt: ~A -> ~A" str shortname))
         shortname))
        (t str)))

#+:mcl
(defun ensure-mac-shortname (longname)
  (let ((name 
         (format nil "~A~D" 
                 (subseq longname 0 #.(- 31 6 4))
                 *filename-counter*)))
    (setf (gethash longname *mac-filename-table*)
          name)
    (incf *filename-counter*)
    name))

(defun capitalize-namestring (namestring)
  (if (find #\- namestring)
    (string-capitalize namestring)
    (if (upper-case-p (char namestring 0))
	namestring
      (format nil "~A~A" 
	      (char-upcase (char namestring 0))
	      (subseq namestring 1)))))

(defun java-regular-name (name)
  (if (find #\- (string name))
    (delete #\- (string-capitalize name))
    name))

(defun java-attribute-name (name)
  (let ((result (java-class-name name)))
    (setf (char result 0) (char-downcase (char result 0)))
    result))

(defmethod java-net-parser-methods-form ((net atn))
  ;; jeweils zwei Versionen
  (let* ((system (system net))
         (netname (atn-name net))
         (attribute-name (java-attribute-name netname))
         (pdata-class (java-data-class-name system))
         (pdata-var (java-data-var-name system)))
    (format nil "~6tpublic List ~A (~A pdata, int index) {~%~A~%~6t}~%~6tpublic List ~A (~A pdata) {~%~9tatnStructure = ~A(~A, 0);~%~9treturn atnStructure;
~%~6t}"
            attribute-name
            pdata-class
            ;;pdata-var
            (java-net-parser-method-body net)
            attribute-name
            pdata-class
            ;;pdata-var
            attribute-name
            pdata-var)))

(defmethod java-data-class-name ((object java-atn-system))
  (declare (ignore object))
  "ParseableData")

(defmethod java-data-var-name ((object java-atn-system))
  (declare (ignore object))
  "data")

(defmethod java-data-class-name ((object java-atn-system))
  (declare (ignore object))
  "int[]")

(defmethod java-data-var-name ((object java-atn-system))
  (declare (ignore object))
  "tableData")

(defmethod java-data-var-name ((object t))
  (declare (ignore object))
  "data /*for null system*/")

(defmethod java-net-parser-method-body ((net atn))
  (let  ((netname (java-class-name (atn-name net)))
         (startname (java-attribute-name (atn-start net)))
         (wfstname (java-wfst-name net))
         (initially-test (atn-initially-tests net))
         (initially-do (java-do-form (atn-initially-actions net)))
         (finally-do  (atn-finally-actions net))
;         (finally-test (atn-finally-tests net))
         (startindex (if (atn-limit net) "index" ""))
         (data-varname (java-data-var-name (system net)))
         (returnform (java-net-new-return-form (atn-finally-tests net))))
    #+:mcl (setf netname (ensure-mac-filename-limit netname))
    ;; constructor, type 
    (if *use-wfst*
      (format nil "
           ~A net;
           List wfstEntry = ~A.get(index);

           if (~AwfstEntry.empty())
           { net = new ~A(~A);~%~9T net.~A = pdata;~A
             net.~A(index,Pair.nil);
             ~A.setWfstEntry(net.atnStructure, index);
             ~A
             ~A;
           }
           else 
           { return wfstEntry; }"
              netname ;; Typdeklaration
              wfstname
              (if initially-test 
                (format nil "~A || " (java-test-form initially-test net))
                "")
              netname ;; constructor 
              startindex
              data-varname
              initially-do startname
              wfstname
              (if finally-do
                ;; nur wenn das netz erfolgreich durchlaufen worden ist!
                (format nil "if (!net.atnStructure.empty()) { ~A }" 
                        (java-do-form finally-do))
                "")
              returnform)
      (format nil "
           ~A net;
           if (~A)
           { net = new ~A(~A);~%~9T net.~A = pdata;~A
             net.~A(index,Pair.nil);
             ~A
             ~A;
           }
           else 
           { return Pair.nil; }"
              netname ;; Typdeklaration
              (if initially-test 
                (format nil "~A " (java-test-form initially-test net))
                "true")
              netname ;; constructor 
              startindex
              data-varname
              initially-do startname
              (if finally-do
                ;; nur wenn das netz erfolgreich durchlaufen worden ist!
                (format nil "if (!net.atnStructure.empty()) { ~A }" 
                        (java-do-form finally-do))
                "")
              returnform))))
      
(defun java-wfst-name (net)
  (format nil "~AWfst" (java-attribute-name (atn-name net))))

(defun java-net-new-return-form  (finally-test)
  (if finally-test
    (format nil "if (~A) { return net.atnStructure; } else { return Pair.nil; }"
            (java-test-form finally-test nil))
    "return net.atnStructure"))

(defmethod java-test-form ((object null) parent)
  (declare (ignore object parent))
  "")

(defmethod java-test-form ((object atn-procedure-call) (parent atn-edge))
  (java-procedure-call-form object))

(defmethod java-test-form ((object atn-min-test) (parent pop-atn-edge))
  (format nil "~A(index, ~D)" (atn-proc-name object) 
          (first (atn-proc-arguments object))))

(defmethod java-test-form ((object atn-max-test) (parent pop-atn-edge))
  (format nil "~A(index, ~D)" (atn-proc-name object) 
          (first (atn-proc-arguments object))))

(defmethod java-test-form ((object atn-range-test) (parent pop-atn-edge))
  ;; max wurde in den cat/word-Kanten geprueft
  (let ((args (atn-proc-arguments object)))
    (format nil "min(index, ~D)" 
;            (atn-proc-name object) 
            (first args)
;            (second args)
)))

(defmethod java-test-form ((object atn-size-test) (parent pop-atn-edge))
  (let ((args (atn-proc-arguments object)))
    (format nil "~A(index, ~D)" (atn-proc-name object) 
            (first args))))

;;; fuer word/cat-Kanten kann nur eine Obergrenze definiert werden
;;; deklarierter wert - 1, da der test vorm Einlesen stattfindet
;;; aktuelle Implementierung setzt konstanten Testnamen max voraus!!!

(defmethod java-test-form ((object atn-min-test) (parent consume-atn-edge))
  "")

(defmethod java-test-form ((object atn-max-test) (parent consume-atn-edge))
  (format nil "~A(index, ~D)" (atn-proc-name object) 
          (1- (first (atn-proc-arguments object)))))

(defmethod java-test-form ((object atn-range-test) (parent consume-atn-edge))
  (let ((args (atn-proc-arguments object)))
    (format nil "max(index, ~D)"
            (1- (second args)))))

(defmethod java-test-form ((object atn-size-test) (parent consume-atn-edge))
  (let ((args (atn-proc-arguments object)))
    (format nil "max(index, ~D)"
            (1- (first args)))))

(defmethod java-test-form ((object cons) parent)
  (format nil "~{~A~^ && ~}"
          (mapcar #'(lambda (x) (java-test-form x parent)) object)))

(defun java-procedure-call-form (proc)
  (format nil "~A(~{~A~^, ~})" (atn-proc-name proc) 
          (or (atn-proc-arguments proc) '(""))))

(defmethod java-do-form ((object cons))
  (format nil "~{~%~A;~}"
          (mapcar #'java-procedure-call-form object)))

(defmethod java-do-form ((object null))
  (declare (ignore object))
  "")

#|(defmethod java-net-parser-method-body ((procedures null) netname membername startname)
  (format nil "
           ~A net;
           List wfstEntry = ~AWfst.get(index);

           if (wfstEntry.empty())
           { net = new ~A();
             net.~A(index,Pair.nil);
             return net.atnStructure;
           }
           else 
           { return wfstEntry; }"
    netname membername netname startname))
|#

#-:aclpc
(defmethod java-form ((object atn))
   (let ((classname (java-class-name (atn-name object))))
     #+:mcl (setf classname (ensure-mac-filename-limit classname))
      (format nil
        "// Netz ~A 
public class ~A extends ~AParser {

      public void parse(int index) 
      {
        ~A (index, Pair.nil);
      }~%~A~{~2%~A~}~%}"
        classname ;; comment
        classname ;; classname
        (java-class-name (system-main-net-name (atn-system object)))
        (java-attribute-name (atn-start object))
        (if (atn-limit object) (java-net-limit-extension classname) "")
        (mapcar #'java-form (atn-nodes object)))))

;; #+:aclpc
(defmethod java-form ((object atn))
   (let ((classname (java-class-name (atn-name object))))
     #+:mcl (setf classname (ensure-mac-filename-limit classname))
      (cons 
       (format nil
        "// Netz ~A 
public class ~A extends ~AParser {

      public void parse(int index) 
      {
        ~A (index, Pair.nil);
      }~%~A~%"
        classname ;; comment
        classname ;; classname
        (java-class-name (system-main-net-name (atn-system object)))
        (java-attribute-name (atn-start object))
        (if (atn-limit object) (java-net-limit-extension classname) "")
       )
       (nconc (mapcar #'java-form (atn-nodes object))
	      '("~%}")))))

(defun java-net-limit-extension (netname)
  (format nil "
      int startIndex;
      
      public ~A () {
      	super();
      }
      public ~A (int index) {
      	startIndex = index;
      }
      public int netCount(int index) {
      	return index - startIndex;
      }"
          netname netname))

(defmethod java-form ((object atn-node))
  (let ((name (java-attribute-name (atn-name object))))
    (format nil "
      // Knoten ~A
      public final void ~A (int index, List register) {
     
        ~A
        
        List ergebnis;
        List ergebnisse;
        ~A~{~%~A~}~%~6t}"
      name
      name
      (if *encode-tracer*
        (format nil "if (tracer != null) {
           tracer.println(~S,index);}" name)
        "")
      (java-next-element-form object)
      (mapcar #'java-form (atn-edges object)))))

(defmethod java-next-element-form ((object atn-node))
  (java-next-element-form (find-if #'(lambda (e) (typep e 'consume-atn-edge))
                                   (atn-edges object))))

(defmethod java-next-element-form ((object null))
  "")

(defmethod java-next-element-form ((object cell-atn-edge))
  ;; alle konsumierenden Kanten muessen vom Typ cell-atn-edge sein!
  ;; Mischformen werden nicht unterstuetzt!
  (declare (ignore object))
  (format nil "int item = -1;~%if (!empty(index)) {item =  tableData[index];}"))

(defmethod java-next-element-form ((object atn-edge))
  (let ((test (atn-size-test (atn-net (atn-node object))))
        (itemform "item = data.elementAt(index);"))
    (if test
      (format nil "Object item;~%~6tif (~A) {~A} else {item = null;}" (java-test-form test object) itemform)
      (format nil "Object item;~%~6t~A" itemform))))

;;(progn (princ (java-form *system*)) (values))

;; neu data element
(defmethod java-form ((object push-atn-edge))
  (let ((end (java-attribute-name (atn-end object)))
        (net (java-attribute-name (atn-net object))))
    (format nil "
        // PUSH-Kante -- ~A --> ~A
        if (~A)
           { 
             ergebnisse = ~A(~A, index);
             for (Enumeration e = ergebnisse.elements(); e.hasMoreElements();)
                 { 
                   ergebnis = (List)e.nextElement();
                   int newindex = ((Integer)ergebnis.second()).intValue();
                   ~A(newindex, register.cons(ergebnis.first())); 
                 }
           }~%"
      (java-class-name (atn-net object))
      end
      "true" ;;(java-form (atn-test object))
      net
      (java-data-var-name (system object))
      (java-attribute-name (atn-end object)))))

(defmethod java-form ((object word-atn-edge))
  (let ((target (java-attribute-name (atn-end object)))
        (element-type (parser-element-type object)))
  (format nil "
        // WORD-Kante -- ~A --> ~A
        if (item != null && ~A && ((~A)item).equals(lexicon.~A))
          { 
            ~A(index + 1, ~A);
          }~%"
    (atn-word object)
    target
;;;    (java-get-element-form object)
    "true" ;;(java-form (atn-test object))
    (java-element-class-form element-type)
    (constant-word-name (atn-word object))
;;;    (java-atn-word-form element-type object)
    target
    (if *register-words* 
      "register.acons(\"word\", item)"
      "register"))))

(defmethod java-element-class-form ((element-type (eql 'character)))
  (declare (ignore element-type))
  "Character")

(defmethod java-element-class-form ((element-type (eql 'string)))
  (declare (ignore element-type))
  "String")

(defmethod java-element-class-form ((element-type (eql 'byte)))
  (declare (ignore element-type))
  "Byte")

(defmethod parser-element-type (object) 
  (declare (ignore object))
  *parser-element-type*)

(defmethod java-atn-word-form ((element-type (eql 'character)) (object atn-lexem))
  (let ((name (atn-name object)))
    (if *char-literal-encoding*
      (format nil "'~a'" 
              (if (numberp name) 
                (code-char name)
                name))
      (if (numberp name)
	(format nil "(char)~d" name)
        ;; spaeter in code umwandeln!
        (format nil "'~a'" (character name))))))

(defmethod java-atn-word-form ((element-type (eql 'string)) (object atn-lexem))
  (format nil "\"~a\"" (atn-name object)))

(defmethod java-atn-word-form ((element-type (eql 'byte)) (object atn-lexem))
  (let ((name (atn-name object)))
    (format nil "~a"
            (etypecase name
              (number name)
              (character (char-code name))
              (string name)))))

(defmethod java-atn-word-form ((element-type (eql 'character)) (object word-atn-edge))
  (format nil "'~a'" (atn-word object)))

(defmethod java-atn-word-form ((element-type (eql 'byte)) (object word-atn-edge))
  (format nil "~a" (atn-word object)))

(defmethod java-atn-word-form ((element-type (eql 'string)) (object word-atn-edge))
  (format nil "\"~a\"" (atn-word object)))

(defmethod java-form ((object jump-atn-edge))
  (let ((target (java-attribute-name (atn-end object))))
     (format nil "
        // JUMP-Kante -- jump --> ~A
        if (~A)
          { 
            ~A(index, register); 
          }~%"
       target
       "true" ;;(java-form (atn-test object))
       target)))

(defmethod java-form ((object pop-atn-edge))
  (let ((subnet (java-class-name (atn-register object)))
        (net (atn-net (atn-node object))))
     (format nil "
        // POP-Kante -- pop ~A -->
        if (~A)
          {~%~A
          }~%"
       subnet
       (if (main-pop-atn-edge-p object subnet)
          (java-parser-empty-test (system object))
          (let ((tests (atn-pop-tests net)))
            (if tests
              (java-test-form tests object)
              "true"))
          )
       (java-push-substructure-form subnet)
;       subnet ;; i.A. Netzname
       )))
  
(defmethod java-parser-empty-test ((object java-atn-system))
  "data.empty(index)")

(defmethod java-parser-empty-test ((object t))
  "data.empty(index)")

(defun java-push-substructure-form (name)
  (format nil "
         pushSubstructure(~S, register, index);"
          (ensure-register-name name)))

(defun main-pop-atn-edge-p (edge subnet-name)
  (let ((system (atn-system (atn-net (atn-node edge)))))
    (equal (java-class-name (system-main-net-name system))
           subnet-name)))

(defmethod java-form ((object cat-atn-edge))
  (let ((end (java-attribute-name (atn-end object)))
        (catname (java-regular-name (category-name (atn-cat object)))))
     (format nil "
        // CAT-Kante -- ~A --> ~A
        if (item != null && ~A && ~A)
          { 
            ~A(index + 1, register.acons(~S, item));
          }~%"
       catname
       end
;;;       (java-get-element-form object)
       "true" ;;(java-form (atn-test object))
       (java-cat-test-form (atn-cat object))
       end
       (ensure-register-name catname))))

(defmethod java-form ((object cell-atn-edge))
  (let ((end (java-attribute-name (atn-end object)))
        (catname (java-regular-name (atn-name object))))
     (format nil "
        // CELL-Kante -- ~A --> ~A
        if (item >= 0 && ~A && ~A)
          { 
            ~A(index + 1, register.acons(~S, cellValues[item]));
          }~%"
       catname
       end
       "true" ;;(java-form (atn-test object))
       (java-cell-test-form object)
       end
       (ensure-register-name catname))))

#|
(defmethod find-atn-predicate ((predicate string) (system atn-system))
  (find predicate (atn-predicates (system-lexicon system))
        :test #'equal
        :key #'category-name))

;(find-atn-predicate "Zyklus" *system*)
|#

(defmethod java-cell-test-form ((object cell-atn-edge))
  (format nil "~A(item)" (java-attribute-name (atn-name object))))

(defmethod java-cat-test-form (category)
  (format nil "lexicon.hasCategory(item, ~S)"
          (java-attribute-name category)))

(defmethod java-cat-test-form ((object atn-primitive-category))
  (format nil "lexicon.hasCategory(item, lexicon.~A)"
          (string-upcase (category-name object))))

(defmethod java-cat-test-form ((object atn-derived-category))
  (format nil "lexicon.~A(item)"
          (java-attribute-name (category-name object))))

;;;
;;; Ergänzungen zum Tabellen-Parsing
;;;

;;;
;;; zusätzliche Felder:
;;; public static String[] cellValues
;;; public static int[] cellPrecedence
;;; public static int[] tableData
;;; (java-table-parser-variable-declarations *system*)
;;; 
;;; zusätzliche Initialisierungsmethoden
;;; public static void initTableData()
;;; public static void initPrecedenceArray()
;;; public static void initCellValues()
;;; (java-table-parser-init-methods *system*)
;;; 
;;; zusätzliche Aufrufe von Initialisierungsmethoden
;;; (java-table-parser-init-calls *system*)
;;;
;;; zusätzliche empty method
;;; public boolean empty(int index)
;;;
;;; Testmethoden für atn-cell-categories
;;; 

(defmethod atn-cell-categories ((object java-table-atn-system))
  (remove-if (complement #'(lambda (x) (typep x 'atn-cell-category)))
             (atn-predicates (system-lexicon object))))

(defmethod java-cell-categories-forms ((object java-table-atn-system))
  (mapcar #'java-form (atn-cell-categories object)))

;(java-cell-categories-forms *system*)
;;; Überschreiben von allgemeiner Methoden von java-atn-system

;;; Tabellen-Parser haben kein Lexikon
(defmethod java-named-lexicon-forms ((object java-table-atn-system))
  (declare (ignorable object))
  nil)

;;; Tabellen-Parser haben kein Lexikon, aber zusätzliche Variablen
(defmethod java-parser-variable-declaration-forms ((object java-table-atn-system))
  `(,(format nil "
      public static ParseableData data;
      public static Tracer tracer;~A~%"
             (java-table-parser-variable-declarations object))))

;;; setData mit converter?

;;; Tabellen-Parser haben andere Konstruktoren
;;; aktuelle Version funktioniert nur mit einstelligem Konstruktor
;;; Initialisierungsprotokoll aendern!
(defmethod java-basic-constructors ((object java-table-atn-system) name)
  (let ((table-init-calls (java-table-parser-init-calls *system*)))
    (format nil "

      public ~AParser(ParseableData datenquelle) {
              super();
	      data = datenquelle;
              initSymbols();~%~A
              // tracer = new Tracer();
      }

      public ~AParser() {
              super();
              //initSymbols();
              //tracer = new Tracer();
      }"
            name table-init-calls
            name)))

(defmethod java-parser-empty-test ((object java-table-atn-system))
  "empty(index)")

;;; Tabellen-Parser haben zusätzliche Hilfsmethoden / Initialisierungsmethoden
;;; Testmethoden
(defmethod java-parser-utility-methods-forms ((object java-table-atn-system))
  (list* (java-table-parser-init-methods object)
         (java-parser-empty-method object)
         (java-parser-show-data-methods object)
         (append (java-cell-categories-forms object)
                 (call-next-method))))

(defmethod java-parser-show-data-methods ((object java-table-atn-system))
  (declare (ignorable object))
  (format nil "
     public void showData () {
        System.out.println(' ');
     	Character[] cdata = ((ParseableCharacterArray)data).getData();
     	for (int i = 0; i < cdata.length; i++) {
            System.out.print(cdata[i].toString());
     	}
     	System.out.println(' ');
     }
     
     public void showConvertedData () {
        System.out.println(' ');
     	for (int i = 0; i < tableDataSize; i++) {
     	    System.out.print(\"\" + tableData[i] + ' ');
     	}
        System.out.println(' ');
     }
      
     public void showFlags () {
    	for (int i = 0; i < flags.length; i++) {
    		if ((i % columns) == 0) {
    		    System.out.println(' ');
                }
                else if ((i % 4) == 0) {
                    System.out.print(' ');
    	        }
    		if (flags[i]) {
    		   System.out.print('1');
    	        }
    	        else {
    	    	   System.out.print('0');
    	        }
        }
        System.out.println(' ');
    }"))

(defmethod java-parser-empty-method ((object java-table-atn-system))
  (format nil "~%~6Tpublic boolean empty(int index) {
         return index >= tableDataSize;~%~6T}"))

#|
(java-table-parser-variable-declarations *system*)
(java-table-parser-init-methods *system*)
(java-table-parser-init-calls *system*)
|#

(defmethod java-table-parser-variable-declarations ((object java-table-atn-system))
  (format nil "~%~A~%~A~%~A~%~A~%~A~%~A"
          (cell-values-array-decl-form object)
          (cell-precedence-array-decl-form object)
          (java-table-data-decl object)
          (java-table-data-size-decl object)
          (java-table-flags-decl object)
          (java-table-columns-decl object)))

(defmethod java-table-flags-decl ((object java-table-atn-system))
  (format nil "~%~6Tpublic static boolean[] flags;"))

(defmethod java-table-columns-decl ((object java-table-atn-system))
  (format nil "~%~6Tpublic static int columns = ~D;"
          (getf (system-plist object) :columns)))

(defmethod java-table-parser-init-methods ((object java-table-atn-system))
  (format nil "~A~%~A~%~A"
          (java-cell-values-array-init-method object)
          (java-cell-precedence-array-init-method object)
          (java-table-data-init-method object)))

(defmethod java-table-parser-init-calls ((object java-table-atn-system))
  (format nil "
       initCellValues();
       initPrecedenceArray();
       initTableData();~%"))

;;; Zellwerte-Tabelle (class variable)
;;; jeder Zelle wird ein String als Wert zugeordnet

(defmethod cell-values-array-decl-form ((system java-table-atn-system))
  (let ((plist (system-plist system)))
    (format nil "~6Tpublic static String[] cellValues = new String[~D];"
            (* (getf plist :columns) (getf plist :rows)))))

(defmethod java-cell-values-array-init-method ((system java-table-atn-system))
  (format nil "~%~6Tpublic static void initCellValues() {~A~%~9T}"
          (cell-values-array-init-form system)))

(defmethod cell-values-array-init-form ((system java-table-atn-system))
  (let* ((table-columns (getf (system-plist system) :columns))
         (predicates (atn-predicates (system-lexicon system)))
         (cells (loop for p in predicates append (category-elements p))))
    (flet ((cell-value-form (cell)
             (let ((index (cell-row-major-index cell table-columns))
                   (value (bnf-cell-value cell)))
               (format nil "cellValues[~D] = ~S" index value))))
      (format nil "~{~%~9T~A;~}" (mapcar #'cell-value-form cells)))))

;;; Zellordnungs-Array / Präzedenz-Array 

(defmethod java-cell-precedence-array-init-method ((system java-table-atn-system))
  (let ((order (collect-cell-indices-left-depth system)))
    (format nil "~%~6Tpublic static void initPrecedenceArray () {~{~%~9T~A~}~%~6T}"
            (loop for i from 0 to (- (length order) 1)
                  for cell in order
                  collect (format nil "cellPrecedence[~D] = ~D;" i cell)))))

(defmethod cell-precedence-array-decl-form ((system java-table-atn-system))
  (let ((size (length (collect-cell-indices-left-depth system))))
    (format nil "~6Tpublic static int[] cellPrecedence = new int[~D];" size)))

(defmethod collect-cell-indices-left-depth :around ((system java-table-atn-system))
  (or (getf (system-plist system) :cell-precedence-list)
      (let ((cpl (call-next-method)))
        (setf (getf (system-plist system) :cell-precedence-list) cpl)
        cpl)))
              
(defmethod collect-cell-indices-left-depth ((system java-table-atn-system))
  (let ((bnf-grammar (system-bnf-grammar system))
        (main-name (system-main-net-name system))
        (*table-columns (getf (system-plist system) :columns)))
    (declare (special *table-columns))
    (collect-cell-indices-left-depth (find-bnf-rule bnf-grammar main-name))))

(defmethod collect-cell-indices-left-depth ((object bnf-definition))
  (collect-cell-indices-left-depth (bnf-rhs object)))

(defmethod collect-cell-indices-left-depth (object)
  (declare (ignore object))
  nil)

(defmethod collect-cell-indices-left-depth ((object bnf-nonterminal-symbol))
  (collect-cell-indices-left-depth (bnf-definition object)))

(defmethod collect-cell-indices-left-depth ((object cons))
  (mapcan 'collect-cell-indices-left-depth object))

(defmethod collect-cell-indices-left-depth ((object bnf-one-expr))
  (collect-cell-indices-left-depth (bnf-expression object)))

(defmethod collect-cell-indices-left-depth ((object bnf-qexpr))
  (collect-cell-indices-left-depth (bnf-expression object)))

(defmethod collect-cell-indices-left-depth ((object bnf-group))
  (collect-cell-indices-left-depth (bnf-expressions object)))

(defmethod collect-cell-indices-left-depth ((object bnf-alternative))
  (collect-cell-indices-left-depth (bnf-expressions object)))

(defmethod collect-cell-indices-left-depth ((object bnf-table-cell))
  (declare (special *table-columns))
  (list (cell-row-major-index object *table-columns)))

(defmethod find-bnf-rule ((object bnf-grammar) name)
  (flet ((rule-name (rule) (bnf-name (bnf-lhs rule))))
    (find (string name) (bnf-phrase-rules object) :key #'rule-name :test #'equal)))

;;; Konvertierung der Eingabedaten

(defmethod java-table-data-decl ((object java-table-atn-system))
  (format nil "~6Tpublic static int[] tableData;"))

(defmethod java-table-data-size-decl ((object java-table-atn-system))
  (format nil "~6Tpublic static int tableDataSize;"))

;; aktuell nur für ParseableCharacterArray definiert
(defmethod java-table-data-init-method ((object java-table-atn-system))
  (let ((plist (system-plist object)))
    (format nil "
     public static void initTableData () {
      	Character[] cdata = (Character[])((ParseableCharacterArray)data).getData();
        tableData = new int[cdata.length];
        FlagTableConverter converter = new FlagTableConverter(cdata, ~D, ~D);
        flags = converter.convert();
        int tableDataIndex = 0;
        for (int i = 0; i < cellPrecedence.length; i++) {
            int nextIndex = cellPrecedence[i];
            if (flags[nextIndex]) {
               tableData[tableDataIndex] = nextIndex;
               tableDataIndex = tableDataIndex + 1;
            }
        }
        tableDataSize = tableDataIndex;
     }"
            (getf plist :rows)
            (getf plist :columns))))

;;;
;;; development utilities
;;;

(defmethod check-duplicate-nets ((system atn-system))
  (labels ((find-duplicate (net nets)
             (if nets
               (if (or (eq net (first nets))
                       (not (equal (atn-name net) (atn-name (first nets)))))
                 (find-duplicate net (rest nets))
                 t))))
    (loop with nets = (system-nets system)
          for net in nets
          if (find-duplicate net nets)
          collect net)))

(defun show-duplicated-symbols (nets)
  (format t "~%Folgende Symbole sind mehrfach definiert:")
  (dolist (net (remove-duplicates nets :test #'equal :key #'atn-name))
    (format t "~%~A" (atn-name net))))

;; (show-duplicated-symbols (check-duplicate-nets s))

#|
      public static boolean[] flags;
      public static int columns;

    public static void initTableData () {
      	Character[] cdata = (Character[])((ParseableCharacterArray)data).getData();
        tableData = new int[cdata.length];
        FlagTableConverter converter = new FlagTableConverter(cdata, 2, 32);
        
        // Variable Decl!
        flags = converter.convert();
        int tableDataIndex = 0;
        for (int i = 0; i < cellPrecedence.length; i++) {
            int nextIndex = cellPrecedence[i];
            if (flags[nextIndex]) {
               tableData[tableDataIndex] = nextIndex;
               tableDataIndex = tableDataIndex + 1;
            }
        }
        tableDataSize = tableDataIndex;
     }
     
     public void showData () {
     	((ParseableCharacterArray)data).showCharacterData();
     }
     
     public void showConvertedData () {
     		for (int i = 0; i < tableDataSize; i++) {
     		System.out.print("" + tableData[i]);
     	}
     }
      
     public void showFlags () {
    	for (int i = 0; i < flags.length; i++) {
    		if ((i % columns) == 0) {
    		    System.out.println(" ");
    	    }
    		if (flags[i]) {
    		   System.out.print("1");
    	    }
    	    else {
    	    	System.out.print("0");
    	    }
        }
    }
|#