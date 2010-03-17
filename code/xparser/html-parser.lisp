;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

#|
<DOCUMENTATION>
 <DESCRIPTION>
  bnf-driven parser for XML.
  </DESCRIPTION>
 <COPYRIGHT YEAR='2001' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' />
 <CHRONOLOGY>
  <DELTA DATE='20010618'>xutils:*parsetable*</DELTA>
  <DELTA DATE='20010621'>
   corrected *XML-BASE* bindings to follow 4.2.2 - that is to always rebind.
   </DELTA>
  <DELTA DATE='20010627'>eliminated <code>WITH-DOCUMENT-ENVIRONMENT</code>,
   as it was used once only.</DELTA>
  <DELTA DATE='20010629'>augmented parse context with a qname extent id
   </DELTA>
  <DELTA DATE='20010704'><code>*VERBOSE-QNAME*</code> keyword for
   <code>DOCUMENT-PARSER</code></DELTA>
  <DELTA DATE='20010716'>name/symbol distinction;
   *construction-context* bound for |Element| parse function</DELTA>
  <DELTA DATE='20010902'>manage *in-name-token* to support name tokenizer</DELTA>
  <DELTA DATE='20010906'>trim string argument to <code>document-parser</code></DELTA>
  <DELTA DATE='20010913'>extended <code>parse-external-subset-toplevel</code> to include
   qname-to-uname interning</DELTA>
  <DELTA DATE='20010917'>added :compile-toplevel to eval-when for classes</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package "XML-PARSER")

;; terminal primitives 

(eval-when (:compile-toplevel :load-toplevel :execute)

(defun |IS-HtmlGIQNameCharData| (x)
  (when *empty-identifier-namestrings*
    (and (string x) (find x *empty-identifier-namestrings* :test #'string-equal))))

) ;; eval-when

(export '(html-document-parser) "XMLP")

(defParameter *html-general-entities* (copy-definitions *general-entities*))

(mapc #'(lambda (binding &aux entity)
          (destructuring-bind (name . value) binding
            (setf name (intern-name name ""))
            (setf entity (make-instance 'def-internal-general-entity
                           :name name :children value :extent :static))
            (setf (gethash name *html-general-entities*) entity)))
      '(("nbsp"  160)))

;;
;;
;; additional constructors

(defConstructor |ElementHtml-Constructor| (content* etag html-tag stag)
  (|Element-Constructor| *construction-context* content* etag (or html-tag stag)))

(defConstructor |HtmlDocument| (&rest args)
  (apply #'|Document-Constructor| *construction-context* args))

(defConstructor |HtmlGIQName| (name)
  #|(when *last-identifier-namestring*
    (when (> (length name) (array-total-size *last-identifier-namestring*))
      (adjust-array *last-identifier-namestring* (length name)))
    (setf (fill-pointer *last-identifier-namestring*) (length name))
    (dotimes (i (length name))
      (setf (char *last-identifier-namestring* i)
            (char name i)))
    (print *last-identifier-namestring*))|#
  name)

(defConstructor |HtmlTag| (attribute-sequence qname)
  (|STag-Constructor| *construction-context* attribute-sequence qname))

;;
;;
;; compilation with alternative grammar

(def-parsetable (|HtmlDocument| xml-parsetable)        markup-context-wo-references tokenized-whitespace)
(def-parsetable (|HtmlTag| xml-parsetable)            tag-content tokenized-whitespace)

(eval-when (:compile-toplevel)
  (let* ((*class.atn* 'xqdm-atn)
         (*class.atn-node* 'xqdm-atn-node)
         (*class.cat-atn-edge* 'xqdm-cat-atn-edge)
         (*class.pop-atn-edge* 'xqdm-pop-atn-edge)
         (*class.push-atn-edge* 'xqdm-push-atn-edge)
         (*class.test-atn-edge* 'xqdm-test-atn-edge))
    (bnfp:compile-atn-system #p"xml:html-grammar.bnf"
                             :compile t
                             ;; don't load directly - leave that to the app
                             ;; :load t
                             :package *token-package*
                             :fasl-pathname "xml:code;atn-lib;html-grammar.bin"
                             :source-pathname "xml:code;atn-lib;html-grammar.lisp"
                             :input-function 'input-reference
                             :input-eof-function 'input-eof?
                             :trace nil))
  )


(eval-when  (:load-toplevel)
  (cl-user::conditional-load-file "xml:code;atn-lib;html-grammar"))

(eval-when (:execute)
  (let ((*class.atn* 'xqdm-atn)
        (*class.atn-node* 'xqdm-atn-node)
        (*class.cat-atn-edge* 'xqdm-cat-atn-edge)
        (*class.pop-atn-edge* 'xqdm-pop-atn-edge)
        (*class.push-atn-edge* 'xqdm-push-atn-edge)
        (*class.test-atn-edge* 'xqdm-test-atn-edge))
    (bnfp:compile-atn-system #p"xml:html-grammar.bnf"
                             :execute t :compile nil
                             :package *token-package*
                             :source-pathname "xml:code;atn-lib;html-grammar.lisp"
                             :input-function 'input-reference
                             :input-eof-function 'input-eof?
                             :trace nil))
  )


;;
;;           
;;


;;
;;
;;

(defMethod html-document-parser ((input string) &rest args)
  (when (and (plusp (length input)) (xml-space? (char input 0)))
    (setf input (string-trim #(#\return #\linefeed #\tab #\space) input)))
  (cond ((and (plusp (length input)) (char= (char input 0) #\<))
         (let ((stream (make-instance 'vector-input-stream :vector input)))
           (apply #'html-document-parser stream args)))
        (t
         (apply #'html-document-parser (make-uri input *xml-base*) args))))

(defMethod html-document-parser ((input vector) &rest args)
  (let ((stream (make-instance 'vector-input-stream :vector input)))
    (apply #'html-document-parser stream args)))

#| 20010621 according to the passage 4.2.2,
"relative URIs are relative to the location of the resource within which the
entity declaration occurs." the base uri must _always_ be rebound.

(defMethod html-document-parser ((source file-url) &rest args)
  (let ((*xml-base* (if *xml-base* *xml-base* source)))
    (with-file-stream (stream source)
      (apply #'html-document-parser stream args))))

(defMethod html-document-parser ((source http-url) &rest args)
  (let ((*xml-base* (if *xml-base* *xml-base* source)))
    (with-http-stream (stream source)
      (apply #'html-document-parser stream args))))

(defMethod html-document-parser ((source pathname) &rest args)
  (let ((*xml-base* (if *xml-base* *xml-base* (pathname-file-url source))))
    (with-open-file (stream source :direction :input :element-type 'unsigned-byte)
      (apply #'html-document-parser stream args))))
|#

(defMethod html-document-parser ((*xml-base* file-url) &rest args)
  (with-file-stream (stream *xml-base*)
    (apply #'html-document-parser stream args)))

(defMethod html-document-parser ((*xml-base* http-url) &rest args)
  (with-http-stream (stream *xml-base*)
    (apply #'html-document-parser stream args)))

(defMethod html-document-parser ((*xml-base* data-url) &rest args)
  (with-data-stream (stream *xml-base*)
    (apply #'html-document-parser stream args)))

(defMethod html-document-parser ((source pathname) &rest args)
  (let ((*xml-base* (pathname-file-url source)))
    (with-open-file (stream source :direction :input
                            :element-type 'unsigned-byte)
      (apply #'html-document-parser stream args))))


(defMethod html-document-parser ((stream stream) &rest args
                            &key
                            ((:ignore-whitespace *ignore-whitespace*) *ignore-whitespace*)
                            ((:verbose-qnames *verbose-qnames*) *verbose-qnames*)
                            ((:verbose *xml-verbose*) *xml-verbose*)
                            encoding
                            &allow-other-keys
                            &aux
                            ;; isolate the declarations for each physical entity branch
                            ;; higher-level definitions contribute to lower ones, but
                            ;; separate branches are isolated.
                            (*entity-declarations* *entity-declarations*)
                            (*general-entities* *html-general-entities*))
  ;; this had to be nested in order to permit the reference to args
  ;; note that the document container is not generated dependant on the construction context.
  ;; the present implementation expects to be able to expand entities and uses the document to
  ;; bind the definitions. the document itself can be specialized via its class parameter.
  (destructuring-bind (&key
                       ;; if this is the outermost invocation, instantiate a context document
                       ((:document *document*) (or *document* (apply #'make-parse-document args)))
                       ((:construction-context *construction-context*)
                        (construct-construction-context
                         *construction-context* *document*))
                       &allow-other-keys)
                      args
    ;; check settings for name handling
    (with-parse-environment (stream :encoding encoding)
      ;; bind the document parsetable, as a default to ensuse a minimal lexical context
      (with-parsetable |HtmlDocument|
        (multiple-value-bind (result index complete)
                             (apply #'|HtmlDocument-Parser|
                                    bnfp::*atn-input
                                    args)
          ;; (break)
          (if complete
            (values result index)
            (xml-error 'incomplete-parse :result result)))))))


:EOF

