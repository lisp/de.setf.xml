;;; 20100512T222322Z00
;;; from #<doc-node http://www.w3.org/2000/10/swap/pim/contact #x1B54E82E>

(common-lisp:in-package "http://www.w3.org/2000/10/swap/pim/contact#")
(de.setf.resource.schema:defclass |Address| nil nil)

(de.setf.resource.schema:defclass |ContactLocation|
                                  nil
                                  ((|address| :type |Address|)
                                   (|fax| :type |Fax|) (|phone| :type |Phone|)))

(de.setf.resource.schema:defclass |Female| nil nil)

(de.setf.resource.schema:defclass |LanguageCode| nil nil)

(de.setf.resource.schema:defclass |Male| nil nil)

(de.setf.resource.schema:defclass |Phone| nil nil)

(de.setf.resource.schema:defclass |SocialEntity|
                                  nil
                                  ((|birthday| :type |Date|)))
