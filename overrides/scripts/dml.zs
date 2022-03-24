#packmode normal

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import mods.gregtech.recipe.RecipeMap;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;

//Remove Faulty Data Module Recipes
recipes.remove(<deepmoblearning:data_model_zombie>);
recipes.remove(<deepmoblearning:data_model_skeleton>);
recipes.remove(<deepmoblearning:data_model_creeper>);
recipes.remove(<deepmoblearning:data_model_spider>);
recipes.remove(<deepmoblearning:data_model_slime>);
recipes.remove(<deepmoblearning:data_model_witch>);
recipes.remove(<deepmoblearning:data_model_blaze>);
recipes.remove(<deepmoblearning:data_model_wither_skeleton>);
recipes.remove(<deepmoblearning:data_model_enderman>);
recipes.remove(<deepmoblearning:data_model_wither>);
recipes.remove(<deepmoblearning:data_model_dragon>);
recipes.remove(<deepmoblearning:data_model_shulker>);
recipes.remove(<deepmoblearning:data_model_guardian>);
recipes.remove(<deepmoblearning:data_model_ghast>);
recipes.remove(<deepmoblearning:data_model_thermal_elemental>);

//Starting At Basic Tier
recipes.addShapeless(<deepmoblearning:data_model_zombie>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}),[<deepmoblearning:data_model_blank>, <minecraft:rotten_flesh>]);
recipes.addShapeless(<deepmoblearning:data_model_skeleton>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:bone>]);
recipes.addShapeless(<deepmoblearning:data_model_creeper>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:gunpowder>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>]);
recipes.addShapeless(<deepmoblearning:data_model_spider>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:web>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>]);
recipes.addShapeless(<deepmoblearning:data_model_slime>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:slime_ball>]);
recipes.addShapeless(<deepmoblearning:data_model_witch>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:glass_bottle>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>]);
recipes.addShapeless(<deepmoblearning:data_model_blaze>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:blaze_powder>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>]);
recipes.addShapeless(<deepmoblearning:data_model_ghast>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:ghast_tear>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>]);
recipes.addShapeless(<deepmoblearning:data_model_wither_skeleton>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:skull:1>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>, <deepmoblearning:living_matter_hellish>]);
recipes.addShapeless(<deepmoblearning:data_model_enderman>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:ender_pearl>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>]);
recipes.addShapeless(<deepmoblearning:data_model_wither>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:nether_star>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>]);
recipes.addShapeless(<deepmoblearning:data_model_dragon>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <contenttweaker:dragonlairdata>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>]);
recipes.addShapeless(<deepmoblearning:data_model_shulker>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:diamond>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>, <deepmoblearning:living_matter_extraterrestrial>]);
recipes.addShapeless(<deepmoblearning:data_model_guardian>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <minecraft:prismarine_shard>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>]);
recipes.addShapeless(<deepmoblearning:data_model_thermal_elemental>.withTag({simulationCount: 0, tier: 1, killCount: 0, totalKillCount: 0}), [<deepmoblearning:data_model_blank>, <thermalfoundation:material:1025> | <thermalfoundation:material:1026> | <thermalfoundation:material:1027>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>, <deepmoblearning:living_matter_overworldian>]);

recipes.remove(<deepmoblearning:extraction_chamber>);
recipes.addShaped(<deepmoblearning:extraction_chamber>, [	
	[<ore:plateEnergeticAlloy>, <minecraft:glass_pane>, <ore:plateEnergeticAlloy>], 
	[<ore:circuitGood>, <deepmoblearning:machine_casing>, <ore:circuitGood>], 
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
alloy.recipeBuilder().inputs([<ore:dustPulsating>,<minecraft:clay>]).outputs([<deepmoblearning:polymer_clay> * 4	]).duration(240).EUt(24).buildAndRegister();

recipes.remove(<deepmoblearning:simulation_chamber>);
recipes.addShaped(<deepmoblearning:simulation_chamber>, [
	[<ore:meshPulsating>, <minecraft:glass_pane>, <ore:meshPulsating>], 
	[<ore:circuitBasic>, <deepmoblearning:machine_casing>, <ore:circuitBasic>], 
	[<ore:meshPulsating>, <ore:circuitBasic>, <ore:meshPulsating>]]);

recipes.remove(<deepmoblearning:data_model_blank>);
recipes.addShaped(<deepmoblearning:data_model_blank>, [
	[<ore:plateElectricalSteel>, <ore:plateElectricalSteel>, <ore:wireFineGold>], 
	[<ore:meshPulsating>, <ore:circuitBasic>, <ore:wireFineGold>], 
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

