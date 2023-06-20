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
// Black Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustBlackSteel>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Black Steel Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustBlackSteel>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder()
	.inputs([<metaitem:dustBlackSteel>])
	.circuit(1)
	.outputs([<metaitem:ingotBlackSteel>])
	.property("temperature", 1000)
	.duration(200).EUt(120).buildAndRegister();

blast_furnace.recipeBuilder()
	.inputs([<metaitem:dustBlackSteel>])
	.circuit(2)
	.fluidInputs([<liquid:nitrogen> * 1000])
	.outputs([<metaitem:ingotBlackSteel>])
	.property("temperature", 1000)
	.duration(135).EUt(120).buildAndRegister();

// Black Steel * 720
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustNickel>, <metaitem:dustBlackBronze>, <metaitem:dustSteel> * 3, <metaitem:circuit.integrated>.withTag({Configuration: 13})], [<liquid:nitrogen> * 5000]).remove();
// Black Steel * 720
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustNickel>, <metaitem:dustBlackBronze>, <metaitem:dustSteel> * 3, <metaitem:circuit.integrated>.withTag({Configuration: 3})], null).remove();

alloy_blast_smelter.recipeBuilder()
	.inputs([<ore:dustSteel> * 3,<ore:dustBlackBronze> * 2,<actuallyadditions:item_crystal:3> * 2,<extrautils2:ingredients:4>.withEmptyTag() * 2])
	.circuit(3)
	.fluidOutputs([<liquid:black_steel> * 1296])
	.property("temperature", 1000)
	.duration(2880)
	.EUt(120)
	.buildAndRegister();

alloy_blast_smelter.recipeBuilder()
	.inputs([<ore:dustSteel> * 3,<ore:dustBlackBronze> * 2,<actuallyadditions:item_crystal:3> * 2,<extrautils2:ingredients:4>.withEmptyTag() * 2])
	.fluidInputs([<liquid:nitrogen> * 9000])
	.circuit(13)
	.fluidOutputs([<liquid:black_steel> * 1296])
	.property("temperature", 1000)
	.duration(1929)
	.EUt(120)
	.buildAndRegister();

// Temporary Black Steel fix
alloy_blast_smelter.recipeBuilder()
	.inputs([<ore:dustSteel> * 3,<ore:dustBlackBronze> * 2, <contenttweaker:dark_red_coal> * 4])
	.circuit(3)
	.fluidOutputs([<liquid:black_steel> * 1296])
	.property("temperature", 1000)
	.duration(2880)
	.EUt(120)
	.buildAndRegister();

alloy_blast_smelter.recipeBuilder()
	.inputs([<ore:dustSteel> * 3,<ore:dustBlackBronze> * 2, <contenttweaker:dark_red_coal> * 4])
	.fluidInputs([<liquid:nitrogen> * 9000])
	.circuit(13)
	.fluidOutputs([<liquid:black_steel> * 1296])
	.property("temperature", 1000)
	.duration(1929)
	.EUt(120)
	.buildAndRegister();

//Aluminium [tier 2]
// Aluminium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:nitrogen> * 1000]).remove();
// Aluminium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustAluminium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:dustAluminium>]).outputs([<metaitem:ingotAluminium>]).circuit(1).property("temperature", 1500).duration(400).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:dustAluminium>]).fluidInputs(<liquid:nitrogen> * 1000).circuit(2).outputs([<metaitem:ingotAluminium>]).property("temperature", 1500).duration(270).EUt(120).buildAndRegister();


//Energetic Alloy [tier 2]
mixer.recipeBuilder()
	.inputs([<ore:dustGold> * 2, <ore:dustRedstone>, <ore:dustGlowstone>])
	.outputs(<metaitem:dustEnergeticAlloy> * 2)
	.duration(140)
	.EUt(30)
	.buildAndRegister();

//Vibrant Alloy [tier 3]
mixer.recipeBuilder()
	.inputs([<ore:dustEnergeticAlloy>, <ore:dustEnderPearl>])
	.outputs(<metaitem:dustVibrantAlloy>)
	.duration(260)
	.EUt(30)
	.buildAndRegister();

//Microversium [tier 3]
// Conficts with Steel EBF Recipe
//blast_furnace.recipeBuilder().inputs([<metaitem:dustSteel> * 2,<ore:dustRedstone>, <ore:dustGlowstone>]).fluidInputs([<liquid:deuterium>*100]).outputs([<ore:ingotMicroversium>.firstItem * 2]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<metaitem:ingotSteel> * 2,<ore:dustRedstone>, <ore:dustGlowstone>]).fluidInputs([<liquid:deuterium>*100]).outputs([<ore:ingotMicroversium>.firstItem * 2]).property("temperature", 1700).duration(600).EUt(120).buildAndRegister();

//Signalum [tier 8]
recipes.removeByRecipeName("thermalfoundation:dust_signalum");
mixer.recipeBuilder()
	.outputs(<metaitem:dustSignalum> * 4)
	.inputs([<metaitem:dustAnnealedCopper> * 4,<metaitem:dustArdite> * 2,<metaitem:dustRedAlloy> * 2,<thermalfoundation:material:893>])
	.fluidInputs(<liquid:mana> * 1000)
	.duration(300)
	.EUt(1920)
	.buildAndRegister();
// Molten Signalum * 1152
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustAnnealedCopper> * 4, <metaitem:dustArdite> * 2, <metaitem:dustRedAlloy> * 2, <metaitem:circuit.integrated>.withTag({Configuration: 13})], [<liquid:helium> * 800]).remove();
// Molten Signalum * 1152
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustAnnealedCopper> * 4, <metaitem:dustArdite> * 2, <metaitem:dustRedAlloy> * 2, <metaitem:circuit.integrated>.withTag({Configuration: 3})], null).remove();
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustAnnealedCopper> * 4, <metaitem:dustArdite> * 2, <metaitem:dustRedAlloy> * 2,<thermalfoundation:material:893>])
	.fluidInputs(<liquid:mana> * 1000)
	.circuit(4)
	.fluidOutputs(<liquid:molten.signalum> * 576)
	.property("temperature", 4000)
	.duration(51200)
	.EUt(120)
	.buildAndRegister();
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustAnnealedCopper> * 4, <metaitem:dustArdite> * 2, <metaitem:dustRedAlloy> * 2,<thermalfoundation:material:893>])
	.fluidInputs([<liquid:mana> * 1000, <liquid:helium> * 400])
	.circuit(14)
	.fluidOutputs(<liquid:molten.signalum> * 576)
	.property("temperature", 4000)
	.duration(34133)
	.EUt(120)
	.buildAndRegister();

//Lumium [tier 9]
recipes.removeByRecipeName("thermalfoundation:dust_lumium");
mixer.recipeBuilder()
	.outputs(<metaitem:dustLumium> * 4)
	.fluidInputs(<liquid:mana> * 1000)
	.inputs([<metaitem:dustTinAlloy> * 4, <metaitem:dustSterlingSilver> * 2,<extendedcrafting:material:7> * 2,<thermalfoundation:material:894>])
	.duration(300)
	.EUt(1920)
	.buildAndRegister();
// Molten Lumium * 864
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustTinAlloy> * 4, <metaitem:dustSterlingSilver> * 2, <metaitem:circuit.integrated>.withTag({Configuration: 12})], [<liquid:helium> * 600]).remove();
// Molten Lumium * 864
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustTinAlloy> * 4, <metaitem:dustSterlingSilver> * 2, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();

alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustTinAlloy> * 4, <metaitem:dustSterlingSilver> * 2,<extendedcrafting:material:7> * 2,<thermalfoundation:material:894>])
	.fluidInputs(<liquid:mana> * 1000)
	.circuit(4)
	.fluidOutputs(<liquid:molten.lumium> * 576)
	.property("temperature", 4500)
	.duration(57600)
	.EUt(120)
	.buildAndRegister();

alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustTinAlloy> * 4, <metaitem:dustSterlingSilver> * 2,<extendedcrafting:material:7> * 2,<thermalfoundation:material:894>])
	.fluidInputs([<liquid:mana> * 1000, <liquid:helium> * 400])
	.circuit(14)
	.fluidOutputs(<liquid:molten.lumium> * 576)
	.property("temperature", 4500)
	.duration(38400)
	.EUt(120)
	.buildAndRegister();

//Enderium [tier 13]
recipes.removeByRecipeName("thermalfoundation:dust_enderium");
mixer.recipeBuilder()
	.outputs(<metaitem:dustEnderium> * 4)
	.fluidInputs(<liquid:mana> * 1000)
	.inputs([<metaitem:dustLead> * 4,<metaitem:dustPlatinum> * 2,<metaitem:dustBlueSteel>,<ore:dustOsmium>,<thermalfoundation:material:895>])
	.duration(300)
	.EUt(1920)
	.buildAndRegister();

// Molten Enderium * 1152
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustLead> * 4, <metaitem:dustPlatinum> * 2, <metaitem:dustBlueSteel>, <metaitem:dustOsmium>, <metaitem:circuit.integrated>.withTag({Configuration: 14})], [<liquid:krypton> * 80]).remove();
// Molten Enderium * 1152
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustLead> * 4, <metaitem:dustPlatinum> * 2, <metaitem:dustBlueSteel>, <metaitem:dustOsmium>, <metaitem:circuit.integrated>.withTag({Configuration: 4})], null).remove();
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustLead> * 4,<metaitem:dustPlatinum> * 2,<metaitem:dustBlueSteel>,<ore:dustOsmium>,<thermalfoundation:material:895>])
	.fluidInputs(<liquid:mana> * 1000)
	.circuit(5)
	.fluidOutputs(<liquid:molten.enderium> * 576)
	.property("temperature", 6400)
	.duration(83200)
	.EUt(120)
	.buildAndRegister();
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustLead> * 4,<metaitem:dustPlatinum> * 2,<metaitem:dustBlueSteel>,<ore:dustOsmium>,<thermalfoundation:material:895>])
	.fluidInputs([<liquid:mana> * 1000, <liquid:krypton> * 40])
	.circuit(15)
	.fluidOutputs(<liquid:molten.enderium> * 576)
	.property("temperature", 6400)
	.duration(55467)
	.EUt(120)
	.buildAndRegister();

//Dark Soularium [tier 18]
blast_furnace.recipeBuilder().inputs([<ore:ingotSoularium>,<ore:ingotDarkSteel>]).fluidInputs([<liquid:tritium>*1000]).outputs([<simplyjetpacks:metaitemmods:3>]).property("temperature", 8600).duration(1200).EUt(32000).buildAndRegister();

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
mixer.recipeBuilder()
	.inputs([<ore:dustElectrum> * 6, <ore:dustLumium>, <ore:dustSignalum>, <ore:dustMana>])
	.outputs([<metaitem:dustElectrumFlux> * 9])
	.duration(1000)
	.EUt(120)
	.buildAndRegister();

// Electrum Dust * 6
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustElectrumFlux> * 8], null).remove();


// Fluxed Electrum * 1152
<recipemap:alloy_blast_smelter>.findRecipe(120, [<metaitem:dustElectrum> * 6, <metaitem:dustLumium>, <metaitem:dustSignalum>, <metaitem:circuit.integrated>.withTag({Configuration: 3})], null).remove();
alloy_blast_smelter.recipeBuilder()
	.inputs([<metaitem:dustElectrum> * 6, <metaitem:dustLumium>, <metaitem:dustSignalum>, <ore:dustMana>])
	.fluidOutputs(<liquid:electrum_flux> * 1296)
	.circuit(4)
	.property("temperature", 1100)
	.duration(9000)
	.EUt(120)
	.buildAndRegister();

/* Custom Alloys in ABS */

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
	.inputs([<metaitem:dustDarkSteel>, <ore:dustEndstone>])
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
