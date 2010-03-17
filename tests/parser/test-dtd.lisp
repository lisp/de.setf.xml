;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")

#|
 <DOCUMENTATION>
  <DESCRIPTION>
   examples for operations on a complete DTD.
   they include several in-line examples, invocations to parse several included dtd files
   and an invocation for the somewhat larger dtd from docbook.
   </DESCRIPTION>
  </DOCUMENTATION>
|#


;; 20010914 0.913
;; 20020125 0.919
;;
;; simple test of qualified name resolution

(defParameter *dtd-dom-1* nil)
(defParameter *dtd-definition-string-1*
"<?xml version=\"1.0\"?>
<!DOCTYPE doc [
 <!ENTITY % one 'CDATA'>
 <!ENTITY % two 'pre:A'>
 <!ENTITY % three '<!ELEMENT aFreeElement ANY >' >
 <!ELEMENT doc (pre:aDocElement*)>
 %three;
 <!ELEMENT pre:aDocElement EMPTY>
 <!ATTLIST pre:aDocElement
           not        NOTATION  (linespecific) 'linespecific'
           xmlns:pre  %one;     'pre space'
           xmlns      %one;     'pre space'
           att1       NMTOKENS  'pre:asdf'
           att2       CDATA     #REQUIRED
           att3       IDREFS    #FIXED 'id1 id2'
           att4       CDATA     #FIXED 'value att4'
           att5       CDATA     'value att5' >
 ]> <doc> <pre:aDocElement att5='abc / def' />
 </doc>
")

(handler-case (document-parser *dtd-definition-string-1*)
  (error (condition)
         (format *trace-output* "~%as expected, %entity in internal subset -> ~s."
                 condition)))

(let ((xutils::|REC-xml-19980210.PEs in Internal Subset| nil))
  (setq *dtd-dom-1* (document-parser *dtd-definition-string-1*)))

(flet ((test-serialization (*xml-writer-dtd-order*)
         (format *trace-output* "~%~%dtd serialization with order ~s:~%"
                 *xml-writer-dtd-order*)
         (write-node *dtd-dom-1* *trace-output* :encoding :iso-8859-1)))
  (test-serialization :unspecified)
  (test-serialization :alphabetical)
  (test-serialization :ordinality)
  (test-serialization :content))


;; parse various document definitions. for the first one, check that the names
;; are resolved by locating the top element

(format *trace-output* "~%defining the namespace {-//mecomnet.de//DTD Lisp (sort of)//en}.")
(defParameter *lisp-namespace*
 (find-namespace "-//mecomnet.de//DTD Lisp (sort of)//en" :if-does-not-exist :create
                 :nicknames '("LISP")
                 :permission :read-write :shadow nil))

(defParameter *dtd-dom-2* nil)
(defParameter *dtd-definition-string-2*
"<?xml version='1.0' standalone='no' ?>
<!DOCTYPE LISP SYSTEM 'lisp.dtd' [
  <!ATTLIST LISP
            xmlns  CDATA  '-//mecomnet.de//DTD Lisp (sort of)//en'>
  ]>
<LISP xmlns='-//mecomnet.de//DTD Lisp (sort of)//en'>
 <DEFPARAMETER> <NAME>testing</NAME><!-- a comment -->
  <VALUE>one two three</VALUE> </DEFPARAMETER>
 </LISP>")

(format *trace-output* "~%~%initial, empty namespace: ~a" *lisp-namespace*)
(format *trace-output* "~%~%combines with the document~%~a~%==>" *dtd-definition-string-2*)

(let ((*xml-base* (pathname-file-url #p"xml:tests;xml;")))
  (setq *dtd-dom-2* (document-parser *dtd-definition-string-2*)))

(format *trace-output* "~%parsed to produce:")
(describe *dtd-dom-2*)
(format *trace-output* "~%~%and to extend the namespace: ~a" *lisp-namespace*)
(describe *lisp-namespace*)


(flet ((print-a-definition (name &aux (def-node (find-def-elem-type name *dtd-dom-2*)))
         (cond (def-node
                 (format *trace-output* "~%~%~s element definition:" name)
                 (let ((*xml-writer-dtd-order* :unspecified))
                   (format *trace-output* "~%~%element definition only:~%")
                   (write-node def-node *trace-output* :encoding :iso-8859-1))
                 (let ((*xml-writer-dtd-order* :content))
                   (format *trace-output* "~%~%element definition and its content:~%")
                   (write-node def-node *trace-output* :encoding :iso-8859-1)))
               (t
                (warn "no definition for ~s: ~s." name *dtd-dom-2*)))))
  (print-a-definition '{-//mecomnet.de//DTD Lisp (sort of)//en}LISP)
  ;; note the addition to the default namespace bindings, as it is included the
  ;; definition for the root element only
  (print-a-definition '{-//mecomnet.de//DTD Lisp (sort of)//en}ARGUMENT-LIST))



(flet ((do-parse (pathname)
         (format *trace-output* "~%~%~a~%==>" pathname)
         (handler-case 
           (describe (parse-external-subset-toplevel pathname))
           (error (condition)
                  (warn "parse failed: ~s:~%~a." pathname condition)))))
  (map nil #'do-parse '(#p"xml:tests;xml;shakespeare.dtd"
                        #p"xml:tests;xml;old-testament.dtd"
                        #p"xml:tests;xml;aramaic.dtd")))
;(inspect (parse-external-subset-toplevel #p"xml:tests;xml;shakespeare.dtd"))
;(inspect (parse-external-subset-toplevel #p"xml:tests;xml;old-testament.dtd"))
;(inspect (parse-external-subset-toplevel #p"xml:tests;xml;aramaic.dtd"))



;; a test for conditional sections
;; nb. the data url syntax for '%' requires escaping

(defParameter *dtd-definition-string-3*
"<!ENTITY % ISOamsa.module 'INCLUDE'>
 <!--when included, there are five children in the resulting subset-->
 <![%ISOamsa.module;[
 <!ENTITY % ISOamsa PUBLIC
 'ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN'
 'data:,<!ENTITY %25 dummy \"\">'>
 %ISOamsa;
 <!--end of ISOamsa.module-->]]>")

(defParameter *dtd-definition-string-4*
"<!ENTITY % ISOamsa.module 'IGNORE'>
 <![%ISOamsa.module;[
 <!--when ignoerd, there is only one-->
 <!ENTITY % ISOamsa PUBLIC
 'ISO 8879:1986//ENTITIES Added Math Symbols: Arrow Relations//EN'
 'data:,<!ENTITY %25 dummy \"\">'>
 %ISOamsa;
 <!--end of ISOamsa.module-->]]>")

(format *trace-output* "~%~%test INCLUDE / IGNORE:")
(flet ((do-parse (string count &aux node)
         (format *trace-output* "~%~%~a~%==>" string)
         (handler-case (progn (setf node (parse-external-subset-toplevel string))
                              (format *trace-output*
                                      "~% ~d-child content is ~:[incorrect~;correct~]:"
                                      (length (children node))
                                      (= (length (children node)) count))
                              (dolist (node (children node))
                                (terpri *trace-output*)
                                (write-node node *trace-output*)))
           (error (condition)
                  (warn "parse failed:~%~a." condition)))))
  (do-parse *dtd-definition-string-3* 5)
  (do-parse *dtd-definition-string-4* 1))



#|
;; the docbook dtd itself.

(time
(inspect
(multiple-value-list
 (parse-external-subset-toplevel
  #p"www:dokumente:standards:xml:Altheim:docbook:0.7:db3xml07.dtd"
  :bind-definitions t))))

(time
(inspect
(parse-external-subset-toplevel
 #p"www:dokumente:standards:xml:Altheim:docbook:0.7:db3xml07.dtd"
 :intern-names nil)))


result of docbook:

(INSPECT (PARSE-EXTERNAL-SUBSET-TOPLEVEL #P"www:dokumente:standards:xml:Altheim:docbook:0.7:db3xml07.dtd")) took 255,854 milliseconds (255.854 seconds) to run.
Of that, 7,731 milliseconds (7.731 seconds) were spent in The Cooperative Multitasking Experience.
34,688 milliseconds (34.688 seconds) was spent in GC.
 1,479,510,080 bytes of memory allocated.
#<INSPECTOR-WINDOW "(|ExtSubsetDeclSequence| (#<COMMENT-NODE #x7É" #x7D3BBD6>
? (gc)
NIL
? (room)
There are at least 50,688,472 bytes of available RAM.

                  Total Size             Free                 Used
Mac Heap:      3423096 (3342K)      1111600 (1085K)      2311496 (2258K)
Lisp Heap:    61883768 (60433K)     49576872 (48415K)     12306896 (12018K)
Stacks:         215808 (211K)        210816 (206K)          4992 (5K)
Static:         283040 (276K)             0 (0K)          283040 (276K)

can't really be read separately as it depends on entities from the main
(document-parser #p"www:dokumente:standards:xml:Altheim:docbook:0.7:dbpoolx.mod"
                   :start-name '|ExtSubset|))


;; rlf example

(setq *doc-with-definition-string*
"<?xml version='1.0'?>
<!DOCTYPE tar [
  <!ELEMENT tar EMPTY>
  <!ATTLIST tar
       attributeFormDefault  (qualified | unqualified) 'unqualified'
       blockDefault CDATA ''
       lang CDATA #IMPLIED
       xml:lang CDATA #IMPLIED
       finalDefault CDATA ''
       id ID #IMPLIED
       ID IDREF #IMPLIED
       version CDATA #IMPLIED
       xml:version CDATA #REQUIRED
       xmlns:fred CDATA #FIXED 'http://www.whatever/fred'
       xmlns CDATA #FIXED 'http://www.whatever/xx'>
 ]> <tar/>
")
(setq *a-dom* (document-parser *doc-with-definition-string*))
(inspect *a-dom*)
(write-node *a-dom* *trace-output*)

|#


:EOF
