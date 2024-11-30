#packmode expert
#priority -1

import crafttweaker.mods.IMod;
import crafttweaker.item.IItemStack;

import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeExtremeRecipe7 as makeExtremeRecipe7;
import scripts.common.makeExtremeRecipe9 as makeExtremeRecipe9;
import scripts.common.makeShaped as makeShaped;
import scripts.common.makeShapeless3 as makeShapeless3;


// Nether Cake
recipes.addShaped(<dimensionaledibles:nether_cake>, [[<metaitem:dustSteel>,<metaitem:dustSteel>,<metaitem:dustSteel>], [<minecraft:obsidian>, <enderio:item_material:70>, <minecraft:obsidian>],[<metaitem:blockLead>,<ore:blockGold>,<metaitem:blockLead>]]);

// Remove Terracotta maceration
// Clay Dust * 4
<recipemap:macerator>.findRecipe(2, [<minecraft:stained_hardened_clay:0>], null).remove();
// Clay Dust * 4
<recipemap:macerator>.findRecipe(2, [<minecraft:hardened_clay:0>], null).remove();


//Fluid Conduit
mods.jei.JEI.removeAndHide(<enderio:item_liquid_conduit>);
recipes.remove(<enderio:item_liquid_conduit:1>);
recipes.addShaped(<enderio:item_liquid_conduit:1> * 4, [
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>],
	[<minecraft:glass>,<minecraft:glass>,<minecraft:glass>],
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>]]);
assembler.recipeBuilder().inputs([<minecraft:glass> * 3, <ore:itemConduitBinder> * 4, <metaitem:foilPolyvinylChloride> * 2]).outputs([<enderio:item_liquid_conduit:1> * 8]).duration(80).EUt(16).buildAndRegister();

//// Hard Firebricks
//recipes.removeByRecipeName("gregtech:casing_primitive_bricks");
//recipes.addShaped(<gregtech:metal_casing:1>, [
//    [<metaitem:brick.fireclay>, <metaitem:dustGypsum>, <metaitem:brick.fireclay>],
//    [<metaitem:brick.fireclay>, <forge:bucketfilled>.withTag({FluidName: "concrete", Amount: 1000}), <metaitem:brick.fireclay>],
//    [<metaitem:brick.fireclay>, <metaitem:dustGypsum>, <metaitem:brick.fireclay>]
//]);
//
//recipes.addShaped(<forge:bucketfilled>.withTag({FluidName: "concrete", Amount: 1000}), [
//    [<metaitem:dustCalcite>, <minecraft:bucket>, <metaitem:dustStone>],
//    [<metaitem:dustCalcite>, <minecraft:water_bucket>, <metaitem:dustQuartzSand>],
//    [null, <metaitem:dustClay>, null]
//]);

// Ender Tank (Ender Storage)
recipes.remove(<enderstorage:ender_storage:1>);


// Pulsating Mesh
alloy.recipeBuilder()
	.inputs([<ore:dustPulsating>, <metaitem:carbon.mesh>])
	.outputs([<nomilabs:pulsatingmesh>])
	.duration(180).EUt(16).buildAndRegister();

// Endervoir
recipes.removeByRecipeName("enderio:reservoir");
assembler.recipeBuilder()
	.inputs([<ore:blockGlassHardened> * 18, <metaitem:nomilabs:plateDoubleEnergeticAlloy> * 3, <minecraft:cauldron>])
	.outputs(<enderio:block_reservoir> * 4)
	.duration(100)
	.EUt(30)
	.buildAndRegister();

// Farming Station
recipes.removeByRecipeName("enderio:farming_station");
makeShaped("farming_station", <enderio:block_farm_station>,
	["VCV",
	 "SHS",
	 "GPG"],
	{ V : <ore:itemVibrantCrystal>,
	  P : <ore:itemPulsatingCrystal>,
	  S : <ore:plateSteel>,
	  G : <ore:gearIronInfinity>,
	  H : <ore:itemSimpleMachineChassi>,
	  C : <ore:circuitLv>});

/////////////	 Tier Four and Half Space Ship  	  //////////////////
makeExtremeRecipe7(<nomilabs:tierfourandhalfship>,
	["  LGL  ",
	 "I PWP I",
	 "APPCPPA",
	 " PPBPP ",
	 "PWFWFWP",
	 "PDPBPDP",
	 "  TTT  "],
	{ C : <metaitem:crate.tungstensteel>,
	  B : <metaitem:field.generator.hv>,
	  D : <thermalexpansion:dynamo:3>,
	  F : <thermalexpansion:frame:147>,
	  G : <nomilabs:t1guidance>,
	  L : <nomilabs:t2laser>,
	  P : <metaitem:nomilabs:plateDoubleLumium>,
	  T : <simplyjetpacks:metaitemmods:9>,
	  W : <metaitem:plateDoubleTungstenCarbide>,
	  A : <metaitem:robot.arm.hv>,
	  I : <redstonearsenal:tool.sword_flux> }
);

/////////////	 Tier Eight and Half Space Ship  	  //////////////////
makeExtremeRecipe9(<nomilabs:tiereightandhalfship>,
	["   LLL   ",
	 "  LNNNL  ",
	 " GNTTTNG ",
	 " NNTFTNN ",
	 " NTECETN ",
	 "NNTSFSTNN",
	 "NTTQAQTTN",
	 "NTTBABTTN",
	 " DDD DDD "],
	{ L : <nomilabs:t3laser>,
	  N : <metaitem:plateDoubleNaquadahAlloy>,
	  G : <nomilabs:t2guidance>,
	  T : <metaitem:plateDoubleTrinium>,
	  F : <metaitem:field.generator.zpm>,
	  E : <metaitem:emitter.zpm>,
	  C : <draconicevolution:draconic_energy_core>,
	  S : <draconicevolution:reactor_part>,
	  Q : <metaitem:quantum_chest.luv>,
	  A : <advancedrocketry:warpcore>,
	  B : <advancedrocketry:warpmonitor>,
	  D : <nomilabs:warpengine>}
);

// Exchanging Gadget
recipes.removeByRecipeName("buildinggadgets:exchangingtool");
makeShaped("exchangertool", <buildinggadgets:exchangertool>.withTag({blockstate: {Name: "minecraft:air"}}),
	["IRI",
	 "DFD",
	 "ILI"],
	{ D : <ore:gemDiamond>,
	  L : <ore:gemLapis>,
	  F : <metaitem:emitter.iv>, // IV Field Emitter
	  R : <ore:dustRedstone>,
	  I : <ore:ingotIron>}); 


recipes.remove(<nuclearcraft:water_source>);
makeShaped("of_nc_water_source", <nuclearcraft:water_source>,
    ["AAA",
     "B B",
     "AAA"],
    { A : <ore:plateDoubleSteel>,
      B : <minecraft:water_bucket:*> });

// XP Juice
mixer.recipeBuilder()
	.inputs(<ore:itemPulsatingPowder>)
    .fluidOutputs(<liquid:xpjuice> * 2240) // 8L
    .fluidInputs(<liquid:mana> * 250)
    .duration(100).EUt(480).buildAndRegister();

mixer.recipeBuilder()
	.inputs(<ore:itemVibrantPowder>)
    .fluidOutputs(<liquid:xpjuice> * 4480) // 16L
    .fluidInputs(<liquid:mana> * 250)
    .duration(100).EUt(480).buildAndRegister();

mixer.recipeBuilder()
	.inputs(<nomilabs:grainsofinnocence>)
    .fluidOutputs(<liquid:xpjuice> * 6720) // 24L
    .fluidInputs(<liquid:mana> * 250)
    .duration(100).EUt(480).buildAndRegister();

mixer.recipeBuilder()
	.inputs(<ore:itemPrecientPowder>)
    .fluidOutputs(<liquid:xpjuice> * 8960) // 32L
    .fluidInputs(<liquid:mana> * 250)
    .duration(100).EUt(480).buildAndRegister();

mixer.recipeBuilder()
	.inputs(<ore:itemEnderCrystalPowder>)
    .fluidOutputs(<liquid:xpjuice> * 11200) // 40L
    .fluidInputs(<liquid:mana> * 250)
    .duration(100).EUt(480).buildAndRegister();

// Quantum Flux
mixer.recipeBuilder()
	.inputs(<ore:gemCrystalFlux>)
	.outputs(<nomilabs:quantumflux> * 8)
    .fluidInputs(<liquid:mana> * 250)
    .duration(100).EUt(480).buildAndRegister();

// Network Visualization Tool
recipes.removeByRecipeName("ae2stuff:recipe5");
makeShaped("ae2stuff_nvt", <ae2stuff:visualiser>, [
		"S S",
		"EPE",
		"FFF",
	], {
		S: <metaitem:sensor.lv>,
        E: <appliedenergistics2:material:24>, // Eng Processor
        P: <ore:itemIlluminatedPanel>,
        F: <ore:crystalPureFluix>
	});

// Conduit Binder Composite
mixer.recipeBuilder()
	.inputs([<ore:gravel> * 4, <ore:sand> * 4])
    .fluidInputs(<liquid:glue> * 50)
    .outputs([<ore:itemBinderComposite>.firstItem * 16])
    .duration(80).EUt(30).buildAndRegister();

// Remove clay hand mortaring
recipes.removeByRecipeName("gregtech:clay_block_to_dust");
recipes.removeByRecipeName("gregtech:clay_ball_to_dust");


//Item conduit - by hand
recipes.addShaped(<enderio:item_item_conduit> * 4, [
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>], 
	[<ore:wireGtSinglePulsatingIron>,<ore:wireGtSinglePulsatingIron>,<ore:wireGtSinglePulsatingIron>],
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>]]);

//ender fluid conduit - by hand
recipes.addShaped(<enderio:item_liquid_conduit:2> * 4, [
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>], 
	[<metaitem:nomilabs:wireGtSingleVibrantAlloy>,<enderio:item_liquid_conduit:1>,<metaitem:nomilabs:wireGtSingleVibrantAlloy>], 
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>]]);


//item conduit - assembler
assembler.recipeBuilder()
    .inputs([<ore:wireGtSinglePulsatingIron> * 3, <ore:itemConduitBinder> * 4, <metaitem:foilPolyvinylChloride> * 2])
    .outputs([<enderio:item_item_conduit> * 8])
    .duration(80).EUt(16).buildAndRegister();

//ender fluid conduit - assembler
assembler.recipeBuilder()
    .inputs([<metaitem:nomilabs:wireGtSingleVibrantAlloy> * 2, <enderio:item_liquid_conduit:1>, <ore:itemConduitBinder> * 4, <metaitem:foilPolyvinylChloride> * 2])
    .outputs([<enderio:item_liquid_conduit:2> * 8])
    .duration(80).EUt(16).buildAndRegister();

// Elemental Reduction with H2SbF7
reactor.recipeBuilder()
    .inputs(<ore:dustPulsating> * 4)
    .fluidInputs([<liquid:fluoroantimonic_acid> * 1000])
    .fluidOutputs(<liquid:elementalreduction> * 12000)
    .duration(540).EUt(360).buildAndRegister();


////////////////////////// Creative Vending Upgrade ///////////////////////
val creativecell = <thermalexpansion:cell>.withTag({Creative: 1 as byte, Level: 4 as byte}, false);
val creativejetpack = <simplyjetpacks:itemjetpack>.withTag({JetpackParticleType: 3}, false);

makeExtremeRecipe9(<metaitem:creative_chest> * 2,
    ["ABBBBBBBA",
     "BCBEDEBCB",
     "BBSGHGSBB",
     "BUJXIXJUB",
     "BNSWKWSNB",
     "BUJXLXJUB",
     "BBSGMGSBB",
     "BCBEDEBCB",
     "ABBBBBBBA"],
    { A : <storagedrawers:upgrade_creative>,
      B : <ore:ingotInfinity>,
      C : <draconicevolution:creative_rf_source>,
      D : creativecell,
      E : <extrautils2:creativeenergy>,
      G : <extrautils2:passivegenerator:6>,
      H : <avaritia:infinity_helmet>,
      I : <avaritia:infinity_chestplate>,
      J : creativejetpack,
      K : <avaritia:infinity_sword>,
      L : <avaritia:infinity_pants>,
      M : <avaritia:infinity_boots>,
      N : <metaitem:infinite_energy>,
      S : <solarflux:solar_panel_infinity>,
      U : <appliedenergistics2:creative_energy_cell>,
      W : <thermalcultivation:watering_can:32000>.withTag({Water: 0, Mode: 4}, false),
      X : <thermalexpansion:capacitor:32000>.withTag({Energy: 250000000}, false)
    });

//Numismatic Dynamo
recipes.remove(<thermalexpansion:dynamo:5>);
recipes.addShaped(<thermalexpansion:dynamo:5>, [
	[null, <nomilabs:excitationcoil>, null],
	[<metaitem:plateZeron100>, <morefurnaces:furnaceblock:2>, <metaitem:plateZeron100>],
	[<enderio:item_material:13>, <thermalfoundation:material:514>, <enderio:item_material:13>]]);

// Auto Maintenance Hatch
recipes.removeByRecipeName("gregtech:maintenance_hatch_automatic");
recipes.addShaped(<metaitem:maintenance_hatch_full_auto>, [
    [<ore:circuitIv>, <metaitem:maintenance_hatch>, <ore:circuitIv>],
    [<metaitem:robot.arm.iv>, <metaitem:hull.iv>, <metaitem:robot.arm.iv>],
    [<ore:circuitIv>, <metaitem:maintenance_hatch>, <ore:circuitIv>]
]);

// Fluid Storage (Moved to Groovy)

// Small Storage Crates
recipes.removeByRecipeName("actuallyadditions:recipes162");
assembler.recipeBuilder()
    .inputs(<ore:chestWood> * 4, <metaitem:frameTreatedWood> * 4, <metaitem:crate.steel>)
    .outputs(<actuallyadditions:block_giant_chest>)
    .duration(100).EUt(7).buildAndRegister();
recipes.addShaped(<actuallyadditions:block_giant_chest>, [
    [<ore:chestWood>, <metaitem:frameTreatedWood>, <ore:chestWood>],
    [<metaitem:frameTreatedWood>, <metaitem:crate.steel>, <metaitem:frameTreatedWood>],
    [<ore:chestWood>, <metaitem:frameTreatedWood>, <ore:chestWood>]]);

// Drawer Upgrades
recipes.remove(<storagedrawers:upgrade_template>);
recipes.removeByRecipeName("storagedrawers:upgrade_storage_emerald");
recipes.removeByRecipeName("storagedrawers:upgrade_storage_diamond");

recipes.addShaped(<storagedrawers:upgrade_template> * 4, [
	[<ore:stickBrass>, <ore:stickBrass>, <ore:stickBrass>],
	[<ore:stickBrass>, <storagedrawers:customdrawers>, <ore:stickBrass>],
	[<ore:stickBrass>, <ore:stickBrass>, <ore:stickBrass>]]);

recipes.addShaped(<storagedrawers:upgrade_storage:3>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [<ore:ingotAluminium>, <storagedrawers:upgrade_template>, <ore:ingotAluminium>], [<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);
recipes.addShaped(<storagedrawers:upgrade_storage:4>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [<ore:ingotVibrantAlloy>, <storagedrawers:upgrade_template>, <ore:ingotVibrantAlloy>], [<ore:stickWood>, <ore:stickWood>, <ore:stickWood>]]);

// NC Cobble gen
recipes.remove(<nuclearcraft:cobblestone_generator>);
makeShaped("of_nc_cobblestone_generator",
    <nuclearcraft:cobblestone_generator>,
    ["AAA",
     "B C",
     "AAA"],
    { A : <ore:plateBlackSteel>,
      B : <minecraft:water_bucket:*>,
      C : <minecraft:lava_bucket:*> });

makeShaped("of_nc_cobblestone_generator_mirrored",
    <nuclearcraft:cobblestone_generator>,
    ["AAA",
     "C B",
     "AAA"],
    { A : <ore:plateBlackSteel>,
      B : <minecraft:water_bucket:*>,
      C : <minecraft:lava_bucket:*> });

//Crystal Growth Chamber
recipes.addShaped(<ae2stuff:grower>, [
	[<ore:frameGtBlueSteel>, <appliedenergistics2:material:1>, <ore:frameGtBlueSteel>], 
	[<appliedenergistics2:material:1>, <meta_tile_entity:hull.lv>, <appliedenergistics2:material:1>], 
	[<ore:frameGtBlueSteel>, <appliedenergistics2:material:1>, <ore:frameGtBlueSteel>]]);	

// Remove LCR Radon
<recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:ingotPlutonium> * 8, <metaitem:dustUranium>], [<liquid:air> * 10000]).remove();

// Es fluid extraction
extractor.recipeBuilder()
    .inputs(<nomilabs:stabilizedeinsteinium>)
    .fluidOutputs(<liquid:einsteinium> * 9)
    .duration(16).EUt(30).buildAndRegister();

// Drill Core (Moved to Groovy)

// Ore Drilling Plants (Moved to Groovy)

//Draconium [tier 14]
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(30720, [<metaitem:nomilabs:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:neon> * 25]).remove();
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(30720, [<metaitem:nomilabs:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:nomilabs:dustDraconium>]).fluidInputs([<liquid:gasoline_premium> * 1000]).outputs(<metaitem:nomilabs:ingotHotDraconium>).property("temperature", 6800).duration(1800).EUt(30720).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:gasoline_premium> * 4000]).outputs([<metaitem:nomilabs:ingotHotDraconium> * 2]).property("temperature", 6800).duration(3600).EUt(30720).buildAndRegister();

// Dimethylformamide
large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:dimethylamine> * 1000, <liquid:carbon_monoxide> * 1000)
    .fluidOutputs(<liquid:dimethylformamide> * 1000)
    .duration(400).EUt(7680).buildAndRegister();

// Kapton K
// Wetware Lifesupport Circuit Board * 16
<recipemap:circuit_assembler>.findRecipe(30720, [<metaitem:board.multilayer.fiber_reinforced> * 16, <metaitem:petri_dish>, <metaitem:electric.pump.luv>, <metaitem:sensor.iv>, <metaitem:circuit.mainframe>, <metaitem:foilNiobiumTitanium> * 16], [<liquid:sterilized_growth_medium> * 4000]).remove();

circuit_assembler.recipeBuilder()
    .inputs(<metaitem:nomilabs:plateKaptonK> * 16, <metaitem:petri_dish>, <metaitem:electric.pump.luv>, <metaitem:sensor.iv>, <ore:circuitIv>, <metaitem:foilNiobiumTitanium> * 16)
    .fluidInputs(<liquid:sterilized_growth_medium> * 4000)
    .outputs(<metaitem:board.wetware> * 16)
	.property("cleanroom", "sterile_cleanroom")
    .duration(1200).EUt(30720).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:dimethylbenzene> * 1000, <liquid:chloromethane> * 1000)
    .outputs(<metaitem:nomilabs:dustDurene> * 24)
    .fluidOutputs(<liquid:hydrochloric_acid> * 1000)
    .duration(120).EUt(120).buildAndRegister();

chemical_reactor.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustDurene> * 12)
    .fluidInputs(<liquid:oxygen> * 6000)
    .outputs(<metaitem:nomilabs:dustPyromelliticDianhydride> * 9)
    .fluidOutputs(<liquid:water> * 3000)
    .duration(100).EUt(480).buildAndRegister();

chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:nitrobenzene> * 1000, <liquid:hydrogen> * 4000)
    .circuit(1)
    .fluidOutputs(<liquid:aminophenol> * 1000, <liquid:water> * 1000)
    .duration(300).EUt(30).buildAndRegister();

large_chemical_reactor.recipeBuilder()
    .fluidInputs(<liquid:aminophenol> * 1000, <liquid:nitrochlorobenzene> * 1000, <liquid:water> * 1000)
    .notConsumable(<metaitem:dustSaltpeter>)
    .notConsumable(<liquid:dimethylformamide>)
    .outputs(<metaitem:nomilabs:dustOxydianiline> * 27)
    .fluidOutputs(<liquid:oxygen> * 3000, <liquid:hydrochloric_acid> * 1000)
    .duration(200).EUt(21000).buildAndRegister();

alloy_smelter.recipeBuilder()
    .inputs(<metaitem:nomilabs:dustOxydianiline> * 3, <metaitem:nomilabs:dustPyromelliticDianhydride> * 2)
    .outputs(<metaitem:nomilabs:ingotKaptonK>)
    .duration(30).EUt(7680).buildAndRegister();

//////////////////// Exotic Materials Catalyst ////////////////////////
makeExtremeRecipe7(<nomilabs:exoticmaterialscatalyst>,
    ["L  M  J",
     " K W S ",
     "  YNT  ",
     "OFUVAIC",
     "  XEH  ",
     " Q G P ",
     "B  R  D"],
    { A : <ore:ingotCrystalMatrix>,
      B : <ore:ingotRuridit>,
      C : <ore:ingotElectricalSteel>,
      D : <ore:ingotEnergeticAlloy>,
      E : <ore:ingotVibrantAlloy>,
      F : <ore:ingotRhodiumPlatedPalladium>,
      G : <ore:ingotDarkSteel>,
      H : <ore:ingotSoularium>,
      I : <ore:ingotEndSteel>,
      J : <metaitem:ingotKanthal>,
      K : <metaitem:ingotMagnalium>,
      L : <metaitem:ingotNichrome>,
      M : <metaitem:ingotRedSteel>,
      N : <metaitem:ingotBlueSteel>,
      O : <metaitem:ingotVanadiumSteel>,
      P : <metaitem:ingotHssg>,
      Q : <metaitem:ingotHsse>,
      R : <metaitem:ingotHsss>,
      S : <metaitem:nomilabs:ingotManyullyn>,
      T : <ore:ingotMicroversium>,
      U : <ore:ingotElectrumFlux>,
      V : <simplyjetpacks:metaitemmods:3>,
      W : <thermalfoundation:material:136>,
      X : <ore:ingotSignalum>,
      Y : <ore:ingotEnderium> });

// Enriched Bacterial Sludge
// Enriched Bacterial Sludge * 1000
<recipemap:brewery>.findRecipe(4, [<metaitem:dustTinyUranium235>], [<liquid:bacterial_sludge> * 1000]).remove();
// Enriched Bacterial Sludge * 1000
<recipemap:brewery>.findRecipe(4, [<metaitem:dustUranium>], [<liquid:bacterial_sludge> * 1000]).remove();
// Enriched Bacterial Sludge * 2000
<recipemap:brewery>.findRecipe(4, [<metaitem:dustTinyNaquadria>], [<liquid:bacterial_sludge> * 1000]).remove();

brewery.recipeBuilder()
    .inputs(<ore:nuggetCalifornium252>)
    .fluidInputs(<liquid:bacterial_sludge> * 1000)
    .fluidOutputs(<liquid:enriched_bacterial_sludge> * 1000)
	.property("cleanroom", "sterile_cleanroom")
    .duration(128).EUt(4).buildAndRegister();

// Parallel Hatches
recipes.removeByRecipeName("gcym:parallel_hatch_iv");
recipes.removeByRecipeName("gcym:parallel_hatch_luv");
recipes.removeByRecipeName("gcym:parallel_hatch_zpm");
recipes.removeByRecipeName("gcym:parallel_hatch_uv");

recipes.addShaped(<metaitem:gcym:parallel_hatch.iv>, [
    [<metaitem:sensor.iv>, <metaitem:field.generator.iv>, <metaitem:emitter.iv>],
    [<ore:circuitIv>, <metaitem:hull.iv>, <ore:circuitIv>],
    [<metaitem:cableGtDoublePlatinum>, <metaitem:field.generator.iv>, <metaitem:cableGtDoublePlatinum>]
]);

recipes.addShaped(<metaitem:gcym:parallel_hatch.luv>, [
    [<metaitem:sensor.luv>, <metaitem:field.generator.luv>, <metaitem:emitter.luv>],
    [<ore:circuitLuv>, <metaitem:hull.luv>, <ore:circuitLuv>],
    [<metaitem:cableGtDoubleNiobiumTitanium>, <metaitem:field.generator.luv>, <metaitem:cableGtDoubleNiobiumTitanium>]
]);

recipes.addShaped(<metaitem:gcym:parallel_hatch.zpm>, [
    [<metaitem:sensor.zpm>, <metaitem:field.generator.zpm>, <metaitem:emitter.zpm>],
    [<ore:circuitZpm>, <metaitem:hull.zpm>, <ore:circuitZpm>],
    [<metaitem:cableGtDoubleVanadiumGallium>, <metaitem:field.generator.zpm>, <metaitem:cableGtDoubleVanadiumGallium>]
]);

recipes.addShaped(<metaitem:gcym:parallel_hatch.uv>, [
    [<metaitem:sensor.uv>, <metaitem:field.generator.uv>, <metaitem:emitter.uv>],
    [<ore:circuitUv>, <metaitem:hull.uv>, <ore:circuitUv>],
    [<metaitem:cableGtDoubleYttriumBariumCuprate>, <metaitem:field.generator.uv>, <metaitem:cableGtDoubleYttriumBariumCuprate>]
]);

// Stabilized Miners (Moved to Groovy)

// Remove shortcut recipes
recipes.remove(<minecraft:stick> * 16);
recipes.removeByRecipeName("appliedenergistics2:misc/vanilla_comparator");
recipes.remove(<minecraft:chest> * 4);

// Removals
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:640>);


val dml as IMod = loadedMods["deepmoblearning"];

if(!isNull(dml)) {
    val dmlItems as IItemStack[] = dml.items;

	//remove everything
    for item in dmlItems {
        mods.jei.JEI.removeAndHide(item);
    }
	
	// remove book
	mods.jei.JEI.removeAndHide(<patchouli:guide_book>.withTag({"patchouli:book": "deepmoblearning:book"}));
	// remove spawnegg
	mods.jei.JEI.removeAndHide(<minecraft:spawn_egg>.withTag({EntityTag: {id: "deepmoblearning:glitch"}}));
}
