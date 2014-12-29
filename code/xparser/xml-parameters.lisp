;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  parameter and type definitions for the xml query data model and parser
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010501' AUTHOR='JAA'>
   factored from as separate file for XML parser</DELTA>
  <DELTA DATE='20010530' VERSION='0.905'>
   first combined version with xpath/xquery</DELTA>
  <DELTA DATE='20010605' VERSION='0.907'>
   Lispworks support</DELTA>
  <DELTA DATE='20010608' VERSION='0.908'>
   CL-HTTP in ALLEGRO</DELTA>
  <DELTA DATE='20010615'>added encoding alternatives vis *ENCODING-MAP*</DELTA>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010622'>eliminated *qname-contexts* as global</DELTA>
  <DELTA DATE='20010623'>
   <code>*XML-VERSION*</code> for <code>|WFC: Version Match</code></DELTA>
  <DELTA DATE='20010625'>*node-cache* to support recursive DTD printing</DELTA>
  <DELTA DATE='20010707'>htm l namespace</DELTA>
  <DELTA DATE='20010716'>namespace/package distinction;
   parameters for node instantiation dispatch</DELTA>
  <DELTA DATE='20010720' VERSION='0.910'>context-guided parsing</DELTA>
  <DELTA DATE='20010722'><code>*DEFAULT-NAMSEPACES*</code> to xqdm-parameters
   </DELTA>
  <DELTA DATE='20010910' VERSION='0.912'>tokenizers</DELTA>
  <DELTA DATE='20010915' VERSION='0.913'/>
  <DELTA DATE='20010917' VERSION='0.914'>0.912+lw/allegro tests</DELTA>
  <DELTA DATE='20010918' VERSION='0.915'>first-level tokenization</DELTA>
  <DELTA DATE='20011203' VERSION='0.916'>fixes for instance name compilation</DELTA>
  <DELTA DATE='20011203' VERSION='0.917'>additional portability fixes</DELTA>
  <DELTA DATE='20020120' VERSION='0.918'>LispWorks,Allegro with oasis tests</DELTA>
  <DELTA DATE='20030328' VERSION='0.949'>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")

(defParameter *version* "0.949")
(defParameter *xml-version* "1.0")
(defParameter *xml-versions* '("1.0")
  "binds a list of supported versions.")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defTokens
    "'" "\"" "<" "</" "<?" "<!" "<!--" "<![" "-->" "?>" "]]>" "/>" ">"
    "&" "&#" "&#x" "%" ":" ";" " " "<![CDATA["
    "(" ")" ")*" "[" "]" "|" "," "?" "+" "*" "="
    "<?xml"
    "<!ATTLIST" "<!DOCTYPE" "<!ELEMENT" "<!ENTITY" "<!NOTATION"
    "ANY" "CDATA" "EMPTY" "encoding"
    "ENTITY" "ENTITIES"
    "ID" "IDREF" "IDREFS"  "INCLUDE" "IGNORE" "lang" "NDATA" "NMTOKEN" "NMTOKENS"
    "no" "NOTATION" "PUBLIC" "standalone" "SYSTEM" "version" "xml" "yes"
    "#FIXED" "#IMPLIED" "#PCDATA" "#REQUIRED"))

;; see the defConstructor macro for class parameters generation

(defVar *node-level* 0
  "binds the recursion leve when printing elements to govern indentation")
(defVar *node-cache* nil
  "binds the collection of printed definition nodes when printing a DTD.")
(defVar *prefix-count* 0
  "binds a prefix count to use when dynamically generating prefixes during
   serialization.")
(defVar *writer-function nil
  "binds the encoding function while encoding documents / nodes.")
(defVar *writer-arg nil)

(defParameter *processor* nil)

(defParameter *quote-token* nil
  "binds the current quote delimiter while in a literal. bound to <code>T</code>
   when expecting a literal and <code>NIL</code> otherwise.")
(defParameter *ignore-whitespace* nil
  "controls whether the parser includes or ignores whitespace.
   this is <em>not</em> the same as the notion of ignorable whitespace
   which is related to the space attribute. that case refers to how the
   application should treat character content. in this case, the space is
   destructively ignored by the parser.")
(defVar *xml-input )
(defVar *xml-lexical-context* nil
  "binds the name of the current lexical context when within the parser")
(defParameter *xml-token-stack* (make-array 4 :adjustable t :fill-pointer 0)
  "binds an adjustable vector within the parser to hold deferred tokens .")
(defVar *input-column* 0)
(defVar *input-line* 0)

;;
;;
;; global definitions.
;; they are bound during a parse to hashtables to be integrated into the result document.
;; the general entity table has a default value which binds the implicitly defined entities
;; lt, gt, amp, apos, and quot. these definitionas are copied into each parsed document.
;; the other default values are null, which means the aprsed document start with no other
;; definitions.

(defParameter *attributes* nil)

(defParameter *construction-context* nil
  "binds a dispatching context for element instantiation.
   the initial value is the *document* binding. each successive, nested
   element supplants that binding, to be supplanted, in turn, by the respective
   element type definition.")

(defParameter *general-entities* (make-hash-table :test #'eq)
  "the global definition provides defaults for the base character
   entities. these definitions are copied into each parsed document to serve
   as the defaults. if rebound to nil, the document starts with no defaults.")

(defParameter *in-dtd* nil
  "bound to <code>T</code> when parsing the internal and external subset.
   this determines how names are handled when processing namespaces.")

(defParameter *in-internal-subset* nil
  "bound to <code>T</code> when parsing the internal subset.
   this determines how parameter entities are treated.")

(defParameter *in-decl-sep* nil
  "within the internal subset, is bound to <code>T</code> to permit distinct declarations
   to be replaced by a parameter entity.")

(defParameter *in-entity-value* nil
  "bound to <code>T</code> when parsing an entity value. used when constructing
   a token to decide that it should be directly re-readable.")

(defParameter *in-name-token* nil
  "bound to <code>T</code> when parsing an name token.
   used when constructing the token to decide whether to use the tokenizer or
   to resource a string for character data.")

(defParameter *entity-declarations* nil
  "accumulates all declarations within a given physical entity. 
   see <code>*ENTITY-DECLARATION-STACK*</code>.")

(defParameter *empty-identifier-namestrings* nil
  "binds the namestrings for identifiers which should emulate empty html tags.
   see html-parser.lisp")

(defParameter *permit-dtd-schema-extensions* nil
  "indicates whether dtd processing should permit extensions for
   schema datatypes. (default NIL)")

(defParameter *processing-instructions* (make-hash-table)
  "binds pi target names to processing functions.
   the function should two arguments, the target name and the string value.")

(defParameter *default-utf-16-encoding* :UTF-16-12)
(defParameter *default-character-encoding* :ISO-8859-1)
(defParameter *default-binary-encoding* :UTF-8)

(defParameter *permit-unescaped-urls* nil
  "where non-null, a well-formedness constraint on &<name>= is suppressed
   to permit non-encoded urls.")

(defParameter *root-def-type* nil
  "bound during processing of the doctype. indicates whether a deftype
   is present for the root element.
   if present, it serves as the source for the null namespace binding.")

(defParameter *xml-writer-stream* nil
  "binds a stream as interface to the encoding functions for use with format.")

(defParameter *xml-escaped-writer-stream* nil
  "binds an escaped stream as interface to the encoding functions for use with format.")


;; 0.950
(defParameter *xml-output* nil)
(defParameter *output-encoding* nil)

;; keep strings for name tokens in a cache. strings over a maximum length
;; are garbage collected.

(defConstant *buffer-string-size-limit* 64)

(defParameter *buffer-strings* (make-array *buffer-string-size-limit*
                                           :initial-element nil))

(defun buffer-string-subseq (string start &optional (end (length string))
                                    &aux (length (- end start))
                                    (result (get-buffer-string length)))
  (declare (type simple-string string result)
           (optimize (speed 3) (safety 0))
           (type simple-string result))
  (replace result string :start2 start :end2 end))

(defun adjustable-string-subseq (string start &optional (end (length string))
                                    &aux (length (- end start))
                                    (result (get-buffer-string length)))
  (declare (type (vector character) string)
           (type simple-string result)
           (optimize (speed 3) (safety 0))
           (type simple-string result))
  (replace result string :start2 start :end2 end))


(defun get-buffer-string (size &aux entry first)
  (declare (type fixnum size *buffer-string-size-limit*)
           (type simple-vector *buffer-strings*)
           (optimize (speed 3) (safety 0))
           (inline first rest))
  (if (> size 0)
    (cond ((and (< size *buffer-string-size-limit*)
                (setf entry (svref *buffer-strings* size)))
           (setf first (first (the cons entry)))
           (setf (svref *buffer-strings* size) (rest (the cons entry)))
           first)
          (t
           ; specify the type sufficient for all characters
           (make-string size :element-type 'character)))
    ""))

(defun return-buffer-string (string &aux (size (length string)))
  (declare (type fixnum size *buffer-string-size-limit*)
           (type simple-vector *buffer-strings*)
           (optimize (speed 3) (safety 0)))
  (when (< size *buffer-string-size-limit*)
    (setf (svref *buffer-strings* size)
          (cons string (the list (svref *buffer-strings* size))))))

;; from tests with tokenizer
;; (defun return-buffer-string (string) string)

;;
;;
;; parser state

;;(defParameter *input-start* nil)
;;(defParameter *input-fill* nil)
(defParameter *token-start* nil
  "binds a token construction buffer. this is a list of input bytes which is extended as
   the token grows.")
(defParameter *token-fill* nil
  "binds a pointer into the token construction buffer at the position into which
   the next input is to be placed. initially identical with *token-start*.")
(defParameter *token-end* nil
  "binds a pointer to the last byte of an in-progress token.
   a null value implies no token yet.")
(defParameter *name-start* nil
  "binds a construction buffer for entity reference names.
   this is behaves like the general token buffer.")
(defParameter *name-fill* nil
  "see *name-start*.")

(declaim (type (integer 0 #.(1- array-dimension-limit)) *name-length*))
(defParameter *name-length* 0
  "see *name-start*.")

(defParameter *name-tokenizer* nil
  "binds the name tokenizer for a given parser invocation.")

(defParameter *input-name-buffer* nil)
(defParameter *input-reader* nil)
(defParameter *input-peeker* nil)
(defParameter *input-reader-arg* nil)
(defParameter *input-datum* nil)
(defParameter *reinput-datum* nil)
(defParameter *input-source-stack* nil)
(defParameter *input-encoding* nil)
(defParameter *input-eof* nil)
(defParameter *token-length* 0)
(defun in-dtd? ()
  *in-dtd*)
(defun in-entity-reference? ()
  (plusp (fill-pointer *input-source-stack*)))
(defun in-literal? (&optional delimiter)
  ;; means currently within any literal string
  (if delimiter
    (eq *quote-token* delimiter)
    (if (eq *quote-token* |xml|::|'|)
      t
      (if (eq *quote-token* |xml|::|"|)
      t))))
(defun in-entity-value? ()
  ;; means currently parsing the literal value for an entity definition
  *in-entity-value*)
(defun in-name-token? ()
  ;; means that the collected token is intended to be a name
  *in-name-token*)
(defParameter *literal-entity-level* 0)
(defun in-literal-entity-reference? () (> *literal-entity-level* 0))

;;
;;
;; setup initial state

(mapc #'(lambda (binding &aux entity)
          (destructuring-bind (name . value) binding
            (setf name (intern-name name ""))
            (setf entity (make-instance 'def-internal-general-entity
                           :name name :children value :extent :static))
            (setf (gethash name *general-entities*) entity)))
      '(("lt"  #.(char-code #\<))
        ("gt" #.(char-code #\>))
        ("amp" #.(char-code #\&))
        ("apos" #.(char-code #\'))
        ("quot" #.(char-code #\"))))

:EOF
