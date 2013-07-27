;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq *namespace*
      (defnamespace "http://www.w3.org/2002/07/owl#"
                    (:use)
                    (:nicknames "owl")
                    (:export "AllDifferent" "AllDisjointClasses"
                     "AllDisjointProperties" "allValuesFrom"
                     "annotatedProperty" "annotatedSource" "annotatedTarget"
                     "Annotation" "AnnotationProperty" "assertionProperty"
                     "AsymmetricProperty" "Axiom" "cardinality" "Class"
                     "complementOf" "DataRange" "datatypeComplementOf"
                     "DatatypeProperty" "DeprecatedClass" "DeprecatedProperty"
                     "differentFrom" "disjointUnionOf" "disjointWith"
                     "distinctMembers" "equivalentClass" "equivalentProperty"
                     "FunctionalProperty" "hasKey" "hasSelf" "hasValue"
                     "intersectionOf" "InverseFunctionalProperty" "inverseOf"
                     "IrreflexiveProperty" "maxCardinality"
                     "maxQualifiedCardinality" "members" "minCardinality"
                     "minQualifiedCardinality" "NamedIndividual"
                     "NegativePropertyAssertion" "ObjectProperty" "onClass"
                     "onDataRange" "onDatatype" "oneOf" "onProperties"
                     "onProperty" "Ontology" "OntologyProperty"
                     "propertyChainAxiom" "propertyDisjointWith"
                     "qualifiedCardinality" "ReflexiveProperty" "Restriction"
                     "sameAs" "someValuesFrom" "sourceIndividual"
                     "SymmetricProperty" "targetIndividual" "targetValue"
                     "Thing"
                     "TransitiveProperty" "unionOf" "withRestrictions")
                    (:documentation nil)))

(let ((p
       (or (find-package "http://www.w3.org/2002/07/owl#")
           (make-package "http://www.w3.org/2002/07/owl#"
                         :use
                         nil
                         :nicknames
                         '("owl")))))
  (dolist (s
           '("AllDifferent" "AllDisjointClasses" "AllDisjointProperties"
             "allValuesFrom" "annotatedProperty" "annotatedSource"
             "annotatedTarget" "Annotation" "AnnotationProperty"
             "assertionProperty" "AsymmetricProperty" "Axiom" "cardinality"
             "Class" "complementOf" "DataRange" "datatypeComplementOf"
             "DatatypeProperty" "DeprecatedClass" "DeprecatedProperty"
             "differentFrom" "disjointUnionOf" "disjointWith" "distinctMembers"
             "equivalentClass" "equivalentProperty" "FunctionalProperty"
             "hasKey" "hasSelf" "hasValue" "intersectionOf"
             "InverseFunctionalProperty" "inverseOf" "IrreflexiveProperty"
             "maxCardinality" "maxQualifiedCardinality" "members"
             "minCardinality" "minQualifiedCardinality" "NamedIndividual"
             "NegativePropertyAssertion" "ObjectProperty" "onClass"
             "onDataRange" "onDatatype" "oneOf" "onProperties" "onProperty"
             "Ontology" "OntologyProperty" "propertyChainAxiom"
             "propertyDisjointWith" "qualifiedCardinality" "ReflexiveProperty"
             "Restriction" "sameAs" "someValuesFrom" "sourceIndividual"
             "SymmetricProperty" "targetIndividual" "targetValue"
             "Thing"
             "TransitiveProperty" "unionOf" "withRestrictions"))
    (export (intern s p) p)))

;;; (xqdm:find-namespace "http://www.w3.org/2002/07/owl#" :if-does-not-exist :load)
