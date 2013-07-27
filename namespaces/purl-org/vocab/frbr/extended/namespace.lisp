;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://purl.org/vocab/frbr/extended#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "AutonomousExpression"
                                          "AutonomousWork"
                                          "complementsExpression"
                                          "complementsWork"
                                          "Expression"
                                          "Expression"
                                          "hasDependentPartExpression"
                                          "hasDependentPartWork"
                                          "hasIndependentPartExpression"
                                          "hasIndependentPartWork"
                                          "hasPartExpression"
                                          "hasPartItem"
                                          "hasPartManifestation"
                                          "hasPartWork"
                                          "isAnAbridgementOfExpression"
                                          "isAnAdaptationOfExpression"
                                          "isAnAdaptationOfWork"
                                          "isAnAlternativeManifestationTo"
                                          "isAnArrangementOfExpression"
                                          "isAnImitationOfExpression"
                                          "isAnImitationOfWork"
                                          "isAReconfigurationOfItem"
                                          "isAReferentialSuccessorToExpression"
                                          "isAReferentialSuccessorToWork"
                                          "isAReproductionOfItem"
                                          "isAReproductionOfManifestation"
                                          "isARevisionOfExpression"
                                          "isASuccessorToExpression"
                                          "isASuccessorToWork"
                                          "isASummaryOfExpression"
                                          "isASummaryOfWork"
                                          "isATransformationOfExpression"
                                          "isATransformationOfWork"
                                          "isATranslationOfExpression"
                                          "isAutonomouslyRelatedToExpression"
                                          "isAutonomouslyRelatedToWork"
                                          "isDependentPartOfExpression"
                                          "isDependentPartOfWork"
                                          "isIndependentPartOfExpression"
                                          "isIndependentPartOfWork"
                                          "isPartOfExpression"
                                          "isPartOfItem"
                                          "isPartOfManifestation"
                                          "isPartOfWork"
                                          "isReferentiallyRelatedToExpression"
                                          "isReferentiallyRelatedToWork"
                                          "isRelatedToExpression"
                                          "isRelatedToItem"
                                          "isRelatedToManifestation"
                                          "isRelatedToWork"
                                          nil
                                          nil
                                          nil
                                          nil
                                          nil
                                          nil
                                          nil
                                          nil
                                          nil
                                          nil
                                          "ReferentialExpression"
                                          "referentiallyComplementsExpression"
                                          "referentiallyComplementsWork"
                                          "referentiallySupplementsExpression"
                                          "referentiallySupplementsWork"
                                          "ReferentialWork"
                                          "supplementsExpression"
                                          "supplementsWork"
                                          "Work"
                                          "Work")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://purl.org/vocab/frbr/extended#")
           (make-package "http://purl.org/vocab/frbr/extended#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("AutonomousExpression" "AutonomousWork" "complementsExpression"
             "complementsWork" "Expression" "Expression"
             "hasDependentPartExpression" "hasDependentPartWork"
             "hasIndependentPartExpression" "hasIndependentPartWork"
             "hasPartExpression" "hasPartItem" "hasPartManifestation"
             "hasPartWork" "isAnAbridgementOfExpression"
             "isAnAdaptationOfExpression" "isAnAdaptationOfWork"
             "isAnAlternativeManifestationTo" "isAnArrangementOfExpression"
             "isAnImitationOfExpression" "isAnImitationOfWork"
             "isAReconfigurationOfItem" "isAReferentialSuccessorToExpression"
             "isAReferentialSuccessorToWork" "isAReproductionOfItem"
             "isAReproductionOfManifestation" "isARevisionOfExpression"
             "isASuccessorToExpression" "isASuccessorToWork"
             "isASummaryOfExpression" "isASummaryOfWork"
             "isATransformationOfExpression" "isATransformationOfWork"
             "isATranslationOfExpression" "isAutonomouslyRelatedToExpression"
             "isAutonomouslyRelatedToWork" "isDependentPartOfExpression"
             "isDependentPartOfWork" "isIndependentPartOfExpression"
             "isIndependentPartOfWork" "isPartOfExpression" "isPartOfItem"
             "isPartOfManifestation" "isPartOfWork"
             "isReferentiallyRelatedToExpression"
             "isReferentiallyRelatedToWork" "isRelatedToExpression"
             "isRelatedToItem" "isRelatedToManifestation" "isRelatedToWork" nil
             nil nil nil nil nil nil nil nil nil "ReferentialExpression"
             "referentiallyComplementsExpression"
             "referentiallyComplementsWork"
             "referentiallySupplementsExpression"
             "referentiallySupplementsWork" "ReferentialWork"
             "supplementsExpression" "supplementsWork" "Work" "Work"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://purl.org/vocab/frbr/extended#" :if-does-not-exist :load)
