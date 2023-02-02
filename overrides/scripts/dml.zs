#packmode normal

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;

recipes.remove(<deepmoblearning:extraction_chamber>);
recipes.addShaped(<deepmoblearning:extraction_chamber>, [	
	[<ore:plateEnergeticAlloy>, <minecraft:glass_pane>, <ore:plateEnergeticAlloy>], 
	[<ore:circuitMv>, <deepmoblearning:machine_casing>, <ore:circuitMv>], 
	[<ore:plateEnergeticAlloy>, <minecraft:hopper>, <ore:plateEnergeticAlloy>]]);

recipes.remove(<deepmoblearning:machine_casing>);
<deepmoblearning:machine_casing>.displayName = "Dark Steel Machine Hull";
recipes.addShaped(<deepmoblearning:machine_casing>,[
	[<ore:plateDarkSteel>,<ore:plateDarkSteel>,<ore:plateDarkSteel>],
	[<ore:plateDarkSteel>,<meta_tile_entity:hull.lv>,<ore:plateDarkSteel>],
	[<ore:plateDarkSteel>,<ore:plateDarkSteel>,<ore:plateDarkSteel>]]);

recipes.remove(<metaitem:carbon.mesh>);
alloy.recipeBuilder().inputs([<minecraft:string> * 4,<ore:dustCoal>]).outputs([<metaitem:carbon.mesh>]).duration(100).EUt(16).buildAndRegister();
alloy.recipeBuilder().inputs([<minecraft:string> * 4,<ore:dustCarbon>]).outputs([<metaitem:carbon.mesh>]).duration(100).EUt(16).buildAndRegister();
alloy.recipeBuilder().inputs([<metaitem:carbon.mesh>,<ore:dustPulsating> * 4]).outputs([<contenttweaker:pulsatingmesh>]).duration(200).EUt(16).buildAndRegister();
alloy.recipeBuilder().inputs([<ore:dustPulsating>,<minecraft:clay>]).outputs([<deepmoblearning:polymer_clay> * 4	]).duration(240).EUt(7).buildAndRegister();

recipes.remove(<deepmoblearning:simulation_chamber>);
recipes.addShaped(<deepmoblearning:simulation_chamber>, [
	[<ore:meshPulsating>, <minecraft:glass_pane>, <ore:meshPulsating>], 
	[<ore:circuitLv>, <deepmoblearning:machine_casing>, <ore:circuitLv>], 
	[<ore:meshPulsating>, <ore:circuitLv>, <ore:meshPulsating>]]);

recipes.remove(<deepmoblearning:data_model_blank>);
recipes.addShaped(<deepmoblearning:data_model_blank>, [
	[<ore:plateElectricalSteel>, <ore:plateElectricalSteel>, <ore:wireFineGold>], 
	[<ore:meshPulsating>, <ore:circuitLv>, <ore:wireFineGold>], 
	[<ore:plateElectricalSteel>, <ore:plateElectricalSteel>, <ore:wireFineGold>]]);

recipes.remove(<deepmoblearning:polymer_clay>);
<deepmoblearning:polymer_clay>.displayName = "Pulsating Polymer Clay";

recipes.addShapeless(<minecraft:rotten_flesh> * 12, [<deepmoblearning:living_matter_overworldian>, <minecraft:chicken>]);
recipes.addShapeless(<minecraft:rotten_flesh> * 24, [<deepmoblearning:living_matter_overworldian>, <minecraft:beef>]);

recipes.addShapeless(<minecraft:string> * 5, [<minecraft:web>]);

recipes.remove(<minecraft:magma_cream>);
alloy.recipeBuilder().inputs([<minecraft:slime>,<minecraft:redstone>]).outputs([<minecraft:magma_cream>]).duration(40).EUt(8).buildAndRegister();

recipes.addShapeless(<minecraft:skull:1>, [<minecraft:skull>,<minecraft:skull>,<minecraft:skull>,<deepmoblearning:living_matter_hellish>]);

//Removes the unobtainable dirt recipe
recipes.removeByRecipeName("thermalfoundation:block_dirt");

//Add in a new dirt recipe
recipes.addShapeless(<minecraft:dirt> * 16, [
	<ore:treeSapling>,<ore:treeSapling>,
	<minecraft:clay>,<deepmoblearning:living_matter_overworldian>]);

recipes.remove(<deepmoblearning:data_model_thermal_elemental>);
recipes.addShapeless(<deepmoblearning:data_model_thermal_elemental>.withTag({simulationCount: 0, tier: 0, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <thermalfoundation:material:1025> | <thermalfoundation:material:1026> | <thermalfoundation:material:1027>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>]);


// Deep Learner
recipes.remove(<deepmoblearning:deep_learner>);
recipes.addShaped(<deepmoblearning:deep_learner>, [
    [null,null,null],
    [<metaitem:sensor.lv>,<metaitem:tricorder_scanner>,<metaitem:sensor.lv>],
    [null,null,null]]);

<deepmoblearning:glitch_fragment>.addTooltip(format.aqua(format.italic(
    "Obtained by crushing Glitch Hearts against Obsidian.")));

