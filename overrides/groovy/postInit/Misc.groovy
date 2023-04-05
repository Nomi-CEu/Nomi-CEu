// this is not in balance as i do not think this changes any existing recipies,
// and it only changes recipies that you have to 'build yourself'
println("[Misc.groovy] Start GT - Misc Changes")

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

// mods.jei.removeAndHide(metaitem('ingotInfinity'));
// mods.jei.hideCategory(metaitem('plateInfinity'));
// mods.jei.hideCategory(metaitem('plateDoubleInfinity'));
// mods.jei.hideCategory(metaitem('blockInfinity'));
// mods.jei.hideCategory(metaitem('nuggetInfinity'));
// mods.jei.hideCategory(metaitem('dustInfinity'));
// mods.jei.hideCategory(metaitem('dustSmallInfinity'));
// mods.jei.hideCategory(metaitem('dustTinyInfinity'));

// Infinity Plate * 1
// item('recipemap:bender').findRecipe(24, [metaitem('ingotInfinity'), <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
// Double Infinity Plate * 1
// item('recipemap:bender').findRecipe(96, [metaitem('ingotInfinity') * 2, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();

mods.gregtech.bender.recipeBuilder()
	.inputs(item('avaritia:resource:6'))
	.circuitMeta(1)
	.outputs(item('moreplates:infinity_plate'))
	.duration(5000)
	.EUt(24)
	.buildAndRegister();

mods.gregtech.arc_furnace.recipeBuilder()
	.inputs(item('moreplates:infinity_plate'))
	.fluidInputs(fluid('oxygen') * 5000)
	.outputs(item('avaritia:resource:6'))
	.duration(5000)
	.EUt(30)
	.buildAndRegister();

//Add moreplates neutronium plate to gtce neutronium ore dict
//ore('plateNeutronium').add(item('moreplates:neutronium_plate:0'));

//ore('gemDilithium').remove(item('libvulpes:productgem'));
ore('crystalDilithium').add(item('libvulpes:productgem'));

//ore('blockWarpCoreRim').add(item('gregtech:meta_block_compressed_4:8'));

//GTCE Marble
/*
TODO Implement
mods.chisel.Carving.addVariation("marble", item('gregtech:stone_smooth:2'));

//GTCE Basalt
mods.chisel.Carving.addVariation("basalt", item('gregtech:stone_smooth:3'));
*/

//Setting Item Max Stacksize
item('minecraft:snowball').Item.setMaxStackSize(64)
item('minecraft:ender_pearl').Item.setMaxStackSize(64)
