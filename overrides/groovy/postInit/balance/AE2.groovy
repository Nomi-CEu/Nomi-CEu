import static NomiUtil.getInscriberBuilder
import static NomiUtil.registerInscriberRecipe
import static NomiUtil.removeInscriberRecipe
println("[AE2.groovy] Start AE2 Changes")

ore('dustFluix').add(item('appliedenergistics2:material:8'))

//Silicon
removeInscriberRecipe(item('appliedenergistics2:material:20'))
registerInscriberRecipe(
	getInscriberBuilder(true)
		.withOutput(item('appliedenergistics2:material:20'))
		// Collection<ItemStack>
		.withInputs([metaitem('plateSilicon')])
		.withTopOptional(item('appliedenergistics2:material:19'))
		.build()
	)

//Engineering Processor
removeInscriberRecipe(item('appliedenergistics2:material:24'))
registerInscriberRecipe(
	getInscriberBuilder(false)
		.withOutput(item('appliedenergistics2:material:24'))
		.withInputs([ore('circuitLv')])
		.withTopOptional(item('appliedenergistics2:material:17'))
		.withBottomOptional(item('appliedenergistics2:material:20'))
		.build()
	)

//Inscriber.addRecipe(item('appliedenergistics2:material:24'), <metaitem:circuit.basic_electronic>, false, item('appliedenergistics2:material:17'),item('appliedenergistics2:material:20'))
//Inscriber.addRecipe(item('appliedenergistics2:material:24'), item('contenttweaker:refinedcircuit'), false, item('appliedenergistics2:material:17'),item('appliedenergistics2:material:20'))
removeInscriberRecipe(item('appliedenergistics2:material:17'))
registerInscriberRecipe(
	getInscriberBuilder(true)
		.withOutput(item('appliedenergistics2:material:17'))
		.withInputs([metaitem('plateDiamond')])
		.withTopOptional(item('appliedenergistics2:material:14'))
		.build()
	)

//Calculation Processor
removeInscriberRecipe(item('appliedenergistics2:material:23'))
registerInscriberRecipe(
	getInscriberBuilder(false)
		.withOutput(item('appliedenergistics2:material:23'))
		.withInputs([ore('circuitLv')])
		.withTopOptional(item('appliedenergistics2:material:16'))
		.withBottomOptional(item('appliedenergistics2:material:20'))
		.build()
	)
//Inscriber.addRecipe(item('appliedenergistics2:material:23'), <metaitem:circuit.basic_electronic>, false, item('appliedenergistics2:material:16'),item('appliedenergistics2:material:20'))
//Inscriber.addRecipe(item('appliedenergistics2:material:23'), item('contenttweaker:refinedcircuit'), false, item('appliedenergistics2:material:16'),item('appliedenergistics2:material:20'))
removeInscriberRecipe(item('appliedenergistics2:material:16'))
registerInscriberRecipe(
	getInscriberBuilder(true)
		.withOutput(item('appliedenergistics2:material:16'))
		.withInputs([metaitem('plateCertusQuartz')])
		.withTopOptional(item('appliedenergistics2:material:13'))
		.build()
	)

//Logic Processor
removeInscriberRecipe(item('appliedenergistics2:material:22'))
registerInscriberRecipe(
	getInscriberBuilder(false)
		.withOutput(item('appliedenergistics2:material:22'))
		.withInputs([ore('circuitLv')])
		.withTopOptional(item('appliedenergistics2:material:18'))
		.withBottomOptional(item('appliedenergistics2:material:20'))
		.build()
	)
//Inscriber.addRecipe(item('appliedenergistics2:material:22'), <metaitem:circuit.basic_electronic>, false, item('appliedenergistics2:material:18'),item('appliedenergistics2:material:20'))
//Inscriber.addRecipe(item('appliedenergistics2:material:22'), item('contenttweaker:refinedcircuit'), false, item('appliedenergistics2:material:18'),item('appliedenergistics2:material:20'))
removeInscriberRecipe(item('appliedenergistics2:material:18'))
registerInscriberRecipe(
	getInscriberBuilder(true)
		.withOutput(item('appliedenergistics2:material:18'))
		// Collection<ItemStack>
		.withInputs([metaitem('plateGold')])
		.withTopOptional(item('appliedenergistics2:material:15'))
		.build()
	)

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
mods.gregtech.wiremill.recipeBuilder()
	.inputs([ore('dustFluix'), item('appliedenergistics2:part:140')])
	.outputs(item('appliedenergistics2:part:16') * 2)
	.duration(50)
	.EUt(16)
	.buildAndRegister()

println("[AE2.groovy] End AE2 Changes")