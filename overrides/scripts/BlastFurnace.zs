import mods.gregtech.recipe.RecipeMap;

//Removed From Furnace Smelting
furnace.remove(<ore:ingotIridium>);
furnace.remove(<ore:ingotTungsten>);
furnace.remove(<ore:ingotBlackSteel>);
furnace.remove(<ore:ingotAluminium>);
furnace.remove(<thermalfoundation:material:132>);
furnace.remove(<thermalfoundation:ore:4>);
furnace.remove(<ore:gemQuartzBlack>);
furnace.remove(<ore:ingotDraconium>);
furnace.remove(<ore:ingotMithril>);
furnace.remove(<appliedenergistics2:material:5>);
furnace.remove(<metaitem:nomilabs:ingotEnderium>, <metaitem:nomilabs:dustEnderium>);
furnace.remove(<metaitem:nomilabs:ingotLumium>, <metaitem:nomilabs:dustLumium>);
furnace.remove(<metaitem:nomilabs:ingotSignalum>, <metaitem:nomilabs:dustSignalum>);

// Tough Alloy [tier 0]
alloy_blast_smelter.recipeBuilder()
	.inputs([<ore:dustSteel> * 1, <ore:dustBoron> * 1, <ore:dustLithium> * 2])
	.circuit(3)
	.fluidOutputs([<liquid:tough_alloy> * 576])
	.property("temperature", 1000)
	.duration(300)
	.EUt(120)
	.buildAndRegister();

alloy_blast_smelter.recipeBuilder()
	.inputs([<ore:dustSteel> * 1, <ore:dustBoron> * 1, <ore:dustLithium> * 2])
	.fluidInputs([<liquid:nitrogen> * 4000])
	.circuit(13)
	.fluidOutputs([<liquid:tough_alloy> * 576])
	.property("temperature", 1000)
	.duration(200)
	.EUt(120)
	.buildAndRegister();

fluid_solidifier.recipeBuilder().fluidInputs(<liquid:tough_alloy> * 144).notConsumable(<metaitem:shape.mold.ingot>).outputs(<nuclearcraft:alloy:1>).duration(20).EUt(7).buildAndRegister();

//Black Steel [tier 1]
// Reduces the Duration from ~76s to ~10s
// Black Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustBlackSteel>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Black Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustBlackSteel>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder()
	.inputs([<metaitem:dustBlackSteel>])
	.circuit(1)
	.outputs([<metaitem:ingotBlackSteel>])
	.property("temperature", 1200)
	.duration(200).EUt(120).buildAndRegister();

blast_furnace.recipeBuilder()
	.inputs([<metaitem:dustBlackSteel>])
	.circuit(2)
	.fluidInputs([<liquid:nitrogen> * 1000])
	.outputs([<metaitem:ingotBlackSteel>])
	.property("temperature", 1200)
	.duration(135).EUt(120).buildAndRegister();

//Aluminium [tier 2]
// Reduces the Duration from ~45s to ~20s
// Aluminium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Aluminium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder()
	.inputs([<metaitem:dustAluminium>])
	.outputs([<metaitem:ingotAluminium>])
	.circuit(1)
	.property("temperature", 1700)
	.duration(400).EUt(120)
	.buildAndRegister();

blast_furnace.recipeBuilder()
	.inputs([<metaitem:dustAluminium>])
	.fluidInputs(<liquid:nitrogen> * 1000)
	.circuit(2)
	.outputs([<metaitem:ingotAluminium>])
	.property("temperature", 1700)
	.duration(270).EUt(120)
	.buildAndRegister();


//Energetic Alloy [tier 2]
mixer.recipeBuilder()
	.inputs([<ore:dustGold> * 2, <ore:dustRedstone>, <ore:dustGlowstone>])
	.outputs(<metaitem:nomilabs:dustEnergeticAlloy> * 2)
	.duration(140)
	.EUt(30)
	.buildAndRegister();

//Vibrant Alloy [tier 3]
mixer.recipeBuilder()
	.inputs([<ore:dustEnergeticAlloy>, <ore:dustEnderPearl>])
	.outputs(<metaitem:nomilabs:dustVibrantAlloy>)
	.duration(260)
	.EUt(30)
	.buildAndRegister();

//Microversium [tier 3]
// Conflicts with Steel EBF Recipe
//blast_furnace.recipeBuilder().inputs([<metaitem:dustSteel> * 2,<ore:dustRedstone>, <ore:dustGlowstone>]).fluidInputs([<liquid:deuterium>*100]).outputs([<ore:ingotMicroversium>.firstItem * 2]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:ingotSteel> * 2,<ore:dustRedstone>, <ore:dustGlowstone>]).fluidInputs([<liquid:deuterium>*100]).outputs([<ore:ingotMicroversium>.firstItem * 2]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();

//Signalum [tier 8]
recipes.removeByRecipeName("thermalfoundation:dust_signalum");
mixer.recipeBuilder()
	.inputs([<metaitem:dustAnnealedCopper> * 4,<metaitem:nomilabs:dustArdite> * 2,<metaitem:dustRedAlloy> * 2,<thermalfoundation:material:893>])
	.fluidInputs(<liquid:mana> * 1000)
	.outputs(<metaitem:nomilabs:dustSignalum> * 4)
	.duration(300)
	.EUt(1920)
	.buildAndRegister();

// ABS Recipe Changes moved to Groovy.

//Lumium [tier 9]
recipes.removeByRecipeName("thermalfoundation:dust_lumium");
mixer.recipeBuilder()
	.inputs([<metaitem:dustTinAlloy> * 4, <metaitem:dustSterlingSilver> * 2,<extendedcrafting:material:7> * 2,<thermalfoundation:material:894>])
	.fluidInputs(<liquid:mana> * 1000)
	.outputs(<metaitem:nomilabs:dustLumium> * 4)
	.duration(300)
	.EUt(1920)
	.buildAndRegister();

// ABS Recipe Changes moved to Groovy.

//Enderium [tier 13]
recipes.removeByRecipeName("thermalfoundation:dust_enderium");
mixer.recipeBuilder()
	.inputs([<metaitem:dustLead> * 4,<metaitem:dustPlatinum> * 2,<metaitem:dustBlueSteel>,<ore:dustOsmium>,<thermalfoundation:material:895>])
	.fluidInputs(<liquid:mana> * 1000)
	.outputs(<metaitem:nomilabs:dustEnderium> * 4)
	.duration(300)
	.EUt(1920)
	.buildAndRegister();

// ABS Recipe Changes moved to Groovy.

//Dark Soularium [tier 18]
blast_furnace.recipeBuilder()
	.inputs([<ore:ingotSoularium>,<ore:ingotDarkSteel>])
	.fluidInputs([<liquid:tritium>*1000])
	.outputs([<simplyjetpacks:metaitemmods:3>]).property("temperature", 8600).duration(1200).EUt(32000).buildAndRegister();

// Quantum Fluxed Eternium [tier 19]
blast_furnace.recipeBuilder()
	.inputs([
		<redstonearsenal:material:224> * 10,
		<ore:plateAwakenedDraconium>,
		<nomilabs:quantumflux> * 16
	])
	.fluidInputs([<liquid:krypton> * 1000])
	.outputs(<nomilabs:quantumfluxedeterniumplating>)
	.property("temperature", 9000)
	.duration(200)
	.EUt(250000)
	.buildAndRegister();

//Fluxed Electrum (adds mana dust)
<recipemap:centrifuge>.findRecipe(30, [<metaitem:nomilabs:dustElectrumFlux> * 8], null).remove();

mixer.recipeBuilder()
	.inputs([<ore:dustElectrum> * 6, <ore:dustLumium>, <ore:dustSignalum>, <ore:dustMana>])
	.outputs([<metaitem:nomilabs:dustElectrumFlux> * 9])
	.duration(1000)
	.EUt(120)
	.buildAndRegister();

// Fluxed Electrum ABS Recipes (Groovy)

/* Custom Alloys in ABS */

// TODO Refactor To Use Binary Alloy Generator

// Dark Steel
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustSteel>, <metaitem:dustObsidian>])
	.fluidOutputs(<liquid:dark_steel> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(180)
	.EUt(16)
	.buildAndRegister();

alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustSteel>, <actuallyadditions:item_crystal:3>])
	.fluidOutputs(<liquid:dark_steel> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(180)
	.EUt(16)
	.buildAndRegister();

// Electrical Steel
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustSteel>, <metaitem:dustSilicon>])
	.fluidOutputs(<liquid:electrical_steel> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(90)
	.EUt(16)
	.buildAndRegister();

// End Steel
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:nomilabs:dustDarkSteel>, <ore:dustEndstone>])
	.fluidOutputs(<liquid:end_steel> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(225)
	.EUt(120)
	.buildAndRegister();

// Soularium
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustGold>, <minecraft:soul_sand>])
	.fluidOutputs(<liquid:soularium> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(90)
	.EUt(16)
	.buildAndRegister();

// Conductive Iron
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustIron>, <minecraft:redstone>])
	.fluidOutputs(<liquid:conductive_iron> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(112)
	.EUt(16)
	.buildAndRegister();

// Pulsating Iron
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustIron>, <ore:dustPulsating>])
	.fluidOutputs(<liquid:pulsating_iron> * 144)
	.circuit(2)
	.property("temperature", 1200)
	.duration(112)
	.EUt(16)
	.buildAndRegister();
