;;; 20100513T131718Z00
;;; from #<doc-node http://www.activemath.org/~cullrich/oio/InstructionalObjects.owl #x27E51D36>

(common-lisp:in-package "http://www.dfki.de/~cullrich/instrucionalobjects.owl#")
(de.setf.resource.schema:defclass |Auxiliary|
                                  (|InstructionalObject| |isFor| |isFor|)
                                  nil)

(de.setf.resource.schema:defclass |Conclusion| (|Explanation|) nil)

(de.setf.resource.schema:defclass |CounterExample| (|Illustration|) nil)

(de.setf.resource.schema:defclass |Definition| (|Fundamental|) nil)

(de.setf.resource.schema:defclass |Demonstration| (|Evidence|) nil)

(de.setf.resource.schema:defclass |Evidence| (|Auxiliary| |isFor| |isFor|) nil)

(de.setf.resource.schema:defclass |Example| (|Illustration|) nil)

(de.setf.resource.schema:defclass |Exercise| (|Interactivity|) nil)

(de.setf.resource.schema:defclass |Explanation| (|Auxiliary|) nil)

(de.setf.resource.schema:defclass |Exploration| (|Interactivity|) nil)

(de.setf.resource.schema:defclass |Fact| (|Fundamental|) nil)

(de.setf.resource.schema:defclass |Fundamental|
                                  (|InstructionalObject|)
                                  ((|isA| :type |Fundamental|)
                                   (|requires| :type |Fundamental|)))

(de.setf.resource.schema:defclass |Illustration| (|Auxiliary|) nil)

(de.setf.resource.schema:defclass |InstructionalObject| nil nil)

(de.setf.resource.schema:defclass |Interactivity| (|Auxiliary|) nil)

(de.setf.resource.schema:defclass |Introduction| (|Explanation|) nil)

(de.setf.resource.schema:defclass |Invitation| (|Interactivity|) nil)

(de.setf.resource.schema:defclass |Law| (|Fundamental|) nil)

(de.setf.resource.schema:defclass |LawOfNature| (|Law|) nil)

(de.setf.resource.schema:defclass |Policy| (|Process|) nil)

(de.setf.resource.schema:defclass |Procedure| (|Policy|) nil)

(de.setf.resource.schema:defclass |Process| (|Fundamental|) nil)

(de.setf.resource.schema:defclass |Proof| (|Evidence|) nil)

(de.setf.resource.schema:defclass |RealWorldProblem| (|Interactivity|) nil)

(de.setf.resource.schema:defclass |Remark| (|Explanation|) nil)

(de.setf.resource.schema:defclass |Theorem| (|Law|) nil)
