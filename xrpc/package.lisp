;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: cl-user; -*-

#|
<DOCUMENTATION>
 <COPYRIGHT YEAR='2005' AUTHOR='james adam anderson' MARK='(C)'
            href='file://xml/sysdcl.lisp' /> <CHRONOLOGY>
  <DELTA DATE='20051107' />
  <DELTA DATE='20060812'> net.xml-rpc package definiton to allegro file</DELTA>
  </CHRONOLOGY>
 </DOCUMENTATION>
|#

(in-package :cl-user)


(modpackage :de.setf.xml.xml-rpc
            (:use :de.setf.xml
                  :xutils
                  :xml-parser
                  :xml-query-data-model
                  :common-lisp)
            (:import-from :de.setf.utility.meta
                          :with-meta
                          :match
                          :with-string-meta
                          )
            (:import-from :xml-parser
                          ;; :xml*
                          :make-uname
                          )
            (:import-from :de.setf.utility
                          :universal-time
                          :trim-string-whitespace)
            (:import-from :date
                          "yyyyMMddTHH:mm:ss"
                          )
            (:import-from :xqdm
                          :destructure-element
                          )
            (:import-from :xutils :with-http-stream)
            #+ignore
            (:import-from :de.setf.http
                          :serve-http
                          )
            (:import-from :net.xml-rpc
                          :*xml-rpc-server*
                          :encode-xml-rpc-value
                          :make-xml-rpc-struct
                          :make-xml-rpc-encoding
                          :make-xml-rpc-server
                          :export-xml-rpc-method
                          :export-standard-xml-rpc-methods
                          :enable-xml-rpc-server
                          :disable-xml-rpc-server
                          :xml-rpc-member
                          :xml-rpc-member-encoding
                          :xml-rpc-member-name
                          :xml-rpc-member-type
                          :xml-rpc-member-value
                          :xml-rpc-struct-members
                          :xml-rpc-struct
                          :xml-rpc-slot-value
                          :xml-rpc-slot-type
                          )
            (:export
             :*xml-rpc-package*
             :*xml-rpc-to-lisp-type-alist*
             :intern-argument
             :intern-function
             :perform-method-call
             :xml-rpc-decode-value
             :xml-rpc-encode-value
             :xml-rpc-type
             :*xml-rpc-server*
             :encode-xml-rpc-value
             :make-xml-rpc-struct
             :make-xml-rpc-encoding
             :make-xml-rpc-server
             :export-xml-rpc-method
             :export-standard-xml-rpc-methods
             :enable-xml-rpc-server
             :disable-xml-rpc-server
             :xml-rpc-member
             :xml-rpc-member-name
             :xml-rpc-member-type
             :xml-rpc-member-encoding
             :xml-rpc-member-value
             :xml-rpc-struct-members
             :xml-rpc-struct
             :xml-rpc-slot-value
             :xml-rpc-slot-type
             )
            )


(defPackage "/RPC2"
  (:use)
  (:export "system.listMethods"
           "system.listMethodSignature"
           ))


:EOF


