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
    
// Phthalic Anhydride
// Phthalic Acid * 2500
<recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:dustTinyPotassium>], [<liquid:naphthalene> * 2000, <liquid:sulfuric_acid> * 1000]).remove();
// Phthalic Acid * 22500
<recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:dustPotassium>], [<liquid:naphthalene> * 18000, <liquid:sulfuric_acid> * 9000]).remove();

chemical_reactor.recipeBuilder() 
    .fluidInputs(<liquid:naphthalene> * 1000, <liquid:oxygen> * 5000)
    .inputs(<metaitem:dustTinyVanadiumPentoxide>)
    .outputs(<metaitem:dustPhthalicAnhydride> * 15)
    .fluidOutputs(<liquid:carbon_dioxide> * 1000)
    .duration(125).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder() 
    .fluidInputs(<liquid:naphthalene> * 9000, <liquid:oxygen> * 45000)
    .inputs(<metaitem:dustVanadiumPentoxide>)
    .outputs(<metaitem:dustPhthalicAnhydride> * 64, <metaitem:dustPhthalicAnhydride> * 64, <metaitem:dustPhthalicAnhydride> * 7)
    .fluidOutputs(<liquid:carbon_dioxide> * 9000)
    .duration(1125).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustPhthalicAnhydride> * 15)
    .fluidInputs(<liquid:water> * 1000)
    .fluidOutputs(<liquid:phthalic_acid> * 1000)
    .duration(100).EUt(30).buildAndRegister();

distillery.recipeBuilder()
    .fluidInputs(<liquid:phthalic_acid> * 1000)
    .circuit(1)
    .outputs(<metaitem:dustPhthalicAnhydride> * 15)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(100).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:tetrafluoroethylene> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:polytetrafluoroethylene> * 4320)
    .duration(800).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:vinyl_chloride> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:polyvinyl_chloride> * 4320)
    .duration(800).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:ethylene> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:plastic> * 4320)
    .duration(800).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:vinyl_acetate> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:polyvinyl_acetate> * 4320)
    .duration(800).EUt(30).buildAndRegister();

// Hydrazine Rocket Fuel
mixer.recipeBuilder()
    .fluidInputs(<liquid:hydrazine> * 1000, <liquid:dimethylhydrazine> * 1000)
    .fluidOutputs(<liquid:rocket_fuel> * 9000)
    .duration(60).EUt(16).buildAndRegister();

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

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustPyromorphite> * 6, <minecraft:sand> * 9, <metaitem:gemCoke> * 5)
    .outputs(<metaitem:dustPhosphorus> * 2, <metaitem:dustLeadMetasilicate> * 15, <metaitem:dustCalciumChloride>)
    .fluidOutputs(<liquid:carbon_monoxide> * 8000)
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

// H2SO4 require V2O5
// Sulfur Trioxide * 1000
<recipemap:chemical_reactor>.findRecipe(7, null, [<liquid:sulfur_dioxide> * 1000, <liquid:oxygen> * 1000]).remove();
<recipemap:large_chemical_reactor>.findRecipe(7, null, [<liquid:sulfur_dioxide> * 1000, <liquid:oxygen> * 1000]).remove();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:sulfur_dioxide> * 1000, <liquid:oxygen> * 1000)
    .notConsumable(<metaitem:dustVanadiumPentoxide>)
    .fluidOutputs(<liquid:sulfur_trioxide> * 1000)
    .duration(200).EUt(7).buildAndRegister();

// Sulfuric Acid * 1000
<recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:dustSulfur>, <metaitem:circuit.integrated>.withTag({Configuration: 24})], [<liquid:water> * 4000]).remove();

large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustSulfur>)
    .notConsumable(<metaitem:dustVanadiumPentoxide>)
    .fluidInputs(<liquid:water> * 4000)
    .circuit(24)
    .fluidOutputs(<liquid:sulfuric_acid> * 1000)
    .duration(320).EUt(480).buildAndRegister();

// Fluoroantimonic Acid
// Fluoroantimonic Acid * 1000
<recipemap:chemical_reactor>.findRecipe(480, [<metaitem:dustAntimonyTrifluoride> * 4], [<liquid:hydrofluoric_acid> * 4000]).remove();
// Fluoroantimonic Acid * 1000
<recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:dustAntimonyTrifluoride> * 4], [<liquid:hydrofluoric_acid> * 4000]).remove();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustAntimonyTrifluoride> * 4)
    .fluidInputs(<liquid:fluorine> * 2000)
    .notConsumable(<thermalfoundation:material:1026>)
    .fluidOutputs(<liquid:antimony_pentafluoride> * 1000)
    .duration(150).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:antimony_pentafluoride> * 1000, <liquid:hydrofluoric_acid> * 2000)
    .notConsumable(<thermalfoundation:material:1027>)
    .fluidOutputs(<liquid:fluoroantimonic_acid> * 1000)
    .duration(150).EUt(480).buildAndRegister();

// Neocryolite
chemical_reactor.recipeBuilder()
    .inputs(<ore:dustNaquadah>, <metaitem:dustSodiumHydroxide> * 9)
    .outputs(<metaitem:dustNaquadahHydroxide> * 7, <metaitem:dustSodium> * 3)
    .duration(480).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<ore:dustCaesium>)
    .fluidInputs(<liquid:water> * 1000)
    .outputs(<metaitem:dustCaesiumHydroxide> * 3)
    .duration(5).EUt(7).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustCaesiumHydroxide> * 9, <metaitem:dustNaquadahHydroxide> * 3, <metaitem:dustSignalum>)
    .fluidInputs(<liquid:hydrofluoric_acid> * 6000)
    .fluidOutputs(<liquid:neocryolite> * 1000, <liquid:water> * 6000)
    .duration(250).EUt(7680).buildAndRegister();

// Naquadah
large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustSnowchestite> * 4)
    .fluidInputs(<liquid:petrotheum> * 3000)
    .fluidOutputs(<liquid:naquadah_oxide_petro_solution> * 3000)
    .outputs(<metaitem:dustPyromorphite>)
    .duration(100).EUt(3840).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:naquadah_oxide_petro_solution> * 1000)
    .inputs(<ore:dustAerotheum> * 4)
    .outputs(<ore:dustBasalz>.firstItem * 8)
    .fluidOutputs(<liquid:naquadah_oxide_aero_solution> * 1000)
    .duration(300).EUt(240).buildAndRegister();

distillery.recipeBuilder()
    .fluidInputs(<liquid:naquadah_oxide_aero_solution> * 1000)
    .circuit(1)
    .outputs(<metaitem:dustNaquadahOxide> * 5)
    .fluidOutputs(<liquid:aerotheum> * 1000)
    .duration(300).EUt(240).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustNaquadahOxide> * 5)
    .fluidInputs(<liquid:neocryolite> * 4000)
    .fluidOutputs(<liquid:hot_naquadah_oxide_neocryolite_solution> * 1000)
    .property("temperature", 4700)
    .duration(400).EUt(1920).buildAndRegister();

electrolyzer.recipeBuilder()
    .fluidInputs(<liquid:hot_naquadah_oxide_neocryolite_solution> * 1000)
    .notConsumable(<metaitem:stickRuthenium> * 2)
    .outputs(<metaitem:dustNaquadah> * 2)
    .fluidOutputs(<liquid:neocryolite> * 970, <liquid:oxygen> * 3000)
    .duration(750).EUt(7680).buildAndRegister();

chemical_bath.recipeBuilder()
    .fluidInputs(<liquid:aerotheum> * 250)
    .notConsumable(<nuclearcraft:block_ice>)
    .outputs(<ore:dustAerotheum>.firstItem)
    .duration(100).EUt(7).buildAndRegister();

