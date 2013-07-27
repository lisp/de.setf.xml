;;; 20100513T120752Z00
;;; from #<doc-node http://www.w3.org/2004/02/wsa/Extensions.owl #x266D2B1E>

(common-lisp:in-package "http://www.w3.org/2004/02/wsa/Extensions.owl#")
(de.setf.resource.schema:defclass |Body_Content| nil nil)

(de.setf.resource.schema:defclass |Capability_Semantics| (|Semantics|) nil)

(de.setf.resource.schema:defclass |ChoreographyDescriptionLanguage|
                                  (|Language|)
                                  nil)

(de.setf.resource.schema:defclass |Computational_Resource| nil nil)

(de.setf.resource.schema:defclass |Language| nil nil)

(de.setf.resource.schema:defclass |Message_Acknowledgements| nil nil)

(de.setf.resource.schema:defclass |Message_Semantics| (|Semantics|) nil)

(de.setf.resource.schema:defclass |NetworkAddress|
                                  nil
                                  ((|constrainedBy| :type
                                    |http://www.w3.org/2004/02/wsa/MessageModel.owl#|:|Message_Transport|)))

(de.setf.resource.schema:defclass |PolicyDescriptionLanguage| (|Language|) nil)

(de.setf.resource.schema:defclass |Semantics| nil nil)

(de.setf.resource.schema:defclass |Service_Invocation| nil nil)

(de.setf.resource.schema:defclass |ServiceDescriptionLanguage| (|Language|) nil)

(de.setf.resource.schema:defclass |ServiceSemanticsDescriptionLanguage|
                                  (|Language|)
                                  nil)

(de.setf.resource.schema:defclass |State| nil nil)

(de.setf.resource.schema:defclass uri (|NetworkAddress|) nil)
