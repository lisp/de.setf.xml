;;; 20100513T131812Z00
;;; from #<doc-node http://emeld.org/gold #x2903B62E>

(common-lisp:in-package "http://www.emeld.org/gold.owl#")
(de.setf.resource.schema:defclass |AbsoluteFutureTense| (|AbsoluteTense|) nil)

(de.setf.resource.schema:defclass |AbsolutePastTense| (|AbsoluteTense|) nil)

(de.setf.resource.schema:defclass |AbsoluteRelativeTense| (|TenseValue|) nil)

(de.setf.resource.schema:defclass |AbsoluteTense| (|TenseValue|) nil)

(de.setf.resource.schema:defclass |Abstract| (|Entity|) nil)

(de.setf.resource.schema:defclass |Adposition| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |Animate| (|GenderValue|) nil)

(de.setf.resource.schema:defclass |Article| (|Determiner|) nil)

(de.setf.resource.schema:defclass |AspectValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |Attribute| (|Abstract|) nil)

(de.setf.resource.schema:defclass |BoundRoot| (|SublexicalUnit|) nil)

(de.setf.resource.schema:defclass |BoundStem| (|SublexicalUnit|) nil)

(de.setf.resource.schema:defclass |CaseValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |Character| (|WrittenExpression|) nil)

(de.setf.resource.schema:defclass |Class| (|SetOrClass|) nil)

(de.setf.resource.schema:defclass |Clause| (|PhraseUnit|) nil)

(de.setf.resource.schema:defclass |Clitic| (|SublexicalUnit|) nil)

(de.setf.resource.schema:defclass |ClosedFeature| (|Feature|) nil)

(de.setf.resource.schema:defclass |ClosedMorphoSyntacticFeature|
                                  (|ClosedFeature|)
                                  nil)

(de.setf.resource.schema:defclass |ClosedSpecification|
                                  (|FeatureSpecification|)
                                  nil)

(de.setf.resource.schema:defclass |ComplexFeature| (|Feature|) nil)

(de.setf.resource.schema:defclass |ComplexLexicalUnit| (|LexicalUnit|) nil)

(de.setf.resource.schema:defclass |ComplexMorphoSyntacticFeature|
                                  (|ClosedFeature|)
                                  nil)

(de.setf.resource.schema:defclass |ComplexOrthWord| (|OrthWord|) nil)

(de.setf.resource.schema:defclass |ComplexSpecification|
                                  (|FeatureSpecification|)
                                  nil)

(de.setf.resource.schema:defclass |Compound| (|ComplexLexicalUnit|) nil)

(de.setf.resource.schema:defclass |Connective| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |ContentBearingObject|
                                  (|SelfConnectedObject|)
                                  nil)

(de.setf.resource.schema:defclass |CoordinatingConnective| (|Connective|) nil)

(de.setf.resource.schema:defclass |DerivationalUnit| (|SublexicalUnit|) nil)

(de.setf.resource.schema:defclass |Determiner| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |DirectionalCase| (|SpatialCase|) nil)

(de.setf.resource.schema:defclass |DynamicityAspect| (|AspectValue|) nil)

(de.setf.resource.schema:defclass |Enclitic| (|Clitic|) nil)

(de.setf.resource.schema:defclass |Entity|
                                  (|http://www.w3.org/2002/07/owl#|:|Thing|)
                                  nil)

(de.setf.resource.schema:defclass |EvaluativeValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |Feature| (|InternalAttribute|) nil)

(de.setf.resource.schema:defclass |FeatureConstraint| (|List|) nil)

(de.setf.resource.schema:defclass |FeatureSpecification| (|List|) nil)

(de.setf.resource.schema:defclass |FeatureStructure| (|Set|) nil)

(de.setf.resource.schema:defclass |FeatureSystem| (|List|) nil)

(de.setf.resource.schema:defclass |FeatureValue| (|Abstract|) nil)

(de.setf.resource.schema:defclass |FeatureValueAssociation| (|List|) nil)

(de.setf.resource.schema:defclass |FreeRoot| (|LexicalUnit|) nil)

(de.setf.resource.schema:defclass |FreeStem| (|ComplexLexicalUnit|) nil)

(de.setf.resource.schema:defclass |GenderValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |GrammaticalCase| (|CaseValue|) nil)

(de.setf.resource.schema:defclass |InflectionalUnit| (|SublexicalUnit|) nil)

(de.setf.resource.schema:defclass |InternalAttribute| (|Attribute|) nil)

(de.setf.resource.schema:defclass |LexicalUnit| (|MorphoSyntacticUnit|) nil)

(de.setf.resource.schema:defclass |LinguisticUnit|
                                  (|Abstract|)
                                  ((|realization| :type |WrittenExpression|)
                                   (|hasSense| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |List| (|Relation|) nil)

(de.setf.resource.schema:defclass |MainClause| (|Clause|) nil)

(de.setf.resource.schema:defclass |ModalityValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |MorphoSyntacticFeatureValue|
                                  (|FeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |MorphoSyntacticUnit| (|LinguisticUnit|) nil)

(de.setf.resource.schema:defclass |Nominal| (|Noun|) nil)

(de.setf.resource.schema:defclass |NominalParticle| (|Particle|) nil)

(de.setf.resource.schema:defclass |NonGrammaticalCase| (|CaseValue|) nil)

(de.setf.resource.schema:defclass |NonSpatialCase| (|NonGrammaticalCase|) nil)

(de.setf.resource.schema:defclass |Noun| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |NumberValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |Numeral| (|Quantifier|) nil)

(de.setf.resource.schema:defclass |Object| (|Physical|) nil)

(de.setf.resource.schema:defclass |OrthAffix| (|OrthPart|) nil)

(de.setf.resource.schema:defclass |OrthCircumfix| (|OrthAffix|) nil)

(de.setf.resource.schema:defclass |OrthCompound| (|ComplexOrthWord|) nil)

(de.setf.resource.schema:defclass |OrthInfix| (|OrthAffix|) nil)

(de.setf.resource.schema:defclass |OrthographicExpression|
                                  (|SymbolicString|)
                                  nil)

(de.setf.resource.schema:defclass |OrthographicTranscription|
                                  (|Transcription|)
                                  nil)

(de.setf.resource.schema:defclass |OrthPart| (|OrthographicExpression|) nil)

(de.setf.resource.schema:defclass |OrthPhrase| (|OrthographicExpression|) nil)

(de.setf.resource.schema:defclass |OrthPrefix| (|OrthAffix|) nil)

(de.setf.resource.schema:defclass |OrthRoot| (|OrthPart|) nil)

(de.setf.resource.schema:defclass |OrthStem| (|OrthPart|) nil)

(de.setf.resource.schema:defclass |OrthSuffix| (|OrthAffix|) nil)

(de.setf.resource.schema:defclass |OrthWord| (|OrthographicExpression|) nil)

(de.setf.resource.schema:defclass |Particle| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |PartOfSpeechValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |PersonalPronoun| (|Pronoun|) nil)

(de.setf.resource.schema:defclass |PersonValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |PhaseAspect| (|AspectValue|) nil)

(de.setf.resource.schema:defclass |PhonemicTranscription| (|Transcription|) nil)

(de.setf.resource.schema:defclass |PhoneticTranscription| (|Transcription|) nil)

(de.setf.resource.schema:defclass |PhraseUnit| (|MorphoSyntacticUnit|) nil)

(de.setf.resource.schema:defclass |Physical| (|Entity|) nil)

(de.setf.resource.schema:defclass |PolarityValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |PositionalCase| (|SpatialCase|) nil)

(de.setf.resource.schema:defclass |Process| (|Physical|) nil)

(de.setf.resource.schema:defclass |Proclitic| (|Clitic|) nil)

(de.setf.resource.schema:defclass |ProForm| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |Pronoun| (|ProForm|) nil)

(de.setf.resource.schema:defclass |Quantifier| (|Determiner|) nil)

(de.setf.resource.schema:defclass |QuantitativeAspect| (|AspectValue|) nil)

(de.setf.resource.schema:defclass |Relation| (|Abstract|) nil)

(de.setf.resource.schema:defclass |RelativeTense| (|TenseValue|) nil)

(de.setf.resource.schema:defclass |RelevanceAspect| (|AspectValue|) nil)

(de.setf.resource.schema:defclass |SelfConnectedObject| (|Object|) nil)

(de.setf.resource.schema:defclass |Set| (|SetOrClass|) nil)

(de.setf.resource.schema:defclass |SetOrClass| (|Abstract|) nil)

(de.setf.resource.schema:defclass |SimpleOrthPart| (|OrthPart|) nil)

(de.setf.resource.schema:defclass |SimpleOrthWord| (|OrthWord|) nil)

(de.setf.resource.schema:defclass |SizeValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |SpatialCase| (|NonGrammaticalCase|) nil)

(de.setf.resource.schema:defclass |SublexicalUnit| (|MorphoSyntacticUnit|) nil)

(de.setf.resource.schema:defclass |SubordinateClause| (|Clause|) nil)

(de.setf.resource.schema:defclass |SubordinatingConnective| (|Connective|) nil)

(de.setf.resource.schema:defclass |SymbolicString| (|WrittenExpression|) nil)

(de.setf.resource.schema:defclass |TenseValue|
                                  (|MorphoSyntacticFeatureValue|)
                                  nil)

(de.setf.resource.schema:defclass |Term| (|SymbolicString|) nil)

(de.setf.resource.schema:defclass |Transcription| (|SymbolicString|) nil)

(de.setf.resource.schema:defclass |Transliteration| (|Transcription|) nil)

(de.setf.resource.schema:defclass |UnderlyingFormTranscription|
                                  (|Transcription|)
                                  nil)

(de.setf.resource.schema:defclass |Verb| (|PartOfSpeechValue|) nil)

(de.setf.resource.schema:defclass |ViewPointAspect| (|AspectValue|) nil)

(de.setf.resource.schema:defclass |WrittenExpression|
                                  (|ContentBearingObject|)
                                  ((|names| :type |Entity|)))
