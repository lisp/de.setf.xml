;;; 20100513T131623Z00
;;; from #<doc-node http://www.purl.org/net/ontology/order.owl #x26EC1AEE>

(common-lisp:in-package "http://www.purl.org/net/ontology/order.owl#")
(de.setf.resource.schema:defclass |Address| nil nil)

(de.setf.resource.schema:defclass |Agent| nil ((|hasAddress| :type |Address|)))

(de.setf.resource.schema:defclass |ItemsCollection|
                                  nil
                                  ((|hasItem| :type |PurchasedItem|)))

(de.setf.resource.schema:defclass |Organization|
                                  (|Agent|)
                                  ((|contactPerson| :type |Personnel|)))

(de.setf.resource.schema:defclass |Person| (|Agent|) nil)

(de.setf.resource.schema:defclass |Personnel| (|Person|) nil)

(de.setf.resource.schema:defclass |PurchasedItem|
                                  nil
                                  ((|suppliedBy| :type |Supplier|)))

(de.setf.resource.schema:defclass |PurchaseOrder|
                                  nil
                                  ((|shippedBy| :type |Shipper|)
                                   (|hasItems| :type |ItemsCollection|)
                                   (|shipTo| :type |Organization|)
                                   (|billTo| :type |Organization|)))

(de.setf.resource.schema:defclass |Shipper| (|Organization|) nil)

(de.setf.resource.schema:defclass |Supplier| (|Organization|) nil)
