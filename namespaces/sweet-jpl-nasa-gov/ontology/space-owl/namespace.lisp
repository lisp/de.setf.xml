;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://sweet.jpl.nasa.gov/ontology/space.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "AdministrativeBoundary"
                                          "AdministrativeDivision"
                                          "AdministrativeRegion"
                                          "AlbersConicalEqualArea"
                                          "Arc"
                                          "AstronomicalCoordinateSystem"
                                          "Attitude"
                                          "Axis"
                                          "Azimuth"
                                          "AzimuthalEquidistant"
                                          "Barrier"
                                          "Base"
                                          "Bearing"
                                          "Big"
                                          "Body"
                                          "Bottom"
                                          "BoundingBox"
                                          "Broken"
                                          "CartesianCoordinates"
                                          "CartesianCoordinateSystem"
                                          "Center"
                                          "City"
                                          "Country"
                                          "County"
                                          "Declination"
                                          "Deep"
                                          "DepthCategory"
                                          "Direction"
                                          "DistanceCategory"
                                          "Down"
                                          "Downward"
                                          "East"
                                          "Eastward"
                                          "Edge"
                                          "EquidistantConic"
                                          "Equirectangular"
                                          "Floor"
                                          "GeneralVerticalNearSidedPespe"
                                          "GeodeticCoordinateSystem"
                                          "GeographicalCoordinates"
                                          "GeographicCoordinateSystem"
                                          "Geoid"
                                          "GeoReferenceInformation"
                                          "Gnomic"
                                          "Grid"
                                          "Horizon"
                                          "HorizontalCoordinate"
                                          "HybridHeight"
                                          "Inclination"
                                          "Incoming"
                                          "LambertAzimuthalEqualArea"
                                          "LambertConformalConic"
                                          "Latitude"
                                          "LatitudeInterval"
                                          "LatLonBox"
                                          "Layer"
                                          "Level"
                                          "LocalCoordinateSystem"
                                          "LocalPlanarCoordinateSystem"
                                          "Location"
                                          "Longitude"
                                          "LongitudeInterval"
                                          "Margin"
                                          "Mercator"
                                          "Meridian"
                                          "MillerCylindrical"
                                          "ModifiedStereographic"
                                          "North"
                                          "Northward"
                                          "ObliqueMercator"
                                          "Obstruction"
                                          "Orbit"
                                          "Outgoing"
                                          "Outside"
                                          "Overcast"
                                          "Patch"
                                          "PolarStereographic"
                                          "PoliticalDivision"
                                          "Polyconic"
                                          "Position"
                                          "PressureCoordinate"
                                          "Profile"
                                          "Projection"
                                          "Province"
                                          "R-Coordinate"
                                          "Radial"
                                          "Region"
                                          "Relief"
                                          "RightAscension"
                                          "Robinson"
                                          "RotatedLaatitudeLongitude"
                                          "S-Coordinate"
                                          "SeaLevel"
                                          "Shadow"
                                          "Shallow"
                                          "Sigma"
                                          "Sinusoidal"
                                          "SizeCategory"
                                          "Slope"
                                          "Small"
                                          "South"
                                          "Southward"
                                          "SpaceObliqueMercator"
                                          "SpatialDistribution"
                                          "SpatialExtentCategory"
                                          "SpatialObject"
                                          "SpatialReferenceSystem"
                                          "SpatialScale"
                                          "State"
                                          "Stereographic"
                                          "StratigraphicSequence"
                                          "Stratigraphy"
                                          "Top"
                                          "TransverseMercator"
                                          "TraverseMercator"
                                          "UniversalTraverseMercator"
                                          "UniversalTraverseMercatorCoordinates"
                                          "Up"
                                          "Upper"
                                          "UpperLevel"
                                          "Upward"
                                          "VanDeGrinten"
                                          "VerticalCoordinate"
                                          "VerticalProfile"
                                          "Vicinity"
                                          "West"
                                          "Westward"
                                          "XCoordinate"
                                          "YCoordinate"
                                          "ZCoordinate"
                                          "ZenithAngle"
                                          "Zone"
                                          "ZoneCode")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://sweet.jpl.nasa.gov/ontology/space.owl#")
           (make-package "http://sweet.jpl.nasa.gov/ontology/space.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("AdministrativeBoundary" "AdministrativeDivision"
             "AdministrativeRegion" "AlbersConicalEqualArea" "Arc"
             "AstronomicalCoordinateSystem" "Attitude" "Axis" "Azimuth"
             "AzimuthalEquidistant" "Barrier" "Base" "Bearing" "Big" "Body"
             "Bottom" "BoundingBox" "Broken" "CartesianCoordinates"
             "CartesianCoordinateSystem" "Center" "City" "Country" "County"
             "Declination" "Deep" "DepthCategory" "Direction"
             "DistanceCategory" "Down" "Downward" "East" "Eastward" "Edge"
             "EquidistantConic" "Equirectangular" "Floor"
             "GeneralVerticalNearSidedPespe" "GeodeticCoordinateSystem"
             "GeographicalCoordinates" "GeographicCoordinateSystem" "Geoid"
             "GeoReferenceInformation" "Gnomic" "Grid" "Horizon"
             "HorizontalCoordinate" "HybridHeight" "Inclination" "Incoming"
             "LambertAzimuthalEqualArea" "LambertConformalConic" "Latitude"
             "LatitudeInterval" "LatLonBox" "Layer" "Level"
             "LocalCoordinateSystem" "LocalPlanarCoordinateSystem" "Location"
             "Longitude" "LongitudeInterval" "Margin" "Mercator" "Meridian"
             "MillerCylindrical" "ModifiedStereographic" "North" "Northward"
             "ObliqueMercator" "Obstruction" "Orbit" "Outgoing" "Outside"
             "Overcast" "Patch" "PolarStereographic" "PoliticalDivision"
             "Polyconic" "Position" "PressureCoordinate" "Profile" "Projection"
             "Province" "R-Coordinate" "Radial" "Region" "Relief"
             "RightAscension" "Robinson" "RotatedLaatitudeLongitude"
             "S-Coordinate" "SeaLevel" "Shadow" "Shallow" "Sigma" "Sinusoidal"
             "SizeCategory" "Slope" "Small" "South" "Southward"
             "SpaceObliqueMercator" "SpatialDistribution"
             "SpatialExtentCategory" "SpatialObject" "SpatialReferenceSystem"
             "SpatialScale" "State" "Stereographic" "StratigraphicSequence"
             "Stratigraphy" "Top" "TransverseMercator" "TraverseMercator"
             "UniversalTraverseMercator" "UniversalTraverseMercatorCoordinates"
             "Up" "Upper" "UpperLevel" "Upward" "VanDeGrinten"
             "VerticalCoordinate" "VerticalProfile" "Vicinity" "West"
             "Westward" "XCoordinate" "YCoordinate" "ZCoordinate" "ZenithAngle"
             "Zone" "ZoneCode"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://sweet.jpl.nasa.gov/ontology/space.owl#" :if-does-not-exist :load)
