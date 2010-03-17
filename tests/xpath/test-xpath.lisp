;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-path; -*-

(in-package "XML-PATH")

;; 20010529 
;; the parser produces an s-expression encoding of the path.
;; this is the same encoding used by the query processor.
;; the first section just illustrates use fo the tokenizer
;; the second demonstrates the raw parse results.
;; the third section applies the parse result to documents
;; 20030416
;; correction for *namespace-bindings*

;;
;; tokenizer tests - just for reference

(defmacro txt (string) `(xpath-tokenizer ,string))

(txt "../child::a.name.with.dots")



;;
;; parser tests

(defmacro txp (string &key trace (reduce t) production)
  `(let* ((string ,string)
          (*print-circle* t))
     (multiple-value-bind (result index complete)
                          (xpath-parser string
                                        :reduce ,reduce
                                        :trace ,trace
                                        ,@(when production
                                            `(:start-name ',production)))
       (pprint (list string index
                     (if complete complete (xpath-tokenizer string))
                     (or result (xpath-tokenizer string)))))
     (values)))

;; taking examples from REC-xpath-19991116.
;; mostly just as they appear in the text. some are augmented for additional
;; cases

(txp "child::bib")
(txp "child::*")
(txp "child::bib/child::book")
(txp "child::bib//*")
(txp "child::bib//self::*")
(txp "//self::*")
(txp "//self::author[last='Stevens']")
(txp "//self::author[last='Stevens']/..")
(txp "ancestor::node()")
(txp "//self::author[last='Stevens']/ancestor::node()")
(txp "/*/child::processing-instruction()")
(txp "child::processing-instruction()")
(txp "/*/child::processing-instruction('pi-2')")
(txp "self::text()")
(txp "child::bib//self::*/text()")
(txp "//self::comment()")
(txp "/*/child::comment()")
(txp "attribute::name")
(txp "attribute::*")
(txp "child::bib/child::book/attribute::year")
(txp "child::bib/child::book/attribute::*")
(txp "child::x:bib/child::x:book/attribute::year")
(txp "child::x:bib/child::x:book/attribute::year")
(txp "/")
(txp "/descendant::last")
(txp "/descendant::olist/child::item ")
(txp "child::*")
(txp "//book[@year='1999']/title/child::text()")
(txp "position()" )
(txp "child::bib/child::book[position()=2]")
(txp "/bib/child::book[position()>1]")

(txp "list[attribute(ordered)='yes']/item[first-of-type()]")
(txp "list[attribute('ordered')='yes']/item[first-of-type()]")
(txp "id('one')/item")
(txp "key('one','two')/item")
(txp "position()=1" :production |PredicateExpr|)
(txp "[position()=1]" :production |Predicate|)


#|
experiments with the following forms led to the implementation of a well-formed
subtree cache to save the results of an attempted parse for a given non-terminal.
by saving both successes and failures the resource consumption improved as shown.

|#
(time (txp "child::para[position()=last()]"))
; wo/wfst (6,014,464 bytes) (11.593 seconds)
; w/wfst (9,760 bytes) (0.048 seconds)

(time (txp "child::para[position()=last()-1]"))
; wo/wfst (6,016,224 bytes) (11.814 seconds)
; w/wfst (11,040 bytes) (0.059 seconds)

(txp "/bib/child::book[position()>1]" )
(txp "child::*[position()>1]" )
(txp "following-sibling::chapter[position()= 1]")
(txp "child::para[position()>1][position()=42]" )
(txp "/descendant::figure[position()=42]")
(txp "/child::doc/child::chapter[position()=5]/child::section[position()=2]")
(txp "child::para[attribute::type='warning']")
(txp "child::para[attribute::type=\"warning\"]")
(handler-case (txp "child::para[attribute::type=\"warning']") ; EOF error
  (error (c) (print c)))
(txp "child::para[attribute::type='warning'][position()=5]")
(txp "child::para[position()=5][attribute::type=\"warning\"]")
(txp "child::para[position()=5][attribute::type='warning or error']")
(txp "child::*[self::chapter or self::appendix]")
(txp "child::*[self::chapter or self::appendix][position()=last()]")
(txp "@*")
(txp "/@")
(txp "para[]") ; failed, which i think is correct, due to the null PredicateExpr
(txp "para[last()]")
(txp "/doc/chapter[5]/section[-2]")
(txp "/doc/chapter[5]/section[2]")
(txp "-2")
(txp "//olist/item")
(txp ".")
(txp ".//") ;incomplete
(txp "./") ;incomplete
(txp "./book")
(txp ".//last")
(txp "./@year")
(txp ".//@year")
(txp "..")
(txp "../last")
(txp "..//last")
(txp "../@") ;incomplete
(txp "../@year")
(txp "..//@year")
(txp "book/title")
(txp "book//last")
(txp "book[position()] ")
(txp "child::book[year] ")
(txp "book[@year and @isbn] ")
(txp "$x=\"foo\" ")
(txp "($x=\"foo\")")
(txp "a:not($x!=\"foo\")" )


;;
;; test parse and compilation/application
;; without namespaces

(setf (xpa:|document| "bib.xml")
      (xmlp::document-parser
"<!DOCTYPE bib [
  <!ELEMENT bib  (book* )>
  <!ELEMENT book  (title,  (author+ | editor+ ), publisher, price )>
  <!ATTLIST book  year CDATA  #REQUIRED
                  isbn CDATA  #IMPLIED >
  <!ELEMENT author  (last, first )>
  <!ELEMENT editor  (last, first, affiliation )>
  <!ELEMENT title  (#PCDATA )>
  <!ELEMENT last  (#PCDATA )>
  <!ELEMENT first  (#PCDATA )>
  <!ELEMENT affiliation  (#PCDATA )>
  <!ELEMENT publisher  (#PCDATA )>
  <!ELEMENT price  (#PCDATA )>
  ]>
<bib>
    <?pi-1 with a processing instruction?>
    <!-- first comment -->
    <book year='1994' isbn='1-94567-890-1'>
        <title>TCP/IP Illustrated</title>
        <author><last>Stevens</last><first>W.</first></author>
        <publisher>Addison-Wesley</publisher>
        <price> 65.95</price>
    </book>
 
    <?pi-2 with a processing instruction?>
    <!-- second comment -->
    <book year='1992' isbn='1-94567-890-2'>
        <title>Advanced Programming in the Unix environment</title>
        <author><last>Stevens</last><first>W.</first></author>
        <publisher>Addison-Wesley</publisher>
        <price>65.95</price>
    </book>
 
    <book year='2000'>
        <title>Data on the Web</title>
        <author><last>Abiteboul</last><first>Serge</first></author>
        <author><last>Buneman</last><first>Peter</first></author>
        <author><last>Suciu</last><first>Dan</first></author>
        <publisher>Morgan Kaufmann Publishers</publisher>
        <price> 39.95</price>
    </book>
 
    <book year='1999'>
        <title>The Economics of Technology and Content for Digital TV</title>
        <editor>
               <last>Gerbarg</last><first>Darcy</first>
                <affiliation>CITI</affiliation>
        </editor>
            <publisher>Kluwer Academic Publishers</publisher>
        <price>129.95</price>
    </book>
 
</bib>
"))

(setf (xpa:|document| "http://www.bn.com") (xpa:|document| "bib.xml"))

(inspect (xpa:|document| "bib.xml"))

;; with namespaces

(setf (xpa:|document| "bib-ns.xml")
      (xmlp::document-parser
"<!DOCTYPE bib [
  <!ELEMENT bib  (book* )>
  <!ATTLIST bib xmlns CDATA 'ns1'>
  <!ELEMENT book   (#PCDATA )>
  <!ATTLIST book  year CDATA  #REQUIRED
                  isbn CDATA  #IMPLIED >
  ]>
<bib>
    <?pi-1 with a processing instruction?>
    <!-- first comment -->
    <book year='1994' isbn='1-94567-890-1'>
        TCP/IP Illustrated
    </book>
 
    <?pi-2 with a processing instruction?>
    <!-- second comment -->
    <book year='1992' isbn='1-94567-890-2'>
        Advanced Programming in the Unix environment
    </book>
 
    <book year='2000'>
        Data on the Web
    </book>
 
    <book year='1999'>
        The Economics of Technology and Content for Digital TV
    </book>
</bib>
"))


(defun txa (string target &key trace production pprint &aux path-function)
  (multiple-value-bind (result index complete)
                       (apply #'xpath-parser string
                              :trace trace
                              (when production
                                (list :start-name production)))
    (when pprint (pprint result))
    (cond (complete
           (setf path-function (eval result))
           (xpa::call-with-collector (funcall path-function target)))
          (t
           (pprint (list string index (xpath-tokenizer string)
                         result))))))

(txa "child::bib" (xpa:|document| "bib.xml"))
(txa "child::*" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book" (xpa:|document| "bib.xml"))
(txa "child::bib/child::*" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book/child::title" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book/child::*" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book/*" (xpa:|document| "bib.xml"))
;; note that the two below yield different results
(txa "child::bib//*" (xpa:|document| "bib.xml"))
(txa "child::bib//self::*" (xpa:|document| "bib.xml"))
(txa "//self::author[last='Stevens']" (xpa:|document| "bib.xml"))
(txa "//self::author[last='Stevens']/.." (xpa:|document| "bib.xml"))
(txa "ancestor::node()" (xpa:|document| "bib.xml")) ; => NIL
(txa "//self::author[last='Stevens']/ancestor::node()" (xpa:|document| "bib.xml"))
(txa "/*/child::processing-instruction()" (xpa:|document| "bib.xml"))
(txa "/*/child::processing-instruction('pi-2')" (xpa:|document| "bib.xml"))
(txa "self::text()" (xpa:|document| "bib.xml")) ; => NIL
(txa "child::bib//self::*/text()" (xpa:|document| "bib.xml"))
(txa "//self::comment()" (xpa:|document| "bib.xml"))
(txa "/*/child::comment()" (xpa:|document| "bib.xml"))
(txa "attribute::name" (xpa:|document| "bib.xml"))  ; => NIL
(txa "attribute::*" (xpa:|document| "bib.xml")) ; => NIL
(txa "child::bib/child::book/attribute::year" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book/attribute::*" (xpa:|document| "bib.xml"))
(let ((*namespace-bindings* (acons '{xmlns}x (find-namespace "ns1") nil)))
  (txa "child::x:bib/child::x:book/attribute::year" (xpa:|document| "bib-ns.xml")))
(txa "/" (xpa:|document| "bib.xml"))
(txa "/descendant::last" (xpa:|document| "bib.xml"))
(txa "/descendant::author/child::first " (xpa:|document| "bib.xml"))
(txa "child::*" (xpa:|document| "bib.xml"))
(txa "//book[@year='1999']/title/child::text()" (xpa:|document| "bib.xml"))
(txa "position()" (xpa:|document| "bib.xml")) ; => (0) means without context
(txa "child::bib/child::book[position()=2]" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book" (xpa:|document| "bib.xml"))
(txa "child::bib/child::book[position() mod 2 = 1]" (xpa:|document| "bib.xml"))

; no functions
; (txa "list[attribute(ordered)='yes']/item[first-of-type()]")
; (txa "list[attribute('ordered')='yes']/item[first-of-type()]")
; (txa "id('one')/item")
; (txa "key('one','two')/item")

(txa "/bib/child::book[position()>1]" (xpa:|document| "bib.xml"))

;; application to clos objects

(defClass clos-document () ((||::|bib| :initarg :bib)))
(defClass clos-bib () ((||::|book| :initarg :book)))

(txa "/bib/child::book[position()=1]"
     (make-instance 'clos-document
       :bib (make-instance 'clos-bib :book "a book"))
     :pprint t)


:EOF
