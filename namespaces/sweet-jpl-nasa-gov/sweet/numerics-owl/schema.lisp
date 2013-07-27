;;; 20100513T131525Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/sweet/numerics.owl #x249C0CC6>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/numerics.owl#")
(de.setf.resource.schema:defclass |Anomaly| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |Array| (|Seq|) nil)

(de.setf.resource.schema:defclass |ArrayOrNill| nil nil)

(de.setf.resource.schema:defclass |Average| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |BinaryOperation|
                                  (|Operation|)
                                  ((|hasFirstOperand| :type
                                    |NumericalEntityOrOperation|)
                                   (|hasSecondOperand| :type
                                    |NumericalEntityOrOperation|)))

(de.setf.resource.schema:defclass |Boundary| (|GeometricalObject|) nil)

(de.setf.resource.schema:defclass |Budget| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |Circle|
                                  (|GeometricalObject_2D|)
                                  ((|hasRadius| :type |Scalar|)))

(de.setf.resource.schema:defclass |Circulation|
                                  (|LineIntegral| |VectorFieldOperation|)
                                  nil)

(de.setf.resource.schema:defclass |Convergence| (|VectorFieldOperation|) nil)

(de.setf.resource.schema:defclass |Coordinate| (|Scalar|) nil)

(de.setf.resource.schema:defclass |Coordinates| (|Array|) nil)

(de.setf.resource.schema:defclass |CoordinateSystem| (|NumericalEntity|) nil)

(de.setf.resource.schema:defclass |CrossProduct| (|Multiplication|) nil)

(de.setf.resource.schema:defclass |Curl| (|VectorFieldOperation|) nil)

(de.setf.resource.schema:defclass |Curve| (|GeometricalObject_1D|) nil)

(de.setf.resource.schema:defclass |Deficit| (|Anomaly|) nil)

(de.setf.resource.schema:defclass |Derivative|
                                  (|OperationOnFunction|)
                                  ((|derivativeWithRespectTo| :type
                                    |Quantity|)))

(de.setf.resource.schema:defclass |DifferntialFlux| (|Flux|) nil)

(de.setf.resource.schema:defclass |Distribution| (|Function|) nil)

(de.setf.resource.schema:defclass |Distribution_1D| (|Distribution|) nil)

(de.setf.resource.schema:defclass |Distribution_2D| (|Distribution|) nil)

(de.setf.resource.schema:defclass |Distribution_3D| (|Distribution|) nil)

(de.setf.resource.schema:defclass |Divergence| (|VectorFieldOperation|) nil)

(de.setf.resource.schema:defclass |Division| (|BinaryOperation|) nil)

(de.setf.resource.schema:defclass |DotProduct| (|Multiplication|) nil)

(de.setf.resource.schema:defclass |Excess| (|Anomaly|) nil)

(de.setf.resource.schema:defclass |Field| (|Function|) nil)

(de.setf.resource.schema:defclass |Flux|
                                  (|SurfaceIntegral| |VectorFieldOperation|)
                                  nil)

(de.setf.resource.schema:defclass |FourierTransform|
                                  (|OperationOnFunction|)
                                  nil)

(de.setf.resource.schema:defclass |Fraction| (|ScalarDivision|) nil)

(de.setf.resource.schema:defclass |Function|
                                  (|Operation|)
                                  ((|hasExpression| :type
                                    |ScalarOrVariableOrOperation|)))

(de.setf.resource.schema:defclass |FuzzyPoint| (|GeometricalObject|) nil)

(de.setf.resource.schema:defclass |GeometricalObject|
                                  (|NumericalEntity|)
                                  ((|overlaps| :type |GeometricalObject|)
                                   (|hasSize| :type
                                    |http://sweet.jpl.nasa.gov/ontology/property.owl#|::|Size|)))

(de.setf.resource.schema:defclass |GeometricalObject_0D|
                                  (|GeometricalObject|)
                                  nil)

(de.setf.resource.schema:defclass |GeometricalObject_1D|
                                  (|GeometricalObject|)
                                  ((|hasLength| :type
                                    |http://sweet.jpl.nasa.gov/ontology/property.owl#|:|LinearExtent|)))

(de.setf.resource.schema:defclass |GeometricalObject_2D|
                                  (|GeometricalObject|)
                                  ((|hasArea| :type
                                    |http://sweet.jpl.nasa.gov/ontology/property.owl#|:|Area|)))

(de.setf.resource.schema:defclass |GeometricalObject_3D|
                                  (|GeometricalObject|)
                                  ((|hasVolume| :type
                                    |http://sweet.jpl.nasa.gov/ontology/property.owl#|::|Volume|)))

(de.setf.resource.schema:defclass |Gradient| (|ScalarFieldOperation|) nil)

(de.setf.resource.schema:defclass |GreatCircle| (|Circle|) nil)

(de.setf.resource.schema:defclass |Half| (|UnaryOperation|) nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Altitude|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Area|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Frequency|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Length|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#LinearExtent|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Size|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Time|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Velocity|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Volume|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#Location|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/units.owl#Unit|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2002/07/owl#Thing| nil nil)

(de.setf.resource.schema:defclass |Hyperplane| (|GeometricalObject|) nil)

(de.setf.resource.schema:defclass |Integral|
                                  (|OperationOnFunction|)
                                  ((|integralWithRespectTo| :type |Variable|)
                                   (|integralOnInterval| :type |Interval|)))

(de.setf.resource.schema:defclass |Interval|
                                  (|NumericalEntity|)
                                  ((|hasUpperLimit| :type |Scalar|)
                                   (|hasLowerLimit| :type |Scalar|)))

(de.setf.resource.schema:defclass |LapseRate| (|PartialDerivative|) nil)

(de.setf.resource.schema:defclass |Line| (|Curve|) nil)

(de.setf.resource.schema:defclass |LineIntegral| (|Integral|) nil)

(de.setf.resource.schema:defclass |Logarithm|
                                  (|Function|)
                                  ((|hasBase| :type |Scalar|)))

(de.setf.resource.schema:defclass |Matrix| (|Seq|) nil)

(de.setf.resource.schema:defclass |Maximum| (|Operation|) nil)

(de.setf.resource.schema:defclass |Mean| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |Minimum| (|Operation|) nil)

(de.setf.resource.schema:defclass |Multiplication| (|BinaryOperation|) nil)

(de.setf.resource.schema:defclass |Normalization| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |NumericalEntity|
                                  nil
                                  ((|equalsInValue| :type |NumericalEntity|)
                                   (|lessThan| :type |NumericalEntity|)
                                   (|greaterThan| :type |NumericalEntity|)
                                   (|lessThanOrEqual| :type |NumericalEntity|)
                                   (|greaterThanOrEqual| :type
                                    |NumericalEntity|)
                                   (|fuzzyGreaterThan| :type |NumericalEntity|)
                                   (|fuzzyLessThan| :type |NumericalEntity|)))

(de.setf.resource.schema:defclass |NumericalEntityOrOperation| nil nil)

(de.setf.resource.schema:defclass |Operation|
                                  nil
                                  ((|hasOperationInput| :type
                                    |NumericalEntity|)
                                   (|hasOperationOutput| :type
                                    |NumericalEntity|)))

(de.setf.resource.schema:defclass |OperationOnFunction| (|Operation|) nil)

(de.setf.resource.schema:defclass |Order| nil nil)

(de.setf.resource.schema:defclass |OrderedPair| (|Seq|) nil)

(de.setf.resource.schema:defclass |PartialDerivative| (|Derivative|) nil)

(de.setf.resource.schema:defclass |Peak| (|Maximum|) nil)

(de.setf.resource.schema:defclass |Percentile| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |Plane| (|Surface|) nil)

(de.setf.resource.schema:defclass |Point|
                                  (|GeometricalObject_0D|)
                                  ((|hasCoordinates| :type |Coordinates|)))

(de.setf.resource.schema:defclass |Polygon|
                                  (|GeometricalObject_2D|)
                                  ((|hasVertices| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Polyhedron| (|GeometricalObject_3D|) nil)

(de.setf.resource.schema:defclass |ProbabailityDensityFunction|
                                  (|StatisticalOperation| |Function|)
                                  nil)

(de.setf.resource.schema:defclass |Quantity|
                                  nil
                                  ((|hasUnit| :type
                                    |http://sweet.jpl.nasa.gov/ontology/units.owl#|::|Unit|)
                                   (|hasDefaultUnit| :type
                                    |http://sweet.jpl.nasa.gov/ontology/units.owl#|::|Unit|)))

(de.setf.resource.schema:defclass |Rate| (|PartialDerivative|) nil)

(de.setf.resource.schema:defclass |Ratio| (|ScalarDivision|) nil)

(de.setf.resource.schema:defclass |Rectangle| (|Polygon|) nil)

(de.setf.resource.schema:defclass |ReferenceSystem| nil nil)

(de.setf.resource.schema:defclass |Scalar| (|NumericalEntity|) nil)

(de.setf.resource.schema:defclass |ScalarDivision| (|Division|) nil)

(de.setf.resource.schema:defclass |ScalarField| (|Field|) nil)

(de.setf.resource.schema:defclass |ScalarFieldOperation|
                                  (|OperationOnFunction|)
                                  nil)

(de.setf.resource.schema:defclass |ScalarMultiplication| (|Multiplication|) nil)

(de.setf.resource.schema:defclass |ScalarOrVariableOrOperation| nil nil)

(de.setf.resource.schema:defclass |ScalarSubtraction| (|Subtraction|) nil)

(de.setf.resource.schema:defclass |ScalarSummation| (|Summation|) nil)

(de.setf.resource.schema:defclass |Seq|
                                  (|NumericalEntity|)
                                  ((|eachElementHasType| :type
                                    |NumericalEntity|)
                                   (|hasMaximum| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|hasMinimum| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Sequence| nil nil)

(de.setf.resource.schema:defclass |Set|
                                  (|NumericalEntity|)
                                  ((|isSubsetOf| :type |Set|)))

(de.setf.resource.schema:defclass |SetOperation| (|Operation|) nil)

(de.setf.resource.schema:defclass |Shear|
                                  (|Derivative| |VectorFieldOperation|)
                                  nil)

(de.setf.resource.schema:defclass |Skewness| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |SmallCircle| (|Circle|) nil)

(de.setf.resource.schema:defclass |Spectrum| (|Distribution_1D|) nil)

(de.setf.resource.schema:defclass |Sphere| (|GeometricalObject_3D|) nil)

(de.setf.resource.schema:defclass |Square| (|Rectangle|) nil)

(de.setf.resource.schema:defclass |SquareOperator| (|UnaryOperation|) nil)

(de.setf.resource.schema:defclass |SquareRoot| (|UnaryOperation|) nil)

(de.setf.resource.schema:defclass |StandardDeviation|
                                  (|StatisticalOperation|)
                                  nil)

(de.setf.resource.schema:defclass |StatisticalOperation| (|Operation|) nil)

(de.setf.resource.schema:defclass |StochasticProcess|
                                  (|StatisticalOperation|)
                                  nil)

(de.setf.resource.schema:defclass |Subset| (|SetOperation|) nil)

(de.setf.resource.schema:defclass |Subtraction| (|BinaryOperation|) nil)

(de.setf.resource.schema:defclass |Sum| nil nil)

(de.setf.resource.schema:defclass |Summation| (|BinaryOperation|) nil)

(de.setf.resource.schema:defclass |Surface| (|GeometricalObject_2D|) nil)

(de.setf.resource.schema:defclass |SurfaceIntegral| (|Integral|) nil)

(de.setf.resource.schema:defclass |Tendency| (|PartialDerivative|) nil)

(de.setf.resource.schema:defclass |Tensor| (|Seq|) nil)

(de.setf.resource.schema:defclass |TensorField| (|Field|) nil)

(de.setf.resource.schema:defclass |TensorOrNill| nil nil)

(de.setf.resource.schema:defclass |Threshold| nil nil)

(de.setf.resource.schema:defclass |UnaryOperation| (|Operation|) nil)

(de.setf.resource.schema:defclass |Variable| (|NumericalEntity|) nil)

(de.setf.resource.schema:defclass |Variance| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |Variation| (|StatisticalOperation|) nil)

(de.setf.resource.schema:defclass |Vector| (|Array|) nil)

(de.setf.resource.schema:defclass |Vector_3D| (|Vector|) nil)

(de.setf.resource.schema:defclass |VectorField| (|Field|) nil)

(de.setf.resource.schema:defclass |VectorFieldOperation|
                                  (|OperationOnFunction|)
                                  nil)

(de.setf.resource.schema:defclass |VectorOrVariableOrOperation| nil nil)

(de.setf.resource.schema:defclass |VectorSubtraction| (|Subtraction|) nil)

(de.setf.resource.schema:defclass |VectorSummation| (|Summation|) nil)

(de.setf.resource.schema:defclass |WaveletTransform|
                                  (|OperationOnFunction|)
                                  nil)
