;;; 20100513T131550Z00
;;; from #<doc-node http://keg.cs.tsinghua.edu.cn/persons/tj/ontology/software.owl #x264C9B36>

(common-lisp:in-package "http://keg.cs.tsinghua.edu.cn/ontology/software#")
(de.setf.resource.schema:defclass |Category|
                                  (|super_category|)
                                  ((|sub_category| :type |Category|)
                                   (|hasProject| :type |Project|)))

(de.setf.resource.schema:defclass |Developer|
                                  (|Member|)
                                  ((|member_of_project| :type |Project|)))

(de.setf.resource.schema:defclass |Discussion| (|Message|) nil)

(de.setf.resource.schema:defclass |Help| (|Message|) nil)

(de.setf.resource.schema:defclass |Member|
                                  (|Person|)
                                  ((|post_message| :type |Message|)))

(de.setf.resource.schema:defclass |Message|
                                  nil
                                  ((|posted_by| :type |Member|)
                                   (|has_replied_message| :type |Message|)
                                   (|belong_to_forum| :type |Public_Forums|)
                                   (|started_by| :type |Member|)))

(de.setf.resource.schema:defclass |Person| nil nil)

(de.setf.resource.schema:defclass |Project|
                                  (|belong_to_category| |currentVersion|
                                   |has_public_forum| |has_usage_statistics|)
                                  ((|developed_by| :type |Developer|)
                                   (|has_release_package| :type
                                    |Release_Package|)
                                   (|manager| :type |Project_Admin|)
                                   (|hasVersion| :type |Version|)))

(de.setf.resource.schema:defclass |Project_Admin| (|Developer|) nil)

(de.setf.resource.schema:defclass |Public_Forums|
                                  nil
                                  ((|hasMessage| :type |Message|)))

(de.setf.resource.schema:defclass |Release_Package|
                                  nil
                                  ((|belong_to_project| :type |Project|)))

(de.setf.resource.schema:defclass |Statistic_Record|
                                  nil
                                  ((|belong_to_statistics| :type
                                    |Usage_Statistics|)))

(de.setf.resource.schema:defclass |Usage_Statistics|
                                  nil
                                  ((|project_of_statistic| :type |Project|)
                                   (|hasRecord| :type |Statistic_Record|)))

(de.setf.resource.schema:defclass |Version|
                                  nil
                                  ((|released_by| :type |Developer|)))
