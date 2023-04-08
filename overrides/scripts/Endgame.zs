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
    { N : <contenttweaker:stabilizedneptunium>,
      A : <contenttweaker:stabilizedamericium>,
      S : <advsolars:sunnarium> });

makeShaped("of_enriched_sunnarium_plate", <advsolars:sunnarium_enriched_plate>,
    [" E ",
     "EPE",
     " E "],
    { E : <advsolars:sunnarium_enriched>, P : <advsolars:sunnarium_plate> });



//Radon
electrolyzer.recipeBuilder()
    .inputs([<contenttweaker:radiumsalt>])
    .outputs([<metaitem:dustRockSalt>])
    .fluidOutputs(<liquid:radon> * 1000)
    .duration(200).EUt(2000).buildAndRegister();

electrolyzer.recipeBuilder()
    .inputs([<minecraft:glass> * 4])
    .outputs([<minecraft:quartz>])
    .duration(100).EUt(20).buildAndRegister();



//Gem Sensor
makeShaped("of_gem_sensor", <contenttweaker:gemsensor>,
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
    .inputs(<contenttweaker:impossiblerealmdata>)
    .outputs([<contenttweaker:quantumflux>])
    .duration(100).EUt(3000).buildAndRegister();

recipes.remove(<extrautils2:rainbowgenerator>);
makeShaped("of_rainbow_generator", <extrautils2:rainbowgenerator>,
    ["OTO",
     "OHO",
     "OBO"],
    { O : <extrautils2:opinium:8>,
      H : <contenttweaker:heartofauniverse>,
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



//Processing Array
recipes.remove(<metaitem:processing_array>);
makeShaped("of_processing_array", <metaitem:processing_array>,
    ["CSC",
     "AHA",
     "CBC"],
     { A : <metaitem:robot.arm.iv>, //Robot Arm (IV)
       H : <meta_tile_entity:hull.iv>, //Machine Hull (IV)
       C : <ore:circuitLuv>, //T6 Circuit
       S : <advsolars:sunnarium>, //Sunnarium
       B : <metaitem:tool.dataorb>}); //dataorb

// Titanium Ingot * 26
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:processing_array>], [<liquid:oxygen> * 3102]).remove();
// Titanium Dust * 26
<recipemap:macerator>.findRecipe(8, [<metaitem:processing_array>], null).remove();



// UHV Batbufs
recipes.addShaped(<metaitem:battery_buffer.uhv.4>, [
    [<metaitem:wireGtQuadrupleEuropium>, <ore:chestWood>, <metaitem:wireGtQuadrupleEuropium>],
    [<metaitem:wireGtQuadrupleEuropium>, <metaitem:hull.uhv>, <metaitem:wireGtQuadrupleEuropium>]
]);
recipes.addShaped(<metaitem:battery_buffer.uhv.8>, [
    [<metaitem:wireGtOctalEuropium>, <ore:chestWood>, <metaitem:wireGtOctalEuropium>],
    [<metaitem:wireGtOctalEuropium>, <metaitem:hull.uhv>, <metaitem:wireGtOctalEuropium>]
]);
recipes.addShaped(<metaitem:battery_buffer.uhv.16>, [
    [<metaitem:wireGtHexEuropium>, <ore:chestWood>, <metaitem:wireGtHexEuropium>],
    [<metaitem:wireGtHexEuropium>, <metaitem:hull.uhv>, <metaitem:wireGtHexEuropium>]
]);

// UHV Turbo Charger
recipes.addShaped(<metaitem:charger.uhv>, [
    [<metaitem:wireGtQuadrupleEuropium>, <ore:chestWood>, <metaitem:wireGtQuadrupleEuropium>], 
    [<metaitem:wireGtQuadrupleEuropium>, <metaitem:hull.uhv>, <metaitem:wireGtQuadrupleEuropium>],
    [<metaitem:cableGtSingleEuropium>, <ore:circuitUhv>, <metaitem:cableGtSingleEuropium>]
]);

// Assembly Line
// ZPM Field Generator * 1
<recipemap:assembly_line>.findRecipe(24000, [<metaitem:frameNaquadahAlloy>, <metaitem:plateNaquadahAlloy> * 6, <metaitem:quantumstar>, <metaitem:emitter.zpm> * 2, <metaitem:circuit.quantum_mainframe> * 2, <metaitem:wireFineUraniumRhodiumDinaquadide> * 64, <metaitem:wireFineUraniumRhodiumDinaquadide> * 64, <metaitem:cableGtSingleVanadiumGallium> * 4], [<liquid:soldering_alloy> * 1152]).remove();
assembly_line.recipeBuilder()
    .inputs([<metaitem:frameNaquadahAlloy>, <metaitem:plateNaquadahAlloy> * 6, <metaitem:quantumstar>, <metaitem:emitter.zpm> * 2, <ore:circuitZpm> * 2, <metaitem:wireFineUraniumRhodiumDinaquadide> * 64, <metaitem:wireFineUraniumRhodiumDinaquadide> * 64, <metaitem:cableGtSingleVanadiumGallium> * 4])
    .fluidInputs([<liquid:soldering_alloy> * 1152, <liquid:awakened_draconium> * 1296])
    .outputs(<metaitem:field.generator.zpm>)
    .duration(600)
    .EUt(24000)
    .buildAndRegister();

// Rhodium Plated Palladium
// Rhodium Plated Palladium Dust * 4
<recipemap:mixer>.findRecipe(7680, [<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:circuit.integrated>.withTag({Configuration: 1})], null).remove();
mixer.recipeBuilder()
    .inputs([<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:dustLumium> * 2])
    .circuit(1)
    .outputs(<metaitem:dustRhodiumPlatedPalladium> * 6)
    .duration(400)
    .EUt(7680)
    .buildAndRegister();

// Palladium Dust * 3
<recipemap:centrifuge>.findRecipe(30, [<metaitem:dustRhodiumPlatedPalladium> * 4], null).remove();
centrifuge.recipeBuilder()
    .inputs(<metaitem:dustRhodiumPlatedPalladium> * 6)
    .outputs([<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:dustLumium> * 2])
    .duration(630)
    .EUt(30)
    .buildAndRegister();

// Molten Rhodium Plated Palladium * 576
<recipemap:alloy_blast_smelter>.findRecipe(7680, [<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:circuit.integrated>.withTag({Configuration: 12})], [<liquid:argon> * 200]).remove();
// Molten Rhodium Plated Palladium * 576
<recipemap:alloy_blast_smelter>.findRecipe(7680, [<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:circuit.integrated>.withTag({Configuration: 2})], null).remove();
alloy_blast_smelter.recipeBuilder()
    .inputs([<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:dustLumium> * 2])
    .circuit(3)
    .fluidOutputs(<liquid:molten.rhodium_plated_palladium> * 864)
    .property("temperature", 4500)
    .duration(3600)
    .EUt(7680)
    .buildAndRegister();
alloy_blast_smelter.recipeBuilder()
    .inputs([<metaitem:dustPalladium> * 3, <metaitem:dustRhodium>, <metaitem:dustLumium> * 2])
    .fluidInputs(<liquid:argon> * 300)
    .circuit(13)
    .fluidOutputs(<liquid:molten.rhodium_plated_palladium> * 864)
    .property("temperature", 4500)
    .duration(2412)
    .EUt(7680)
    .buildAndRegister();

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

// Mercury Barium Calcium Cuprate Ingot * 32
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:world_accelerator.hv>], [<liquid:oxygen> * 3896]).remove();
// Mercury Barium Calcium Cuprate Dust * 32
<recipemap:macerator>.findRecipe(32, [<metaitem:world_accelerator.hv>], null).remove();
// Uranium Triplatinum Ingot * 32
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:world_accelerator.ev>], [<liquid:oxygen> * 9149]).remove();
// Uranium Triplatinum Dust * 32
<recipemap:macerator>.findRecipe(32, [<metaitem:world_accelerator.ev>], null).remove();
// Tungstensteel Ingot * 32
<recipemap:arc_furnace>.findRecipe(30, [<metaitem:world_accelerator.iv>], [<liquid:oxygen> * 7502]).remove();
// Tungstensteel Dust * 32
<recipemap:macerator>.findRecipe(32, [<metaitem:world_accelerator.iv>], null).remove();


assembly_line.recipeBuilder()
    .inputs(<metaitem:sensor.luv> * 20, <metaitem:field.generator.luv> * 20, <metaitem:field.generator.luv> * 20, <metaitem:plateDenseDraconium>, <metaitem:plateDoubleIridium> * 2, <metaitem:hull.luv>, <metaitem:plateDoubleIridium> * 2, <metaitem:plateDenseDraconium>, <metaitem:field.generator.luv> * 20, <metaitem:field.generator.luv> * 20, <metaitem:emitter.luv> * 20)
    .fluidInputs(<liquid:soldering_alloy> * 1152, <liquid:enderium> * 1152)
    .outputs(<metaitem:world_accelerator.hv>)
    .duration(900).EUt(30720).buildAndRegister();

assembly_line.recipeBuilder()
    .inputs(<metaitem:sensor.zpm> * 20, <metaitem:field.generator.zpm> * 20, <metaitem:field.generator.zpm> * 20, <metaitem:plateDenseDraconium>, <metaitem:plateDoubleEuropium> * 2, <metaitem:hull.zpm>, <metaitem:plateDoubleEuropium> * 2, <metaitem:plateDenseDraconium>, <metaitem:field.generator.zpm> * 20, <metaitem:field.generator.zpm> * 20, <metaitem:emitter.zpm> * 20)
    .fluidInputs(<liquid:soldering_alloy> * 1152, <liquid:enderium> * 1152)
    .outputs(<metaitem:world_accelerator.ev>)
    .duration(900).EUt(122880).buildAndRegister();

assembly_line.recipeBuilder()
    .inputs(<metaitem:sensor.uv> * 20, <metaitem:field.generator.uv> * 20, <metaitem:field.generator.uv> * 20, <metaitem:plateDenseNeutronium>, <metaitem:plateDoubleEuropium> * 2, <metaitem:hull.uv>, <metaitem:plateDoubleEuropium> * 2, <metaitem:plateDenseNeutronium>, <metaitem:field.generator.uv> * 20, <metaitem:field.generator.uv> * 20, <metaitem:emitter.uv> * 20)
    .fluidInputs(<liquid:soldering_alloy> * 1152, <liquid:enderium> * 1152, <liquid:naquadria> * 576)
    .outputs(<metaitem:world_accelerator.iv>)
    .duration(900).EUt(491520).buildAndRegister();

// Stabilized Miners Tooltips
<contenttweaker:tieroneship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tieroneship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tieroneship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tiertwoship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tiertwoship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tiertwoship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tierthreeship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tierthreeship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tierthreeship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tierfourship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tierfourship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tierfourship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tierfourandhalfship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tierfourandhalfship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tierfourandhalfship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tierfiveship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tierfiveship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tierfiveship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tiersixship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tiersixship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tiersixship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tiersevenship_stabilized>.addTooltip(format.italic(
    format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tiersevenship_stabilized>.addTooltip(format.italic(
    format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tiersevenship_stabilized_matter>.addTooltip(format.italic(
    format.white("It looks oddly familiar.")));


<contenttweaker:tiereightship_stabilized>.addTooltip(format.italic(
	format.white("A stabilized version, injected with a Heart of a Universe.")));
<contenttweaker:tiereightship_stabilized>.addTooltip(format.italic(
	format.white("Lasts indefinitely. Reusable. Totally not overpowered.")));
<contenttweaker:tiereightship_stabilized_matter>.addTooltip(format.italic(
	format.white("It looks oddly familiar.")));