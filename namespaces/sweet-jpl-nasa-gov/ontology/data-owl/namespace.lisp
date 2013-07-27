;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://sweet.jpl.nasa.gov/ontology/data.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Access"
                                          "Analysis"
                                          "Archive"
                                          "Array"
                                          "ASCII"
                                          "BigEndian"
                                          "Binary"
                                          "BinaryMask"
                                          "ByteOrder"
                                          "Campaign"
                                          "Cell"
                                          "Character"
                                          "Collection"
                                          "Column"
                                          "Comment"
                                          "Compression"
                                          "CoordinateTransformation"
                                          "Data"
                                          "DataMining"
                                          "DataModel"
                                          "DataProduct"
                                          "DataService"
                                          "Dataset"
                                          "DatasetProperty"
                                          "DataStructure"
                                          "Delimiter"
                                          "Dimension"
                                          "Discovery"
                                          "DODS"
                                          "Ensemble"
                                          "Experiment"
                                          "Field"
                                          "File"
                                          "FileFormat"
                                          "FillValue"
                                          "FormatConversion"
                                          "GeoTIFF"
                                          "Grib"
                                          "Grid"
                                          "Gzip"
                                          "HDFEOS"
                                          "Header"
                                          "If"
                                          "Image"
                                          "Increment"
                                          "Input"
                                          "InterfaceProtocol"
                                          "Interpolation"
                                          "Investigation"
                                          "L1"
                                          "L2"
                                          "L3"
                                          "L4"
                                          "Layer"
                                          "Level1"
                                          "Level2"
                                          "Level3"
                                          "Level4"
                                          "LittleEndian"
                                          "Map"
                                          "MaximumValid"
                                          "Metadata"
                                          "MinimumValid"
                                          "MissingValue"
                                          "NearestNeighbor"
                                          "NetCDF"
                                          "Observation"
                                          "Offset"
                                          "OPeNDAP"
                                          "Output"
                                          "Parameter"
                                          "ParameterSubset"
                                          "Plot"
                                          "ProcessingLevel"
                                          "Profile"
                                          "Project"
                                          "Provenance"
                                          "Raster"
                                          "ReducedGrid"
                                          "Reformat"
                                          "Regridding"
                                          "Resolution"
                                          "Resource"
                                          "Row"
                                          "ScaleFactor"
                                          "Series"
                                          "Service"
                                          "Simulation"
                                          "SpatialSubset"
                                          "StratigraphicSequence"
                                          "Structure"
                                          "Subset"
                                          "Survey"
                                          "Swath"
                                          "Swath_2D"
                                          "Swath_3D"
                                          "SynopticMap"
                                          "TemporalSubset"
                                          "TimeStep"
                                          "Trajectory"
                                          "Value"
                                          "Variable"
                                          "Vector"
                                          "Version"
                                          "Visualization"
                                          "WCS"
                                          "WebCoverageServer"
                                          "WebFeatureServer"
                                          "WebMapServer"
                                          "WFS"
                                          "WMS"
                                          "Z")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://sweet.jpl.nasa.gov/ontology/data.owl#")
           (make-package "http://sweet.jpl.nasa.gov/ontology/data.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Access" "Analysis" "Archive" "Array" "ASCII" "BigEndian" "Binary"
             "BinaryMask" "ByteOrder" "Campaign" "Cell" "Character"
             "Collection" "Column" "Comment" "Compression"
             "CoordinateTransformation" "Data" "DataMining" "DataModel"
             "DataProduct" "DataService" "Dataset" "DatasetProperty"
             "DataStructure" "Delimiter" "Dimension" "Discovery" "DODS"
             "Ensemble" "Experiment" "Field" "File" "FileFormat" "FillValue"
             "FormatConversion" "GeoTIFF" "Grib" "Grid" "Gzip" "HDFEOS"
             "Header" "If" "Image" "Increment" "Input" "InterfaceProtocol"
             "Interpolation" "Investigation" "L1" "L2" "L3" "L4" "Layer"
             "Level1" "Level2" "Level3" "Level4" "LittleEndian" "Map"
             "MaximumValid" "Metadata" "MinimumValid" "MissingValue"
             "NearestNeighbor" "NetCDF" "Observation" "Offset" "OPeNDAP"
             "Output" "Parameter" "ParameterSubset" "Plot" "ProcessingLevel"
             "Profile" "Project" "Provenance" "Raster" "ReducedGrid" "Reformat"
             "Regridding" "Resolution" "Resource" "Row" "ScaleFactor" "Series"
             "Service" "Simulation" "SpatialSubset" "StratigraphicSequence"
             "Structure" "Subset" "Survey" "Swath" "Swath_2D" "Swath_3D"
             "SynopticMap" "TemporalSubset" "TimeStep" "Trajectory" "Value"
             "Variable" "Vector" "Version" "Visualization" "WCS"
             "WebCoverageServer" "WebFeatureServer" "WebMapServer" "WFS" "WMS"
             "Z"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://sweet.jpl.nasa.gov/ontology/data.owl#" :if-does-not-exist :load)