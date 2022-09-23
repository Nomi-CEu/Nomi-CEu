#modloaded threng

import mods.appliedenergistics2.Inscriber;

Inscriber.removeRecipe(<threng:material:2>);

mods.threng.Centrifuge.removeRecipe(<appliedenergistics2:material:45>);
mods.threng.Centrifuge.removeRecipe(<appliedenergistics2:material:46>);

furnace.remove(<threng:material>);

mods.jei.JEI.hideCategory("threng.agg");
mods.jei.JEI.hideCategory("threng.energize");

recipes.removeByRecipeName("threng:machine_core");
recipes.removeByRecipeName("threng:spec_core_64");

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

// Circuit Etcher
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
