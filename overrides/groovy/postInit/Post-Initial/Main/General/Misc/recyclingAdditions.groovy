import static com.nomiceu.nomilabs.groovy.GroovyHelpers.RecipeRecyclingHelpers.*

/* Adds Recycling Recipes to some GT Items */

// Parts LuV
changeStackRecycling(metaitem('electric.motor.luv'), [metaitem('stickLongSamariumMagnetic'), metaitem('stickLongHsss') * 2, metaitem('ringHsss') * 2, metaitem('roundHsss') * 4, metaitem('wireFineRuridit') * 64, metaitem('cableGtSingleNiobiumTitanium') * 2])
changeStackRecycling(metaitem('electric.pump.luv'), [metaitem('electric.motor.luv'), metaitem('pipeSmallFluidNiobiumTitanium'), metaitem('plateHsss') * 2, metaitem('screwHsss') * 8, metaitem('ringSiliconeRubber') * 4, metaitem('rotorHsss'), metaitem('cableGtSingleNiobiumTitanium') * 2])
changeStackRecycling(metaitem('conveyor.module.luv'), [metaitem('electric.motor.luv') * 2, metaitem('plateHsss') * 2, metaitem('ringHsss') * 4, metaitem('roundHsss') * 16, metaitem('screwHsss') * 4, metaitem('cableGtSingleNiobiumTitanium') * 2])
changeStackRecycling(metaitem('electric.piston.luv'), [metaitem('electric.motor.luv'), metaitem('plateHsss') * 4, metaitem('ringHsss') * 4, metaitem('roundHsss') * 16, metaitem('stickHsss') * 4, metaitem('gearHsss'), metaitem('gearSmallHsss') * 2, metaitem('cableGtSingleNiobiumTitanium') * 2])
changeStackRecycling(metaitem('robot.arm.luv'), [metaitem('stickLongHsss') * 4, metaitem('gearHsss'), metaitem('gearSmallHsss') * 3, metaitem('electric.motor.luv') * 2, metaitem('electric.piston.luv'), metaitem('circuit.nano_mainframe'), metaitem('circuit.mainframe') * 2, metaitem('circuit.workstation') * 4, metaitem('cableGtSingleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('field.generator.luv'), [metaitem('frameHsss'), metaitem('plateHsss') * 6, metaitem('quantumstar'), metaitem('emitter.luv') * 2, metaitem('circuit.nano_mainframe') * 2, metaitem('wireFineIndiumTinBariumTitaniumCuprate') * 64, metaitem('wireFineIndiumTinBariumTitaniumCuprate') * 64, metaitem('cableGtSingleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('emitter.luv'), [metaitem('frameHsss'), metaitem('electric.motor.luv'), metaitem('stickLongRuridit') * 4, metaitem('quantumstar'), metaitem('circuit.nano_mainframe') * 2, metaitem('foilPalladium') * 64, metaitem('foilPalladium') * 32, metaitem('cableGtSingleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('sensor.luv'), [metaitem('frameHsss'), metaitem('electric.motor.luv'), metaitem('plateRuridit') * 4, metaitem('quantumstar'), metaitem('circuit.nano_mainframe') * 2, metaitem('foilPalladium') * 64, metaitem('foilPalladium') * 32, metaitem('cableGtSingleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('fluid.regulator.luv'), [metaitem('electric.pump.luv'), metaitem('circuit.nano_mainframe') * 2])

// Parts ZPM
changeStackRecycling(metaitem('electric.motor.zpm'), [metaitem('stickLongSamariumMagnetic'), metaitem('stickLongOsmiridium') * 4, metaitem('ringOsmiridium') * 4, metaitem('roundOsmiridium') * 8, metaitem('wireFineEuropium') * 64, metaitem('wireFineEuropium') * 32, metaitem('cableGtSingleVanadiumGallium') * 2])
changeStackRecycling(metaitem('electric.pump.zpm'), [metaitem('electric.motor.zpm'), metaitem('pipeNormalFluidPolybenzimidazole'), metaitem('plateOsmiridium') * 2, metaitem('screwOsmiridium') * 8, metaitem('ringSiliconeRubber') * 8, metaitem('rotorOsmiridium'), metaitem('cableGtSingleVanadiumGallium') * 2])
changeStackRecycling(metaitem('conveyor.module.zpm'), [metaitem('electric.motor.zpm') * 2, metaitem('plateOsmiridium') * 2, metaitem('ringOsmiridium') * 4, metaitem('roundOsmiridium') * 16, metaitem('screwOsmiridium') * 4, metaitem('cableGtSingleVanadiumGallium') * 2])
changeStackRecycling(metaitem('electric.piston.zpm'), [metaitem('electric.motor.zpm'), metaitem('plateOsmiridium') * 4, metaitem('ringOsmiridium') * 4, metaitem('roundOsmiridium') * 16, metaitem('stickOsmiridium') * 4, metaitem('gearOsmiridium'), metaitem('gearSmallOsmiridium') * 2, metaitem('cableGtSingleVanadiumGallium') * 2])
changeStackRecycling(metaitem('robot.arm.zpm'), [metaitem('stickLongOsmiridium') * 4, metaitem('gearOsmiridium'), metaitem('gearSmallOsmiridium') * 3, metaitem('electric.motor.zpm') * 2, metaitem('electric.piston.zpm'), metaitem('circuit.quantum_mainframe'), metaitem('circuit.nano_mainframe') * 2, metaitem('circuit.mainframe') * 4, metaitem('cableGtSingleVanadiumGallium') * 4])
changeStackRecycling(metaitem('field.generator.zpm'), [metaitem('frameNaquadahAlloy'), metaitem('plateNaquadahAlloy') * 6, metaitem('quantumstar'), metaitem('emitter.zpm') * 2, metaitem('circuit.quantum_mainframe') * 2, metaitem('wireFineUraniumRhodiumDinaquadide') * 64, metaitem('wireFineUraniumRhodiumDinaquadide') * 64, metaitem('cableGtSingleVanadiumGallium') * 4])
changeStackRecycling(metaitem('emitter.zpm'), [metaitem('frameNaquadahAlloy'), metaitem('electric.motor.zpm'), metaitem('stickLongOsmiridium') * 4, metaitem('quantumstar') * 2, metaitem('circuit.quantum_mainframe') * 2, metaitem('foilTrinium') * 64, metaitem('foilTrinium') * 32, metaitem('cableGtSingleVanadiumGallium') * 4])
changeStackRecycling(metaitem('sensor.zpm'), [metaitem('frameNaquadahAlloy'), metaitem('electric.motor.zpm'), metaitem('plateOsmiridium') * 4, metaitem('quantumstar') * 2, metaitem('circuit.quantum_mainframe') * 2, metaitem('foilTrinium') * 64, metaitem('foilTrinium') * 32, metaitem('cableGtSingleVanadiumGallium') * 4])
changeStackRecycling(metaitem('fluid.regulator.zpm'), [metaitem('electric.pump.zpm'), metaitem('circuit.quantum_mainframe') * 2])

// Parts UV
changeStackRecycling(metaitem('electric.motor.uv'), [metaitem('stickLongSamariumMagnetic'), metaitem('stickLongTritanium') * 4, metaitem('ringTritanium') * 4, metaitem('roundTritanium') * 8, metaitem('wireFineAmericium') * 64, metaitem('wireFineAmericium') * 64, metaitem('cableGtSingleYttriumBariumCuprate') * 2])
changeStackRecycling(metaitem('electric.pump.uv'), [metaitem('electric.motor.uv'), metaitem('pipeLargeFluidNaquadah'), metaitem('plateTritanium') * 2, metaitem('screwTritanium') * 8, metaitem('ringSiliconeRubber') * 16, metaitem('rotorNaquadahAlloy'), metaitem('cableGtSingleYttriumBariumCuprate') * 2])
changeStackRecycling(metaitem('conveyor.module.uv'), [metaitem('electric.motor.uv') * 2, metaitem('plateTritanium') * 2, metaitem('ringTritanium') * 4, metaitem('roundTritanium') * 16, metaitem('screwTritanium') * 4, metaitem('cableGtSingleYttriumBariumCuprate') * 2])
changeStackRecycling(metaitem('electric.piston.uv'), [metaitem('electric.motor.uv'), metaitem('plateTritanium') * 4, metaitem('ringTritanium') * 4, metaitem('roundTritanium') * 16, metaitem('stickTritanium') * 4, metaitem('gearNaquadahAlloy'), metaitem('gearSmallNaquadahAlloy') * 2, metaitem('cableGtSingleYttriumBariumCuprate') * 2])
changeStackRecycling(metaitem('robot.arm.uv'), [metaitem('stickLongTritanium') * 4, metaitem('gearTritanium'), metaitem('gearSmallTritanium') * 3, metaitem('electric.motor.uv') * 2, metaitem('electric.piston.uv'), metaitem('circuit.crystal_mainframe'), metaitem('circuit.quantum_mainframe') * 2, metaitem('circuit.nano_mainframe') * 4, metaitem('cableGtSingleYttriumBariumCuprate') * 4])
changeStackRecycling(metaitem('field.generator.uv'), [metaitem('frameTritanium'), metaitem('plateTritanium') * 6, metaitem('gravistar'), metaitem('emitter.uv') * 2, metaitem('circuit.crystal_mainframe') * 2, metaitem('wireFineEnrichedNaquadahTriniumEuropiumDuranide') * 64, metaitem('wireFineEnrichedNaquadahTriniumEuropiumDuranide') * 64, metaitem('cableGtSingleYttriumBariumCuprate') * 4])
changeStackRecycling(metaitem('emitter.uv'), [metaitem('frameTritanium'), metaitem('electric.motor.uv'), metaitem('stickLongTritanium') * 4, metaitem('gravistar'), metaitem('circuit.crystal_mainframe') * 2, metaitem('foilNaquadria') * 64, metaitem('foilNaquadria') * 32, metaitem('cableGtSingleYttriumBariumCuprate') * 4])
changeStackRecycling(metaitem('sensor.uv'), [metaitem('frameTritanium'), metaitem('electric.motor.uv'), metaitem('plateTritanium') * 4, metaitem('gravistar'), metaitem('circuit.crystal_mainframe') * 2, metaitem('foilNaquadria') * 64, metaitem('foilNaquadria') * 32, metaitem('cableGtSingleYttriumBariumCuprate') * 4])
changeStackRecycling(metaitem('fluid.regulator.uv'), [metaitem('electric.pump.uv'), metaitem('circuit.crystal_mainframe') * 2])

// Energy Hatches
changeStackRecycling(metaitem('energy_hatch.input.luv'), [metaitem('hull.luv'), metaitem('cableGtSingleNiobiumTitanium') * 4, metaitem('plate.high_power_integrated_circuit') * 2, metaitem('circuit.nano_mainframe'), metaitem('voltage_coil.luv') * 2])
changeStackRecycling(metaitem('energy_hatch.input.zpm'), [metaitem('hull.zpm'), metaitem('cableGtSingleVanadiumGallium') * 4, metaitem('plate.ultra_high_power_integrated_circuit') * 2, metaitem('circuit.quantum_mainframe'), metaitem('voltage_coil.zpm') * 2])
changeStackRecycling(metaitem('energy_hatch.input.uv'), [metaitem('hull.uv'), metaitem('cableGtSingleYttriumBariumCuprate') * 4, metaitem('plate.ultra_high_power_integrated_circuit') * 2, metaitem('circuit.crystal_mainframe'), metaitem('voltage_coil.uv') * 2])
changeStackRecycling(metaitem('energy_hatch.input.uhv'), [metaitem('hull.uhv'), metaitem('cableGtSingleEuropium') * 4, metaitem('plate.ultra_high_power_integrated_circuit') * 2, metaitem('circuit.wetware_mainframe'), metaitem('wireGtDoubleRutheniumTriniumAmericiumNeutronate') * 2])

// Dynamos
changeStackRecycling(metaitem('energy_hatch.output.luv'), [metaitem('hull.luv'), metaitem('springNiobiumTitanium') * 4, metaitem('plate.high_power_integrated_circuit') * 2, metaitem('circuit.nano_mainframe'), metaitem('voltage_coil.luv') * 2])
changeStackRecycling(metaitem('energy_hatch.output.zpm'), [metaitem('hull.zpm'), metaitem('springVanadiumGallium') * 4, metaitem('plate.ultra_high_power_integrated_circuit') * 2, metaitem('circuit.quantum_mainframe'), metaitem('voltage_coil.zpm') * 2])
changeStackRecycling(metaitem('energy_hatch.output.uv'), [metaitem('hull.uv'), metaitem('springYttriumBariumCuprate') * 4, metaitem('plate.ultra_high_power_integrated_circuit') * 2, metaitem('circuit.crystal_mainframe'), metaitem('voltage_coil.uv') * 2])
changeStackRecycling(metaitem('energy_hatch.output.uhv'), [metaitem('hull.uhv'), metaitem('springEuropium') * 4, metaitem('plate.ultra_high_power_integrated_circuit') * 2, metaitem('circuit.wetware_mainframe'), metaitem('wireGtDoubleRutheniumTriniumAmericiumNeutronate') * 2])

// 4A Energy Hatches
changeStackRecycling(metaitem('energy_hatch.input_4a.ev'), [metaitem('energy_hatch.input.ev'), metaitem('wireGtQuadrupleAluminium') * 2, metaitem('plateTitanium') * 2])
changeStackRecycling(metaitem('energy_hatch.input_4a.iv'), [metaitem('energy_hatch.input.iv'), metaitem('wireGtQuadrupleTungsten') * 2, metaitem('plateTungstenSteel') * 2])
changeStackRecycling(metaitem('energy_hatch.input_4a.luv'), [metaitem('energy_hatch.input.luv'), metaitem('wireGtQuadrupleNiobiumTitanium') * 2, metaitem('plateRhodiumPlatedPalladium') * 2])
changeStackRecycling(metaitem('energy_hatch.input_4a.zpm'), [metaitem('energy_hatch.input.zpm'), metaitem('wireGtQuadrupleVanadiumGallium') * 2, metaitem('plateNaquadahAlloy') * 2])
changeStackRecycling(metaitem('energy_hatch.input_4a.uv'), [metaitem('energy_hatch.input.uv'), metaitem('wireGtQuadrupleYttriumBariumCuprate') * 2, metaitem('plateDarmstadtium') * 2])
changeStackRecycling(metaitem('energy_hatch.input_4a.uhv'), [metaitem('energy_hatch.input.uhv'), metaitem('wireGtQuadrupleEuropium') * 2, metaitem('plateNeutronium') * 2])

// 16A Energy Hatches
changeStackRecycling(metaitem('energy_hatch.input_16a.iv'), [metaitem('transformer.iv'), metaitem('energy_hatch.input_4a.iv'), metaitem('wireGtOctalTungsten') * 2, metaitem('plateTungstenSteel') * 4])
changeStackRecycling(metaitem('energy_hatch.input_16a.luv'), [metaitem('transformer.luv'), metaitem('energy_hatch.input_4a.luv'), metaitem('wireGtOctalNiobiumTitanium') * 2, metaitem('plateRhodiumPlatedPalladium') * 4])
changeStackRecycling(metaitem('energy_hatch.input_16a.zpm'), [metaitem('transformer.zpm'), metaitem('energy_hatch.input_4a.zpm'), metaitem('wireGtOctalVanadiumGallium') * 2, metaitem('plateNaquadahAlloy') * 4])
changeStackRecycling(metaitem('energy_hatch.input_16a.uv'), [metaitem('transformer.uv'), metaitem('energy_hatch.input_4a.uv'), metaitem('wireGtOctalYttriumBariumCuprate') * 2, metaitem('plateDarmstadtium') * 4])
changeStackRecycling(metaitem('energy_hatch.input_16a.uhv'), [metaitem('transformer.hi_amp.uv'), metaitem('energy_hatch.input_4a.uhv') * 2, metaitem('wireGtOctalEuropium') * 2, metaitem('plateNeutronium') * 4])

// 4A Dynamoes
changeStackRecycling(metaitem('energy_hatch.output_4a.ev'), [metaitem('energy_hatch.output.ev'), metaitem('wireGtQuadrupleAluminium') * 2, metaitem('plateTitanium') * 2])
changeStackRecycling(metaitem('energy_hatch.output_4a.iv'), [metaitem('energy_hatch.output.iv'), metaitem('wireGtQuadrupleTungsten') * 2, metaitem('plateTungstenSteel') * 2])
changeStackRecycling(metaitem('energy_hatch.output_4a.luv'), [metaitem('energy_hatch.output.luv'), metaitem('wireGtQuadrupleNiobiumTitanium') * 2, metaitem('plateRhodiumPlatedPalladium') * 2])
changeStackRecycling(metaitem('energy_hatch.output_4a.zpm'), [metaitem('transformer.zpm'), metaitem('energy_hatch.output.zpm'), metaitem('wireGtQuadrupleVanadiumGallium') * 2, metaitem('plateNaquadahAlloy') * 2])
changeStackRecycling(metaitem('energy_hatch.output_4a.uv'), [metaitem('energy_hatch.output.uv'), metaitem('wireGtQuadrupleYttriumBariumCuprate') * 2, metaitem('plateDarmstadtium') * 2])
changeStackRecycling(metaitem('energy_hatch.output_4a.uhv'), [metaitem('energy_hatch.output.uhv'), metaitem('wireGtQuadrupleEuropium') * 2, metaitem('plateNeutronium') * 2])

// 16A Dynamoes
changeStackRecycling(metaitem('energy_hatch.output_16a.iv'), [metaitem('transformer.iv'), metaitem('energy_hatch.output_4a.iv'), metaitem('wireGtOctalTungsten') * 2, metaitem('plateTungstenSteel') * 4])
changeStackRecycling(metaitem('energy_hatch.output_16a.luv'), [metaitem('transformer.luv'), metaitem('energy_hatch.output_4a.luv'), metaitem('wireGtOctalNiobiumTitanium') * 2, metaitem('plateRhodiumPlatedPalladium') * 4])
changeStackRecycling(metaitem('energy_hatch.output_16a.zpm'), [metaitem('transformer.zpm'), metaitem('energy_hatch.output_4a.zpm'), metaitem('wireGtOctalVanadiumGallium') * 2, metaitem('plateNaquadahAlloy') * 4])
changeStackRecycling(metaitem('energy_hatch.output_16a.uv'), [metaitem('transformer.uv'), metaitem('energy_hatch.output_4a.uv'), metaitem('wireGtOctalYttriumBariumCuprate') * 2, metaitem('plateDarmstadtium') * 4])
changeStackRecycling(metaitem('energy_hatch.output_16a.uhv'), [metaitem('transformer.hi_amp.uv'), metaitem('energy_hatch.output_4a.uhv'), metaitem('wireGtOctalEuropium') * 2, metaitem('plateNeutronium') * 4])

// Power Transformers
changeStackRecycling(metaitem('transformer.adjustable.iv'), [metaitem('transformer.hi_amp.iv'), metaitem('electric.pump.hv'), metaitem('cableGtOctalNiobiumTitanium'), metaitem('cableGtHexTungsten') * 2, metaitem('springSmallTungsten'), metaitem('springNiobiumTitanium')])
changeStackRecycling(metaitem('transformer.adjustable.luv'), [metaitem('transformer.hi_amp.luv'), metaitem('electric.pump.ev'), metaitem('cableGtOctalVanadiumGallium'), metaitem('cableGtHexNiobiumTitanium') * 2, metaitem('springSmallNiobiumTitanium'), metaitem('springVanadiumGallium')])
changeStackRecycling(metaitem('transformer.adjustable.zpm'), [metaitem('transformer.hi_amp.zpm'), metaitem('electric.pump.ev'), metaitem('cableGtOctalYttriumBariumCuprate'), metaitem('cableGtHexVanadiumGallium') * 2, metaitem('springSmallVanadiumGallium'), metaitem('springYttriumBariumCuprate')])
changeStackRecycling(metaitem('transformer.adjustable.uv'), [metaitem('transformer.hi_amp.uv'), metaitem('electric.pump.iv'), metaitem('cableGtOctalEuropium'), metaitem('cableGtHexYttriumBariumCuprate') * 2, metaitem('springSmallYttriumBariumCuprate'), metaitem('springEuropium')])

// 64A Substation Energy Hatches
changeStackRecycling(metaitem('substation_hatch.input_64a.iv'), [metaitem('transformer.adjustable.iv'), metaitem('energy_hatch.input_16a.iv'), metaitem('wireGtHexTungsten') * 2, metaitem('plateTungstenSteel') * 6])
changeStackRecycling(metaitem('substation_hatch.input_64a.luv'), [metaitem('transformer.adjustable.luv'), metaitem('energy_hatch.input_16a.luv'), metaitem('wireGtHexNiobiumTitanium') * 2, metaitem('plateRhodiumPlatedPalladium') * 6])
changeStackRecycling(metaitem('substation_hatch.input_64a.zpm'), [metaitem('transformer.adjustable.zpm'), metaitem('energy_hatch.input_16a.zpm'), metaitem('wireGtHexVanadiumGallium') * 2, metaitem('plateNaquadahAlloy') * 6])
changeStackRecycling(metaitem('substation_hatch.input_64a.uv'), [metaitem('transformer.adjustable.uv'), metaitem('energy_hatch.input_16a.uv'), metaitem('wireGtHexYttriumBariumCuprate') * 2, metaitem('plateDarmstadtium') * 6])
changeStackRecycling(metaitem('substation_hatch.input_64a.uhv'), [metaitem('transformer.adjustable.uv'), metaitem('energy_hatch.input_16a.uhv'), metaitem('wireGtHexEuropium') * 2, metaitem('plateNeutronium') * 6])

// 64A Substation Dynamoes
changeStackRecycling(metaitem('substation_hatch.output_64a.iv'), [metaitem('transformer.adjustable.iv'), metaitem('energy_hatch.output_16a.iv'), metaitem('wireGtHexTungsten') * 2, metaitem('plateTungstenSteel') * 6])
changeStackRecycling(metaitem('substation_hatch.output_64a.luv'), [metaitem('transformer.adjustable.luv'), metaitem('energy_hatch.output_16a.luv'), metaitem('wireGtHexNiobiumTitanium') * 2, metaitem('plateRhodiumPlatedPalladium') * 6])
changeStackRecycling(metaitem('substation_hatch.output_64a.zpm'), [metaitem('transformer.adjustable.zpm'), metaitem('energy_hatch.output_16a.zpm'), metaitem('wireGtHexVanadiumGallium') * 2, metaitem('plateNaquadahAlloy') * 6])
changeStackRecycling(metaitem('substation_hatch.output_64a.uv'), [metaitem('transformer.adjustable.uv'), metaitem('energy_hatch.output_16a.uv'), metaitem('wireGtHexYttriumBariumCuprate') * 2, metaitem('plateDarmstadtium') * 6])
changeStackRecycling(metaitem('substation_hatch.output_64a.uhv'), [metaitem('transformer.adjustable.uv'), metaitem('energy_hatch.output_16a.uhv'), metaitem('wireGtHexEuropium') * 2, metaitem('plateNeutronium') * 6])

// 256A Laser Target Hatches
changeStackRecycling(metaitem('laser_hatch.target_256a.iv'), [metaitem('hull.iv'), metaitem('lensDiamond'), metaitem('emitter.iv'), metaitem('electric.pump.iv'), metaitem('cableGtSinglePlatinum') * 4])
changeStackRecycling(metaitem('laser_hatch.target_256a.luv'), [metaitem('hull.luv'), metaitem('lensDiamond'), metaitem('emitter.luv'), metaitem('electric.pump.luv'), metaitem('cableGtSingleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('laser_hatch.target_256a.zpm'), [metaitem('hull.zpm'), metaitem('lensDiamond'), metaitem('emitter.zpm'), metaitem('electric.pump.zpm'), metaitem('cableGtSingleVanadiumGallium') * 4])
changeStackRecycling(metaitem('laser_hatch.target_256a.uv'), [metaitem('hull.uv'), metaitem('lensDiamond'), metaitem('emitter.uv'), metaitem('electric.pump.uv'), metaitem('cableGtSingleYttriumBariumCuprate') * 4])

// 256A Laser Source Hatches
changeStackRecycling(metaitem('laser_hatch.source_256a.iv'), [metaitem('hull.iv'), metaitem('lensDiamond'), metaitem('sensor.iv'), metaitem('electric.pump.iv'), metaitem('cableGtSinglePlatinum') * 4])
changeStackRecycling(metaitem('laser_hatch.source_256a.luv'), [metaitem('hull.luv'), metaitem('lensDiamond'), metaitem('sensor.luv'), metaitem('electric.pump.luv'), metaitem('cableGtSingleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('laser_hatch.source_256a.zpm'), [metaitem('hull.zpm'), metaitem('lensDiamond'), metaitem('sensor.zpm'), metaitem('electric.pump.zpm'), metaitem('cableGtSingleVanadiumGallium') * 4])
changeStackRecycling(metaitem('laser_hatch.source_256a.uv'), [metaitem('hull.uv'), metaitem('lensDiamond'), metaitem('sensor.uv'), metaitem('electric.pump.uv'), metaitem('cableGtSingleYttriumBariumCuprate') * 4])

// 1024A Laser Target Hatches
changeStackRecycling(metaitem('laser_hatch.target_1024a.iv'), [metaitem('hull.iv'), metaitem('lensDiamond') * 2, metaitem('emitter.iv') * 2, metaitem('electric.pump.iv') * 2, metaitem('cableGtDoublePlatinum') * 4])
changeStackRecycling(metaitem('laser_hatch.target_1024a.luv'), [metaitem('hull.luv'), metaitem('lensDiamond') * 2, metaitem('emitter.luv') * 2, metaitem('electric.pump.luv') * 2, metaitem('cableGtDoubleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('laser_hatch.target_1024a.zpm'), [metaitem('hull.zpm'), metaitem('lensDiamond') * 2, metaitem('emitter.zpm') * 2, metaitem('electric.pump.zpm') * 2, metaitem('cableGtDoubleVanadiumGallium') * 4])
changeStackRecycling(metaitem('laser_hatch.target_1024a.uv'), [metaitem('hull.uv'), metaitem('lensDiamond') * 2, metaitem('emitter.uv') * 2, metaitem('electric.pump.uv') * 2, metaitem('cableGtDoubleYttriumBariumCuprate') * 4])

// 1024A Laser Source Hatches
changeStackRecycling(metaitem('laser_hatch.source_1024a.iv'), [metaitem('hull.iv'), metaitem('lensDiamond') * 2, metaitem('sensor.iv') * 2, metaitem('electric.pump.iv') * 2, metaitem('cableGtDoublePlatinum') * 4])
changeStackRecycling(metaitem('laser_hatch.source_1024a.luv'), [metaitem('hull.luv'), metaitem('lensDiamond') * 2, metaitem('sensor.luv') * 2, metaitem('electric.pump.luv') * 2, metaitem('cableGtDoubleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('laser_hatch.source_1024a.zpm'), [metaitem('hull.zpm'), metaitem('lensDiamond') * 2, metaitem('sensor.zpm') * 2, metaitem('electric.pump.zpm') * 2, metaitem('cableGtDoubleVanadiumGallium') * 4])
changeStackRecycling(metaitem('laser_hatch.source_1024a.uv'), [metaitem('hull.uv'), metaitem('lensDiamond') * 2, metaitem('sensor.uv') * 2, metaitem('electric.pump.uv') * 2, metaitem('cableGtDoubleYttriumBariumCuprate') * 4])

// 4096A Laser Target Hatches
changeStackRecycling(metaitem('laser_hatch.target_4096a.iv'), [metaitem('hull.iv'), metaitem('lensDiamond') * 4, metaitem('emitter.iv') * 4, metaitem('electric.pump.iv') * 4, metaitem('cableGtQuadruplePlatinum') * 4])
changeStackRecycling(metaitem('laser_hatch.target_4096a.luv'), [metaitem('hull.luv'), metaitem('lensDiamond') * 4, metaitem('emitter.luv') * 4, metaitem('electric.pump.luv') * 4, metaitem('cableGtQuadrupleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('laser_hatch.target_4096a.zpm'), [metaitem('hull.zpm'), metaitem('lensDiamond') * 4, metaitem('emitter.zpm') * 4, metaitem('electric.pump.zpm') * 4, metaitem('cableGtQuadrupleVanadiumGallium') * 4])
changeStackRecycling(metaitem('laser_hatch.target_4096a.uv'), [metaitem('hull.uv'), metaitem('lensDiamond') * 4, metaitem('emitter.uv') * 4, metaitem('electric.pump.uv') * 4, metaitem('cableGtQuadrupleYttriumBariumCuprate') * 4])

// 4096A Laser Source Hatches
changeStackRecycling(metaitem('laser_hatch.source_4096a.iv'), [metaitem('hull.iv'), metaitem('lensDiamond') * 4, metaitem('sensor.iv') * 4, metaitem('electric.pump.iv') * 4, metaitem('cableGtQuadruplePlatinum') * 4])
changeStackRecycling(metaitem('laser_hatch.source_4096a.luv'), [metaitem('hull.luv'), metaitem('lensDiamond') * 4, metaitem('sensor.luv') * 4, metaitem('electric.pump.luv') * 4, metaitem('cableGtQuadrupleNiobiumTitanium') * 4])
changeStackRecycling(metaitem('laser_hatch.source_4096a.zpm'), [metaitem('hull.zpm'), metaitem('lensDiamond') * 4, metaitem('sensor.zpm') * 4, metaitem('electric.pump.zpm') * 4, metaitem('cableGtQuadrupleVanadiumGallium') * 4])
changeStackRecycling(metaitem('laser_hatch.source_4096a.uv'), [metaitem('hull.uv'), metaitem('lensDiamond') * 4, metaitem('sensor.uv') * 4, metaitem('electric.pump.uv') * 4, metaitem('cableGtQuadrupleYttriumBariumCuprate') * 4])

// Batteries
changeStackRecycling(metaitem('battery.re.ulv.tantalum'), [metaitem('dustTantalum'), metaitem('foilManganese')])
changeStackRecycling(metaitem('energy_crystal'), [metaitem('energium_dust') * 9])
changeStackRecycling(metaitem('lapotron_crystal'), [metaitem('gemLapotron'), metaitem('circuit.advanced_integrated') * 2])
changeStackRecycling(metaitem('energy.lapotronic_orb'), [metaitem('circuit_board.extreme'), metaitem('plate.power_integrated_circuit') * 4, metaitem('engraved.lapotron_chip') * 24, metaitem('plate.nano_central_processing_unit') * 2, metaitem('wireFinePlatinum') * 16, metaitem('platePlatinum') * 8])
changeStackRecycling(metaitem('energy.lapotronic_orb_cluster'), [metaitem('circuit_board.extreme'), metaitem('plateEuropium') * 8, metaitem('circuit.nano_mainframe') * 4, metaitem('energy.lapotronic_orb'), metaitem('field.generator.iv'), metaitem('plate.high_power_integrated_circuit') * 16, metaitem('component.advanced_smd.diode') * 8, metaitem('component.advanced_smd.capacitor') * 8, metaitem('component.advanced_smd.resistor') * 8, metaitem('component.advanced_smd.transistor') * 8, metaitem('component.advanced_smd.inductor') * 8, metaitem('wireFinePlatinum') * 64, metaitem('boltNaquadah') * 16])
changeStackRecycling(metaitem('energy.module'), [metaitem('circuit_board.elite'), metaitem('plateDoubleEuropium') * 8, metaitem('circuit.quantum_mainframe') * 4, metaitem('energy.lapotronic_orb_cluster'), metaitem('field.generator.luv'), metaitem('plate.high_power_integrated_circuit') * 32, metaitem('component.advanced_smd.diode') * 12, metaitem('component.advanced_smd.capacitor') * 12, metaitem('component.advanced_smd.resistor') * 12, metaitem('component.advanced_smd.transistor') * 12, metaitem('component.advanced_smd.inductor') * 12, metaitem('wireFineRuridit') * 64, metaitem('boltTrinium') * 16])
changeStackRecycling(metaitem('energy.cluster'), [metaitem('circuit_board.wetware'), metaitem('plateAmericium') * 16, metaitem('circuit.wetware_computer') * 4, metaitem('energy.module'), metaitem('field.generator.zpm'), metaitem('plate.ultra_high_power_integrated_circuit') * 32, metaitem('component.advanced_smd.diode') * 16, metaitem('component.advanced_smd.capacitor') * 16, metaitem('component.advanced_smd.resistor') * 16, metaitem('component.advanced_smd.transistor') * 16, metaitem('component.advanced_smd.inductor') * 16, metaitem('wireFineOsmiridium') * 64, metaitem('boltNaquadria') * 16])
changeStackRecycling(metaitem('max.battery'), [metaitem('plateDoubleDarmstadtium') * 16, metaitem('circuit.wetware_mainframe') * 4, metaitem('energy.cluster') * 16, metaitem('field.generator.uv') * 4, metaitem('wafer.ultra_high_power_integrated_circuit') * 64, metaitem('wafer.ultra_high_power_integrated_circuit') * 64, metaitem('component.advanced_smd.diode') * 64, metaitem('component.advanced_smd.capacitor') * 64, metaitem('component.advanced_smd.resistor') * 64, metaitem('component.advanced_smd.transistor') * 64, metaitem('component.advanced_smd.inductor') * 64, metaitem('wireGtSingleEnrichedNaquadahTriniumEuropiumDuranide') * 64, metaitem('boltNeutronium') * 64])
