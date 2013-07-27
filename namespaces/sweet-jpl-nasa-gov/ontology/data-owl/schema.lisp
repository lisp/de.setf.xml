;;; 20100513T131537Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/ontology/data.owl #x260E7CAE>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/data.owl#")
(de.setf.resource.schema:defclass |Access| (|DataService|) nil)

(de.setf.resource.schema:defclass |Analysis| (|Investigation|) nil)

(de.setf.resource.schema:defclass |Archive| (|DataService|) nil)

(de.setf.resource.schema:defclass |Array| (|DataStructure|) nil)

(de.setf.resource.schema:defclass ascii (|FileFormat|) nil)

(de.setf.resource.schema:defclass |BigEndian| (|ByteOrder|) nil)

(de.setf.resource.schema:defclass |Binary| (|FileFormat|) nil)

(de.setf.resource.schema:defclass |BinaryMask| (|Image|) nil)

(de.setf.resource.schema:defclass |ByteOrder| (|DatasetProperty|) nil)

(de.setf.resource.schema:defclass |Campaign| nil nil)

(de.setf.resource.schema:defclass |Cell| (|DataModel|) nil)

(de.setf.resource.schema:defclass |Character| nil nil)

(de.setf.resource.schema:defclass |Collection| nil nil)

(de.setf.resource.schema:defclass |Column| (|Dimension|) nil)

(de.setf.resource.schema:defclass |Comment| nil nil)

(de.setf.resource.schema:defclass |Compression| (|DatasetProperty|) nil)

(de.setf.resource.schema:defclass |CoordinateTransformation|
                                  (|DataService|)
                                  nil)

(de.setf.resource.schema:defclass |Data| nil nil)

(de.setf.resource.schema:defclass |DataMining| (|Subset|) nil)

(de.setf.resource.schema:defclass |DataModel|
                                  nil
                                  ((|hasByteOrder| :type |ByteOrder|)
                                   (|hasDatatype| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)
                                   (|hasFileFormat| :type |FileFormat|)
                                   (|hasSpatialProjection| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |DataProduct| nil nil)

(de.setf.resource.schema:defclass |DataService| (|Service|) nil)

(de.setf.resource.schema:defclass |Dataset|
                                  (|DataProduct|)
                                  ((|hasVersion| :type |Version|)
                                   (|hasFillValue| :type |FillValue|)
                                   (|hasProcessingLevel| :type
                                    |ProcessingLevel|)
                                   (|hasFileLocation| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |DatasetProperty| nil nil)

(de.setf.resource.schema:defclass |DataStructure| nil nil)

(de.setf.resource.schema:defclass |Delimiter| (|Character|) nil)

(de.setf.resource.schema:defclass |Dimension|
                                  nil
                                  ((|hasResolution| :type
                                    |http://www.w3.org/2000/01/rdf-schema#|:|Literal|)))

(de.setf.resource.schema:defclass |Discovery| (|DataService|) nil)

(de.setf.resource.schema:defclass dods nil nil)

(de.setf.resource.schema:defclass |Ensemble| nil nil)

(de.setf.resource.schema:defclass |Experiment| (|Investigation|) nil)

(de.setf.resource.schema:defclass |Field| nil nil)

(de.setf.resource.schema:defclass |File| nil nil)

(de.setf.resource.schema:defclass |FileFormat| nil nil)

(de.setf.resource.schema:defclass |FillValue| (|Value|) nil)

(de.setf.resource.schema:defclass |FormatConversion| (|DataService|) nil)

(de.setf.resource.schema:defclass |GeoTIFF| (|FileFormat|) nil)

(de.setf.resource.schema:defclass |Grib| (|FileFormat|) nil)

(de.setf.resource.schema:defclass |Grid| (|DataModel|) nil)

(de.setf.resource.schema:defclass |Gzip| (|Compression|) nil)

(de.setf.resource.schema:defclass hdfeos (|FileFormat|) nil)

(de.setf.resource.schema:defclass |Header| nil nil)

(de.setf.resource.schema:defclass |If| nil nil)

(de.setf.resource.schema:defclass |Image| (|DataProduct|) nil)

(de.setf.resource.schema:defclass |Increment| nil nil)

(de.setf.resource.schema:defclass |Input| nil nil)

(de.setf.resource.schema:defclass |InterfaceProtocol| (|DataService|) nil)

(de.setf.resource.schema:defclass |Interpolation| (|DataService|) nil)

(de.setf.resource.schema:defclass |Investigation| nil nil)

(de.setf.resource.schema:defclass l1 nil nil)

(de.setf.resource.schema:defclass l2 nil nil)

(de.setf.resource.schema:defclass l3 nil nil)

(de.setf.resource.schema:defclass l4 nil nil)

(de.setf.resource.schema:defclass |Layer| nil nil)

(de.setf.resource.schema:defclass |Level1| (|ProcessingLevel|) nil)

(de.setf.resource.schema:defclass |Level2| (|ProcessingLevel|) nil)

(de.setf.resource.schema:defclass |Level3| (|ProcessingLevel|) nil)

(de.setf.resource.schema:defclass |Level4| (|ProcessingLevel|) nil)

(de.setf.resource.schema:defclass |LittleEndian| (|ByteOrder|) nil)

(de.setf.resource.schema:defclass |Map| (|DataProduct|) nil)

(de.setf.resource.schema:defclass |MaximumValid| (|Value|) nil)

(de.setf.resource.schema:defclass |Metadata| nil nil)

(de.setf.resource.schema:defclass |MinimumValid| (|Value|) nil)

(de.setf.resource.schema:defclass |MissingValue| (|Value|) nil)

(de.setf.resource.schema:defclass |NearestNeighbor| (|Interpolation|) nil)

(de.setf.resource.schema:defclass |NetCDF| (|FileFormat|) nil)

(de.setf.resource.schema:defclass |Observation| (|Investigation|) nil)

(de.setf.resource.schema:defclass |Offset| (|Value|) nil)

(de.setf.resource.schema:defclass OP\eNDAP (|InterfaceProtocol|) nil)

(de.setf.resource.schema:defclass |Output| nil nil)

(de.setf.resource.schema:defclass |Parameter| nil nil)

(de.setf.resource.schema:defclass |ParameterSubset| (|Subset|) nil)

(de.setf.resource.schema:defclass |Plot| (|Visualization|) nil)

(de.setf.resource.schema:defclass |ProcessingLevel| (|DatasetProperty|) nil)

(de.setf.resource.schema:defclass |Profile| (|DataProduct|) nil)

(de.setf.resource.schema:defclass |Project| nil nil)

(de.setf.resource.schema:defclass |Provenance| nil nil)

(de.setf.resource.schema:defclass |Raster| nil nil)

(de.setf.resource.schema:defclass |ReducedGrid| (|Grid|) nil)

(de.setf.resource.schema:defclass |Reformat| (|DataService|) nil)

(de.setf.resource.schema:defclass |Regridding| (|DataService|) nil)

(de.setf.resource.schema:defclass |Resolution| (|Increment|) nil)

(de.setf.resource.schema:defclass |Resource| nil nil)

(de.setf.resource.schema:defclass |Row| (|Dimension|) nil)

(de.setf.resource.schema:defclass |ScaleFactor| (|Value|) nil)

(de.setf.resource.schema:defclass |Series| (|DataModel|) nil)

(de.setf.resource.schema:defclass |Service| nil nil)

(de.setf.resource.schema:defclass |Simulation| (|Investigation|) nil)

(de.setf.resource.schema:defclass |SpatialSubset| (|Subset|) nil)

(de.setf.resource.schema:defclass |StratigraphicSequence| (|DataProduct|) nil)

(de.setf.resource.schema:defclass |Structure| (|DataStructure|) nil)

(de.setf.resource.schema:defclass |Subset| (|DataService|) nil)

(de.setf.resource.schema:defclass |Survey| (|DataProduct|) nil)

(de.setf.resource.schema:defclass |Swath| (|DataModel|) nil)

(de.setf.resource.schema:defclass |Swath_2D| (|Swath|) nil)

(de.setf.resource.schema:defclass |Swath_3D| (|Swath|) nil)

(de.setf.resource.schema:defclass |SynopticMap| (|Map|) nil)

(de.setf.resource.schema:defclass |TemporalSubset| (|Subset|) nil)

(de.setf.resource.schema:defclass |TimeStep| (|Increment|) nil)

(de.setf.resource.schema:defclass |Trajectory| (|DataModel|) nil)

(de.setf.resource.schema:defclass |Value| nil nil)

(de.setf.resource.schema:defclass |Variable| nil nil)

(de.setf.resource.schema:defclass |Vector| (|DataModel|) nil)

(de.setf.resource.schema:defclass |Version| nil nil)

(de.setf.resource.schema:defclass |Visualization| (|DataService|) nil)

(de.setf.resource.schema:defclass wcs nil nil)

(de.setf.resource.schema:defclass |WebCoverageServer| (|InterfaceProtocol|) nil)

(de.setf.resource.schema:defclass |WebFeatureServer| (|InterfaceProtocol|) nil)

(de.setf.resource.schema:defclass |WebMapServer| (|InterfaceProtocol|) nil)

(de.setf.resource.schema:defclass wfs nil nil)

(de.setf.resource.schema:defclass wms nil nil)

(de.setf.resource.schema:defclass z (|Compression|) nil)
