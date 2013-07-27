;;; 20100513T131512Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/ontology/space.owl #x23497316>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/space.owl#")
(de.setf.resource.schema:defclass |AdministrativeBoundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Boundary|)
                                  nil)

(de.setf.resource.schema:defclass |AdministrativeDivision| nil nil)

(de.setf.resource.schema:defclass |AdministrativeRegion|
                                  (|Region|)
                                  ((|hasCapital| :type |City|)))

(de.setf.resource.schema:defclass |AlbersConicalEqualArea|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Arc|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject_1D|)
                                  nil)

(de.setf.resource.schema:defclass |AstronomicalCoordinateSystem|
                                  (|GeographicCoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Attitude| (|Direction|) nil)

(de.setf.resource.schema:defclass |Axis| nil nil)

(de.setf.resource.schema:defclass |Azimuth| (|Direction|) nil)

(de.setf.resource.schema:defclass |AzimuthalEquidistant|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Barrier| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |Base| nil nil)

(de.setf.resource.schema:defclass |Bearing| nil nil)

(de.setf.resource.schema:defclass |Big| (|SizeCategory|) nil)

(de.setf.resource.schema:defclass |Body| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |Bottom|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Maximum|)
                                  nil)

(de.setf.resource.schema:defclass |BoundingBox| (|Region|) nil)

(de.setf.resource.schema:defclass |Broken| (|SpatialDistribution|) nil)

(de.setf.resource.schema:defclass |CartesianCoordinates|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Coordinates|)
                                  nil)

(de.setf.resource.schema:defclass |CartesianCoordinateSystem|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Center| (|Direction|) nil)

(de.setf.resource.schema:defclass |City| (|AdministrativeRegion|) nil)

(de.setf.resource.schema:defclass |Country| (|AdministrativeRegion|) nil)

(de.setf.resource.schema:defclass |County| (|AdministrativeRegion|) nil)

(de.setf.resource.schema:defclass |Declination| (|Direction|) nil)

(de.setf.resource.schema:defclass |Deep| (|DepthCategory|) nil)

(de.setf.resource.schema:defclass |DepthCategory| (|SpatialExtentCategory|) nil)

(de.setf.resource.schema:defclass |Direction|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Vector_3D|)
                                  nil)

(de.setf.resource.schema:defclass |DistanceCategory|
                                  (|SpatialExtentCategory|)
                                  nil)

(de.setf.resource.schema:defclass |Down| (|Direction|) nil)

(de.setf.resource.schema:defclass |Downward| nil nil)

(de.setf.resource.schema:defclass |East| (|Direction|) nil)

(de.setf.resource.schema:defclass |Eastward| nil nil)

(de.setf.resource.schema:defclass |Edge| nil nil)

(de.setf.resource.schema:defclass |EquidistantConic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Equirectangular|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Floor| nil nil)

(de.setf.resource.schema:defclass |GeneralVerticalNearSidedPespe|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |GeodeticCoordinateSystem|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |GeographicalCoordinates|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Coordinates|)
                                  nil)

(de.setf.resource.schema:defclass |GeographicCoordinateSystem|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Geoid|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Surface|)
                                  nil)

(de.setf.resource.schema:defclass |GeoReferenceInformation| nil nil)

(de.setf.resource.schema:defclass |Gnomic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Grid| nil nil)

(de.setf.resource.schema:defclass |Horizon| nil nil)

(de.setf.resource.schema:defclass |HorizontalCoordinate|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Coordinate|)
                                  ((|northOf| :type |HorizontalCoordinate|)
                                   (|southOf| :type |HorizontalCoordinate|)
                                   (|westOf| :type |HorizontalCoordinate|)
                                   (|eastOf| :type |HorizontalCoordinate|)))

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Boundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Coordinate|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#GeometricalObject_1D|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#GeometricalObject_2D|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#GeometricalObject_3D|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Polygon|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject_2D|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Sphere|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject_3D|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Surface|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject_2D|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#SpatialExtent|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/units.owl#SimpleUnit|
                                  (|http://sweet.jpl.nasa.gov/ontology/units.owl#|::|DerivedUnit|)
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2002/07/owl#Thing| nil nil)

(de.setf.resource.schema:defclass |HybridHeight| (|VerticalCoordinate|) nil)

(de.setf.resource.schema:defclass |Inclination| nil nil)

(de.setf.resource.schema:defclass |Incoming| (|Direction|) nil)

(de.setf.resource.schema:defclass |LambertAzimuthalEqualArea|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |LambertConformalConic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Latitude| (|HorizontalCoordinate|) nil)

(de.setf.resource.schema:defclass |LatitudeInterval|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Interval|)
                                  nil)

(de.setf.resource.schema:defclass |LatLonBox| (|BoundingBox|) nil)

(de.setf.resource.schema:defclass |Layer|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject_3D|)
                                  nil)

(de.setf.resource.schema:defclass |Level| nil nil)

(de.setf.resource.schema:defclass |LocalCoordinateSystem|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  ((|hasGeoReferenceInformation| :type
                                    |GeoReferenceInformation|)))

(de.setf.resource.schema:defclass |LocalPlanarCoordinateSystem|
                                  (|LocalCoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Location| nil nil)

(de.setf.resource.schema:defclass |Longitude| (|HorizontalCoordinate|) nil)

(de.setf.resource.schema:defclass |LongitudeInterval|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Interval|)
                                  nil)

(de.setf.resource.schema:defclass |Margin| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |Mercator|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Meridian| (|Arc|) nil)

(de.setf.resource.schema:defclass |MillerCylindrical|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |ModifiedStereographic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |North| (|Direction|) nil)

(de.setf.resource.schema:defclass |Northward| nil nil)

(de.setf.resource.schema:defclass |ObliqueMercator|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Obstruction| (|Barrier|) nil)

(de.setf.resource.schema:defclass |Orbit| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |Outgoing| (|Direction|) nil)

(de.setf.resource.schema:defclass |Outside| (|Direction|) nil)

(de.setf.resource.schema:defclass |Overcast| (|SpatialDistribution|) nil)

(de.setf.resource.schema:defclass |Patch| (|SpatialDistribution|) nil)

(de.setf.resource.schema:defclass |PolarStereographic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |PoliticalDivision| nil nil)

(de.setf.resource.schema:defclass |Polyconic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |Position| nil nil)

(de.setf.resource.schema:defclass |PressureCoordinate|
                                  (|VerticalCoordinate|)
                                  nil)

(de.setf.resource.schema:defclass |Profile| nil nil)

(de.setf.resource.schema:defclass |Projection| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |Province| (|AdministrativeRegion|) nil)

(de.setf.resource.schema:defclass |R-Coordinate| (|HorizontalCoordinate|) nil)

(de.setf.resource.schema:defclass |Radial| (|Direction|) nil)

(de.setf.resource.schema:defclass |Region|
                                  (|SpatialObject|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject_2D|)
                                  nil)

(de.setf.resource.schema:defclass |Relief| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |RightAscension| (|Direction|) nil)

(de.setf.resource.schema:defclass |Robinson|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |RotatedLaatitudeLongitude|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |S-Coordinate| (|VerticalCoordinate|) nil)

(de.setf.resource.schema:defclass |SeaLevel|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Surface|)
                                  nil)

(de.setf.resource.schema:defclass |Shadow| (|Projection|) nil)

(de.setf.resource.schema:defclass |Shallow| (|DepthCategory|) nil)

(de.setf.resource.schema:defclass |Sigma| (|VerticalCoordinate|) nil)

(de.setf.resource.schema:defclass |Sinusoidal|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |SizeCategory| (|SpatialExtentCategory|) nil)

(de.setf.resource.schema:defclass |Slope| (|SpatialObject|) nil)

(de.setf.resource.schema:defclass |Small| (|SizeCategory|) nil)

(de.setf.resource.schema:defclass |South| (|Direction|) nil)

(de.setf.resource.schema:defclass |Southward| nil nil)

(de.setf.resource.schema:defclass |SpaceObliqueMercator|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |SpatialDistribution| nil nil)

(de.setf.resource.schema:defclass |SpatialExtentCategory| nil nil)

(de.setf.resource.schema:defclass |SpatialObject|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject|)
                                  ((|hasLongitudeInterval| :type
                                    |LongitudeInterval|)
                                   (|hasLatitudeInterval| :type
                                    |LatitudeInterval|)))

(de.setf.resource.schema:defclass |SpatialReferenceSystem| nil nil)

(de.setf.resource.schema:defclass |SpatialScale| nil nil)

(de.setf.resource.schema:defclass |State| (|AdministrativeRegion|) nil)

(de.setf.resource.schema:defclass |Stereographic|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |StratigraphicSequence| (|Stratigraphy|) nil)

(de.setf.resource.schema:defclass |Stratigraphy| (|VerticalProfile|) nil)

(de.setf.resource.schema:defclass |Top| nil nil)

(de.setf.resource.schema:defclass |TransverseMercator|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |TraverseMercator|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |UniversalTraverseMercator|
                                  (|TraverseMercator|)
                                  nil)

(de.setf.resource.schema:defclass |UniversalTraverseMercatorCoordinates|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Coordinates|)
                                  nil)

(de.setf.resource.schema:defclass |Up| (|Direction|) nil)

(de.setf.resource.schema:defclass |Upper| nil nil)

(de.setf.resource.schema:defclass |UpperLevel| (|Level|) nil)

(de.setf.resource.schema:defclass |Upward| nil nil)

(de.setf.resource.schema:defclass |VanDeGrinten|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|CoordinateSystem|)
                                  nil)

(de.setf.resource.schema:defclass |VerticalCoordinate|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Coordinate|)
                                  ((|above| :type |VerticalCoordinate|)
                                   (|below| :type |VerticalCoordinate|)))

(de.setf.resource.schema:defclass |VerticalProfile| (|Profile|) nil)

(de.setf.resource.schema:defclass |Vicinity| (|DistanceCategory|) nil)

(de.setf.resource.schema:defclass |West| (|Direction|) nil)

(de.setf.resource.schema:defclass |Westward| nil nil)

(de.setf.resource.schema:defclass |XCoordinate| (|HorizontalCoordinate|) nil)

(de.setf.resource.schema:defclass |YCoordinate| (|HorizontalCoordinate|) nil)

(de.setf.resource.schema:defclass |ZCoordinate| (|VerticalCoordinate|) nil)

(de.setf.resource.schema:defclass |ZenithAngle| (|Direction|) nil)

(de.setf.resource.schema:defclass |Zone| nil nil)

(de.setf.resource.schema:defclass |ZoneCode| (|HorizontalCoordinate|) nil)
