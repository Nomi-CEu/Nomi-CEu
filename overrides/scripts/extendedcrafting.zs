import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.common.makeShaped as makeShaped;
import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeExtremeRecipe7 as makeExtremeRecipe7;
import scripts.common.makeExtremeRecipe9 as makeExtremeRecipe9;

val creativecell = <thermalexpansion:cell>.withTag({Creative: 1 as byte, Level: 4 as byte}, false);
val creativejetpack = <simplyjetpacks:itemjetpack>.withTag({JetpackParticleType: 3}, false);

//Noble Gasses
//centrifuge.findRecipe(30, [], [<liquid:liquid_air> * 53000]).remove();
//centrifuge.findRecipe(30, [], [<liquid:noble_gases> * 43000]).remove();

mods.jei.JEI.removeAndHide(<extendedcrafting:material>);
mods.jei.JEI.removeAndHide(<extendedcrafting:storage>);
mods.jei.JEI.removeAndHide(<extendedcrafting:material:3>);
mods.jei.JEI.removeAndHide(<extendedcrafting:table_basic>);

recipes.remove(<extendedcrafting:compressor>);
makeShaped("of_extendedcrafting_compressor", <extendedcrafting:compressor>,
    ["ABA",
     "CDC",
     "AEA"],
    { A : <metaitem:ingotBlackSteel>,
      B : <extendedcrafting:material:16>,
      C : <extendedcrafting:material:10>,
      D : <extendedcrafting:frame>,
      E : <metaitem:plateBlackSteel> });
      
recipes.remove(<extendedcrafting:guide>);

recipes.remove(<extendedcrafting:frame>);
makeShaped("of_extendedcrafting_frame", <extendedcrafting:frame>,
    ["AGA",
     "GBG",
     "AGA"],
    { A : <metaitem:ingotBlackSteel>,
      B : <metaitem:plateBlackSteel>,
      G : <minecraft:glass> });

recipes.remove(<extendedcrafting:interface>);
makeShaped("of_extendedcrafting_interface", <extendedcrafting:interface>,
    ["ABA",
     "CDC",
     "AEA"],
    { A : <metaitem:ingotBlackSteel>,
      B : <extendedcrafting:material:10>,
      C : <extendedcrafting:material:18>,
      D : <extendedcrafting:frame>,
      E : <metaitem:plateBlackSteel> });

//Remove the unavailable pedestal
recipes.removeByRecipeName("extendedcrafting:pedestal");

makeShaped("of_extendedcrafting_pedestal", <extendedcrafting:pedestal>,
    [" A ",
     " A ",
     "BCB"],
    { A : <metaitem:ingotBlackSteel>,
      B : <metaitem:plateBlackSteel>,
      C : <metaitem:blockRedSteel> }); //Red Steel Block

recipes.remove(<extendedcrafting:material:19>);

makeShaped("of_conflux_component", <extendedcrafting:material:19>,
    [" A ",
     "BCD",
     " E "],
    { A : <extendedcrafting:material:14>,
      B : <extendedcrafting:material:15>,
      C : <extendedcrafting:material:18>,
      D : <extendedcrafting:material:16>,
      E : <extendedcrafting:material:17> });

recipes.remove(<extendedcrafting:material:13>);

makeShaped("of_conflux_catalyst", <extendedcrafting:material:13>,
    [" A ",
     "BCD",
     " E "],
    { A : <extendedcrafting:material:8>,
      B : <extendedcrafting:material:9>,
      C : <extendedcrafting:material:12>,
      D : <extendedcrafting:material:10>,
      E : <extendedcrafting:material:11> });

recipes.removeByRecipeName("extrautils2:angel_ring_0");
recipes.removeByRecipeName("extrautils2:angel_ring_1");
recipes.removeByRecipeName("extrautils2:angel_ring_2");
recipes.removeByRecipeName("extrautils2:angel_ring_3");
recipes.removeByRecipeName("extrautils2:angel_ring_4");
recipes.removeByRecipeName("extrautils2:angel_ring_5");


makeExtremeRecipe5(<extrautils2:angelring>,
    [" GGG ",
     "G R G",
     "GV VG",
     "G R G",
     " GGG "],
    { G : <ore:ingotRoseGold>,
      R : reinforcedjetpack,
      V : vibrantjetpack });

///////////////////////// ZPM  ///////////////////////////////

makeExtremeRecipe9(<metaitem:zpm>,
    ["  NNNNN  ",
     "  NBCBN  ",
     "  NCBCN  ",
     "  NBCBN  ",
     "   UUU   ",
     "   UGU   ",
     "   UGU   ",
     "   UUU   ",
     "   NNN   "],
    { B : <nomilabs:stabilizedberkelium>,
      C : <nomilabs:stabilizedcalifornium>,
      G : <metaitem:field.generator.zpm>,
      N : <nuclearcraft:part:3>,
      U : <ore:circuitZpm> });


//Luminescence
recipes.remove(<extendedcrafting:material:7>);
mixer.recipeBuilder()
    .inputs([<ore:dustRedstone>, <ore:dustGlowstone>, <ore:dustAluminium> * 2])
    .fluidInputs([<liquid:phosphoric_acid> * 4000])
    .outputs(<extendedcrafting:material:7> * 8)
    .duration(20).EUt(30).buildAndRegister();

// Extended Crafting Components
recipes.remove(<extendedcrafting:material:14>);
recipes.addShaped(<extendedcrafting:material:14>,
    [[<metaitem:plateBlackSteel>, <extendedcrafting:material:7>],
     [<metaitem:plateNetherQuartz>, <metaitem:plateIron>]]);

recipes.remove(<extendedcrafting:material:15>);
recipes.addShaped(<extendedcrafting:material:15>,
    [[<metaitem:plateBlackSteel>, <extendedcrafting:material:7>],
     [<metaitem:plateElectrum>, <metaitem:plateGlowstone>]]);

recipes.remove(<extendedcrafting:material:16>);
recipes.addShaped(<extendedcrafting:material:16>,
    [[<metaitem:plateBlackSteel>, <extendedcrafting:material:7>],
     [<metaitem:plateAluminium>, <metaitem:plateEnderPearl>]]);

recipes.remove(<extendedcrafting:material:17>);
recipes.addShaped(<extendedcrafting:material:17>,
    [[<metaitem:plateBlackSteel>, <extendedcrafting:material:7>],
     [<metaitem:plateUranium235>, <metaitem:plateEmerald>]]);

recipes.remove(<extendedcrafting:material:18>);
recipes.addShaped(<extendedcrafting:material:18>,
    [[<metaitem:plateBlackSteel>, <extendedcrafting:material:7>],
     [<metaitem:plateOsmiridium>, <extendedcrafting:material:24>]]);

// Extended Crafting Catalysts
val catalystShape as string[] = [" A ",
                                 "ABA",
                                 " A "];

recipes.remove(<extendedcrafting:material:8>);
makeShaped("of_catalyst_1", <extendedcrafting:material:8>, catalystShape,
    { A : <extendedcrafting:material:14>,
      B : <metaitem:plateBlackSteel> });

recipes.remove(<extendedcrafting:material:9>);

makeShaped("of_catalyst_2", <extendedcrafting:material:9>, catalystShape,
    { A : <extendedcrafting:material:15>,
      B : <metaitem:plateBlackSteel> });


recipes.remove(<extendedcrafting:material:10>);
makeShaped("of_catalyst_3", <extendedcrafting:material:10>, catalystShape,
    { A : <extendedcrafting:material:16>,
      B : <metaitem:plateBlackSteel> });

recipes.remove(<extendedcrafting:material:11>);
makeShaped("of_catalyst_4", <extendedcrafting:material:11>, catalystShape,
    { A : <extendedcrafting:material:17>,
      B : <metaitem:plateBlackSteel> });

recipes.remove(<extendedcrafting:material:12>);
makeShaped("of_catalyst_5", <extendedcrafting:material:12>, catalystShape,
    { A : <extendedcrafting:material:18>,
      B : <metaitem:plateBlackSteel> });

//Advanced Extended Crafting Table
recipes.remove(<extendedcrafting:table_advanced>);
recipes.addShapeless(<extendedcrafting:table_advanced> * 2, [<extendedcrafting:table_advanced>]);
makeShaped("of_extendedcrafting_table_advanced", <extendedcrafting:table_advanced>,
    ["ABA",
     "CDC",
     "ABA"],
    { A : <extendedcrafting:material:15>,
      B : <extendedcrafting:material:8>,
      C : <metaitem:workbench>,
      D : <extendedcrafting:material:9> });

//Elite Extended Crafting Table
recipes.remove(<extendedcrafting:table_elite>);
recipes.addShapeless(<extendedcrafting:table_elite> * 2,[<extendedcrafting:table_elite>]);
makeExtremeRecipe5(<extendedcrafting:table_elite>,
    ["CBABC",
     "BDDDB",
     "ADTDA",
     "BDDDB",
     "CBABC"],
    { A : <extendedcrafting:material:10>,
      B : <metaitem:plateBlackSteel>,
      C : <metaitem:blockAluminium>,
      D : <extendedcrafting:material:16>,
      T : <extendedcrafting:table_advanced> });

//Ultimate Extended Crafting Table
recipes.remove(<extendedcrafting:table_ultimate>);
recipes.addShapeless(<extendedcrafting:table_ultimate> * 2, [<extendedcrafting:table_ultimate>]);

makeExtremeRecipe7(<extendedcrafting:table_ultimate>,
    ["EBBABBE",
     "BCCCCCB",
     "BCBDBCB",
     "ACDTDCA",
     "BCBDBCB",
     "BCCCCCB",
     "EBBABBE"],
    { A : <extendedcrafting:material:13>,
      B : <metaitem:plateBlackSteel>,
      C : <extendedcrafting:material:17>,
      D : <extendedcrafting:material:18>,
      E : <minecraft:emerald_block>,
      T : <extendedcrafting:table_elite> });

recipes.remove(<minecraft:end_crystal>);
// End Crystal * 1
<recipemap:assembler>.findRecipe(16, [<minecraft:ghast_tear:0>, <minecraft:ender_eye:0>], [<liquid:glass> * 1008]).remove();
makeShaped("of_end_crystal", <minecraft:end_crystal>,
    ["AAA",
     "ABA",
     "AAA"],
    { A : <minecraft:glass_pane>,
      B : <metaitem:quantumstar> });

///////////////////////// Nether Star  ///////////////////////////////
recipes.remove(<minecraft:nether_star>);
makeShaped("of_nether_star", <minecraft:nether_star>,
    [" N ",
     "WCE",
     " S "],
    { N : <cns:star_fragment>,
      W : <nomilabs:netherstarwest>,
      C : <cns:star_core>,
      E : <nomilabs:netherstareast>,
      S : <nomilabs:netherstarsouth> });

recipes.remove(<cns:star_fragment>);
makeShaped("of_nether_star_north", <cns:star_fragment>,
    [" A ",
     "ABA",
     "ABA"],
    { A : <minecraft:quartz>,
      B : <thermalfoundation:material:1026> });

makeShaped("of_nether_star_south", <nomilabs:netherstarsouth>,
    ["ABA",
     "ABA",
     " A "],
    { A : <minecraft:quartz>,
      B : <thermalfoundation:material:1027> });

makeShaped("of_nether_star_east", <nomilabs:netherstareast>,
    ["AA ",
     "BBA",
     "AA "],
    { A : <minecraft:quartz>,
      B : <thermalfoundation:material:1024> });

makeShaped("of_nether_star_west", <nomilabs:netherstarwest>,
    [" AA",
     "ABB",
     " AA"],
    { A : <minecraft:quartz>,
      B : <thermalfoundation:material:1025> });

recipes.remove(<cns:star_core>);
makeShaped("of_nether_star_core", <cns:star_core> * 4,
    ["ABA",
     "DEF",
     "ACA"],
    { A : <minecraft:quartz>,
      B : <thermalfoundation:material:2050>,
      C : <thermalfoundation:material:2052>,
      D : <thermalfoundation:material:2048>,
      E : <extendedcrafting:storage:1>,
      F : <minecraft:blaze_rod> });

// Basalz Powder
reactor.recipeBuilder()
    .inputs([<metaitem:dustCharcoal>])
    .fluidInputs([<liquid:elementalreduction> * 100])
    .outputs(<thermalfoundation:material:2053>)
    .duration(160).EUt(90).buildAndRegister();

reactor.recipeBuilder()
    .inputs([<metaitem:dustCoal>])
    .fluidInputs([<liquid:elementalreduction> * 100])
    .outputs(<thermalfoundation:material:2053>)
    .duration(160).EUt(90).buildAndRegister();

//Blitz Powder
reactor.recipeBuilder()
    .inputs(<ore:dustEndstone>)
    .fluidInputs([<liquid:elementalreduction> * 100])
    .outputs(<thermalfoundation:material:2051>)
    .duration(160).EUt(90).buildAndRegister();

//Blizz Powder
reactor.recipeBuilder()
    .inputs(<minecraft:snow>)
    .fluidInputs([<liquid:elementalreduction> * 100])
    .outputs(<thermalfoundation:material:2049>)
    .duration(160).EUt(90).buildAndRegister();

//Blaze Powder
reactor.recipeBuilder()
    .inputs(<metaitem:dustNetherrack>)
    .fluidInputs([<liquid:elementalreduction> * 100])
    .outputs(<minecraft:blaze_powder>)
    .duration(160).EUt(90).buildAndRegister();

//Elemental Reduction
reactor.recipeBuilder()
    .inputs(<ore:dustPulsating>)
    .fluidInputs([<liquid:hydrofluoric_acid> * 1000])
    .fluidOutputs(<liquid:elementalreduction> * 1000)
    .duration(80).EUt(90).buildAndRegister();

// Rod Compression
// Blaze Rod * 1
<recipemap:compressor>.findRecipe(2, [<minecraft:blaze_powder:0> * 4], null).remove();

compressor.recipeBuilder()
    .inputs(<thermalfoundation:material:2051> * 5)
    .outputs(<thermalfoundation:material:2050>)
    .duration(400).EUt(2).buildAndRegister();

compressor.recipeBuilder()
    .inputs(<thermalfoundation:material:2049> * 5)
    .outputs(<thermalfoundation:material:2048>)
    .duration(400).EUt(2).buildAndRegister();

compressor.recipeBuilder()
    .inputs(<thermalfoundation:material:2053> * 5)
    .outputs(<thermalfoundation:material:2052>)
    .duration(400).EUt(2).buildAndRegister();

compressor.recipeBuilder()
    .inputs(<minecraft:blaze_powder> * 5)
    .outputs(<minecraft:blaze_rod>)
    .duration(400).EUt(2).buildAndRegister();



///////////////////////// Omnium  ///////////////////////////////

mods.extendedcrafting.TableCrafting.remove(<extendedcrafting:singularity_ultimate>);
//mods.extendedcrafting.TableCrafting.addShaped(<extendedcrafting:singularity_ultimate>, [
//[null,                            null,                                <extendedcrafting:material:140>,    <nomilabs:solidifiedhydrogen>,  <nomilabs:solidifiedhelium>,        <metaitem:dustLithium>,           <extendedcrafting:material:140>,   null,                               null],
//[null,                            <extendedcrafting:material:140>,     <metaitem:ingotBeryllium>,       <metaitem:dustBoron>,          <metaitem:dustCarbon>,             <nomilabs:solidifiednitrogen>,    <nomilabs:solidifiedoxygen>, <extendedcrafting:material:140>,    null],
//[<extendedcrafting:material:140>, <nomilabs:solidifiedfluorine>, <nomilabs:solidifiedneon>,    <metaitem:dustSodium>,         <metaitem:dustMagnesium>,             <metaitem:ingotAluminium>,           <metaitem:ingotSilicon>,      <metaitem:dustPhosphorus>,        <extendedcrafting:material:140>],
//[<metaitem:dustSulfur>,     <nomilabs:solidifiedchlorine>, <nomilabs:solidifiedargon>,   <metaitem:dustPotassium>,         <metaitem:dustCalcium>,             <metaitem:ingotTitanium>,           <metaitem:ingotVanadium>,      <metaitem:ingotChrome>,       <metaitem:ingotManganese>],
//[<minecraft:iron_ingot>,          <metaitem:ingotCobalt>,        <metaitem:ingotNickel>,       <metaitem:ingotCopper>,         <nomilabs:exoticmaterialscatalyst>, <metaitem:ingotZinc>,           <metaitem:ingotGallium>,      <metaitem:dustArsenic>,        <nomilabs:solidifiedkrypton>],
//[<metaitem:ingotYttrium>,    <metaitem:ingotPalladium>,        <metaitem:ingotSilver>,       <metaitem:ingotIndium>,         <metaitem:ingotTin>,             <metaitem:ingotAntimony>,           <nomilabs:solidifiedxenon>,  <metaitem:dustLanthanum>,       <metaitem:ingotTungsten>],
//[<extendedcrafting:material:140>, <metaitem:ingotOsmium>,        <metaitem:ingotIridium>,       <metaitem:ingotPlatinum>,         <minecraft:gold_ingot>,                   <nomilabs:solidifiedmercury>,     <nomilabs:solidifiedradon>,  <nomilabs:stabilizedthorium>, <extendedcrafting:material:140>],
//[null,                            <extendedcrafting:material:140>,     <nomilabs:stabilizeduranium>, <nomilabs:stabilizedneptunium>, <nomilabs:stabilizedplutonium>,     <nomilabs:stabilizedamericium>,   <nomilabs:stabilizedcurium>, <extendedcrafting:material:140>,    null],
//[null,                            null,                                <extendedcrafting:material:140>,    <nomilabs:stabilizedberkelium>, <nomilabs:stabilizedcalifornium>,   <nomilabs:stabilizedeinsteinium>, <extendedcrafting:material:140>,   null,                               null]]);

mods.extendedcrafting.TableCrafting.addShaped(0, <extendedcrafting:singularity_ultimate>, [
	[<ore:nuggetNetherStar>, <nomilabs:solidifiedhydrogen>, <nomilabs:solidifiedhelium>, <ore:dustLithium>, <ore:ingotBeryllium>, <ore:dustBoron>, <ore:dustCarbon>, <nomilabs:solidifiednitrogen>, <ore:nuggetNetherStar>], 
	[<nomilabs:solidifiedoxygen>, <nomilabs:solidifiedfluorine>, <nomilabs:solidifiedneon>, <ore:dustSodium>, <ore:dustMagnesium>, <ore:ingotAluminium>, <ore:dustSilicon>, <ore:dustPhosphorus>, <ore:dustSulfur>], 
	[<nomilabs:solidifiedchlorine>, <nomilabs:solidifiedargon>, <ore:dustPotassium>, <ore:dustCalcium>, <ore:ingotTitanium>, <ore:ingotVanadium>, <ore:ingotChrome>, <ore:ingotManganese>, <ore:ingotIron>], 
	[<ore:ingotCobalt>, <ore:ingotNickel>, <ore:ingotCopper>, <ore:ingotZinc>, <ore:ingotGallium>, <ore:dustArsenic>, <nomilabs:solidifiedkrypton>, <ore:ingotYttrium>, <ore:ingotNiobium>], 
	[<ore:ingotMolybdenum>, <ore:ingotRuthenium>, <ore:ingotRhodium>, <ore:ingotPalladium>, <nomilabs:exoticmaterialscatalyst>, <ore:ingotSilver>, <ore:dustCadmium>, <ore:ingotIndium>, <ore:ingotTin>], 
	[<ore:ingotAntimony>, <nomilabs:solidifiedxenon>, <ore:dustCaesium>, <ore:dustBarium>, <ore:dustLanthanum>, <ore:dustCerium>, <ore:ingotNeodymium>, <ore:ingotSamarium>, <ore:ingotEuropium>], 
	[<ore:ingotLutetium>, <ore:ingotTantalum>, <ore:ingotTungsten>, <ore:ingotOsmium>, <ore:ingotIridium>, <ore:ingotPlatinum>, <ore:ingotGold>, <nomilabs:solidifiedmercury>, <ore:ingotLead>], 
	[<nomilabs:solidifiedradon>, <ore:ingotThorium>, <nomilabs:stabilizeduranium>, <nomilabs:stabilizedneptunium>, <nomilabs:stabilizedplutonium>, <ore:ingotAmericium>, <nomilabs:stabilizedcurium>, <nomilabs:stabilizedberkelium>, <nomilabs:stabilizedcalifornium>], 
	[<ore:nuggetNetherStar>, <nomilabs:stabilizedeinsteinium>, <ore:ingotDarmstadtium>, <ore:ingotTritanium>, <ore:ingotDuranium>, <ore:ingotTrinium>, <ore:ingotDraconium>, <ore:ingotNaquadah>, <ore:nuggetNetherStar>]
]);


////////////////////////// Crystal Matrix Ingot ///////////////////////
recipes.remove(<avaritia:resource:1>);
makeExtremeRecipe9(<metaitem:nomilabs:ingotCrystalMatrix>,
    ["         ",
     "      DDD",
     "   DDDNAD",
     "DDDANAAND",
     "DANNANNAD",
     "DNAANADDD",
     "DANDDD   ",
     "DDD      ",
     "         "],
    { A : <avaritia:resource>,
      D : <minecraft:diamond>,
      N : <minecraft:nether_star> });

recipes.remove(<avaritia:resource>);
recipes.addShaped(<avaritia:resource>, [
    [<metaitem:plateDiamond>, <minecraft:diamond_block>, <metaitem:plateDiamond>],
    [<minecraft:diamond_block>, <metaitem:gemPerfectDiamond>, <minecraft:diamond_block>],
    [<metaitem:plateDiamond>, <minecraft:diamond_block>, <metaitem:plateDiamond>]]);



////////////////////////// Ultimate Material ///////////////////////

// Moved to Groovy

////////////////////////// Eternal Catalyst ///////////////////////

makeExtremeRecipe9(<nomilabs:eternalcatalyst>,
    ["    D    ",
     " D  D  D ",
     "  DDJDD  ",
     "  DKAHD  ",
     "DDLFBCGDD",
     "  DHEKD  ",
     "  DDIDD  ",
     " D  D  D ",
     "    D    "],
    { A : <actuallyadditions:item_misc:19>,
      B : <armorplus:material:4>,
      C : <extendedcrafting:material:40>,
      D : <extendedcrafting:singularity_ultimate>,
      E : <metaitem:quantumstar>,
      F : <metaitem:gravistar>,
      G : <moreplates:empowered_diamatine_gear>,
      H : <moreplates:empowered_emeradic_gear>,
      I : <moreplates:empowered_enori_gear>,
      J : <moreplates:empowered_palis_gear>,
      K : <moreplates:empowered_restonia_gear>,
      L : <moreplates:empowered_void_gear> });


////////////////////////// Infinity Ingot ///////////////////////
//mods.avaritia.ExtremeCrafting.remove(<ore:ingotInfinity>);
makeExtremeRecipe9(<avaritia:resource:6>,
    ["         ",
     "     ABBB",
     "  ABBBCDB",
     "BBBDCDDCB",
     "BDCCICCDB",
     "BCDDCDBBB",
     "BDCBBBA  ",
     "BBBA     ",
     "         "],
    { A : <ore:nuggetNeutronium>,
      B : <ore:ingotNeutronium>,
      C : <nomilabs:eternalcatalyst>,
      D : <extendedcrafting:material:32>,
      I : <avaritia:resource:5> });


////////////////////////// Infinity Catalyst ///////////////////////

mods.avaritia.ExtremeCrafting.remove(<avaritia:resource:5>);
makeExtremeRecipe9(<avaritia:resource:5>,
    ["AAAABAAAA",
     "ABAABAABA",
     "AABBBBBAA",
     "AABBCBBAA",
     "BBBCHCBBB",
     "AABBCBBAA",
     "AABBBBBAA",
     "ABAABAABA",
     "AAAABAAAA"],
    { A : <avaritia:resource:2>,
      B : <nomilabs:eternalcatalyst>,
      C : <draconicevolution:chaotic_core>,
      H : <nomilabs:heartofauniverse> });


/////////// Ultimate Gem ////////////

mods.extendedcrafting.TableCrafting.addShapeless(<nomilabs:ultimate_gem>,
    [<thermalfoundation:material:893>,
     <actuallyadditions:item_crystal_empowered:5>,
     <enderio:item_material:16>,
     <enderio:item_material:15>,
     <ore:gemDilithium>.firstItem,
     <enderio:item_material:17>,
     <enderio:item_material:18>,
     <enderio:item_material:19>,
     <enderio:item_material:14>,
     <minecraft:prismarine_shard>,
     <metaitem:gemCinnabar>,
     <thermalfoundation:material:894>,
     <appliedenergistics2:material:11>,
     <appliedenergistics2:material:10>,
     <appliedenergistics2:material:12>,
     <actuallyadditions:item_crystal_empowered>,
     <actuallyadditions:item_crystal_empowered:1>,
     <actuallyadditions:item_crystal_empowered:2>,
     <actuallyadditions:item_crystal_empowered:3>,
     <actuallyadditions:item_crystal_empowered:4>,
     <armorplus:lava_crystal:1>,
     <minecraft:emerald>,
     <redstonearsenal:material:160>,
     <minecraft:diamond>,
     <thermalfoundation:material:895>]);



////////////////////////// Creative Items ///////////////////////

//Skullfire Sword
makeExtremeRecipe9(<avaritia:skullfire_sword>,
    ["       AI",
     "      AHA",
     "     AGA ",
     "    AFA  ",
     " B AEA   ",
     "  BDA    ",
     "  CB     ",
     " C  B    ",
     "N        "],
    { A : <ore:ingotCrystalMatrix>,
      B : <armorplus:material:2>,
      C : <minecraft:log:*>,
      D : <armorplus:redstone_sword>,
      E : <armorplus:lapis_sword>,
      F : <armorplus:emerald_sword>,
      G : <armorplus:guardian_sword>,
      H : <armorplus:infused_lava_sword>,
      I : <metaitem:nano_saber>,
      N : <minecraft:nether_star> });

//Blade Of The Cosmos
makeExtremeRecipe9(<avaritia:infinity_sword>,
    ["       AA",
     "      AHA",
     "     AGA ",
     "    AFA  ",
     " B AEA   ",
     "  BDA    ",
     "  CB     ",
     " C  B    ",
     "N        "],
    { A : <ore:ingotInfinity>,
      B : <ore:ingotCrystalMatrix>,
      C : <ore:ingotNeutronium>,
      D : <armorplus:super_star_sword>,
      E : <armorplus:ender_dragon_sword>,
      F : <draconicevolution:wyvern_sword>,
      G : <draconicevolution:draconic_sword>.withTag({Energy: 0}, false),
      H : <avaritia:skullfire_sword>,
      N : <avaritia:resource:5> });

makeExtremeRecipe9(<draconicevolution:creative_rf_source>,
    ["ABBCDCBBA",
     "BBCDEDCBB",
     "BCDEFEDCB",
     "CDEFGFEDC",
     "DEFGHGFED",
     "CDEFGFEDC",
     "BCDEFEDCB",
     "BBCDEDCBB",
     "ABBCDCBBA"],
    { A : <nomilabs:ultimate_generator>,
      B : <draconicevolution:energy_pylon>,
      C : <draconicevolution:energy_storage_core>,
      D : <draconicevolution:particle_generator>,
      E : <draconicevolution:particle_generator:2>,
      F : <draconicevolution:reactor_component>,
      G : <draconicevolution:reactor_core>,
      H : <avaritia:resource:5> });

// GT Infinite Energy
mods.extendedcrafting.TableCrafting.addShaped(0, <metaitem:infinite_energy>, [
	[<ore:wireGtHexMercuryBariumCalciumCuprate>, <ore:wireGtHexUraniumTriplatinum>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexUraniumTriplatinum>, <ore:wireGtHexMercuryBariumCalciumCuprate>], 
	[<ore:wireGtHexUraniumTriplatinum>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexUraniumTriplatinum>], 
	[<ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexSamariumIronArsenicOxide>], 
	[<ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexOmnium>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>], 
	[<ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexOmnium>, <draconicevolution:creative_rf_source>, <ore:wireGtHexOmnium>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>], 
	[<ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexOmnium>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>], 
	[<ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexRutheniumTriniumAmericiumNeutronate>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexSamariumIronArsenicOxide>], 
	[<ore:wireGtHexUraniumTriplatinum>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexEnrichedNaquadahTriniumEuropiumDuranide>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexUraniumTriplatinum>], 
	[<ore:wireGtHexMercuryBariumCalciumCuprate>, <ore:wireGtHexUraniumTriplatinum>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexUraniumRhodiumDinaquadide>, <ore:wireGtHexIndiumTinBariumTitaniumCuprate>, <ore:wireGtHexSamariumIronArsenicOxide>, <ore:wireGtHexUraniumTriplatinum>, <ore:wireGtHexMercuryBariumCalciumCuprate>]
]);

makeExtremeRecipe9(<extrautils2:passivegenerator:6>,
    ["AABCDCBAA",
     "ABCDEDCBA",
     "BCDEFEDCB",
     "CDEFGFEDC",
     "DEFGHGFED",
     "CDEFGFEDC",
     "BCDEFEDCB",
     "ABCDEDCBA",
     "AABCDCBAA"],
    { A : <extrautils2:ingredients:16>,
      B : <extrautils2:passivegenerator:4>,
      C : <extrautils2:passivegenerator:5>,
      D : <extrautils2:passivegenerator:3>,
      E : <extrautils2:passivegenerator:2>,
      F : <extrautils2:passivegenerator:8>,
      G : <nomilabs:ultimate_generator>,
      H : <avaritia:resource:5> });

makeExtremeRecipe9(creativecell,
    ["AAABCBAAA",
     "AABCDCBAA",
     "ABCDEDCBA",
     "BCDEFEDCB",
     "CDEFGFEDC",
     "BCDEFEDCB",
     "ABCDEDCBA",
     "AABCDCBAA",
     "AAABCBAAA"],
    { A : basiccellIng,
      B : hardenedcellIng,
      C : reinforcedcellIng,
      D : signalumcellIng,
      E : resonantcellIng,
      F : <nomilabs:ultimate_power_storage>,
      G : <avaritia:resource:5> });

makeExtremeRecipe9(<extrautils2:creativeenergy>,
    ["CDEFGFEDC",
     "DEFGHGFED",
     "EFGHIHGFE",
     "FGHIBIHGF",
     "GHIBABIHG",
     "FGHIBIHGF",
     "EFGHIHGFE",
     "DEFGHGFED",
     "CDEFGFEDC"],
    { A : <avaritia:resource:5>,
      B : <nomilabs:ultimate_generator>,
      C : <extrautils2:opinium:3>,
      D : <extrautils2:opinium:4>,
      E : <extrautils2:opinium:5>,
      F : <extrautils2:opinium:6>,
      G : <extrautils2:opinium:7>,
      H : <extrautils2:opinium:8>,
      I : <extrautils2:rainbowgenerator> });




makeExtremeRecipe9(<appliedenergistics2:creative_energy_cell>,
    ["IBCDEDCBI",
     "BCDEFEDCB",
     "CDEFGFEDC",
     "DEFGHGFED",
     "EFGHAHGFE",
     "DEFGHGFED",
     "CDEFGFEDC",
     "BCDEFEDCB",
     "IBCDEDCBI"],
    { A : <avaritia:resource:5>,
      B : <meta_tile_entity:battery_buffer.hv.16>,
      C : <meta_tile_entity:battery_buffer.ev.16>,
      D : <meta_tile_entity:battery_buffer.iv.16>,
      E : <meta_tile_entity:battery_buffer.luv.16>,
      F : <meta_tile_entity:battery_buffer.zpm.16>,
      G : <meta_tile_entity:battery_buffer.uv.16>,
      H : <meta_tile_entity:battery_buffer.uhv.16>,
      I : <nomilabs:ultimate_power_storage> });

makeExtremeRecipe9(<thermalcultivation:watering_can:32000>,
    ["         ",
     "E   CCC  ",
     "IE E  AAA",
     "EEED  A A",
     "E EDDBA A",
     "   DDBAAA",
     "   DDBBB ",
     "    CCC  ",
     "         "],
    { A : <thermalcultivation:watering_can>.withTag({Water:0, Mode:0}, false),
      B : <thermalcultivation:watering_can:1>.withTag({Water:0, Mode:1}, false),
      C : <thermalcultivation:watering_can:2>.withTag({Water:0, Mode:2}, false),
      D : <thermalcultivation:watering_can:3>.withTag({Water:0, Mode:3}, false),
      E : <thermalcultivation:watering_can:4>.withTag({Water:0, Mode:4}, false),
      I : <avaritia:resource:5>});

makeExtremeRecipe9(<solarflux:solar_panel_infinity>,
    ["SNNNNNNNS",
     "NPPPNPPPN",
     "NPPPNPPPN",
     "NPPPNPPPN",
     "NNNNINNNN",
     "NPPPNPPPN",
     "NPPPNPPPN",
     "NPPPNPPPN",
     "SNNNNNNNS"],
    { S : <solarflux:solar_panel_neutronium>,
      N : <ore:plateNeutronium>,
      I : <avaritia:resource:5>,
      P : <ore:plateInfinity> });


//Jetpack
val plateShape as string[] = [" P ",
                              "PPP",
                              " P "];

recipes.remove(<simplyjetpacks:metaitemmods:12>);
makeShaped("sj2_wroughtiron_plate",
           <simplyjetpacks:metaitemmods:12>,
           plateShape, { P : <ore:plateWroughtIron> });

recipes.remove(<simplyjetpacks:metaitemmods:13>);
makeShaped("sj2_ConductiveIron_plating",
           <simplyjetpacks:metaitemmods:13>,
           plateShape, { P : <ore:plateConductiveIron> });

recipes.remove(<simplyjetpacks:metaitemmods:14>);
makeShaped("sj2_ElectricalSteel_plating",
           <simplyjetpacks:metaitemmods:14>,
          plateShape, { P : <ore:plateElectricalSteel> });

recipes.remove(<simplyjetpacks:metaitemmods:15>);
makeShaped("sj2_DarkSteel_plating",
           <simplyjetpacks:metaitemmods:15>,
           plateShape, { P : <ore:plateDarkSteel> });

recipes.remove(<simplyjetpacks:metaitemmods:22>);
makeShaped("sj2_Iron_plating",
           <simplyjetpacks:metaitemmods:22>,
           plateShape, { P : <ore:plateIron> });

recipes.remove(<simplyjetpacks:metaitemmods:23>);
makeShaped("sj2_Bronze_plating",
           <simplyjetpacks:metaitemmods:23>,
           plateShape, { P : <ore:plateBronze> });

recipes.remove(<simplyjetpacks:metaitemmods:24>);
makeShaped("sj2_Invar_plating", <simplyjetpacks:metaitemmods:24>,
           plateShape, { P : <ore:plateInvar> });

recipes.remove(<simplyjetpacks:metaitemmods:25>);
makeShaped("sj2_Enderium_plating",
           <simplyjetpacks:metaitemmods:25>,
           plateShape, { P : <ore:plateEnderium> });

// Creative Jetpack
makeExtremeRecipe9(creativejetpack,
    ["  A   E  ",
     " AAA EEE ",
     " ABAIEFE ",
     " ABAJEFE ",
     " ABAKEFE ",
     " ABA EFE ",
     " CCC GGG ",
     "  D   H  ",
     " DDD HHH "],
    {A: armoredconductiveironjetpack,
     B: armoredvibrantjetpack,
     C: armoredelectricalsteeljetpack,
     D: armoredenergeticjetpack,
     E: armoredleadstonejetpack,
     F: armoredresonantjetpack,
     G: armoredhardenedjetpack,
     H: armoredreinforcedjetpack,
     I: fluxinfusedjetplate,
     J: <avaritia:resource:5>,
     K: darksoulariumjetplate });

// Creative Flux Capacitor
makeExtremeRecipe9(<thermalexpansion:capacitor:32000>.withTag({Energy: 250000000}),
    ["ABCDEDCBA",
     "BCDEFEDCB",
     "CDEFGFEDC",
     "DEFGHGFED",
     "EFGHIHGFE",
     "DEFGHGFED",
     "CDEFGFEDC",
     "BCDEFEDCB",
     "ABCDEDCBA"],
    { A: <thermalexpansion:capacitor>.withTag({Energy: 0}, false),
      B: <thermalexpansion:capacitor:1>.withTag({Energy: 0}, false),
      C: <thermalexpansion:capacitor:2>.withTag({Energy: 0}, false),
      D: <thermalexpansion:capacitor:3>.withTag({Energy: 0}, false),
      E: <thermalexpansion:capacitor:4>.withTag({Energy: 0}, false),
      F: <draconicevolution:draconium_capacitor>,
      G: <draconicevolution:draconium_capacitor:1>,
      H: <nomilabs:ultimate_power_storage>,
      I: <avaritia:resource:5> });

makeExtremeRecipe9(<storagedrawers:upgrade_creative>,
    ["IBAHDHABI",
     "BAHDEDHAB",
     "AHDEFEDHA",
     "HDEFGFEDH",
     "DEFGCGFED",
     "HDEFGFEDH",
     "AHDEFEDHA",
     "BAHDEDHAB",
     "IBAHDHABI"],
    { A : <actuallyadditions:block_giant_chest_large>,
      B : <actuallyadditions:block_giant_chest_medium>,
      C : <avaritia:resource:5>,
      D : <meta_tile_entity:quantum_chest.luv>,
      E : <meta_tile_entity:quantum_chest.zpm>,
      F : <meta_tile_entity:quantum_chest.uv>,
      G : <meta_tile_entity:quantum_chest.uhv>,
      H : <metaitem:crate.tungstensteel>,
      I : <storagedrawers:upgrade_storage:4> });

var xu01 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_survival"});
var xu02 = <extrautils2:machine>.withTag({Type: "extrautils2:generator"});
var xu03 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_culinary"});
var xu04 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_lava"});
var xu05 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_redstone"});
var xu06 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_ender"});
var xu07 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_potion"});
var xu08 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_pink"});
var xu09 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_overclock"});
var xu10 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_tnt"});
var xu11 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_netherstar"});
var xu12 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_dragonsbreath"});
var xu13 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_ice"});
var xu14 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_death"});
var xu15 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"});
var xu16 = <extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"});
var dynamo0 = <thermalexpansion:dynamo>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Energy: 0, Level: 4 as byte, Augments: []}, false);
var dynamo1 = <thermalexpansion:dynamo:1>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Energy: 0, Level: 4 as byte, Augments: []}, false);
var dynamo3 = <thermalexpansion:dynamo:3>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Energy: 0, Level: 4 as byte, Augments: []}, false);
var dynamo5 = <thermalexpansion:dynamo:5>.withTag({RSControl: 0 as byte, Creative: 0 as byte, Energy: 0, Level: 4 as byte, Augments: []}, false);

dynamo0 = dynamo0.only(isResonant);
dynamo1 = dynamo1.only(isResonant);
dynamo3 = dynamo3.only(isResonant);
dynamo5 = dynamo5.only(isResonant);

//Ultimate Collections

//Ultimate Generator
mods.extendedcrafting.TableCrafting.addShapeless(<nomilabs:ultimate_generator>,
[<meta_tile_entity:large_boiler.bronze>, <meta_tile_entity:large_boiler.steel>, <meta_tile_entity:combustion_generator.lv>, <meta_tile_entity:combustion_generator.mv>, <nuclearcraft:fission_controller_new_fixed>, <nuclearcraft:salt_fission_controller>, <meta_tile_entity:combustion_generator.hv>, <meta_tile_entity:large_boiler.titanium>, <meta_tile_entity:large_boiler.tungstensteel>,
<solarflux:solar_panel_1>, <solarflux:solar_panel_4>, <solarflux:solar_panel_5>, <solarflux:solar_panel_6>, <draconicevolution:generator>, <solarflux:solar_panel_7>, <solarflux:solar_panel_8>, <solarflux:solar_panel_wyvern>, <solarflux:solar_panel_neutronium>,
<solarflux:solar_panel_2>, <solarflux:solar_panel_3>, xu01, xu02, xu03, xu04, xu05, <solarflux:solar_panel_chaotic>, <solarflux:solar_panel_draconic>,
<enderio:block_zombie_generator>, <meta_tile_entity::fusion_reactor.luv>, xu16, dynamo0, <extrautils2:rainbowgenerator:2>, dynamo0, xu06, <meta_tile_entity::fusion_reactor.uv>, <enderio:block_zombie_generator>,
<enderio:block_franken_zombie_generator>, dynamo5, xu15, dynamo1, <draconicevolution:reactor_core>, dynamo1, xu07, dynamo5, <enderio:block_franken_zombie_generator>,
<enderio:block_ender_generator>, <meta_tile_entity:fusion_reactor.zpm>, xu14, dynamo3, <extrautils2:rainbowgenerator:1>, dynamo3, xu08, <draconicevolution:reactor_component>, <enderio:block_ender_generator>,
<meta_tile_entity:large_turbine.steam>, <meta_tile_entity:steam_turbine.lv>, xu13, xu12, xu11, xu10, xu09, <meta_tile_entity:gas_turbine.hv>, <meta_tile_entity:large_turbine.plasma>,
<solarflux:solar_panel_1>, <solarflux:solar_panel_4>, <meta_tile_entity:steam_turbine.mv>, <meta_tile_entity:steam_turbine.hv>, <meta_tile_entity:large_turbine.gas>, <meta_tile_entity:gas_turbine.lv>, <meta_tile_entity:gas_turbine.mv>, <solarflux:solar_panel_chaotic>, <solarflux:solar_panel_draconic>,
<solarflux:solar_panel_2>, <solarflux:solar_panel_3>, <solarflux:solar_panel_5>, <solarflux:solar_panel_6>, <extrautils2:passivegenerator>, <solarflux:solar_panel_7>, <solarflux:solar_panel_8>, <solarflux:solar_panel_wyvern>, <solarflux:solar_panel_neutronium>]);


//Ultimate Power Storage
makeExtremeRecipe9(<nomilabs:ultimate_power_storage>,
    ["ABCDIDCBA",
     "BCDIEIDCB",
     "CDIEFEIDC",
     "DIEFGFEID",
     "IEFGHGFEI",
     "DIEFGFEID",
     "CDIEFEIDC",
     "BCDIEIDCB",
     "ABCDIDCBA"],
    { A : <metaitem:battery.re.lv.lithium>,
      B : <metaitem:battery.re.mv.lithium>,
      C : <metaitem:energy_crystal>,
      D : <metaitem:lapotron_crystal>,
      E : <metaitem:energy.lapotronic_orb_cluster>,
      F : <metaitem:zpm>,
      G : <metaitem:energy.cluster>,
      H : <metaitem:max.battery>,
      I : <metaitem:energy.lapotronic_orb> });

//Luminessence de-blockifying recipe
recipes.addShapeless(<extendedcrafting:material:7>*9,[<extendedcrafting:storage:1>]);

//Nether Star Nugget Recombination
makeShaped("of_star_from_nuggets", <minecraft:nether_star>,
    ["NNN",
     "NNN",
     "NNN"],
    { N : <extendedcrafting:material:140> });
