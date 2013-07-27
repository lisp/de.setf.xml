;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/aiiso-roles/schema#"
                                         (:use)
                                         (:nicknames "vann")
                                         (:export
                                          "Administrative_Assistant"
                                          "Administrator"
                                          "Admission_Officer"
                                          "Admissions_and_International_Officer"
                                          "ADP_student"
                                          "Assistant"
                                          "Assistant_Computer_Officer"
                                          "Assistant_Director "
                                          "Associate"
                                          "Associate_Dean"
                                          "Associate_Director"
                                          "Associate_Lecturer"
                                          "Audio_Visual_and_Graphics_Technician"
                                          "CAD_Instructor"
                                          "Campus_Library_Manager"
                                          "Chair"
                                          "Clerk"
                                          "Computer_Officer"
                                          "Computer_Team_Leader"
                                          "Convenor"
                                          "CPDA_Coordinator"
                                          "Deputy_Academic_Registrar"
                                          "Deputy_Chair"
                                          "Deputy_Head_of_Department"
                                          "Deputy_Head_of_School"
                                          "Deputy_Librarian"
                                          "Director"
                                          "Executive_Support_Officer"
                                          "External_Examiner"
                                          "External_Examiner"
                                          "External_Programmes_Advisor"
                                          "Faculty_Administrator"
                                          "Faculty_Librarian"
                                          "Fellow"
                                          "Field_Leader"
                                          "Finance_and_Resources_Officer"
                                          "Finance_Assistant"
                                          "First_Aider"
                                          "Group_Leader"
                                          "Head_of_Department"
                                          "Head_of_School"
                                          "Hourly_Paid_Lecturer"
                                          "Internal_Moderator"
                                          "Joint_Head_of_Technical_Services"
                                          "Lecturer"
                                          "Manager"
                                          "Marketing_and_Admissions_Assistant"
                                          "Marketing_and_International_Assistant"
                                          "Marketing_Officer"
                                          "Member"
                                          "Modular_Scheme_Administrator"
                                          "Module_Coordinator"
                                          "Module_Leader"
                                          "PC_Systems_Manager"
                                          "Personal_Assistant_to_Associate_Dean"
                                          "Personal_Assistant_to_Dean"
                                          "Placement_Post"
                                          "Postgraduate_Scheme_Director"
                                          "Principal_Computer_Officer"
                                          "Principal_Electronics_Technician"
                                          "Principal_Lecturer"
                                          "Principal_Officer"
                                          "Principal_Technician"
                                          "Professor"
                                          "Project_Manager"
                                          "Reader"
                                          "Receptionist"
                                          "Research"
                                          "Research_Administrator"
                                          "Research_Associate"
                                          "Research_Director"
                                          "Research_Fellow"
                                          "Research_Leader"
                                          "Research_Student"
                                          "Researcher"
                                          "Secretary"
                                          "Secretary_to_Head_of_Schools"
                                          "Senior_Lecturer"
                                          "Senior_Team_Leader"
                                          "Senior_Technician"
                                          "Special_Needs_Officer"
                                          "Student_Adviser"
                                          "Student_Representative"
                                          "Team_Leader"
                                          "Technical_Manager"
                                          "Technical_Purchasing_Assistant"
                                          "Technical_Resources_Manager"
                                          "Technician"
                                          "Tutor"
                                          "Undergraduate_Scheme_Director"
                                          "User_Services_Manager"
                                          "Visiting_Professor"
                                          "Visiting_Researcher"
                                          "Visiting_Senior_Research_Fellow"
                                          "Web_Development_Officer")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/aiiso-roles/schema#")
           (make-package "http://purl.org/vocab/aiiso-roles/schema#"
                         :use
                         nil
                         :nicknames
                         '("vann")))))
  (dolist (xml-query-data-model::s
           '("Administrative_Assistant" "Administrator" "Admission_Officer"
             "Admissions_and_International_Officer" "ADP_student" "Assistant"
             "Assistant_Computer_Officer" "Assistant_Director " "Associate"
             "Associate_Dean" "Associate_Director" "Associate_Lecturer"
             "Audio_Visual_and_Graphics_Technician" "CAD_Instructor"
             "Campus_Library_Manager" "Chair" "Clerk" "Computer_Officer"
             "Computer_Team_Leader" "Convenor" "CPDA_Coordinator"
             "Deputy_Academic_Registrar" "Deputy_Chair"
             "Deputy_Head_of_Department" "Deputy_Head_of_School"
             "Deputy_Librarian" "Director" "Executive_Support_Officer"
             "External_Examiner" "External_Examiner"
             "External_Programmes_Advisor" "Faculty_Administrator"
             "Faculty_Librarian" "Fellow" "Field_Leader"
             "Finance_and_Resources_Officer" "Finance_Assistant" "First_Aider"
             "Group_Leader" "Head_of_Department" "Head_of_School"
             "Hourly_Paid_Lecturer" "Internal_Moderator"
             "Joint_Head_of_Technical_Services" "Lecturer" "Manager"
             "Marketing_and_Admissions_Assistant"
             "Marketing_and_International_Assistant" "Marketing_Officer"
             "Member" "Modular_Scheme_Administrator" "Module_Coordinator"
             "Module_Leader" "PC_Systems_Manager"
             "Personal_Assistant_to_Associate_Dean"
             "Personal_Assistant_to_Dean" "Placement_Post"
             "Postgraduate_Scheme_Director" "Principal_Computer_Officer"
             "Principal_Electronics_Technician" "Principal_Lecturer"
             "Principal_Officer" "Principal_Technician" "Professor"
             "Project_Manager" "Reader" "Receptionist" "Research"
             "Research_Administrator" "Research_Associate" "Research_Director"
             "Research_Fellow" "Research_Leader" "Research_Student"
             "Researcher" "Secretary" "Secretary_to_Head_of_Schools"
             "Senior_Lecturer" "Senior_Team_Leader" "Senior_Technician"
             "Special_Needs_Officer" "Student_Adviser" "Student_Representative"
             "Team_Leader" "Technical_Manager" "Technical_Purchasing_Assistant"
             "Technical_Resources_Manager" "Technician" "Tutor"
             "Undergraduate_Scheme_Director" "User_Services_Manager"
             "Visiting_Professor" "Visiting_Researcher"
             "Visiting_Senior_Research_Fellow" "Web_Development_Officer"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/aiiso-roles/schema#" :if-does-not-exist :load)