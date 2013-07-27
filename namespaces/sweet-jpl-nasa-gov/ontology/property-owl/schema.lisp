;;; 20100513T131519Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/ontology/property.owl #x239CEFAE>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/property.owl#")
(de.setf.resource.schema:defclass |AbsoluteVorticity| (|Vorticity|) nil)

(de.setf.resource.schema:defclass |Absorptance|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Acceleration| (|MotionRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |AcousticRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Active| (|BinaryProperty|) nil)

(de.setf.resource.schema:defclass |AerodynamicsRelatedQuantity|
                                  (|MotionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Albedo|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Alkalinity| (|ChemicalQuantity|) nil)

(de.setf.resource.schema:defclass |Altitude| (|Height|) nil)

(de.setf.resource.schema:defclass |AmbientNoise| (|Noise|) nil)

(de.setf.resource.schema:defclass |Amplitude|
                                  (|OscillationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |AngstromExponent|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Anisotropy|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Area| (|SpatialExtentRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |AtmosphericPressure| (|Pressure|) nil)

(de.setf.resource.schema:defclass |BarometricAltitude| (|Altitude|) nil)

(de.setf.resource.schema:defclass |BarortopicStreamfunction|
                                  (|Streamfunction|)
                                  nil)

(de.setf.resource.schema:defclass |Bathymetry| (|Depth|) nil)

(de.setf.resource.schema:defclass |BenthicIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |BinaryProperty| nil nil)

(de.setf.resource.schema:defclass |Bioavailability| (|BiologicalQuantity|) nil)

(de.setf.resource.schema:defclass |BiologicalQuantity|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Quantity|)
                                  nil)

(de.setf.resource.schema:defclass |Biomass| (|BiologicalQuantity|) nil)

(de.setf.resource.schema:defclass |BlockingIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |BowenRatio|
                                  (|RadiationBalanceRelatedQuantity|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Ratio|)
                                  nil)

(de.setf.resource.schema:defclass |Brightness|
                                  (|ElectromagneticRadiationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |BrightnessTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |BruntVaisalaFrequency| (|Frequency|) nil)

(de.setf.resource.schema:defclass |BulkDensity| (|Density|) nil)

(de.setf.resource.schema:defclass |Capacity| (|PhysicalQuantity|) nil)

(de.setf.resource.schema:defclass |Ceiling| (|VerticalExtent|) nil)

(de.setf.resource.schema:defclass |Characteristics| (|Quantity|) nil)

(de.setf.resource.schema:defclass |ChemicalQuantity|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Quantity|)
                                  nil)

(de.setf.resource.schema:defclass |CirculationIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Classification| (|Quantity|) nil)

(de.setf.resource.schema:defclass |Closed| (|BinaryProperty|) nil)

(de.setf.resource.schema:defclass |CloudForcing| (|RadiativeForcing|) nil)

(de.setf.resource.schema:defclass |CoefficientOfExpansion|
                                  (|MediumProperty|)
                                  nil)

(de.setf.resource.schema:defclass |Color|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Comminution| (|Size|) nil)

(de.setf.resource.schema:defclass |CommonSenseClimateIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Composition|
                                  (|CompositionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |CompositionRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Conductivity| (|MediumProperty|) nil)

(de.setf.resource.schema:defclass |Consistence| (|SolidMaterialProperty|) nil)

(de.setf.resource.schema:defclass |Convergence|
                                  (|VelocityFieldRelatedProperty|)
                                  nil)

(de.setf.resource.schema:defclass |CoriolisParameter| nil nil)

(de.setf.resource.schema:defclass |Count|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Quantity|)
                                  ((|hasObjectOfCount| :type
                                    |http://www.w3.org/2002/07/owl#|:|Thing|)))

(de.setf.resource.schema:defclass |CropMoistureIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |CrossSection|
                                  (|Radiation-MediumInteractionRelatedQuantity|
                                   |Area|)
                                  nil)

(de.setf.resource.schema:defclass |DegreeDay|
                                  (|TemperatureRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |DeicedTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |Density|
                                  (|MassConcentrationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Depth| (|VerticalExtent|) nil)

(de.setf.resource.schema:defclass |Description| (|Quantity|) nil)

(de.setf.resource.schema:defclass |DewPoint| nil nil)

(de.setf.resource.schema:defclass |DewPointDepression|
                                  (|Temperature|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|ScalarSubtraction|)
                                  nil)

(de.setf.resource.schema:defclass |DewPointTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |DifferentialPressure|
                                  (|AerodynamicsRelatedQuantity|
                                   |PressureRelatedQuantity|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|ScalarSubtraction|)
                                  nil)

(de.setf.resource.schema:defclass |Dissipation| (|EnergyRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |DissolvedConcentration|
                                  (|MassConcentration|)
                                  nil)

(de.setf.resource.schema:defclass |Distance| (|LinearExtent|) nil)

(de.setf.resource.schema:defclass |Distribution| (|Quantity|) nil)

(de.setf.resource.schema:defclass |Divergence|
                                  (|VelocityFieldRelatedProperty|)
                                  nil)

(de.setf.resource.schema:defclass |Dormant| (|BinaryProperty|) nil)

(de.setf.resource.schema:defclass |DragCoefficient|
                                  (|AerodynamicsRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |DryBulbTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |DynamicViscosity| (|FluidProperty|) nil)

(de.setf.resource.schema:defclass |EathquakeMagnitude| (|Index|) nil)

(de.setf.resource.schema:defclass |ElectricField|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Field|
                                   |ElectricityRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |ElectricityRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |ElectricPotential|
                                  (|ElectricityRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |ElectromagneticFieldRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |ElectromagneticRadiationRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Elevation| (|Height|) nil)

(de.setf.resource.schema:defclass |Emissivity|
                                  (|ElectromagneticRadiationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Energy| (|EnergyRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |EnergyRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Enthalpy| (|Energy|) nil)

(de.setf.resource.schema:defclass |EquivalentTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |EquivalentThickness| (|Thickness|) nil)

(de.setf.resource.schema:defclass |ErtelPotentialVorticity| (|Vorticity|) nil)

(de.setf.resource.schema:defclass |ExchangeCapacity| nil nil)

(de.setf.resource.schema:defclass |ExnerFunction| (|Index|) nil)

(de.setf.resource.schema:defclass |Exotic| (|Description|) nil)

(de.setf.resource.schema:defclass |ExtensiveQuantity| (|PhysicalQuantity|) nil)

(de.setf.resource.schema:defclass |Extent| nil nil)

(de.setf.resource.schema:defclass |Extinct| (|BinaryProperty|) nil)

(de.setf.resource.schema:defclass |ExtinctionCoefficient|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass f10.7 (|Irradiance|) nil)

(de.setf.resource.schema:defclass |Fertility| (|BiologicalQuantity|) nil)

(de.setf.resource.schema:defclass |Fetch| (|Distance|) nil)

(de.setf.resource.schema:defclass |FieldCapacity|
                                  (|Capacity| |WaterConcentration|)
                                  nil)

(de.setf.resource.schema:defclass |FieldStrength| nil nil)

(de.setf.resource.schema:defclass |FineStructure| (|Structure|) nil)

(de.setf.resource.schema:defclass |FireWeatherIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |FluidProperty| (|MediumProperty|) nil)

(de.setf.resource.schema:defclass |Force| nil nil)

(de.setf.resource.schema:defclass |ForestFireDangerIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Frequency|
                                  (|OscillationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |GeoMagneticField| (|MagneticField|) nil)

(de.setf.resource.schema:defclass |GeomagneticIndex|
                                  (|MagnetismRelatedQuantity| |Index|)
                                  nil)

(de.setf.resource.schema:defclass |Geopotential|
                                  (|GravitationalRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |GeopotentialHeight|
                                  (|GravitationalRelatedQuantity| |Height|)
                                  nil)

(de.setf.resource.schema:defclass |GeotechnicalProperty|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |GravitationalRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |GravityField|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Field|
                                   |GravitationalRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |GravityForce|
                                  (|GravitationalRelatedQuantity| |Force|)
                                  nil)

(de.setf.resource.schema:defclass |Habitat| (|SpatialRange|) nil)

(de.setf.resource.schema:defclass |HallConductivity| (|Conductivity|) nil)

(de.setf.resource.schema:defclass |Health| (|BiologicalQuantity|) nil)

(de.setf.resource.schema:defclass |Heat| (|Energy|) nil)

(de.setf.resource.schema:defclass |HeatCapacity|
                                  (|TemperatureRelatedQuantity| |Capacity|)
                                  nil)

(de.setf.resource.schema:defclass |HeatEnergy| nil nil)

(de.setf.resource.schema:defclass |Height| (|VerticalExtent|) nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/human_activities.owl#Human|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Field|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Interval|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Quantity|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Ratio|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#ScalarSubtraction|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#Direction|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Vector_3D|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/time.owl#Age|
                                  (|http://sweet.jpl.nasa.gov/ontology/time.owl#|::|TimeInterval|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/time.owl#Hydroperiod|
                                  (|http://sweet.jpl.nasa.gov/ontology/time.owl#|::|TimeInterval|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/time.owl#SunshineDuration|
                                  (|http://sweet.jpl.nasa.gov/ontology/time.owl#|::|TimeInterval|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/time.owl#TimeInterval|
                                  (|TimeRelatedQuantity|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Interval|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/units.owl#BaseUnit|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/units.owl#ComplexUnit|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/units.owl#UnitDerivedByRaisingToPower|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2002/07/owl#Thing| nil nil)

(de.setf.resource.schema:defclass |Humidity|
                                  (|Moisture| |WaterConcentration|)
                                  nil)

(de.setf.resource.schema:defclass |HumidityIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |HydraulicConductivity|
                                  (|SolidMaterialProperty|)
                                  nil)

(de.setf.resource.schema:defclass |HydroPattern| (|Pattern|) nil)

(de.setf.resource.schema:defclass |HydrostaticPressure| (|Pressure|) nil)

(de.setf.resource.schema:defclass |Impedance| (|PhysicalQuantity|) nil)

(de.setf.resource.schema:defclass |Index|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Quantity|)
                                  nil)

(de.setf.resource.schema:defclass |Inductance|
                                  (|ElectromagneticFieldRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Insolation|
                                  (|ElectromagneticRadiationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |IntensiveQuantity| (|PhysicalQuantity|) nil)

(de.setf.resource.schema:defclass |Irradiance|
                                  (|ElectromagneticRadiationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |KaplanSstIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |KinematicViscosity| (|FluidProperty|) nil)

(de.setf.resource.schema:defclass |KineticEnergy| (|Energy|) nil)

(de.setf.resource.schema:defclass |Kp| (|GeomagneticIndex|) nil)

(de.setf.resource.schema:defclass |LatentHeat| (|Heat|) nil)

(de.setf.resource.schema:defclass |LeafAreaIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Length| (|LinearExtent|) nil)

(de.setf.resource.schema:defclass |Level| (|Quantity|) nil)

(de.setf.resource.schema:defclass |LinearExtent|
                                  (|SpatialExtentRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |LiquidWaterEquivalent|
                                  (|WaterConcentration|)
                                  nil)

(de.setf.resource.schema:defclass |MagneticField|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Field|
                                   |MagnetismRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MagneticInduction|
                                  (|MagnetismRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MagnetismRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Mass| (|MassRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |MassConcentration|
                                  (|MassConcentrationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MassConcentrationRelatedQuantity|
                                  (|MassRelatedQuantity|
                                   |CompositionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MassContent|
                                  (|MassConcentrationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MassRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MediumProperty| (|PhysicalQuantity|) nil)

(de.setf.resource.schema:defclass |MeridionalOvertuningStreamfunction|
                                  (|Streamfunction|)
                                  nil)

(de.setf.resource.schema:defclass |Microstructure| (|Structure|) nil)

(de.setf.resource.schema:defclass |Moisture| nil nil)

(de.setf.resource.schema:defclass |MoleFraction|
                                  (|SubstanceConcentrationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Momentum|
                                  (|MotionRelatedQuantity|
                                   |MassRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |MotionRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Noise| (|AcousticRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |NorthAtlanticOscillationIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |NorthPacificOscillationIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Omega| (|MotionRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |Open| (|BinaryProperty|) nil)

(de.setf.resource.schema:defclass |OpticalDepth| nil nil)

(de.setf.resource.schema:defclass |OpticalThickness|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |OscillationRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |OxygenDemand| (|BiologicalQuantity|) nil)

(de.setf.resource.schema:defclass |PartialPressure| (|Pressure|) nil)

(de.setf.resource.schema:defclass |Pattern| (|Description|) nil)

(de.setf.resource.schema:defclass |PedersenConductivity| (|Conductivity|) nil)

(de.setf.resource.schema:defclass \pH (|ChemicalQuantity|) nil)

(de.setf.resource.schema:defclass |Phase| (|OscillationRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |PhotolysisRate|
                                  (|CompositionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |PhysicalQuantity|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Quantity|)
                                  nil)

(de.setf.resource.schema:defclass |Pigment| (|Color|) nil)

(de.setf.resource.schema:defclass |Plasticity| (|SolidMaterialProperty|) nil)

(de.setf.resource.schema:defclass |Population| (|Count|) nil)

(de.setf.resource.schema:defclass |Porosity| (|SolidMaterialProperty|) nil)

(de.setf.resource.schema:defclass |PotentialDensity| (|Density|) nil)

(de.setf.resource.schema:defclass |PotentialEnergy| (|Energy|) nil)

(de.setf.resource.schema:defclass |PotentialTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |PotentialVorticity| (|Vorticity|) nil)

(de.setf.resource.schema:defclass |Precipitable| (|WaterConcentration|) nil)

(de.setf.resource.schema:defclass |Pressure| (|PressureRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |PressureRelatedQuantity|
                                  (|IntensiveQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |PressureThickness|
                                  (|PressureRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Productivity| (|Description|) nil)

(de.setf.resource.schema:defclass |PseudoEquivalentPotentialTemperature|
                                  (|Temperature|)
                                  nil)

(de.setf.resource.schema:defclass |PseudoEquivalentTemperature|
                                  (|Temperature|)
                                  nil)

(de.setf.resource.schema:defclass |QualitativeMeasure| nil nil)

(de.setf.resource.schema:defclass |Quality| (|Description|) nil)

(de.setf.resource.schema:defclass |Quantity| nil nil)

(de.setf.resource.schema:defclass |Radiance|
                                  (|ElectromagneticRadiationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |RadiantEnergy| (|Energy|) nil)

(de.setf.resource.schema:defclass |Radiation-MediumInteractionRelatedQuantity|
                                  (|IntensiveQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |RadiationBalanceRelatedQuantity|
                                  (|ElectromagneticRadiationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |RadiativeForcing|
                                  (|RadiationBalanceRelatedQuantity|
                                   |Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Radioactive| nil nil)

(de.setf.resource.schema:defclass |Radioactivity| (|ChemicalQuantity|) nil)

(de.setf.resource.schema:defclass |Rainfall| (|VerticalExtent|) nil)

(de.setf.resource.schema:defclass |Reflectance|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Reflectivity|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |RelativeHumidity| (|Humidity|) nil)

(de.setf.resource.schema:defclass |RelativeVorticity| (|Vorticity|) nil)

(de.setf.resource.schema:defclass |Roughness| (|Description|) nil)

(de.setf.resource.schema:defclass |Salinity| (|MassConcentration|) nil)

(de.setf.resource.schema:defclass |SaturationDeficit| (|MassConcentration|) nil)

(de.setf.resource.schema:defclass |ScaleHeight| (|Height|) nil)

(de.setf.resource.schema:defclass |SeaState| (|State|) nil)

(de.setf.resource.schema:defclass |SecchiDepth|
                                  (|Radiation-MediumInteractionRelatedQuantity|
                                   |Depth|)
                                  nil)

(de.setf.resource.schema:defclass |SensibleHeat| (|Heat|) nil)

(de.setf.resource.schema:defclass |Shear| (|PressureRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |SigmaT| (|Density|) nil)

(de.setf.resource.schema:defclass |SignificantHeight| (|Height|) nil)

(de.setf.resource.schema:defclass |Size| (|LinearExtent|) nil)

(de.setf.resource.schema:defclass |SolarRadiation| (|RadiativeForcing|) nil)

(de.setf.resource.schema:defclass |SolidMaterialProperty|
                                  (|MediumProperty|)
                                  nil)

(de.setf.resource.schema:defclass |SpatialExtent|
                                  (|SpatialExtentRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SpatialExtentRelatedQuantity|
                                  (|ExtensiveQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SpatialRange|
                                  (|SpatialExtentRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SpecificGravitationalPotentialEnergy|
                                  (|EnergyRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SpecificHeat|
                                  (|MediumProperty| |EnergyRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SpecificHumidity| (|Humidity|) nil)

(de.setf.resource.schema:defclass |SpecificPotentialEnergy|
                                  (|EnergyRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Spectrum| (|Description|) nil)

(de.setf.resource.schema:defclass |Speed| (|MotionRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |Stability| (|PressureRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |StageHeight| (|Height|) nil)

(de.setf.resource.schema:defclass |StandardizedPrecipitationIndex|
                                  (|Index|)
                                  nil)

(de.setf.resource.schema:defclass |State| (|Description|) nil)

(de.setf.resource.schema:defclass |StaticPressure| (|Pressure|) nil)

(de.setf.resource.schema:defclass |StaticTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |Streamfunction|
                                  (|VelocityFieldRelatedProperty|)
                                  nil)

(de.setf.resource.schema:defclass |Stress| (|PressureRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |Structure| (|Description|) nil)

(de.setf.resource.schema:defclass |SubstanceConcentration|
                                  (|SubstanceConcentrationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SubstanceConcentrationRelatedQuantity|
                                  (|CompositionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SubstanceContent|
                                  (|SubstanceConcentrationRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |SurfaceMoistureIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Temperature|
                                  (|TemperatureRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |TemperatureRelatedQuantity|
                                  (|PhysicalQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Texture| (|SolidMaterialProperty|) nil)

(de.setf.resource.schema:defclass |ThermalConductivity| (|MediumProperty|) nil)

(de.setf.resource.schema:defclass |ThermalDiffusivity| (|MediumProperty|) nil)

(de.setf.resource.schema:defclass |Thickness| (|LinearExtent|) nil)

(de.setf.resource.schema:defclass |Time| (|TimeRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |TimeRelatedQuantity|
                                  (|ExtensiveQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Topography| (|Height|) nil)

(de.setf.resource.schema:defclass |TotalElectronContent|
                                  (|SubstanceContent|)
                                  nil)

(de.setf.resource.schema:defclass |TotalPressure| (|Pressure|) nil)

(de.setf.resource.schema:defclass |TotalTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |Transmittance|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Turbidity|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Type| nil nil)

(de.setf.resource.schema:defclass |Value| (|Description|) nil)

(de.setf.resource.schema:defclass |Velocity| (|MotionRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |VelocityFieldRelatedProperty|
                                  (|MotionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |VelocityPotential|
                                  (|VelocityFieldRelatedProperty|)
                                  nil)

(de.setf.resource.schema:defclass |VerticalExtent| (|LinearExtent|) nil)

(de.setf.resource.schema:defclass |VirtualTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |Visibility|
                                  (|Radiation-MediumInteractionRelatedQuantity|)
                                  nil)

(de.setf.resource.schema:defclass |Volume| (|SpatialExtentRelatedQuantity|) nil)

(de.setf.resource.schema:defclass |Vorticity|
                                  (|VelocityFieldRelatedProperty|)
                                  nil)

(de.setf.resource.schema:defclass |WaterConcentration|
                                  (|MassConcentration|)
                                  nil)

(de.setf.resource.schema:defclass |WaterHoldingCapacity|
                                  (|SolidMaterialProperty|)
                                  nil)

(de.setf.resource.schema:defclass |Wavelength| (|LinearExtent|) nil)

(de.setf.resource.schema:defclass |WetBulbTemperature| (|Temperature|) nil)

(de.setf.resource.schema:defclass |WindChill| (|Temperature|) nil)

(de.setf.resource.schema:defclass |WindIndex| (|Index|) nil)

(de.setf.resource.schema:defclass |Yield| nil nil)
