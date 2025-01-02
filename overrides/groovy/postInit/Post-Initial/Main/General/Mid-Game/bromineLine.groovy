import com.nomiceu.nomilabs.util.LabsModeHelper

import static gregtech.api.GTValues.*

/* Recipes for Bromine Line */

// Mineral Rich Brine
mods.gregtech.fluid_heater.recipeBuilder()
	.fluidInputs(fluid('salt_water') * 1000)
	.fluidOutputs(fluid('mineralrichbrine') * 200)
	.circuitMeta(1)
	.duration(20).EUt(VA[HV])
	.buildAndRegister()

// Bromine Chlorine + Depleted Brine
mods.gregtech.chemical_reactor.recipeBuilder()
	.fluidInputs(fluid('mineralrichbrine') * 5000, fluid('chlorine') * 2000, fluid('air') * 13000)
	.fluidOutputs(fluid('brominechlorinemixture') * 15000, fluid('depletedbrine') * 5000)
	.duration(100).EUt(VA[EV])
	.buildAndRegister()

// Alkaline Bromine Production
mods.gregtech.chemical_reactor.recipeBuilder()
	.inputs(metaitem('dustSodiumHydroxide'))
	.fluidInputs(fluid('brominechlorinemixture') * 15000, fluid('water') * 2000)
	.fluidOutputs(fluid('alkalinebrominesolution') * 2000)
	.duration(80).EUt(VA[EV])
	.buildAndRegister()

// Depleted Brine Recycling
mods.gregtech.centrifuge.recipeBuilder()
	.fluidInputs(fluid('depletedbrine') * 1000)
	.outputs(metaitem('dustSalt') * 10)
	.duration(80).EUt(VA[EV])
	.buildAndRegister()

if (LabsModeHelper.normal) {
	// Normal Mode Alkaline Bromine Processing
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
} else {
	// Expert Mode Alkaline Bromine Processing
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
