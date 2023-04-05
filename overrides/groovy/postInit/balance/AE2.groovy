// import mods.appliedenergistics2.Inscriber

println("[AE2.groovy] Start AE2 Changes")

ore('dustFluix').add(item('appliedenergistics2:material:8'))
/*
TODO FIXME import broken
//Silicon
Inscriber.removeRecipe(item('appliedenergistics2:material:20'));
Inscriber.addRecipe(item('appliedenergistics2:material:20'), metaitem('plateSilicon'), true, item('appliedenergistics2:material:19'));

//Engineering Processor
Inscriber.removeRecipe(item('appliedenergistics2:material:24'));
Inscriber.addRecipe(item('appliedenergistics2:material:24'), item('ore:circuitLv'), false, item('appliedenergistics2:material:17'), item('appliedenergistics2:material:20'));
//Inscriber.addRecipe(item('appliedenergistics2:material:24'), <metaitem:circuit.basic_electronic>, false, item('appliedenergistics2:material:17'),item('appliedenergistics2:material:20'));
//Inscriber.addRecipe(item('appliedenergistics2:material:24'), item('contenttweaker:refinedcircuit'), false, item('appliedenergistics2:material:17'),item('appliedenergistics2:material:20'));
Inscriber.removeRecipe(item('appliedenergistics2:material:17'));
Inscriber.addRecipe(item('appliedenergistics2:material:17'), metaitem('plateDiamond'), true, item('appliedenergistics2:material:14'));

//Calculation Processor
Inscriber.removeRecipe(item('appliedenergistics2:material:23'));
Inscriber.addRecipe(item('appliedenergistics2:material:23'), item('ore:circuitLv'), false, item('appliedenergistics2:material:16'), item('appliedenergistics2:material:20'));
//Inscriber.addRecipe(item('appliedenergistics2:material:23'), <metaitem:circuit.basic_electronic>, false, item('appliedenergistics2:material:16'),item('appliedenergistics2:material:20'));
//Inscriber.addRecipe(item('appliedenergistics2:material:23'), item('contenttweaker:refinedcircuit'), false, item('appliedenergistics2:material:16'),item('appliedenergistics2:material:20'));
Inscriber.removeRecipe(item('appliedenergistics2:material:16'));
Inscriber.addRecipe(item('appliedenergistics2:material:16'), metaitem('plateCertusQuartz'), true, item('appliedenergistics2:material:13'));

//Logic Processor
Inscriber.removeRecipe(item('appliedenergistics2:material:22'));
Inscriber.addRecipe(item('appliedenergistics2:material:22'), item('ore:circuitLv'), false, item('appliedenergistics2:material:18'), item('appliedenergistics2:material:20'));
//Inscriber.addRecipe(item('appliedenergistics2:material:22'), <metaitem:circuit.basic_electronic>, false, item('appliedenergistics2:material:18'),item('appliedenergistics2:material:20'));
//Inscriber.addRecipe(item('appliedenergistics2:material:22'), item('contenttweaker:refinedcircuit'), false, item('appliedenergistics2:material:18'),item('appliedenergistics2:material:20'));
Inscriber.removeRecipe(item('appliedenergistics2:material:18'));
Inscriber.addRecipe(item('appliedenergistics2:material:18'), metaitem('plateGold'), true, item('appliedenergistics2:material:15'));
*/

//ME Drive
crafting.remove('appliedenergistics2:drive')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_drive')
    .output(item('appliedenergistics2:drive'))
    .matrix('AEA',
            'CcC',
			'AsA')
	// should this be paneglass?
    .key('A', metaitem('plateAluminium'))
    .key('E', metaitem('emitter.mv'))
    .key('C', ore('circuitLv'))
    .key('c', item('appliedenergistics2:chest'))
    .key('S', metaitem('sensor.mv'))
    .register()

//ME Inscriber
crafting.remove('appliedenergistics2:inscriber')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_inscriber')
    .output(item('appliedenergistics2:inscriber'))
    .matrix('DPD',
            'MHD',
			'DPD')
	// should this be paneglass?
    .key('D', metaitem('plateDarkSteel'))
    .key('P', metaitem('electric.piston.mv'))
    .key('M', item('appliedenergistics2:material:7'))
    .key('H', metaitem('hull.mv'))
    .register()

//Pattern
crafting.remove('appliedenergistics2:material:52')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_material_52')
    .output(item('appliedenergistics2:material:52'))
    .matrix('WWW',
            'PCP',
			'PPP')
	// should this be paneglass?
    .key('W', metaitem('wireFineSilver'))
    .key('P', metaitem('platePlastic'))
    .key('C', ore('circuitHv'))
    .register()

//Crafting CPU
// crafting.remove(item('appliedenergistics2:crafting_unit'));
// crafting.addShaped(item('appliedenergistics2:crafting_unit'), [
// 	[item('metaitem:plateAluminium'), item('appliedenergistics2:material:23'), item('metaitem:plateAluminium')],
// 	[item('appliedenergistics2:part:16'), item('appliedenergistics2:material:22'), item('appliedenergistics2:part:16')],
// 	[item('metaitem:plateAluminium'), item('appliedenergistics2:material:23'), item('metaitem:plateAluminium')]]);

//Molecular Assembler
// crafting.remove(item('appliedenergistics2:molecular_assembler'));
// crafting.addShaped(item('appliedenergistics2:molecular_assembler'), [
// 	[item('metaitem:plateAluminium'), item('appliedenergistics2:quartz_glass'), item('metaitem:plateAluminium')],
// 	[item('appliedenergistics2:material:44'), item('metaitem:workbench'), item('appliedenergistics2:material:43')],
// 	[item('metaitem:plateAluminium'), item('appliedenergistics2:quartz_glass'), item('metaitem:plateAluminium')]]);

// //Quartz Fiber
// crafting.remove(item('appliedenergistics2:part:140'));
// wiremill.recipeBuilder().inputs([item('appliedenergistics2:material:11')]).outputs(item('appliedenergistics2:part:140') * 2).duration(100).EUt(16).buildAndRegister();

// //Glass Cable
// crafting.remove(item('appliedenergistics2:part:16'));
// alloy_smelter.recipeBuilder().inputs([item('ore:dustFluix'), item('appliedenergistics2:part:140')]).outputs(item('appliedenergistics2:part:16') * 2).duration(50).EUt(16).buildAndRegister();

println("[AE2.groovy] End AE2 Changes")