;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-parser; -*-

(in-package "XML-PARSER")


;;
;; this file demonstates parsing with specialized dom instances.


;;
;;
;; if there is an appropriate class declared for the tag name, it will be used to
;; instantiate

(defClass |envelope| (abstract-elem-node)
  ((plist)))
(defMethod initialize-instance :after ((instance |envelope|) &rest initargs &key &allow-other-keys)
  (setf (slot-value instance 'plist) initargs))

(defMethod name ((instance |envelope|))
  (with-slots (plist) instance (getf plist :name)))
(defMethod def ((instance |envelope|)) nil)
(defMethod parent ((instance |envelope|))
  (with-slots (plist) instance (getf plist :parent)))
(defMethod children ((instance |envelope|))
  (with-slots (plist) instance (getf plist :children)))
(defMethod (setf children) (children (instance |envelope|))
  (with-slots (plist) instance (setf (getf plist :children) children)))
(defMethod attributes ((instance |envelope|))
  (with-slots (plist) instance (getf plist :attributes)))
(defMethod (setf attributes) ((attributes list) (instance |envelope|))
  (with-slots (plist) instance (setf (getf plist :attributes) attributes)))
(defMethod namespaces ((instance |envelope|))
  (with-slots (plist) instance (getf plist :namespaces)))
(defMethod (setf namespaces) ((namespaces list) (instance |envelope|))
  (with-slots (plist) instance (setf (getf plist :namespaces) namespaces)))

;; in the first case, there is no definition
(let ((*specialize-elem-node* t))
  (describe (document-parser "<envelope>asd<f/></envelope>")))

;; in this second case, there is
(let* ((*specialize-elem-node* t)
       (document (document-parser "<!DOCTYPE envelope [<!ELEMENT envelope ANY><!ATTLIST envelope xmlns CDATA 'XML-PARSER'>]>
    <envelope xmlns='XML-PARSER'>asd<f/></envelope>")))
  (describe document)
  (write-node document *trace-output*))

:EOF
