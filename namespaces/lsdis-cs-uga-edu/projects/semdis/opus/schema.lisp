;;; 20100513T131452Z00
;;; from #<doc-node http://lsdis.cs.uga.edu/projects/semdis/swetodblp/january2007/opus_january2007.rdf #x2175D686>

(common-lisp:in-package "http://lsdis.cs.uga.edu/projects/semdis/opus#")
(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Article|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Article_in_Proceedings|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Book|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Book_Chapter|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Doctoral_Dissertation|
                                  (|Thesis|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Edited_Book|
                                  (|Edited_Publication| |Book|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Edited_Publication|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Journal|
                                  (|Serial_Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Masters_Thesis|
                                  (|Thesis|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Proceedings|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Publication|
                                  (|http://xmlns.com/foaf/0.1/|:|Document|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Publishing_Organization|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#School|
                                  (|http://xmlns.com/foaf/0.1/|:|Organization|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Serial_Publication|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Series|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Thesis|
                                  (|Publication|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#University|
                                  (|School|)
                                  nil)

(de.setf.resource.schema:defclass |http://lsdis.cs.uga.edu/projects/semdis/opus#Webpage|
                                  (|http://xmlns.com/foaf/0.1/|:|Document|)
                                  nil)
