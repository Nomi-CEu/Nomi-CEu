#packmode expert

import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeShaped as makeShaped;

// Hide Normal Mode Controllers
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:creative_tank_provider>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:dme_sim_chamber>);

// multiblock controller recipes
recipes.addShaped("microverse_projector_1", <metaitem:nomilabs:microverse_projector_1>, [
    [<ore:circuitHv>, <nomilabs:microverse_casing>, <ore:circuitHv>],
    [<nomilabs:microverse_casing>, <metaitem:cover.screen>, <nomilabs:microverse_casing>],
    [<ore:circuitHv>, <nomilabs:microverse_casing>, <ore:circuitHv>]
]);

recipes.addShaped("microverse_projector_2", <metaitem:nomilabs:microverse_projector_2>, [
    [<ore:circuitEv>, <nomilabs:microverse_casing>, <ore:circuitEv>],
    [<nomilabs:microverse_casing>, <metaitem:cover.screen>, <nomilabs:microverse_casing>],
    [<ore:circuitEv>, <nomilabs:microverse_casing>, <ore:circuitEv>]
]);

recipes.addShaped("microverse_projector_3", <metaitem:nomilabs:microverse_projector_3>, [
    [<ore:circuitIv>, <nomilabs:microverse_casing>, <ore:circuitIv>],
    [<nomilabs:microverse_casing>, <metaitem:cover.screen>, <nomilabs:microverse_casing>],
    [<ore:circuitIv>, <nomilabs:microverse_casing>, <ore:circuitIv>]
]);


// Naquadah Reactor
// Moved to Groovy

makeExtremeRecipe5(<metaitem:nomilabs:actualization_chamber>,
    ["PPPPP",
     "PEFSP",
     "PWGWP",
     "PSFEP",
     "PPPPP"],
    { G : <metaitem:field.generator.uv>,
      W : <ore:circuitUv>,
      P : <ore:plateAmericium>,
      E : <metaitem:emitter.uv>,
      S : <metaitem:sensor.uv>,
      F : <gregtech:fusion_casing:1> });

// Universal Crystallizer (Moved to Grooy)

// multiblock recipemap recipes
// basic projector
// t1 ores
microverse_projector_1.recipeBuilder()
    .duration(500)
    .EUt(500)
    .inputs(<nomilabs:tieroneship>,
            <nomilabs:quantumflux>,
            <minecraft:chest>)
    .fluidInputs(<liquid:rocket_fuel> * 8000)
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
microverse_projector_1.recipeBuilder()
    .duration(500)
    .EUt(500)
    .inputs(<nomilabs:tieroneship>,
            <nomilabs:quantumflux>,
            <nomilabs:gemsensor>)
    .fluidInputs(<liquid:rocket_fuel> * 8000)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <gregtech:ore_apatite_0> * 64,
             <gregtech:ore_tricalcium_phosphate_0> * 64,
             <gregtech:ore_quartzite_0> * 64)
    .buildAndRegister();


// t1 stellar creation data 1
microverse_projector_1.recipeBuilder()
    .duration(100)
    .EUt(500)
    .inputs(<nomilabs:tieroneship>,
            <nomilabs:ultradensehydrogen>)
    .fluidInputs(<liquid:rocket_fuel> * 2000)
    .outputs(<nomilabs:stellarcreationdata>)
    .buildAndRegister();


// st1 matter
microverse_projector_1.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .notConsumable(<nomilabs:tieroneship_stabilized>)
    .inputs(<minecraft:cobblestone>)
    .outputs(
        <nomilabs:tieroneship_stabilized_matter>
    ).buildAndRegister();

// t2 radium + ores
microverse_projector_1.recipeBuilder()
    .duration(600)
    .EUt(1000)
    .inputs(<nomilabs:tiertwoship>,
            <nomilabs:quantumflux> * 2)
    .fluidInputs(<liquid:rocket_fuel> * 12000)
    .outputs(<gregtech:ore_bauxite_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_tantalite_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
             <nomilabs:radiumsalt> * 64,
             <nomilabs:radiumsalt> * 64)
    .buildAndRegister();


// t2 stellar creation data
microverse_projector_1.recipeBuilder()
    .duration(120)
    .EUt(1000)
    .inputs(<nomilabs:tiertwoship>,
            <nomilabs:ultradensehydrogen> * 4)
    .fluidInputs(<liquid:rocket_fuel> * 3000)
    .outputs(<nomilabs:stellarcreationdata> * 4)
    .buildAndRegister();

// st2 matter
microverse_projector_1.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tiertwoship_stabilized>)
    .outputs(
        <nomilabs:tiertwoship_stabilized_matter>
    ).buildAndRegister();

// t3 gems
microverse_projector_1.recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<nomilabs:tierthreeship>,
            <nomilabs:quantumflux> * 4,
            <nomilabs:gemsensor>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
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
microverse_projector_1.recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<nomilabs:tierthreeship>,
            <nomilabs:quantumflux> * 4,
            <meta_tile_entity:super_chest.mv>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
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
             <gregtech:ore_lepidolite_0:1> * 64,
             <gregtech:ore_cobaltite_0:1> * 64,
             <gregtech:ore_laurite_0:1> * 16,
             <gregtech:ore_cuprorhodsite_0:1> * 8)
    .buildAndRegister();


// t3 magma
microverse_projector_1.recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<nomilabs:tierthreeship>,
            <nomilabs:quantumflux> * 4,
            <metaitem:super_chest.lv>)
    .fluidInputs(<liquid:rocket_fuel> * 20000)
    .outputs(<nomilabs:densemagma> * 64, <nomilabs:densemagma> * 64)
    .buildAndRegister();

// st3 matter
microverse_projector_1.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tierthreeship_stabilized>)
    .outputs(
        <nomilabs:tierthreeship_stabilized_matter>
    ).buildAndRegister();

// advanced projector
// t4 oil and infinity
microverse_projector_2.recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<nomilabs:tierfourship>,
            <nomilabs:quantumflux> * 8,
            <advancedrocketry:satelliteprimaryfunction:1>,
            <ore:dustPetrotheum> * 64)
    .outputs(<nomilabs:denseoilshale> * 64,
             <nomilabs:denseoilshale> * 64,
             <ore:compressed2xDustBedrock>.firstItem * 32)
    .buildAndRegister();


// t4 dense gem ores
microverse_projector_2.recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<nomilabs:tierfourship>,
            <nomilabs:quantumflux> * 8,
            <nomilabs:gemsensor>,
            <ore:dustPetrotheum> * 64) 
    .outputs(<densemetals:dense_lapis_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_coal_ore>  * 64,
             <densemetals:dense_emerald_ore> * 32,
             <densemetals:dense_redstone_ore> * 16)
    .buildAndRegister();



// t4 pgs ores
microverse_projector_2.recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<nomilabs:tierfourship>,
            <nomilabs:quantumflux> * 8,
            <nomilabs:witherrealmdata> * 4,
            <ore:dustPetrotheum> * 64) 
    .outputs(<gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_cooperite_0:1> * 64)
    .buildAndRegister();


// st4 matter
microverse_projector_2.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tierfourship_stabilized>)
    .outputs(
        <nomilabs:tierfourship_stabilized_matter>
    ).buildAndRegister();

// t4.5 ow mobs
microverse_projector_2.recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<nomilabs:tierfourandhalfship>,
            <nomilabs:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <ore:treeSapling>)
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
microverse_projector_2.recipeBuilder()
    .duration(1000)
    .EUt(3750)
    .inputs(<nomilabs:tierfourandhalfship>,
            <nomilabs:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <minecraft:netherrack>)
    .outputs(<minecraft:blaze_rod> * 50,
             <minecraft:blaze_rod> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2052> * 50,
             <thermalfoundation:material:2052> * 50,
             <minecraft:ghast_tear> * 64,
             <minecraft:skull:1>* 48,
             <armorplus:material:2> * 64,
             <armorplus:material:2> * 64,
             <minecraft:magma_cream> * 64,
             <extrautils2:ingredients:10> * 4)
    .buildAndRegister();


// t4.5 end mobs
microverse_projector_2.recipeBuilder()
    .duration(1200)
    .EUt(3750)
    .inputs(<nomilabs:tierfourandhalfship>,
            <nomilabs:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <minecraft:end_stone>)
    .outputs(<enderio:block_enderman_skull> * 48,
             <metaitem:blockEnderPearl> * 16,
             <minecraft:shulker_shell> * 64,
             <minecraft:shulker_shell> * 64,
             <darkutils:shulker_pearl> * 64)
    .buildAndRegister();



// t4.5 dragon
microverse_projector_2.recipeBuilder()
    .duration(2000)
    .EUt(10000)
    .inputs(<nomilabs:tierfourandhalfship>,
            <nomilabs:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <minecraft:ender_eye> * 16)
    .outputs(<nomilabs:dragonlairdata> * 64,
             <nomilabs:dragonlairdata> * 64,
             <nomilabs:dragonlairdata> * 64,
             <nomilabs:dragonlairdata> * 64,
             <minecraft:skull:5>)
    .buildAndRegister();


// t4.5 wither
microverse_projector_2.recipeBuilder()
    .duration(2000)
    .EUt(10000)
    .inputs(<nomilabs:tierfourandhalfship>,
            <nomilabs:quantumflux> * 8,
            <thermalfoundation:material:1026> * 64,
            <armorplus:material:2> * 64)
    .outputs(<nomilabs:witherrealmdata> * 64,
             <nomilabs:witherrealmdata> * 64,
             <metaitem:blockNetherStar> * 48)
    .buildAndRegister();


// st4.5 matter
microverse_projector_2.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tierfourandhalfship_stabilized>)
    .outputs(
        <nomilabs:tierfourandhalfship_stabilized_matter>
    ).buildAndRegister();

// t5 ores
microverse_projector_2.recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<nomilabs:tierfiveship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizeduranium> * 32)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_palladium_0> * 64,
             <gregtech:ore_realgar_0> * 64,
             <gregtech:ore_bastnasite_0> * 64,
             <gregtech:ore_sphalerite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 6,
             <gregtech:ore_iridosmine_8020_0> * 6,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_fluorite_0> * 64)
    .buildAndRegister();


// t5 naquadah trinium
microverse_projector_2.recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<nomilabs:tierfiveship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizedplutonium> * 32)
    .outputs(<gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_kaemanite_0> * 24)
    .buildAndRegister();


// st5 matter
microverse_projector_2.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tierfiveship_stabilized>)
    .outputs(
        <nomilabs:tierfiveship_stabilized_matter>
    ).buildAndRegister();

// t6 u/os/ir
microverse_projector_2.recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<nomilabs:tiersixship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizeduranium> * 32,
            <nomilabs:witherrealmdata> * 16)
    .outputs(<gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_iridosmine_8020_0> * 24)
    .buildAndRegister();


// t6 einsteinium
microverse_projector_2.recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<nomilabs:tiersixship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizedplutonium> * 32,
            <nomilabs:witherrealmdata> * 64)
    .outputs(<nomilabs:stabilizedeinsteinium> * 32)
    .buildAndRegister();

// t6 eggs
microverse_projector_2.recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<nomilabs:tiersixship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizedplutonium> * 32,
            <nomilabs:dragonlairdata> * 16)
    .outputs(<minecraft:dragon_egg> * 32)
    .buildAndRegister();


// st6 matter
microverse_projector_2.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tiersixship_stabilized>)
    .outputs(
        <nomilabs:tiersixship_stabilized_matter>
    ).buildAndRegister();

// advanced projector 2
// t7 hearts
microverse_projector_3.recipeBuilder()
    .duration(1500)
    .EUt(31250)
    .inputs(<nomilabs:tiersevenship>,
            <nomilabs:quantumflux> * 32,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <nomilabs:dragonlairdata> * 32)
    .outputs(<draconicevolution:dragon_heart> * 32,
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
             <metaitem:blockRuthenium> * 16) 
    .buildAndRegister();


// t7 chaos lair data
microverse_projector_3.recipeBuilder()
    .duration(1500)
    .EUt(31250)
    .inputs(<nomilabs:tiersevenship>,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <nomilabs:gemsensor>,
            <nomilabs:dragonlairdata> * 64,
            <nomilabs:dragonlairdata> * 64,
            <nomilabs:dragonlairdata> * 64,
            <nomilabs:dragonlairdata> * 64)
    .outputs(<nomilabs:lairofthechaosguardiandata>)
    .buildAndRegister();


// st7 matter
microverse_projector_3.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tiersevenship_stabilized>)
    .outputs(
        <nomilabs:tiersevenship_stabilized_matter>
    ).buildAndRegister();

// t8 gravistar nt
microverse_projector_3.recipeBuilder()
    .duration(2000)
    .EUt(62500)
    .inputs(<nomilabs:tiereightship>,
            <nomilabs:quantumflux> * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <nomilabs:witherrealmdata> * 64,
            <nomilabs:witherrealmdata> * 64)
    .outputs(<metaitem:quantumstar> * 32,
             <metaitem:quantumeye> * 64,
             <avaritia:resource:2> * 64,
             <avaritia:resource:2> * 64,
             <metaitem:gravistar>)
    .buildAndRegister();


// t8 shards eggs
microverse_projector_3.recipeBuilder()
    .duration(1500)
    .EUt(62500)
    .inputs(<nomilabs:tiereightship>,
            <nomilabs:quantumflux> * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <ore:gemDilithium>.firstItem * 64,
            <nomilabs:lairofthechaosguardiandata>)
    .outputs(<draconicevolution:chaos_shard> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64)
    .buildAndRegister();


// st8 matter
microverse_projector_3.recipeBuilder()
    .duration(9408)
    .EUt(30720)
    .inputs(<minecraft:cobblestone>)
    .notConsumable(<nomilabs:tiereightship_stabilized>)
    .outputs(
        <nomilabs:tiereightship_stabilized_matter>
    ).buildAndRegister();

// t8.5 darmstadtite
microverse_projector_3.recipeBuilder()
    .duration(9000)
    .EUt(250000)
    .inputs(<nomilabs:tiereightandhalfship>,
            <metaitem:neutron_reflector> * 8,
            <metaitem:blockNaquadah> * 24,
            <draconicevolution:chaos_shard>)
    .outputs(
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64,
        <gregtech:ore_darmstadtite_0:2> * 64)
    .buildAndRegister();

// t8.5 dulysite
microverse_projector_3.recipeBuilder()
    .duration(9000)
    .EUt(250000)
    .inputs(<nomilabs:tiereightandhalfship>,
            <nomilabs:gemsensor> * 8,
            <metaitem:blockNaquadah> * 24,
            <draconicevolution:chaos_shard>)
    .outputs(
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64,
        <gregtech:ore_dulysite_0:2> * 64)
    .buildAndRegister();

// t9 nt
microverse_projector_3.recipeBuilder()
    .duration(3000)
    .EUt(250000)
    .inputs(<nomilabs:tiernineship>,
            <metaitem:neutron_reflector> * 8,
            <metaitem:nomilabs:blockAwakenedDraconium> * 4,
            <nomilabs:stellarcreationdata>)
    .outputs(<ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64,
             <ore:nuggetNeutronium>.firstItem * 64)
    .buildAndRegister();

// t9 universe creation data
microverse_projector_3.recipeBuilder()
    .duration(3000)
    .EUt(250000)
    .inputs(<nomilabs:tiernineship>,
            <metaitem:nomilabs:blockAwakenedDraconium> * 4,
            <nomilabs:stellarcreationdata> * 64,
            <nomilabs:stellarcreationdata> * 64,
            <nomilabs:stellarcreationdata> * 64,
            <nomilabs:stellarcreationdata> * 64)
    .outputs(<nomilabs:universecreationdata>)
    .buildAndRegister();

// t10 hotu
microverse_projector_3.recipeBuilder()
    .duration(6000)
    .EUt(1000000)
    .inputs(<nomilabs:tiertenship>,
            <nomilabs:universecreationdata>,
            <ore:blockAwakenedDraconium> * 8)
    .outputs(<nomilabs:heartofauniverse>)
    .buildAndRegister();


// actualization
// t1 ores
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tieroneship_stabilized_matter>)
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
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tieroneship_stabilized_matter>)
    .circuit(2)
    .outputs(<metaitem:gemPerfectDiamond> * 64,
             <gregtech:ore_apatite_0> * 64,
             <gregtech:ore_tricalcium_phosphate_0> * 64,
             <gregtech:ore_quartzite_0> * 64)
    .buildAndRegister();

// t1 stellar data
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tieroneship_stabilized_matter>)
    .circuit(3)
    .outputs(<nomilabs:stellarcreationdata>)
    .buildAndRegister();


// t2 ores
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiertwoship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_bauxite_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_pyrochlore_0:2> * 64,
             <gregtech:ore_tantalite_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
             <nomilabs:radiumsalt> * 64,
             <nomilabs:radiumsalt> * 64)
    .buildAndRegister();


// t2 stellar creation data
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiertwoship_stabilized_matter>)
    .circuit(2)
    .outputs(<nomilabs:stellarcreationdata> * 4)
    .buildAndRegister();


// t3 gems
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierthreeship_stabilized_matter>)
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
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierthreeship_stabilized_matter>)
    .circuit(2)
    .outputs(<gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_scheelite_0:1> * 64,
             <gregtech:ore_tungstate_0:1> * 64,
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
             <gregtech:ore_lepidolite_0:1> * 64,
             <gregtech:ore_cobaltite_0:1> * 64,
             <gregtech:ore_laurite_0:1> * 16,
             <gregtech:ore_cuprorhodsite_0:1> * 8)
    .buildAndRegister();

// t3 magma
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierthreeship_stabilized_matter>)
    .circuit(3)
    .outputs(<nomilabs:densemagma> * 64, <nomilabs:densemagma> * 64)
    .buildAndRegister();



// t4 oil and infinity
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourship_stabilized_matter>)
    .circuit(1)
    .outputs(<nomilabs:denseoilshale> * 64,
             <nomilabs:denseoilshale> * 64,
             <ore:compressed2xDustBedrock>.firstItem * 32)
    .buildAndRegister();

// t4 ores
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourship_stabilized_matter>)
    .circuit(2)
    .outputs(<densemetals:dense_lapis_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_diamond_ore> * 64,
             <densemetals:dense_coal_ore>  * 64,
             <densemetals:dense_emerald_ore> * 32,
             <densemetals:dense_redstone_ore> * 16)
    .buildAndRegister();

// t4 pgs ores
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourship_stabilized_matter>)
    .circuit(3)
    .outputs(<gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_pentlandite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_chalcocite_0:1> * 64,
             <gregtech:ore_cooperite_0:1> * 64)
    .buildAndRegister();


// t4.5 ow mobs
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourandhalfship_stabilized_matter>)
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
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourandhalfship_stabilized_matter>)
    .circuit(2)
    .outputs(<minecraft:blaze_rod> * 50,
             <minecraft:blaze_rod> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2048> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2050> * 50,
             <thermalfoundation:material:2052> * 50,
             <thermalfoundation:material:2052> * 50,
             <minecraft:ghast_tear> * 64,
             <minecraft:skull:1>* 48,
             <armorplus:material:2> * 64,
             <armorplus:material:2> * 64,
             <minecraft:magma_cream> * 64,
             <extrautils2:ingredients:10> * 4)
    .buildAndRegister();

// t4.5 end mobs
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourandhalfship_stabilized_matter>)
    .circuit(3)
    .outputs(<enderio:block_enderman_skull> * 48,
             <metaitem:blockEnderPearl> * 16,
             <minecraft:shulker_shell> * 64,
             <minecraft:shulker_shell> * 64,
             <darkutils:shulker_pearl> * 64)
    .buildAndRegister();

// t4.5 dragon
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourandhalfship_stabilized_matter>)
    .circuit(4)
    .outputs(<nomilabs:dragonlairdata> * 64,
             <nomilabs:dragonlairdata> * 64,
             <nomilabs:dragonlairdata> * 64,
             <nomilabs:dragonlairdata> * 64,
             <minecraft:skull:5>)
    .buildAndRegister();

// t4.5 wither
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfourandhalfship_stabilized_matter>)
    .circuit(5)
    .outputs(<nomilabs:witherrealmdata> * 64,
             <nomilabs:witherrealmdata> * 64,
             <metaitem:blockNetherStar> * 48)
    .buildAndRegister();


// t5 ores
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfiveship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_palladium_0> * 64,
             <gregtech:ore_realgar_0> * 64,
             <gregtech:ore_bastnasite_0> * 64,
             <gregtech:ore_sphalerite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:ore_monazite_0> * 64,
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 6,
             <gregtech:ore_iridosmine_8020_0> * 6,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_fluorite_0> * 64)
    .buildAndRegister();

// t5 nq ke
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tierfiveship_stabilized_matter>)
    .circuit(2)
    .outputs(<gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_pollucite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_snowchestite_0> * 64,
             <gregtech:ore_kaemanite_0> * 24)
    .buildAndRegister();


// t6 u/pgs
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiersixship_stabilized_matter>)
    .circuit(1)
    .outputs(<gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_uraninite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_iridosmine_8020_0> * 24)
    .buildAndRegister();

// t6 es
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiersixship_stabilized_matter>)
    .circuit(2)
    .outputs(<nomilabs:stabilizedeinsteinium> * 32)
    .buildAndRegister();

// t6 eggs
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiersixship_stabilized_matter>)
    .circuit(3)
    .outputs(<minecraft:dragon_egg> * 32)
    .buildAndRegister();


// t7 hearts
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiersevenship_stabilized_matter>)
    .circuit(1)
    .outputs(<draconicevolution:dragon_heart> * 32,
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
             <metaitem:blockRuthenium> * 16) 
    .buildAndRegister();

// t7 chaos
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiersevenship_stabilized_matter>)
    .circuit(2)
    .outputs(<nomilabs:lairofthechaosguardiandata>)
    .buildAndRegister();



// t8 nt
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiereightship_stabilized_matter>)
    .circuit(1)
    .outputs(<metaitem:quantumstar> * 32,
             <metaitem:quantumeye> * 64,
             <avaritia:resource:2> * 64,
             <avaritia:resource:2> * 64,
             <metaitem:gravistar>)
    .buildAndRegister();

// t8 eggs
actualization_chamber.recipeBuilder()
    .duration(780)
    .EUt(30720)
    .inputs(<nomilabs:tiereightship_stabilized_matter>)
    .circuit(2)
    .outputs(<draconicevolution:chaos_shard> * 4,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64,
             <minecraft:dragon_egg> * 64)
    .buildAndRegister();

// Naquadah Reactor Mk1 Recipes
naquadah_reactor_1.recipeBuilder()
    .duration(938)
    .EUt(393216)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_1.recipeBuilder()
    .duration(3750)
    .EUt(393216)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

// Naquadah Reactor Mk2 Recipes
naquadah_reactor_2.recipeBuilder()
    .duration(1875)
    .EUt(1572864)
    .inputs(<metaitem:boltNaquadahEnriched>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();

naquadah_reactor_2.recipeBuilder()
    .duration(7500)
    .EUt(1572864)
    .inputs(<metaitem:boltNaquadria>)
    .outputs(<metaitem:boltLead>)
    .buildAndRegister();
