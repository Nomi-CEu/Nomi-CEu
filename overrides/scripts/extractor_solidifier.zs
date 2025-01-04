import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import scripts.common.makeShaped as makeShaped;
import scripts.common.makeExtremeRecipe5 as makeExtremeRecipe5;
import scripts.common.makeExtremeRecipe7 as makeExtremeRecipe7;
import scripts.common.makeExtremeRecipe9 as makeExtremeRecipe9;

fluid_extractor.recipeBuilder()
    .inputs([<ore:gemEnderPearl>])
    .fluidOutputs([<liquid:ender> * 250])
    .duration(40).EUt(30).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<ore:dustMana>])
    .fluidOutputs([<liquid:mana> * 250])
    .duration(40).EUt(30).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:mana> * 250])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs([<thermalfoundation:material:1028>])
    .duration(40).EUt(30).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<thermalfoundation:coin:1>])
    .fluidOutputs([<liquid:gold> * 48])
    .duration(40).EUt(7).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<thermalfoundation:coin:64>])
    .fluidOutputs([<liquid:copper> * 48])
    .duration(40).EUt(7).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<thermalfoundation:coin:66>])
    .fluidOutputs([<liquid:silver> * 48])
    .duration(40).EUt(7).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<thermalfoundation:coin:69>])
    .fluidOutputs([<liquid:nickel> * 48])
    .duration(40).EUt(7).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<thermalfoundation:coin:70>])
    .fluidOutputs([<liquid:platinum> * 48])
    .duration(40).EUt(7).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<actuallyadditions:item_rice_seed>])
    .fluidOutputs([<liquid:seed_oil> * 10])
    .duration(32).EUt(2).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<actuallyadditions:item_canola_seed>])
    .fluidOutputs([<liquid:seed_oil> * 10])
    .duration(32).EUt(2).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<actuallyadditions:item_flax_seed>])
    .fluidOutputs([<liquid:seed_oil> * 10])
    .duration(32).EUt(2).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<actuallyadditions:item_coffee_seed>])
    .fluidOutputs([<liquid:seed_oil> * 10])
    .duration(32).EUt(2).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<actuallyadditions:item_misc:23>])
    .fluidOutputs([<liquid:seed_oil> * 50])
    .duration(32).EUt(20).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<actuallyadditions:item_misc:24>])
    .fluidOutputs([<liquid:seed_oil> * 250])
    .duration(32).EUt(200).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:thorium>])
    .fluidOutputs([<liquid:thorium> * 144])
    .duration(200).EUt(30).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:thorium:4>])
    .fluidOutputs([<liquid:thorium> * 144])
    .duration(200).EUt(30).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:thorium:2>])
    .fluidOutputs([<liquid:thorium> * 16])
    .duration(20).EUt(30).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:thorium:6>])
    .fluidOutputs([<liquid:thorium> * 16])
    .duration(20).EUt(30).buildAndRegister();

//Solidified Gasses
solidifier.recipeBuilder()
    .fluidInputs([<liquid:argon> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedargon>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:krypton> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedkrypton>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:xenon> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedxenon>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:chlorine> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedchlorine>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:fluorine> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedfluorine>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:mercury> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedmercury>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:helium> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedhelium>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:neon> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedneon>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:radon> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedradon>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:nitrogen> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiednitrogen>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:oxygen> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedoxygen>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:hydrogen> * 1000])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:solidifiedhydrogen>)
    .duration(500).EUt(16).buildAndRegister();

// Special cases
extractor.recipeBuilder()
    .inputs(<nomilabs:solidifiedneon>)
    .fluidOutputs(<liquid:neon> * 1000)
    .duration(200).EUt(120).buildAndRegister();

extractor.recipeBuilder()
    .inputs(<nomilabs:solidifiedkrypton>)
    .fluidOutputs(<liquid:krypton> * 1000)
    .duration(200).EUt(120).buildAndRegister();

extractor.recipeBuilder()
    .inputs(<nomilabs:solidifiedxenon>)
    .fluidOutputs(<liquid:xenon> * 1000)
    .duration(200).EUt(120).buildAndRegister();

// Draconium Freezing
// Draconium Ingot * 1
<recipemap:vacuum_freezer>.findRecipe(1920, [<metaitem:nomilabs:ingotHotDraconium>], [<liquid:liquid_helium> * 500]).remove();

freezer.recipeBuilder()
    .inputs([<metaitem:nomilabs:ingotHotDraconium>])
    .fluidInputs([<liquid:cryotheum> * 2000])
    .outputs(<metaitem:nomilabs:ingotDraconium>)
    .duration(600).EUt(1920).buildAndRegister();

freezer.recipeBuilder()
    .inputs([<minecraft:ice>])
    .fluidInputs([<liquid:cryotheum> * 1000])
    .outputs(<nuclearcraft:block_ice>)
    .duration(600).EUt(1200).buildAndRegister();

//solidifier.recipeBuilder()
//    .fluidInputs([<liquid:thorium> * 144])
//    .notConsumable(<metaitem:shape.mold.ball>)
//    .outputs(<nomilabs:stabilizedthorium>)
//    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:uranium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizeduranium>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:uranium_235> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizeduranium>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:uranium233> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizeduranium>)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:neptunium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedneptunium> * 2)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:plutonium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedplutonium> * 2)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:plutonium_241> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedplutonium> * 2)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:plutonium2> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedplutonium> * 2)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:americium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedamericium> * 4)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:curium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedcurium> * 4)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:berkelium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedberkelium> * 8)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:californium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedcalifornium> * 8)
    .duration(500).EUt(16).buildAndRegister();

solidifier.recipeBuilder()
    .fluidInputs([<liquid:einsteinium> * 144])
    .notConsumable(<metaitem:shape.mold.ball>)
    .outputs(<nomilabs:stabilizedeinsteinium> * 16)
    .duration(500).EUt(16).buildAndRegister();


fluid_extractor.recipeBuilder()
    .inputs([<minecraft:dye:4>])
    .fluidOutputs([<liquid:lapis> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<metaitem:dustLapis>])
    .fluidOutputs([<liquid:lapis> * 144])
    .duration(180).EUt(16).buildAndRegister();


fluid_extractor.recipeBuilder()
    .inputs([<minecraft:quartz>])
    .fluidOutputs([<liquid:quartz> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<metaitem:dustNetherQuartz>])
    .fluidOutputs([<liquid:quartz> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<minecraft:emerald>])
    .fluidOutputs([<liquid:emerald> * 144])
    .duration(180).EUt(16).buildAndRegister();

// Molten Diamond for NC Active Coolers
fluid_extractor.recipeBuilder()
    .inputs([<minecraft:diamond>])
    .fluidOutputs([<liquid:diamond> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<metaitem:dustDiamond>])
    .fluidOutputs([<liquid:diamond> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}})])
    .fluidOutputs([<liquid:milk> * 32000])
    .duration(400).EUt(30).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:uranium>])
    .fluidOutputs([<liquid:uranium233> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:uranium:2>])
    .fluidOutputs([<liquid:uranium233> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:uranium:8>])
    .fluidOutputs([<liquid:uranium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:uranium:10>])
    .fluidOutputs([<liquid:uranium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:neptunium>])
    .fluidOutputs([<liquid:neptunium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:neptunium:2>])
    .fluidOutputs([<liquid:neptunium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:neptunium:4>])
    .fluidOutputs([<liquid:neptunium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:neptunium:6>])
    .fluidOutputs([<liquid:neptunium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:plutonium>])
    .fluidOutputs([<liquid:plutonium2> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:plutonium:2>])
    .fluidOutputs([<liquid:plutonium2> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:plutonium:4>])
    .fluidOutputs([<liquid:plutonium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:plutonium:6>])
    .fluidOutputs([<liquid:plutonium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:plutonium:12>])
    .fluidOutputs([<liquid:plutonium2> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:plutonium:14>])
    .fluidOutputs([<liquid:plutonium2> * 16])
    .duration(20).EUt(16).buildAndRegister();


fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium>])
    .fluidOutputs([<liquid:curium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:2>])
    .fluidOutputs([<liquid:curium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:4>])
    .fluidOutputs([<liquid:curium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:6>])
    .fluidOutputs([<liquid:curium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:8>])
    .fluidOutputs([<liquid:curium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:10>])
    .fluidOutputs([<liquid:curium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:12>])
    .fluidOutputs([<liquid:curium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:curium:14>])
    .fluidOutputs([<liquid:curium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:americium>])
    .fluidOutputs([<liquid:americium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:americium:2>])
    .fluidOutputs([<liquid:americium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:americium:4>])
    .fluidOutputs([<liquid:americium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:americium:6>])
    .fluidOutputs([<liquid:americium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:americium:8>])
    .fluidOutputs([<liquid:americium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:americium:10>])
    .fluidOutputs([<liquid:americium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:berkelium>])
    .fluidOutputs([<liquid:berkelium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:berkelium:2>])
    .fluidOutputs([<liquid:berkelium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:berkelium:4>])
    .fluidOutputs([<liquid:berkelium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:berkelium:6>])
    .fluidOutputs([<liquid:berkelium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium>])
    .fluidOutputs([<liquid:californium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:2>])
    .fluidOutputs([<liquid:californium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:4>])
    .fluidOutputs([<liquid:californium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:6>])
    .fluidOutputs([<liquid:californium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:8>])
    .fluidOutputs([<liquid:californium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:10>])
    .fluidOutputs([<liquid:californium> * 16])
    .duration(20).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:12>])
    .fluidOutputs([<liquid:californium> * 144])
    .duration(180).EUt(16).buildAndRegister();

fluid_extractor.recipeBuilder()
    .inputs([<nuclearcraft:californium:14>])
    .fluidOutputs([<liquid:californium> * 16])
    .duration(20).EUt(16).buildAndRegister();

//recipes.removeByRecipeName("gregtech:nugget_assembling_235");

