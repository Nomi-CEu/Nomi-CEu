#priority 998
import mods.gregtech.recipe.RecipeMap;

import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

print("-------------- Ore Dictionary Start --------------");

//Ender IO was being annoying
<ore:ingotRedstoneAlloy>.add(<metaitem:ingotRedAlloy>);
<ore:nuggetRedstoneAlloy>.add(<metaitem:nuggetRedAlloy>);
<ore:blockRedstoneAlloy>.add(<metaitem:blockRedAlloy>);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//			         																														 //
//			This script file was originally written by the FTB Interactions team and has been adapted for use here with permission!          //
//			         																														 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////
//			Blocks          //
//////////////////////////////

var blocksDisabled as IItemStack[][IOreDictEntry] = {

	#blockAluminum
	<ore:blockAluminum>: [
		<thermalfoundation:storage:4>,
		<libvulpes:metal0:9>,
		<nuclearcraft:ingot_block:12>
	],

	#blockApatite
	<ore:blockApatite>: [
//		<forestry:resource_storage>
	],

	#blockDraconiumAwakened
	<ore:blockDraconiumAwakened>: [
		<draconicevolution:draconic_block>
	],

	#blockBeryllium
	<ore:blockBeryllium> : [
		<nuclearcraft:ingot_block:9>
	],

	#blockBronze
	<ore:blockBronze> : [
		<thermalfoundation:storage_alloy:3>
	],

	#blockCobalt
	<ore:blockCobalt> : [
	],

	#blockCopper
	<ore:blockCopper> : [
		<thermalfoundation:storage>,
		<libvulpes:metal0:4>
	],

	#blockCharcoal
	<ore:blockCharcoal> : [
		<actuallyadditions:block_misc:5>
	],

	#blockConductiveIron
	<ore:blockConductiveIron> : [
		<enderio:block_alloy:4>
	],

	#blockCrystalMatrix
	<ore:blockCrystalMatrix> : [
		<avaritia:block_resource:2>
	],

	#blockDarkSteel
	<ore:blockDarkSteel> : [
		<enderio:block_alloy:6>
	],
  
	#blockDraconium
	<ore:blockDraconium> : [
		<draconicevolution:draconium_block>
	],

	#blockElectrum
	<ore:blockElectrum> : [
		<thermalfoundation:storage_alloy:1>
	],

	#blockElectrumFlux
	<ore:blockElectrumFlux> : [
		<redstonearsenal:storage>
	],

	#blockElectricalSteel
	<ore:blockElectricalSteel> : [
		<enderio:block_alloy>
	],

	#blockEndSteel
	<ore:blockEndSteel> : [
		<enderio:block_alloy:8>
	],

	#blockEnderium
	<ore:blockEnderium> : [
		<thermalfoundation:storage_alloy:7>
	],

	#blockEnergeticAlloy
	<ore:blockEnergeticAlloy> : [
		<enderio:block_alloy:1>
	],

	#blockGraphite
	<ore:blockGraphite> : [
		<nuclearcraft:ingot_block:8>
	],

	#blockInfinity
	<ore:blockInfinity> : [
//		<avaritia:block_resource:1>
	],

	#blockInvar
	<ore:blockInvar> : [
		<thermalfoundation:storage_alloy:2>
	],

	#blockIridium
	<ore:blockIridium> : [
		<thermalfoundation:storage:7>,
		<libvulpes:metal0:10>
	],

	#blockLead
	<ore:blockLead> : [
		<thermalfoundation:storage:3>
	],

	#blockLumium
	<ore:blockLumium> : [
		<thermalfoundation:storage_alloy:6>
	],

	#blockManganese
	<ore:blockManganese> : [
		<nuclearcraft:ingot_block:11>
	],


	#blockNickel
	<ore:blockNickel> : [
		<thermalfoundation:storage:5>
	],

	#blockNeutronium
	<ore:blockNeutronium> : [
		<avaritia:block_resource>
	],

	#blockNetherstar
	<ore:blockNetherstar> : [
		<extendedcrafting:storage:2>
	],

	#blockPlatinum
	<ore:blockPlatinum> : [
		<thermalfoundation:storage:6>
	],

	#blockSignalum
	<ore:blockSignalum> : [
		<thermalfoundation:storage_alloy:5>
	],

	#blockSilver
	<ore:blockSilver> : [
		<thermalfoundation:storage:2>,
		<nuclearcraft:ingot_block:13>
	],

	#blockSteel
	<ore:blockSteel> : [
		<thermalfoundation:storage_alloy>,
		<libvulpes:metal0:6>
	],

	#blockPlutonium
	<ore:blockPlutonium> : [
		<metaitem:blockPlutonium>
	],

	#blockPulsatingIron
	<ore:blockPulsatingIron> : [
		<enderio:block_alloy:5>
	],

	#blockTin
	<ore:blockTin> : [
		<thermalfoundation:storage:1>,
		<libvulpes:metal0:5>
	],
	#blockUranium
	<ore:blockTin> : [
		<thermalfoundation:storage:1>,
		<libvulpes:metal0:5>
	],

	#blockVibrantAlloy
	<ore:blockVibrantAlloy> : [
		<enderio:block_alloy:2>
	],

	#blockTitanium
	<ore:blockTitanium> : [
		<libvulpes:metal0:7>
	],
	#blockFuelCoke
	<ore:blockFuelCoke> : [
		<thermalfoundation:storage_resource:1>
	],
	#blockSoularium
	<ore:blockSoularium> : [
		<enderio:block_alloy:7>
	]
};

for oreDictEntry, items in blocksDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

mods.jei.JEI.removeAndHide(<enderio:block_alloy_endergy:5>);

<ore:blockWarpCoreRim>.add(<gregtech:meta_block_compressed_7:1>);

<ore:fusedGlass>.add(<gregtech:transparent_casing:0>);

	#crop flax
<ore:cropFlax>.remove(<minecraft:string>);

	#skystone
<ore:blockSkystone>.add(<appliedenergistics2:sky_stone_block>);



//////////////////////////////
//			Dusts           //
//////////////////////////////

var dustsDisabled as IItemStack[][IOreDictEntry] = {

	#dustAluminium
	<ore:dustAluminium> : [
		<thermalfoundation:material:68>,
		<nuclearcraft:dust:12>
	],

	#dustAluminum
	<ore:dustAluminum>: [
		<libvulpes:productdust:9>,
		<thermalfoundation:material:68>
	],

	#dustBeryllium
	<ore:dustBeryllium> : [
		<nuclearcraft:dust:9>
	],

	#dustBronze
	<ore:dustBronze> : [
		<thermalfoundation:material:99>
	],

	#dustCertusQuartz
	<ore:dustCertusQuartz> : [
		<appliedenergistics2:material:2>
	],
	#dustCharcoal
	<ore:dustCharcoal> : [
		<thermalfoundation:material:769>
	],

	#dustCoal
	<ore:dustCoal> : [
		<enderio:item_material:23>,
		<actuallyadditions:item_dust:6>,
		<thermalfoundation:material:768>,
		<nuclearcraft:gem_dust:7>
	],

	#dustCobalt
	<ore:dustCobalt> : [
		<enderio:item_material:31>
	],

	#dustConstantan
	<ore:dustConstantan> : [
		<thermalfoundation:material:100>
	],

	#dustCopper
	<ore:dustCopper>: [
		<enderio:item_material:26>,
		<libvulpes:productdust:4>,
		<thermalfoundation:material:64>
	],

	#dustDiamond
	<ore:dustDiamond> : [
		<actuallyadditions:item_dust:2>,
		<nuclearcraft:gem_dust>
	],

	#dustDraconium
	<ore:dustDraconium> : [
		<draconicevolution:draconium_dust>
	],	

	#dustElectrum
	<ore:dustElectrum> : [
		<thermalfoundation:material:97>
	],

	#dustElectrumFlux
	<ore:dustElectrumFlux> : [
		<redstonearsenal:material>
	],

	#dustEnderium
	<ore:dustEnderium> : [
		<thermalfoundation:material:103>
	],

	#dustEnderPearl
	<ore:dustEnderPearl> : [
		<appliedenergistics2:material:46>,
		<appliedenergistics2:material:46>
	],

	#dustEmerald
	<ore:dustEmerald> : [
		<actuallyadditions:item_dust:3>
	],

	#dustFluix
	<ore:dustFluix> : [
//		<appliedenergistics2:material:8>
	],

	#dustGraphite
	<ore:dustGraphite> : [
		<nuclearcraft:dust:8>
	],

	#dustGold
	<ore:dustGold> : [
		<actuallyadditions:item_dust:1>,
		<appliedenergistics2:material:51>,
		<enderio:item_material:25>,
		<libvulpes:productdust:2>,
		<thermalfoundation:material:1>,
	],

	#dustIron
	<ore:dustIron>: [
		<libvulpes:productdust:1>,
		<enderio:item_material:24>,
		<actuallyadditions:item_dust>,
		<appliedenergistics2:material:49>,
		<thermalfoundation:material>
	],

	#dustLapis
	<ore:dustLapis> : [
		<actuallyadditions:item_dust:4>,
		<enderio:item_material:32>
	],

	#dustLead
	<ore:dustLead>: [
		<thermalfoundation:material:67>
	],

	#dustLumium
	<ore:dustLumium> : [
		<thermalfoundation:material:102>
	],

	#dustInvar
	<ore:dustInvar> : [
		<thermalfoundation:material:98>
	],

	#dustIridium
	<ore:dustIridium> : [
		<libvulpes:productdust:10>,
		<thermalfoundation:material:71>
	],

	#dustManganese
	<ore:dustManganese> : [
		<nuclearcraft:dust:11>
	],

	#dustNetherQuartz
	<ore:dustNetherQuartz> : [
		<enderio:item_material:33>,
		<actuallyadditions:item_dust:5>,
		<appliedenergistics2:material:3>,
		<nuclearcraft:gem_dust:2>
	],

	#dustNickel
	<ore:dustNickel> : [
		<thermalfoundation:material:69>
	],

	#dustObsidian
	<ore:dustObsidian> : [
		<enderio:item_material:29>,
		<thermalfoundation:material:770>,
		<nuclearcraft:gem_dust:3>
	],

	#dustPlatinum
	<ore:dustPlatinum> : [
		<thermalfoundation:material:70>
	],

	#dustQuartz
	<ore:dustQuartz> : [
		<appliedenergistics2:material:3>,
		<actuallyadditions:item_dust:5>
	],

	#dustPlutonium
	<ore:dustPlutonium> : [
//		<metaitem:dustPlutonium>
	],

	#dustSaltpeter
	<ore:dustSaltpeter> : [
		<thermalfoundation:material:772>
	],

	#dustSignalum 
	<ore:dustSignalum> : [
		<thermalfoundation:material:101>
	],

	#dustSilver
	<ore:dustSilver>: [
		<thermalfoundation:material:66>,
		<nuclearcraft:dust:13>
	],

	#dustSilicon
	<ore:dustSilicon>: [
		<libvulpes:productdust:3>
	],
	
	#dustSodiumHydroxide
	<ore:dustSodiumHydroxide>: [
		<nuclearcraft:compound:5>
	],

	#dustSteel
	<ore:dustSteel> : [
		<libvulpes:productdust:6>,
		<thermalfoundation:material:96>
	],

	#dustSulfur
	<ore:dustSulfur>: [
		<thermalfoundation:material:771>,
		<nuclearcraft:gem_dust:6>
	],

	#dustTin
	<ore:dustTin>: [
		<enderio:item_material:27>,
		<libvulpes:productdust:5>,
		<thermalfoundation:material:65>
	],

	#dustTitanium
	<ore:dustTitanium> : [
		<libvulpes:productdust:7>
	],

	#dustWood
	<ore:dustWood>: [
		<thermalfoundation:material:800>
	],

	#itemSawdust
	<ore:itemSawdust>: [
		<thermalfoundation:material:800>
	],

	#dustEndstone
	<ore:dustEndstone>: [
		<nuclearcraft:gem_dust:11>
	],

	#dustSoularium
	<ore:dustSoularium>: [
		<enderio:item_material:74>
	]
};

for oreDictEntry, items in dustsDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

<ore:dustArdite>.add(<enderio:item_material:30>);
<ore:dustMoon>.add(<nomilabs:moondust>);

//////////////////////////////
//			Gems            //
//////////////////////////////
var gemsDisabled as IItemStack[][IOreDictEntry] = {
	<ore:gemSapphire> : [
	]
};


for oreDictEntry, items in gemsDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

//////////////////////////////
//			Ingots          //
//////////////////////////////

var ingotsDisabled as IItemStack[][IOreDictEntry] = {

	#ingotAluminium
	<ore:ingotAluminium> : [
		<thermalfoundation:material:132>,
		<nuclearcraft:ingot:12>
	],

	#ingotAluminum
	<ore:ingotAluminum>: [
		<libvulpes:productingot:9>,
		<thermalfoundation:material:132>
	],

	#ingotDraconiumAwakened
	<ore:ingotDraconiumAwakened>: [
		<draconicevolution:draconic_ingot>
	],

	#ingotBeryllium
	<ore:ingotBeryllium> : [
		<nuclearcraft:ingot:9>
	],

	#ingotBronze
	<ore:ingotBronze> : [
		<thermalfoundation:material:163>,
//		<forestry:ingot_bronze>,
		<nuclearcraft:alloy>
	],

	#ingotCobalt
	<ore:ingotCobalt> : [
	],

	#ingotConductiveIron
	<ore:ingotConductiveIron> : [
		<enderio:item_alloy_ingot:4>
	],

	#ingotCopper
	<ore:ingotCopper> : [
		<libvulpes:productingot:4>,
		<thermalfoundation:material:128>,
		<projectred-core:resource_item:100>
//		<forestry:ingot_copper>
	],

	#ingotCrystalMatrix
	<ore:ingotCrystalMatrix> : [
		<avaritia:resource:1>
	],

	#ingotDarkSteel
	<ore:ingotDarkSteel> : [
		<enderio:item_alloy_ingot:6>
	],

	#ingotDraconium
	<ore:ingotDraconium> : [
		<draconicevolution:draconium_ingot>
	],

	#ingotElectricalSteel
	<ore:ingotElectricalSteel> : [
		<enderio:item_alloy_ingot>
	],

	#ingotElectrum
	<ore:ingotElectrum> : [
		<thermalfoundation:material:161>
	],

	#ingotElectrumFlux
	<ore:ingotElectrumFlux> : [
		<redstonearsenal:material:32>
	],

	#ingotEnderium
	<ore:ingotEnderium> : [
		<thermalfoundation:material:167>
	],

	#ingotEndSteel
	<ore:ingotEndSteel> : [
		<enderio:item_alloy_ingot:8>
	],

	#ingotEnergeticAlloy
	<ore:ingotEnergeticAlloy> : [
		<enderio:item_alloy_ingot:1>
	],

	#ingotGraphite
	<ore:ingotGraphite> : [
		<nuclearcraft:ingot:8>
	],

	#ingotLead
	<ore:ingotLead> : [
		<thermalfoundation:material:131>
	],

	#ingotLumium
	<ore:ingotLumium> : [
		<thermalfoundation:material:166>
	],

	#ingotOsmiridium
	<ore:ingotOsmiridium> : [
	],

	#ingotIridium
	<ore:ingotIridium> : [
		<libvulpes:productingot:10>,
		<thermalfoundation:material:135>
	],

	#ingotInfinity
	<ore:ingotInfinity> : [
//		<avaritia:resource:6>
	],

	#ingotInvar
	<ore:ingotInvar> : [
		<thermalfoundation:material:162>
	],

	#ingotManganese
	<ore:ingotManganese> : [
		<nuclearcraft:ingot:11>
	],

	#ingotNeutronium
	<ore:ingotNeutronium> : [
		<avaritia:resource:4>
	],

	#ingotNickel
	<ore:ingotNickel> : [
		<thermalfoundation:material:133>
	],

	#ingotPlatinum
	<ore:ingotPlatinum> : [
		<thermalfoundation:material:134>
	],

	#ingotPlutonium
	<ore:ingotPlutonium> : [
//		<metaitem:ingotPlutonium>
	],

	#ingotPulsatingIron
	<ore:ingotPulsatingIron> : [
		<enderio:item_alloy_ingot:5>
	],

	#ingotRedstoneAlloy
	<ore:ingotRedstoneAlloy> : [
		<enderio:item_alloy_ingot:3>,
		<projectred-core:resource_item:103>
	],

	#ingotSignalum
	<ore:ingotSignalum> : [
		<thermalfoundation:material:165>
	],

	#ingotSoularium
	<ore:ingotSoularium> : [
		<enderio:item_alloy_ingot:7>
	],

	#ingotTin
	<ore:ingotTin> : [
		<libvulpes:productingot:5>,
		<thermalfoundation:material:129>,
		<projectred-core:resource_item:101>
//		<forestry:ingot_tin>
	],

	#ingotTitanium
	<ore:ingotTitanium> : [
		<libvulpes:productingot:7>
	],

	#ingotThorium
	<ore:ingotThorium> : [
		<nuclearcraft:ingot:3>
	],

	#ingotSilver
	<ore:ingotSilver> : [
		<thermalfoundation:material:130>,
		<nuclearcraft:ingot:13>,
		<projectred-core:resource_item:102>
	],

	#ingotSilicon
	<ore:ingotSilicon>: [
		<libvulpes:productingot:3>
	],

	#ingotSignalum
	<ore:ingotSignalum>: [
		<thermalfoundation:material:165>
	],

	#ingotSteel
	<ore:ingotSteel> : [
		<libvulpes:productingot:6>,
		<thermalfoundation:material:160>,
		<nuclearcraft:alloy:5>
	],

	#ingotVibrantAlloy
	<ore:ingotVibrantAlloy> : [
		<enderio:item_alloy_ingot:2>
	],
};

for oreDictEntry, items in ingotsDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

mods.jei.JEI.removeAndHide(<enderio:item_alloy_endergy_ingot:5>);

////////////////////////
//	     Sticks       //
////////////////////////
var sticksDisabled as IItemStack[][IOreDictEntry] = {

	#stickIron
	<ore:stickIron> : [
		<libvulpes:productrod:1>
	],

	#stickCopper
	<ore:stickCopper> : [
		<libvulpes:productrod:4>
	],

	#stickPlutonium
	<ore:stickPlutonium> : [
//		<metaitem:stickPlutonium>
	],

	#stickSteel
	<ore:stickSteel> : [
		<libvulpes:productrod:6>
	],

	#stickTitanium
	<ore:stickTitanium> : [
		<libvulpes:productrod:7>
	],

	#stickIridium
	<ore:stickIridium> : [
		<libvulpes:productrod:10>
	]
};

for oreDictEntry, items in sticksDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}


////////////////////////////
//	     Nuggets          //
////////////////////////////


var nuggetsDisabled as IItemStack[][IOreDictEntry] = {
	<ore:nuggetAluminium> :[
		<thermalfoundation:material:196>,
		<libvulpes:productnugget:9>,

	],

	<ore:nuggetAluminum> : [
		<thermalfoundation:material:196>,
		<libvulpes:productnugget:9>
	],

	<ore:nuggetBronze> : [
		<thermalfoundation:material:227>
	],

	<ore:nuggetCopper> : [
		<thermalfoundation:material:192>,
		<libvulpes:productnugget:4>
	],

	<ore:nuggetDraconium> : [
		<draconicevolution:nugget>
	],

	<ore:nuggetDraconiumAwakened> : [
		<draconicevolution:nugget:1>
	],

	<ore:nuggetElectrum> : [
		<thermalfoundation:material:225>
	],

	<ore:nuggetElectrumFlux> : [
		<redstonearsenal:material:64>
	],

	<ore:nuggetEnderium> : [
		<thermalfoundation:material:231>
	],

	<ore:nuggetInvar> : [
		<thermalfoundation:material:226>,
	],

	<ore:nuggetIridium> : [
		<thermalfoundation:material:199>,
		<libvulpes:productnugget:10>
	],

	<ore:nuggetLumium> : [
		<thermalfoundation:material:230>
	],

	#nuggetPlutonium
	<ore:nuggetPlutonium> : [
//		<metaitem:nuggetPlutonium>
	],

	<ore:nuggetSignalum> : [
		<thermalfoundation:material:229>
	],

	<ore:nuggetTin> : [
		<libvulpes:productnugget:5>
	],

	<ore:nuggetTitanium> : [
		<libvulpes:productnugget:7>
	],

	<ore:nuggetNeutronium> : [
		<avaritia:resource:3>,
	],

	<ore:nuggetNickel> : [
		<thermalfoundation:material:197>,
	],

	<ore:nuggetPlatinum> : [
		<thermalfoundation:material:198>
	],

	<ore:nuggetSteel> : [
		<thermalfoundation:material:224>,
		<libvulpes:productnugget:9>,
		<libvulpes:productnugget:6>
	],

	<ore:nuggetEnergeticAlloy> : [
		<enderio:item_alloy_nugget:1>
	],

	<ore:nuggetConductiveIron> : [
		<enderio:item_alloy_nugget:4>
	],

	<ore:nuggetEndSteel> : [
		<enderio:item_alloy_nugget:8>
	],

	<ore:nuggetSoularium> : [
		<enderio:item_alloy_nugget:7>
	]
};

for oreDictEntry, items in nuggetsDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

/* Just Remove These Nuggets, so conversion is still possible (the ingots are achievable via dungeon) */
# Electrical Steel
mods.jei.JEI.hide(<enderio:item_alloy_nugget>);

# Vibrant Alloy
mods.jei.JEI.hide(<enderio:item_alloy_nugget:2>);

# Pulsating Iron
mods.jei.JEI.hide(<enderio:item_alloy_nugget:5>);

# Dark Steel
mods.jei.JEI.hide(<enderio:item_alloy_nugget:6>);

// Leave Stellar Nugget, we use EIO's default Stellar Ingot

/* END */

# Energetic Silver
mods.jei.JEI.removeAndHide(<enderio:item_alloy_endergy_nugget:5>);

////////////////////////////
//			Ores          //
////////////////////////////

var oresDisabled as IItemStack[][IOreDictEntry] = {

	#oreAluminium
	<ore:oreAluminium> : [
		<libvulpes:ore0:9>
		],

	#oreAluminum
	<ore:oreAluminum> : [
		<libvulpes:ore0:9>
	],

	#oreCopper
	<ore:oreCopper> : [
		<libvulpes:ore0:4>
	],

	#oreIridium
	<ore:oreIridium> : [
		<libvulpes:ore0:10>
	],

	#oreLead
	<ore:oreLead>: [
		<thermalfoundation:ore:3>
	],

	#orePlatinum
	<ore:orePlatinum> : [
		<thermalfoundation:ore:6>
	],

	#oreRutile
	<ore:oreRutile> : [
		<libvulpes:ore0:8>
	],
	#oreTin
	<ore:oreTin> : [
		<libvulpes:ore0:5>
	],

	#oreTitanium
	<ore:oreTitanium> : [
		<libvulpes:ore0:8>
	],

	#oreSilver
	<ore:oreSilver> : [
		<thermalfoundation:ore:2>
	]

};

for oreDictEntry, items in oresDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

//////////////////////////////
//			Plates          //
//////////////////////////////

var platesDisabled as IItemStack[][IOreDictEntry] = {

	#plateAluminum
	<ore:plateAluminum> : [
		<libvulpes:productplate:9>,
		<thermalfoundation:material:324>
	],


	#plateBronze
	<ore:plateBronze> : [
		<thermalfoundation:material:355>
	],

	#plateConstantan
	<ore:plateConstantan> : [
		<thermalfoundation:material:356>
	],

	#plateCopper
	<ore:plateCopper> : [
		<libvulpes:productplate:4>,
		<thermalfoundation:material:320>
	],

	#plateElectrum
	<ore:plateElectrum> : [
		<thermalfoundation:material:353>
	],

	#plateElectrumFlux
	<ore:plateElectrumFlux> : [
		<redstonearsenal:material:128>
	],

	#plateEnderium
	<ore:plateEnderium> : [
		<thermalfoundation:material:359>
	],

	#plateGold
	<ore:plateGold> : [
		<libvulpes:productplate:2>,
		<thermalfoundation:material:33>
	],

	#plateInvar
	<ore:plateInvar> : [
		<thermalfoundation:material:354>
	],

	#plateIridium
	<ore:plateIridium> : [
		<libvulpes:productplate:10>,
		<thermalfoundation:material:327>
	],

	#plateIron
	<ore:plateIron> : [
		<thermalfoundation:material:32>,
		<libvulpes:productplate:1>
	],

	#plateLead
	<ore:plateLead> : [
		<thermalfoundation:material:323>
	],

	#plateLumium
	<ore:plateLumium> : [
		<thermalfoundation:material:358>
	],

	#plateNickel
	<ore:plateNickel> : [
		<thermalfoundation:material:325>
	],

	#platePlatinum
	<ore:platePlatinum> : [
		<thermalfoundation:material:326>
	],

	#platePlutonium
	<ore:platePlutonium> : [
//		<metaitem:platePlutonium>
	],

	#plateSignalum
	<ore:plateSignalum> : [
		<thermalfoundation:material:357>
	],

	#plateSilicon
	<ore:plateSilicon> : [
		<libvulpes:productplate:3>
	],

	#plateSilver
	<ore:plateSilver> : [
		<thermalfoundation:material:322>
	],

	#plateSteel
	<ore:plateSteel> : [
		<thermalfoundation:material:352>,
		<libvulpes:productplate:6>
	],

	#plateTin
	<ore:plateTin> : [
		<thermalfoundation:material:321>,
		<libvulpes:productplate:5>
	],

	#plateTitanium
	<ore:plateTitanium> : [
		<libvulpes:productplate:7>
	],

	#plateNeutronium
	<ore:plateNeutronium> : [
//		<metaitem:plateNeutronium>
	]
};

for oreDictEntry, items in platesDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

//////////////////////////////
//			Gears           //
//////////////////////////////

var gearsDisabled as IItemStack[][IOreDictEntry] = {

	#gearAluminum
	<ore:gearAluminum> : [
		<thermalfoundation:material:260>
	],

	#gearBronze
	<ore:gearBronze> : [
		<thermalfoundation:material:291>
//		<forestry:gear_bronze>
	],

	#gearConstantan
	<ore:gearConstantan> : [
		<thermalfoundation:material:292>
	],

	#gearCopper
	<ore:gearCopper> : [
		<thermalfoundation:material:256>
//		<forestry:gear_copper>
	],

	#gearDiamond
	<ore:gearDiamond> : [
		<thermalfoundation:material:26>
	],

	#gearElectrum
	<ore:gearElectrum> : [
		<thermalfoundation:material:289>
	],

	#gearElectrumFlux
	<ore:gearElectrumFlux> : [
		<redstonearsenal:material:96>
	],

	#gearEnderium
	<ore:gearEnderium> : [
		<thermalfoundation:material:295>
	],

	#gearGold
	<ore:gearGold> : [
		<thermalfoundation:material:25>
	],

	#gearInvar
	<ore:gearInvar> : [
		<thermalfoundation:material:290>
	],

	#gearIron
	<ore:gearIron> : [
		<thermalfoundation:material:24>
	],

	#gearIridium
	<ore:gearIridium> : [
		<thermalfoundation:material:263>
	],

	#gearLead
	<ore:gearLead> : [
		<thermalfoundation:material:259>
	],

	#gearLumium
	<ore:gearLumium> : [
		<thermalfoundation:material:294>
	],

	#gearNickel
	<ore:gearNickel> : [
		<thermalfoundation:material:261>
	],

	#gearPlatinum
	<ore:gearPlatinum> : [
		<thermalfoundation:material:262>
	],

	#gearSignalum
	<ore:gearSignalum> : [
		<thermalfoundation:material:293>
	],

	#gearSilver
	<ore:gearSilver> : [
		<thermalfoundation:material:258>
	],

	#gearSteel
	<ore:gearSteel> : [
		<thermalfoundation:material:288>,
		<libvulpes:productgear:6>
	],

	#gearTin
	<ore:gearTin> : [
		<thermalfoundation:material:257>,
//		<forestry:gear_tin>
	],

	#gearTitanium
	<ore:gearTitanium> : [
		<libvulpes:productgear:7>
	],

	#gearWood
	<ore:gearWood> : [
		<appliedenergistics2:material:40>,
		<thermalfoundation:material:22>
	]
};

for oreDictEntry, items in gearsDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

//////////////////////////////
//			Misc            //
//////////////////////////////

var miscDisabled as IItemStack[][IOreDictEntry] = {

	#Apatite
	<ore:gemApatite> : [
//		<forestry:apatite>
	],

	#Silicon
	<ore:itemSilicon> : [
		<enderio:item_material:5>,
		<nuclearcraft:gem:6>,
		<appliedenergistics2:material:5>,
		<libvulpes:productingot:3>,		
		<projectred-core:resource_item:301>
	],

	#Arsenic
	<ore:dustArsenic> : [
		<nuclearcraft:gem_dust:10>
	],

	#boltPlutonium
	<ore:boltPlutonium> : [
//		<metaitem:boltPlutonium>
	],

	#dustSmallPlutonium
	<ore:dustSmallPlutonium> : [
//		<metaitem:dustSmallPlutonium>
	],

	#dustTinyPlutonium
	<ore:dustTinyPlutonium> : [
//		<metaitem:dustTinyPlutonium>
	],

	#screwPlutonium
	<ore:screwPlutonium> : [
//		<metaitem:screwPlutonium>
	],

	#stickLongPlutonium
	<ore:stickLongPlutonium> : [
//		<metaitem:stickLongPlutonium>
	],

	#gemRuby
	<ore:gemRuby> : [
		<projectred-core:resource_item:200>
	],

	#gemSapphire
	<ore:gemSapphire> : [
		<projectred-core:resource_item:201>
	]
};

for oreDictEntry, items in miscDisabled {
	for i in items {
		mods.jei.JEI.removeAndHide(i);
	}
	oreDictEntry.removeItems(items);
}

<ore:itemSilicon>.add(<metaitem:wafer.silicon>);
<ore:dustQuartz>.add(<metaitem:dustNetherQuartz>);
<ore:dustBone>.add(<minecraft:dye:15>);

// Awakened Draconium Fix
<ore:blockDraconiumAwakened>.add(<metaitem:nomilabs:blockAwakenedDraconium>);
<ore:ingotDraconiumAwakened>.add(<metaitem:nomilabs:ingotAwakenedDraconium>);
<ore:nuggetDraconiumAwakened>.add(<metaitem:nomilabs:nuggetAwakenedDraconium>);

// Chisel Blocks fix
// Aluminium (not aluminum)
<ore:blockAluminum>.add(<metaitem:blockAluminium>);

// Coal Coke (not fuelCoke)
<ore:blockCoalCoke>.add(<metaitem:blockCoke>);

//Ores
mods.jei.JEI.removeAndHide(<minecraft:iron_ore>);
mods.jei.JEI.removeAndHide(<minecraft:coal_ore>);
mods.jei.JEI.removeAndHide(<minecraft:redstone_ore>);
mods.jei.JEI.removeAndHide(<minecraft:diamond_ore>);
mods.jei.JEI.removeAndHide(<minecraft:lapis_ore>);
mods.jei.JEI.removeAndHide(<minecraft:gold_ore>);
mods.jei.JEI.removeAndHide(<minecraft:emerald_ore>);
mods.jei.JEI.removeAndHide(<minecraft:quartz_ore>);

// Infinity conversion
recipes.addShapeless(<avaritia:resource:6>, [<metaitem:nomilabs:ingotInfinity>]);
recipes.addShapeless(<moreplates:infinity_plate>, [<metaitem:nomilabs:plateInfinity>]);

mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotInfinity>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:plateInfinity>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockInfinity>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetInfinity>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:dustInfinity>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:dustSmallInfinity>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:dustTinyInfinity>);
// Infinity Plate * 1
<recipemap:bender>.findRecipe(24, [<metaitem:nomilabs:ingotInfinity>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

bender.recipeBuilder()
	.inputs(<avaritia:resource:6>)
	.circuit(1)
	.outputs(<moreplates:infinity_plate>)
	.duration(5000).EUt(24).buildAndRegister();

arc_furnace.recipeBuilder()
	.inputs(<moreplates:infinity_plate>)
	.fluidInputs(<liquid:oxygen> * 5000)
	.outputs(<avaritia:resource:6>)
	.duration(5000).EUt(30).buildAndRegister();

//Add moreplates neutronium plate to gtce neutronium ore dict
//<ore:plateNeutronium>.add(<moreplates:neutronium_plate:0>);

//<ore:gemDilithium>.remove(<libvulpes:productgem>);
<ore:crystalDilithium>.add(<libvulpes:productgem>);

//<ore:blockWarpCoreRim>.add(<gregtech:meta_block_compressed_4:8>);

//Create Universal GTCE Oredict for tools that can be used to reference by oredict and encapsulates all tools.
//Works for any material tool, any damage tool, electric or non-electric

//GTCE Tools
//<ore:gtceWrenches>.addItems([
//	<gregtech:meta_tool:8>.withEmptyTag(), 
//	<gregtech:meta_tool:29>.withEmptyTag(), 
//	<gregtech:meta_tool:30>.withEmptyTag(), 
//	<gregtech:meta_tool:31>.withEmptyTag()]);
//
//<ore:gtceScrewdrivers>.addItems([
//	<gregtech:meta_tool:11>.withEmptyTag(), 
//	<gregtech:meta_tool:34>.withEmptyTag()]);
//
//<ore:gtceHardHammers>.addItems([
//	<gregtech:meta_tool:6>.withEmptyTag()]);
//
//<ore:gtceSaws>.addItems([
//	<gregtech:meta_tool:5>.withEmptyTag(),
//	<gregtech:meta_tool:16>.withEmptyTag(), 
//	<gregtech:meta_tool:26>.withEmptyTag(), 
//	<gregtech:meta_tool:27>.withEmptyTag(), 
//	<gregtech:meta_tool:28>.withEmptyTag(), 
//	<gregtech:meta_tool:33>.withEmptyTag()]);
//
//<ore:gtceFiles>.addItems([
//	<gregtech:meta_tool:9>.withEmptyTag()]);
//
//<ore:gtceMortars>.addItems([
//	<gregtech:meta_tool:12>.withEmptyTag()]);
//
//<ore:gtceWireCutters>.addItems([
//	<gregtech:meta_tool:13>.withEmptyTag()]);


//Setting Item Max Stacksize
<minecraft:snowball>.maxStackSize=64;
<minecraft:ender_pearl>.maxStackSize=64;


////////////////////////////////
//			Removals          //
////////////////////////////////

//Hide Categories
mods.jei.JEI.hideCategory("minecraft.anvil");
mods.jei.JEI.hideCategory("Painter");
mods.jei.JEI.hideCategory("extrautils2.blockPatterns");
mods.jei.JEI.hideCategory("Avatitia.Compressor");
mods.jei.JEI.hideCategory("EIOTank");
mods.jei.JEI.hideCategory("jeresources.enchantment");

mods.jei.JEI.hideCategory("actuallyadditions.compost");
mods.jei.JEI.hideCategory("actuallyadditions.crushing");
mods.jei.JEI.hideCategory("actuallyadditions.booklet");
mods.jei.JEI.hideCategory("extendedcrafting:compressor");
mods.jei.JEI.hideCategory("extendedcrafting:ender_crafting");
mods.jei.JEI.hideCategory("thermalexpansion.compression");
mods.jei.JEI.hideCategory("thermalexpansion.enervation");
mods.jei.JEI.hideCategory("thermalexpansion.transposer_fill");
mods.jei.JEI.hideCategory("thermalexpansion.transposer_extract");
//mods.jei.JEI.hideCategory("gregtech:plasma_arc_furnace");
//mods.jei.JEI.hideCategory("gregtech:arc_furnace");
//mods.jei.JEI.hideCategory("gregtech:naquadah_reactor");
//mods.jei.JEI.hideCategory("gregtech:mass_fab");
mods.jei.JEI.hideCategory("xu2_machine_extrautils2:furnace");
mods.jei.JEI.hideCategory("xu2_machine_extrautils2:crusher");
mods.jei.JEI.hideCategory("xu2_machine_extrautils2:generator_survival");
mods.jei.JEI.hideCategory("xu2_machine_extrautils2:generator");
mods.jei.JEI.hide(<appliedenergistics2:facade>);
mods.jei.JEI.removeAndHide(<appliedenergistics2:material:5>);


//Actually Additions Removals
mods.jei.JEI.removeAndHide(<actuallyadditions:block_battery_box>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_bio_reactor>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_tiny_torch>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_firework_box>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_smiley_cloud>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_grinder_double>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_grinder>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_furnace_double>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_inputter>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_inputter_advanced>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_fishing_net>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_oil_generator>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_fermenting_barrel>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_compost>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_energizer>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_enervator>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_treasure_chest>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_heat_collector>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_item_repairer>);
mods.jei.JEI.removeAndHide(<actuallyadditions:block_greenhouse_glass>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_misc:18>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_mining_lens>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_disenchanting_lens>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_more_damage_lens>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_damage_lens>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_explosion_lens>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_color_lens>);
//mods.jei.JEI.removeAndHide(<actuallyadditions:item_crate_keeper>);
//mods.jei.JEI.removeAndHide(<actuallyadditions:item_chest_to_crate_upgrade>);
//mods.jei.JEI.removeAndHide(<actuallyadditions:item_small_to_medium_crate_upgrade>);
//mods.jei.JEI.removeAndHide(<actuallyadditions:item_medium_to_large_crate_upgrade>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_booklet>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_misc:21>);
mods.jei.JEI.removeAndHide(<actuallyadditions:item_misc:22>);


//Advanced Rocketry Removals


mods.jei.JEI.removeAndHide(<advancedrocketry:charcoallog>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satellitebuilder>);
mods.jei.JEI.removeAndHide(<advancedrocketry:loader>);
mods.jei.JEI.removeAndHide(<advancedrocketry:precisionassemblingmachine>);
mods.jei.JEI.removeAndHide(<advancedrocketry:platepress>);
mods.jei.JEI.removeAndHide(<advancedrocketry:blastbrick>);
mods.jei.JEI.removeAndHide(<advancedrocketry:iquartzcrucible>);
mods.jei.JEI.removeAndHide(<advancedrocketry:crystallizer>);
mods.jei.JEI.removeAndHide(<advancedrocketry:cuttingmachine>);
mods.jei.JEI.removeAndHide(<advancedrocketry:observatory>);
mods.jei.JEI.removeAndHide(<advancedrocketry:blackholegenerator>);
mods.jei.JEI.removeAndHide(<advancedrocketry:concrete>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satellitecontrolcenter>);
mods.jei.JEI.removeAndHide(<advancedrocketry:planetanalyser>);
mods.jei.JEI.removeAndHide(<advancedrocketry:arcfurnace>);
mods.jei.JEI.removeAndHide(<advancedrocketry:sawblade>);
mods.jei.JEI.removeAndHide(<advancedrocketry:lathe>);
mods.jei.JEI.removeAndHide(<advancedrocketry:rollingmachine>);
mods.jei.JEI.removeAndHide(<advancedrocketry:electrolyser>);
mods.jei.JEI.removeAndHide(<advancedrocketry:chemicalreactor>);
mods.jei.JEI.removeAndHide(<advancedrocketry:microwavereciever>);
mods.jei.JEI.removeAndHide(<advancedrocketry:drill>);
mods.jei.JEI.removeAndHide(<advancedrocketry:solarpanel>);
mods.jei.JEI.removeAndHide(<advancedrocketry:biomescanner>);
mods.jei.JEI.removeAndHide(<advancedrocketry:deployablerocketbuilder>);
mods.jei.JEI.removeAndHide(<advancedrocketry:liquidtank>);
mods.jei.JEI.removeAndHide(<advancedrocketry:intake>);
mods.jei.JEI.removeAndHide(<advancedrocketry:solargenerator>);
mods.jei.JEI.removeAndHide(<advancedrocketry:railgun>);
mods.jei.JEI.removeAndHide(<advancedrocketry:blocklens>);
//mods.jei.JEI.removeAndHide(<advancedrocketry:forcefieldprojector>);
mods.jei.JEI.removeAndHide(<advancedrocketry:spaceelevatorcontroller>);
mods.jei.JEI.removeAndHide(<advancedrocketry:beacon>);
mods.jei.JEI.removeAndHide(<advancedrocketry:thermitetorch>);
mods.jei.JEI.removeAndHide(<advancedrocketry:wirelesstransciever>);
//mods.jei.JEI.removeAndHide(<advancedrocketry:spacelaser>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productdust>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productdust:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productingot>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productingot:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productnugget>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productnugget:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productplate>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productplate:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productrod:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productrod>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productsheet>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productsheet:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productgear>);
mods.jei.JEI.removeAndHide(<advancedrocketry:productgear:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:metal0>);
mods.jei.JEI.removeAndHide(<advancedrocketry:metal0:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:orescanner>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satellitepowersource>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satellitepowersource:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:itemcircuitplate>);
mods.jei.JEI.removeAndHide(<advancedrocketry:itemcircuitplate:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:ic>);
mods.jei.JEI.removeAndHide(<advancedrocketry:ic:2>);
mods.jei.JEI.removeAndHide(<advancedrocketry:ic:3>);
mods.jei.JEI.removeAndHide(<advancedrocketry:ic:5>);
mods.jei.JEI.removeAndHide(<advancedrocketry:ic:4>);
mods.jei.JEI.removeAndHide(<advancedrocketry:wafer>);
mods.jei.JEI.removeAndHide(<advancedrocketry:dataunit>);
mods.jei.JEI.removeAndHide(<advancedrocketry:satellite>);
mods.jei.JEI.removeAndHide(<advancedrocketry:misc>);
mods.jei.JEI.removeAndHide(<advancedrocketry:misc:1>);
mods.jei.JEI.removeAndHide(<advancedrocketry:sawbladeiron>);
mods.jei.JEI.removeAndHide(<advancedrocketry:jackhammer>);
mods.jei.JEI.removeAndHide(<advancedrocketry:asteroidchip>);
mods.jei.JEI.removeAndHide(<advancedrocketry:elevatorchip>);
// mods.jei.JEI.removeAndHide(<advancedrocketry:lens>);
mods.jei.JEI.removeAndHide(<advancedrocketry:basiclasergun>);
mods.jei.JEI.removeAndHide(<advancedrocketry:beaconfinder>);
mods.jei.JEI.removeAndHide(<advancedrocketry:thermite>);
mods.jei.JEI.removeAndHide(<advancedrocketry:unlittorch>);
mods.jei.JEI.removeAndHide(<libvulpes:productboule:3>);


//Armor Plus Removals
mods.jei.JEI.removeAndHide(<armorplus:workbench>);
mods.jei.JEI.removeAndHide(<armorplus:high_tech_bench>);
mods.jei.JEI.removeAndHide(<armorplus:ulti_tech_bench>);
mods.jei.JEI.removeAndHide(<armorplus:champion_bench>);
mods.jei.JEI.removeAndHide(<armorplus:ore_lava_crystal>);
mods.jei.JEI.removeAndHide(<armorplus:steel_block>);
mods.jei.JEI.removeAndHide(<armorplus:electrical_block>);
mods.jei.JEI.removeAndHide(<armorplus:lava_nether_brick>);
mods.jei.JEI.removeAndHide(<armorplus:lava_cactus>);
mods.jei.JEI.removeAndHide(<armorplus:lava_infuser>);
mods.jei.JEI.removeAndHide(<armorplus:lava_infuser_infusing>);
mods.jei.JEI.removeAndHide(<armorplus:lava_crystal>);
mods.jei.JEI.removeAndHide(<armorplus:the_gift_of_the_gods>);
mods.jei.JEI.removeAndHide(<armorplus:block_lava_crystal>);
mods.jei.JEI.removeAndHide(<armorplus:block_compressed_lava_crystal>);
mods.jei.JEI.removeAndHide(<armorplus:book>);
mods.jei.JEI.removeAndHide(<armorplus:steel_ingot>);
mods.jei.JEI.removeAndHide(<armorplus:electrical_ingot>);
mods.jei.JEI.removeAndHide(<armorplus:redstone_apple>);
mods.jei.JEI.removeAndHide(<armorplus:redstone_apple:1>);
mods.jei.JEI.removeAndHide(<armorplus:dev_tool>);
mods.jei.JEI.removeAndHide(<armorplus:material>);
mods.jei.JEI.removeAndHide(<armorplus:tower_spawn_item>);
mods.jei.JEI.removeAndHide(<armorplus:ender_dungeon_floor_1_spawn_item>);
mods.jei.JEI.removeAndHide(<armorplus:chicken_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:chicken_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:chicken_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:chicken_boots>);
mods.jei.JEI.removeAndHide(<armorplus:slime_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:slime_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:slime_boots>);
mods.jei.JEI.removeAndHide(<armorplus:slime_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:pig_iron_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:pig_iron_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:pig_iron_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:pig_iron_boots>);
//mods.jei.JEI.removeAndHide(<armorplus:block_melting_obsidian>);
mods.jei.JEI.removeAndHide(<armorplus:coal_sword>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_bow>);
mods.jei.JEI.removeAndHide(<armorplus:infused_lava_bow>);
mods.jei.JEI.removeAndHide(<armorplus:obsidian_bow>);
mods.jei.JEI.removeAndHide(<armorplus:emerald_bow>);
mods.jei.JEI.removeAndHide(<armorplus:redstone_bow>);
mods.jei.JEI.removeAndHide(<armorplus:coal_bow>);
mods.jei.JEI.removeAndHide(<armorplus:book_lore>);
mods.jei.JEI.removeAndHide(<armorplus:dusk>);
mods.jei.JEI.removeAndHide(<armorplus:noon>);
mods.jei.JEI.removeAndHide(<armorplus:midnight>);
mods.jei.JEI.removeAndHide(<armorplus:dawn>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_overworld>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_the_nether>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_the_end>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_sacrifice>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_the_realm>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_arena>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_the_shaper>);
mods.jei.JEI.removeAndHide(<armorplus:map_of_the_elder>);
mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "armorplus:ender_dragon_zombie"}}));
mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "armorplus:ice_golem"}}));
mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "armorplus:overlord_of_the_guardians"}}));
mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "armorplus:skeletal_king"}}));
mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "armorplus:witherling"}}));
mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "armorplus:demonic_dragon"}}));
mods.jei.JEI.removeAndHide(<armorplus:white_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:red_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:black_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:blue_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:green_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:purple_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:yellow_stone_brick>);
mods.jei.JEI.removeAndHide(<armorplus:white_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:red_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:black_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:blue_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:green_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:yellow_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:purple_stone_brick_tower>);
mods.jei.JEI.removeAndHide(<armorplus:white_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:red_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:black_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:blue_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:green_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:yellow_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:purple_stone_brick_corner>);
mods.jei.JEI.removeAndHide(<armorplus:white_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:red_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:black_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:blue_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:green_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:yellow_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:purple_stone_brick_wall>);
mods.jei.JEI.removeAndHide(<armorplus:chainmail_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:chainmail_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:chainmail_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:chainmail_boots>);
mods.jei.JEI.removeAndHide(<armorplus:iron_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:iron_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:iron_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:iron_boots>);
mods.jei.JEI.removeAndHide(<armorplus:gold_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:gold_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:gold_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:gold_boots>);
mods.jei.JEI.removeAndHide(<armorplus:diamond_helmet>);
mods.jei.JEI.removeAndHide(<armorplus:diamond_chestplate>);
mods.jei.JEI.removeAndHide(<armorplus:diamond_leggings>);
mods.jei.JEI.removeAndHide(<armorplus:diamond_boots>);
mods.jei.JEI.removeAndHide(<armorplus:trophy>);
mods.jei.JEI.removeAndHide(<armorplus:pig_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:sheep_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:cow_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:chicken_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:horse_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:rabbit_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:bat_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:ocelot_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:parrot_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:polar_bear_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:wolf_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:creeper_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:blaze_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:spider_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:cave_spider_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:zombie_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:enderman_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:endermite_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:stray_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:evoker_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:vex_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:vindicator_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:ghast_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:husk_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:shulker_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:magma_cube_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:silverfish_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:skeleton_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:witch_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:zombie_villager_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:zombie_pigman_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:wither_skeleton_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:slime_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:elder_guardian_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:wither_boss_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:ender_dragon_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:skeletal_king_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_overlord_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:demonic_dragon_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:the_lord_of_everything_trophy>);
mods.jei.JEI.removeAndHide(<armorplus:coal_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:lapis_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:redstone_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:emerald_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:obsidian_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:infused_lava_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:super_star_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:ender_dragon_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:empty_sword_display>);
mods.jei.JEI.removeAndHide(<armorplus:emerald_arrow>);
mods.jei.JEI.removeAndHide(<armorplus:obsidian_arrow>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_arrow>);
mods.jei.JEI.removeAndHide(<armorplus:super_star_arrow>);
mods.jei.JEI.removeAndHide(<armorplus:coal_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:lapis_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:redstone_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:emerald_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:obsidian_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:infused_lava_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:super_star_battle_axe>);
mods.jei.JEI.removeAndHide(<armorplus:coal_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:lapis_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:redstone_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:emerald_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:obsidian_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:infused_lava_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:guardian_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:super_star_pickaxe>);
mods.jei.JEI.removeAndHide(<armorplus:ender_dragon_pickaxe>);


//Avaritia Removals
mods.jei.JEI.removeAndHide(<avaritia:resource:7>);
mods.jei.JEI.removeAndHide(<avaritia:singularity>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:1>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:2>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:3>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:4>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:5>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:6>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:7>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:8>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:9>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:10>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:11>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:12>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:13>);
mods.jei.JEI.removeAndHide(<avaritia:singularity:14>);
mods.jei.JEI.removeAndHide(<avaritia:infinity_bow>);
mods.jei.JEI.removeAndHide(<avaritia:infinity_pickaxe>);
mods.jei.JEI.removeAndHide(<avaritia:infinity_shovel>);
mods.jei.JEI.removeAndHide(<avaritia:infinity_axe>);
mods.jei.JEI.removeAndHide(<avaritia:infinity_hoe>);
mods.jei.JEI.removeAndHide(<avaritia:endest_pearl>);
mods.jei.JEI.removeAndHide(<avaritia:ultimate_stew>);
mods.jei.JEI.removeAndHide(<avaritia:cosmic_meatballs>);
mods.jei.JEI.removeAndHide(<avaritia:double_compressed_crafting_table>);
mods.jei.JEI.removeAndHide(<avaritia:extreme_crafting_table>);
mods.jei.JEI.removeAndHide(<avaritia:neutron_collector>);
mods.jei.JEI.removeAndHide(<avaritia:neutronium_compressor>);
mods.jei.JEI.removeAndHide(<avaritia:matter_cluster>);


//Deep Mob Evolution Removals
mods.jei.JEI.removeAndHide(<deepmoblearning:soot_covered_plate>);
mods.jei.JEI.removeAndHide(<deepmoblearning:soot_covered_redstone>);

// Draconic Evolution Removals
mods.jei.JEI.removeAndHide(<draconicevolution:draconium_ore:*>);

//EnderIO Removals
mods.jei.JEI.removeAndHide(<enderio:item_material:28>);
mods.jei.JEI.removeAndHide(<enderio:item_material:39>);
mods.jei.JEI.removeAndHide(<enderio:item_material:72>);
mods.jei.JEI.removeAndHide(<enderio:block_simple_furnace>);
mods.jei.JEI.removeAndHide(<enderio:block_simple_alloy_smelter>);
mods.jei.JEI.removeAndHide(<enderio:block_alloy_smelter>);
mods.jei.JEI.removeAndHide(<enderio:block_enhanced_alloy_smelter>);
mods.jei.JEI.removeAndHide(<enderio:block_buffer:3>);
mods.jei.JEI.removeAndHide(<enderio:block_combustion_generator>);
mods.jei.JEI.removeAndHide(<enderio:block_enhanced_combustion_generator>);
mods.jei.JEI.removeAndHide(<enderio:block_simple_stirling_generator>);
mods.jei.JEI.removeAndHide(<enderio:block_stirling_generator>);
mods.jei.JEI.removeAndHide(<enderio:block_lava_generator>);
mods.jei.JEI.removeAndHide(<enderio:block_simple_sag_mill>);
mods.jei.JEI.removeAndHide(<enderio:item_ender_food>);
mods.jei.JEI.removeAndHide(<enderio:block_sag_mill>);
mods.jei.JEI.removeAndHide(<enderio:block_enhanced_sag_mill>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel:1>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel:2>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel:3>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel:4>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel:5>);
mods.jei.JEI.removeAndHide(<enderio:block_solar_panel:6>);
mods.jei.JEI.removeAndHide(<extrautils2:user>);
mods.jei.JEI.removeAndHide(<extrautils2:contract>);
mods.jei.JEI.removeAndHide(<enderio:block_cap_bank>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_grainy>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_stellar>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_melodic>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_crystalline>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_silver>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_energetic_silver>);
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_vivid>);
mods.jei.JEI.removeAndHide(<enderio:block_creative_spawner>);
mods.jei.JEI.removeAndHide(<enderio:block_simple_crafter>);
mods.jei.JEI.removeAndHide(<enderio:block_simple_wired_charger>);
mods.jei.JEI.removeAndHide(<enderio:block_infinity_fog>);
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_head", "enderio:enabled": 1 as byte}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_feet", "enderio:enabled": 1 as byte}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:naturalist_eye", "enderio:enabled": 1 as byte}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_legs", "enderio:enabled": 1 as byte}));
mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:top"}));
mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderio:top", "enderio:enabled": 1 as byte}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_chest"}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_chest", "enderio:enabled": 1 as byte}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_head"}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_legs"}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:naturalist_eye"}));
//mods.jei.JEI.removeAndHide(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiointegrationforestry:apiarist_armor_feet"}));
mods.jei.JEI.removeAndHide(<enderio:item_capacitor_totemic>);
mods.jei.JEI.removeAndHide(<enderio:item_material:40>);
mods.jei.JEI.removeAndHide(<enderio:item_material:81>);
mods.jei.JEI.removeAndHide(<enderio:block_death_pouch>);


//Extended Crafting Removals
mods.jei.JEI.removeAndHide(<extendedcrafting:storage:7>);
mods.jei.JEI.removeAndHide(<extendedcrafting:ender_alternator>);
mods.jei.JEI.removeAndHide(<extendedcrafting:ender_crafter>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:36>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:37>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:41>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:48>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:128>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:2>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:1>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:2>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:3>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:4>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:5>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:6>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:7>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:16>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:17>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:18>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:19>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:20>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:21>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:22>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:23>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:24>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:25>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:26>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:66>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:65>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:64>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:50>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:49>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:48>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:35>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:34>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:33>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:32>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:31>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:30>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:29>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:28>);
mods.jei.JEI.removeAndHide(<extendedcrafting:singularity:27>);


//Extra Utils 2 Removals
mods.jei.JEI.removeAndHide(<extrautils2:itemcreativedestructionwand>);
mods.jei.JEI.removeAndHide(<extrautils2:itemcreativebuilderswand>);
mods.jei.JEI.removeAndHide(<extrautils2:machine>.withTag({Type: "extrautils2:furnace"}));
mods.jei.JEI.removeAndHide(<extrautils2:machine>.withTag({Type: "extrautils2:crusher"}));
mods.jei.JEI.removeAndHide(<extrautils2:creativeharvest>);
mods.jei.JEI.removeAndHide(<extrautils2:book>);
mods.jei.JEI.removeAndHide(<extrautils2:minichest>);
mods.jei.JEI.removeAndHide(<extrautils2:analogcrafter>);

// Wireless Terminals Removals
mods.jei.JEI.removeAndHide(<ae2wtlib:infinity_booster_card>);
mods.jei.JEI.removeAndHide(<wct:wct>);
mods.jei.JEI.removeAndHide(<wct:wct_creative>);
mods.jei.JEI.removeAndHide(<wct:magnet_card>);

//Gregtech Removals
mods.jei.JEI.removeAndHide(<metaitem:world_accelerator.lv>);
mods.jei.JEI.removeAndHide(<metaitem:world_accelerator.mv>);
mods.jei.JEI.removeAndHide(<metaitem:world_accelerator.luv>);
mods.jei.JEI.removeAndHide(<metaitem:world_accelerator.zpm>);
mods.jei.JEI.removeAndHide(<metaitem:world_accelerator.uv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.ulv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.lv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.mv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.hv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.ev>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.iv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.luv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.zpm>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.uv>);
mods.jei.JEI.removeAndHide(<metaitem:gcym:tiered_hatch.uhv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:amplifab.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:amplifab.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:amplifab.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:amplifab.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:arc_furnace.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:arc_furnace.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:arc_furnace.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:arc_furnace.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:bender.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:bender.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:bender.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:bender.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:distillery.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:electromagnetic_separator.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:electromagnetic_separator.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:electromagnetic_separator.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:electromagnetic_separator.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:magic_energy_absorber>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:primitive_blast_furnace.bronze>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cracker>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:coke_oven_hatch>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:coke_oven>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:tesla_coil>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.ulv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.ulv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.ulv.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.ulv.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.ulv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.ulv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.ulv.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.ulv.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.lv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.lv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.lv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.lv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.mv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.mv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.mv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.mv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.hv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.hv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.hv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.hv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.ev.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.ev.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.ev.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.ev.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.iv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.iv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.iv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.iv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.luv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.luv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.luv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.luv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.zpm.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.zpm.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.zpm.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.zpm.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.max.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.max.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.max.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.max.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.max.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.max.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.max.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.max.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uhv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uhv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uhv.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uhv.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uhv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uhv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uhv.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uhv.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uev.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uev.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uev.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uev.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uev.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uev.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uev.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uev.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uiv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uiv.1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uiv.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uiv.4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uiv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uiv.9>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:ceu.uiv.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cef.uiv.16>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:fe_emitter>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:fe_receiver>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gteu_emitter>);
//mods.jei.JEI.removeAndHide(<gregtech:machine:10645>);
//mods.jei.JEI.removeAndHide(<gregtech:machine:10644>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electric_furnace.iv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electric_furnace.luv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electric_furnace.zpm>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electric_furnace.uv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electromagnetic_separator.iv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electromagnetic_separator.luv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electromagnetic_separator.zpm>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:electromagnetic_separator.uv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:naquadah_reactor.mk1>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:naquadah_reactor.mk2>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:naquadah_reactor.mk3>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:mass_fab.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:mass_fab.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:mass_fab.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:mass_fab.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:replicator.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:replicator.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:replicator.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:replicator.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gtadditions:naquadah_reactor.mk4>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:gteu_receiver>);
//mods.jei.JEI.removeAndHide(<gregtech:metal_casing:8>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forge_hammer.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forge_hammer.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forge_hammer.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forge_hammer.ev>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:microwave.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:microwave.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:microwave.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:microwave.ev>);
mods.jei.JEI.removeAndHide(<metaitem:gearWood>);
//mods.jei.JEI.removeAndHide(<metaitem:lensAlmandine>);
//mods.jei.JEI.removeAndHide(<metaitem:lensGreenSapphire>);
//mods.jei.JEI.removeAndHide(<metaitem:lensRutile>);
//mods.jei.JEI.removeAndHide(<metaitem:lensSapphire>);
//mods.jei.JEI.removeAndHide(<metaitem:lensTopaz>);
//mods.jei.JEI.removeAndHide(<metaitem:lensJasper>);
//mods.jei.JEI.removeAndHide(<metaitem:lensOlivine>);
//mods.jei.JEI.removeAndHide(<metaitem:lensOpal>);
//mods.jei.JEI.removeAndHide(<metaitem:lensLapis>);
//mods.jei.JEI.removeAndHide(<metaitem:lensGarnetRed>);
//mods.jei.JEI.removeAndHide(<metaitem:lensGarnetYellow>);
//mods.jei.JEI.removeAndHide(<metaitem:lensVinteum>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:sifter.lv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:sifter.mv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:sifter.hv>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:sifter.ev>);
//mods.jei.JEI.removeAndHide(<metaitem:tool.dataorb>);
//mods.jei.JEI.removeAndHide(<metaitem:tool.datastick>);
//mods.jei.JEI.removeAndHide(<metaitem:plate.nand_memory_chip>);
//mods.jei.JEI.removeAndHide(<metaitem:wafer.nand_memory_chip>);
//mods.jei.JEI.removeAndHide(<metaitem:plate.nor_memory_chip>);
//mods.jei.JEI.removeAndHide(<metaitem:wafer.nor_memory_chip>);
//mods.jei.JEI.removeAndHide(<gregtech:meta_armor>);
//mods.jei.JEI.removeAndHide(<metaitem:energy_field_projector>);
//mods.jei.JEI.removeAndHide(<meta_tile_entity:armor_table>);
//mods.jei.JEI.removeAndHide(<gregtech:cable:9354>);
//mods.jei.JEI.removeAndHide(<gregtech:cable:8354>);
//mods.jei.JEI.removeAndHide(<gregtech:cable:7354>);
//mods.jei.JEI.removeAndHide(<gregtech:cable:6354>);
//mods.jei.JEI.removeAndHide(<gregtech:cable:5354>);
//mods.jei.JEI.removeAndHide(<metaitem:schematic.dust>);
//mods.jei.JEI.removeAndHide(<metaitem:schematic.3by3>);
//mods.jei.JEI.removeAndHide(<metaitem:schematic.2by2>);
//mods.jei.JEI.removeAndHide(<metaitem:schematic>);
//mods.jei.JEI.removeAndHide(<metaitem:stemcells>);
//mods.jei.JEI.removeAndHide(<metaitem:jackhammer_base>);
//mods.jei.JEI.removeAndHide(<metaitem:springTitanium>);
//mods.jei.JEI.removeAndHide(<gregtech:meta_tool:32>.withTag({"GT.ToolStats": {Material: "darmstadtium"}}));
//mods.jei.JEI.removeAndHide(<metaitem:brick.coke>);


//Inspirations Removals
//mods.jei.JEI.removeAndHide(<inspirations:stone_crook>);
//mods.jei.JEI.removeAndHide(<inspirations:wither_crook>);

//More Furnaces Removals
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:1>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:2>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:3>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:4>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:5>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:6>);
mods.jei.JEI.removeAndHide(<morefurnaces:upgrade:7>);
mods.jei.JEI.removeAndHide(<morefurnaces:furnaceblock:4>);

//More Plates Removals
mods.jei.JEI.removeAndHide(<moreplates:hammer>);


//Standard Expansion Removals
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest>);
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest:25>);
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest:50>);
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest:75>);
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest:100>);
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest:101>);
//mods.jei.JEI.removeAndHide(<bq_standard:loot_chest:102>);


//Gregic Additions Removals
//mods.jei.JEI.removeAndHide(<metaitem:component.petri.dish>);
//mods.jei.JEI.removeAndHide(<metaitem:compressed.coke.clay>);


//The One Probe Removals
mods.jei.JEI.removeAndHide(<theoneprobe:iron_helmet_probe>);
mods.jei.JEI.removeAndHide(<theoneprobe:gold_helmet_probe>);
mods.jei.JEI.removeAndHide(<theoneprobe:diamond_helmet_probe>);
//mods.jei.JEI.removeAndHide(<theoneprobe:probenote>);
mods.jei.JEI.removeAndHide(<theoneprobe:creativeprobe>);

// Extended Crafting Removals
mods.jei.JEI.removeAndHide(<extendedcrafting:crafting_table>);


//Thermal Removals
mods.jei.JEI.removeAndHide(<thermalexpansion:satchel:32000>);
mods.jei.JEI.removeAndHide(<thermalexpansion:frame:129>);
mods.jei.JEI.removeAndHide(<thermalfoundation:upgrade:256>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:23>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:27>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:802>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:801>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:657>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_silver>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_lead>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_aluminum>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_nickel>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_electrum>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_invar>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_copper>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_tin>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_platinum>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_steel>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_bronze>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_stone>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_iron>);
mods.jei.JEI.removeAndHide(<thermalfoundation:tool.hammer_diamond>);
mods.jei.JEI.removeAndHide(<thermalfoundation:rockwool:*>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:864>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:865>);
mods.jei.JEI.removeAndHide(<thermalfoundation:ore:*>);
mods.jei.JEI.removeAndHide(<thermalfoundation:ore_fluid:*>);
mods.jei.JEI.removeAndHide(<thermalfoundation:glass:*>);
mods.jei.JEI.removeAndHide(<thermalfoundation:glass_alloy:*>);
mods.jei.JEI.removeAndHide(<thermalfoundation:dye:*>);


//Custom Materials Removals
//3 Thermal Alloys (nugget, block, ingot, dust)
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetLumium>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetSignalum>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetEnderium>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockLumium>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockSignalum>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockEnderium>);

//Lib Vulpes Removals
mods.jei.JEI.removeAndHide(<libvulpes:gtplug>);
mods.jei.JEI.removeAndHide(<libvulpes:blockphantom>);
mods.jei.JEI.removeAndHide(<libvulpes:placeholder>);
mods.jei.JEI.removeAndHide(<libvulpes:coalgenerator>);
mods.jei.JEI.removeAndHide(<libvulpes:motor>);
mods.jei.JEI.removeAndHide(<libvulpes:advancedmotor>);
mods.jei.JEI.removeAndHide(<libvulpes:enhancedmotor>);
mods.jei.JEI.removeAndHide(<libvulpes:elitemotor>);
mods.jei.JEI.removeAndHide(<libvulpes:coil0:2>);
mods.jei.JEI.removeAndHide(<libvulpes:coil0:4>);
mods.jei.JEI.removeAndHide(<libvulpes:coil0:7>);
mods.jei.JEI.removeAndHide(<libvulpes:coil0:9>);
mods.jei.JEI.removeAndHide(<libvulpes:coil0:10>);
mods.jei.JEI.removeAndHide(<libvulpes:battery>);
mods.jei.JEI.removeAndHide(<libvulpes:battery:1>);
mods.jei.JEI.removeAndHide(<libvulpes:productfan:6>);
mods.jei.JEI.removeAndHide(<libvulpes:productsheet:9>);
mods.jei.JEI.removeAndHide(<libvulpes:productsheet:7>);
mods.jei.JEI.removeAndHide(<libvulpes:productsheet:6>);
mods.jei.JEI.removeAndHide(<libvulpes:productsheet:4>);
mods.jei.JEI.removeAndHide(<libvulpes:productsheet:1>);

// Better Questing Removals
mods.jei.JEI.removeAndHide(<betterquesting:extra_life>);
mods.jei.JEI.removeAndHide(<betterquesting:extra_life:1>);
mods.jei.JEI.removeAndHide(<betterquesting:extra_life:2>);
mods.jei.JEI.removeAndHide(<betterquesting:guide_book>);


//                 XXXXXXXXXX                            XXXXXXXXXX
//              XXXXXXXXXXXXXXX                        XXXXXXXXXXXXXXX
//            XXXXXXXXXXXXX XXXX                      XXXX XXXXXXXXXXXXX
//           XXXXXXXXXXXXX XXXXX                      XXXXX XXXXXXXXXXXXX
//          XXXXXXXXXXXXX XXXXXX                      XXXXXX XXXXXXXXXXXXX
//         XXXXXXXXXXXXXXXXXXXXX                      XXXXXXXXXXXXXXXXXXXXX
//        XXXXXXXXXXXXXXXXXXXXXX                      XXXXXXXXXXXXXXXXXXXXXX
//       XXXXXXXXXXXXXXXXXXXXXX                        XXXXXXXXXXXXXXXXXXXXXX
//       XXXXXXXXXXXXXXXXXXXXX  XXXXX            XXXXX  XXXXXXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXXXXXXXX  XXXXXXXX        XXXXXXXX  XXXXXXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXXXXXX    XXXXXXXX        XXXXXXXX    XXXXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXXXX      XXXXXXXXX      XXXXXXXXX      XXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXX          XXXXXXXXXXXXXXXXXXXX          XXXXXXXXXXXXXXX
//      XXXXXXXXXXXX          XXXXXXXXXXXXXXXXXXXXXXXXXX          XXXXXXXXXXXX
//      XXXXXXXXXX        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX        XXXXXXXXXX
//       XXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     XXXXXXXXXX
//        XXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXX
// XXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     XXXX
// XXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXX
// XXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXX
//  XXXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXX
//   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXX
//         XXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXX
//            XXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXX
//       XXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXXXXX   XXXXXXXX     XXXXXXXX     XXXXXXXX   XXXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXX    XXXXXXXXX                    XXXXXXXXX    XXXXXXXXXXXXXX
//     XXXXXXXXXX      XXXXXXXX                       XXXXXXXXX      XXXXXXXXXX
//                     XXXXXXXX                        XXXXXXXX
//                     XXXXXXXX                        XXXXXXXX
//                      XXXXXXX                        XXXXXXX
//                      XXXXXX                          XXXXXX
//                      XXXXX                            XXXXX

//Modular Machinery removals

//recipes.remove(<modularmachinery:blockenergyinputhatch:0>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:1>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:2>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:3>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:4>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:5>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:6>);
//recipes.remove(<modularmachinery:blockenergyinputhatch:7>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:0>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:1>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:2>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:3>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:4>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:5>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:6>);
//recipes.remove(<modularmachinery:blockenergyoutputhatch:7>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:0>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:1>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:2>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:3>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:4>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:5>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:6>);
//recipes.remove(<modularmachinery:blockfluidinputhatch:7>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:0>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:1>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:2>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:3>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:4>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:5>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:6>);
//recipes.remove(<modularmachinery:blockfluidoutputhatch:7>);
//recipes.remove(<modularmachinery:blockinputbus:0>);
//recipes.remove(<modularmachinery:blockinputbus:1>);
//recipes.remove(<modularmachinery:blockinputbus:2>);
//recipes.remove(<modularmachinery:blockinputbus:3>);
//recipes.remove(<modularmachinery:blockinputbus:4>);
//recipes.remove(<modularmachinery:blockinputbus:5>);
//recipes.remove(<modularmachinery:blockinputbus:6>);
//recipes.remove(<modularmachinery:blockinputbus:7>);
//recipes.remove(<modularmachinery:blockoutputbus:0>);
//recipes.remove(<modularmachinery:blockoutputbus:1>);
//recipes.remove(<modularmachinery:blockoutputbus:2>);
//recipes.remove(<modularmachinery:blockoutputbus:3>);
//recipes.remove(<modularmachinery:blockoutputbus:4>);
//recipes.remove(<modularmachinery:blockoutputbus:5>);
//recipes.remove(<modularmachinery:blockoutputbus:6>);
//recipes.remove(<modularmachinery:blockoutputbus:7>);
//recipes.remove(<modularmachinery:blockcasing:0>); // Machine Casing
//recipes.remove(<modularmachinery:blockcasing:1>); // Machine Vent
//mods.jei.JEI.removeAndHide(<modularmachinery:blockcasing:2>); // Firebox Casing
//mods.jei.JEI.removeAndHide(<modularmachinery:blockcasing:3>); // Machine Gearbox
//mods.jei.JEI.removeAndHide(<modularmachinery:blockcasing:4>); // Reinforced Machine Casing
//mods.jei.JEI.removeAndHide(<modularmachinery:blockcasing:5>); // Machine Circuitry
//recipes.remove(<modularmachinery:itemmodularium>);
//
//mods.jei.JEI.removeAndHide(<modulardiversity:blockbiomedetector>);
//mods.jei.JEI.removeAndHide(<modulardiversity:blockdaylightdetector>);
//mods.jei.JEI.removeAndHide(<modulardiversity:blockweatherdetector>);

//                 XXXXXXXXXX                            XXXXXXXXXX
//              XXXXXXXXXXXXXXX                        XXXXXXXXXXXXXXX
//            XXXXXXXXXXXXX XXXX                      XXXX XXXXXXXXXXXXX
//           XXXXXXXXXXXXX XXXXX                      XXXXX XXXXXXXXXXXXX
//          XXXXXXXXXXXXX XXXXXX                      XXXXXX XXXXXXXXXXXXX
//         XXXXXXXXXXXXXXXXXXXXX                      XXXXXXXXXXXXXXXXXXXXX
//        XXXXXXXXXXXXXXXXXXXXXX                      XXXXXXXXXXXXXXXXXXXXXX
//       XXXXXXXXXXXXXXXXXXXXXX                        XXXXXXXXXXXXXXXXXXXXXX
//       XXXXXXXXXXXXXXXXXXXXX  XXXXX            XXXXX  XXXXXXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXXXXXXXX  XXXXXXXX        XXXXXXXX  XXXXXXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXXXXXX    XXXXXXXX        XXXXXXXX    XXXXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXXXX      XXXXXXXXX      XXXXXXXXX      XXXXXXXXXXXXXXXXX
//      XXXXXXXXXXXXXXX          XXXXXXXXXXXXXXXXXXXX          XXXXXXXXXXXXXXX
//      XXXXXXXXXXXX          XXXXXXXXXXXXXXXXXXXXXXXXXX          XXXXXXXXXXXX
//      XXXXXXXXXX        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX        XXXXXXXXXX
//       XXXXXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     XXXXXXXXXX
//        XXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXX
// XXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     XXXX
// XXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXX
// XXXXXXXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXX
//  XXXXXXXX     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXXXXXXX
//   XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXX
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// XXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX XXXXXXXXXXXXXX
//         XXX    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX    XXX
//            XXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXX
//       XXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXXXXX   XXXXXXXX     XXXXXXXX     XXXXXXXX   XXXXXXXXXXXXXXXXX
//    XXXXXXXXXXXXXX    XXXXXXXXX                    XXXXXXXXX    XXXXXXXXXXXXXX
//     XXXXXXXXXX      XXXXXXXX                       XXXXXXXXX      XXXXXXXXXX
//                     XXXXXXXX                        XXXXXXXX
//                     XXXXXXXX                        XXXXXXXX
//                      XXXXXXX                        XXXXXXX
//                      XXXXXX                          XXXXXX
//                      XXXXX                            XXXXX

//Lumberaxe Removal
//mods.jei.JEI.removeAndHide(<lumberjack:infinity_lumberaxe>);
//mods.jei.JEI.removeAndHide(<lumberjack:endsteel_lumberaxe>);
//mods.jei.JEI.removeAndHide(<lumberjack:stellaralloy_lumberaxe>);



//Ingots to Proper Ingots
//recipes.addShapeless(<thermalfoundation:material:167>, [<metaitem:nomilabs:ingotEnderium>]);
//recipes.addShapeless(<enderio:item_alloy_ingot:2>, [<metaitem:nomilabs:ingotVibrantAlloy>]);
//recipes.addShapeless(<enderio:item_alloy_ingot:1>, [<metaitem:nomilabs:ingotEnergeticAlloy>]);
//recipes.addShapeless(<enderio:item_alloy_ingot:4>, [<metaitem:nomilabs:ingotConductiveIron>]);
//recipes.addShapeless(<enderio:item_alloy_ingot:8>, [<metaitem:nomilabs:ingotEndSteel>]);
//recipes.addShapeless(<enderio:item_alloy_ingot:5>, [<metaitem:nomilabs:ingotPulsatingIron>]);
//recipes.addShapeless(<enderio:item_alloy_ingot:6>, [<metaitem:nomilabs:ingotDarkSteel>]);
//recipes.addShapeless(<enderio:item_alloy_ingot>, [<metaitem:nomilabs:ingotElectricalSteel>]);
//recipes.addShapeless(<thermalfoundation:material:166>, [<metaitem:nomilabs:ingotLumium>]);
//recipes.addShapeless(<thermalfoundation:material:165>, [<metaitem:nomilabs:ingotSignalum>]);
//recipes.addShapeless(<draconicevolution:draconium_ingot>, [<metaitem:nomilabs:ingotDraconium>]);
//recipes.addShapeless(<draconicevolution:draconium_dust>, [<metaitem:nomilabs:dustDraconium>]);
//recipes.addShapeless(<ore:dustWood>.firstItem, [<thermalfoundation:material:800>]);



//Molten Nether Star
//recipes.addShapeless(<minecraft:nether_star> * 9, [<metaitem:blockNetherStar>]);
//solidifier.recipeBuilder().fluidInputs(<liquid:nether_star> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<metaitem:blockNetherStar>]).duration(200).EUt(30).buildAndRegister();
//fluidextractor.recipeBuilder().inputs(<minecraft:nether_star>).fluidOutputs([<liquid:nether_star> * 144]).duration(40).EUt(30).buildAndRegister();
//fluidextractor.recipeBuilder().inputs(<metaitem:blockNetherStar>).fluidOutputs([<liquid:nether_star> * 1296]).duration(360).EUt(30).buildAndRegister();

//Molten Empowered Restonia
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredrestonia> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<actuallyadditions:block_crystal_empowered>]).duration(400).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredrestonia> * 576).notConsumable(<metaitem:shape.mold.gear>).outputs([<moreplates:empowered_restonia_gear>]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<actuallyadditions:block_crystal_empowered>).fluidOutputs([<liquid:moltenempoweredrestonia> * 1296]).duration(200).EUt(30).buildAndRegister();

//Molten Empowered Palis
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredpalis> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<actuallyadditions:block_crystal_empowered:1>]).duration(400).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredpalis> * 576).notConsumable(<metaitem:shape.mold.gear>).outputs([<moreplates:empowered_palis_gear>]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<actuallyadditions:block_crystal_empowered:1>).fluidOutputs([<liquid:moltenempoweredpalis> * 1296]).duration(200).EUt(30).buildAndRegister();

//Molten Empowered Enori
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredenori> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<actuallyadditions:block_crystal_empowered:5>]).duration(400).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredenori> * 576).notConsumable(<metaitem:shape.mold.gear>).outputs([<moreplates:empowered_enori_gear>]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<actuallyadditions:block_crystal_empowered:5>).fluidOutputs([<liquid:moltenempoweredenori> * 1296]).duration(200).EUt(30).buildAndRegister();

//Molten Empowered Diamatine
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempowereddiamatine> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<actuallyadditions:block_crystal_empowered:2>]).duration(400).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempowereddiamatine> * 576).notConsumable(<metaitem:shape.mold.gear>).outputs([<moreplates:empowered_diamatine_gear>]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<actuallyadditions:block_crystal_empowered:2>).fluidOutputs([<liquid:moltenempowereddiamatine> * 1296]).duration(200).EUt(30).buildAndRegister();

//Molten Empowered Emeradic
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredemeradic> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<actuallyadditions:block_crystal_empowered:4>]).duration(400).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredemeradic> * 576).notConsumable(<metaitem:shape.mold.gear>).outputs([<moreplates:empowered_emeradic_gear>]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<actuallyadditions:block_crystal_empowered:4>).fluidOutputs([<liquid:moltenempoweredemeradic> * 1296]).duration(200).EUt(30).buildAndRegister();

//Molten Empowered Void
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredvoid> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<actuallyadditions:block_crystal_empowered:3>]).duration(400).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:moltenempoweredvoid> * 576).notConsumable(<metaitem:shape.mold.gear>).outputs([<moreplates:empowered_void_gear>]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<actuallyadditions:block_crystal_empowered:3>).fluidOutputs([<liquid:moltenempoweredvoid> * 1296]).duration(200).EUt(30).buildAndRegister();

//Molten Dark Soularium
solidifier.recipeBuilder().fluidInputs(<liquid:moltendarksoularium> * 144).notConsumable(<metaitem:shape.mold.ingot>).outputs([<simplyjetpacks:metaitemmods:3>]).duration(40).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<simplyjetpacks:metaitemmods:3>).fluidOutputs([<liquid:moltendarksoularium> * 144]).duration(20).EUt(30).buildAndRegister();

//Molten Soularium
//solidifier.recipeBuilder().fluidInputs(<liquid:moltensoularium> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<enderio:block_alloy:7>]).duration(400).EUt(30).buildAndRegister();
//solidifier.recipeBuilder().fluidInputs(<liquid:moltensoularium> * 144).notConsumable(<metaitem:shape.mold.ingot>).outputs([<enderio:item_alloy_ingot:7>]).duration(40).EUt(30).buildAndRegister();
//fluidextractor.recipeBuilder().inputs(<enderio:item_alloy_ingot:7>).fluidOutputs([<liquid:moltensoularium> * 144]).duration(20).EUt(30).buildAndRegister();
//fluidextractor.recipeBuilder().inputs(<enderio:block_alloy:7>).fluidOutputs([<liquid:moltensoularium> * 1296]).duration(200).EUt(30).buildAndRegister();



//Omnium
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotOmnium>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetOmnium>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockOmnium>);
<ore:ingotOmnium>.add(<extendedcrafting:material:32>);
<ore:nuggetOmnium>.add(<extendedcrafting:material:33>);
<ore:blockOmnium>.add(<extendedcrafting:storage:4>);
recipes.removeByRecipeName("gregtech:block_compress_omnium");
//wiremill.findRecipe(8, [<metaitem:nomilabs:ingotOmnium>], [null]).remove();
//macerator.findRecipe(8, [<metaitem:nomilabs:ingotOmnium>], [null]).remove();
//macerator.findRecipe(8, [<gregtech:cable:709>], [null]).remove();
//extruder.findRecipe(48, [<metaitem:nomilabs:ingotOmnium>,<metaitem:shape.extruder.wire>], [null]).remove();
//extruder.findRecipe(64, [<metaitem:nomilabs:ingotOmnium> * 9,<metaitem:shape.extruder.block>], [null]).remove();
//alloy.findRecipe(32, [<metaitem:nomilabs:ingotOmnium> * 9,<metaitem:shape.mold.block>], [null]).remove();
//fluidextractor.findRecipe(32, [<metaitem:nomilabs:ingotOmnium>], [null]).remove();
//fluidextractor.findRecipe(32, [<metaitem:nomilabs:nuggetOmnium>], [null]).remove();
//fluidextractor.findRecipe(32, [<metaitem:nomilabs:blockOmnium>], [null]).remove();
//wiremill.recipeBuilder().inputs(<extendedcrafting:material:32>).outputs(<metaitem:nomilabs:wireGtSingleOmnium> * 2).duration(364).EUt(7).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<extendedcrafting:material:33>).fluidOutputs([<liquid:omnium> * 16]).duration(25).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<extendedcrafting:material:32>).fluidOutputs([<liquid:omnium> * 144]).duration(200).EUt(30).buildAndRegister();
fluidextractor.recipeBuilder().inputs(<extendedcrafting:storage:4>).fluidOutputs([<liquid:omnium> * 1296]).duration(1800).EUt(30).buildAndRegister();
solidifier.findRecipe(7, [<metaitem:shape.mold.nugget>], [<liquid:omnium> * 144]).remove();
solidifier.findRecipe(7, [<metaitem:shape.mold.ingot>], [<liquid:omnium> * 144]).remove();
solidifier.findRecipe(7, [<metaitem:shape.mold.block>], [<liquid:omnium> * 1296]).remove();
solidifier.recipeBuilder().fluidInputs(<liquid:omnium> * 144).notConsumable(<metaitem:shape.mold.nugget>).outputs([<extendedcrafting:material:33> * 9]).duration(200).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:omnium> * 144).notConsumable(<metaitem:shape.mold.ingot>).outputs([<extendedcrafting:material:32>]).duration(200).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:omnium> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<extendedcrafting:storage:4>]).duration(200).EUt(30).buildAndRegister();
solidifier.recipeBuilder().fluidInputs(<liquid:omnium> * 16).notConsumable(<metaitem:shape.mold.ball>).outputs([<extendedcrafting:singularity_ultimate>]).duration(200).EUt(30).buildAndRegister();
furnace.remove(<metaitem:nomilabs:ingotOmnium>);
furnace.addRecipe(<extendedcrafting:material:32>, <metaitem:nomilabs:dustOmnium>, 0.0);
recipes.addShapeless(<extendedcrafting:material:32>, [<metaitem:nomilabs:ingotOmnium>]);

//Neutronium
<ore:ingotNeutronium>.add(<avaritia:resource:4>);
<ore:nuggetNeutronium>.add(<avaritia:resource:3>);
<ore:blockNeutronium>.add(<avaritia:block_resource>);
//solidifier.findRecipe(8, [<metaitem:shape.mold.nugget>], [<liquid:neutronium> * 144]).remove();
//solidifier.findRecipe(8, [<metaitem:shape.mold.gear.small>], [<liquid:neutronium> * 144]).remove();
//solidifier.findRecipe(8, [<metaitem:shape.mold.ingot>], [<liquid:neutronium> * 144]).remove();
//solidifier.findRecipe(8, [<metaitem:shape.mold.plate>], [<liquid:neutronium> * 144]).remove();
//solidifier.findRecipe(8, [<metaitem:shape.mold.gear>], [<liquid:neutronium> * 576]).remove();
//solidifier.findRecipe(8, [<metaitem:shape.mold.block>], [<liquid:neutronium> * 1296]).remove();
//solidifier.recipeBuilder().fluidInputs(<liquid:neutronium> * 144).notConsumable(<metaitem:shape.mold.nugget>).outputs([<avaritia:resource:3> * 9]).duration(200).EUt(30).buildAndRegister();
//solidifier.recipeBuilder().fluidInputs(<liquid:neutronium> * 144).notConsumable(<metaitem:shape.mold.plate>).outputs([<moreplates:neutronium_plate>]).duration(200).EUt(30).buildAndRegister();
//solidifier.recipeBuilder().fluidInputs(<liquid:neutronium> * 144).notConsumable(<metaitem:shape.mold.ingot>).outputs([<avaritia:resource:4>]).duration(200).EUt(30).buildAndRegister();
//solidifier.recipeBuilder().fluidInputs(<liquid:neutronium> * 1296).notConsumable(<metaitem:shape.mold.block>).outputs([<avaritia:block_resource>]).duration(200).EUt(30).buildAndRegister();
//recipes.addShapeless(<avaritia:resource:4>, [<metaitem:ingotNeutronium>]);

//// Signalum Plate
//solidifier.recipeBuilder()
//    .outputs([<ore:plateSignalum>.firstItem])
//    .fluidInputs(<liquid:signalum> * 144)
//    .notConsumable(<metaitem:shape.mold.plate>)
//    .duration(200).EUt(30).buildAndRegister();
//
//// Enderium Plate
//solidifier.recipeBuilder()
//    .outputs([<ore:plateEnderium>.firstItem])
//    .fluidInputs(<liquid:enderium> * 144)
//    .notConsumable(<metaitem:shape.mold.plate>)
//    .duration(200).EUt(30).buildAndRegister();

// Crystal Matrix Plate
//solidifier.recipeBuilder()
//    .outputs([<ore:plateCrystalMatrix>.firstItem])
//    .fluidInputs(<liquid:moltencrystalmatrix> * 144)
//    .notConsumable(<metaitem:shape.mold.plate>)
//    .duration(200).EUt(30).buildAndRegister();

//// Lumium Plate
//solidifier.recipeBuilder()
//	.outputs([<ore:plateLumium>.firstItem])
//	.fluidInputs(<liquid:lumium> * 144)
//	.notConsumable(<metaitem:shape.mold.plate>)
//	.duration(200).EUt(30).buildAndRegister();


//Redstone Alloy
mods.jei.JEI.removeAndHide(<enderio:block_alloy:3>);
mods.jei.JEI.removeAndHide(<enderio:item_alloy_nugget:3>);

recipes.addShapeless(<metaitem:ingotRedAlloy>, [<enderio:item_alloy_ingot:3>]);

//Circuits
//<ore:circuitLv>.add(<nomilabs:refinedcircuit>);
//<ore:circuitLv>.remove(<metaitem:circuit.advanced_parts>);
//
//<ore:circuitMv>.add(<nomilabs:combinationcircuit>);
//<ore:circuitMv>.add(<nomilabs:electronicprocessor>);
//<ore:circuitMv>.add(<nomilabs:refinedprocessor>);
//<ore:circuitMv>.add(<nomilabs:microcircuit>);
//<ore:circuitMv>.remove(<metaitem:circuit.good>);
//<ore:circuitMv>.remove(<metaitem:circuit.advanced>);
//
//<ore:circuitHv>.add(<nomilabs:refinedprocessorarray>);
//<ore:circuitHv>.add(<nomilabs:electronicprocessorarray>);
//<ore:circuitEv>.add(<nomilabs:refinedprocessormainframe>);
//<ore:circuitEv>.add(<nomilabs:microprocessorarray>);
//<ore:circuitIv>.add(<nomilabs:crystalcircuit>);
//<ore:circuitIv>.add(<nomilabs:quantumprocessor>);
//<ore:circuitIv>.add(<nomilabs:microprocessormainframe>);
//<ore:circuitIv>.add(<nomilabs:nanoprocessorarray>);
//<ore:circuitLuv>.add(<nomilabs:nanoprocessormainframe>);
//<ore:circuitLuv>.add(<nomilabs:quantumprocessorarray>);
//<ore:circuitZpm>.add(<nomilabs:quantumprocessormainframe>);
//<ore:circuitZpm>.add(<nomilabs:crystalprocessorarray>);
//<ore:circuitSuperconductor>.add(<nomilabs:crystalprocessormainframe>);


//Misc
//<ore:lvcef>.add(<meta_tile_entity:cef.lv.4>);
//<ore:lvcef>.add(<meta_tile_entity:cef.lv.16>);
//<ore:wireGtSinglePulsatingIron>.add(<nomilabs:pulsatingwire>);
//<ore:dustEndstone>.add(<nomilabs:endstonedust>);

//Removals
//<ore:craftingLensLime>.remove(<metaitem:lensEnderEye>);
//<ore:craftingLensWhite>.remove(<metaitem:lensDiamond>);
//<ore:craftingLensWhite>.remove(<metaitem:lensNetherStar>);
//<ore:craftingLensGreenSapphire>.remove(<metaitem:lensDiamond>);
//<ore:circuitIv>.remove(<metaitem:circuit.data_control>);
//<ore:circuitIv>.remove(<metaitem:circuit.crystal_processor>);
//<ore:dustLumium>.remove(<thermalfoundation:material:102>);
//<ore:dustEnderium>.remove(<thermalfoundation:material:103>);
//<ore:dustSignalum>.remove(<thermalfoundation:material:101>);

//Questbook things
<ore:questbookBrewery>.add(<meta_tile_entity:brewery.lv>); 
<ore:questbookBrewery>.add(<meta_tile_entity:brewery.mv>); 
<ore:questbookBrewery>.add(<meta_tile_entity:brewery.hv>); 
<ore:questbookBrewery>.add(<meta_tile_entity:brewery.ev>); 
<ore:questbookBrewery>.add(<meta_tile_entity:brewery.iv>); 
//
<ore:questbookDistillery>.add(<meta_tile_entity:distillery.lv>);
<ore:questbookDistillery>.add(<meta_tile_entity:distillery.mv>);
//
//<ore:questbookCentrifuge>.add(<meta_tile_entity:centrifuge.lv>); // LV Centrifuge
//<ore:questbookCentrifuge>.add(<meta_tile_entity:centrifuge.mv>); // MV Centrifuge
//<ore:questbookCentrifuge>.add(<meta_tile_entity:centrifuge.hv>); // HV Centrifuge
//
<ore:questbookPolarizer>.add(<meta_tile_entity:polarizer.lv>); // LV Polarizer
<ore:questbookPolarizer>.add(<meta_tile_entity:polarizer.mv>); // MV Polarizer (why)
//
<ore:questbookAirCollector>.add(<meta_tile_entity:gas_collector.lv>); // LV Air Succ
<ore:questbookAirCollector>.add(<meta_tile_entity:gas_collector.mv>); // MV Air Succ
<ore:questbookAirCollector>.add(<meta_tile_entity:gas_collector.hv>); // HV Air Succ
<ore:questbookAirCollector>.add(<meta_tile_entity:gas_collector.ev>); // EV Air Succ
//
<ore:questbookCanning>.add(<meta_tile_entity:canner.lv>); // LV Canning
<ore:questbookCanning>.add(<meta_tile_entity:canner.mv>); // MV Canning

<ore:questbookSifter>.add(<metaitem:sifter.lv>);
<ore:questbookSifter>.add(<metaitem:sifter.mv>);

<ore:questbookLvCef>.add(<metaitem:energy_converter.lv.1>);
<ore:questbookLvCef>.add(<metaitem:energy_converter.lv.4>);
<ore:questbookLvCef>.add(<metaitem:energy_converter.lv.8>);
<ore:questbookLvCef>.add(<metaitem:energy_converter.lv.16>);

<ore:questbookLvBatteryBuffer>.add(<metaitem:battery_buffer.lv.4>);
<ore:questbookLvBatteryBuffer>.add(<metaitem:battery_buffer.lv.8>);
<ore:questbookLvBatteryBuffer>.add(<metaitem:battery_buffer.lv.16>);

<ore:questbookMvCef>.add(<metaitem:energy_converter.mv.1>);
<ore:questbookMvCef>.add(<metaitem:energy_converter.mv.4>);
<ore:questbookMvCef>.add(<metaitem:energy_converter.mv.8>);
<ore:questbookMvCef>.add(<metaitem:energy_converter.mv.16>);

<ore:questbookParallelControlHatch>.add(<metaitem:gcym:parallel_hatch.iv>);
<ore:questbookParallelControlHatch>.add(<metaitem:gcym:parallel_hatch.luv>);
<ore:questbookParallelControlHatch>.add(<metaitem:gcym:parallel_hatch.zpm>);
<ore:questbookParallelControlHatch>.add(<metaitem:gcym:parallel_hatch.uv>);

<ore:questbookSteamBoiler>.add(<gregtech:machine:1>);
<ore:questbookSteamBoiler>.add(<gregtech:machine:2>);
<ore:questbookSteamBoiler>.add(<gregtech:machine:3>);
<ore:questbookSteamBoiler>.add(<gregtech:machine:4>);
<ore:questbookSteamBoiler>.add(<gregtech:machine:5>);
<ore:questbookSteamBoiler>.add(<gregtech:machine:6>);

//<ore:questbookFluidExtractor>.add(<meta_tile_entity:fluid_extractor.lv>); // LV Fluid Extractor
//<ore:questbookFluidExtractor>.add(<meta_tile_entity:fluid_extractor.mv>); // MV Fluid Extractor
//<ore:questbookFluidExtractor>.add(<meta_tile_entity:fluid_extractor.hv>); // HV Fluid Extractor

<ore:questbookPowerUnit>.add(<metaitem:power_unit.lv>); // LV Power Unit
<ore:questbookPowerUnit>.add(<metaitem:power_unit.mv>); // MV Power Unit
<ore:questbookPowerUnit>.add(<metaitem:power_unit.hv>); // HV Power Unit
<ore:questbookPowerUnit>.add(<metaitem:power_unit.ev>); // EV Power Unit
<ore:questbookPowerUnit>.add(<metaitem:power_unit.iv>); // IV Power Unit

<ore:questbookMacerator>.add(<metaitem:macerator.lv>); // LV Macerator
<ore:questbookMacerator>.add(<metaitem:macerator.mv>); // MV Macerator
<ore:questbookMacerator>.add(<metaitem:macerator.hv>); // HV Macerator

<ore:questbookWirelessTerminals>.add(<appliedenergistics2:wireless_terminal>); // Normal Wireless
<ore:questbookWirelessTerminals>.add(<appliedenergistics2:wireless_crafting_terminal>); // Crafting Wireless
<ore:questbookWirelessTerminals>.add(<appliedenergistics2:wireless_pattern_terminal>); // Pattern Wireless
<ore:questbookWirelessTerminals>.add(<appliedenergistics2:wireless_fluid_terminal>); // Fluid Wireless

<ore:questbookChisels>.add(<chisel:chisel_iron>);
<ore:questbookChisels>.add(<chisel:chisel_diamond>);
<ore:questbookChisels>.add(<chisel:chisel_hitech>);

<ore:questbookScanner>.add(<metaitem:scanner.hv>);
<ore:questbookScanner>.add(<metaitem:scanner.ev>);
<ore:questbookScanner>.add(<metaitem:scanner.iv>);

<ore:questbookWA>.add(<metaitem:world_accelerator.hv>);
<ore:questbookWA>.add(<metaitem:world_accelerator.ev>);
<ore:questbookWA>.add(<metaitem:world_accelerator.iv>);

<ore:questbookLathe>.add(<metaitem:lathe.lv>);
<ore:questbookLathe>.add(<metaitem:lathe.mv>);

<ore:questbookSingleMiner>.add(<metaitem:miner.lv>);
<ore:questbookSingleMiner>.add(<metaitem:miner.mv>);
<ore:questbookSingleMiner>.add(<metaitem:miner.hv>);

<ore:questbookAutoclave>.add(<metaitem:autoclave.lv>);
<ore:questbookAutoclave>.add(<metaitem:autoclave.mv>);
<ore:questbookAutoclave>.add(<metaitem:autoclave.hv>);
<ore:questbookAutoclave>.add(<metaitem:autoclave.ev>);
<ore:questbookAutoclave>.add(<metaitem:autoclave.iv>);

// Add All GT Super and Quantum Tanks (apart from creative)
// Super Tanks
<ore:questbookTanks>.add(<metaitem:super_tank.lv>);
<ore:questbookTanks>.add(<metaitem:super_tank.mv>);
<ore:questbookTanks>.add(<metaitem:super_tank.hv>);
<ore:questbookTanks>.add(<metaitem:super_tank.ev>);
<ore:questbookTanks>.add(<metaitem:super_tank.iv>);

// Quantum Tanks
<ore:questbookTanks>.add(<metaitem:quantum_tank.iv>);
<ore:questbookTanks>.add(<metaitem:quantum_tank.luv>);
<ore:questbookTanks>.add(<metaitem:quantum_tank.zpm>);
<ore:questbookTanks>.add(<metaitem:quantum_tank.uv>);
<ore:questbookTanks>.add(<metaitem:quantum_tank.uhv>);

/* Nuclearcraft Quests: */
// Neptunium
<ore:questbookNeptunium>.add(<nuclearcraft:neptunium>);
<ore:questbookNeptunium>.add(<nuclearcraft:neptunium:4>);

// Plutonium
<ore:questbookPlutonium>.add(<nuclearcraft:plutonium>);
<ore:questbookPlutonium>.add(<nuclearcraft:plutonium:12>);
<ore:questbookPlutonium>.add(<metaitem:ingotPlutonium>);
<ore:questbookPlutonium>.add(<metaitem:ingotPlutonium241>);

// Americium
<ore:questbookAmericium>.add(<nuclearcraft:americium>);
<ore:questbookAmericium>.add(<nuclearcraft:americium:4>);
<ore:questbookAmericium>.add(<nuclearcraft:americium:8>);

// Curium
<ore:questbookCurium>.add(<nuclearcraft:curium>);
<ore:questbookCurium>.add(<nuclearcraft:curium:4>);
<ore:questbookCurium>.add(<nuclearcraft:curium:8>);
<ore:questbookCurium>.add(<nuclearcraft:curium:12>);

// Berkelium
<ore:questbookBerkelium>.add(<nuclearcraft:berkelium>);
<ore:questbookBerkelium>.add(<nuclearcraft:berkelium:4>);

// Californium
<ore:questbookCalifornium>.add(<nuclearcraft:californium>);
<ore:questbookCalifornium>.add(<nuclearcraft:californium:4>);
<ore:questbookCalifornium>.add(<nuclearcraft:californium:8>);
<ore:questbookCalifornium>.add(<nuclearcraft:californium:12>);

/* End NC quests */

// Add all GT Item Pipes
for pipe in <ore:pipe*Item*>{
    <ore:questbookItemPipes>.add(pipe.firstItem);

}

for restrictivePipe in <ore:pipe*Restrictive*>{
    <ore:questbookItemPipes>.add(restrictivePipe.firstItem);

}

// GTCE Conductive Iron
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetConductiveIron>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotConductiveIron>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockConductiveIron>);

// GTCE Energetic Alloy
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetEnergeticAlloy>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotEnergeticAlloy>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockEnergeticAlloy>);

// GTCE Vibrant Alloy
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetVibrantAlloy>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotVibrantAlloy>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockVibrantAlloy>);

// GTCE Pulsating Iron
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetPulsatingIron>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotPulsatingIron>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockPulsatingIron>);

// GTCE Dark Steel
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetDarkSteel>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotDarkSteel>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockDarkSteel>);

// GTCE Electrical Steel
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetElectricalSteel>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotElectricalSteel>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockElectricalSteel>);

// GTCE End Steel
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:nuggetEndSteel>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:ingotEndSteel>);
//mods.jei.JEI.removeAndHide(<metaitem:nomilabs:blockEndSteel>);

//mods.jei.JEI.removeAndHide(<gregtech:meta_block_compressed_54:15>); // Block of Lignite Coke

//Nuggets
mods.jei.JEI.removeAndHide(<thermalfoundation:material:193>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:194>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:195>);
//mods.jei.JEI.removeAndHide(<thermalfoundation:material:200>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:228>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:1>);
mods.jei.JEI.removeAndHide(<libvulpes:productnugget:3>);
mods.jei.JEI.removeAndHide(<thermalfoundation:material:164>);
mods.jei.JEI.removeAndHide(<thermalfoundation:storage_alloy:4>);



mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:6>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:7>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:8>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:9>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:10>);


mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:1>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:2>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:3>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:4>);
mods.jei.JEI.removeAndHide(<simplyjetpacks:itemfluxpack:5>);


mods.jei.JEI.removeAndHide(<thermalexpansion:machine:6>);
mods.jei.JEI.removeAndHide(<thermalexpansion:machine:8>);


//mods.jei.JEI.removeAndHide(<metaitem:cover.solar.panel>);
//mods.jei.JEI.removeAndHide(<metaitem:cover.solar.panel.ulv>);
//mods.jei.JEI.removeAndHide(<metaitem:cover.solar.panel.lv>);
mods.jei.JEI.removeAndHide(<draconicevolution:draconium_block:1>);

//mods.jei.JEI.removeAndHide(<meta_tile_entity:thermal_centrifuge.lv>);		//thermal centrifuge
//mods.jei.JEI.removeAndHide(<meta_tile_entity:laser_engraver.lv>);		//precision
//mods.jei.JEI.removeAndHide(<meta_tile_entity:cutter.lv>);		//cutting
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forming_press.lv>);		//forming
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forming_press.mv>);		//forming
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forming_press.hv>);		//forming
//mods.jei.JEI.removeAndHide(<meta_tile_entity:forming_press.ev>);		//forming
//mods.jei.JEI.removeAndHide(<meta_tile_entity:plasma_arc_furnace.lv>);		//plasma arc
//mods.jei.JEI.removeAndHide(<meta_tile_entity:plasma_arc_furnace.mv>);		//plasma arc
//mods.jei.JEI.removeAndHide(<meta_tile_entity:plasma_arc_furnace.hv>);		//plasma arc
//mods.jei.JEI.removeAndHide(<meta_tile_entity:plasma_arc_furnace.ev>);		//plasma arc
//mods.jei.JEI.removeAndHide(<metaitem:circuit.data_control>);		//circuit1
//mods.jei.JEI.removeAndHide(<metaitem:circuit.crystal_processor>);		//circuit2

//sulfur from thermal to gt sulfur
recipes.addShapeless(<metaitem:dustSulfur>, [<thermalfoundation:material:771>]);

//Thermal Coal Coke Decomposition
recipes.addShapeless(<metaitem:gemCoke> * 9, [<thermalfoundation:storage_resource:1>]);

//neutronium plate exchange
//recipes.addShapeless("of_exchange_neutronium_plate",
//    <moreplates:neutronium_plate>,
//    [<metaitem:plateNeutronium>]);

// Workaround for DE Fusion Custom recipe not liking strings in the NBT
//<ore:compressedoctadiccap>.add(compressedoctadiccap);

// OreDict stuff for new Pulsating Mesh/Dust
val pulsatingDustOre = <ore:dustPulsating>;
val pulsatingMeshOre = <ore:meshPulsating>;

pulsatingDustOre.add(<nomilabs:pulsatingdust>);
//pulsatingDustOre.add(<forestry:crafting_material:0>);

pulsatingMeshOre.add(<nomilabs:pulsatingmesh>);
//pulsatingMeshOre.add(<forestry:crafting_material:1>);

// GT Fluix
<ore:gemFluix>.add(<appliedenergistics2:material:7>);

/////////////////////////////////
//  One Ingot To Rule Them All //
/////////////////////////////////

print("-----------Nugget / Ingot / Block Crafting Start--------------");
function metalRecipeFix(
    oredictBlock  as IOreDictEntry,
    oredictIngot  as IOreDictEntry,
    oredictNugget as IOreDictEntry,
    preferedBlock as IItemStack,
    preferedIngot as IItemStack,
    preferedNugget as IItemStack
    ){
		//Fix block to ingot recipes
        for metalBlock in oredictBlock.items {
            recipes.removeShaped(metalBlock);
            recipes.removeShapeless(metalBlock);

            recipes.addShapeless(preferedIngot * 9, [
                metalBlock
                ]);
        }

        //Fix ingot to block and ingot to nugget recipes
        for metalIngot in oredictIngot.items {
            recipes.removeShaped(metalIngot * 9);
            recipes.removeShapeless(metalIngot * 9);
            recipes.removeShaped(metalIngot);
            recipes.removeShapeless(metalIngot);

            recipes.addShapeless(preferedNugget * 9, [metalIngot]);
            recipes.addShapeless(preferedBlock, [
                metalIngot, metalIngot, metalIngot,
                metalIngot, metalIngot, metalIngot,
                metalIngot, metalIngot, metalIngot]);
        }

		//Fix nugget to ingot recipes
        for metalNugget in oredictNugget.items {
            recipes.removeShaped(metalNugget * 9);
            recipes.removeShapeless(metalNugget * 9);

            recipes.addShapeless(preferedIngot, [
                metalNugget, metalNugget, metalNugget,
                metalNugget, metalNugget, metalNugget,
                metalNugget, metalNugget, metalNugget]);
        }

        //Backup oredict ingot to block and nugget to ingot recipes for if a player tries to combine various mod ingots
        recipes.addShapeless(preferedBlock, [
                oredictIngot, oredictIngot, oredictIngot,
                oredictIngot, oredictIngot, oredictIngot,
                oredictIngot, oredictIngot, oredictIngot]);
        recipes.addShapeless(preferedIngot, [
                oredictNugget, oredictNugget, oredictNugget,
                oredictNugget, oredictNugget, oredictNugget,
                oredictNugget, oredictNugget, oredictNugget]);
}

print("------------Nugget / Ingot / Block Crafting End---------------");

print("-------------- Ore Dictionary End --------------");
