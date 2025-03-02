package postInit.main.modeSpecific.expert

import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.ItemStack

import static gregtech.api.GTValues.*

if (!LabsModeHelper.expert) return

createStabilizedMinerRecipe(item('nomilabs:tieroneship'), item('nomilabs:tieroneship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tiertwoship'), item('nomilabs:tiertwoship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tierthreeship'), item('nomilabs:tierthreeship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tierfourship'), item('nomilabs:tierfourship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tierfourandhalfship'), item('nomilabs:tierfourandhalfship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tierfiveship'), item('nomilabs:tierfiveship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tiersixship'), item('nomilabs:tiersixship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tiersevenship'), item('nomilabs:tiersevenship_stabilized'))
createStabilizedMinerRecipe(item('nomilabs:tiereightship'), item('nomilabs:tiereightship_stabilized'))

// No Recycling, Accidental Recycling would be horrible, and most of the expensive ingredients cannot be recycled back
void createStabilizedMinerRecipe(ItemStack nonStab, ItemStack stab) {
	mods.gregtech.assembly_line.recipeBuilder()
		.inputs(nonStab, item('nomilabs:heartofauniverse'), item('draconicevolution:chaos_shard') * 4, metaitem('field.generator.uv') * 24, metaitem('plateDenseIridium') * 7, metaitem('plateDenseIridium') * 7, metaitem('plateDenseIridium') * 7, metaitem('plateDenseIridium') * 7)
		.fluidInputs(fluid('rocket_fuel') * 48000, fluid('omnium') * 576, fluid('neutronium') * 576)
		.outputs(stab)
		.duration(2500).EUt(VA[UHV])
		.buildAndRegister()
}
