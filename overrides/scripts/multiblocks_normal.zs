#packmode normal

import scripts.common.makeShaped as makeShaped;

// Hide Hard Mode Controllers
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:actualization_chamber>);
mods.jei.JEI.removeAndHide(<metaitem:nomilabs:universal_crystallizer>);

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

recipes.addShaped("creative_tank_provider", <metaitem:nomilabs:creative_tank_provider>, [
    [<metaitem:emitter.zpm>, <metaitem:field.generator.luv>, <metaitem:emitter.zpm>],
    [<metaitem:field.generator.zpm>, <gcym:large_multiblock_casing:11>, <metaitem:field.generator.zpm>],
    [<ore:circuitZpm>, <metaitem:field.generator.uv>, <ore:circuitZpm>]
]);

// Naquadah Reactor
// Moved to Groovy



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
             <gregtech:ore_copper_0:2> * 64,
             <gregtech:ore_sphalerite_0:2> * 64,
             <gregtech:ore_cassiterite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_scheelite_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
             <gregtech:ore_tungstate_0:2> * 64,
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

// t2 gases
microverse_projector_1.recipeBuilder()
    .duration(700)
    .EUt(2000)
    .inputs(<nomilabs:tiertwoship>,
            <metaitem:electric.pump.hv> * 4,
            <thermalfoundation:material:1025> * 64)
    .fluidInputs(<liquid:rocket_fuel> * 12000)
    .outputs(<nomilabs:solidifiedneon> * 10,
            <nomilabs:solidifiedkrypton> * 10,
            <nomilabs:solidifiedxenon> * 10)
    .buildAndRegister();

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
             <gregtech:ore_cobaltite_0:1> * 64)
    .buildAndRegister();

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

// t4 osmium iridium
microverse_projector_2.recipeBuilder()
    .duration(800)
    .EUt(3750)
    .inputs(<nomilabs:tierfourship>,
            <nomilabs:quantumflux> * 8,
            <nomilabs:witherrealmdata> * 4,
            <ore:dustPetrotheum> * 64) 
    .outputs(<gregtech:ore_iridosmine_8020_0> * 64,
             <gregtech:ore_iridosmine_8020_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 16)
    .buildAndRegister();

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
             <gregtech:meta_block_compressed_26> * 64, //Ender Pearl Block
             <gregtech:ore_osmiridium_8020_0> * 16,
             <metaitem:dustBoron> * 64,
             <gregtech:ore_molybdenite_0> * 64,
             <gregtech:ore_beryllium_0> * 64,
             <gregtech:ore_beryllium_0> * 64)
    .buildAndRegister();

// t5 naquadah sheldonite trinium
microverse_projector_2.recipeBuilder()
    .duration(1000)
    .EUt(7500)
    .inputs(<nomilabs:tierfiveship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizedplutonium> * 32)
    .outputs(<gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_cooperite_0:2> * 64,
             <gregtech:ore_naquadah_0> * 64,
             <gregtech:ore_naquadah_0> * 64,
             <gregtech:ore_naquadah_0> * 64,
             <gregtech:ore_kaemanite_0> * 48)
    .buildAndRegister();

// t6 u/os/ir
microverse_projector_2.recipeBuilder()
    .duration(1250)
    .EUt(18750)
    .inputs(<nomilabs:tiersixship>,
            <nomilabs:quantumflux> * 16,
            <nomilabs:stabilizeduranium> * 32,
            <nomilabs:witherrealmdata> * 16)
    .outputs(<gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_uraninite_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 64,
             <gregtech:ore_osmiridium_8020_0> * 64,
             <gregtech:ore_iridosmine_8020_0> * 64,
             <gregtech:ore_iridosmine_8020_0> * 64)
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
             <ore:ingotNeutronium>.firstItem * 16,
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

// creative tank provider
// creative tank
creative_tank_provider.recipeBuilder()
    .notConsumable(<nomilabs:creativeportabletankmold>)
    .inputs(<minecraft:bucket>)
    .outputs(<metaitem:creative_tank>)
    .duration(500)
    .EUt(100000)
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
