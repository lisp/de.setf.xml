;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://sweet.jpl.nasa.gov/sweet/numerics.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Anomaly"
                                          "Array"
                                          "ArrayOrNill"
                                          "Average"
                                          "BinaryOperation"
                                          "Boundary"
                                          "Budget"
                                          "Circle"
                                          "Circulation"
                                          "Convergence"
                                          "Coordinate"
                                          "Coordinates"
                                          "CoordinateSystem"
                                          "CrossProduct"
                                          "Curl"
                                          "Curve"
                                          "Deficit"
                                          "Derivative"
                                          "DifferntialFlux"
                                          "Distribution"
                                          "Distribution_1D"
                                          "Distribution_2D"
                                          "Distribution_3D"
                                          "Divergence"
                                          "Division"
                                          "DotProduct"
                                          "Excess"
                                          "Field"
                                          "Flux"
                                          "FourierTransform"
                                          "Fraction"
                                          "Function"
                                          "FuzzyPoint"
                                          "GeometricalObject"
                                          "GeometricalObject_0D"
                                          "GeometricalObject_1D"
                                          "GeometricalObject_2D"
                                          "GeometricalObject_3D"
                                          "Gradient"
                                          "GreatCircle"
                                          "Half"
                                          "Hyperplane"
                                          "Integral"
                                          "Interval"
                                          "LapseRate"
                                          "Line"
                                          "LineIntegral"
                                          "Logarithm"
                                          "Matrix"
                                          "Maximum"
                                          "Mean"
                                          "Minimum"
                                          "Multiplication"
                                          "Normalization"
                                          "NumericalEntity"
                                          "NumericalEntityOrOperation"
                                          "Operation"
                                          "OperationOnFunction"
                                          "Order"
                                          "OrderedPair"
                                          "PartialDerivative"
                                          "Peak"
                                          "Percentile"
                                          "Plane"
                                          "Point"
                                          "Polygon"
                                          "Polyhedron"
                                          "ProbabailityDensityFunction"
                                          "Quantity"
                                          "Rate"
                                          "Ratio"
                                          "Rectangle"
                                          "ReferenceSystem"
                                          "Scalar"
                                          "ScalarDivision"
                                          "ScalarField"
                                          "ScalarFieldOperation"
                                          "ScalarMultiplication"
                                          "ScalarOrVariableOrOperation"
                                          "ScalarSubtraction"
                                          "ScalarSummation"
                                          "Seq"
                                          "Sequence"
                                          "Set"
                                          "SetOperation"
                                          "Shear"
                                          "Skewness"
                                          "SmallCircle"
                                          "Spectrum"
                                          "Sphere"
                                          "Square"
                                          "SquareOperator"
                                          "SquareRoot"
                                          "StandardDeviation"
                                          "StatisticalOperation"
                                          "StochasticProcess"
                                          "Subset"
                                          "Subtraction"
                                          "Sum"
                                          "Summation"
                                          "Surface"
                                          "SurfaceIntegral"
                                          "Tendency"
                                          "Tensor"
                                          "TensorField"
                                          "TensorOrNill"
                                          "Threshold"
                                          "UnaryOperation"
                                          "Variable"
                                          "Variance"
                                          "Variation"
                                          "Vector"
                                          "Vector_3D"
                                          "VectorField"
                                          "VectorFieldOperation"
                                          "VectorOrVariableOrOperation"
                                          "VectorSubtraction"
                                          "VectorSummation"
                                          "WaveletTransform")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://sweet.jpl.nasa.gov/sweet/numerics.owl#")
           (make-package "http://sweet.jpl.nasa.gov/sweet/numerics.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Anomaly" "Array" "ArrayOrNill" "Average" "BinaryOperation"
             "Boundary" "Budget" "Circle" "Circulation" "Convergence"
             "Coordinate" "Coordinates" "CoordinateSystem" "CrossProduct"
             "Curl" "Curve" "Deficit" "Derivative" "DifferntialFlux"
             "Distribution" "Distribution_1D" "Distribution_2D"
             "Distribution_3D" "Divergence" "Division" "DotProduct" "Excess"
             "Field" "Flux" "FourierTransform" "Fraction" "Function"
             "FuzzyPoint" "GeometricalObject" "GeometricalObject_0D"
             "GeometricalObject_1D" "GeometricalObject_2D"
             "GeometricalObject_3D" "Gradient" "GreatCircle" "Half"
             "Hyperplane" "Integral" "Interval" "LapseRate" "Line"
             "LineIntegral" "Logarithm" "Matrix" "Maximum" "Mean" "Minimum"
             "Multiplication" "Normalization" "NumericalEntity"
             "NumericalEntityOrOperation" "Operation" "OperationOnFunction"
             "Order" "OrderedPair" "PartialDerivative" "Peak" "Percentile"
             "Plane" "Point" "Polygon" "Polyhedron"
             "ProbabailityDensityFunction" "Quantity" "Rate" "Ratio"
             "Rectangle" "ReferenceSystem" "Scalar" "ScalarDivision"
             "ScalarField" "ScalarFieldOperation" "ScalarMultiplication"
             "ScalarOrVariableOrOperation" "ScalarSubtraction"
             "ScalarSummation" "Seq" "Sequence" "Set" "SetOperation" "Shear"
             "Skewness" "SmallCircle" "Spectrum" "Sphere" "Square"
             "SquareOperator" "SquareRoot" "StandardDeviation"
             "StatisticalOperation" "StochasticProcess" "Subset" "Subtraction"
             "Sum" "Summation" "Surface" "SurfaceIntegral" "Tendency" "Tensor"
             "TensorField" "TensorOrNill" "Threshold" "UnaryOperation"
             "Variable" "Variance" "Variation" "Vector" "Vector_3D"
             "VectorField" "VectorFieldOperation" "VectorOrVariableOrOperation"
             "VectorSubtraction" "VectorSummation" "WaveletTransform"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://sweet.jpl.nasa.gov/sweet/numerics.owl#" :if-does-not-exist :load)
