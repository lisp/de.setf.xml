;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: de.setf.xml.xml-rpc; -*-
;;;
;;; package definition for allegro emulation

;;; this prepares a package to duplicate the client side of the allegro
;;; xml-rpc interface. see
;;;   http://www.franz.com/support/documentation/6.2/xmlrpc/xml-rpc.txt
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :cl-user)

(unless (find-package :net.xml-rpc)
  (defpackage :net.xml-rpc
    (:use )
    (:export :*xml-rpc-server*
             :disable-xml-rpc-server
             :enable-xml-rpc-server
             :encode-xml-rpc-value
             :export-standard-xml-rpc-methods
             :export-xml-rpc-method
             :make-xml-rpc-encoding
             :make-xml-rpc-server
             :make-xml-rpc-struct
             :xml-rpc-member
             :xml-rpc-member-encoding
             :xml-rpc-member-name
             :xml-rpc-member-type
             :xml-rpc-member-value
             :xml-rpc-slot-type
             :xml-rpc-slot-value
             :xml-rpc-struct-members
             :xml-rpc-struct
             )))



:EOF