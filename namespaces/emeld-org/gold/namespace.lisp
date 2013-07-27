;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://emeld.org/gold#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "AbsoluteFutureTense"
                                          "AbsolutePastTense"
                                          "AbsoluteRelativeTense"
                                          "AbsoluteTense"
                                          "Abstract"
                                          "Adposition"
                                          "Animate"
                                          "Article"
                                          "AspectValue"
                                          "Attribute"
                                          "BoundRoot"
                                          "BoundStem"
                                          "CaseValue"
                                          "Character"
                                          "Class"
                                          "Clause"
                                          "Clitic"
                                          "ClosedFeature"
                                          "ClosedMorphoSyntacticFeature"
                                          "ClosedSpecification"
                                          "ComplexFeature"
                                          "ComplexLexicalUnit"
                                          "ComplexMorphoSyntacticFeature"
                                          "ComplexOrthWord"
                                          "ComplexSpecification"
                                          "Compound"
                                          "Connective"
                                          "ContentBearingObject"
                                          "CoordinatingConnective"
                                          "DerivationalUnit"
                                          "Determiner"
                                          "DirectionalCase"
                                          "DynamicityAspect"
                                          "Enclitic"
                                          "Entity"
                                          "EvaluativeValue"
                                          "Feature"
                                          "FeatureConstraint"
                                          "FeatureSpecification"
                                          "FeatureStructure"
                                          "FeatureSystem"
                                          "FeatureValue"
                                          "FeatureValueAssociation"
                                          "FreeRoot"
                                          "FreeStem"
                                          "GenderValue"
                                          "GrammaticalCase"
                                          "InflectionalUnit"
                                          "InternalAttribute"
                                          "LexicalUnit"
                                          "LinguisticUnit"
                                          "List"
                                          "MainClause"
                                          "ModalityValue"
                                          "MorphoSyntacticFeatureValue"
                                          "MorphoSyntacticUnit"
                                          "Nominal"
                                          "NominalParticle"
                                          "NonGrammaticalCase"
                                          "NonSpatialCase"
                                          "Noun"
                                          "NumberValue"
                                          "Numeral"
                                          "Object"
                                          "OrthAffix"
                                          "OrthCircumfix"
                                          "OrthCompound"
                                          "OrthInfix"
                                          "OrthographicExpression"
                                          "OrthographicTranscription"
                                          "OrthPart"
                                          "OrthPhrase"
                                          "OrthPrefix"
                                          "OrthRoot"
                                          "OrthStem"
                                          "OrthSuffix"
                                          "OrthWord"
                                          "Particle"
                                          "PartOfSpeechValue"
                                          "PersonalPronoun"
                                          "PersonValue"
                                          "PhaseAspect"
                                          "PhonemicTranscription"
                                          "PhoneticTranscription"
                                          "PhraseUnit"
                                          "Physical"
                                          "PolarityValue"
                                          "PositionalCase"
                                          "Process"
                                          "Proclitic"
                                          "ProForm"
                                          "Pronoun"
                                          "Quantifier"
                                          "QuantitativeAspect"
                                          "Relation"
                                          "RelativeTense"
                                          "RelevanceAspect"
                                          "SelfConnectedObject"
                                          "Set"
                                          "SetOrClass"
                                          "SimpleOrthPart"
                                          "SimpleOrthWord"
                                          "SizeValue"
                                          "SpatialCase"
                                          "SublexicalUnit"
                                          "SubordinateClause"
                                          "SubordinatingConnective"
                                          "SymbolicString"
                                          "TenseValue"
                                          "Term"
                                          "Transcription"
                                          "Transliteration"
                                          "UnderlyingFormTranscription"
                                          "Verb"
                                          "ViewPointAspect"
                                          "WrittenExpression")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://emeld.org/gold#")
           (make-package "http://emeld.org/gold#" :use nil :nicknames 'nil))))
  (dolist (xml-query-data-model::s
           '("AbsoluteFutureTense" "AbsolutePastTense" "AbsoluteRelativeTense"
             "AbsoluteTense" "Abstract" "Adposition" "Animate" "Article"
             "AspectValue" "Attribute" "BoundRoot" "BoundStem" "CaseValue"
             "Character" "Class" "Clause" "Clitic" "ClosedFeature"
             "ClosedMorphoSyntacticFeature" "ClosedSpecification"
             "ComplexFeature" "ComplexLexicalUnit"
             "ComplexMorphoSyntacticFeature" "ComplexOrthWord"
             "ComplexSpecification" "Compound" "Connective"
             "ContentBearingObject" "CoordinatingConnective" "DerivationalUnit"
             "Determiner" "DirectionalCase" "DynamicityAspect" "Enclitic"
             "Entity" "EvaluativeValue" "Feature" "FeatureConstraint"
             "FeatureSpecification" "FeatureStructure" "FeatureSystem"
             "FeatureValue" "FeatureValueAssociation" "FreeRoot" "FreeStem"
             "GenderValue" "GrammaticalCase" "InflectionalUnit"
             "InternalAttribute" "LexicalUnit" "LinguisticUnit" "List"
             "MainClause" "ModalityValue" "MorphoSyntacticFeatureValue"
             "MorphoSyntacticUnit" "Nominal" "NominalParticle"
             "NonGrammaticalCase" "NonSpatialCase" "Noun" "NumberValue"
             "Numeral" "Object" "OrthAffix" "OrthCircumfix" "OrthCompound"
             "OrthInfix" "OrthographicExpression" "OrthographicTranscription"
             "OrthPart" "OrthPhrase" "OrthPrefix" "OrthRoot" "OrthStem"
             "OrthSuffix" "OrthWord" "Particle" "PartOfSpeechValue"
             "PersonalPronoun" "PersonValue" "PhaseAspect"
             "PhonemicTranscription" "PhoneticTranscription" "PhraseUnit"
             "Physical" "PolarityValue" "PositionalCase" "Process" "Proclitic"
             "ProForm" "Pronoun" "Quantifier" "QuantitativeAspect" "Relation"
             "RelativeTense" "RelevanceAspect" "SelfConnectedObject" "Set"
             "SetOrClass" "SimpleOrthPart" "SimpleOrthWord" "SizeValue"
             "SpatialCase" "SublexicalUnit" "SubordinateClause"
             "SubordinatingConnective" "SymbolicString" "TenseValue" "Term"
             "Transcription" "Transliteration" "UnderlyingFormTranscription"
             "Verb" "ViewPointAspect" "WrittenExpression"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://emeld.org/gold#" :if-does-not-exist :load)
