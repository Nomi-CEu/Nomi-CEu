#modloaded threng

import mods.appliedenergistics2.Inscriber;

Inscriber.removeRecipe(<threng:material:2>);

mods.threng.Centrifuge.removeRecipe(<appliedenergistics2:material:45>);
mods.threng.Centrifuge.removeRecipe(<appliedenergistics2:material:46>);

furnace.remove(<threng:material>);

mods.jei.JEI.hideCategory("threng.agg");
mods.jei.JEI.hideCategory("threng.energize");

<ore:dustCoal>.remove(<threng:material:3>);
mods.jei.JEI.removeAndHide(<threng:material:3>);

recipes.removeByRecipeName("threng:machine_core");
recipes.removeByRecipeName("threng:spec_core_64");
recipes.removeByRecipeName("threng:ma_frame");
recipes.removeByRecipeName("threng:spec_core_64");
recipes.removeByRecipeName("threng:spec_core_64");
recipes.removeByRecipeName("threng:ma_io_port");
recipes.removeByRecipeName("threng:ma_vent");
recipes.removeByRecipeName("threng:ma_controller");
recipes.removeByRecipeName("threng:ma_mod_cpu");
recipes.removeByRecipeName("threng:ma_mod_pattern");

// Use Greg Certus
mods.threng.Centrifuge.removeRecipe(<appliedenergistics2:material:10>);
mods.threng.Centrifuge.addRecipe(<appliedenergistics2:material:10> * 2, <metaitem:gemCertusQuartz>);

// Materials
// Fluix Steel
alloy.recipeBuilder()
    .inputs(<ore:ingotEndSteel>, <ore:dustFluix>)
    .outputs(<threng:material>)
    .duration(400).EUt(1920).buildAndRegister();

// Resonating Crystal
autoclave.recipeBuilder()
    .inputs(<enderio:item_material:19>) // Prescient Crystal
    .fluidInputs(<liquid:radon> * 1000)
    .outputs(<threng:material:5>)
    .duration(400).EUt(1920).buildAndRegister();

// Fluix Logic
circuit_assembler.recipeBuilder()
    .inputs(<metaitem:frameTitanium>, <ore:circuitIv>, <appliedenergistics2:material:24> * 3, <threng:material> * 4, <appliedenergistics2:part:16> * 4)
    .fluidInputs(<liquid:soldering_alloy> * 144)
    .outputs(<threng:material:4>)
    .duration(400).EUt(1920).buildAndRegister();
circuit_assembler.recipeBuilder()
    .inputs(<metaitem:frameTitanium>, <ore:circuitIv>, <appliedenergistics2:material:24> * 3, <threng:material> * 4, <appliedenergistics2:part:16> * 4)
    .fluidInputs(<liquid:tin> * 288)
    .outputs(<threng:material:4>)
    .duration(400).EUt(1920).buildAndRegister();

// Speculation Core 64x
assembler.recipeBuilder()
    .inputs(<metaitem:frameBlackSteel>, <ore:circuitIv>, <threng:material:6>, <metaitem:sensor.ev> * 4, <appliedenergistics2:part:16> * 16, <appliedenergistics2:material:6> * 64)
    .outputs(<threng:material:13>)
    .duration(600).EUt(1920).buildAndRegister();

// MA Frame
assembler.recipeBuilder()
    .inputs(<threng:material:5> * 4, <metaitem:frameBlueSteel> * 4, <extrautils2:crafter>, <ore:circuitHv>)
    .fluidInputs(<liquid:plastic> * 288)
    .outputs(<threng:big_assembler> * 4)
    .duration(150).EUt(1920).buildAndRegister();

// MA Vent
assembler.recipeBuilder()
    .inputs(<threng:big_assembler>, <metaitem:electric.motor.hv>)
    .outputs(<threng:big_assembler:1>)
    .duration(100).EUt(1920).buildAndRegister();

// MA IO Port
assembler.recipeBuilder()
    .inputs(<threng:big_assembler> * 4, <metaitem:pipeNormalItemPlatinum> * 4, <appliedenergistics2:interface> * 4)
    .fluidInputs(<liquid:plastic> * 288)
    .outputs(<threng:big_assembler:5>)
    .duration(150).EUt(1920).buildAndRegister();

// MA Pattern Provider
assembler.recipeBuilder()
    .inputs(<threng:big_assembler> * 4, <appliedenergistics2:material:24> * 4, <appliedenergistics2:interface> * 4, <appliedenergistics2:molecular_assembler>)
    .fluidInputs(<liquid:plastic> * 288)
    .outputs(<threng:big_assembler:3>)
    .duration(150).EUt(1920).buildAndRegister();

// MA Coprocessor
assembler.recipeBuilder()
    .inputs(<threng:big_assembler> * 4, <threng:material:6> * 4, <appliedenergistics2:crafting_accelerator> * 4, <appliedenergistics2:interface> * 4, <appliedenergistics2:molecular_assembler>)
    .fluidInputs(<liquid:plastic> * 288)
    .outputs(<threng:big_assembler:4>)
    .duration(150).EUt(1920).buildAndRegister();

// MA Controller
assembler.recipeBuilder()
    .inputs(<threng:big_assembler> * 4, <threng:material:4> * 4, <appliedenergistics2:interface> * 4, <appliedenergistics2:part:16> * 4, <appliedenergistics2:molecular_assembler> * 4, <threng:material:14> * 4, <metaitem:field.generator.iv> * 4, <ore:circuitIv> * 4)
    .fluidInputs(<liquid:plastic> * 288)
    .outputs(<threng:big_assembler:2>)
    .duration(400).EUt(1920).buildAndRegister();

// Circuit Etcher
recipes.remove(<threng:machine:2>);
recipes.addShaped(<threng:machine:2>, [
    [<appliedenergistics2:material:19>, <ae2stuff:inscriber>, <appliedenergistics2:material:13>],
    [<appliedenergistics2:quartz_glass>, <threng:material:4>, <appliedenergistics2:quartz_glass>],
    [<appliedenergistics2:material:15>, <appliedenergistics2:material:43>, <appliedenergistics2:material:14>]
]);

mods.threng.Etcher.removeRecipe(<appliedenergistics2:material:22>);
mods.threng.Etcher.removeRecipe(<appliedenergistics2:material:23>);
mods.threng.Etcher.removeRecipe(<appliedenergistics2:material:24>);
mods.threng.Etcher.removeRecipe(<threng:material:6>);
mods.threng.Etcher.removeRecipe(<threng:material:14>);

mods.threng.Etcher.addRecipe(<appliedenergistics2:material:22>, <ore:circuitLv>, <ore:plateGold>, <ore:plateSilicon>);
mods.threng.Etcher.addRecipe(<appliedenergistics2:material:23>, <ore:circuitLv>, <ore:plateCertusQuartz>, <ore:plateSilicon>);
mods.threng.Etcher.addRecipe(<appliedenergistics2:material:24>, <ore:circuitLv>, <ore:plateDiamond>, <ore:plateSilicon>);
mods.threng.Etcher.addRecipe(<threng:material:6>, <ore:circuitEv>, <threng:material:5>, <ore:plateSilicon>);
mods.threng.Etcher.addRecipe(<threng:material:14>, <ore:circuitEv>, <threng:material:13>, <ore:plateSilicon>);

// Removals
mods.jei.JEI.removeAndHide(<threng:machine>);
mods.jei.JEI.removeAndHide(<threng:machine:5>);
mods.jei.JEI.removeAndHide(<threng:material:1>);
mods.jei.JEI.removeAndHide(<threng:material:2>);
mods.jei.JEI.removeAndHide(<threng:material:7>);
mods.jei.JEI.removeAndHide(<threng:material:8>);
mods.jei.JEI.removeAndHide(<threng:material:9>);
mods.jei.JEI.removeAndHide(<threng:material:10>);
mods.jei.JEI.removeAndHide(<threng:material:11>);
mods.jei.JEI.removeAndHide(<threng:material:12>);
