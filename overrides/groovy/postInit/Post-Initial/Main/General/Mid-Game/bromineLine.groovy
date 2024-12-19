import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.recipes.builders.AssemblyLineRecipeBuilder
import gregtech.api.recipes.recipeproperties.ResearchProperty

import static gregtech.api.GTValues.*

// Bromine Line
mods.gregtech.fluid_heater.recipeBuilder()
		.fluidInputs(fluid('salt_water') * 1000)
		.fluidOutputs(fluid('mineralrichbrine') * 200)
		.circuitMeta(1)
		.duration(20).EUt(VA[HV])
		.buildAndRegister()

mods.gregtech.chemical_reactor.recipeBuilder()
		.fluidInputs(fluid('mineralrichbrine') * 5000, fluid('chlorine') * 2000, fluid('air') * 13000)
		.fluidOutputs(fluid('brominechlorinemixture') * 15000, fluid('depletedbrine') * 5000)
		.duration(100).EUt(VA[EV])
		.buildAndRegister()

mods.gregtech.chemical_reactor.recipeBuilder()
		.fluidInputs(fluid('brominechlorinemixture') * 15000, fluid('water') * 2000)
		.inputs(metaitem('dustSodiumHydroxide'))
		.fluidOutputs(fluid('alkalinebrominesolution') * 2000)
		.duration(80).EUt(VA[EV])
		.buildAndRegister()

mods.gregtech.centrifuge.recipeBuilder()
		.fluidInputs(fluid('depletedbrine') * 1000)
		.outputs(metaitem('dustSalt') * 10)
		.duration(80).EUt(VA[EV])
		.buildAndRegister()

mods.gregtech.fluid_solidifier.recipeBuilder()
		.fluidInputs(fluid('bromine') * 1000)
		.notConsumable(metaitem('shape.mold.ball'))
		.outputs(item('nomilabs:solidifiedbromine'))
		.duration(500).EUt(16)
		.buildAndRegister()

// Bromine Line HM Parts
if (LabsModeHelper.expert) {

	mods.gregtech.chemical_reactor.recipeBuilder()
			.fluidInputs(fluid('alkalinebrominesolution') * 400, fluid('sulfuric_acid') * 500, fluid('steam') * 16000 )
			.fluidOutputs(fluid('debrominatedwaste') * 400, fluid('crudebromine') * 100)
			.duration(30).EUt(VA[IV])
			.buildAndRegister()
	mods.gregtech.distillation_tower.recipeBuilder()
			.fluidInputs(fluid('crudebromine') * 1000)
			.fluidOutputs(fluid('bromine') * 100, fluid('water') * 800)
			.duration(20).EUt(VA[IV])
			.buildAndRegister()
	mods.gregtech.distillation_tower.recipeBuilder()
			.fluidInputs(fluid('debrominatedwaste') * 5000)
			.fluidOutputs(fluid('hydrochloric_acid') * 2000, fluid('water') * 4000)
			.outputs(metaitem('dustSodiumBisulfate') * 35)
			.duration(30).EUt(VA[IV])
			.buildAndRegister()
}
// Bromine Line NM Parts
if (LabsModeHelper.normal) {

	mods.gregtech.chemical_reactor.recipeBuilder()
			.fluidInputs(fluid('alkalinebrominesolution') * 400, fluid('sulfuric_acid') * 500, fluid('steam') * 16000)
			.fluidOutputs(fluid('debrominatedwaste') * 400, fluid('bromine') * 10)
			.duration(5).EUt(VA[IV])
			.buildAndRegister()
	mods.gregtech.distillation_tower.recipeBuilder()
			.fluidInputs(fluid('debrominatedwaste') * 5000)
			.fluidOutputs(fluid('hydrochloric_acid') * 2000, fluid('water') * 5000)
			.outputs(metaitem('dustSodiumBisulfate') * 35)
			.duration(20).EUt(VA[IV])
			.buildAndRegister()
}
