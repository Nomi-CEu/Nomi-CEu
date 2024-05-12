import net.minecraftforge.event.entity.player.ItemTooltipEvent

//standardise fluix dust
ore('dustFluix').add(item('appliedenergistics2:material:8'))

//Silicon
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:20'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(metaitem('plateSilicon'))
    .top(item('appliedenergistics2:material:19'))
    .output(item('appliedenergistics2:material:20'))
    .register()
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(ore('itemSilicon'))
    .top(item('appliedenergistics2:material:19'))
    .output(item('appliedenergistics2:material:20'))
    .register()

//Engineering Processor
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:24'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(ore('circuitLv'))
    .top(item('appliedenergistics2:material:17'))
    .bottom(item('appliedenergistics2:material:20'))
    .output(item('appliedenergistics2:material:24'))
    .inscribe()
    .register()
//Printed Engineering circuit
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:17'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(metaitem('plateDiamond'))
    .top(item('appliedenergistics2:material:14'))
    .output(item('appliedenergistics2:material:17'))
    .register()

//Calculation Processor
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:23'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(ore('circuitLv'))
    .top(item('appliedenergistics2:material:16'))
    .bottom(item('appliedenergistics2:material:20'))
    .output(item('appliedenergistics2:material:23'))
    .inscribe()
    .register()
//Printed Calculation circuit
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:16'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(metaitem('plateCertusQuartz'))
    .top(item('appliedenergistics2:material:13'))
    .output(item('appliedenergistics2:material:16'))
    .register()

//Logic Processor
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:22'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(ore('circuitLv'))
    .top(item('appliedenergistics2:material:18'))
    .bottom(item('appliedenergistics2:material:20'))
    .output(item('appliedenergistics2:material:22'))
    .inscribe()
    .register()
//Printed Logic circuit
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:18'))
mods.appliedenergistics2.inscriber.recipeBuilder()
    .input(metaitem('plateGold'))
    .top(item('appliedenergistics2:material:15'))
    .output(item('appliedenergistics2:material:18'))
    .register()

//ME Drive
crafting.shapedBuilder()
    .output(item('appliedenergistics2:drive'))
    .matrix('PEP',
            'LCL',
            'PSP')
    .key('P', metaitem('plateAluminium'))
    .key('E', metaitem('emitter.mv'))
    .key('L', ore('circuitLv'))
    .key('C', item('appliedenergistics2:chest'))
    .key('S', metaitem('sensor.mv'))
    .replace().register()

//ME Inscriber
crafting.shapedBuilder()
    .output(item('appliedenergistics2:inscriber'))
    .matrix('DPD',
            'FHD',
            'DPD')
    .key('D', metaitem('nomilabs:plateDarkSteel'))
    .key('P', metaitem('electric.piston.mv'))
    .key('F', item('appliedenergistics2:material:7'))
    .key('H', metaitem('hull.mv'))
    .replace().register()

//Pattern
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:52') * 8)
    .matrix('WWW',
            'PCP',
            'PPP')
    .key('W', metaitem('wireFineSilver'))
    .key('P', metaitem('platePlastic'))
    .key('C', ore('circuitHv'))
    .replace().register()

//Crafting CPU
crafting.shapedBuilder()
    .output(item('appliedenergistics2:crafting_unit'))
    .matrix('PCP',
            'FLF',
            'PCP')
    .key('P', metaitem('plateAluminium'))
    .key('C', item('appliedenergistics2:material:23'))
    .key('F', item('appliedenergistics2:part:16'))
    .key('L', item('appliedenergistics2:material:22'))
    .replace().register()

//Molecular Assembler
crafting.shapedBuilder()
    .output(item('appliedenergistics2:molecular_assembler'))
    .matrix('PGP',
            'ACF',
            'PGP')
    .key('P', metaitem('plateAluminium'))
    .key('G', item('appliedenergistics2:quartz_glass'))
    .key('A', item('appliedenergistics2:material:44'))
    .key('C', metaitem('workbench'))
    .key('F', item('appliedenergistics2:material:43'))
    .replace().register()

//Quartz Fiber
crafting.removeByOutput(item('appliedenergistics2:part:140'))
mods.gregtech.wiremill.recipeBuilder()
    .inputs(item('appliedenergistics2:material:11'))
    .outputs(item('appliedenergistics2:part:140') * 2)
    .duration(100)
    .EUt(16)
    .buildAndRegister()

//Glass Cable
crafting.removeByOutput(item('appliedenergistics2:part:16'))
mods.gregtech.alloy_smelter.recipeBuilder()
    .inputs(ore('dustFluix'), item('appliedenergistics2:part:140'))
    .outputs(item('appliedenergistics2:part:16') * 2)
    .duration(50)
    .EUt(16)
    .buildAndRegister()

//Covered Cable
mods.gregtech.assembler.recipeBuilder()
    .inputs(item('appliedenergistics2:part:16'))
    .fluidInputs(fluid('rubber') * 144)
    .outputs(item('appliedenergistics2:part:36'))
    .duration(100)
    .EUt(7)
    .buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
    .inputs(item('appliedenergistics2:part:16'))
    .fluidInputs(fluid('styrene_butadiene_rubber') * 36)
    .outputs(item('appliedenergistics2:part:36'))
    .duration(100)
    .EUt(7)
    .buildAndRegister()

mods.gregtech.assembler.recipeBuilder()
    .inputs(item('appliedenergistics2:part:16'))
    .fluidInputs(fluid('silicone_rubber') * 76)
    .outputs(item('appliedenergistics2:part:36'))
    .duration(100)
    .EUt(7)
    .buildAndRegister()

//ME Conduit
crafting.removeByOutput(item('enderio:item_me_conduit'))
mods.gregtech.assembler.recipeBuilder()
    .inputs(item('appliedenergistics2:part:36') * 3, item('enderio:item_material:4') * 6)
    .outputs(item('enderio:item_me_conduit') * 8)
    .duration(100)
    .EUt(16)
    .buildAndRegister()

//Vibrant Quartz Glass
crafting.removeByOutput(item('appliedenergistics2:quartz_vibrant_glass'))
mods.gregtech.alloy_smelter.recipeBuilder()
    .inputs(item('appliedenergistics2:quartz_glass'), ore('ingotVibrantAlloy'))
    .outputs(item('appliedenergistics2:quartz_vibrant_glass'))
    .duration(80)
    .EUt(16)
    .buildAndRegister()

//Meteorite Compass
crafting.removeByOutput(item('appliedenergistics2:sky_compass'))
crafting.shapedBuilder()
    .output(item('appliedenergistics2:sky_compass'))
    .matrix('VPV',
            'PCP',
            'VPV')
    .key('V', item('actuallyadditions:item_crystal:3'))
    .key('P', metaitem('nomilabs:plateDarkSteel'))
    .key('C', item('appliedenergistics2:material:1'))
    .replace().register()

//Fluix Plate
mods.gregtech.compressor.recipeBuilder()
    .inputs(item('appliedenergistics2:material:7'))
    .outputs(item('moreplates:fluix_plate'))
    .duration(20)
    .EUt(12)
    .buildAndRegister()
mods.gregtech.compressor.recipeBuilder()
    .inputs(item('appliedenergistics2:material:12'))
    .outputs(item('moreplates:fluix_plate'))
    .duration(20)
    .EUt(12)
    .buildAndRegister()

//Formation Plane
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:320'))
    .matrix('PPP',
            'AFA')
    .key('P', item('moreplates:fluix_plate'))
    .key('A', metaitem('plateAluminium'))
    .key('F', item('appliedenergistics2:material:43'))
    .replace().register()

//Annihilation Plane
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:300'))
    .matrix('FFF',
            'PAP')
    .key('F', item('moreplates:fluix_plate'))
    .key('P', metaitem('plateAluminium'))
    .key('A', item('appliedenergistics2:material:44'))
    .replace().register()

//Fluid Formation Plane
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:321'))
    .matrix('PPP',
            'LFL')
    .key('P', item('moreplates:fluix_plate'))
    .key('L', metaitem('plateLapis'))
    .key('F', item('appliedenergistics2:material:43'))
    .replace().register()

//Fluid Annihilation Plane
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:302'))
    .matrix('PPP',
            'LAL')
    .key('P', item('moreplates:fluix_plate'))
    .key('L', metaitem('plateLapis'))
    .key('A', item('appliedenergistics2:material:44'))
    .replace().register()

//Fluid Terminal
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:part:520'))
    .input(item('appliedenergistics2:part:380'))
    .input(metaitem('plateLapis'))
    .input(item('appliedenergistics2:material:22'))
    .replace().register()

//Export Bus
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:260'))
    .matrix('PFP',
            ' E ')
    .key('P', metaitem('plateAluminium'))
    .key('F', item('appliedenergistics2:material:43'))
    .key('E', metaitem('electric.piston.mv'))
    .replace().register()

//Fluid Export Bus
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:261'))
    .matrix('PFP',
            ' E ')
    .key('P', metaitem('plateLapis'))
    .key('F', item('appliedenergistics2:material:43'))
    .key('E', metaitem('electric.piston.mv'))
    .replace().register()

//Import Bus
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:240'))
    .matrix(' A ',
            'PEP')
    .key('A', item('appliedenergistics2:material:44'))
    .key('P', metaitem('plateAluminium'))
    .key('E', metaitem('electric.piston.mv'))
    .replace().register()

//Fluid Import Bus
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:241'))
    .matrix(' A ',
            'PEP')
    .key('A', item('appliedenergistics2:material:44'))
    .key('P', metaitem('plateLapis'))
    .key('E', metaitem('electric.piston.mv'))
    .replace().register()

//Storage Bus
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:part:220'))
    .input(metaitem('electric.piston.mv'))
    .input(item('appliedenergistics2:interface'))
    .replace().register()

//Fluid Storage Bus
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:part:221'))
    .input(metaitem('electric.pump.mv'))
    .input(item('appliedenergistics2:fluid_interface'))
    .replace().register()

//P2P Tunnel
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:460'))
    .matrix(' P ',
            'PEP',
            'FFF')
    .key('P', metaitem('plateStainlessSteel'))
    .key('E', item('appliedenergistics2:material:24'))
    .key('F', ore('plateFluix'))
    .replace().register()

//Card Bio
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:memory_card'))
    .input(item('appliedenergistics2:material:25'))
    .input(metaitem('sensor.hv'))
    .replace().register()

//Memory Card
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:memory_card'))
    .input(item('appliedenergistics2:material:25'))
    .input(ore('circuitHv'))
    .replace().register()

//Basic Card
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:25'))
    .matrix('WP ',
            'WCP',
            'WP ')
    .key('W', metaitem('wireFineCopper'))
    .key('P', metaitem('plateIron'))
    .key('C', item('appliedenergistics2:material:23'))
    .replace().register()

//Advanced Card
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:28'))
    .matrix('WP ',
            'WCP',
            'WP ')
    .key('W', metaitem('wireFineAluminium'))
    .key('P', metaitem('nomilabs:plateElectricalSteel'))
    .key('C', item('appliedenergistics2:material:23'))
    .replace().register()

//Matter Condensor
crafting.shapedBuilder()
    .output(item('appliedenergistics2:condenser'))
    .matrix('PPP',
            'PSP',
            'PPP')
    .key('P', metaitem('plateTitanium'))
    .key('S', metaitem('quantumstar'))
    .replace().register()

//Wireless Part
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:41'))
    .matrix(' E ',
            'PFP',
            ' P ')
    .key('E', metaitem('emitter.ev'))
    .key('P', metaitem('plateTitanium'))
    .key('F', item('appliedenergistics2:material:9'))
    .replace().register()

//Level Emitters
//item
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:280'))
    .matrix('TP ',
            'CR ')
    .key('T', item('minecraft:redstone_torch'))
    .key('P', metaitem('plateAluminium'))
    .key('C', item('appliedenergistics2:material:23'))
    .key('R', metaitem('stickStainlessSteel'))
    .replace().register()

//fluid
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:281'))
    .matrix('TP ',
            'CR ')
    .key('T', item('minecraft:redstone_torch'))
    .key('P', metaitem('plateLapis'))
    .key('C', item('appliedenergistics2:material:23'))
    .key('R', metaitem('stickStainlessSteel'))
    .replace().register()

//Press removals 
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:14')) //Engi
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:13')) //Calc
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:19')) //Sili
mods.appliedenergistics2.inscriber.removeByOutput(item('appliedenergistics2:material:15')) //Logi

//Engi press
mods.gregtech.laser_engraver.recipeBuilder()
    .outputs(item('appliedenergistics2:material:14'))
    .inputs(metaitem('blockVanadiumSteel'))
    .notConsumable(ore('craftingLensRed'))
    .duration(1600)
    .EUt(120)
    .buildAndRegister()

//Calc press
mods.gregtech.laser_engraver.recipeBuilder()
    .outputs(item('appliedenergistics2:material:13'))
    .inputs(metaitem('blockVanadiumSteel'))
    .notConsumable(ore('craftingLensBlue'))
    .duration(1600)
    .EUt(120)
    .buildAndRegister()

//Sili press
mods.gregtech.laser_engraver.recipeBuilder()
    .outputs(item('appliedenergistics2:material:19'))
    .inputs(metaitem('blockVanadiumSteel'))
    .notConsumable(ore('craftingLensLightBlue'))
    .duration(1600)
    .EUt(120)
    .buildAndRegister()

//Logi press
mods.gregtech.laser_engraver.recipeBuilder()
    .outputs(item('appliedenergistics2:material:15'))
    .inputs(metaitem('blockVanadiumSteel'))
    .notConsumable(ore('craftingLensGreen'))
    .duration(1600)
    .EUt(120)
    .buildAndRegister()

//Name press
mods.gregtech.laser_engraver.recipeBuilder()
    .outputs(item('appliedenergistics2:material:21'))
    .inputs(metaitem('blockVanadiumSteel'))
    .notConsumable(ore('craftingLensWhite'))
    .duration(1600)
    .EUt(120)
    .buildAndRegister()

//Cable Anchor
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:part:120'))
    .input(metaitem('boltSteel'))
    //.replace()
    .register()

//Interface
crafting.remove('appliedenergistics2:network/blocks/interfaces_interface')
crafting.shapedBuilder()
    .output(item('appliedenergistics2:interface'))
    .matrix('PRP',
            'AMF',
            'PPP')
    .key('P', metaitem('plateAluminium'))
    .key('R', metaitem('robot.arm.mv'))
    .key('A', item('appliedenergistics2:material:44'))
    .key('M', metaitem('hull.mv'))
    .key('F', item('appliedenergistics2:material:43'))
    .register()

//Fluid Interface
crafting.remove('appliedenergistics2:network/blocks/fluid_interfaces_interface')
crafting.shapedBuilder()
    .output(item('appliedenergistics2:fluid_interface'))
    .matrix('PRP',
            'AMF',
            'PPP')
    .key('P', metaitem('plateLapis'))
    .key('R', metaitem('electric.pump.mv'))
    .key('A', item('appliedenergistics2:material:44'))
    .key('M', metaitem('hull.mv'))
    .key('F', item('appliedenergistics2:material:43'))
    .register()

//Energy Acceptor
crafting.shapedBuilder()
    .output(item('appliedenergistics2:energy_acceptor'))
    .matrix('PFP',
            'FHF',
            'PFP')
    .key('P', metaitem('nomilabs:plateElectricalSteel'))
    .key('F', item('moreplates:fluix_plate'))
    .key('H', metaitem('hull.lv'))
    .replace().register()

//Storage Housing
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:39'))
    .matrix('WPW',
            'P P',
            'WPW')
    .key('W', metaitem('wireFineRedAlloy'))
    .key('P', metaitem('nomilabs:plateElectricalSteel'))
    .replace().register()

//Illuminated Panel
crafting.remove('appliedenergistics2:network/parts/panels_semi_dark_monitor')
crafting.shapedBuilder()
    .output(item('appliedenergistics2:part:180'))
    .matrix('GGG',
            'PPP')
    .key('G', item('appliedenergistics2:quartz_glass'))
    .key('P', item('moreplates:fluix_plate'))
    .register()

//Charger
crafting.shapedBuilder()
    .output(item('appliedenergistics2:charger'))
    .matrix('DCD',
            'D  ',
            'DCD')
    .key('D', metaitem('nomilabs:plateDarkSteel'))
    .key('C', metaitem('plateCertusQuartz'))
    .replace().register()

//ME Chest
crafting.shapedBuilder()
    .output(item('appliedenergistics2:chest'))
    .matrix('GPG',
            'CSF',
            'DQD')
    .key('G', item('appliedenergistics2:quartz_glass'))
    .key('P', item('appliedenergistics2:part:180'))
    .key('C', item('appliedenergistics2:material:10'))
    .key('S', item('actuallyadditions:block_giant_chest'))
    .key('F', item('appliedenergistics2:material:12'))
    .key('D', ore('blockDarkSteel'))
    .key('Q', item('appliedenergistics2:material:11'))
    .replace().register()

//Pattern Terminal
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:part:340'))
    .input(item('appliedenergistics2:material:24'))
    .input(item('appliedenergistics2:part:380'))
    .input(item('appliedenergistics2:material:52'))
    .replace().register()

//ME Terminal
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:part:380'))
    .input(ore('itemIlluminatedPanel'))
    .input(ore('circuitLv'))
    .replace().register()

//Quantum Ring
crafting.shapedBuilder()
    .output(item('appliedenergistics2:quantum_ring'))
    .matrix('PCP',
            'EQE',
            'PCP')
    .key('P', metaitem('plateStainlessSteel'))
    .key('C', item('appliedenergistics2:material:23'))
    .key('E', item('appliedenergistics2:material:24'))
    .key('Q', metaitem('quantumstar'))
    .replace().register()

//Network Tool
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:network_tool'))
    .input(ore('itemIlluminatedPanel'))
    .input(item('actuallyadditions:item_laser_wrench'))
    .replace().register()

//Storage Cell Removals
crafting.remove('appliedenergistics2:network/cells/storage_cell_1k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_4k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_16k')
crafting.remove('appliedenergistics2:network/cells/storage_cell_64k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_1k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_4k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_16k')
crafting.remove('appliedenergistics2:network/cells/fluid_storage_cell_64k')

//Skystone
mods.gregtech.alloy_smelter.recipeBuilder()
    .outputs(item('appliedenergistics2:sky_stone_block'))
    .inputs(item('minecraft:stone'), item('minecraft:end_stone'))
    .duration(200).EUt(16).buildAndRegister()

//Skystone Dust
mods.gregtech.macerator.recipeBuilder()
    .outputs(item('appliedenergistics2:material:45'))
    .inputs(item('appliedenergistics2:sky_stone_block'))
    .duration(45).EUt(8).buildAndRegister()

//Certus Block
crafting.remove('appliedenergistics2:decorative/certus_quartz_block')
crafting.shapedBuilder()
    .output(item('appliedenergistics2:quartz_block'))
    .matrix('CC',
            'CC')
    .key('C', metaitem('gemCertusQuartz'))
    .register()

//Oredict Storage Bus
crafting.shapelessBuilder().name('nf_oredict_storage_bus')
    .output(item('appliedenergistics2:part:222'))
    .input(item('appliedenergistics2:part:220'))
    .input(metaitem('ore_dictionary_filter'))
    .replace().register()

//Extended Processing Pattern Terminal
crafting.shapedBuilder().name('nf_terminal_expanded_processing')
    .output(item('appliedenergistics2:part:341'))
    .matrix(' A ',
            ' B ',
            ' C ')
    .key('A', item('appliedenergistics2:part:340'))
    .key('B', ore('circuitEv'))
    .key('C', item('packagedauto:encoder'))
    .replace().register()

//Configuration Fluid Interface Terminal
crafting.shapelessBuilder()
    .name('nf_configuration_fluid_interface_terminal')
    .output(item('appliedenergistics2:part:522'))
    .input(item('appliedenergistics2:part:520'))
    .input(item('appliedenergistics2:material:24'))
    .input(item('appliedenergistics2:fluid_interface').or(item('appliedenergistics2:part:441')))
    .replace().register()

//GT Certus Quartz
crafting.remove('appliedenergistics2:misc/deconstruction_certus_quartz_pillar')
crafting.remove('appliedenergistics2:misc/deconstruction_certus_quartz_block')
crafting.remove('appliedenergistics2:misc/deconstruction_certus_chiseled_quartz')

crafting.shapelessBuilder()
    .output(metaitem('gemCertusQuartz') * 4)
    .input(item('appliedenergistics2:quartz_block').or(item('appliedenergistics2:quartz_pillar')).or(item('appliedenergistics2:chiseled_quartz_block')))
    .register()

//Conversion Recipes
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:material:59'))
    .input(item('ae2wtlib:infinity_booster_card'))
    .register()
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:wireless_crafting_terminal'))
    .input(item('wct:wct'))
    .register()
crafting.shapelessBuilder()
    .output(item('appliedenergistics2:material:60'))
    .input(item('wct:magnet_card'))
    .register()

//1k Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:35'))
    .matrix('GPG',
            'PCP',
            'GPG')
    .key('G', item('minecraft:glass'))
    .key('P', metaitem('plateRedAlloy'))
    .key('C', ore('circuitLv'))
    .replace().register()

//4k Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:36'))
    .matrix('ABA',
            'CDC',
            'ACA')
    .key('A', item('minecraft:glass'))
    .key('B', item('appliedenergistics2:material:22'))
    .key('C', item('appliedenergistics2:material:35'))
    .key('D', ore('circuitMv'))
    .replace().register()

//16k Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:37'))
    .matrix('ABA',
            'CDC',
            'ACA')
    .key('A', item('minecraft:glass'))
    .key('B', item('appliedenergistics2:material:24'))
    .key('C', item('appliedenergistics2:material:36'))
    .key('D', ore('circuitHv'))
    .replace().register()

//64k Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:38'))
    .matrix('ABA',
            'CDC',
            'ACA')
    .key('A', item('appliedenergistics2:material:22'))
    .key('B', item('appliedenergistics2:material:24'))
    .key('C', item('appliedenergistics2:material:37'))
    .key('D', ore('circuitEv'))
    .replace().register()

//1k Fluid Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:54'))
    .matrix('GPG',
            'PCP',
            'GPG')
    .key('G', item('minecraft:glass'))
    .key('P', metaitem('plateLapis'))
    .key('C', ore('circuitLv'))
    .replace().register()

//4k Fluid Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:55'))
    .matrix('ABA',
            'CDC',
            'ACA')
    .key('A', item('minecraft:glass'))
    .key('B', item('appliedenergistics2:material:22'))
    .key('C', item('appliedenergistics2:material:54'))
    .key('D', ore('circuitMv'))
    .replace().register()

//16k Fluid Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:56'))
    .matrix('ABA',
            'CDC',
            'ACA')
    .key('A', item('minecraft:glass'))
    .key('B', item('appliedenergistics2:material:24'))
    .key('C', item('appliedenergistics2:material:55'))
    .key('D', ore('circuitHv'))
    .replace().register()

//64k Fluid Storage
crafting.shapedBuilder()
    .output(item('appliedenergistics2:material:57'))
    .matrix('ABA',
            'CDC',
            'ACA')
    .key('A', item('appliedenergistics2:material:22'))
    .key('B', item('appliedenergistics2:material:24'))
    .key('C', item('appliedenergistics2:material:56'))
    .key('D', ore('circuitEv'))
    .replace().register()





// NAE2

//256k Storage
crafting.removeByOutput(item('nae2:material:1'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.lv'), ore('circuitIv'), item('appliedenergistics2:material:24'))
    .fluidInputs(fluid('soldering_alloy') * 144)
    .outputs(item('nae2:material:1'))
    .scannerResearch(b -> b.researchStack(item('appliedenergistics2:material:38')))
	.duration(200)
    .EUt(15360)
    .buildAndRegister()

//1024k Storage
crafting.removeByOutput(item('nae2:material:2'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.mv'), ore('circuitLuv'), item('nae2:material:1'))
    .fluidInputs(fluid('soldering_alloy') * 144)
	.outputs(item('nae2:material:2'))
    .scannerResearch(b -> b.researchStack(item('nae2:material:1')))
	.duration(200)
    .EUt(30720)
    .buildAndRegister()

//4096k Storage
crafting.removeByOutput(item('nae2:material:3'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.hv'), ore('circuitZpm'), item('nae2:material:2'))
    .fluidInputs(fluid('soldering_alloy') * 288)
	.outputs(item('nae2:material:3'))
    .stationResearch(b -> b.researchStack(metaitem('quantum_chest.iv')).CWUt(16))
	.duration(400)
    .EUt(61440)
    .buildAndRegister()

//16384k Storage
crafting.removeByOutput(item('nae2:material:4'))

mods.gregtech.assembly_line.recipeBuilder()
	.inputs(metaitem('field.generator.ev'), ore('circuitUv'), item('nae2:material:3'))
    .fluidInputs(fluid('soldering_alloy') * 576)
	.outputs(item('nae2:material:4'))
    .stationResearch(b -> b.researchStack(metaitem('quantum_chest.luv')).CWUt(32))
	.duration(600)
    .EUt(122880)
    .buildAndRegister()

//256k Fluid Storage
crafting.removeByOutput(item('nae2:material:5'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:5'))
    .inputs(metaitem('field.generator.lv'), ore('circuitIv'), item('appliedenergistics2:material:22'))
    .fluidInputs(fluid('soldering_alloy') * 144)
    .scannerResearch(b -> b.researchStack(item('appliedenergistics2:material:57')))
	.duration(200)
    .EUt(15360)
    .buildAndRegister()

//1024k Fluid Storage
crafting.removeByOutput(item('nae2:material:6'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:6'))
    .inputs(metaitem('field.generator.mv'), ore('circuitLuv'), item('nae2:material:5'))
    .fluidInputs(fluid('soldering_alloy') * 144)
    .scannerResearch(b -> b.researchStack(item('nae2:material:5')))
	.duration(200)
    .EUt(30720)
    .buildAndRegister()

//4096k Fluid Storage'
crafting.removeByOutput(item('nae2:material:7'))

mods.gregtech.assembly_line.recipeBuilder()
	.outputs(item('nae2:material:7'))
    .inputs(metaitem('field.generator.hv'), ore('circuitZpm'), item('nae2:material:6'))
    .fluidInputs(fluid('soldering_alloy') * 288)
    .stationResearch(b -> b.researchStack(metaitem('quantum_tank.iv')).CWUt(16))
	.duration(400)
    .EUt(61440)
    .buildAndRegister()

//16384k Fluid Storage
crafting.removeByOutput(item('nae2:material:8'))

mods.gregtech.assembly_line.recipeBuilder()
    .outputs(item('nae2:material:8'))
	.inputs(metaitem('field.generator.ev'), ore('circuitUv'), item('nae2:material:7'))
    .fluidInputs(fluid('soldering_alloy') * 576)
    .stationResearch(b -> b.researchStack(metaitem('quantum_tank.luv')).CWUt(32))
	.duration(600)
    .EUt(122880)
    .buildAndRegister()




//JEI
mods.jei.removeAndHide(item('appliedenergistics2:material:0'))