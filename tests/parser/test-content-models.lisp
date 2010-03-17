;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

;;
;;
;; some examples for parsing content models
;; 20010915 0.915

;;
;; an example of the raw results from the bnf parser

(bnfp::callparser 'bnfp::ebnf (bnfp::bnf-reader "a ::= (s | d)"))

#|
{46} ContentSpec ::= EMPTY | ANY | Mixed | Children
{47} Children ::= (Choice | Seq) Cardinality?
{48} Cp ::= ( QName | Choice | Seq) Cardinality?
{49} Choice ::= '(' S? Cp ( S? '|' S?  Cp )+ S? ')'
{50} Seq ::= '(' S? Cp ( S? ',' S? Cp )* S? ')'
{51} Mixed ::=  ( '(' S? PCDATA ( S? '|' S? QName )* S? ')' '*' ) | ( '(' S? PCDATA S? ')' )
     Cardinality ::= '?' | '+' | '*'
|#

;;
;; examples for content models. the (value ...) call causes the model to be compiled
;; into an atn.

(inspect (mapcar #'(lambda (e &aux (*namespace-bindings* (make-document-namespace-bindings)))
                     (let ((parse
                            (ignore-errors
                             (document-parser e :start-name '|ExtSubsetDecl|))))
                       `(,e ,parse ,(ignore-errors (when parse (value parse))))))
                 '("<!ELEMENT alpha ANY>"
                   "<!ELEMENT beta EMPTY >"
                   "<!ELEMENT gamma (#PCDATA) >"
                   "<!ELEMENT gamma (#PCDATA|a|b|c|d)* >"
                   "<!ELEMENT a (a*)>"
                   "<!ELEMENT b ((b|a?)*)>"
                   "<!ELEMENT c ((a,b))>"
                   "<!ELEMENT d (doc*)>"
                   "<!ELEMENT e (doc+)>"
                   "<!ELEMENT f (doc?)>"
                   "<!ELEMENT g ((a,b)*)>"
                   "<!ELEMENT g (a,b)* >"
                   "<!ELEMENT h ((a,b)?)>"
                   "<!ELEMENT i ((a,b)+)>")))

(inspect (document-parser "<!DOCTYPE doc [
 <!ELEMENT doc (A*)>
 <!ELEMENT A EMPTY>
 <!ATTLIST A att NMTOKENS #IMPLIED>
 ]> <doc> <A att='abc / def'/>
 </doc>
" :reduce t))

(document-parser "<!ELEMENT g (#PCDATA|a|b|c|d)* >" :reduce t  :start-name '|ExtSubsetDecl|)
(document-parser "<!ELEMENT g ANY >" :reduce t :trace nil :start-name '|ExtSubsetDecl|)
(document-parser "<!ELEMENT g EMPTY >" :reduce t :trace nil :start-name '|ExtSubsetDecl|)
(document-parser "<!ELEMENT g (a,b)* >" :reduce t :trace nil :start-name '|ExtSubsetDecl|)


:EOF
