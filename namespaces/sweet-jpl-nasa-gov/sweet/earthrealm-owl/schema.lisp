;;; 20100513T131535Z00
;;; from #<doc-node http://sweet.jpl.nasa.gov/sweet/earthrealm.owl #x252DB506>

(common-lisp:in-package "http://sweet.jpl.nasa.gov/ontology/earthrealm.owl#")
(de.setf.resource.schema:defclass |AbyssalHill| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |AbyssalPlain| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |ActiveLayer| (|LandSurfaceLayer|) nil)

(de.setf.resource.schema:defclass |Aeoliean| nil nil)

(de.setf.resource.schema:defclass |AgriculturalLands| nil nil)

(de.setf.resource.schema:defclass |AlpineClimateZone| (|ClimateZoneType|) nil)

(de.setf.resource.schema:defclass |AphoticZone| (|OceanLayer|) nil)

(de.setf.resource.schema:defclass |Aquifer| (|UndergroundWater|) nil)

(de.setf.resource.schema:defclass |ArcticClimateZone| (|ClimateZoneType|) nil)

(de.setf.resource.schema:defclass |Asthenosphere| nil nil)

(de.setf.resource.schema:defclass |Atmosphere|
                                  (|GlobalPlanetaryLayers| |AtmosphereLayer|)
                                  nil)

(de.setf.resource.schema:defclass |AtmosphereLayer|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Layer|)
                                  nil)

(de.setf.resource.schema:defclass |AtmosphereLayerBoundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/space.owl#|:|LayerBoundary|
                                   |EarthRealm|)
                                  nil)

(de.setf.resource.schema:defclass |BarrierIsland| (|Island|) nil)

(de.setf.resource.schema:defclass |Beach| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |Bedrock| (|CrustLayer|) nil)

(de.setf.resource.schema:defclass |Benthic| nil nil)

(de.setf.resource.schema:defclass |Benthos| (|SeaFloorWaterLayer|) nil)

(de.setf.resource.schema:defclass |BenticEcosystem| (|MarineEcosystem|) nil)

(de.setf.resource.schema:defclass |Biosphere| (|GlobalPlanetaryLayers|) nil)

(de.setf.resource.schema:defclass |BodyOfGround|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Body|)
                                  nil)

(de.setf.resource.schema:defclass |BodyOfIce|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Body|)
                                  nil)

(de.setf.resource.schema:defclass |BodyOfSeaIce| (|BodyOfIce|) nil)

(de.setf.resource.schema:defclass |BodyOfWater|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Body|)
                                  nil)

(de.setf.resource.schema:defclass |BorealForest| (|Forest_Ecosystem|) nil)

(de.setf.resource.schema:defclass |BoundaryLayer| (|TroposphereLayer|) nil)

(de.setf.resource.schema:defclass |Cave| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |CaveEcosystem| (|TerrestrialEcosystem|) nil)

(de.setf.resource.schema:defclass |Cirque| (|Basin|) nil)

(de.setf.resource.schema:defclass |ClimateZoneType| (|RegionProperty|) nil)

(de.setf.resource.schema:defclass |CoastalRegion| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |Continent| (|LandRegion|) nil)

(de.setf.resource.schema:defclass |ContinentalMargin| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |CoralReef| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |Core| (|CoreLayer|) nil)

(de.setf.resource.schema:defclass |CoreLayer| (|GeosphereLayer|) nil)

(de.setf.resource.schema:defclass |CostalLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |Creek| (|Stream|) nil)

(de.setf.resource.schema:defclass |Crust| (|CrustLayer|) nil)

(de.setf.resource.schema:defclass |CrustLayer| (|LithosphereLayer|) nil)

(de.setf.resource.schema:defclass |Cryosphere|
                                  (|GlobalPlanetaryLayers| |CryosphereLayer|)
                                  nil)

(de.setf.resource.schema:defclass |CryosphereLayer|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Layer|)
                                  nil)

(de.setf.resource.schema:defclass |DeepOcean| (|OceanRegion|) nil)

(de.setf.resource.schema:defclass |Delta| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |DemersalEcosystem| (|MarineEcosystem|) nil)

(de.setf.resource.schema:defclass |DepthHoarLayer| (|SnowLayer|) nil)

(de.setf.resource.schema:defclass |Desert_Ecosystem|
                                  (|TerrestrialEcosystem|)
                                  nil)

(de.setf.resource.schema:defclass |DesertClimateZone| (|ClimateZoneType|) nil)

(de.setf.resource.schema:defclass |DryLandRegion| (|LandRegion|) nil)

(de.setf.resource.schema:defclass |Dune| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |EarthRealm|
                                  nil
                                  ((|coveredBySubstance_temporary| :type
                                    |http://sweet.jpl.nasa.gov/ontology/substance.owl#|::|ChemicalSubstance|)
                                   (|primarySubstance| :type
                                    |http://sweet.jpl.nasa.gov/ontology/substance.owl#|::|ChemicalSubstance|)))

(de.setf.resource.schema:defclass |EcosystemType| (|RegionProperty|) nil)

(de.setf.resource.schema:defclass |EolianLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |EstuarineWetland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |Estuary| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |Exosphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |F-Region| (|Ionosphere|) nil)

(de.setf.resource.schema:defclass |Farmland| (|TerrestrialEcosystem|) nil)

(de.setf.resource.schema:defclass |FastIce| (|SeaIceLayer|) nil)

(de.setf.resource.schema:defclass |Felsic| (|Crust|) nil)

(de.setf.resource.schema:defclass |fiord| nil nil)

(de.setf.resource.schema:defclass |Fjord| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |FluvialLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |Forest_Ecosystem|
                                  (|TerrestrialEcosystem|)
                                  nil)

(de.setf.resource.schema:defclass |FractureZone| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |FreshwaterLake| (|Lake|) nil)

(de.setf.resource.schema:defclass |GeomorphologicalRegionType|
                                  (|RegionProperty|)
                                  nil)

(de.setf.resource.schema:defclass |Geosphere|
                                  (|GlobalPlanetaryLayers| |GeosphereLayer|)
                                  nil)

(de.setf.resource.schema:defclass |GeosphereLayer|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Layer|)
                                  nil)

(de.setf.resource.schema:defclass |GlacialLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |Glacier| (|BodyOfIce|) nil)

(de.setf.resource.schema:defclass |GlobalPlanetaryLayers|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Layer|)
                                  nil)

(de.setf.resource.schema:defclass |Grassland| (|TerrestrialEcosystem|) nil)

(de.setf.resource.schema:defclass |GroundWaterObjectBoundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/space.owl#|:|BodyBoundary|
                                   |EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Boundary|)
                                  nil)

(de.setf.resource.schema:defclass |Halocline| (|OceanLayer|) nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Boundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|GeometricalObject|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/numerics.owl#Polygon|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/property.owl#Height|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#Body|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#BodyBoundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Boundary|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#Layer|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#LayerBoundary|
                                  (|http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Boundary|)
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/space.owl#Region|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Air|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#ChemicalSubstance|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Cryosol|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#DepthHoar|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Ground_substance|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Ice|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Rock|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Sediment|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Snow|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Soil|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://sweet.jpl.nasa.gov/ontology/substance.owl#Water|
                                  nil
                                  nil)

(de.setf.resource.schema:defclass |http://www.w3.org/2002/07/owl#Thing| nil nil)

(de.setf.resource.schema:defclass |Hydrosphere|
                                  (|GlobalPlanetaryLayers| |HydrosphereLayer|)
                                  nil)

(de.setf.resource.schema:defclass |HydrosphereLayer|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Layer|)
                                  nil)

(de.setf.resource.schema:defclass |HydrothermalVents| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |Iceberg| (|BodyOfIce|) nil)

(de.setf.resource.schema:defclass |IceCore| (|BodyOfIce|) nil)

(de.setf.resource.schema:defclass |IceFloe| (|BodyOfSeaIce|) nil)

(de.setf.resource.schema:defclass |IceLayer| (|CryosphereLayer|) nil)

(de.setf.resource.schema:defclass |IceSheet| (|BodyOfSeaIce|) nil)

(de.setf.resource.schema:defclass |Inlet| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |IntertidalZone| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |InversionLayer| (|TroposphereLayer|) nil)

(de.setf.resource.schema:defclass |Ionosphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |Island| (|LandRegion|) nil)

(de.setf.resource.schema:defclass |IslandArc| (|Island|) nil)

(de.setf.resource.schema:defclass |Isobar| (|PlanetarySurfaceLayer|) nil)

(de.setf.resource.schema:defclass |Isopycnal| (|PlanetarySurfaceLayer|) nil)

(de.setf.resource.schema:defclass |KarstLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |LacustrineWetland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |Lagoon| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |Lake| (|SurfaceWater|) nil)

(de.setf.resource.schema:defclass |LakeLayer| (|HydrosphereLayer|) nil)

(de.setf.resource.schema:defclass |Land| nil nil)

(de.setf.resource.schema:defclass |Land_WaterBoundary_2D|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/numerics.owl#|:|Boundary|)
                                  nil)

(de.setf.resource.schema:defclass |LandIce| nil nil)

(de.setf.resource.schema:defclass |LandIceLayer| (|IceLayer|) nil)

(de.setf.resource.schema:defclass |LandRegion| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |LandSurface| (|PlanetarySurface|) nil)

(de.setf.resource.schema:defclass |LandSurfaceLayer|
                                  (|CrustLayer| |PlanetarySurfaceLayer|)
                                  nil)

(de.setf.resource.schema:defclass |LandWaterObject| (|BodyOfWater|) nil)

(de.setf.resource.schema:defclass |LandwaterRegion| (|LandRegion|) nil)

(de.setf.resource.schema:defclass |LandWaterSurface| (|WaterSurface|) nil)

(de.setf.resource.schema:defclass |LandwaterSurfaceLayer|
                                  (|WaterSurfaceLayer|)
                                  nil)

(de.setf.resource.schema:defclass |Leads| (|OceanRegion|) nil)

(de.setf.resource.schema:defclass |Lithosphere| (|LithosphereLayer|) nil)

(de.setf.resource.schema:defclass |LithosphereLayer| (|GeosphereLayer|) nil)

(de.setf.resource.schema:defclass |Litter| (|LandSurfaceLayer|) nil)

(de.setf.resource.schema:defclass |Littoral| nil nil)

(de.setf.resource.schema:defclass |LowerAtmosphere| nil nil)

(de.setf.resource.schema:defclass |LowerMantle| (|MantleLayer|) nil)

(de.setf.resource.schema:defclass |Mafic| (|Crust|) nil)

(de.setf.resource.schema:defclass |Magnetosphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |MangroveForest| (|Forest_Ecosystem|) nil)

(de.setf.resource.schema:defclass |Mantle| (|MantleLayer|) nil)

(de.setf.resource.schema:defclass |MantleLayer| (|GeosphereLayer|) nil)

(de.setf.resource.schema:defclass |MarineEcosystem| (|EcosystemType|) nil)

(de.setf.resource.schema:defclass |MarineWetland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |Marsh| (|CoastalRegion| |WetlandRegion|) nil)

(de.setf.resource.schema:defclass |MediterraneanClimateZone|
                                  (|ClimateZoneType|)
                                  nil)

(de.setf.resource.schema:defclass |Mesopause| (|AtmosphereLayerBoundary|) nil)

(de.setf.resource.schema:defclass |Mesosphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |MiddleAtmosphere| nil nil)

(de.setf.resource.schema:defclass |MixedLayer| (|SeaSurfaceLayer|) nil)

(de.setf.resource.schema:defclass |Moho| (|GeosphereLayer|) nil)

(de.setf.resource.schema:defclass |MontaneForest| (|Forest_Ecosystem|) nil)

(de.setf.resource.schema:defclass |Mountain| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |Nearshore| nil nil)

(de.setf.resource.schema:defclass |Ocean| (|BodyOfWater|) nil)

(de.setf.resource.schema:defclass |OceanCrustLayer|
                                  (|CrustLayer| |OceanLayer|)
                                  nil)

(de.setf.resource.schema:defclass |OceanLayer| (|HydrosphereLayer|) nil)

(de.setf.resource.schema:defclass |OceanRegion| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |OceanRidge| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |PackIce| (|SeaIceLayer|) nil)

(de.setf.resource.schema:defclass |PalustrineWetland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |Peatland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |PelagicEcosystem| (|MarineEcosystem|) nil)

(de.setf.resource.schema:defclass |PeriglacialLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |Permafrost|
                                  (|CryosphereLayer| |CrustLayer|)
                                  nil)

(de.setf.resource.schema:defclass |PermafrostZone| (|ClimateZoneType|) nil)

(de.setf.resource.schema:defclass |PhoticZone| (|SeaSurfaceLayer|) nil)

(de.setf.resource.schema:defclass |Plain| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |PlanetaryStructure| nil nil)

(de.setf.resource.schema:defclass |PlanetarySurface|
                                  (|http://sweet.jpl.nasa.gov/ontology/space.owl#|:|LayerBoundary|
                                   |EarthRealm|)
                                  nil)

(de.setf.resource.schema:defclass |PlanetarySurfaceLayer|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Layer|)
                                  nil)

(de.setf.resource.schema:defclass |PlanetEarth|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|::|Body|)
                                  nil)

(de.setf.resource.schema:defclass |Plateau| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |Polynya| (|OceanRegion|) nil)

(de.setf.resource.schema:defclass |Pond| (|SurfaceWater|) nil)

(de.setf.resource.schema:defclass |Pycnocline| (|OceanLayer|) nil)

(de.setf.resource.schema:defclass |RegionProperty| nil nil)

(de.setf.resource.schema:defclass |Ridge| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |RiftValley| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |RiparianWetland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |River| (|Stream|) nil)

(de.setf.resource.schema:defclass |Rock_body| (|BodyOfGround|) nil)

(de.setf.resource.schema:defclass |RockGlacier| (|Glacier|) nil)

(de.setf.resource.schema:defclass |RockyCoast| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |SalineLake| (|Lake|) nil)

(de.setf.resource.schema:defclass |Savanna| (|Grassland|) nil)

(de.setf.resource.schema:defclass |Sea| (|OceanRegion|) nil)

(de.setf.resource.schema:defclass |SeaFloor|
                                  (|http://sweet.jpl.nasa.gov/ontology/space.owl#|:|LayerBoundary|
                                   |EarthRealm|)
                                  nil)

(de.setf.resource.schema:defclass |SeaFloorGroundLayer| (|CrustLayer|) nil)

(de.setf.resource.schema:defclass |SeaFloorRegion| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |SeaFloorWaterLayer| (|OceanLayer|) nil)

(de.setf.resource.schema:defclass |SeaIce| nil nil)

(de.setf.resource.schema:defclass |SeaIceLayer| (|IceLayer|) nil)

(de.setf.resource.schema:defclass |Seamount| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |SeaSurface| (|WaterSurface|) nil)

(de.setf.resource.schema:defclass |SeaSurfaceLayer|
                                  (|OceanLayer| |WaterSurfaceLayer|)
                                  nil)

(de.setf.resource.schema:defclass |SedimentaryStructure| (|BodyOfGround|) nil)

(de.setf.resource.schema:defclass |SedimentLayer| (|LakeLayer|) nil)

(de.setf.resource.schema:defclass |Shoal| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |Shoreline| (|CoastalRegion|) nil)

(de.setf.resource.schema:defclass |SkinLayer| (|LandSurfaceLayer|) nil)

(de.setf.resource.schema:defclass |Sky| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |SnowField| (|SnowLayer|) nil)

(de.setf.resource.schema:defclass |SnowLayer| (|CryosphereLayer|) nil)

(de.setf.resource.schema:defclass |SoilLayer| (|LandSurfaceLayer|) nil)

(de.setf.resource.schema:defclass |SolidEarth| nil nil)

(de.setf.resource.schema:defclass |Spring| (|Stream|) nil)

(de.setf.resource.schema:defclass |Stratopause| (|AtmosphereLayerBoundary|) nil)

(de.setf.resource.schema:defclass |Stratosphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |Stream| (|SurfaceWater|) nil)

(de.setf.resource.schema:defclass |SubmarineCanyon| (|Trench|) nil)

(de.setf.resource.schema:defclass |SubsurfaceWater| nil nil)

(de.setf.resource.schema:defclass |SubtropicalClimateZone|
                                  (|ClimateZoneType|)
                                  nil)

(de.setf.resource.schema:defclass |SurfaceRegion|
                                  (|EarthRealm|
                                   |http://sweet.jpl.nasa.gov/ontology/space.owl#|:|Region|)
                                  ((|hasClimateZoneType| :type
                                    |ClimateZoneType|)
                                   (|hasEcosystemType| :type |EcosystemType|)
                                   (|hasGeomorphologicalType| :type
                                    |GeomorphologicalRegionType|)))

(de.setf.resource.schema:defclass |SurfaceWater|
                                  (|LandWaterObject| |LandwaterRegion|)
                                  nil)

(de.setf.resource.schema:defclass |Swamp| (|Wetland|) nil)

(de.setf.resource.schema:defclass |Talik| (|BodyOfGround|) nil)

(de.setf.resource.schema:defclass |TectonicLandform|
                                  (|GeomorphologicalRegionType|)
                                  nil)

(de.setf.resource.schema:defclass |TemperateClimateZone|
                                  (|ClimateZoneType|)
                                  nil)

(de.setf.resource.schema:defclass |TerrestrialEcosystem| (|EcosystemType|) nil)

(de.setf.resource.schema:defclass |TerrrestrialWetland| (|Wetland|) nil)

(de.setf.resource.schema:defclass |Thermocline| (|OceanLayer|) nil)

(de.setf.resource.schema:defclass |Thermosphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |TopographicalRegion| (|SurfaceRegion|) nil)

(de.setf.resource.schema:defclass |Trench| (|SeaFloorRegion|) nil)

(de.setf.resource.schema:defclass |TropicalClimateZone| (|ClimateZoneType|) nil)

(de.setf.resource.schema:defclass |Tropopause| (|AtmosphereLayerBoundary|) nil)

(de.setf.resource.schema:defclass |Troposphere| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |TroposphereLayer| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |Tundra_Ecosystem|
                                  (|TerrestrialEcosystem|)
                                  nil)

(de.setf.resource.schema:defclass |UndergroundWater| (|LandWaterObject|) nil)

(de.setf.resource.schema:defclass |UpperAir| (|AtmosphereLayer|) nil)

(de.setf.resource.schema:defclass |UpperAtmosphere| (|Atmosphere|) nil)

(de.setf.resource.schema:defclass |UpperMantle_flowing| (|MantleLayer|) nil)

(de.setf.resource.schema:defclass |UpperMantle_rigid|
                                  (|MantleLayer| |LithosphereLayer|)
                                  nil)

(de.setf.resource.schema:defclass |UrbanLand| (|TerrestrialEcosystem|) nil)

(de.setf.resource.schema:defclass |Volcano| (|TopographicalRegion|) nil)

(de.setf.resource.schema:defclass |WaterChannel| (|SurfaceWater|) nil)

(de.setf.resource.schema:defclass |Watershed| (|LandRegion|) nil)

(de.setf.resource.schema:defclass |WaterSurface| (|PlanetarySurface|) nil)

(de.setf.resource.schema:defclass |WaterSurfaceLayer|
                                  (|PlanetarySurfaceLayer| |HydrosphereLayer|)
                                  nil)

(de.setf.resource.schema:defclass |WaterTable|
                                  (|GroundWaterObjectBoundary|)
                                  nil)

(de.setf.resource.schema:defclass |Wetland| (|TerrestrialEcosystem|) nil)

(de.setf.resource.schema:defclass |WetlandRegion| (|LandRegion|) nil)
