#packmode expert

// Tungsten
// Tungsten Dust * 1
<recipemap:electrolyzer>.findRecipe(960, [<metaitem:dustTungsticAcid> * 7], null).remove();

extractor.recipeBuilder()
    .inputs(<metaitem:dustTungsticAcid> * 7)
    .outputs(<metaitem:nomilabs:dustTungstenTrioxide> * 4)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(160).EUt(16).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustTungstenTrioxide> * 8, <metaitem:dustCarbon> * 3)
    .outputs(<metaitem:ingotHotTungsten> * 2)
    .fluidOutputs(<liquid:carbon_dioxide> * 3000)
    .property("temperature", 3600)
    .duration(2400).EUt(1920).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustTungstenTrioxide> * 4)
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
    .inputs(<metaitem:nomilabs:dustTinyVanadiumPentoxide>)
    .outputs(<metaitem:nomilabs:dustPhthalicAnhydride> * 15)
    .fluidOutputs(<liquid:carbon_dioxide> * 1000)
    .duration(125).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder() 
    .fluidInputs(<liquid:naphthalene> * 9000, <liquid:oxygen> * 45000)
    .inputs(<metaitem:nomilabs:dustVanadiumPentoxide>)
    .outputs(<metaitem:nomilabs:dustPhthalicAnhydride> * 64, <metaitem:nomilabs:dustPhthalicAnhydride> * 64, <metaitem:nomilabs:dustPhthalicAnhydride> * 7)
    .fluidOutputs(<liquid:carbon_dioxide> * 9000)
    .duration(1125).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPhthalicAnhydride> * 15)
    .fluidInputs(<liquid:water> * 1000)
    .fluidOutputs(<liquid:phthalic_acid> * 1000)
    .duration(100).EUt(30).buildAndRegister();

distillery.recipeBuilder()
    .fluidInputs(<liquid:phthalic_acid> * 1000)
    .circuit(1)
    .outputs(<metaitem:nomilabs:dustPhthalicAnhydride> * 15)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(100).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:tetrafluoroethylene> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:nomilabs:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:polytetrafluoroethylene> * 4320)
    .duration(800).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:vinyl_chloride> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:nomilabs:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:polyvinyl_chloride> * 4320)
    .duration(800).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:ethylene> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:nomilabs:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:plastic> * 4320)
    .duration(800).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:vinyl_acetate> * 2160, <liquid:oxygen> * 7500)
    .inputs(<metaitem:nomilabs:dustPhthalicAnhydride>)
    .circuit(7)
    .fluidOutputs(<liquid:polyvinyl_acetate> * 4320)
    .duration(800).EUt(30).buildAndRegister();

// Recipe conflict
// Styrene * 1000
<recipemap:chemical_reactor>.findRecipe(30, null, [<liquid:ethylbenzene> * 1000]).remove();
chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:ethylbenzene> * 1000)
    .circuit(1)
    .fluidOutputs(<liquid:styrene> * 1000, <liquid:hydrogen> * 2000)
    .duration(30).EUt(30).buildAndRegister();

// Hydrazine Rocket Fuel
large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:hydrazine> * 1000, <liquid:dimethylhydrazine> * 1000, <liquid:dinitrogen_tetroxide> * 2000)
    .fluidOutputs(<liquid:rocket_fuel> * 18000)
    .duration(60).EUt(16).buildAndRegister();

// Beryllium Oxide
chemical_reactor.recipeBuilder()
    .inputs(<ore:dustBeryllium>)
    .fluidInputs(<liquid:oxygen> * 1000)
    .outputs(<metaitem:nomilabs:ingotBerylliumOxide>)
    .duration(640).EUt(30).buildAndRegister();

// Graphene 
// Graphene Dust * 1
<recipemap:mixer>.findRecipe(480, [<metaitem:dustGraphite>, <metaitem:dustSilicon>, <metaitem:dustCarbon> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

assembler.recipeBuilder()
    .inputs(<metaitem:nomilabs:ringBerylliumOxide> * 64, <metaitem:nomilabs:ringBerylliumOxide> * 64, <metaitem:plateHslaSteel> * 6, <metaitem:circuit.vacuum_tube>)
    .outputs(<nomilabs:magnetron>)
    .duration(600).EUt(61440).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustGraphite>)
    .notConsumable(<nomilabs:magnetron>)
    .fluidInputs(<liquid:nitration_mixture> * 2000)
    .outputs(<metaitem:dustGraphene>)
    .fluidOutputs(<liquid:diluted_sulfuric_acid> * 1000, <liquid:nitric_acid> * 1000)
    .duration(100).EUt(480).buildAndRegister();

// Hydrogen Peroxide
chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPhthalicAnhydride> * 15)
    .fluidInputs(<liquid:ethylbenzene> * 1000)
    .outputs(<metaitem:nomilabs:dustEthylanthraquinone> * 30)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(1000).EUt(1920).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:hydrogen> * 6000, <liquid:oxygen> * 6000)
    .notConsumable(<metaitem:dustPalladium>, <metaitem:nomilabs:dustEthylanthraquinone>)
    .fluidOutputs(<liquid:hydrogen_peroxide> * 3000)
    .duration(330).EUt(180).buildAndRegister();

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
    .outputs(<metaitem:nomilabs:dustGrapheneOxide>)
    .duration(100).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustGrapheneOxide>)
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
    .outputs(<metaitem:nomilabs:dustNiobiumPentoxide> * 7, <metaitem:nomilabs:dustTantalumPentoxide>, <metaitem:nomilabs:dustFluorite> * 6)
    .fluidOutputs(<liquid:water> * 2000)
    .duration(200).EUt(480).buildAndRegister();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustTantalite> * 9)
    .fluidInputs(<liquid:hydrofluoric_acid> * 2000)
    .outputs(<metaitem:nomilabs:dustTantalumPentoxide> * 7, <metaitem:nomilabs:dustNiobiumPentoxide>, <metaitem:nomilabs:dustManganeseDifluoride> * 6)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(200).EUt(480).buildAndRegister();

// Molybdenum
furnace.remove(<metaitem:ingotMolybdenum>);
furnace.addRecipe(<metaitem:ingotMolybdenum>, <metaitem:dustMolybdenum>);
// Molybdenum Dust * 1
<recipemap:electrolyzer>.findRecipe(30, [<metaitem:dustMolybdenite> * 3], null).remove();
// Calcium Dust * 1
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustPowellite> * 6], null).remove();
// Lead Dust * 1
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustWulfenite> * 6], null).remove();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustPowellite> * 6)
    .fluidInputs(<liquid:hydrochloric_acid> * 2000)
    .outputs(<metaitem:nomilabs:dustMolybdenumTrioxide> * 4, <metaitem:dustCalciumChloride> * 3)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(200).EUt(480).buildAndRegister();
    
chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustWulfenite> * 6)
    .fluidInputs(<liquid:hydrochloric_acid> * 2000)
    .outputs(<metaitem:nomilabs:dustMolybdenumTrioxide> * 4, <metaitem:nomilabs:dustLeadChloride> * 3)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(200).EUt(480).buildAndRegister();

arc_furnace.recipeBuilder()
    .inputs(<metaitem:dustMolybdenite> * 3)
    .fluidInputs(<liquid:oxygen> * 7000)
    .outputs(<metaitem:nomilabs:dustMolybdenumTrioxide> * 4)
    .fluidOutputs(<liquid:sulfur_dioxide> * 2000)
    .duration(800).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustMolybdenumTrioxide> * 4)
    .fluidInputs(<liquid:hydrogen> * 6000)
    .outputs(<metaitem:dustMolybdenum>)
    .fluidOutputs(<liquid:water> * 3000)
    .duration(200).EUt(480).buildAndRegister();

// Phosphorus

/* Old Expert Phosphorous (removed in 1.5.2)
// Calcium Dust * 5
<recipemap:electrolyzer>.findRecipe(60, [<metaitem:dustApatite> * 9], null).remove();
// Calcium Dust * 3
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustTricalciumPhosphate> * 5], null).remove();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustApatite> * 6, <minecraft:sand> * 9, <metaitem:gemCoke> * 5)
    .outputs(<metaitem:dustPhosphorus> * 2, <metaitem:nomilabs:dustWollastonite> * 15, <metaitem:dustCalciumChloride>)
    .fluidOutputs(<liquid:carbon_monoxide> * 8000)
    .property("temperature", 1650)
    .duration(200).EUt(120).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:dustTricalciumPhosphate> * 5, <minecraft:sand> * 9, <metaitem:gemCoke> * 5)
    .outputs(<metaitem:dustPhosphorus> * 2, <metaitem:nomilabs:dustWollastonite> * 15)
    .fluidOutputs(<liquid:carbon_monoxide> * 5000)
    .property("temperature", 1650)
    .duration(200).EUt(120).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPyromorphite> * 6, <minecraft:sand> * 9, <metaitem:gemCoke> * 5)
    .outputs(<metaitem:dustPhosphorus> * 2, <metaitem:nomilabs:dustLeadMetasilicate> * 15, <metaitem:dustCalciumChloride>)
    .fluidOutputs(<liquid:carbon_monoxide> * 8000)
    .property("temperature", 1650)
    .duration(200).EUt(120).buildAndRegister();
*/

// Add recipe from pyromorphite to phosphate, similar to apatite recipe
electrolyzer.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPyromorphite> * 9)
    .outputs(<metaitem:dustLead> * 5, <metaitem:dustPhosphate> * 3)
    .fluidOutputs(<liquid:chlorine> * 1000)
    .duration(288).EUt(60).buildAndRegister();

// Vanadium
//// Magnetite Dust * 1
//<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustVanadiumMagnetite> * 2], null).remove();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:ammonia> * 1000, <liquid:hydrochloric_acid> * 1000)
    .circuit(5)
    .outputs(<metaitem:dustAmmoniumChloride> * 2)
    .duration(120).EUt(7).buildAndRegister();

//blast_furnace.recipeBuilder()
//    .inputs(<metaitem:dustVanadiumMagnetite> * 6, <metaitem:dustSalt> * 6)
//    .fluidInputs(<liquid:oxygen> * 8000)
//    .outputs(<metaitem:nomilabs:dustSodiumMetavanadate> * 15)
//    .fluidOutputs(<liquid:iron_iii_chloride> * 1000)
//    .property("temperature", 1150)
//    .duration(450).EUt(120).buildAndRegister();
//
//chemical_reactor.recipeBuilder()
//    .inputs(<metaitem:nomilabs:dustSodiumMetavanadate> * 5, <metaitem:dustAmmoniumChloride> * 2)
//    .outputs(<metaitem:nomilabs:dustAmmoniumMetavanadate> * 9, <metaitem:dustSalt> * 2)
//    .duration(150).EUt(30).buildAndRegister();
//
//chemical_reactor.recipeBuilder()
//    .inputs(<metaitem:nomilabs:dustAmmoniumMetavanadate> * 18)
//    .circuit(1)
//    .outputs(<metaitem:nomilabs:dustVanadiumPentoxide> * 7)
//    .fluidOutputs(<liquid:ammonia> * 2000, <liquid:water> * 1000)
//    .duration(300).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustVanadium> * 2)
    .fluidInputs(<liquid:oxygen> * 5000)
    .outputs(<metaitem:nomilabs:dustVanadiumPentoxide> * 7)
    .duration(600).EUt(7).buildAndRegister();

// H2SO4 require V2O5
// Sulfur Trioxide * 1000
<recipemap:chemical_reactor>.findRecipe(7, null, [<liquid:sulfur_dioxide> * 1000, <liquid:oxygen> * 1000]).remove();
<recipemap:large_chemical_reactor>.findRecipe(7, null, [<liquid:sulfur_dioxide> * 1000, <liquid:oxygen> * 1000]).remove();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:sulfur_dioxide> * 1000, <liquid:oxygen> * 1000)
    .notConsumable(<metaitem:nomilabs:dustVanadiumPentoxide>)
    .fluidOutputs(<liquid:sulfur_trioxide> * 1000)
    .duration(200).EUt(7).buildAndRegister();

// Sulfuric Acid * 1000
<recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:dustSulfur>, <metaitem:circuit.integrated>.withTag({Configuration: 24})], [<liquid:water> * 4000]).remove();

large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustSulfur>)
    .notConsumable(<metaitem:nomilabs:dustVanadiumPentoxide>)
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
    .outputs(<metaitem:nomilabs:dustNaquadahHydroxide> * 7, <metaitem:dustSodium> * 3)
    .duration(480).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<ore:dustCaesium>)
    .fluidInputs(<liquid:water> * 1000)
    .outputs(<metaitem:nomilabs:dustCaesiumHydroxide> * 3)
    .duration(5).EUt(7).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustCaesiumHydroxide> * 9, <metaitem:nomilabs:dustNaquadahHydroxide> * 3, <metaitem:nomilabs:dustSignalum>)
    .fluidInputs(<liquid:hydrofluoric_acid> * 6000)
    .fluidOutputs(<liquid:neocryolite> * 1000, <liquid:water> * 6000)
    .duration(250).EUt(7680).buildAndRegister();

// Naquadah
large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustSnowchestite> * 4)
    .fluidInputs(<liquid:petrotheum> * 3000)
    .fluidOutputs(<liquid:naquadah_oxide_petro_solution> * 3000)
    .outputs(<metaitem:nomilabs:dustPyromorphite>)
    .duration(100).EUt(3840).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:naquadah_oxide_petro_solution> * 1000)
    .inputs(<ore:dustAerotheum> * 4)
    .outputs(<ore:dustBasalz>.firstItem * 4)
    .fluidOutputs(<liquid:naquadah_oxide_aero_solution> * 1000)
    .duration(300).EUt(240).buildAndRegister();

distillery.recipeBuilder()
    .fluidInputs(<liquid:naquadah_oxide_aero_solution> * 1000)
    .circuit(1)
    .outputs(<metaitem:nomilabs:dustNaquadahOxide> * 5)
    .fluidOutputs(<liquid:aerotheum> * 1000)
    .duration(300).EUt(240).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustNaquadahOxide> * 5)
    .fluidInputs(<liquid:neocryolite> * 4000)
    .fluidOutputs(<liquid:hot_naquadah_oxide_neocryolite_solution> * 4000)
    .property("temperature", 4700)
    .duration(400).EUt(1920).buildAndRegister();

electrolyzer.recipeBuilder()
    .fluidInputs(<liquid:hot_naquadah_oxide_neocryolite_solution> * 4000)
    .notConsumable(<metaitem:stickRuthenium> * 2)
    .outputs(<metaitem:dustNaquadah> * 2)
    .fluidOutputs(<liquid:neocryolite> * 3750, <liquid:oxygen> * 3000)
    .duration(750).EUt(7680).buildAndRegister();

chemical_bath.recipeBuilder()
    .fluidInputs(<liquid:aerotheum> * 250)
    .notConsumable(<nuclearcraft:block_ice>)
    .outputs(<ore:dustAerotheum>.firstItem)
    .duration(100).EUt(7).buildAndRegister();

// Platinum Group
// Raw Platinum Powder * 3
<recipemap:centrifuge>.findRecipe(480, [<metaitem:dustPlatinumGroupSludge> * 6], [<liquid:aqua_regia> * 1200]).remove();
// Platinum Dust * 1
<recipemap:electrolyzer>.findRecipe(120, [<metaitem:dustPlatinumRaw> * 3], null).remove();
// Palladium Dust * 1
<recipemap:chemical_reactor>.findRecipe(120, [<metaitem:dustPalladiumRaw> * 5], [<liquid:hydrochloric_acid> * 1000]).remove();
<recipemap:large_chemical_reactor>.findRecipe(120, [<metaitem:dustPalladiumRaw> * 5], [<liquid:hydrochloric_acid> * 1000]).remove();
// Ruthenium Tetroxide Dust * 5
<recipemap:chemical_reactor>.findRecipe(1920, [<metaitem:dustInertMetalMixture> * 6], [<liquid:sulfuric_acid> * 1500]).remove();
<recipemap:large_chemical_reactor>.findRecipe(1920, [<metaitem:dustInertMetalMixture> * 6], [<liquid:sulfuric_acid> * 1500]).remove();
// Ruthenium Dust * 1
<recipemap:chemical_reactor>.findRecipe(120, [<metaitem:dustRutheniumTetroxide> * 5, <metaitem:dustCarbon> * 2], null).remove();
<recipemap:large_chemical_reactor>.findRecipe(120, [<metaitem:dustRutheniumTetroxide> * 5, <metaitem:dustCarbon> * 2], null).remove();
// Rhodium Dust * 2
<recipemap:electrolyzer>.findRecipe(120, null, [<liquid:rhodium_sulfate> * 1000]).remove();
// Iridium Metal Residue * 5
<recipemap:large_chemical_reactor>.findRecipe(7680, [<metaitem:dustRarestMetalMixture> * 7], [<liquid:hydrochloric_acid> * 4000]).remove();
// Iridium Chloride Dust * 4
<recipemap:centrifuge>.findRecipe(120, [<metaitem:dustIridiumMetalResidue> * 5], null).remove();
// Iridium Dust * 1
<recipemap:chemical_reactor>.findRecipe(30, [<metaitem:dustIridiumChloride> * 4], [<liquid:hydrogen> * 3000]).remove();
<recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:dustIridiumChloride> * 4], [<liquid:hydrogen> * 3000]).remove();
// Osmium Tetroxide Dust * 5
<recipemap:distillation_tower>.findRecipe(120, null, [<liquid:acidic_osmium_solution> * 2000]).remove();
// Osmium Tetroxide Dust * 1
<recipemap:distillery>.findRecipe(30, [<metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:acidic_osmium_solution> * 400]).remove();
// Osmium Tetroxide Dust * 1
<recipemap:distillery>.findRecipe(30, [<metaitem:circuit.integrated>.withTag({Configuration: 1})], [<liquid:acidic_osmium_solution> * 400]).remove();
// Osmium Dust * 1
<recipemap:chemical_reactor>.findRecipe(30, [<metaitem:dustOsmiumTetroxide> * 5], [<liquid:hydrogen> * 8000]).remove();
<recipemap:large_chemical_reactor>.findRecipe(30, [<metaitem:dustOsmiumTetroxide> * 5], [<liquid:hydrogen> * 8000]).remove();

// Formic Acid
chemical_reactor.recipeBuilder()
    .inputs(<ore:dustSodium>)
    .fluidInputs(<liquid:methanol> * 1000)
    .outputs(<metaitem:nomilabs:dustSodiumMethoxide> * 6)
    .fluidOutputs(<liquid:hydrogen> * 1000)
    .duration(10).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:methanol> * 1000, <liquid:carbon_dioxide> * 1000)
    .inputs(<metaitem:nomilabs:dustTinySodiumMethoxide>)
    .fluidOutputs(<liquid:methyl_formate> * 1000)
    .duration(16).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:methyl_formate> * 1000, <liquid:water> * 3000)
    .fluidOutputs(<liquid:formic_acid> * 1000, <liquid:methanol> * 1000)
    .duration(16).EUt(30).buildAndRegister();

// Potassium Pyrosulfate
chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustRockSalt> * 2)
    .fluidInputs(<liquid:sulfuric_acid> * 1000)
    .outputs(<metaitem:nomilabs:dustPotassiumBisulfate> * 7)
    .fluidOutputs(<liquid:hydrochloric_acid> * 1000)
    .duration(60).EUt(30).buildAndRegister();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustSaltpeter> * 5)
    .fluidInputs(<liquid:sulfuric_acid> * 1000)
    .outputs(<metaitem:nomilabs:dustPotassiumBisulfate> * 7)
    .fluidOutputs(<liquid:nitric_acid> * 1000)
    .duration(60).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPotassiumBisulfate> * 14)
    .outputs(<metaitem:nomilabs:dustPotassiumPyrosulfate> * 11)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(30).EUt(64).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPotassiumSulfate> * 7)
    .fluidInputs(<liquid:sulfur_trioxide> * 1000)
    .outputs(<metaitem:nomilabs:dustPotassiumPyrosulfate> * 11)
    .duration(30).EUt(64).buildAndRegister();

// Sodium Peroxide
chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustSodiumHydroxide> * 6)
    .fluidInputs(<liquid:hydrogen_peroxide> * 7000)
    .outputs(<metaitem:nomilabs:dustSodiumPeroxide> * 4)
    .fluidOutputs(<liquid:water> * 8000, <liquid:oxygen> * 6000)
    .duration(100).EUt(30).buildAndRegister();

// Sodium Nitrate
chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustSodiumHydroxide> * 3)
    .fluidInputs(<liquid:nitric_acid> * 1000)
    .outputs(<metaitem:nomilabs:dustSodiumNitrate> * 5)
    .fluidOutputs(<liquid:water> * 1000)
    .duration(5).EUt(60).buildAndRegister();

// Platinum Group Sludge
chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustPlatinumGroupSludge> * 3)
    .fluidInputs(<liquid:aqua_regia> * 2000)
    .outputs(<metaitem:nomilabs:dustPlatinumGroupResidue>, <metaitem:dustPlatinumSludgeResidue>)
    .fluidOutputs(<liquid:platinum_palladium_leachate> * 1000)
    .duration(250).EUt(30).buildAndRegister();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPlatinumMetallic> * 2)
    .fluidInputs(<liquid:aqua_regia> * 2000)
    .outputs(<metaitem:nomilabs:dustPlatinumGroupResidue>)
    .fluidOutputs(<liquid:platinum_palladium_leachate> * 1000)
    .duration(250).EUt(30).buildAndRegister();

// Platinum Sludge Residue
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustPlatinumSludgeResidue> * 5], null).remove();

centrifuge.recipeBuilder()
    .inputs(<metaitem:dustPlatinumSludgeResidue> * 5)
    .outputs(<metaitem:dustSiliconDioxide> * 2, <metaitem:dustCopper> * 2)
    .chancedOutput(<metaitem:dustGold>, 1000, 1000)
    .duration(938).EUt(30).buildAndRegister();

// Platinum
chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustAmmoniumChloride> * 8)
    .fluidInputs(<liquid:platinum_palladium_leachate> * 1000)
    .outputs(<metaitem:nomilabs:dustAmmoniumHexachloroplatinate> * 9, <metaitem:nomilabs:dustCrudePlatinumResidue>)
    .fluidOutputs(<liquid:palladium_rich_ammonia> * 1000)
    .duration(1200).EUt(30).buildAndRegister();

electrolyzer.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustAmmoniumHexachloroplatinate> * 9)
    .fluidOutputs(<liquid:ammonia> * 2000, <liquid:chloroplatinic_acid> * 1000)
    .duration(30).EUt(30).buildAndRegister();

distillery.recipeBuilder()
    .fluidInputs(<liquid:chloroplatinic_acid> * 1000)
    .circuit(1)
    .outputs(<metaitem:dustPlatinumRaw> * 2)
    .fluidOutputs(<liquid:hydrochloric_acid> * 4000)
    .duration(120).EUt(30).buildAndRegister();

autoclave.recipeBuilder()
    .inputs(<metaitem:dustPlatinumRaw> * 3, <metaitem:dustCalcium>)
    .fluidInputs(<liquid:steam> * 3840)
    .outputs(<metaitem:dustPlatinum>, <metaitem:dustCalciumChloride> * 3)
    .fluidOutputs(<liquid:water> * 24)
    .duration(30).EUt(30).buildAndRegister();

sifter.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustCrudePlatinumResidue>)
    .chancedOutput(<metaitem:nomilabs:dustPlatinumMetallic>, 9500, 0)
    .duration(600).EUt(30).buildAndRegister();

// Palladium
mixer.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPalladiumMetallic> * 2)
    .fluidInputs(<liquid:ammonia> * 2000, <liquid:chlorine> * 2000)
    .fluidOutputs(<liquid:palladium_rich_ammonia> * 1000)
    .duration(250).EUt(30).buildAndRegister();

fluid_solidifier.recipeBuilder()
    .fluidInputs(<liquid:palladium_rich_ammonia> * 500)
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<metaitem:nomilabs:dustCrudePalladiumResidue>)
    .duration(125).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPalladiumMetallic> * 2)
    .fluidInputs(<liquid:palladium_rich_ammonia> * 1000)
    .outputs(<metaitem:dustPalladiumRaw> * 3, <metaitem:nomilabs:dustCrudePalladiumResidue>)
    .fluidOutputs(<liquid:ammonia> * 2000)
    .duration(250).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustPalladiumRaw> * 3)
    .fluidInputs(<liquid:formic_acid> * 1000)
    .outputs(<metaitem:dustPalladium>)
    .fluidOutputs(<liquid:hydrochloric_acid> * 2000, <liquid:carbon_dioxide> * 1000)
    .duration(250).EUt(30).buildAndRegister();

sifter.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustCrudePalladiumResidue>)
    .chancedOutput(<metaitem:nomilabs:dustPalladiumMetallic>, 9500, 0)
    .duration(600).EUt(30).buildAndRegister();

// Rhodium
blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustPlatinumGroupResidue>, <metaitem:nomilabs:dustPotassiumPyrosulfate> * 11)
    .outputs(<metaitem:dustRhodiumSulfate>, <metaitem:nomilabs:dustPotassiumSulfate> * 7, <metaitem:nomilabs:dustIridiumGroupSludge>)
    .fluidOutputs(<liquid:sulfur_trioxide> * 1000)
    .property("temperature", 1048)
    .duration(200).EUt(120).buildAndRegister();

chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustRhodiumSulfate> * 6)
    .fluidInputs(<liquid:water> * 2000)
    .outputs(<metaitem:nomilabs:dustIridiumGroupSludge>)
    .fluidOutputs(<liquid:rhodium_sulfate_solution> * 2000)
    .duration(300).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()   
    .inputs(<metaitem:dustZinc> * 3)
    .fluidInputs(<liquid:rhodium_sulfate_solution> * 1000)
    .outputs(<metaitem:nomilabs:dustZincSulfate> * 18, <metaitem:nomilabs:dustCrudeRhodiumResidue>)
    .duration(300).EUt(30).buildAndRegister();

blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustCrudeRhodiumResidue>, <metaitem:dustSalt> * 4)
    .fluidInputs(<liquid:chlorine> * 6000)
    .outputs(<metaitem:nomilabs:dustRhodiumSalt>)
    .fluidOutputs(<liquid:steam> * 9600)
    .property("temperature", 848)
    .duration(300).EUt(120).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustSodiumNitrate> * 30, <metaitem:nomilabs:dustRhodiumSalt>)
    .notConsumable(<liquid:water> * 8000)
    .outputs(<metaitem:nomilabs:dustRhodiumNitrate> * 26, <metaitem:dustSalt> * 16)
    .duration(300).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustRhodiumNitrate> * 13, <metaitem:dustPotassium> * 3)
    .outputs(<metaitem:dustRhodium>, <metaitem:dustSaltpeter> * 15)
    .duration(300).EUt(30).buildAndRegister();

// Ruthenium
blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustIridiumGroupSludge>, <metaitem:dustSodaAsh> * 2)
    .outputs(<metaitem:nomilabs:dustSodiumRuthenate> * 2, <metaitem:dustAsh>, <metaitem:dustRarestMetalMixture>)
    .property("temperature", 1023)
    .duration(200).EUt(120).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustSodiumRuthenate> * 6)
    .fluidInputs(<liquid:chlorine> * 2000, <liquid:water> * 2000)
    .outputs(<metaitem:dustRutheniumTetroxide> * 5)
    .fluidOutputs(<liquid:salt_water> * 2000)
    .duration(1575).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustRutheniumTetroxide> * 5)
    .fluidInputs(<liquid:hydrogen> * 8000)
    .outputs(<metaitem:dustRuthenium>)
    .fluidOutputs(<liquid:water> * 4000)
    .duration(300).EUt(30).buildAndRegister();

// Osmium
chemical_bath.recipeBuilder()
    .inputs(<metaitem:dustRarestMetalMixture>)
    .fluidInputs(<liquid:hydrochloric_acid> * 1000)
    .outputs(<metaitem:dustIridiumMetalResidue>)
    .fluidOutputs(<liquid:acidic_osmium_solution> * 1000)
    .duration(100).EUt(30).buildAndRegister();

distillation_tower.recipeBuilder()
    .fluidInputs(<liquid:acidic_osmium_solution> * 2000)
    .outputs(<metaitem:dustOsmiumTetroxide>)
    .fluidOutputs(<liquid:hydrochloric_acid> * 2000)
    .duration(150).EUt(7680).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustOsmiumTetroxide> * 5)
    .fluidInputs(<liquid:hydrogen> * 8000)
    .outputs(<metaitem:dustOsmium>)
    .fluidOutputs(<liquid:water> * 4000)
    .duration(300).EUt(30).buildAndRegister();

// Iridium
blast_furnace.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustSodiumPeroxide> * 4, <metaitem:dustIridiumMetalResidue>)
    .outputs(<metaitem:nomilabs:dustIridiumDioxideResidue> * 3, <metaitem:dustSodium> * 2)
    .property("temperature", 1048)
    .duration(200).EUt(120).buildAndRegister();

mixer.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustIridiumDioxideResidue> * 3)
    .fluidInputs(<liquid:hydrochloric_acid> * 4000)
    .fluidOutputs(<liquid:acidic_iridium_dioxide_solution> * 4000)
    .duration(300).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustAmmoniumChloride>)
    .fluidInputs(<liquid:acidic_iridium_dioxide_solution> * 4000)
    .outputs(<metaitem:nomilabs:dustAmmoniumHexachloroiridiate> * 2, <metaitem:nomilabs:dustSmallPlatinumGroupResidue>)
    .fluidOutputs(<liquid:water> * 2000)
    .duration(300).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustAmmoniumHexachloroiridiate> * 9)
    .fluidInputs(<liquid:hydrogen> * 4000)
    .outputs(<metaitem:dustIridium>)
    .fluidOutputs(<liquid:hydrochloric_acid> * 6000, <liquid:ammonia> * 2000)
    .duration(150).EUt(7680).buildAndRegister();

// O2F2
large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:oxygen> * 2000, <liquid:fluorine> * 2000)
    .notConsumable(<actuallyadditions:item_crystal_empowered:3>)
    .fluidOutputs(<liquid:dioxygen_difluoride> * 1000)
    .duration(100).EUt(480).buildAndRegister();

// Helium Hydride
chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:hydrogen> * 1000, <liquid:tritium> * 1000)
    .fluidOutputs(<liquid:tritium_hydride> * 1000)
    .duration(160).EUt(1920).buildAndRegister();

distillation_tower.recipeBuilder()
    .fluidInputs(<liquid:tritium_hydride> * 10000)
    .fluidOutputs(<liquid:tritium_hydride> * 9900, <liquid:helium_hydride> * 100)
    .duration(800).EUt(192).buildAndRegister();

// Stone Dust
// Small Pile of Quartzite Dust * 1
<recipemap:centrifuge>.findRecipe(120, [<metaitem:dustStone>], null).remove();

chemical_bath.recipeBuilder()
    .inputs(<ore:dustStone> * 24)
    .fluidInputs(<liquid:hydrofluoric_acid> * 6000)
    .outputs(<metaitem:dustQuartzite> * 4)
    .fluidOutputs(<liquid:dirty_hexafluorosilicic_acid> * 3000)
    .duration(40).EUt(120).buildAndRegister();

centrifuge.recipeBuilder()
    .fluidInputs(<liquid:dirty_hexafluorosilicic_acid> * 3000)
    .outputs(<metaitem:nomilabs:dustStoneResidue> * 12)
    .fluidOutputs(<liquid:hexafluorosilicic_acid> * 1000)
    .duration(100).EUt(96).buildAndRegister();

// 1/48 scale
centrifuge.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustStoneResidue> * 24, <metaitem:dustSodiumHydroxide> * 3)
    .fluidInputs(<liquid:water> * 8000)
    .outputs(<metaitem:dustPotassiumFeldspar> * 12, <metaitem:dustSodalite> * 8, <metaitem:dustBiotite> * 6, <metaitem:dustMagnetite> * 4, <metaitem:dustMetalMixture> * 3, <metaitem:nomilabs:dustUncommonResidue>)
    .duration(1000).EUt(96).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustUncommonResidue>)
    .fluidInputs(<liquid:dioxygen_difluoride> * 1000)
    .outputs(<metaitem:nomilabs:dustOxidisedResidue>, <metaitem:dustAsh> * 2)
    .duration(80).EUt(96).buildAndRegister();

// 1/480 scale
centrifuge.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustOxidisedResidue> * 10)
    .fluidInputs(<liquid:distilled_water> * 10000)
    .outputs(<metaitem:dustGarnetSand> * 12, <metaitem:dustBasalticMineralSand> * 12, <metaitem:dustBauxite> * 8, <metaitem:dustPhosphorusPentoxide> * 4, <metaitem:dustIlmenite> * 4, <metaitem:nomilabs:dustRefinedResidue>)
    .fluidOutputs(<liquid:hydrofluoric_acid> * 2000, <liquid:sulfuric_copper_solution> * 1000, <liquid:lead_zinc_solution> * 250, <liquid:sulfuric_nickel_solution> * 250)
    .duration(1500).EUt(720).buildAndRegister();

// 1/4800 scale
centrifuge.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustRefinedResidue> * 10)
    .notConsumable(<draconicevolution:wyvern_core>)
    .notConsumable(<liquid:fluoroantimonic_acid> * 1000)
    .outputs(<metaitem:dustPitchblende> * 10, <metaitem:dustBorax> * 6, <metaitem:dustRareEarth> * 5, <metaitem:nomilabs:dustSnowchestite> * 4, <metaitem:dustDiamond> * 3, <metaitem:nomilabs:dustCleanInertResidue>)
    .duration(2000).EUt(400).buildAndRegister();

// 1/4800 scale
mixer.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustCleanInertResidue>)
    .fluidInputs(<liquid:helium_hydride> * 1000)
    .fluidOutputs(<liquid:ultraacidic_residue> * 1000)
    .duration(160).EUt(1920).buildAndRegister();

// 1/9600 scale
large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:xenon> * 1000, <liquid:oxygen> * 4000, <liquid:ultraacidic_residue> * 2000)
    .notConsumable(<draconicevolution:awakened_core>)
    .outputs(<metaitem:dustEuropium> * 2, <metaitem:nomilabs:dustKaemanite>, <metaitem:nomilabs:dustSmallOsmiridium8020>)
    .fluidOutputs(<liquid:xenic_acid> * 1000, <liquid:dusty_helium> * 2000)
    .duration(1000).EUt(1920).buildAndRegister();

// Taranium
centrifuge.recipeBuilder()
    .fluidInputs(<liquid:dusty_helium> * 1000)
    .fluidOutputs(<liquid:taranium_enriched_helium> * 150, <liquid:taranium_depleted_helium> * 850)
    .duration(400).EUt(2880).buildAndRegister();

fusion_reactor.recipeBuilder()
    .fluidInputs(<liquid:taranium_enriched_helium> * 1000, <liquid:helium_3> * 1000)
    .fluidOutputs(<liquid:plasma.taranium_enriched_helium> * 3000)
    .property("eu_to_start", 480000000)
    .duration(160).EUt(3840).buildAndRegister();

centrifuge.recipeBuilder()
    .fluidInputs(<liquid:plasma.taranium_enriched_helium> * 3000)
    .notConsumable(<nomilabs:magnetron>, <thermalfoundation:material:1025>)
    .outputs(<metaitem:nomilabs:dustTaranium>, <metaitem:nomilabs:dustSmallCleanInertResidue>)
    .duration(100).EUt(30720).buildAndRegister();

centrifuge.recipeBuilder()
    .fluidInputs(<liquid:taranium_depleted_helium> * 2500)
    .outputs(<metaitem:nomilabs:dustCleanInertResidue>)
    .duration(320).EUt(1920).buildAndRegister();

// Tributyl Phosphate

chemical_reactor.recipeBuilder()
    .inputs(<ore:dustPhosphorus>)
    .fluidInputs(<liquid:chlorine> * 3000)
    .fluidOutputs(<liquid:phosphorus_trichloride> * 1000)
    .duration(300).EUt(480).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .inputs(<metaitem:dustPhosphorusPentoxide> * 7)
    .fluidInputs(<liquid:phosphorus_trichloride> * 3000, <liquid:chlorine> * 6000)
    .fluidOutputs(<liquid:phosphoryl_chloride> * 5000)
    .duration(800).EUt(3840).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:butyraldehyde> * 1000, <liquid:hydrogen> * 2000)
    .notConsumable(<ore:dustNickel>)
    .fluidOutputs(<liquid:butanol> * 1000)
    .duration(300).EUt(480).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:phosphoryl_chloride> * 1000, <liquid:butanol> * 3000)
    .fluidOutputs(<liquid:tributyl_phosphate> * 1000)
    .duration(600).EUt(23040).buildAndRegister();

// Rare Earth
electrolyzer.recipeBuilder()
    .inputs(<ore:dustRareEarth>)
    .fluidInputs(<liquid:tributyl_phosphate> * 150)
    .chancedOutput(<metaitem:dustNeodymium>, 1500, 0)
    .chancedOutput(<metaitem:dustSamarium>, 1500, 0)
    .chancedOutput(<metaitem:dustYttrium>, 1500, 0)
    .chancedOutput(<metaitem:dustLanthanum>, 1500, 0)
    .chancedOutput(<metaitem:dustLutetium>, 600, 0)
    .chancedOutput(<metaitem:dustEuropium>, 600, 0)
    .duration(50).EUt(1966080).buildAndRegister();
