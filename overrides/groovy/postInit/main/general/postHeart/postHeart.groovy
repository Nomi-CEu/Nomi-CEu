package postInit.main.general.postHeart

import com.nomiceu.nomilabs.util.LabsModeHelper

import static gregtech.api.GTValues.*

// Universal Crystallizer (HM Only)
if (LabsModeHelper.expert) {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(metaitem('gcym:large_autoclave') * 24, item('packagedexcrafting:combination_crafter') * 24, metaitem('emitter.uv') * 24, metaitem('field.generator.uv') * 24, ore('circuitUhv') * 64, item('gregtech:wire_coil', 7) * 64, item('draconicevolution:reactor_component') * 24, item('draconicevolution:crafting_injector', 3) * 8, item('moreplates:infinity_plate') * 12)
		.fluidInputs(fluid('cryotheum') * 36864, fluid('moltenempowereddiamatine') * 18432, fluid('naquadria') * 63216, fluid('taranium') * 4608)
		.outputs(metaitem('nomilabs:universal_crystallizer'))
		.changeRecycling()
		.stationResearch(b -> b.researchStack(item('gregtech:wire_coil', 7)).CWUt(128))
		.duration(900).EUt(VA[UHV])
		.buildAndRegister()
}
