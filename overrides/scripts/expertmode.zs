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
recipes.addShaped(<dimensionaledibles:nether_cake>, [[<metaitem:dustNetherrack>,<metaitem:dustNetherrack>,<metaitem:dustNetherrack>], [<minecraft:obsidian>, <enderio:item_material:70>, <minecraft:obsidian>],[<metaitem:blockLead>,<extrautils2:simpledecorative:1>,<metaitem:blockLead>]]);

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

// Hard Firebricks
recipes.removeByRecipeName("gregtech:casing_primitive_bricks");
recipes.addShaped(<gregtech:metal_casing:1>, [
    [<metaitem:brick.fireclay>, <metaitem:dustGypsum>, <metaitem:brick.fireclay>],
    [<metaitem:brick.fireclay>, <forge:bucketfilled>.withTag({FluidName: "concrete", Amount: 1000}), <metaitem:brick.fireclay>],
    [<metaitem:brick.fireclay>, <metaitem:dustGypsum>, <metaitem:brick.fireclay>]
]);

recipes.addShaped(<forge:bucketfilled>.withTag({FluidName: "concrete", Amount: 1000}), [
    [<metaitem:dustCalcite>, <minecraft:bucket>, <metaitem:dustStone>],
    [<metaitem:dustCalcite>, <minecraft:water_bucket>, <metaitem:dustQuartzSand>],
    [null, <metaitem:dustClay>, null]
]);

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

// Actualization Chamber
val actualization_chamber = Builder.start("actualization_chamber")
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("CCC","GGG","CCC")
            .aisle("CCC","GOG","CCC")
            .aisle("CSC","GGG","CCC")
            .where('S', controller.self())
            .where('O', <metastate:gregtech:fusion_casing:1>)
            .where('G', <metastate:gregtech:transparent_casing:1>)
            .where('C', CTPredicate.states(<metastate:gregtech:fusion_casing:4>)
            | controller.autoAbilities(true, false, true, true, false, false, false)
            )
            .build();
        } as IPatternBuilderFunction)
    .withRecipeMap(
        FactoryRecipeMap.start("actualization_chamber")
            .minInputs(1)
            .maxInputs(2)
            .minOutputs(1)
            .maxOutputs(16)
            .build())
    .withBaseTexture(<cube_renderer:FUSION_TEXTURE>)
    .buildAndRegister();

actualization_chamber.hasMufflerMechanics = false;
actualization_chamber.hasMaintenanceMechanics = false;

makeExtremeRecipe5(<metaitem:multiblocktweaker:actualization_chamber>,
    ["PPPPP",
     "PEFSP",
     "PWGWP",
     "PSFEP",
     "PPPPP"],
    { G : <metaitem:field.generator.uv>,
      W : <ore:circuitInfinite>,
      P : <ore:plateAmericium>,
      E : <metaitem:emitter.uv>,
      S : <metaitem:sensor.uv>,
      F : <gregtech:fusion_casing:1> });

// t1 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tieroneship_stabilized_matter>)
    .circuit(1)
    .outputs(<densemetals:dense_iron_ore> * 64,
             <gregtech:ore_cassiterite_0> * 64,
             <gregtech:ore_redstone_0> * 64,
             <gregtech:ore_nickel_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_ilmenite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_galena_0> * 64,
             <gregtech:ore_molybdenum_0> * 64,
             <advancedrocketry:moonturf> * 64,
             <libvulpes:ore0> * 64,
             <gregtech:ore_salt_0> * 64)
    .buildAndRegister();

// t1 gems
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tieroneship_stabilized_matter>)
    .circuit(2)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <gregtech:ore_apatite_0> * 64,
             <gregtech:ore_tricalcium_phosphate_0> * 64,
             <gregtech:ore_quartzite_0> * 64)
    .buildAndRegister();

// t1 stellar data
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tieroneship_stabilized_matter>)
    .circuit(3)
    .outputs(<contenttweaker:stellarcreationdata>)
    .buildAndRegister();


// t2 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiertwoship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_bauxite_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
             <contenttweaker:radiumsalt> * 64,
             <contenttweaker:radiumsalt> * 64)
    .buildAndRegister();


// t3 gems
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierthreeship_stabilized_matter>)
    .circuit(1)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <metaitem:gemPerfectDiamond> * 32,
             <metaitem:gemPerfectRuby> * 64,
             <metaitem:gemPerfectTopaz> * 48,
             <metaitem:gemPerfectEmerald> * 32,
             <gregtech:ore_sapphire_0:1> * 64,
             <gregtech:ore_gold_0:1> * 64,
             <gregtech:ore_silver_0:1> * 64)
    .buildAndRegister();

// t3 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierthreeship_stabilized_matter>)
    .circuit(2)
    .outputs(<gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
             <gregtech:ore_ilmenite_0:1> * 64,
             <gregtech:ore_vanadium_magnetite_0:1> * 64,
             <gregtech:ore_tetrahedrite_0:1> * 64,
             <gregtech:ore_cassiterite_0:1> * 64,
             <gregtech:ore_tin_0:1> * 64,
             <gregtech:ore_redstone_0:1> * 64,
             <gregtech:ore_certus_quartz_0:1> * 64,
             <gregtech:ore_almandine_0:1> * 64,
             <gregtech:ore_lepidolite_0:1> * 64)
    .buildAndRegister();

// t3 magma
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierthreeship_stabilized_matter>)
    .circuit(3)
    .outputs(<contenttweaker:densemagma> * 64, <contenttweaker:densemagma> * 64)
    .buildAndRegister();



// t4 oil and infinity
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourship_stabilized_matter>)
    .circuit(1)
    .outputs(<contenttweaker:denseoilshale> * 64,
             <contenttweaker:denseoilshale> * 64,
             <ore:compressed2xDustBedrock>.firstItem * 16)
    .buildAndRegister();

// t4 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourship_stabilized_matter>)
    .circuit(2)
    .outputs(<densemetals:dense_lapis_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_coal_ore>  * 64,
             <densemetals:dense_emerald_ore> * 32,
             <densemetals:dense_redstone_ore> * 16)
    .buildAndRegister();

// t4 pgs ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourship_stabilized_matter>)
    .circuit(3)
    .outputs(<gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_cooperite_0:1> * 64,
             <gregtech:ore_osmiridium_8020_0> * 32,
             <gregtech:ore_iridosmine_8020_0> * 8)
    .buildAndRegister();


// t4.5 ow mobs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(1)
    .outputs(<minecraft:skull> * 48,
             <minecraft:bone> * 64,
             <minecraft:bone> * 64,
             <minecraft:bone> * 64,
             <minecraft:skull:2> * 48,
             <minecraft:rotten_flesh> * 64,
             <minecraft:rotten_flesh> * 64,
             <minecraft:rotten_flesh> * 64,
             <minecraft:skull:4> * 48,
             <minecraft:gunpowder> * 64,
             <minecraft:slime> * 64,
             <armorplus:material:1> * 64)
    .buildAndRegister();

// t4.5 nether mobs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(2)
    .outputs(<minecraft:blaze_rod> * 64,
             <minecraft:blaze_rod> * 64,
             <minecraft:ghast_tear> * 64,
             <minecraft:skull:1>* 48,
             <armorplus:material:2> * 64,
             <armorplus:material:2> * 64,
             <minecraft:magma_cream> * 64,
             <extrautils2:ingredients:10> * 4)
    .buildAndRegister();

// t4.5 end mobs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(3)
    .outputs(<enderio:block_enderman_skull> * 48,
             <metaitem:blockEnderPearl> * 16,
             <minecraft:shulker_shell> * 64,
             <minecraft:shulker_shell> * 64,
             <darkutils:shulker_pearl> * 64)
    .buildAndRegister();

// t4.5 dragon
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(4)
    .outputs(<contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <contenttweaker:dragonlairdata> * 64,
             <minecraft:skull:5>)
    .buildAndRegister();

// t4.5 wither
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfourandhalfship_stabilized_matter>)
    .circuit(5)
    .outputs(<contenttweaker:witherrealmdata> * 64,
             <contenttweaker:witherrealmdata> * 64,
             <metaitem:blockNetherStar> * 48)
    .buildAndRegister();


// t5 ores
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfiveship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_palladium_0> * 64,
             <gregtech:ore_realgar_0> * 64,
             <gregtech:ore_bastnasite_0> * 64,
             <gregtech:ore_sphalerite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 16,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64)
    .buildAndRegister();

// t5 nq ke
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tierfiveship_stabilized_matter>)
    .circuit(2)
    .outputs(<gregtech:ore_kaemanite_0:2> * 24,
             <gregtech:ore_naquadah_0:2> * 48)
    .buildAndRegister();


// t6 u/pgs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersixship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_iridosmine_8020_0> * 32)
    .buildAndRegister();

// t6 es
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersixship_stabilized_matter>)
    .circuit(2)
    .outputs(<contenttweaker:stabilizedeinsteinium> * 32)
    .buildAndRegister();

// t6 eggs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersixship_stabilized_matter>)
    .circuit(3)
    .outputs(<minecraft:dragon_egg> * 32)
    .buildAndRegister();


// t7 hearts
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersevenship_stabilized_matter>)
    .circuit(1)
    .outputs(<draconicevolution:dragon_heart> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_breath> * 64,
             <armorplus:material:3> * 64, 
             <armorplus:material:3> * 64,
             <armorplus:material:3> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <minecraft:gold_block> * 64,
             <metaitem:blockSilver> * 64, //Silver block
             <metaitem:blockSilver> * 64, //Silver Block
             <minecraft:diamond_block> * 64,
             <minecraft:diamond_block> * 64,
             <metaitem:blockPlatinum> * 64, //Platinum Block
             <metaitem:blockAmericium> * 16) 
    .buildAndRegister();

// t7 chaos
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiersevenship_stabilized_matter>)
    .circuit(2)
    .outputs(<contenttweaker:lairofthechaosguardiandata>)
    .buildAndRegister();



// t8 nt
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiereightship_stabilized_matter>)
    .circuit(1)
    .outputs(<metaitem:quantumstar> * 32,
             <metaitem:quantumeye> * 64,
             <avaritia:resource:2> * 64,
             <avaritia:resource:2> * 64,
             <metaitem:gravistar>)
    .buildAndRegister();

// t8 eggs
actualization_chamber.recipeMap
    .recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<contenttweaker:tiereightship_stabilized_matter>)
    .circuit(2)
    .outputs(<draconicevolution:chaos_shard> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64)
    .buildAndRegister();

// Harder Glass
recipes.addShaped(<metaitem:dustQuartzSand>, [
    [<minecraft:sand>, <ore:gtceMortars>]
]);

macerator.recipeBuilder()
    .inputs(<minecraft:sand>)
    .outputs(<metaitem:dustQuartzSand>)
    .duration(30).EUt(2)
    .buildAndRegister();

recipes.addShapeless(<metaitem:dustGlass>, [<metaitem:dustQuartzSand>, <metaitem:dustTinyFlint>]);

furnace.remove(<minecraft:glass>);
recipes.remove(<minecraft:glass_bottle>);

// Harder Redstone
recipes.remove(<minecraft:dispenser>);
recipes.addShaped(<minecraft:dispenser>, [
    [<minecraft:cobblestone>, <metaitem:ringIron>, <minecraft:cobblestone>],
    [<metaitem:springIron>, <minecraft:string>, <metaitem:springIron>],
    [<metaitem:gearSmallIron>, <metaitem:stickRedAlloy>, <metaitem:gearSmallIron>]
]);

recipes.remove(<minecraft:comparator>);
recipes.remove(<minecraft:repeater>);

recipes.remove(<minecraft:piston>);
// Piston * 4
<recipemap:assembler>.findRecipe(16, [<metaitem:plateAluminium>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
// Piston * 2
<recipemap:assembler>.findRecipe(16, [<metaitem:plateSteel>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
// Piston * 8
<recipemap:assembler>.findRecipe(16, [<metaitem:plateTitanium>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
// Piston * 1
<recipemap:assembler>.findRecipe(16, [<metaitem:plateBronze>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();
// Piston * 1
<recipemap:assembler>.findRecipe(16, [<metaitem:plateIron>, <minecraft:planks:0> * 3, <minecraft:cobblestone:0> * 4, <minecraft:redstone:0>], null).remove();

recipes.addShaped(<minecraft:piston>, [
    [<ore:plankWood>,<ore:plankWood>,<ore:plankWood>],
    [<metaitem:gearSmallIron>, <ore:fenceWood>, <metaitem:gearSmallIron>],
    [<minecraft:cobblestone>, <metaitem:plateRedAlloy>, <minecraft:cobblestone>]
]);
assembler.recipeBuilder()
    .inputs(<ore:stickIron>, <metaitem:gearSmallIron>, <ore:slabWood>, <minecraft:cobblestone>)
    .fluidInputs(<liquid:red_alloy> * 144)
    .outputs(<minecraft:piston>)
    .duration(240).EUt(7).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<ore:stickSteel>, <metaitem:gearSmallSteel>, <ore:slabWood> * 2, <minecraft:cobblestone> * 2)
    .fluidInputs(<liquid:red_alloy> * 288)
    .outputs(<minecraft:piston> * 2)
    .duration(240).EUt(7).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<ore:stickAluminium>, <metaitem:gearSmallAluminium>, <ore:slabWood> * 4, <minecraft:cobblestone> * 4)
    .fluidInputs(<liquid:red_alloy> * 432)
    .outputs(<minecraft:piston> * 4)
    .duration(240).EUt(7).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<ore:stickStainlessSteel>, <metaitem:gearSmallStainlessSteel>, <ore:slabWood> * 8, <minecraft:cobblestone> * 8)
    .fluidInputs(<liquid:red_alloy> * 576)
    .outputs(<minecraft:piston> * 8)
    .duration(240).EUt(7).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<ore:stickTitanium>, <metaitem:gearSmallTitanium>, <ore:slabWood> * 16, <minecraft:cobblestone> * 16)
    .fluidInputs(<liquid:red_alloy> * 1152)
    .outputs(<minecraft:piston> * 16)
    .duration(240).EUt(7).buildAndRegister();

recipes.remove(<minecraft:observer>);
recipes.addShaped(<minecraft:observer>, [
    [<metaitem:ringIron>, <ore:cobblestone>, <metaitem:ringIron>],
    [ <ore:cobblestone>, <minecraft:quartz>, <ore:cobblestone>],
    [<ore:gearSmallIron>, <ore:stickRedAlloy>, <ore:gearSmallIron>]
]);

recipes.addShaped(<minecraft:observer>, [
    [<metaitem:ringIron>, <ore:cobblestone>, <metaitem:ringIron>],
    [ <ore:cobblestone>, <ore:crystalCertusQuartz>, <ore:cobblestone>],
    [<ore:gearSmallIron>, <ore:stickRedAlloy>, <ore:gearSmallIron>]
]);

recipes.addShaped(<minecraft:observer>, [
    [<metaitem:ringIron>, <ore:cobblestone>, <metaitem:ringIron>],
    [ <ore:cobblestone>, <ore:gemQuartzite>, <ore:cobblestone>],
    [<ore:gearSmallIron>, <ore:stickRedAlloy>, <ore:gearSmallIron>]
]);

// Charcoal
furnace.remove(<minecraft:coal:1>);

// Hard EBF
recipes.removeByRecipeName("gregtech:electric_blast_furnace");
recipes.addShaped(<metaitem:electric_blast_furnace>, [
    [<metaitem:electric_furnace.lv>,<metaitem:electric_furnace.lv>,<metaitem:electric_furnace.lv>],
    [<ore:circuitBasic>, <gregtech:metal_casing:2>, <ore:circuitBasic>],
    [<ore:cableGtSingleTin>,<ore:circuitBasic> ,<ore:cableGtSingleTin>]
]);

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


// Removals
mods.jei.JEI.removeAndHide(<thermalexpansion:augment:640>);
mods.jei.JEI.removeAndHide(<deepmoblearning:simulation_chamber>);
mods.jei.JEI.removeAndHide(<deepmoblearning:extraction_chamber>);
mods.jei.JEI.removeAndHide(<deepmoblearning:data_model_blank>);
mods.jei.JEI.removeAndHide(<deepmoblearning:living_matter_overworldian>);
mods.jei.JEI.removeAndHide(<deepmoblearning:living_matter_hellish>);
mods.jei.JEI.removeAndHide(<deepmoblearning:living_matter_extraterrestrial>);
mods.jei.JEI.removeAndHide(<deepmoblearning:polymer_clay>);
