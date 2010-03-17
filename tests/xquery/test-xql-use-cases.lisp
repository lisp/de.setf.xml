;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query; -*-

(in-package "XML-QUERY")

;; xml query use cases in file-form
;; 20010914 0.913/0.504

;; document definitions
;; there are loaded once here.
;; subsequent references use the cached copies.

(setf (xpa:|document| "http://www.bn.com")
      (xmlp::document-parser #P"xml:Tests;xql;1-1-XMP;bib.xml"))
(setf (xpa:|document| "www.bn.com/bib.xml")
      (xpa:|document| "http://www.bn.com"))
(setf (xpa:|document| "http://www.bn.com/bib.xml")
      (xpa:|document| "http://www.bn.com"))

(setf (xpa:|document| "http://www.amazon.com/reviews.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-1-XMP;reviews.xml"))
(setf (xpa:|document| "www.amazon.com/reviews.xml")
      (xpa:|document| "http://www.amazon.com/reviews.xml"))

(setf (xpa:|document| "books.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-1-XMP;books.xml"))

(setf (xpa:|document| "prices.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-1-XMP;prices.xml"))

(setf (xpa:|document| "book1.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-2-TREE;book1.xml"))

(defun test-use-cases (directory
                      &aux (*MINIMUM-STACK-OVERFLOW-SIZE* 409600)
                      (defaults
                        (translate-logical-pathname #P"xml:tests;xql;")))
  (mapcar #'(lambda (file)
              (print file)
              (handler-case
                (list (enough-namestring file defaults)
                      (query-parser file))
                (error (condition)
                       (list (enough-namestring file #P"xml:tests;xql;")
                             condition))))
          (directory directory)))

(defgeneric file->string (path)
  (:method ((path pathname))
           (with-open-file (stream path :direction :input)
             (file->string stream)))
  (:method ((path string))
           (file->string (pathname path)))
  (:method ((stream stream)
            &aux (result (make-array 32 :element-type 'character
                                     :adjustable t :fill-pointer 0))
            char)
           (loop
             (unless (characterp (setf char (read-char stream nil nil)))
               (return result))
             (vector-push-extend char result))))

(defun pprint-use-case (pathname)
  ;; for ca 1152 wide screen width windows 
  (let ((*print-miser-width* 150)
        (*minimum-stack-overflow-size* 409600)
        (string nil))
    (setf string (file->string pathname))
    (format *trace-output* "~% ~s :~%~a~% ==>" pathname string)
    (pprint (query-parser pathname) *trace-output*)))
    

;;
;; all cases

(inspect (test-use-cases  #P"xml:Tests;xql;*;*.xql"))


#|
;; individual cases
;;
;; XMP

(inspect (test-use-cases  #P"xml:Tests;xql;1-1-XMP;*.xql"))
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q1.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q2.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q3.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q4.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q5.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q5a.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q6.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q7.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q8.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q9.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q10.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q11.xql")
;;(pprint-use-case #P"xml:tests;xql;1-1-XMP;Q12.xql")

;;
;; TREE

(inspect (test-use-cases  #P"xml:Tests;xql;1-2-TREE;*.xql"))
;(pprint-use-case #P"xml:tests;xql;1-2-TREE:Q1.xql")
;(pprint-use-case #P"xml:tests;xql;1-2-TREE:Q2.xql")
;(pprint-use-case #P"xml:tests;xql;1-2-TREE:Q3.xql")
;(pprint-use-case #P"xml:tests;xql;1-2-TREE:Q4.xql")
;(pprint-use-case #P"xml:tests;xql;1-2-TREE:Q5.xql")
;(pprint-use-case #P"xml:tests;xql;1-2-TREE:Q6.xql")

;;
;; SEQ 
(setf (xpa:|document| "report.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-3-SEQ;report.xml"))

(inspect (test-use-cases  #P"xml:Tests;xql;1-3-SEQ;*.xql"))
;;(pprint-use-case #P"xml:tests;xql;1-3-SEQ;Q1.xql")
;;(pprint-use-case #P"xml:tests;xql;1-3-SEQ;Q2.xql")
;;(pprint-use-case #P"xml:tests;xql;1-3-SEQ;Q3.xql")
;;(pprint-use-case #P"xml:tests;xql;1-3-SEQ;Q4.xql")
;;(pprint-use-case #P"xml:tests;xql;1-3-SEQ;Q5.xql")



;;
;;

(setf (xpa:|document| "users.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-4-R;users.xml"))
(setf (xpa:|document| "items.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-4-R;items.xml"))
(setf (xpa:|document| "bids.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-4-R;bids.xml"))

(inspect (test-use-cases  #P"xml:Tests;xql;1-4-R;*.xql"))

;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q1.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q10.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q11.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q12.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q13.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q14.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q15.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q16.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q17.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q18.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q2.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q3.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q4.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q5.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q5b.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q6.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q7.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q8.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-4-R:Q9.xql")



;;
;; SGML

(setf (xpa:|document| "report.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-5-SGML;report.xml"))

(inspect (test-use-cases  #P"xml:Tests;xql;1-5-SGML;*.xql"))

;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q1.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q10.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q2.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q3.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q4.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q5.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q6.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q7.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q8a.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q8b.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-5-SGML:Q9.xql")


;;
;; TEXT

(setf (xpa:|document| "company.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-6-TEXT;company.xml"))
(setf (xpa:|document| "news.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-6-TEXT;news.xml"))

(inspect (test-use-cases  #P"xml:Tests;xql;1-6-TEXT;*.xql"))

;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-6-TEXT:Q1.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-6-TEXT:Q2.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-6-TEXT:Q3.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-6-TEXT:Q4.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-6-TEXT:Q5.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-6-TEXT:Q6.xql")


;;
;; NS

(setf (xpa:|document| "auction.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-7-NS;AuctionWatchList.xml"
                            :validate t))
(setf (xpa:|document| "auction.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-7-NS;AuctionWatchListOut2.xml"
                            :validate t))

;(inspect (xpa:|document| "auction.xml"))
;(write-node (xpa:|document| "auction.xml") (make-instance 'fred-window))

(inspect (test-use-cases  #P"xml:Tests;xql;1-7-NS;*.xql"))

;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q1.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q2.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q3.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q4.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q5.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q6.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q7.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-7-NS:Q8.xql")


;;
;; PARTS

(setf (xpa:|document| "partlist.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-8-PARTS;partlist.xml"))

(inspect (test-use-cases  #P"xml:Tests;xql;1-8-PARTS;*.xql"))

;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-8-PARTS:Q1.xql")


;;
;; REF

(setf (xpa:|document| "census.xml")
      (xmlp::document-parser #P"xml:Tests;xql;1-9-REF;census.xml"))

(inspect (test-use-cases  #P"xml:Tests;xql;1-9-REF;*.xql"))

;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q1.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q10.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q11.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q2.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q3.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q4.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q5.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q6.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q7.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q8.xql")
;;(pprint-use-case #P"entwicklung@paz:SourceServer:LISP:xml:tests:xql:1-9-REF:Q9.xql")

|#

#|
;; miscellaneous excerpt tests

(let ((*MINIMUM-STACK-OVERFLOW-SIZE* 409600))
  (query-parser #P"xml:Tests;xql;1-1-XMP;Q5a.xql" :start-name '|Expr|))
(query-parser ".." :start-name '|PrimaryExpr|)
(query-parser "document('books.xml')//chapter/title UNION document('books.xml')//section/title"
              :start-name '|Expr|)
(inspect '|QueryModuleList|)
(defun inspect@diff (o1 o2)
  (typecase  o1
    (cons (or (inspect@diff (car o1) (car o2))
              (inspect@diff (cdr o1) (cdr o2))))
    (t (cond ((equal o1 o2)
              nil)
             (t
              (inspect (list o1 o2))
              (cons o1 o2))))))
(inspect@diff (first (top-inspect-form)) (second (top-inspect-form)))


(query-parser "//*[@dt:*]"
              :start-name '|PathExpr|)

(query-parser "<Q2>
  { 
    //music:title 
  }
</Q2>" :start-name '|QueryModule|)
(query-parser "//news_item/title[contains(./text(), 'Foobar Corporation')]" :start-name '|QueryModule|)


(query-parser "//news_item/title[2]" :start-name '|Expr|)
(query-parser "//news_item/title[contains(./text(), 'Foobar Corporation')]" :start-name '|Expr|)

(query-parser "{ //music:title } "
              :start-name '|EnclosedExpr|)

|#


:EOF
