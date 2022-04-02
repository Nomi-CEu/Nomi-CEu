#packmode expert
#priority -1

import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.IRecipeLogic;
import mods.gregtech.recipe.IRecipe;

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
	.outputs([<contenttweaker:pulsatingmesh>])
	.duration(180).EUt(16).buildAndRegister();

// Endervoir
recipes.removeByRecipeName("enderio:reservoir");
assembler.recipeBuilder()
	.inputs([<ore:blockGlassHardened> * 18, <metaitem:plateDoubleEnergeticAlloy> * 3, <minecraft:cauldron>])
	.outputs(<enderio:block_reservoir> * 3)
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
	  C : <ore:circuitBasic>});

/////////////	 Tier Four and Half Space Ship  	  //////////////////
makeExtremeRecipe7(<contenttweaker:tierfourandhalfship>,
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
	  G : <contenttweaker:t1guidance>,
	  L : <contenttweaker:t2laser>,
	  P : <metaitem:plateDoubleLumium>,
	  T : <simplyjetpacks:metaitemmods:9>,
	  W : <metaitem:plateDoubleTungstenCarbide>,
	  A : <metaitem:robot.arm.hv>,
	  I : <redstonearsenal:tool.sword_flux> }
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

// Solidified Experience
solidifier.recipeBuilder()
    .fluidInputs([<liquid:xpjuice> * 160])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<actuallyadditions:item_solidified_experience>)
    .duration(500).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
	.inputs(<actuallyadditions:item_solidified_experience>)
	.fluidOutputs(<liquid:xpjuice> * 160)
	.duration(80).EUt(32).buildAndRegister();

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
	.inputs(<contenttweaker:grainsofinnocence>)
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
	.outputs(<contenttweaker:quantumflux> * 8)
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
	[<metaitem:wireGtSingleVibrantAlloy>,<enderio:item_liquid_conduit:1>,<metaitem:wireGtSingleVibrantAlloy>], 
	[<ore:itemConduitBinder>, <metaitem:foilPolyvinylChloride>, <ore:itemConduitBinder>]]);


//item conduit - assembler
assembler.recipeBuilder()
    .inputs([<ore:wireGtSinglePulsatingIron> * 3, <ore:itemConduitBinder> * 4, <metaitem:foilPolyvinylChloride> * 2])
    .outputs([<enderio:item_item_conduit> * 8])
    .duration(80).EUt(16).buildAndRegister();

//ender fluid conduit - assembler
assembler.recipeBuilder()
    .inputs([<metaitem:wireGtSingleVibrantAlloy> * 2, <enderio:item_liquid_conduit:1>, <ore:itemConduitBinder> * 4, <metaitem:foilPolyvinylChloride> * 2])
    .outputs([<enderio:item_liquid_conduit:2> * 8])
    .duration(80).EUt(16).buildAndRegister();

// Elemental Reduction with H2SbF7
reactor.recipeBuilder()
    .inputs(<ore:dustPulsating> * 4)
    .fluidInputs([<liquid:fluoroantimonic_acid> * 1000])
    .fluidOutputs(<liquid:elementalreduction> * 12000)
    .duration(540).EUt(360).buildAndRegister();


////////////////////////// Creative Vending Upgrade ///////////////////////
val creativecell = <thermalexpansion:cell>.withTag({Recv: 250000, RSControl: 0 as byte, Facing: 3 as byte, Energy: 500000000, Creative: 1 as byte, SideCache: [2, 2, 2, 2, 2, 2] as byte[] as byte[], Level: 4 as byte, Send: 250000}, false);
val creativetank = <thermalexpansion:tank>.withTag({RSControl: 0 as byte, Creative: 1 as byte, Level: 4 as byte}, false);
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
      D : creativecell.only(isCreative),
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

// Ported Hard Recipe Configs
//// Harder Glass
//recipes.addShaped(<metaitem:dustQuartzSand>, [
//    [<minecraft:sand>, <ore:gtceMortars>]
//]);
//
//macerator.recipeBuilder() 
//    .inputs(<minecraft:sand>)
//    .outputs(<metaitem:dustQuartzSand>)
//    .duration(30).EUt(2)
//    .buildAndRegister();
//
//recipes.addShapeless(<metaitem:dustGlass>, [<metaitem:dustQuartzSand>, <metaitem:dustTinyFlint>]);
//
//furnace.remove(<minecraft:glass>);
//recipes.remove(<minecraft:glass_bottle>);
//
//// Harder Redstone
//recipes.remove(<minecraft:dispenser>);
//recipes.addShaped(<minecraft:dispenser>, [
//    [<minecraft:cobblestone>, <metaitem:ringIron>, <minecraft:cobblestone>],
//    [<metaitem:springIron>, <minecraft:string>, <metaitem:springIron>],
//    [<metaitem:gearSmallIron>, <metaitem:stickRedAlloy>, <metaitem:gearSmallIron>]
//]);
//
//recipes.remove(<minecraft:comparator>);
//recipes.remove(<minecraft:repeater>);
//
//recipes.remove(<minecraft:piston>);
//// Piston * 4
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateAluminium>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
//// Piston * 2
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateSteel>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
//// Piston * 8
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateTitanium>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
//// Piston * 1
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateBronze>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
//// Piston * 1
//<recipemap:assembler>.findRecipe(16, [<metaitem:plateIron>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
//
//recipes.addShaped(<minecraft:piston>, [
//    [<ore:plankWood>,<ore:plankWood>,<ore:plankWood>],
//    [<metaitem:gearSmallIron>, <ore:fenceWood>, <metaitem:gearSmallIron>],
//    [<minecraft:cobblestone>, <metaitem:plateRedAlloy>, <minecraft:cobblestone>]
//]);
//assembler.recipeBuilder()
//    .inputs(<ore:stickIron>, <metaitem:gearSmallIron>, <ore:slabWood>, <minecraft:cobblestone>)
//    .fluidInputs(<liquid:red_alloy> * 144)
//    .outputs(<minecraft:piston>)
//    .duration(240).EUt(7).buildAndRegister();
//
//assembler.recipeBuilder()
//    .inputs(<ore:stickSteel>, <metaitem:gearSmallSteel>, <ore:slabWood> * 2, <minecraft:cobblestone> * 2)
//    .fluidInputs(<liquid:red_alloy> * 288)
//    .outputs(<minecraft:piston> * 2)
//    .duration(240).EUt(7).buildAndRegister();
//
//assembler.recipeBuilder()
//    .inputs(<ore:stickAluminium>, <metaitem:gearSmallAluminium>, <ore:slabWood> * 4, <minecraft:cobblestone> * 4)
//    .fluidInputs(<liquid:red_alloy> * 432)
//    .outputs(<minecraft:piston> * 4)
//    .duration(240).EUt(7).buildAndRegister();
//
//assembler.recipeBuilder()
//    .inputs(<ore:stickStainlessSteel>, <metaitem:gearSmallStainlessSteel>, <ore:slabWood> * 8, <minecraft:cobblestone> * 8)
//    .fluidInputs(<liquid:red_alloy> * 576)
//    .outputs(<minecraft:piston> * 8)
//    .duration(240).EUt(7).buildAndRegister();
//
//assembler.recipeBuilder()
//    .inputs(<ore:stickTitanium>, <metaitem:gearSmallTitanium>, <ore:slabWood> * 16, <minecraft:cobblestone> * 16)
//    .fluidInputs(<liquid:red_alloy> * 1152)
//    .outputs(<minecraft:piston> * 16)
//    .duration(240).EUt(7).buildAndRegister();
//
//recipes.remove(<minecraft:observer>);
//recipes.addShaped(<minecraft:observer>, [
//    [<metaitem:ringIron>, <ore:cobblestone>, <metaitem:ringIron>],
//    [ <ore:cobblestone>, <minecraft:quartz>, <ore:cobblestone>],
//    [<ore:gearSmallIron>, <ore:stickRedAlloy>, <ore:gearSmallIron>]
//]);
//
//recipes.addShaped(<minecraft:observer>, [
//    [<metaitem:ringIron>, <ore:cobblestone>, <metaitem:ringIron>],
//    [ <ore:cobblestone>, <ore:crystalCertusQuartz>, <ore:cobblestone>],
//    [<ore:gearSmallIron>, <ore:stickRedAlloy>, <ore:gearSmallIron>]
//]);
//
//recipes.addShaped(<minecraft:observer>, [
//    [<metaitem:ringIron>, <ore:cobblestone>, <metaitem:ringIron>],
//    [ <ore:cobblestone>, <ore:gemQuartzite>, <ore:cobblestone>],
//    [<ore:gearSmallIron>, <ore:stickRedAlloy>, <ore:gearSmallIron>]
//]);
//
//// Charcoal
//furnace.remove(<minecraft:coal:1>);
//
//// Hard EBF
//recipes.removeByRecipeName("gregtech:electric_blast_furnace");
//recipes.addShaped(<metaitem:electric_blast_furnace>, [
//    [<metaitem:electric_furnace.lv>,<metaitem:electric_furnace.lv>,<metaitem:electric_furnace.lv>],
//    [<ore:circuitBasic>, <gregtech:metal_casing:2>, <ore:circuitBasic>],
//    [<ore:cableGtSingleTin>,<ore:circuitBasic> ,<ore:cableGtSingleTin>]
//]);
//

//Numismatic Dynamo
recipes.remove(<thermalexpansion:dynamo:5>);
recipes.addShaped(<thermalexpansion:dynamo:5>, [
	[null, <contenttweaker:excitationcoil>, null],
	[<metaitem:plateZeron100>, <morefurnaces:furnaceblock:2>, <metaitem:plateZeron100>],
	[<enderio:item_material:13>, <thermalfoundation:material:514>, <enderio:item_material:13>]]);

// Auto Maintenance Hatch
recipes.removeByRecipeName("gregtech:maintenance_hatch_automatic");
recipes.addShaped(<metaitem:maintenance_hatch_full_auto>, [
    [<ore:circuitElite>, <metaitem:maintenance_hatch>, <ore:circuitElite>],
    [<metaitem:robot.arm.iv>, <metaitem:hull.iv>, <metaitem:robot.arm.iv>],
    [<ore:circuitElite>, <metaitem:maintenance_hatch>, <ore:circuitElite>]
]);

// Fluid Storage
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_components_cell_1k_part");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_components_cell_4k_part");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_components_cell_16k_part");
recipes.removeByRecipeName("appliedenergistics2:network/cells/fluid_storage_components_cell_64k_part");

assembler.recipeBuilder()
    .inputs(<metaitem:gemExquisiteLapis> * 2, <ore:crystalPureCertusQuartz> * 4, <appliedenergistics2:material:22>, <ore:circuitExtreme> * 2)
    .outputs(<appliedenergistics2:material:54>)
    .duration(100).EUt(960)
    .buildAndRegister();

assembler.recipeBuilder()
    .inputs(<metaitem:gemExquisiteLapis> * 2, <ore:crystalPureCertusQuartz> * 4, <appliedenergistics2:material:23>, <appliedenergistics2:material:54> * 3)
    .outputs(<appliedenergistics2:material:55>)
    .duration(100).EUt(960)
    .buildAndRegister();

assembler.recipeBuilder()
    .inputs(<metaitem:gemExquisiteLapis> * 2, <ore:crystalPureCertusQuartz> * 4, <appliedenergistics2:material:23>, <appliedenergistics2:material:55> * 3)
    .outputs(<appliedenergistics2:material:56>)
    .duration(100).EUt(960)
    .buildAndRegister();

assembler.recipeBuilder()
    .inputs(<metaitem:gemExquisiteLapis> * 2, <ore:crystalPureCertusQuartz> * 4, <appliedenergistics2:material:23>, <appliedenergistics2:material:56> * 3)
    .outputs(<appliedenergistics2:material:57>)
    .duration(100).EUt(960)
    .buildAndRegister();

// Small Storage Crates
recipes.removeByRecipeName("actuallyadditions:recipes162");
assembler.recipeBuilder()
    .inputs(<ore:chestWood> * 4, <metaitem:frameTreatedWood> * 4, <metaitem:crate.steel>)
    .outputs(<actuallyadditions:block_giant_chest>)
    .duration(100).EUt(7).buildAndRegister();

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
	[<ore:frameGtHslaSteel>, <appliedenergistics2:material:1>, <ore:frameGtHslaSteel>], 
	[<appliedenergistics2:material:1>, <meta_tile_entity:hull.lv>, <appliedenergistics2:material:1>], 
	[<ore:frameGtHslaSteel>, <appliedenergistics2:material:1>, <ore:frameGtHslaSteel>]]);	

// Remove LCR Radon
<recipemap:large_chemical_reactor>.findRecipe(480, [<metaitem:ingotPlutonium> * 8, <metaitem:dustUranium>], [<liquid:air> * 10000]).remove();

// Es fluid extraction
extractor.recipeBuilder()
    .inputs(<contenttweaker:stabilizedeinsteinium>)
    .fluidOutputs(<liquid:einsteinium> * 9)
    .duration(16).EUt(30).buildAndRegister();

// Drill Core
assembler.recipeBuilder()
    .inputs(<metaitem:power_unit.lv>, <metaitem:electric.motor.lv> * 4, <metaitem:cableGtSingleTin> * 4, <metaitem:gearSmallSteel> * 4)
    .circuit(2)
    .outputs(<actuallyadditions:item_misc:16>)
    .duration(100).EUt(7).buildAndRegister();

// Ore Drilling Plants
// Basic Ore Drilling Plant * 1
<recipemap:assembler>.findRecipe(1920, [<metaitem:hull.ev>, <metaitem:frameTitanium> * 4, <metaitem:circuit.workstation> * 4, <metaitem:electric.motor.ev> * 4, <metaitem:electric.pump.ev> * 4, <metaitem:conveyor.module.ev> * 4, <metaitem:gearTungsten> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
// Advanced Ore Drilling Plant * 1
<recipemap:assembler>.findRecipe(7680, [<metaitem:hull.iv>, <metaitem:frameTungstenSteel> * 4, <metaitem:circuit.mainframe> * 4, <metaitem:electric.motor.iv> * 4, <metaitem:electric.pump.iv> * 4, <metaitem:conveyor.module.iv> * 4, <metaitem:gearIridium> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
// Advanced Ore Drilling Plant II * 1
<recipemap:assembler>.findRecipe(30720, [<metaitem:hull.luv>, <metaitem:frameHsss> * 4, <metaitem:circuit.nano_mainframe> * 4, <metaitem:electric.motor.luv> * 4, <metaitem:electric.pump.luv> * 4, <metaitem:conveyor.module.luv> * 4, <metaitem:gearRuridit> * 4, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

assembler.recipeBuilder()
    .inputs(<metaitem:hull.iv>, <enderio:item_stellar_alloy_pickaxe>, <contenttweaker:t3laser> * 12, <metaitem:frameStainlessSteel> * 12, <metaitem:sensor.iv> * 6, <metaitem:conveyor.module.iv> * 12, <metaitem:fluid.regulator.iv> * 12, <metaitem:gearTungstenSteel> * 12)
    .outputs(<metaitem:large_miner.ev>)
    .duration(400).EUt(7680).buildAndRegister();

assembly_line.recipeBuilder()
    .inputs(<metaitem:hull.zpm>, <thermalinnovation:drill:4>, <thermalinnovation:drill:4>, <thermalinnovation:drill:4>, <contenttweaker:t3laser> * 12, <metaitem:frameNaquadahAlloy> * 12, <metaitem:sensor.zpm> * 6, <metaitem:conveyor.module.zpm> * 12, <metaitem:fluid.regulator.zpm> * 12, <metaitem:cableGtSingleVanadiumGallium> * 12, <moreplates:empowered_void_gear> * 12)
    .fluidInputs(<liquid:concrete> * 2304)
    .outputs(<metaitem:large_miner.iv>)
    .duration(800).EUt(122880).buildAndRegister();

assembly_line.recipeBuilder()
    .inputs(<metaitem:hull.uhv>, <draconicevolution:draconic_staff_of_power>, <contenttweaker:t3laser> * 12, <metaitem:frameBerkelium> * 12, <metaitem:sensor.uv> * 12, <metaitem:conveyor.module.uv> * 24, <metaitem:fluid.regulator.uv> * 24, <metaitem:cableGtSingleEuropium> * 12, <metaitem:gearAwakenedDraconium> * 12)
    .fluidInputs(<liquid:concrete> * 2304, <liquid:naquadria> * 576)
    .outputs(<metaitem:large_miner.luv>)
    .duration(800).EUt(1966080).buildAndRegister();

//Draconium [tier 14]
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], [<liquid:neon> * 25]).remove();
// Hot Draconium Ingot * 1
<recipemap:electric_blast_furnace>.findRecipe(120, [<metaitem:dustDraconium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();

blast_furnace.recipeBuilder().inputs([<metaitem:dustDraconium>]).fluidInputs([<liquid:gasoline_premium> * 1000]).outputs(<metaitem:ingotHotDraconium>).property("temperature", 6800).duration(10000).EUt(120).buildAndRegister();
blast_furnace.recipeBuilder().inputs([<armorplus:material:3> * 4]).fluidInputs([<liquid:gasoline_premium> * 4000]).outputs([<metaitem:ingotHotDraconium> * 2]).property("temperature", 6800).duration(20000).EUt(120).buildAndRegister();

// Remove shortcut recipes
recipes.remove(<minecraft:stick> * 16);
recipes.removeByRecipeName("appliedenergistics2:misc/vanilla_comparator");
recipes.remove(<minecraft:chest> * 4);

// Removals
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:640>);
mods.jei.JEI.removeAndHide(<deepmoblearning:simulation_chamber>);
mods.jei.JEI.removeAndHide(<deepmoblearning:extraction_chamber>);
mods.jei.JEI.removeAndHide(<deepmoblearning:data_model_blank>);
mods.jei.JEI.removeAndHide(<deepmoblearning:living_matter_overworldian>);
mods.jei.JEI.removeAndHide(<deepmoblearning:living_matter_hellish>);
mods.jei.JEI.removeAndHide(<deepmoblearning:living_matter_extraterrestrial>);
mods.jei.JEI.removeAndHide(<deepmoblearning:polymer_clay>);
mods.jei.JEI.hideCategory("deepmoblearning.simulation_chamber");
mods.jei.JEI.hideCategory("deepmoblearning.extraction_chamber");
mods.jei.JEI.hideCategory("deepmoblearning.trial_keystone");
