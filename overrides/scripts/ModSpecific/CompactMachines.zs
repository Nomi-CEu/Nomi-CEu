#modloaded compactmachines3

mods.jei.JEI.hideCategory("compactmachines3.MultiblockMiniaturization");
mods.jei.JEI.removeAndHide(<compactmachines3:fieldprojector>);

recipes.removeByRecipeName("compactmachines3:psd");
recipes.addShaped(<compactmachines3:psd>, [
    [null, <metaitem:cover.screen>, null],
    [<metaitem:emitter.hv>, <minecraft:book>, <metaitem:emitter.hv>],
    [null, <ore:circuitHv>, null]
]);

recipes.addShaped(<compactmachines3:wallbreakable> * 16, [
    [<metaitem:frameHslaSteel>, <metaitem:frameHslaSteel>, <metaitem:frameHslaSteel>],
    [<metaitem:frameHslaSteel>, <metaitem:sensor.hv>, <metaitem:frameHslaSteel>],
    [<metaitem:frameHslaSteel>, <metaitem:frameHslaSteel>, <metaitem:frameHslaSteel>]
]);

assembler.recipeBuilder()
    .inputs(<compactmachines3:wallbreakable> * 8, <metaitem:frameUltimet> * 4, <metaitem:field.generator.hv>)
    .circuit(1)
    .outputs(<compactmachines3:machine>)
    .duration(200).EUt(480).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<compactmachines3:wallbreakable> * 16, <metaitem:frameUltimet> * 4, <metaitem:field.generator.hv>)
    .circuit(2)
    .outputs(<compactmachines3:machine:1>)
    .duration(200).EUt(480).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<compactmachines3:wallbreakable> * 24, <metaitem:frameUltimet> * 4, <metaitem:field.generator.hv>)
    .circuit(3)
    .outputs(<compactmachines3:machine:2>)
    .duration(200).EUt(480).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<compactmachines3:wallbreakable> * 32, <metaitem:frameUltimet> * 4, <metaitem:field.generator.iv>)
    .circuit(4)
    .outputs(<compactmachines3:machine:3>)
    .duration(200).EUt(7680).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<compactmachines3:wallbreakable> * 40, <metaitem:frameUltimet> * 4, <metaitem:field.generator.iv>)
    .circuit(5)
    .outputs(<compactmachines3:machine:4>)
    .duration(200).EUt(7680).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<compactmachines3:wallbreakable> * 48, <metaitem:frameUltimet> * 4, <metaitem:field.generator.iv>)
    .circuit(6)
    .outputs(<compactmachines3:machine:5>)
    .duration(200).EUt(7680).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<metaitem:frameUltimet>, <metaitem:passthrough_hatch_item>, <metaitem:passthrough_hatch_fluid>, <metaitem:diode.hv>)
    .outputs(<compactmachines3:tunneltool> * 4)
    .duration(100).EUt(480).buildAndRegister();

assembler.recipeBuilder()
    .inputs(<metaitem:frameUltimet>, <enderio:item_redstone_conduit>)
    .outputs(<compactmachines3:redstonetunneltool> * 4)
    .duration(100).EUt(480).buildAndRegister();


