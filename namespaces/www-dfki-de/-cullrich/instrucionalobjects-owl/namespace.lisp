;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://www.dfki.de/~cullrich/instrucionalobjects.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Auxiliary"
                                          "Conclusion"
                                          "CounterExample"
                                          "Definition"
                                          "Demonstration"
                                          "Evidence"
                                          "Example"
                                          "Exercise"
                                          "Explanation"
                                          "Exploration"
                                          "Fact"
                                          "Fundamental"
                                          "Illustration"
                                          "InstructionalObject"
                                          "Interactivity"
                                          "Introduction"
                                          "Invitation"
                                          "Law"
                                          "LawOfNature"
                                          "Policy"
                                          "Procedure"
                                          "Process"
                                          "Proof"
                                          "RealWorldProblem"
                                          "Remark"
                                          "Theorem")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://www.dfki.de/~cullrich/instrucionalobjects.owl#")
           (make-package "http://www.dfki.de/~cullrich/instrucionalobjects.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Auxiliary" "Conclusion" "CounterExample" "Definition"
             "Demonstration" "Evidence" "Example" "Exercise" "Explanation"
             "Exploration" "Fact" "Fundamental" "Illustration"
             "InstructionalObject" "Interactivity" "Introduction" "Invitation"
             "Law" "LawOfNature" "Policy" "Procedure" "Process" "Proof"
             "RealWorldProblem" "Remark" "Theorem"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://www.dfki.de/~cullrich/instrucionalobjects.owl#" :if-does-not-exist :load)
