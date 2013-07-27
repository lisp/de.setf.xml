;;; -*- Mode: lisp; Syntax: ansi-common-lisp; Base: 10; Package: xml-query-data-model; -*-

(in-package :xml-query-data-model)
(setq xml-query-data-model:*namespace*
      (xml-query-data-model:defnamespace "http://sweet.jpl.nasa.gov/ontology/substance.owl#"
                                         (:use)
                                         (:nicknames)
                                         (:export
                                          "Aa"
                                          "Acid"
                                          "Aerosol"
                                          "AgriculturalChemical"
                                          "Air"
                                          "AirBubble"
                                          "Al"
                                          "Allotrope"
                                          "AlphaParticle"
                                          "Aluminum"
                                          "Ammonia"
                                          "Ar"
                                          "Argon"
                                          "Ash"
                                          "Atom"
                                          "B"
                                          "Basalt"
                                          "Be"
                                          "Bedrock"
                                          "Beryllium"
                                          "BiogenicSediment"
                                          "Biomass"
                                          "BiomedicalChemical"
                                          "Blue"
                                          "Boron"
                                          "Br"
                                          "BrO"
                                          "Bromine"
                                          "BromineMonoxide"
                                          "Bubble"
                                          "C"
                                          "C14"
                                          "C2"
                                          "C2H6S"
                                          "Ca"
                                          "Calcium"
                                          "Carbon"
                                          "CarbonaceousAerosol"
                                          "CarbonDioxide"
                                          "Carbonyl"
                                          "CarbonylSulfide"
                                          "Carcinogen"
                                          "Cation"
                                          "CH2O"
                                          "CH3CN"
                                          "CH4"
                                          "Chemical"
                                          "ChemicalCompound"
                                          "ChemicalElement"
                                          "ChemicalSubstance"
                                          "Chlorine"
                                          "ChlorineDioxide"
                                          "ChlorineMonoxide"
                                          "ChlorineNitrate"
                                          "Cl"
                                          "Clathrate"
                                          "ClO"
                                          "ClO2"
                                          "ClONO2"
                                          "CloudCondensationNuclei"
                                          "CO"
                                          "CO2"
                                          "Coal"
                                          "Compound"
                                          "CondensedWater"
                                          "Contaminant"
                                          "CoralDeposit"
                                          "CosmicRay"
                                          "Crystal"
                                          "Cx"
                                          "Defoilant"
                                          "Deposit"
                                          "DimethylSulfide"
                                          "DinitrogenPentoxide"
                                          "DissolvedGas"
                                          "DissolvedSolid"
                                          "DissolvedSubstance"
                                          "DMS"
                                          "Droplet"
                                          "Dust"
                                          "ElectricField"
                                          "ElectromagneticRadiation"
                                          "ElectromagneticWave"
                                          "Electron"
                                          "Element"
                                          "ElementaryParticle"
                                          "EnergeticParticle"
                                          "ExtraterrestrialSubstance"
                                          "F"
                                          "FC"
                                          "Fe"
                                          "Fe2"
                                          "Fe2O3"
                                          "Fe3"
                                          "Fe3O4"
                                          "Feed"
                                          "Fertilizer"
                                          "Fluid"
                                          "Fluorine"
                                          "Fluorocarbon"
                                          "Food"
                                          "FoodAdditive"
                                          "Formaldehyde"
                                          "FormOfSubstanceOrganization"
                                          "Fossil"
                                          "FossilFuel"
                                          "FreshWater"
                                          "GammaWaveRadiation"
                                          "Gas"
                                          "GasHydrate"
                                          "Gelbstoff"
                                          "Glass"
                                          "Grain"
                                          "GranularIce"
                                          "Graupel"
                                          "GravityField"
                                          "Green"
                                          "GreenhouseGas"
                                          "Ground"
                                          "H"
                                          "H2"
                                          "H2O"
                                          "H3"
                                          "H4"
                                          "H6"
                                          "Ha"
                                          "HaC"
                                          "Halocarbon"
                                          "HazardousSubstance"
                                          "HC"
                                          "HCl"
                                          "HClFC"
                                          "HCN"
                                          "He"
                                          "HeavyIon"
                                          "HeavyMetal"
                                          "Helium"
                                          "Hematite"
                                          "HF"
                                          "HO2"
                                          "HoarCrystal"
                                          "Honey"
                                          "Hydrocarbon"
                                          "Hydrochlorofluorocarbon"
                                          "HydrochlorousAcid"
                                          "Hydrogen"
                                          "HydrogenChloride"
                                          "HydrogenCyanide"
                                          "HydrogenFluoride"
                                          "HydrogenousSediment"
                                          "Hydroperoxy"
                                          "Hydroxyl"
                                          "Ice"
                                          "IceCrystal"
                                          "IcePellet"
                                          "IgeneousRock"
                                          "Igneous"
                                          "InfraredRadiation"
                                          "Inorganic"
                                          "InorganicSubstance"
                                          "Ion"
                                          "Iron"
                                          "Isotope"
                                          "K"
                                          "Lava"
                                          "Lead"
                                          "Li"
                                          "Liquid"
                                          "LiquidSubstance"
                                          "LiquidWater"
                                          "Lithium"
                                          "Litter"
                                          "Loess"
                                          "LongWaveRadiation"
                                          "Macrofossil"
                                          "Magma"
                                          "Magnesium"
                                          "MagneticField"
                                          "Magnetite"
                                          "Manganese"
                                          "Manure"
                                          "MarineSediment"
                                          "Material"
                                          "Metal"
                                          "Metamorphic"
                                          "MetamorphicRock"
                                          "Meteorite"
                                          "Meteorite_substance"
                                          "Methane"
                                          "MethylCyanide"
                                          "Mg"
                                          "Microfossil"
                                          "Micronutrient"
                                          "MicrowaveRadiation"
                                          "Mineral"
                                          "Mineraloid"
                                          "MixedChemicalSubstance"
                                          "MixedSubstance"
                                          "Mn"
                                          "N"
                                          "N2"
                                          "N2O"
                                          "N2O5"
                                          "Na"
                                          "NaCl"
                                          "NaturalGas"
                                          "NaturalResource"
                                          "Ne"
                                          "Neon"
                                          "Neutrino"
                                          "NH3"
                                          "Nitrate"
                                          "NitricOxide"
                                          "Nitrite"
                                          "Nitrogen"
                                          "NitrogenDioxide"
                                          "NitrogenOxide"
                                          "NitrousOxide"
                                          "NM"
                                          "NMHC"
                                          "NO"
                                          "NO2"
                                          "NO2minus"
                                          "NO3minus"
                                          "NonmetallicMineral"
                                          "NonMethaneHydrocarbon"
                                          "NonMethaneHydrocarbons"
                                          "NOx"
                                          "NuclearRadiation"
                                          "Nutrient"
                                          "O"
                                          "O2"
                                          "O2minus"
                                          "O3"
                                          "O3minus"
                                          "O4"
                                          "O5"
                                          "OCS"
                                          "OH"
                                          "Oil"
                                          "Ominus"
                                          "Oplus"
                                          "Orange"
                                          "Organic"
                                          "OrganicSubstance"
                                          "Ox"
                                          "Oxygen"
                                          "OxygenIsotope"
                                          "Ozone"
                                          "P"
                                          "Pahoehoe"
                                          "Paleosol"
                                          "Paleovegetation"
                                          "Particulate"
                                          "Pb"
                                          "PCB"
                                          "Pesticide"
                                          "Petroleum"
                                          "Phosphate"
                                          "Phosphorus"
                                          "PhotosyntheticallyActiveRadiation"
                                          "Pigment"
                                          "Plasma"
                                          "PO"
                                          "Pollen"
                                          "Potassium"
                                          "Powder"
                                          "Proton"
                                          "Pyroclastics"
                                          "Radiation"
                                          "RadioactiveSubstance"
                                          "Radiocarbon"
                                          "Radionuclide"
                                          "RadioWaveRadiation"
                                          "Red"
                                          "Rock"
                                          "S"
                                          "Salt"
                                          "Sand"
                                          "SeaWater"
                                          "Sediment"
                                          "Sedimentary"
                                          "SedimentaryRock"
                                          "Sewage"
                                          "ShortWaveRadiation"
                                          "Si"
                                          "Silica"
                                          "Silicon"
                                          "SiliconDioxide"
                                          "Silk"
                                          "SiO2"
                                          "Smoke"
                                          "Snow"
                                          "SnowFacies"
                                          "SnowGrain"
                                          "SO2"
                                          "SO4"
                                          "Sodium"
                                          "Soil"
                                          "Solid"
                                          "SolidSubstance"
                                          "SolidWater"
                                          "Solution"
                                          "Soot"
                                          "SOx"
                                          "Spray"
                                          "StableIsotope"
                                          "State"
                                          "StateOfMatter"
                                          "Substance"
                                          "SubstanceForm"
                                          "Sulfate"
                                          "Sulfur"
                                          "SulfurDioxide"
                                          "SulfurOxide"
                                          "SuspendedGas"
                                          "SuspendedSolid"
                                          "SuspendedSubstance"
                                          "Tephra"
                                          "TerrigenousSediment"
                                          "ThermalInfraredRadiation"
                                          "Toxin"
                                          "TraceGas"
                                          "TraceMetal"
                                          "TraceSubstance"
                                          "UltravioletRadiation"
                                          "Varve"
                                          "Violet"
                                          "VisibleLight"
                                          "VolcanicDeposit"
                                          "Water"
                                          "WaterVapor"
                                          "XrayRadiation"
                                          "Yellow")
                                         (:documentation nil)))

(let ((xml-query-data-model::p
       (or (find-package "http://sweet.jpl.nasa.gov/ontology/substance.owl#")
           (make-package "http://sweet.jpl.nasa.gov/ontology/substance.owl#"
                         :use
                         nil
                         :nicknames
                         'nil))))
  (dolist (xml-query-data-model::s
           '("Aa" "Acid" "Aerosol" "AgriculturalChemical" "Air" "AirBubble"
             "Al" "Allotrope" "AlphaParticle" "Aluminum" "Ammonia" "Ar" "Argon"
             "Ash" "Atom" "B" "Basalt" "Be" "Bedrock" "Beryllium"
             "BiogenicSediment" "Biomass" "BiomedicalChemical" "Blue" "Boron"
             "Br" "BrO" "Bromine" "BromineMonoxide" "Bubble" "C" "C14" "C2"
             "C2H6S" "Ca" "Calcium" "Carbon" "CarbonaceousAerosol"
             "CarbonDioxide" "Carbonyl" "CarbonylSulfide" "Carcinogen" "Cation"
             "CH2O" "CH3CN" "CH4" "Chemical" "ChemicalCompound"
             "ChemicalElement" "ChemicalSubstance" "Chlorine" "ChlorineDioxide"
             "ChlorineMonoxide" "ChlorineNitrate" "Cl" "Clathrate" "ClO" "ClO2"
             "ClONO2" "CloudCondensationNuclei" "CO" "CO2" "Coal" "Compound"
             "CondensedWater" "Contaminant" "CoralDeposit" "CosmicRay"
             "Crystal" "Cx" "Defoilant" "Deposit" "DimethylSulfide"
             "DinitrogenPentoxide" "DissolvedGas" "DissolvedSolid"
             "DissolvedSubstance" "DMS" "Droplet" "Dust" "ElectricField"
             "ElectromagneticRadiation" "ElectromagneticWave" "Electron"
             "Element" "ElementaryParticle" "EnergeticParticle"
             "ExtraterrestrialSubstance" "F" "FC" "Fe" "Fe2" "Fe2O3" "Fe3"
             "Fe3O4" "Feed" "Fertilizer" "Fluid" "Fluorine" "Fluorocarbon"
             "Food" "FoodAdditive" "Formaldehyde" "FormOfSubstanceOrganization"
             "Fossil" "FossilFuel" "FreshWater" "GammaWaveRadiation" "Gas"
             "GasHydrate" "Gelbstoff" "Glass" "Grain" "GranularIce" "Graupel"
             "GravityField" "Green" "GreenhouseGas" "Ground" "H" "H2" "H2O"
             "H3" "H4" "H6" "Ha" "HaC" "Halocarbon" "HazardousSubstance" "HC"
             "HCl" "HClFC" "HCN" "He" "HeavyIon" "HeavyMetal" "Helium"
             "Hematite" "HF" "HO2" "HoarCrystal" "Honey" "Hydrocarbon"
             "Hydrochlorofluorocarbon" "HydrochlorousAcid" "Hydrogen"
             "HydrogenChloride" "HydrogenCyanide" "HydrogenFluoride"
             "HydrogenousSediment" "Hydroperoxy" "Hydroxyl" "Ice" "IceCrystal"
             "IcePellet" "IgeneousRock" "Igneous" "InfraredRadiation"
             "Inorganic" "InorganicSubstance" "Ion" "Iron" "Isotope" "K" "Lava"
             "Lead" "Li" "Liquid" "LiquidSubstance" "LiquidWater" "Lithium"
             "Litter" "Loess" "LongWaveRadiation" "Macrofossil" "Magma"
             "Magnesium" "MagneticField" "Magnetite" "Manganese" "Manure"
             "MarineSediment" "Material" "Metal" "Metamorphic"
             "MetamorphicRock" "Meteorite" "Meteorite_substance" "Methane"
             "MethylCyanide" "Mg" "Microfossil" "Micronutrient"
             "MicrowaveRadiation" "Mineral" "Mineraloid"
             "MixedChemicalSubstance" "MixedSubstance" "Mn" "N" "N2" "N2O"
             "N2O5" "Na" "NaCl" "NaturalGas" "NaturalResource" "Ne" "Neon"
             "Neutrino" "NH3" "Nitrate" "NitricOxide" "Nitrite" "Nitrogen"
             "NitrogenDioxide" "NitrogenOxide" "NitrousOxide" "NM" "NMHC" "NO"
             "NO2" "NO2minus" "NO3minus" "NonmetallicMineral"
             "NonMethaneHydrocarbon" "NonMethaneHydrocarbons" "NOx"
             "NuclearRadiation" "Nutrient" "O" "O2" "O2minus" "O3" "O3minus"
             "O4" "O5" "OCS" "OH" "Oil" "Ominus" "Oplus" "Orange" "Organic"
             "OrganicSubstance" "Ox" "Oxygen" "OxygenIsotope" "Ozone" "P"
             "Pahoehoe" "Paleosol" "Paleovegetation" "Particulate" "Pb" "PCB"
             "Pesticide" "Petroleum" "Phosphate" "Phosphorus"
             "PhotosyntheticallyActiveRadiation" "Pigment" "Plasma" "PO"
             "Pollen" "Potassium" "Powder" "Proton" "Pyroclastics" "Radiation"
             "RadioactiveSubstance" "Radiocarbon" "Radionuclide"
             "RadioWaveRadiation" "Red" "Rock" "S" "Salt" "Sand" "SeaWater"
             "Sediment" "Sedimentary" "SedimentaryRock" "Sewage"
             "ShortWaveRadiation" "Si" "Silica" "Silicon" "SiliconDioxide"
             "Silk" "SiO2" "Smoke" "Snow" "SnowFacies" "SnowGrain" "SO2" "SO4"
             "Sodium" "Soil" "Solid" "SolidSubstance" "SolidWater" "Solution"
             "Soot" "SOx" "Spray" "StableIsotope" "State" "StateOfMatter"
             "Substance" "SubstanceForm" "Sulfate" "Sulfur" "SulfurDioxide"
             "SulfurOxide" "SuspendedGas" "SuspendedSolid" "SuspendedSubstance"
             "Tephra" "TerrigenousSediment" "ThermalInfraredRadiation" "Toxin"
             "TraceGas" "TraceMetal" "TraceSubstance" "UltravioletRadiation"
             "Varve" "Violet" "VisibleLight" "VolcanicDeposit" "Water"
             "WaterVapor" "XrayRadiation" "Yellow"))
    (export (intern xml-query-data-model::s xml-query-data-model::p)
            xml-query-data-model::p)))

;;; (xqdm:find-namespace "http://sweet.jpl.nasa.gov/ontology/substance.owl#" :if-does-not-exist :load)
