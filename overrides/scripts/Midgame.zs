import mods.gregtech.recipe.RecipeMap;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.gregtech.material.Material;
import crafttweaker.data.IData;
import mods.actuallyadditions.AtomicReconstructor;

recipes.remove(<thermalexpansion:satchel:2>);
recipes.addShaped("test", <thermalexpansion:satchel:2>, [
	[null, <metaitem:nuggetElectrum>, null],
	[<metaitem:ingotAluminium>, <thermalexpansion:satchel:1>.marked("satchel"), <metaitem:ingotAluminium>], 
	[<metaitem:nuggetElectrum>, null, <metaitem:nuggetElectrum>]],
	function(out, ins, cInfo) {
    var tag = {} as IData;
    # This if is here to keep the tinkers workbench from screwing up JEI autocomplete
    if(ins has "satchel" && !isNull(ins.satchel) && ins.satchel.hasTag) {
        tag = ins.satchel.tag;
    }
    return out.withTag(tag);
}, null);

//Ender Star
recipes.remove(<actuallyadditions:item_misc:19>);	
reactor.recipeBuilder().inputs([<minecraft:nether_star>]).fluidInputs([<liquid:ender_distillation> * 8000]).outputs(<actuallyadditions:item_misc:19>).EUt(400).duration(2000).buildAndRegister();


//Fermenter
fermenter.recipeBuilder().fluidInputs([<liquid:canolaoil> * 100]).fluidOutputs([<liquid:refinedcanolaoil> * 100]).duration(400).EUt(2).buildAndRegister();

//Canola
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:canolaoil> * 1000,<liquid:methanol> * 6000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:canolaoil> * 1000,<liquid:ethanol> * 6000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:refinedcanolaoil> * 750,<liquid:methanol> * 4500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:refinedcanolaoil> * 750,<liquid:ethanol> * 4500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000,]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:crystaloil> * 500,<liquid:methanol> * 3000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:crystaloil> * 500,<liquid:ethanol> * 3000]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:empoweredoil> * 250,<liquid:methanol> * 1500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<metaitem:dustTinySodiumHydroxide>).fluidInputs([<liquid:empoweredoil> * 250,<liquid:ethanol> * 1500]).fluidOutputs([<liquid:glycerol> * 1000,<liquid:bio_diesel> * 6000]).duration(300).EUt(30).buildAndRegister();


large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:canolaoil> * 9000,<liquid:methanol> * 54000])			.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:canolaoil> * 9000,<liquid:ethanol> * 54000])			.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:refinedcanolaoil> * 6750,<liquid:methanol> * 40500])		.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:refinedcanolaoil> * 6750,<liquid:ethanol> * 40500])	.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:crystaloil> * 4500,<liquid:methanol> * 27000])			.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:crystaloil> * 4500,<liquid:ethanol> * 27000])		.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:empoweredoil> * 2250,<liquid:methanol> * 13500])			.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();
large_chemical_reactor.recipeBuilder().inputs(<metaitem:dustSodiumHydroxide>).fluidInputs([<liquid:empoweredoil> * 2250,<liquid:ethanol> * 13500])		.fluidOutputs([<liquid:glycerol> * 9000,<liquid:bio_diesel> * 54000]).duration(2700).EUt(30).buildAndRegister();

chemical_reactor.recipeBuilder().inputs(<actuallyadditions:item_misc:23>).fluidInputs([<liquid:canolaoil> * 1000]).fluidOutputs([<liquid:crystaloil> * 1000]).duration(100).EUt(120).buildAndRegister();
chemical_reactor.recipeBuilder().inputs(<actuallyadditions:item_misc:24>).fluidInputs([<liquid:canolaoil> * 1000]).fluidOutputs([<liquid:empoweredoil> * 1000]).duration(100).EUt(500).buildAndRegister();

//Moon Materials
macerator.recipeBuilder().inputs([<advancedrocketry:moonturf>]).outputs([<nomilabs:moondust>]).duration(200).EUt(400).buildAndRegister();
macerator.recipeBuilder().inputs([<advancedrocketry:moonturf_dark>]).outputs([<nomilabs:moondust>]).duration(200).EUt(400).buildAndRegister();

centrifuge.findRecipe(20, [], [<liquid:hydrogen> * 160]).remove();
centrifuge.recipeBuilder().fluidInputs(<liquid:hydrogen> * 500).fluidOutputs([<liquid:deuterium> * 10]).duration(800).EUt(30).buildAndRegister();
centrifuge.recipeBuilder().inputs(<nomilabs:moondust>).fluidOutputs([<liquid:deuterium> * 100]).duration(200).EUt(20).buildAndRegister();

// Fluxed electrum blend
recipes.remove(<redstonearsenal:material>);

// Replaces default flux crystal recipe with one for autoclave
recipes.remove(<redstonearsenal:material:160>);
autoclave.recipeBuilder()
    .inputs([<minecraft:diamond>])
    .fluidInputs([<liquid:redstone> * 720])
    .outputs([<redstonearsenal:material:160>])
    .duration(200).EUt(400).buildAndRegister();

// Flux Armour Plating    
recipes.remove(<redstonearsenal:material:224>);
recipes.addShaped(<redstonearsenal:material:224> * 4, [
	[null, <ore:plateElectrumFlux>, null],
	[<ore:plateElectrumFlux>, <ore:gemCrystalFlux>, <ore:plateElectrumFlux>],
	[null, <ore:plateElectrumFlux>, null]]);


//Manyullyn
mixer.recipeBuilder()
    .outputs(<metaitem:nomilabs:dustManyullyn> * 4)
    .inputs([<metaitem:nomilabs:dustArdite> * 4, <metaitem:dustCobalt> * 4, <ore:dustMana>])
    .duration(400).EUt(30).buildAndRegister();

//Ardite
mixer.recipeBuilder()
    .outputs(<metaitem:nomilabs:dustArdite> * 4)
    .inputs([<metaitem:dustRedSteel> * 3, <minecraft:blaze_powder>])
    .duration(200).EUt(30).buildAndRegister();

// Draconic Superconductor
vacuum_freezer.recipeBuilder()
	.inputs(<metaitem:nomilabs:wireGtSingleDraconium>)
	.fluidInputs(<liquid:nether_star> * 144)
	.outputs(<metaitem:nomilabs:wireGtSingleDraconicSuperconductor>)
	.duration(100)
	.EUt(6000)
	.buildAndRegister();

// Allow Gas Collector to work in LostCities, void dims
gas_collector.recipeBuilder()
	.fluidOutputs(<liquid:air> * 10000)
	.circuit(4)
	.property("dimension", 111)
	.property("dimension", 119)
	.duration(200)
	.EUt(16)
	.buildAndRegister();

// Rebalancing important chanced outputs
// Helium * 120
<recipemap:centrifuge>.findRecipe(20, [<metaitem:dustEndstone>], null).remove();
centrifuge.recipeBuilder()
	.inputs([<metaitem:dustEndstone>])
	.outputs([<minecraft:sand>, <metaitem:dustSmallTungstate>])
	.fluidOutputs([<liquid:helium> * 120])
	.chancedOutput(<metaitem:dustTinyPlatinum>, 5000, 2000)
	.duration(40)
	.EUt(1280)
	.buildAndRegister();

canner.recipeBuilder()
	.inputs(<minecraft:glass_bottle>)
	.fluidInputs(<liquid:xpjuice> * 500)
	.outputs(<minecraft:experience_bottle>)
	.duration(1500).EUt(4).buildAndRegister();

// DE Info Tablet
recipes.removeByRecipeName("draconicevolution:info_tablet");
recipes.addShaped(<draconicevolution:info_tablet>, [
	[<ore:stone>, <ore:stone>, <ore:stone>],
	[<ore:stone>, <ore:dustDraconium>, <ore:stone>],
	[<ore:stone>, <ore:stone>, <ore:stone>]
]);

// Prismarine Crystals
mods.actuallyadditions.AtomicReconstructor.addRecipe(<minecraft:prismarine_crystals>, <metaitem:gemTopaz>, 45000);

// Cow Egg
recipes.addShapeless(<minecraft:spawn_egg>.withTag({EntityTag: {id: "minecraft:cow"}}), [<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:cow"})]);
