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

// ME Drive
crafting.remove('appliedenergistics2:network/blocks/drive')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_drive')
    .output(item('appliedenergistics2:drive'))
    .matrix('AEA',
            'CcC',
			'ASA')
    .key('A', metaitem('plateAluminium'))
    .key('E', metaitem('emitter.mv'))
    .key('C', ore('circuitLv'))
    .key('c', item('appliedenergistics2:chest'))
    .key('S', metaitem('sensor.mv'))
    .register()

// ME Inscriber
crafting.remove('appliedenergistics2:network/blocks/inscriber')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_inscriber')
    .output(item('appliedenergistics2:inscriber'))
    .matrix('DPD',
            'MHD',
			'DPD')
    .key('D', metaitem('plateDarkSteel'))
    .key('P', metaitem('electric.piston.mv'))
    .key('M', item('appliedenergistics2:material:7'))
    .key('H', metaitem('hull.mv'))
    .register()

// Pattern
crafting.remove('appliedenergistics2:network/crafting/patterns_blank')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_pattern')
    .output(item('appliedenergistics2:material:52'))
    .matrix('WWW',
            'PCP',
			'PPP')
    .key('W', metaitem('wireFineSilver'))
    .key('P', metaitem('platePlastic'))
    .key('C', ore('circuitHv'))
    .register()

// Crafting CPU
crafting.remove('appliedenergistics2:network/crafting/cpu_crafting_unit')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_crafting_unit')
    .output(item('appliedenergistics2:crafting_unit'))
    .matrix('ACA',
            'cLc',
			'ACA')
    .key('A', metaitem('plateAluminium'))
    .key('C', item('appliedenergistics2:material:23')) // processor
    .key('c', item('appliedenergistics2:part:16')) // calculation
    .key('L', item('appliedenergistics2:part:22')) // logic
    .register()

// Molecular Assembler
crafting.remove('appliedenergistics2:network/crafting/molecular_assembler')
crafting.shapedBuilder()
    .name('contenttweaker:appliedenergistics2_molecular_assembler')
    .output(item('appliedenergistics2:molecular_assembler'))
    .matrix('AQA',
            'aCF',
			'AQA')
    .key('A', metaitem('plateAluminium'))
    .key('Q', item('appliedenergistics2:quartz_glass'))
    .key('a', item('appliedenergistics2:material:44')) // anhiliation core
    .key('C', metaitem('workbench'))
    .key('F', item('appliedenergistics2:material:43')) // formation core
    .register()

// Quartz Fiber
crafting.remove('appliedenergistics2:network/parts/quartz_fiber_part')
mods.gregtech.wiremill.recipeBuilder()
	.inputs([item('appliedenergistics2:material:11')])
	.outputs(item('appliedenergistics2:part:140') * 2)
	.duration(100)
	.EUt(16)
	.buildAndRegister()

// Glass Cable
crafting.remove('appliedenergistics2:network/cables/glass_fluix')
mods.gregtech.wiremill.alloy_smelter.recipeBuilder()
	.inputs([item('ore:dustFluix'), item('appliedenergistics2:part:140')])
	.outputs(item('appliedenergistics2:part:16') * 2)
	.duration(50)
	.EUt(16)
	.buildAndRegister()

println("[AE2.groovy] End AE2 Changes")