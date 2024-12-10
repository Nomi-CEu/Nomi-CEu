import mods.gregtech.recipe.RecipeMap;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.ICraftingInfo;
import scripts.common.makeShaped as makeShaped;

//Conductive Iron Thruster
recipes.remove(<simplyjetpacks:metaitemmods:7>);
recipes.addShaped(<simplyjetpacks:metaitemmods:7>, [
	[<metaitem:nomilabs:plateConductiveIron>, <enderio:item_power_conduit>, <metaitem:nomilabs:plateConductiveIron>],
	[<metaitem:nomilabs:plateConductiveIron>, <extrautils2:ingredients>, <metaitem:nomilabs:plateConductiveIron>],
	[<ore:plateRedAlloy>,<ore:plateRedAlloy>,<ore:plateRedAlloy>]]);

//Leadstone Thruster
recipes.remove(<simplyjetpacks:metaitemmods:26>);
recipes.addShaped(<simplyjetpacks:metaitemmods:26>, [
	[<ore:plateLead>, <thermalfoundation:material:513>, <ore:plateLead>],
	[<ore:plateLead>, <thermalexpansion:dynamo>, <ore:plateLead>],
	[<ore:plateRedAlloy>,<ore:plateRedAlloy>,<ore:plateRedAlloy>]]);

//Electrical Steel Thruster
recipes.remove(<simplyjetpacks:metaitemmods:8>);
recipes.addShaped(<simplyjetpacks:metaitemmods:8>, [
	[<metaitem:nomilabs:plateElectricalSteel>, <enderio:item_power_conduit>, <metaitem:nomilabs:plateElectricalSteel>],
	[<metaitem:nomilabs:plateElectricalSteel>, <enderio:item_material:14>, <metaitem:nomilabs:plateElectricalSteel>],
	[<ore:plateRedAlloy>,<simplyjetpacks:metaitemmods:7>,<ore:plateRedAlloy>]]);

//Hardened Thruster
recipes.remove(<simplyjetpacks:metaitemmods:27>);
recipes.addShaped(<simplyjetpacks:metaitemmods:27>, [
	[<ore:plateInvar>, <thermalfoundation:material:513>, <ore:plateInvar>],
	[<ore:plateInvar>, <thermalexpansion:dynamo:1>, <ore:plateInvar>],
	[<ore:plateRedAlloy>,<ore:plateRedAlloy>,<ore:plateRedAlloy>]]);

//Energetic Alloy Thruster
recipes.remove(<simplyjetpacks:metaitemmods:9>);
recipes.addShaped(<simplyjetpacks:metaitemmods:9>, [
	[<metaitem:nomilabs:plateEnergeticAlloy>, <enderio:item_power_conduit:1>, <metaitem:nomilabs:plateEnergeticAlloy>],
	[<metaitem:nomilabs:plateEnergeticAlloy>, <enderio:item_material:15>, <metaitem:nomilabs:plateEnergeticAlloy>],
	[<metaitem:plateRedAlloy>,<simplyjetpacks:metaitemmods:8>,<metaitem:plateRedAlloy>]]);

//Reinforced Thruster
recipes.remove(<simplyjetpacks:metaitemmods:28>);
recipes.addShaped(<simplyjetpacks:metaitemmods:28>, [
	[<ore:plateAluminium>, <thermalfoundation:material:513>, <ore:plateAluminium>],
	[<ore:plateElectrum>, <thermalexpansion:dynamo:3>, <ore:plateElectrum>],
	[<ore:plateRedAlloy>,<ore:plateRedAlloy>,<ore:plateRedAlloy>]]);

//Vibrant Alloy Thruster
recipes.remove(<simplyjetpacks:metaitemmods:10>);
recipes.addShaped(<simplyjetpacks:metaitemmods:10>, [
	[<metaitem:nomilabs:plateVibrantAlloy>, <enderio:item_power_conduit:2>, <metaitem:nomilabs:plateVibrantAlloy>],
	[<metaitem:nomilabs:plateVibrantAlloy>, <enderio:item_material:19>, <metaitem:nomilabs:plateVibrantAlloy>],
	[<metaitem:plateRedAlloy>,<simplyjetpacks:metaitemmods:9>,<metaitem:plateRedAlloy>]]);

//Dark Soularium Thruster
recipes.remove(<simplyjetpacks:metaitemmods:11>);
recipes.addShaped(<simplyjetpacks:metaitemmods:11>, [
	[<ore:ingot_dark_soularium>,<enderio:item_endergy_conduit:10>,<ore:ingot_dark_soularium>],
	[<ore:ingot_dark_soularium>,<simplyjetpacks:metaitemmods:6>,<ore:ingot_dark_soularium>],
	[<simplyjetpacks:metaitemmods:10>, <simplyjetpacks:metaitemmods:10>, <simplyjetpacks:metaitemmods:10>]]);

//Resonant Thruster
recipes.remove(<simplyjetpacks:metaitemmods:29>);
recipes.addShaped(<simplyjetpacks:metaitemmods:29>, [
	[<ore:plateEnderium>, <thermalfoundation:material:513>, <ore:plateEnderium>],
	[<ore:plateEnderium>, <thermalexpansion:dynamo:5>, <ore:plateEnderium>],
	[<ore:plateRedAlloy>,<ore:plateRedAlloy>,<ore:plateRedAlloy>]]);

recipes.remove(<simplyjetpacks:metaitemmods:30>);
recipes.addShaped(<simplyjetpacks:metaitemmods:30>, [
	[null, <redstonearsenal:material:224>, null],
	[<redstonearsenal:material:224>, <simplyjetpacks:metaitemmods:19>, <redstonearsenal:material:224>],
	[<ore:plateSignalum>, <simplyjetpacks:metaitemmods:29>, <ore:plateSignalum>]]);

recipes.remove(<simplyjetpacks:metaitemmods:5>);
recipes.addShaped(<simplyjetpacks:metaitemmods:5>, [
	[<ore:ingot_dark_soularium>, <ore:ingotElectricalSteel>, <ore:ingot_dark_soularium>],
	[<ore:ingotElectricalSteel>, <enderio:block_fused_quartz>, <ore:ingotElectricalSteel>],
	[<ore:ingot_dark_soularium>, <ore:ingotElectricalSteel>, <ore:ingot_dark_soularium>]]);

recipes.remove(<simplyjetpacks:metaitemmods:18>);
recipes.addShaped(<simplyjetpacks:metaitemmods:18>, [
	[<ore:ingotElectrumFlux>, <ore:ingotLumium>, <ore:ingotElectrumFlux>],
	[<ore:ingotLumium>, <enderio:block_fused_quartz>, <ore:ingotLumium>],
	[<ore:ingotElectrumFlux>, <ore:ingotLumium>, <ore:ingotElectrumFlux>]]);

recipes.remove(<simplyjetpacks:metaitemmods:20>);
recipes.addShaped(<simplyjetpacks:metaitemmods:20>, [
	[<ore:ingotElectrumFlux>, <ore:ingotSignalum>, <ore:ingotElectrumFlux>],
	[<ore:ingotSignalum>, <enderio:block_fused_quartz>, <ore:ingotSignalum>],
	[<ore:ingotElectrumFlux>, <ore:ingotSignalum>, <ore:ingotElectrumFlux>]]);

// Elevation Unit
canner.recipeBuilder()
	.inputs(<simplyjetpacks:metaitemmods:18>)
	.fluidInputs(<liquid:glowstone> * 4032)
	.outputs(<simplyjetpacks:metaitemmods:19>)
	.duration(100)
	.EUt(7)
	.buildAndRegister();

// Coolant Unit
canner.recipeBuilder()
	.inputs(<simplyjetpacks:metaitemmods:20>)
	.fluidInputs(<liquid:cryotheum> * 6000)
	.outputs(<simplyjetpacks:metaitemmods:21>)
	.duration(100)
	.EUt(7)
	.buildAndRegister();

// basic capacitor bank
recipes.remove(<enderio:block_cap_bank:1>);
recipes.addShaped(<enderio:block_cap_bank:1>,  [
	[<metaitem:nomilabs:plateDarkSteel>, <enderio:item_basic_capacitor>, <metaitem:nomilabs:plateDarkSteel>],
	[<enderio:item_basic_capacitor>, <enderio:block_buffer:1>, <enderio:item_basic_capacitor>],
	[<metaitem:nomilabs:plateDarkSteel>, <enderio:item_basic_capacitor>, <metaitem:nomilabs:plateDarkSteel>]]);


// adds the existing power of both recipe ingredient capacitor banks to be placed into the resulting craft
val sumCapacitorBankPower as IRecipeFunction = function(out, ins, cInfo) {
		var energy = 0;
		if (ins.left.tag.memberGet("enderio:energy")) {
			energy += ins.left.tag.memberGet("enderio:energy");
		}
		if (ins.right.tag.memberGet("enderio:energy")) {
			energy += ins.right.tag.memberGet("enderio:energy");
		}
		return out.updateTag({"enderio:energy": energy});
	};

// advanced capacitor bank
recipes.remove(<enderio:block_cap_bank:2>);
recipes.addShaped(<enderio:block_cap_bank:2>,  [
	[<metaitem:nomilabs:plateElectricalSteel>,<metaitem:nomilabs:plateElectricalSteel>,<metaitem:nomilabs:plateElectricalSteel>],
	[<enderio:block_cap_bank:1>.marked("left"), <enderio:item_basic_capacitor:1>, <enderio:block_cap_bank:1>.marked("right")],
	[<metaitem:nomilabs:plateElectricalSteel>,<metaitem:nomilabs:plateElectricalSteel>,<metaitem:nomilabs:plateElectricalSteel>]],
	sumCapacitorBankPower);

// vibrant capacitor bank
recipes.remove(<enderio:block_cap_bank:3>);
recipes.addShaped(<enderio:block_cap_bank:3>,  [
	[<metaitem:nomilabs:plateVibrantAlloy>,<metaitem:nomilabs:plateVibrantAlloy>,<metaitem:nomilabs:plateVibrantAlloy>],
	[<enderio:block_cap_bank:2>.marked("left"), <ore:itemVibrantCrystal>, <enderio:block_cap_bank:2>.marked("right")],
	[<metaitem:nomilabs:plateVibrantAlloy>,<metaitem:nomilabs:plateVibrantAlloy>,<metaitem:nomilabs:plateVibrantAlloy>]],
	sumCapacitorBankPower);

//Conductive Iron Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe1");
recipes.addShaped(conductiveironjetpack, [
	[<ore:plateConductiveIron>,       <enderio:item_basic_capacitor>, <ore:plateConductiveIron>],
	[<ore:plateConductiveIron>,       <simplyjetpacks:metaitem:4>,    <ore:plateConductiveIron>],
	[<simplyjetpacks:metaitemmods:7>, null,                           <simplyjetpacks:metaitemmods:7>]]);

//Leadstone Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe30");
recipes.addShaped(leadstonejetpack, [
	[<ore:plateLead>,                  <thermalexpansion:capacitor>, <ore:plateLead>],
	[<ore:plateLead>,                  <simplyjetpacks:metaitem:4>,  <ore:plateLead>],
	[<simplyjetpacks:metaitemmods:26>, null,                         <simplyjetpacks:metaitemmods:26>]]);

val transferTag as IRecipeFunction = function(out as IItemStack, ins as IItemStack[string], cInfo as ICraftingInfo) as IItemStack {
    return out.withTag(ins.jetpack.tag);
};

//Electrical Steel Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe2");
recipes.addShaped(electricalsteeljetpack, [
	[<ore:plateElectricalSteel>,      <enderio:item_basic_capacitor:1>,        <ore:plateElectricalSteel>],
	[<ore:plateElectricalSteel>,      conductiveironjetpack.marked("jetpack"), <ore:plateElectricalSteel>],
	[<simplyjetpacks:metaitemmods:8>, null,                                    <simplyjetpacks:metaitemmods:8>]],
	transferTag);

//Hardened Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe31");
recipes.addShaped(hardenedjetpack, [
	[<ore:plateInvar>,                 <thermalexpansion:capacitor:1>,     <ore:plateInvar>],
	[<ore:plateInvar>,                 leadstonejetpack.marked("jetpack"), <ore:plateInvar>],
	[<simplyjetpacks:metaitemmods:27>, null,                               <simplyjetpacks:metaitemmods:27>]],
	transferTag);

//Energetic Alloy Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe3");
recipes.addShaped(energeticjetpack, [
	[<ore:plateEnergeticAlloy>,       <enderio:item_basic_capacitor:2>,         <ore:plateEnergeticAlloy>],
	[<ore:plateEnergeticAlloy>,       electricalsteeljetpack.marked("jetpack"), <ore:plateEnergeticAlloy>],
	[<simplyjetpacks:metaitemmods:9>, null,                                     <simplyjetpacks:metaitemmods:9>]],
	transferTag);

//Reinforced Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe32");
recipes.addShaped(reinforcedjetpack, [
	[<ore:plateElectrum>,              <thermalexpansion:capacitor:2>,    <ore:plateElectrum>],
	[<ore:plateElectrum>,              hardenedjetpack.marked("jetpack"), <ore:plateElectrum>],
	[<simplyjetpacks:metaitemmods:28>, null,                              <simplyjetpacks:metaitemmods:28>]],
	transferTag);

//Vibrant Alloy Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe4");
recipes.addShaped(vibrantjetpack, [
	[<metaitem:nomilabs:plateVibrantAlloy>,     <nomilabs:compressedoctadiccapacitor>,               <metaitem:nomilabs:plateVibrantAlloy>],
	[<metaitem:nomilabs:plateVibrantAlloy>,     energeticjetpack.marked("jetpack"), <metaitem:nomilabs:plateVibrantAlloy>],
	[<simplyjetpacks:metaitemmods:10>, null,                               <simplyjetpacks:metaitemmods:10>]],
	transferTag);

//Resonant Jetpack
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe33");
recipes.addShaped(resonantjetpack, [
	[<ore:plateEnderium>,              <thermalexpansion:capacitor:4>,      <ore:plateEnderium>],
	[<ore:plateEnderium>,              reinforcedjetpack.marked("jetpack"), <ore:plateEnderium>],
	[<simplyjetpacks:metaitemmods:29>, null,                                <simplyjetpacks:metaitemmods:29>]],
	transferTag);

//Dark Soularium JetPlate
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe5");
// Moved to Groovy

//Flux-Infused Jetplate
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe34");
// Moved to Groovy

/* Fix Armored Jetpacks */
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe15"); // conductive iron
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe17"); // electrical steel
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe19"); // energetic
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe21"); // vibrant
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshapeless0"); // leadstone
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshapeless1"); // conductive
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshapeless2"); // reinforced
recipes.removeByRecipeName("simplyjetpacks:upgraderecipeshapeless3"); // resonant

recipes.addShapeless("armored_conductive_iron_jetpack",
                     armoredconductiveironjetpack,
                     [conductiveironjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:12>],
                     transferTag);

recipes.addShapeless("armored_electrical_steel_jetpack",
                     armoredelectricalsteeljetpack,
                     [electricalsteeljetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:13>],
                     transferTag);

recipes.addShapeless("armored_energetic_jetpack",
                     armoredenergeticjetpack,
                     [energeticjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:14>],
                     transferTag);

recipes.addShapeless("armored_vibrant_jetpack",
                     armoredvibrantjetpack,
                     [vibrantjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:15>],
                     transferTag);

recipes.addShapeless("armored_leadstone_jetpack",
                     armoredleadstonejetpack,
                     [leadstonejetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:22>],
                     transferTag);

recipes.addShapeless("armored_hardened_jetpack",
                     armoredhardenedjetpack,
                     [hardenedjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:23>],
                     transferTag);

recipes.addShapeless("armored_reinforced_jetpack",
                     armoredreinforcedjetpack,
                     [reinforcedjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:24>],
                     transferTag);

recipes.addShapeless("armored_resonant_jetpack",
                     armoredresonantjetpack,
                     [resonantjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:25>],
                     transferTag);

//Add Jetpack Nbt Resetting recipes

//Enderio Jetpacks
recipes.addShapeless(conductiveironjetpack, [<simplyjetpacks:itemjetpack:1>]);
recipes.addShapeless(electricalsteeljetpack, [<simplyjetpacks:itemjetpack:2>]);
recipes.addShapeless(energeticjetpack, [<simplyjetpacks:itemjetpack:3>]);
recipes.addShapeless(vibrantjetpack, [<simplyjetpacks:itemjetpack:4>]);


//TE Jetpacks
recipes.addShapeless(leadstonejetpack, [<simplyjetpacks:itemjetpack:10>]);
recipes.addShapeless(hardenedjetpack, [<simplyjetpacks:itemjetpack:11>]);
recipes.addShapeless(reinforcedjetpack, [<simplyjetpacks:itemjetpack:12>]);
recipes.addShapeless(resonantjetpack, [<simplyjetpacks:itemjetpack:13>]);


recipes.remove(<openglider:hang_glider_part:2>);
recipes.addShaped(<openglider:hang_glider_part:2>, [
	[null, <metaitem:stickIron>, null],
	[<metaitem:stickIron>, null, <metaitem:stickIron>],
	[<metaitem:stickIron>, <metaitem:stickIron>,<metaitem:stickIron>]]);

recipes.addShaped(<thermalexpansion:frame:130>, [
	[<metaitem:plateElectrum>, <metaitem:stickElectrum>, <metaitem:plateElectrum>],
	[<metaitem:stickElectrum>, null, <metaitem:stickElectrum>],
	[<metaitem:plateElectrum>, <metaitem:stickElectrum>, <metaitem:plateElectrum>]]);

recipes.addShaped(<thermalexpansion:frame:131>, [
	[<metaitem:nomilabs:plateSignalum>, <metaitem:nomilabs:stickSignalum>, <metaitem:nomilabs:plateSignalum>],
	[<metaitem:nomilabs:stickSignalum>, null, <metaitem:nomilabs:stickSignalum>],
	[<metaitem:nomilabs:plateSignalum>, <metaitem:nomilabs:stickSignalum>, <metaitem:nomilabs:plateSignalum>]]);

recipes.addShaped(<thermalexpansion:frame:132>, [
	[<metaitem:nomilabs:plateEnderium>, <metaitem:nomilabs:stickEnderium>, <metaitem:nomilabs:plateEnderium>],
	[<metaitem:nomilabs:stickEnderium>, null, <metaitem:nomilabs:stickEnderium>],
	[<metaitem:nomilabs:plateEnderium>, <metaitem:nomilabs:stickEnderium>, <metaitem:nomilabs:plateEnderium>]]);

// redstone cell frame (filled) => "micro miner engine core"
fluid_canner.recipeBuilder()
    .fluidInputs([<liquid:redstone> * (1296 * 2)])
    .inputs([<thermalexpansion:frame:130>])
    .outputs([<thermalexpansion:frame:146>])
    .duration(500).EUt(480).buildAndRegister();

// signalum cell frame (filled) => "signalum micro miner engine core"
fluid_canner.recipeBuilder()
    .fluidInputs([<liquid:redstone> * (1296 * 4)])
    .inputs([<thermalexpansion:frame:131>])
    .outputs([<thermalexpansion:frame:147>])
    .duration(1000).EUt(2000).buildAndRegister();

// resonant cell frame (filled) => "enderium micro miner engine core"
fluid_canner.recipeBuilder()
    .fluidInputs([<liquid:redstone> * (1296 * 8)])
    .inputs([<thermalexpansion:frame:132>])
    .outputs([<thermalexpansion:frame:148>])
    .duration(2000).EUt(8000).buildAndRegister();

// Leadstone Energy Cell Frame
recipes.remove(<thermalexpansion:frame:128>);
recipes.addShaped(<thermalexpansion:frame:128>, [
	[<metaitem:plateLead>, <metaitem:stickLead>, <metaitem:plateLead>],
	[<metaitem:stickLead>, <enderio:block_cap_bank:3>.withTag({"enderio:energy": 0}, false), <metaitem:stickLead>],
	[<metaitem:plateLead>, <metaitem:stickLead>, <metaitem:plateLead>]]);

// Leadstone Energy Cell
recipes.remove(<thermalexpansion:cell>);

alloy.recipeBuilder()
    .inputs([<thermalexpansion:frame:128>, <minecraft:redstone_block>])
    .outputs([basiccell])
    .duration(500).EUt(30).buildAndRegister();
