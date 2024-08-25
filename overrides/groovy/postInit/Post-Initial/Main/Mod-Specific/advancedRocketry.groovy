import com.nomiceu.nomilabs.util.LabsModeHelper
import net.minecraft.item.ItemStack

import static gregtech.api.GTValues.*

// Add Airtight Seal Recipes
ItemStack airtight = item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 12, 'lvl': (short) 1]]])

if (LabsModeHelper.normal) {
	mods.gregtech.assembler.recipeBuilder()
		.inputs(
			ore('foilAluminium') * 64,
			metaitem('duct_tape') * 32,
			item('nomilabs:cloth') * 16,
			metaitem('carbon.mesh') * 8,
			metaitem('fluid.regulator.hv') * 4,
			metaitem('gas_collector.hv'),
			item('advancedrocketry:pressuretank', 1), // Normal Pressure Tank
			item('advancedrocketry:pressuretank', 1),
			item('advancedrocketry:pressuretank', 1),
		).fluidInputs(fluid('rubber') * 1296)
		.outputs(airtight * 4)
		.duration(500).EUt(VA[HV])
		.buildAndRegister()
} else {
	mods.extendedcrafting.table_crafting.shapedBuilder()
		.tierAdvanced()
		.output(airtight * 4)
		.matrix(
			'RMCMR',
			'TPZPT',
			'FADAF',
			'TPYPT',
			'RXBXR',
		)
		.key('R', ore('ringRubber'))
		.key('M', metaitem('carbon.mesh'))
		.key('C', metaitem('gas_collector.hv'))
		.key('T', ore('plateDoubleTitanium'))
		.key('P', item('advancedrocketry:pressuretank', 1)) // Normal Pressure Tank
		.key('Z', item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 5, 'lvl': (short) 3]]])) // Respiration 3
		.key('F', metaitem('fluid.regulator.ev'))
		.key('A', metaitem('pipeNormalFluidPolytetrafluoroethylene'))
		.key('D', ore('dustQuicklime'))
		.key('Y', item('minecraft:enchanted_book').withNbt(['StoredEnchantments': [['id': (short) 36, 'lvl': (short) 4]]])) // Holding 4
		.key('B', metaitem('chemical_reactor.hv'))
		.key('X', metaitem('duct_tape'))
		.register()
}
