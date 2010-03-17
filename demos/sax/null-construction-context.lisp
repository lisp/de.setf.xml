;;; -*- package: "XML-PARSER"; Syntax: Common-lisp; Base: 10 -*-

(in-package "XML-PARSER")

;; examples of construction context implementations which produces no results.

(defClass null-construction-context ()
  ()
  (:documentation
   "the class <code>NULL-CONSTRUCTION-CONTEXT</code> implements the minimum required
    of a construction context to cause the parser to generate a null result."))

(defMethod |Attribute-Constructor|
           ((context null-construction-context)
            (att-value t) (name t))
  nil)

(defMethod |AttCharData-Constructor|
           ((context null-construction-context)
            (structure t))
  nil)

(defMethod |CharData-Constructor|
           ((context null-construction-context)
            (data string))
  nil)

(defMethod |CDataCharData-Constructor|
           ((context null-construction-context)
            (data string))
  nil)

(defMethod |Comment-Constructor|
           ((context null-construction-context)
            (comment-char-data t))
  nil)

(defMethod construct-construction-context
           ((context null-construction-context)
            (component t))
  context)

(defMethod |Document-Constructor|
           ((construction-context null-construction-context) 
            (third-misc-sequence t) (prolog t) (root t))
  nil)

(defMethod |Element-Constructor|
           ((context null-construction-context)
            (content* t) (etag t) (stag t))
  nil)

(defMethod |ExtParsedEnt-Constructor|
           ((construction-context t)
            (content* t) (text-decl t))
  nil)

(defMethod |Pi-Constructor|
           ((context null-construction-context)
            (literal t) (target t))
  nil)

(defMethod |PICharData-Constructor|
           ((context null-construction-context)
            (data string))
  nil)

(defMethod |STag-Constructor|
           ((context null-construction-context)
            (attr-plist+ns-cons* t) (name t))
  nil)


(defClass null-construction-context-redundantly ()
  ()
  (:documentation
   "the class <code>NULL-CONSTRUCTION-CONTEXT-COMPLETE</code> extends the minimal
    <code>NULL-CONSTRUCTION-CONTEXT</code> implementation to include methods for all
    available generic functions. these additional definitions serve documentary purposes
    only: given the minimal definitions, these additions are never invoked."))

(defMethod construct-attribute-name
           ((context null-construction-context-redundantly)
            (name t))
  nil)

(defMethod construct-attribute-plist
           ((context null-construction-context-redundantly)
            (att-value t) (name t))
  nil)

(defMethod construct-content-sequence
           ((context null-construction-context-redundantly)
            (content* t))
  nil)

(defMethod construct-elem-property-node
           ((context null-construction-context-redundantly)
            (prototype t) (children t))
  nil)

(defMethod construct-element-name
           ((context null-construction-context-redundantly)
            (name t))
  nil)

(defMethod construct-element-node
           ((context null-construction-context-redundantly)
            (name t) (attr-plist+ns-node* t))
  nil)

(defMethod construct-ns-node
           ((context null-construction-context-redundantly)
            (attribute-value t)  (name t)
            &optional colon-position)
  (declare (ignore colon-position))
  nil)

(defMethod construct-string-attr-node
           ((context null-construction-context-redundantly)
            (att-value t) (name t))
  nil)

(defMethod |Content-Constructor|
           ((context null-construction-context-redundantly)
            (|CDSect| t) (|CharData| t) (|Comment| t) (|Element| t)
            (|ParsedReference| t) (|Pi| t) (|Reference| t))
  "this method is redundant because all the constituents will already be null."
  nil)

(defMethod |ContentSequence-Constructor|
           ((context null-construction-context-redundantly)
            (content t) (content-sequence t))
  "this method is redundant because all the constituents will already be null."
  nil)



;;
;;
;; the top-level parse function parses a source to produce nothing

(defun null-document-parser (source &rest args)
  (apply #'document-parser source
         :construction-context (make-instance 'null-construction-context)
         args))


;; (null-document-parser "<asdf q='t'>1234</asdf>")
;; (null-document-parser "file://xml/tests/xml/channel.xml")

:EOF
