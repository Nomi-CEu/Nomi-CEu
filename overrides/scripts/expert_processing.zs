#packmode expert

// Tungsten
// Tungsten Dust * 1
<recipemap:electrolyzer>.findRecipe(960, [<metaitem:dustTungsticAcid> * 7], null).remove();

extractor.recipeBuilder()
    .inputs(<metaitem:dustTungsticAcid> * 7)
    .outputs(<metaitem:dustTungstenTrioxide> * 4)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(160).EUt(16).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustTungstenTrioxide> * 8, <metaitem:dustCarbon> * 3)
    .outputs(<metaitem:ingotHotTungsten> * 2)
    .fluidOutputs(<liquid:carbon_dioxide> * 3000)
    .property("temperature", 3600)
    .duration(2400).EUt(1920).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustTungstenTrioxide> * 4)
    .fluidInputs(<liquid:hydrogen> * 6000)
    .outputs(<metaitem:dustTungsten>)
    .fluidOutputs(<liquid:water> * 3000)
    .duration(210).EUt(960).buildAndRegister();

// Graphene 
// Graphene Dust * 1
<recipemap:mixer>.findRecipe(480, [<metaitem:dustGraphite>, <metaitem:dustSilicon>, <metaitem:dustCarbon> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

assembler.recipeBuilder()
    .inputs(<metaitem:ringBerylliumOxide> * 64, <metaitem:ringBerylliumOxide> * 64, <metaitem:plateHslaSteel> * 6, <metaitem:circuit.vacuum_tube>)
    .outputs(<contenttweaker:magnetron>)
    .duration(600).EUt(61440).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustGraphite>)
    .notConsumable(<contenttweaker:magnetron>)
    .fluidInputs(<liquid:nitration_mixture> * 2000)
    .outputs(<metaitem:dustGraphene>)
    .fluidOutputs(<liquid:diluted_sulfuric_acid> * 1000, <liquid:nitric_acid> * 1000)
    .duration(100).EUt(480).buildAndRegister();

// Hydrogen Peroxide
chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustPhthalicAnhydride> * 15)
    .fluidInputs(<liquid:ethylbenzene> * 1000)
    .outputs(<metaitem:dustEthylanthraquinone> * 30)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(1000).EUt(1920).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:hydrogen> * 6000, <liquid:oxygen> * 6000)
    .notConsumable(<metaitem:dustPalladium>, <metaitem:dustEthylanthraquinone>)
    .fluidOutputs(<liquid:hydrogen_peroxide> * 3000)
    .duration(440).EUt(1920).buildAndRegister();

// Hydrazine
large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:hydrogen_peroxide> * 1000, <liquid:ammonia> * 2000, <liquid:acetone> * 2000)
    .circuit(5)
    .fluidOutputs(<liquid:acetone_azine> * 1000, <liquid:water> * 4000)
    .duration(40).EUt(480).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:acetone_azine> * 1000, <liquid:water> * 2000, <liquid:sulfuric_acid> * 1000)
    .circuit(5)
    .fluidOutputs(<liquid:hydrazine> * 1000, <liquid:acetone> * 2000, <liquid:diluted_sulfuric_acid> * 1000)
    .duration(40).EUt(480).buildAndRegister();

// Graphene
mixer.recipeBuilder()
    .inputs(<metaitem:dustCarbon> * 5, <metaitem:dustSilicon>)
    .fluidInputs(<liquid:oxygen> * 1000)
    .outputs(<metaitem:dustGrapheneOxide>)
    .duration(100).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustGrapheneOxide>)
    .fluidInputs(<liquid:hydrazine> * 100, <liquid:argon> * 50)
    .outputs(<metaitem:dustGraphene>)
    .duration(100).EUt(480).buildAndRegister();

// Niobium/Tantalum
// Calcium Dust * 2
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustPyrochlore> * 11], null).remove();
// Manganese Dust * 1
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustTantalite> * 9], null).remove();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustPyrochlore> * 11)
    .fluidInputs(<liquid:hydrofluoric_acid> * 2000)
    .outputs(<metaitem:dustNiobiumPentoxide> * 7, <metaitem:dustTantalumPentoxide>, <metaitem:dustFluorite> * 6)
    .fluidOutputs(<liquid:water> * 2000)
    .duration(200).EUt(480).buildAndRegister();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustTantalite> * 9)
    .fluidInputs(<liquid:hydrofluoric_acid> * 2000)
    .outputs(<metaitem:dustTantalumPentoxide> * 7, <metaitem:dustNiobiumPentoxide>, <metaitem:dustManganeseDifluoride> * 6)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(200).EUt(480).buildAndRegister();

// Molybdenum
// Molybdenum Dust * 1
<recipemap:electrolyzer>.findRecipe(30, [<metaitem:dustMolybdenite> * 3], null).remove();
// Calcium Dust * 1
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustPowellite> * 6], null).remove();
// Lead Dust * 1
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustWulfenite> * 6], null).remove();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustPowellite> * 6)
    .fluidInputs(<liquid:hydrochloric_acid> * 2000)
    .outputs(<metaitem:dustMolybdenumTrioxide> * 4, <metaitem:dustCalciumChloride> * 3)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(200).EUt(480).buildAndRegister();
    
chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustWulfenite> * 6)
    .fluidInputs(<liquid:hydrochloric_acid> * 2000)
    .outputs(<metaitem:dustMolybdenumTrioxide> * 4, <metaitem:dustLeadChloride> * 3)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(200).EUt(480).buildAndRegister();

arc_furnace.recipeBuilder()
    .inputs(<metaitem:dustMolybdenite> * 3)
    .fluidInputs(<liquid:oxygen> * 7000)
    .outputs(<metaitem:dustMolybdenumTrioxide> * 4)
    .fluidOutputs(<liquid:sulfur_dioxide> * 2000)
    .duration(800).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustMolybdenumTrioxide> * 4)
    .fluidInputs(<liquid:hydrogen> * 6000)
    .outputs(<metaitem:dustMolybdenum>)
    .fluidOutputs(<liquid:water> * 3000)
    .duration(200).EUt(480).buildAndRegister();

// Phosphorus
// Calcium Dust * 5
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustApatite> * 9], null).remove();
// Calcium Dust * 3
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustTricalciumPhosphate> * 5], null).remove();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustApatite> * 6, <minecraft:sand> * 9, <metaitem:gemCoke> * 5)
    .outputs(<metaitem:dustPhosphorus> * 2, <metaitem:dustWollastonite> * 15, <metaitem:dustCalciumChloride>)
    .fluidOutputs(<liquid:carbon_monoxide> * 8000)
    .property("temperature", 1650)
    .duration(200).EUt(120).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustTricalciumPhosphate> * 5, <minecraft:sand> * 9, <metaitem:gemCoke> * 5)
    .outputs(<metaitem:dustPhosphorus> * 2, <metaitem:dustWollastonite> * 15)
    .fluidOutputs(<liquid:carbon_monoxide> * 5000)
    .property("temperature", 1650)
    .duration(200).EUt(120).buildAndRegister();

// Vanadium
// Magnetite Dust * 1
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustVanadiumMagnetite> * 2], null).remove();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:ammonia> * 1000, <liquid:hydrochloric_acid> * 1000)
    .circuit(5)
    .outputs(<metaitem:dustAmmoniumChloride> * 2)
    .duration(120).EUt(7).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustVanadiumMagnetite> * 6, <metaitem:dustSalt> * 6)
    .fluidInputs(<liquid:oxygen> * 8000)
    .outputs(<metaitem:dustSodiumMetavanadate> * 15)
    .fluidOutputs(<liquid:iron_iii_chloride> * 1000)
    .property("temperature", 1150)
    .duration(450).EUt(120).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustSodiumMetavanadate> * 5, <metaitem:dustAmmoniumChloride> * 2)
    .outputs(<metaitem:dustAmmoniumMetavanadate> * 9, <metaitem:dustSalt> * 2)
    .duration(150).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustAmmoniumMetavanadate> * 18)
    .circuit(1)
    .outputs(<metaitem:dustVanadiumPentoxide> * 7)
    .fluidOutputs(<liquid:ammonia> * 2000, <liquid:water> * 1000)
    .duration(300).EUt(30).buildAndRegister();
