import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;

//////////////////////////////////////////////////////////////
/////////////	    Solar Panels  	    //////////////////
//////////////////////////////////////////////////////////////	
	
//Mirror
recipes.remove(<solarflux:mirror>);
recipes.addShaped(<solarflux:mirror>,[
	[<minecraft:glass_pane>, <minecraft:glass_pane>, <minecraft:glass_pane>],
	[<metaitem:plateSilver>,<metaitem:plateSilver>,<metaitem:plateSilver>],
	[null,null,null]]);

// Solar 1
recipes.remove(<solarflux:solar_panel_1>);
recipes.addShaped(<solarflux:solar_panel_1>,[
	[<solarflux:mirror>, <solarflux:mirror>, <solarflux:mirror>],
	[<metaitem:wireFineCopper>,<metaitem:wireFineCopper>,<metaitem:wireFineCopper>],
	[<minecraft:stone_slab>, <enderio:item_power_conduit>, <minecraft:stone_slab>]]);
	
//Solar 2	

recipes.remove(<solarflux:solar_panel_2>);
recipes.addShaped(<solarflux:solar_panel_2>,[
	[<solarflux:solar_panel_1>, <solarflux:photovoltaic_cell_1>, <solarflux:solar_panel_1>],
	[<metaitem:cableGtSingleTin>, <minecraft:redstone_block>, <metaitem:cableGtSingleTin>],
	[<metaitem:plateCupronickel>,<enderio:item_power_conduit:1>,<metaitem:plateCupronickel>]]);
	
//Cell 1	
recipes.remove(<solarflux:photovoltaic_cell_1>);
recipes.addShaped(<solarflux:photovoltaic_cell_1> * 6,[
	[<metaitem:plateLapis>,<metaitem:plateLapis>,<metaitem:plateLapis>],		
	[<solarflux:mirror>,<solarflux:mirror>,<solarflux:mirror>],
	[<ore:plateFluix>,<ore:plateFluix>,<ore:plateFluix>]]);		
	
//Solar 3	
recipes.remove(<solarflux:solar_panel_3>);
recipes.addShaped(<solarflux:solar_panel_3>,[
	[<solarflux:solar_panel_2>, <solarflux:photovoltaic_cell_1>, <solarflux:solar_panel_2>],	
	[<metaitem:plateElectricalSteel>, <metaitem:blockConductiveIron>, <metaitem:plateElectricalSteel>],	
	[<metaitem:gearElectricalSteel>, <enderio:item_power_conduit:2>, <metaitem:gearElectricalSteel>]]);	

recipes.remove(<solarflux:solar_panel_4>);
recipes.remove(<solarflux:solar_panel_5>);
recipes.remove(<solarflux:solar_panel_6>);
recipes.remove(<solarflux:solar_panel_7>);
recipes.remove(<solarflux:solar_panel_8>);
recipes.remove(<solarflux:solar_panel_wyvern>);
recipes.remove(<solarflux:solar_panel_draconic>);
recipes.remove(<solarflux:photovoltaic_cell_6>);
recipes.remove(<solarflux:photovoltaic_cell_5>);
recipes.remove(<solarflux:photovoltaic_cell_4>);
recipes.remove(<solarflux:photovoltaic_cell_3>);
recipes.remove(<solarflux:photovoltaic_cell_2>);
mods.jei.JEI.removeAndHide(<solarflux:blank_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:efficiency_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:transfer_rate_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:capacity_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:block_charging_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:traversal_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:dispersive_upgrade>);
mods.jei.JEI.removeAndHide(<solarflux:furnace_upgrade>);

	
recipes.addShaped(<solarflux:solar_panel_8> * 4, [
	[<solarflux:photovoltaic_cell_6>,<solarflux:photovoltaic_cell_6>,<solarflux:photovoltaic_cell_6>],
	[<solarflux:solar_panel_7>,<ore:blockEnderium>,<solarflux:solar_panel_7>],
	[<metaitem:plateOsmiridium>,<enderio:item_endergy_conduit>,<metaitem:plateOsmiridium>]]);

recipes.addShaped(<solarflux:photovoltaic_cell_6> * 6, [
	[<advsolars:sunnarium_enriched_plate>,<advsolars:sunnarium_enriched_plate>,<advsolars:sunnarium_enriched_plate>],
	[<solarflux:photovoltaic_cell_5>,<solarflux:photovoltaic_cell_5>,<solarflux:photovoltaic_cell_5>],
	[<advsolars:sunnarium_enriched_plate>,<advsolars:sunnarium_enriched_plate>,<advsolars:sunnarium_enriched_plate>]]);	
	
recipes.addShaped(<solarflux:solar_panel_7> * 4, [
	[<solarflux:photovoltaic_cell_5>,<solarflux:photovoltaic_cell_5>,<solarflux:photovoltaic_cell_5>],
	[<solarflux:solar_panel_6>,<ore:blockSignalum>,<solarflux:solar_panel_6>],
	[<metaitem:plateOsmium>,<enderio:item_endergy_conduit:4>,<metaitem:plateOsmium>]]);

recipes.addShaped(<solarflux:photovoltaic_cell_5> * 6, [
	[<advsolars:sunnarium_plate>,<advsolars:sunnarium_plate>,<advsolars:sunnarium_plate>],
	[<solarflux:photovoltaic_cell_4>,<solarflux:photovoltaic_cell_4>,<solarflux:photovoltaic_cell_4>],
	[<advsolars:sunnarium_plate>,<advsolars:sunnarium_plate>,<advsolars:sunnarium_plate>]]);

recipes.addShaped(<solarflux:photovoltaic_cell_4> * 6, [
[<ore:craftingLensLightBlue>,<ore:craftingLensLightBlue>,<ore:craftingLensLightBlue>],
[<solarflux:photovoltaic_cell_3>,<solarflux:photovoltaic_cell_3>,<solarflux:photovoltaic_cell_3>],
[<ore:meshPulsating>,<ore:meshPulsating>,<ore:meshPulsating>]]);

recipes.addShaped(<solarflux:photovoltaic_cell_3> * 6, [
[<metaitem:lensEnderPearl>,<metaitem:lensEnderPearl>,<metaitem:lensEnderPearl>],
[<solarflux:photovoltaic_cell_2>,<solarflux:photovoltaic_cell_2>,<solarflux:photovoltaic_cell_2>],
[<metaitem:plateAnnealedCopper>,<metaitem:plateAnnealedCopper>,<metaitem:plateAnnealedCopper>]]);

recipes.addShaped(<solarflux:photovoltaic_cell_2> * 6, [
[<enderio:item_material:3>,<enderio:item_material:3>,<enderio:item_material:3>],
[<solarflux:photovoltaic_cell_1>,<solarflux:photovoltaic_cell_1>,<solarflux:photovoltaic_cell_1>],
[<metaitem:plateBatteryAlloy>,<metaitem:plateBatteryAlloy>,<metaitem:plateBatteryAlloy>]]);

recipes.addShaped(<solarflux:solar_panel_6> * 4, [
	[<solarflux:solar_panel_5>, <solarflux:photovoltaic_cell_4>, <solarflux:solar_panel_5>],	
	[<metaitem:plateSignalum>, <advsolars:sunnarium_enriched>, <metaitem:plateSignalum>],	
	[<metaitem:plateSignalum>,<enderio:item_endergy_conduit:4>,<metaitem:plateSignalum>]]);	

recipes.addShaped(<solarflux:solar_panel_5> * 4, [
	[<solarflux:solar_panel_4>, <solarflux:photovoltaic_cell_3>, <solarflux:solar_panel_4>],	
	[<metaitem:plateLumium>, <advsolars:sunnarium>, <metaitem:plateLumium>],	
	[<metaitem:plateLumium>,<enderio:item_endergy_conduit:6>,<metaitem:plateLumium>]]);	

recipes.addShaped(<solarflux:solar_panel_4> * 2, [
	[<solarflux:solar_panel_3>, <solarflux:photovoltaic_cell_2>, <solarflux:solar_panel_3>],	
	[<ore:ingotMicroversium>, <metaitem:blockEndSteel>, <ore:ingotMicroversium>],	
	[<ore:ingotMicroversium>,<enderio:item_endergy_conduit:1>,<ore:ingotMicroversium>]]);	

// Sunnarium
alloy_smelter.recipeBuilder()
	.inputs(<contenttweaker:stabilizedplutonium>, <contenttweaker:stabilizedcurium>)
	.outputs(<advsolars:sunnarium>)
	.duration(2000)
	.EUt(4000)
	.buildAndRegister();

// Conversion recipes from RF Solars to GT Solars
recipes.removeByRecipeName("gregtech:solar_panel_basic");
recipes.removeByRecipeName("gregtech:solar_panel_ulv");
recipes.removeByRecipeName("gregtech:solar_panel_lv");

recipes.addShapeless(<metaitem:cover.solar.panel> * 2, [<solarflux:solar_panel_2>]);
recipes.addShapeless(<metaitem:cover.solar.panel.ulv>, [<solarflux:solar_panel_3>]);
recipes.addShapeless(<metaitem:cover.solar.panel.lv>, [<solarflux:solar_panel_4>]);
recipes.addShapeless(<metaitem:cover.solar.panel.mv>, [<solarflux:solar_panel_5>]);
recipes.addShapeless(<metaitem:cover.solar.panel.hv>, [<solarflux:solar_panel_6>]);
recipes.addShapeless(<metaitem:cover.solar.panel.ev>, [<solarflux:solar_panel_7>]);
recipes.addShapeless(<metaitem:cover.solar.panel.iv>, [<solarflux:solar_panel_8>]);
recipes.addShapeless(<metaitem:cover.solar.panel.iv> * 2, [<solarflux:solar_panel_wyvern>]);
recipes.addShapeless(<metaitem:cover.solar.panel.luv> * 2, [<solarflux:solar_panel_draconic>]);
recipes.addShapeless(<metaitem:cover.solar.panel.zpm>, [<solarflux:solar_panel_chaotic>]);
recipes.addShapeless(<metaitem:cover.solar.panel.uv> * 4, [<solarflux:solar_panel_neutronium>]);
recipes.addShapeless(<metaitem:cover.solar.panel.uv> * 8, [<solarflux:solar_panel_infinity>]);