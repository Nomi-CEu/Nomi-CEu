import mods.gregtech.recipe.RecipeMap;

//Removed From Furnace Smelting
furnace.remove(<ore:ingotIridium>);
furnace.remove(<ore:ingotTungsten>);
furnace.remove(<ore:ingotBlackSteel>);
furnace.remove(<ore:ingotUranium>);
furnace.remove(<ore:ingotAluminium>);
furnace.remove(<thermalfoundation:material:132>);
furnace.remove(<thermalfoundation:ore:4>);
furnace.remove(<ore:gemQuartzBlack>);
furnace.remove(<ore:ingotDraconium>);
furnace.remove(<ore:ingotMithril>);
furnace.remove(<appliedenergistics2:material:5>);
furnace.remove(<metaitem:ingotEnderium>, <metaitem:dustEnderium>);
furnace.remove(<metaitem:ingotLumium>, <metaitem:dustLumium>);
furnace.remove(<metaitem:ingotSignalum>, <metaitem:dustSignalum>);

//  Tier 0										Steel, Silicon
//	Tier 1	[1000 temp]		120		Copper		Black Steel, Annealed Copper
//	Tier 2	[1500 temp]		120		Copper		Aluminium, Kanthal, Energetic Alloy, Neodymium
//	Tier 3	[1700 temp]		120		Copper		Stainless Steel, Nickel Zinc Ferrite, Ilmenite, Silicon Boule, Vibrant Alloy, Red Steel, Nickel Zinc Ferrite, Palladium, Microversium
//	Tier 4	[2100 temp]		480		Kanthal		Titanium, Nichrome, Yttrium
//	Tier 5	[2700 temp]		480		Kanthal		Tungstencarbide, Tungstensteel, Glowstone Doped Boule
//	Tier 6	[3000 temp]		480		Nichrome	Tungsten, Niobium
//	Tier 7	[3600 temp]		480		Nichrome	Vanadium, 
//	Tier 8	[4000 temp]		2000	TunSteel	Signalum, Vanadium-Gallium
//	Tier 9	[4500 temp]		2000	TunSteel	Lumium, HSSG, Iridium, Niobium-Titanium
//	Tier 10	[5000 temp]		8000	HSSG		HSSE, Osmium, Crystal Chips
//	Tier 11	[5400 temp]		8000	HSSG		Naquadah, Naquadah Doped Boule
//	Tier 12	[6000 temp]		8000	Naq			Osmiridium, 
//	Tier 13	[6400 temp]		8000	Naq			Enderium, 
//	Tier 14	[6800 temp]		32000	Naq			Draconium
//	Tier 15	[7200 temp]		32000	Naq			Naquadah Alloy, 
//	Tier 16	[8000 temp]		32000	NaqAlloy	HSSS, 
//	Tier 17	[8600 temp]		32000	NaqAlloy	Dark Soularium,  
//	Tier 18	[8800 temp]		130000	NaqAlloy	
//	Tier 19	[9000 temp]		250000	SuperCon	 
//	Tier 20	[9700 temp]		500000	Fusion		Neutronium Nugget, 

//Steel [tier 0]
//blast_furnace.findRecipe(120, [<metaitem:dustSteel>], [null]).remove();	
//blast_furnace.findRecipe(120, [<minecraft:iron_ingot>], [<liquid:oxygen> * 1000]).remove();	
//blast_furnace.findRecipe(120, [<metaitem:ingotPigIron>], [<liquid:oxygen> * 1000]).remove();	
//blast_furnace.findRecipe(120, [<metaitem:ingotWroughtIron>], [<liquid:oxygen> * 1000]).remove();	
// Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:ingotWroughtIron>], [<liquid:oxygen> * 1000]).remove();


//Silcon [tier 0]
// Silicon Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustSilicon>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

furnace.addRecipe(<metaitem:ingotSilicon>, <metaitem:dustSilicon>, 0.0);

//Black Steel [tier 1]
// Black Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustBlackSteel>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Black Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustBlackSteel>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:dustBlackSteel>]).outputs([<metaitem:ingotBlackSteel>]).property("temperature", 1000).duration(200).EUt(120).buildAndRegister();

//Annealed Copper [tier 1]
//Remove Annealed Copper recipes from Copper dust and ingot
//blast_furnace.findRecipe(120, [<metaitem:dustCopper>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:oxygen> * 1000]).remove();
//blast_furnace.findRecipe(120, [<metaitem:ingotCopper>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:oxygen> * 1000]).remove();
////Adjusting the Temperature and duration of Annealed Copper
//blast_furnace.recipeBuilder()
//	.inputs([<metaitem:ingotCopper>])
//	.fluidInputs([<liquid:oxygen> * 1000])
//	.circuit(1)
//	.outputs([<metaitem:ingotAnnealedCopper>])
//	.property("temperature", 1000)
//	.duration(200).EUt(120).buildAndRegister();

//HSLA - unused
//blast_furnace.recipeBuilder().inputs([<metaitem:ingotSteel>]).fluidInputs([<liquid:oxygen> * 1000]).outputs([<nuclearcraft:alloy:15>]).property("temperature", 1000).duration(200).EUt(120).buildAndRegister();


//Kanthal [tier 2]
//blast_furnace.findRecipe(120, [<metaitem:dustKanthal>], [null]).remove();	
// Hot Kanthal Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustKanthal>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Hot Kanthal Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustKanthal>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:dustKanthal>]).outputs([<metaitem:ingotHotKanthal>]).property("temperature", 1500).duration(200).EUt(120).buildAndRegister();

//Aluminium [tier 2]
//blast_furnace.findRecipe(120, [<metaitem:dustAluminium>], [null]).remove();	
// Aluminium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Aluminium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:dustAluminium>]).outputs([<metaitem:ingotAluminium>]).property("temperature", 1500).duration(400).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:dustAluminium>]).fluidInputs(<liquid:nitrogen> * 1000).outputs([<metaitem:ingotAluminium>]).property("temperature", 1500).duration(270).EUt(120).buildAndRegister();

//Neodymium [tier 2]
//blast_furnace.findRecipe(120, [<metaitem:dustNeodymium>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustNeodymium>]).outputs([<metaitem:ingotNeodymium>]).property("temperature", 1500).duration(400).EUt(120).buildAndRegister();

//Energetic Alloy [tier 2]
blast_furnace.recipeBuilder().inputs([<minecraft:gold_ingot>,<nuclearcraft:compound:2>]).outputs([<enderio:item_alloy_ingot:1>]).property("temperature", 1500).duration(400).EUt(120).buildAndRegister();

//Energetic Silver [tier 2]
//blast_furnace.recipeBuilder().inputs([<ore:ingotSilver>,<nuclearcraft:compound:2>]).outputs([<enderio:item_alloy_endergy_ingot:5>]).property("temperature", 1500).duration(400).EUt(120).buildAndRegister();

//Vibrant Alloy [tier 3]
blast_furnace.recipeBuilder().inputs([<ore:ingotEnergeticAlloy>,<minecraft:ender_pearl>]).outputs([<enderio:item_alloy_ingot:2>]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();

//Silicon Boule [tier 3]
//blast_furnace.findRecipe(120, [<metaitem:dustSilicon> * 32, <metaitem:dustTinyGallium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustSilicon> * 32, <metaitem:dustTinyGallium>]).outputs([<metaitem:boule.silicon>]).property("temperature", 1700).duration(6000).EUt(120).buildAndRegister();

//Red Steel [tier 3]
//blast_furnace.findRecipe(120, [<metaitem:dustRedSteel>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustRedSteel>]).outputs([<metaitem:ingotRedSteel>]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();

//Nickel Zinc Ferrite [tier 3]
//Furnace Recipe from NZF dust
furnace.addRecipe(<metaitem:ingotNickelZincFerrite>, <metaitem:dustNickelZincFerrite>, 0.0);
//Remove the recipe from NZF dust
// Nickel Zinc Ferrite Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustFerriteMixture>], [<liquid:oxygen> * 2000]).remove();


//Stainless Steel [tier 3]
//blast_furnace.findRecipe(120, [<metaitem:dustStainlessSteel>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustStainlessSteel>]).outputs([<metaitem:ingotStainlessSteel>]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();

//Ilmenite [tier 3]
//blast_furnace.findRecipe(500, [<metaitem:dustIlmenite>,<metaitem:dustCarbon>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustIlmenite>,<metaitem:dustCarbon>]).outputs([<metaitem:nuggetWroughtIron> * 4, <metaitem:dustTinyRutile> * 5]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();

//Palladium [tier 3]
//blast_furnace.findRecipe(120, [<metaitem:dustPalladium>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustPalladium>]).outputs([<metaitem:ingotPalladium>]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();
//
////Chrome [tier 3]
//blast_furnace.findRecipe(120, [<metaitem:dustChrome>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustChrome>]).outputs([<metaitem:ingotChrome>]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();
//
////Microversium [tier 3]
blast_furnace.recipeBuilder().inputs([<metaitem:dustSteel>,<nuclearcraft:compound:2>]).fluidInputs([<liquid:deuterium>*50]).outputs([<ore:ingotMicroversium>.firstItem]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:ingotSteel>,<nuclearcraft:compound:2>]).fluidInputs([<liquid:deuterium>*50]).outputs([<ore:ingotMicroversium>.firstItem]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();
//
////Nichrome [tier 4]
//blast_furnace.findRecipe(480, [<metaitem:ingotNickel> * 4,<metaitem:ingotChrome>], [null]).remove();
//blast_furnace.findRecipe(120, [<metaitem:dustNichrome>], [null]).remove();	
//furnace.addRecipe(<metaitem:ingotNichrome>, <metaitem:dustNichrome>, 0.0);
//blast_furnace.recipeBuilder().inputs([<metaitem:ingotNickel> * 4,<metaitem:ingotChrome>]).outputs([<metaitem:ingotHotNichrome> * 5]).property("temperature", 2100).duration(800).EUt(480).buildAndRegister();
//
////Titanium [tier 4]
//blast_furnace.findRecipe(120, [<metaitem:dustTitanium>], [null]).remove();
//
//
////Yttrium [tier 4]
//blast_furnace.findRecipe(120, [<metaitem:dustYttrium>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustYttrium>]).outputs([<metaitem:ingotHotYttrium>]).property("temperature", 2100).duration(800).EUt(480).buildAndRegister();

//Tungstencarbide [tier 5]
//blast_furnace.findRecipe(120, [<metaitem:dustTungstenCarbide>], [null]).remove();	
//blast_furnace.findRecipe(480, [<metaitem:ingotTungsten>,<metaitem:dustCarbon>], [null]).remove();
//blast_furnace.recipeBuilder()
//	.inputs([<metaitem:ingotTungsten>,<metaitem:dustCarbon>])
//	.outputs([<metaitem:ingotHotTungstenCarbide> * 2])
//	.property("temperature", 2700)
//	.duration(500).EUt(480).buildAndRegister();	
//furnace.addRecipe(<metaitem:ingotTungstenCarbide>, <metaitem:dustTungstenCarbide>, 0.0);
//
////Tungstensteel [tier 5]
//blast_furnace.findRecipe(120, [<metaitem:dustTungstenSteel>], [null]).remove();	
//blast_furnace.findRecipe(480, [<metaitem:ingotTungsten>,<metaitem:ingotSteel>], [null]).remove();
//furnace.addRecipe(<metaitem:ingotTungstenSteel>, <metaitem:dustTungstenSteel>, 0.0);
//blast_furnace.recipeBuilder().inputs([<metaitem:ingotTungsten>,<metaitem:ingotSteel>]).outputs([<metaitem:ingotHotTungstenSteel> * 2]).property("temperature", 2700).duration(1000).EUt(480).buildAndRegister();	
//
////Glowstone Doped Silicon Boule [tier 5]
//blast_furnace.findRecipe(480, [<metaitem:dustSilicon> * 64, <minecraft:glowstone_dust> * 8, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:nitrogen> * 8000]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustSilicon> * 64, <minecraft:glowstone_dust> * 8]).fluidInputs([<liquid:argon> * 8000]).outputs([<metaitem:boule.glowstone>]).property("temperature", 2700).duration(3000).EUt(480).buildAndRegister();
//
////Tungsten [tier 6]
//blast_furnace.findRecipe(120, [<metaitem:dustTungsten>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustTungsten>]).outputs([<metaitem:ingotHotTungsten>]).property("temperature", 3000).duration(600).EUt(480).buildAndRegister();	
//
////Niobium [tier 6]
//blast_furnace.findRecipe(120, [<metaitem:dustNiobium>], [null]).remove();	
//blast_furnace.recipeBuilder().inputs([<metaitem:dustNiobium>]).outputs([<metaitem:ingotHotNiobium>]).property("temperature", 3000).duration(600).EUt(480).buildAndRegister();	

//Signalum [tier 8]
recipes.removeByRecipeName("thermalfoundation:dust_signalum");
recipes.addShapeless(<metaitem:dustSignalum> * 4, [
	<metaitem:dustAnnealedCopper>,<metaitem:dustAnnealedCopper>,<metaitem:dustAnnealedCopper>,
	<metaitem:dustAnnealedCopper>,<metaitem:dustArdite>,<metaitem:dustArdite>,
	<metaitem:dustRedAlloy>,<metaitem:dustRedAlloy>,<thermalfoundation:material:893>]);
blast_furnace.recipeBuilder().inputs([<ore:dustSignalum>]).fluidInputs([<liquid:mana>*250]).outputs([<metaitem:ingotHotSignalum>]).property("temperature", 4000).duration(12800).EUt(120).buildAndRegister();

// Signalum Ingot * 1
<recipemap:vacuum_freezer>.findRecipe(120, [<metaitem:ingotHotSignalum>], null).remove();
vacuum_freezer.recipeBuilder()
	.inputs(<metaitem:ingotHotSignalum>)
	.outputs(<metaitem:ingotSignalum>)
	.duration(195)
	.EUt(120)
	.buildAndRegister();

//Vanadium-Gallium [tier 8]
//blast_furnace.findRecipe(480, [<metaitem:ingotVanadium> * 3, <metaitem:ingotGallium>], [null]).remove();
//blast_furnace.findRecipe(120, [<metaitem:dustVanadiumGallium>], [null]).remove();
//furnace.addRecipe(<metaitem:ingotVanadiumGallium>, <metaitem:dustVanadiumGallium>, 0.0);		
//blast_furnace.recipeBuilder().inputs([<metaitem:ingotVanadium> * 3, <metaitem:ingotGallium>]).outputs([<metaitem:ingotHotVanadiumGallium> * 4]).property("temperature", 4000).duration(10000).EUt(120).buildAndRegister();
	
//Lumium [tier 9]
recipes.removeByRecipeName("thermalfoundation:dust_lumium");
blast_furnace.recipeBuilder().inputs([<ore:dustLumium>]).fluidInputs([<liquid:mana>*250]).outputs([<metaitem:ingotHotLumium>]).property("temperature", 4500).duration(14400).EUt(120).buildAndRegister();
recipes.addShapeless(<metaitem:dustLumium> * 4, [
	<metaitem:dustTinAlloy>, <metaitem:dustTinAlloy>, <metaitem:dustTinAlloy>, 
	<metaitem:dustTinAlloy>, <metaitem:dustSterlingSilver>, <metaitem:dustSterlingSilver>,
	<extendedcrafting:material:7>,<extendedcrafting:material:7>,<thermalfoundation:material:894>]);

// Lumium Ingot * 1
<recipemap:vacuum_freezer>.findRecipe(120, [<metaitem:ingotHotLumium>], null).remove();
vacuum_freezer.recipeBuilder()
	.inputs(<metaitem:ingotHotLumium>)
	.outputs(<metaitem:ingotLumium>)
	.duration(270)
	.EUt(120)
	.buildAndRegister();

//Niobium-Titanium [tier 9]
//blast_furnace.findRecipe(480, [<metaitem:ingotNiobium>,<metaitem:ingotTitanium>], [null]).remove();
//blast_furnace.findRecipe(120, [<metaitem:dustNiobiumTitanium>], [null]).remove();	
//furnace.addRecipe(<metaitem:ingotNiobiumTitanium>, <metaitem:dustNiobiumTitanium>, 0.0);
//blast_furnace.recipeBuilder().inputs([<metaitem:ingotNiobium>,<metaitem:ingotTitanium>]).outputs([<metaitem:ingotHotNiobiumTitanium> * 2]).property("temperature", 4500).duration(7000).EUt(120).buildAndRegister();	

//Naquadah [tier 11]
//blast_furnace.findRecipe(120, [<metaitem:dustNaquadah>], [null]).remove();	
//blast_furnace.recipeBuilder()
//	.inputs(<metaitem:dustNaquadah>)
//	.outputs(<metaitem:ingotHotNaquadah>)
//	.property("temperature", 5400)
//	.EUt(1920).duration(200).buildAndRegister();

//Naquadah Doped Boule [tier 11]
//blast_furnace.findRecipe(1920, [<gregtech:meta_block_compressed_3:13> * 9, <metaitem:ingotNaquadah>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:argon> * 8000]).remove();	
//blast_furnace.recipeBuilder().inputs([<gregtech:meta_block_compressed_3:13> * 9, <metaitem:ingotNaquadah>]).fluidInputs([<liquid:argon> * 16000]).outputs([<metaitem:boule.naquadah>]).property("temperature", 5400).duration(1440).EUt(8000).buildAndRegister();
	
//Osiridium [tier 12]		DISABLED IN FAVOR OF VANILLA RECIPE
//blast_furnace.findRecipe(1920, [<metaitem:ingotIridium> * 3, <metaitem:ingotOsmium>], [<liquid:helium>*1000]).remove();
//blast_furnace.findRecipe(120, [<metaitem:dustOsmiridium>], [null]).remove();		
//furnace.addRecipe(<metaitem:ingotOsmiridium>, <metaitem:dustOsmiridium>, 0.0);
//blast_furnace.recipeBuilder().inputs([<metaitem:ingotIridium> * 3, <metaitem:ingotOsmium>]).fluidInputs([<liquid:helium>*1000]).outputs([<metaitem:ingotHotOsmiridium> * 4]).property("temperature", 6000).duration(4400).EUt(8000).buildAndRegister();	
	
//Enderium [tier 13]
recipes.removeByRecipeName("thermalfoundation:dust_enderium");
recipes.addShapeless(<thermalfoundation:material:103> * 4, [
	<metaitem:dustLead>,<metaitem:dustLead>,<metaitem:dustLead>,
	<metaitem:dustLead>,<metaitem:dustPlatinum>,<metaitem:dustPlatinum>,
	<metaitem:dustBlueSteel>,<ore:dustOsmium>,<thermalfoundation:material:895>]);
blast_furnace.recipeBuilder().inputs([<thermalfoundation:material:103>]).fluidInputs([<liquid:mana>*250]).outputs([<metaitem:ingotHotEnderium>]).property("temperature", 6400).duration(20800).EUt(120).buildAndRegister();

// Enderium Ingot * 1
<recipemap:vacuum_freezer>.findRecipe(120, [<metaitem:ingotHotEnderium>], null).remove();
vacuum_freezer.recipeBuilder()
	.inputs(<metaitem:ingotHotEnderium>)
	.outputs(<metaitem:ingotEnderium>)
	.duration(555)
	.EUt(120)
	.buildAndRegister();
//Draconium [tier 14]
blast_furnace.recipeBuilder().inputs([<metaitem:dustDraconium>]).fluidInputs([<liquid:nitro_fuel>*2000]).outputs(<metaitem:ingotHotDraconium>).property("temperature", 6800).duration(10000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:nitro_fuel>*8000]).outputs([<metaitem:ingotHotDraconium> * 2]).property("temperature", 6800).duration(20000).EUt(120).buildAndRegister();

//Naquadah Alloy [tier 15]		DISABLED IN FAVOR OF VANILLA RECIPE
//blast_furnace.findRecipe(120, [<metaitem:dustNaquadahAlloy>], [null]).remove();		
//furnace.addRecipe(<metaitem:ingotNaquadahAlloy>, <metaitem:dustNaquadahAlloy>, 0.0);

//Dark Soularium [tier 18]
blast_furnace.recipeBuilder().inputs([<enderio:item_alloy_ingot:6>,<enderio:item_alloy_ingot:7>]).fluidInputs([<liquid:tritium>*1000]).outputs([<simplyjetpacks:metaitemmods:3>]).property("temperature", 8600).duration(1200).EUt(32000).buildAndRegister();

// Quantum Fluxed Eternium [tier 19]
blast_furnace.recipeBuilder()
	.inputs([
		<redstonearsenal:material:224> * 10,
		<ore:plateAwakenedDraconium>,
		<contenttweaker:quantumflux> * 16
	])
	.fluidInputs([<liquid:krypton> * 1000])
	.outputs(<contenttweaker:quantumfluxedeterniumplating>)
	.property("temperature", 9000)
	.duration(200)
	.EUt(250000)
	.buildAndRegister();

//Fluxed Electrum
blast_furnace.recipeBuilder().inputs([<redstonearsenal:material>]).outputs([<redstonearsenal:material:32>]).property("temperature", 1000).duration(300).EUt(120).buildAndRegister();



//EnderIO Alloys
alloy_smelter.recipeBuilder().inputs([<minecraft:iron_ingot>,<minecraft:redstone>]).outputs([<metaitem:ingotConductiveIron>]).duration(150).EUt(16).buildAndRegister();
alloy_smelter.recipeBuilder().inputs([<minecraft:iron_ingot>,<ore:dustPulsating>]).outputs([<metaitem:ingotPulsatingIron>]).duration(150).EUt(16).buildAndRegister();


//Removed
//blast_furnace.findRecipe(120, [<metaitem:dustNaquadria>], [null]).remove();		//Naquadriah
//furnace.addRecipe(<metaitem:ingotNaquadria>, <metaitem:dustNaquadria>, 0.0);



