#modloaded ae2fc

recipes.removeByRecipeName("ae2fc:fluid_discretizer");
recipes.removeByRecipeName("ae2fc:fluid_pattern_encoder");
recipes.removeByRecipeName("ae2fc:fluid_level_maintainer");
recipes.removeByRecipeName("ae2fc:burette");
recipes.removeByRecipeName("ae2fc:dual_interface");
recipes.removeByRecipeName("ae2fc:fluid_level_maintainer");
recipes.removeByRecipeName("ae2fc:part_fluid_pattern_ex_terminal");

recipes.addShaped(<ae2fc:fluid_discretizer>, [
    [<ore:plateEnergeticAlloy>, <appliedenergistics2:part:220>, <ore:plateEnergeticAlloy>],
    [<appliedenergistics2:material:24>, <metaitem:field.generator.lv>, <appliedenergistics2:material:24>],
    [<ore:plateEnergeticAlloy>, <appliedenergistics2:part:221>, <ore:plateEnergeticAlloy>]
]);

recipes.addShaped(<ae2fc:fluid_pattern_encoder>, [
    [null, <metaitem:sensor.mv>, null],
    [<appliedenergistics2:material:24>, <metaitem:workbench>, <appliedenergistics2:material:24>],
    [null, <appliedenergistics2:material:54>, null],
]);

assembler.recipeBuilder()
    .inputs(<metaitem:hull.mv>, <metaitem:sensor.mv>, <metaitem:fluid_cell.glass_vial> * 2, <appliedenergistics2:material:23> * 2, <appliedenergistics2:quartz_vibrant_glass> * 4)
    .outputs(<ae2fc:burette>)
    .duration(100).EUt(30).buildAndRegister();

recipes.addShapeless(<ae2fc:dual_interface>, [<appliedenergistics2:interface>, <appliedenergistics2:fluid_interface>, <appliedenergistics2:material:23>, <ore:circuitHv>]);

recipes.addShaped(<ae2fc:fluid_level_maintainer>, [
    [<ore:ingotVibrantAlloy>, <appliedenergistics2:part:281>, <ore:ingotVibrantAlloy>],
    [<appliedenergistics2:material:24>, <appliedenergistics2:crafting_monitor>, <appliedenergistics2:material:24>],
    [<ore:ingotVibrantAlloy>, <metaitem:electric.pump.hv>, <ore:ingotVibrantAlloy>]
]);

recipes.addShaped(<ae2fc:part_fluid_pattern_ex_terminal>, [
    [<ae2fc:part_fluid_pattern_terminal>],
    [<ore:circuitEv>],
    [<ae2fc:fluid_pattern_encoder>]
]);
