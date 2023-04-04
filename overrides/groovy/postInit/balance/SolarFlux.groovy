println("[SolarFlux.groovy] Start SolarFlux Changes")

// Hide stuff first
crafting.remove("solarflux:mirror")
crafting.remove("solarflux:photovoltaic_cell_1")
crafting.remove("solarflux:solar_panel_1")
crafting.remove("solarflux:solar_panel_2")
crafting.remove("solarflux:solar_panel_3")
crafting.remove("solarflux:solar_panel_4")
crafting.remove("solarflux:solar_panel_5")
crafting.remove("solarflux:solar_panel_6")
crafting.remove("solarflux:solar_panel_7")
crafting.remove("solarflux:solar_panel_8")
crafting.remove("solarflux:solar_panel_wyvern")
crafting.remove("solarflux:solar_panel_draconic")
crafting.remove("solarflux:photovoltaic_cell_6")
crafting.remove("solarflux:photovoltaic_cell_5")
crafting.remove("solarflux:photovoltaic_cell_4")
crafting.remove("solarflux:photovoltaic_cell_3")
crafting.remove("solarflux:photovoltaic_cell_2")
mods.jei.removeAndHide(item('solarflux:blank_upgrade'))
mods.jei.removeAndHide(item('solarflux:efficiency_upgrade'))
mods.jei.removeAndHide(item('solarflux:transfer_rate_upgrade'))
mods.jei.removeAndHide(item('solarflux:capacity_upgrade'))
mods.jei.removeAndHide(item('solarflux:block_charging_upgrade'))
mods.jei.removeAndHide(item('solarflux:traversal_upgrade'))
mods.jei.removeAndHide(item('solarflux:dispersive_upgrade'))
mods.jei.removeAndHide(item('solarflux:furnace_upgrade'))

// pre-optimizations, this might be useless but i am assuming we are doing "get from list" request every time item() runs
def solarMirror = item("solarflux:mirror")

// TODO some ore() are broke, old stuff is using metaitem before
// "Cell" 0
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_mirror')
    .output(solarMirror)
    .matrix('GGG',
            'PPP')
	// should this be paneglass?
    .key('G', item('minecraft:glass_pane'))
    .key('P', ore('plateSilver'))
    .register()

// Cell 1
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_photovoltaic_cell_1')
    .output(item("solarflux:photovoltaic_cell_1"))
    .matrix('LLL',
            'MMM',
			'FFF')
    .key('L', ore('plateLapis'))
    .key('M', solarMirror)
    .key('F', ore('plateFluix'))
    .register()

// Cell 2
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_photovoltaic_cell_2')
    .output(item("solarflux:photovoltaic_cell_2"))
    .matrix('PPP',
            'CCC',
			'BBB')
    .key('P', item('enderio:item_material:3')) // photovoltaic plates
    .key('C', item('solarflux:photovoltaic_cell_1'))
    .key('B', ore('plateBatteryAlloy'))
    .register()

// Cell 3
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_photovoltaic_cell_3')
    .output(item("solarflux:photovoltaic_cell_3"))
    .matrix('PPP',
            'CCC',
			'BBB')
    .key('P', ore('lensEnderPearl'))
    .key('C', item('solarflux:photovoltaic_cell_2'))
    .key('B', ore('plateAnnealedCopper'))
    .register()

// Cell 4
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_photovoltaic_cell_4')
    .output(item("solarflux:photovoltaic_cell_4"))
    .matrix('PPP',
            'CCC',
			'BBB')
    .key('P', ore('craftingLensLightBlue')) // TODO FIXME crafting lens (glass) not diamond
    .key('C', item('solarflux:photovoltaic_cell_3'))
    .key('B', ore('meshPulsating'))
    .register()

// Cell 5
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_photovoltaic_cell_5')
    .output(item("solarflux:photovoltaic_cell_5"))
    .matrix('SSS',
            'CCC',
			'SSS')
    .key('S', item('advsolars:sunnarium_plate'))
    .key('C', item('solarflux:photovoltaic_cell_4'))
    .register()

// Cell 6
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_photovoltaic_cell_6')
    .output(item("solarflux:photovoltaic_cell_6"))
    .matrix('SSS',
            'CCC',
			'SSS')
    .key('S', item('advsolars:sunnarium_enriched_plate'))
    .key('C', item('solarflux:photovoltaic_cell_5'))
    .register()

// Solar 1
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_1')
    .output(item('solarflux:solar_panel_1'))
    .matrix('MMM',
            'CCC',
			'SPS')
    .key('M', solarMirror)
    .key('C', ore('wireFineCopper'))
    .key('S', ore('slabStone')) // this was using some meta thing i swapped it to oredict
    .key('P', item('enderio:item_power_conduit'))
    .register()

// Solar 2
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_2')
    .output(item("solarflux:solar_panel_2"))
    .matrix('PPP',
            'TTT',
			'CWC')
    .key('P', item('solarflux:solar_panel_1'))
    .key('T', ore('cableGtSingleTin'))
    .key('C', ore('plateCupronickel'))
    .key('W', item('enderio:item_power_conduit:1'))
    .register()

// Solar 3
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_3')
    .output(item("solarflux:solar_panel_3"))
    .matrix('PCP',
            'EBE',
			'GWG')
    .key('P', item("solarflux:solar_panel_2"))
    .key('C', item("solarflux:photovoltaic_cell_1"))
    .key('E', ore("plateElectricalSteel"))
    .key('B', ore("blockConductiveIron"))
    .key('G', ore("gearElectricalSteel"))
    .key('W', item('enderio:item_power_conduit:2'))
    .register()

// Solar 4
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_4')
    .output(item("solarflux:solar_panel_4"))
    .matrix('SPS',
            'MEM',
			'MWM')
    .key('S', item("solarflux:solar_panel_3"))
    .key('P', item("solarflux:photovoltaic_cell_2"))
    .key('M', ore("ingotMicroversium"))
    .key('E', ore("blockEndSteel"))
    .key('W', item('enderio:item_endergy_conduit:1'))
    .register()

// Solar 5
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_5')
    .output(item("solarflux:solar_panel_5"))
    .matrix('SPS',
            'LNL',
			'LWL')
    .key('S', item("solarflux:solar_panel_4"))
    .key('P', item("solarflux:photovoltaic_cell_3"))
    .key('L', ore("plateLumium"))
    .key('N', item('advsolars:sunnarium'))
    .key('W', item('enderio:item_endergy_conduit:6'))
    .register()

// Solar 6
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_6')
    .output(item("solarflux:solar_panel_6"))
    .matrix('SPS',
            'LNL',
			'LWL')
    .key('S', item("solarflux:solar_panel_5"))
    .key('P', item("solarflux:photovoltaic_cell_4"))
    .key('L', ore("plateSignalum"))
    .key('N', item('advsolars:sunnarium_enriched'))
    .key('W', item('enderio:item_endergy_conduit:4'))
    .register()

// Solar 7
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_7')
    .output(item("solarflux:solar_panel_7"))
    .matrix('PPP',
            'SsS',
			'OWO')
    .key('P', item("solarflux:photovoltaic_cell_5"))
    .key('S', item("solarflux:solar_panel_6"))
    .key('s', ore("blockSignalum"))
    .key('O', ore("plateOsmium"))
    .key('W', item('enderio:item_endergy_conduit:4'))
    .register()

// Solar 8
crafting.shapedBuilder()
    .name('contenttweaker:solarflux_solar_panel_8')
    .output(item("solarflux:solar_panel_8"))
    .matrix('PPP',
            'SES',
			'OWO')
    .key('P', item("solarflux:photovoltaic_cell_6"))
    .key('S', item("solarflux:solar_panel_7"))
    .key('E', ore("blockEnderium"))
    .key('O', ore("plateOsmiridium"))
    .key('W', item('enderio:item_endergy_conduit'))
    .register()

// Sunnarium
mods.gregtech.alloy_smelter.recipeBuilder()
	.inputs(item('contenttweaker:stabilizedplutonium'), item('contenttweaker:stabilizedcurium'))
	.outputs(item('advsolars:sunnarium'))
	.duration(2000)
	.EUt(4000)
	.buildAndRegister()

// Conversion recipes from RF Solars to GT Solars
crafting.remove("gregtech:solar_panel_basic");
crafting.remove("gregtech:solar_panel_ulv");
crafting.remove("gregtech:solar_panel_lv");

// crafting.shapelessBuilder()
// 	.name("contenttweaker:solar_panel_basic")
// 	.output(item('metaitem:cover.solar.panel') * 2)
// 	.input(item('solarflux:solar_panel_2'))
// 	.register()

// TODO metaitem resolver
// recipes.addShapeless(<metaitem:cover.solar.panel> * 2, [<solarflux:solar_panel_2>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.ulv>, [<solarflux:solar_panel_3>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.lv>, [<solarflux:solar_panel_4>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.mv>, [<solarflux:solar_panel_5>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.hv>, [<solarflux:solar_panel_6>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.ev>, [<solarflux:solar_panel_7>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.iv>, [<solarflux:solar_panel_8>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.iv> * 2, [<solarflux:solar_panel_wyvern>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.luv> * 2, [<solarflux:solar_panel_draconic>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.zpm>, [<solarflux:solar_panel_chaotic>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.uv> * 4, [<solarflux:solar_panel_neutronium>]);
// recipes.addShapeless(<metaitem:cover.solar.panel.uv> * 8, [<solarflux:solar_panel_infinity>]);

println("[SolarFlux.groovy] End SolarFlux Changes")
