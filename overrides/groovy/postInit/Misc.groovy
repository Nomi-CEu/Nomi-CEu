// this is not in balance as i do not think this changes any existing recipies,
// and it only changes recipies that you have to 'build yourself'
println("[Misc.groovy] Start GT - Misc Changes")

/**
 * Infinity Material
 * Use avartia's ingots & moreplates's plates
 * but still keep it as a gt material
 */

// Infinity conversion
crafting.shapelessBuilder()
	.name("contenttweaker:infinity_ingot")
	.output(item('avaritia:resource:6'))
	.input(metaitem('ingotInfinity'))
	.register()
crafting.shapelessBuilder()
	.name("contenttweaker:infinity_plate")
	.output(item('moreplates:infinity_plate'))
	.input(metaitem('ingotInfinity'))
	.register()

mods.jei.removeAndHide(metaitem('ingotInfinity'))
mods.jei.removeAndHide(metaitem('plateInfinity'))
mods.jei.removeAndHide(metaitem('plateDoubleInfinity'))
mods.jei.removeAndHide(metaitem('blockInfinity'))
mods.jei.removeAndHide(metaitem('nuggetInfinity'))
mods.jei.removeAndHide(metaitem('dustInfinity'))
mods.jei.removeAndHide(metaitem('dustSmallInfinity'))
mods.jei.removeAndHide(metaitem('dustTinyInfinity'))

// Infinity Plate * 1
mods.gregtech.bender.removeByInput(24, [metaitem('ingotInfinity'), metaitem('circuit.integrated').withNbt(["Configuration": 1])], null)
// Double Infinity Plate * 1
mods.gregtech.bender.removeByInput(96, [metaitem('ingotInfinity') * 2, metaitem('circuit.integrated').withNbt(["Configuration": 2])], null)

mods.gregtech.bender.recipeBuilder()
	.inputs(item('avaritia:resource:6'))
	.circuitMeta(1)
	.outputs(item('moreplates:infinity_plate'))
	.duration(5000)
	.EUt(24)
	.buildAndRegister()

mods.gregtech.arc_furnace.recipeBuilder()
	.inputs(item('moreplates:infinity_plate'))
	.fluidInputs(fluid('oxygen') * 5000)
	.outputs(item('avaritia:resource:6'))
	.duration(5000)
	.EUt(30)
	.buildAndRegister()


//GTCE Marble
/*
TODO Implement
mods.chisel.Carving.addVariation("marble", item('gregtech:stone_smooth:2'))

//GTCE Basalt
mods.chisel.Carving.addVariation("basalt", item('gregtech:stone_smooth:3'))
*/

//Setting Item Max Stacksize
item('minecraft:snowball').Item.setMaxStackSize(64)
item('minecraft:ender_pearl').Item.setMaxStackSize(64)
