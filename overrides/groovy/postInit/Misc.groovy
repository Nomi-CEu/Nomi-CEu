// this is not in balance as i do not think this changes any existing recipies,
// and it only changes recipies that you have to 'build yourself'
println("[Misc.groovy] Start GT - Misc Changes")

// Infinity conversion
crafting.shapelessBuilder()
	.name("contenttweaker:infinity_ingot")
	.output(item('avaritia:resource:6'))
	.input(item('metaitem:ingotInfinity'))
	.register()
crafting.shapelessBuilder()
	.name("contenttweaker:infinity_plate")
	.output(item('moreplates:infinity_plate'))
	.input(item('metaitem:ingotInfinity'))
	.register()

/*
TODO IMPLEMENT THESE COMMENTED ONES
mods.jei.JEI.removeAndHide(item('metaitem:ingotInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:plateInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:plateDoubleInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:blockInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:nuggetInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:dustInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:dustSmallInfinity'));
mods.jei.JEI.removeAndHide(item('metaitem:dustTinyInfinity'));


// Infinity Plate * 1
item('recipemap:bender').findRecipe(24, [item('metaitem:ingotInfinity'), <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
// Double Infinity Plate * 1
item('recipemap:bender').findRecipe(96, [item('metaitem:ingotInfinity') * 2, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();
*/
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
//Create Universal GTCE Oredict for tools that can be used to reference by oredict and encapsulates all tools.
//Works for any material tool, any damage tool, electric or non-electric

//GTCE Tools
//ore('gtceWrenches').addItems([
//	item('gregtech:meta_tool:8').withEmptyTag(),
//	item('gregtech:meta_tool:29').withEmptyTag(),
//	item('gregtech:meta_tool:30').withEmptyTag(),
//	item('gregtech:meta_tool:31').withEmptyTag()]);
//
//ore('gtceScrewdrivers').addItems([
//	item('gregtech:meta_tool:11').withEmptyTag(),
//	item('gregtech:meta_tool:34').withEmptyTag()]);
//
//ore('gtceHardHammers').addItems([
//	item('gregtech:meta_tool:6').withEmptyTag()]);
//
//ore('gtceSaws').addItems([
//	item('gregtech:meta_tool:5').withEmptyTag(),
//	item('gregtech:meta_tool:16').withEmptyTag(),
//	item('gregtech:meta_tool:26').withEmptyTag(),
//	item('gregtech:meta_tool:27').withEmptyTag(),
//	item('gregtech:meta_tool:28').withEmptyTag(),
//	item('gregtech:meta_tool:33').withEmptyTag()]);
//
//ore('gtceFiles').addItems([
//	item('gregtech:meta_tool:9').withEmptyTag()]);
//
//ore('gtceMortars').addItems([
//	item('gregtech:meta_tool:12').withEmptyTag()]);
//
//ore('gtceWireCutters').addItems([
//	item('gregtech:meta_tool:13').withEmptyTag()]);


//Setting Item Max Stacksize
item('minecraft:snowball').Item.setMaxStackSize(64)
item('minecraft:ender_pearl').Item.setMaxStackSize(64)
