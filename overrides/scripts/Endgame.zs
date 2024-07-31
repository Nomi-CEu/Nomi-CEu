import crafttweaker.item.IIngredient;
import mods.gregtech.recipe.RecipeMap;
import scripts.common.makeShaped as makeShaped;

//Gravistar
// Gravi Star * 1
<recipemap:autoclave>.findRecipe(7680, [<metaitem:quantumstar>], [<liquid:neutronium> * 288]).remove();

autoclave.recipeBuilder()
    .inputs(<minecraft:nether_star>)
    .fluidInputs(<liquid:neutronium> * 36)
    .outputs([<metaitem:gravistar>])
    .duration(480).EUt(7680).buildAndRegister();

makeShaped("of_sunnarium_plates", <advsolars:sunnarium_plate> * 4,
    ["RRR",
     "RSR",
     "RRR"],
    { S : <advsolars:sunnarium>, R : <ore:plateHastelloyC276> });

makeShaped("of_enriched_sunnarium", <advsolars:sunnarium_enriched> * 4,
    ["NAN",
     "ASA",
     "NAN"],
    { N : <nomilabs:stabilizedneptunium>,
      A : <nomilabs:stabilizedamericium>,
      S : <advsolars:sunnarium> });

makeShaped("of_enriched_sunnarium_plate", <advsolars:sunnarium_enriched_plate>,
    [" E ",
     "EPE",
     " E "],
    { E : <advsolars:sunnarium_enriched>, P : <advsolars:sunnarium_plate> });



//Radon
electrolyzer.recipeBuilder()
    .inputs([<nomilabs:radiumsalt>])
    .outputs([<metaitem:dustRockSalt>])
    .fluidOutputs(<liquid:radon> * 1000)
    .duration(200).EUt(2000).buildAndRegister();

electrolyzer.recipeBuilder()
    .inputs([<minecraft:glass> * 4])
    .outputs([<minecraft:quartz>])
    .duration(100).EUt(20).buildAndRegister();



//Gem Sensor
makeShaped("of_gem_sensor", <nomilabs:gemsensor>,
    [" O ",
     "PSP",
     " P "],
    { O : <advancedrocketry:satelliteprimaryfunction>,
      S : <metaitem:sensor.iv>,
      P : <ore:plateTungstenCarbide> });

//Composition Sensor
recipes.remove(<advancedrocketry:satelliteprimaryfunction:1>);
makeShaped("of_composition_sensor", <advancedrocketry:satelliteprimaryfunction:1>,
    [" O ",
     "PSP",
     " P "],
    { O : <advancedrocketry:satelliteprimaryfunction>,
      S : <metaitem:sensor.hv>,
      P : <ore:plateStainlessSteel> });


//Neutronium from Piles
blast_furnace.recipeBuilder()
    .inputs([<avaritia:resource:2> * 9])
    .fluidInputs([<liquid:xenon> * 250])
    .outputs(<metaitem:nuggetNeutronium>)
    .property("temperature", 9600)
    .duration(40).EUt(500000).buildAndRegister();

recipes.addShapeless(<avaritia:resource:2> * 9, [<metaitem:nuggetNeutronium>]);


extractor.recipeBuilder()
    .inputs(<nomilabs:impossiblerealmdata>)
    .outputs([<nomilabs:quantumflux>])
    .duration(100).EUt(3000).buildAndRegister();

recipes.remove(<extrautils2:rainbowgenerator>);
makeShaped("of_rainbow_generator", <extrautils2:rainbowgenerator>,
    ["OTO",
     "OHO",
     "OBO"],
    { O : <extrautils2:opinium:8>,
      H : <nomilabs:heartofauniverse>,
      T : <extrautils2:rainbowgenerator:2>,
      B : <extrautils2:rainbowgenerator:1> });

recipes.remove(<craftelytra:elytra_wing>);
makeShaped("of_elytra_wing", <craftelytra:elytra_wing>,
    [" PP",
     "PE ",
     "PP "],
    { P : <metaitem:platePalladium>,
      E : <metaitem:gemPerfectEmerald> });

recipes.remove(<minecraft:elytra>);
makeShaped("of_elytra", <minecraft:elytra>,
    ["   ", "WGW", "   "],
    { W : <craftelytra:elytra_wing>,
      G : <enderio:item_material:7> });




fusion_reactor.recipeBuilder()
	.fluidInputs([<liquid:berkelium> * 16, <liquid:californium> * 16])
    .fluidOutputs(<liquid:einsteinium> * 16)
    .duration(100)
    .EUt(15360)
    .property("eu_to_start", 400000000)
    .buildAndRegister();




//Nuclear Stuff

centrifuge.findRecipe(320, [<metaitem:dustUranium>], [null]).remove();



makeShaped("of_nc_cell_block", <nuclearcraft:cell_block>,
    ["TCT",
     "C C",
     "TCT"],
    { T : <ore:ingotTough>, C : <gregtech:transparent_casing> });


val trimPattern as string[] = ["N N",
                               " C ",
                               "N N"];

recipes.remove(<extendedcrafting:trimmed>);
makeShaped("of_iron_trimmed_black_steel",
    <extendedcrafting:trimmed>, trimPattern,
    { N : <ore:nuggetIron>, C : <metaitem:blockBlackSteel> }); // Black Steel Block

recipes.remove(<extendedcrafting:trimmed:1>);
makeShaped("of_gold_trimmed_black_steel",
    <extendedcrafting:trimmed:1>, trimPattern,
    { N : <ore:nuggetGold>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:2>);
makeShaped("of_diamond_trimmed_black_steel",
    <extendedcrafting:trimmed:2>, trimPattern,
    { N : <ore:nuggetDiamond>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:3>);
makeShaped("of_emerald_trimmed_black_steel",
    <extendedcrafting:trimmed:3>, trimPattern,
    { N : <ore:nuggetEmerald>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:4>);
makeShaped("of_crystaltine_trimmed_black_steel",
    <extendedcrafting:trimmed:4>, trimPattern,
    { N : <extendedcrafting:material:25>, C : <metaitem:blockBlackSteel> }); //Black Steel Block

recipes.remove(<extendedcrafting:trimmed:5>);
makeShaped("of_omnium_trimmed_black_steel",
    <extendedcrafting:trimmed:5>, trimPattern,
    { N : <extendedcrafting:material:33>, C : <metaitem:blockBlackSteel> }); //Black Steel Block



//Add conversion recipe
recipes.addShapeless(<avaritia:resource:3>, [<metaitem:nuggetNeutronium>]);

//Processing Array (Moved to Groovy)

// UHV Batbufs & Turbo Charger (Moved to Groovy)

// Assembly Line

// Moved to Groovy

// Rhodium Plated Palladium -> Rhodium Plated Lumium Palladium (Moved to Groovy)

// Trinium balance
// Trinium Sulfide Dust * 1
<recipemap:centrifuge>.findRecipe(1920, null, [<liquid:impure_enriched_naquadah_solution> * 2000]).remove();
centrifuge.recipeBuilder()
    .fluidInputs(<liquid:impure_enriched_naquadah_solution> * 2000)
    .outputs(<metaitem:dustTriniumSulfide> * 2, <metaitem:dustAntimonyTrifluoride> * 2)
    .fluidOutputs(<liquid:enriched_naquadah_solution> * 1000)
    .duration(400).EUt(1920).buildAndRegister();

// World Accelerators
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.lv");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.mv");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.hv");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.ev");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.iv");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.luv");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.zpm");
recipes.removeByRecipeName("gregtech:gregtech.machine.world_accelerator.uv");

// Recipes & Recycling Moved to Groovy

/* UHV Multis */
// Rotary Hearth Furnace
recipes.remove(<metaitem:gcym:mega_blast_furnace>);
// Moved to Groovy

// Bulk Blast Chiller
recipes.remove(<metaitem:gcym:mega_vacuum_freezer>);
// Moved to Groovy
