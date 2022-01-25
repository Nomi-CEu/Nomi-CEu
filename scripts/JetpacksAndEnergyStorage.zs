import mods.gregtech.recipe.RecipeMap;
import crafttweaker.recipes.IRecipeFunction;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;
import crafttweaker.recipes.ICraftingInfo;
import scripts.common.makeShaped as makeShaped;

//Conductive Iron Thruster
recipes.remove(<simplyjetpacks:metaitemmods:7>);
recipes.addShaped(<simplyjetpacks:metaitemmods:7>, [
	[<metaitem:plateConductiveIron>, <enderio:item_power_conduit>, <metaitem:plateConductiveIron>],
	[<metaitem:plateConductiveIron>, <extrautils2:ingredients>, <metaitem:plateConductiveIron>],
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
	[<metaitem:plateElectricalSteel>, <enderio:item_power_conduit>, <metaitem:plateElectricalSteel>],
	[<metaitem:plateElectricalSteel>, <enderio:item_material:14>, <metaitem:plateElectricalSteel>],
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
	[<metaitem:plateEnergeticAlloy>, <enderio:item_power_conduit:1>, <metaitem:plateEnergeticAlloy>],
	[<metaitem:plateEnergeticAlloy>, <enderio:item_material:15>, <metaitem:plateEnergeticAlloy>],
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
	[<metaitem:plateVibrantAlloy>, <enderio:item_power_conduit:2>, <metaitem:plateVibrantAlloy>],
	[<metaitem:plateVibrantAlloy>, <enderio:item_material:19>, <metaitem:plateVibrantAlloy>],
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

recipes.remove(<redstonearsenal:material:224>);
recipes.addShaped(<redstonearsenal:material:224> * 4, [
	[null, <ore:plateElectrumFlux>, null],
	[<ore:plateElectrumFlux>, <ore:gemCrystalFlux>, <ore:plateElectrumFlux>],
	[null, <ore:plateElectrumFlux>, null]]);


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

// fluxed electrum blend
recipes.remove(<redstonearsenal:material>);
recipes.addShapeless(<redstonearsenal:material> * 9,
    [<ore:dustElectrum>,<ore:dustElectrum>,<ore:dustElectrum>,
    <ore:dustElectrum>,<ore:dustElectrum>,<ore:dustElectrum>,
    <thermalfoundation:material:102>,<thermalfoundation:material:101>,<ore:dustMana>]);

//crafter
recipes.remove(<enderio:block_crafter>);
recipes.addShaped(<enderio:block_crafter>, [
	[<extrautils2:ingredients>,<avaritia:compressed_crafting_table>,<extrautils2:ingredients>],
	[<ore:gearIronInfinity>, <ore:itemMachineChassi>, <ore:gearIronInfinity>],
	[<enderio:item_item_conduit>,<enderio:item_item_conduit>,<enderio:item_item_conduit>]]);

// buffer
recipes.remove(<enderio:block_buffer:1>);
recipes.addShaped(<enderio:block_buffer:1>,  [
	[<metaitem:plateIron>, <metaitem:plateRedAlloy>, <metaitem:plateIron>],
	[<metaitem:plateRedAlloy>, <ore:blockRedstone>, <metaitem:plateRedAlloy>],
	[<metaitem:plateIron>, <metaitem:plateRedAlloy>, <metaitem:plateIron>]]);

// basic capacitor bank
recipes.remove(<enderio:block_cap_bank:1>);
recipes.addShaped(<enderio:block_cap_bank:1>,  [
	[<metaitem:plateDarkSteel>, <enderio:item_basic_capacitor>, <metaitem:plateDarkSteel>],
	[<enderio:item_basic_capacitor>, <enderio:block_buffer:1>, <enderio:item_basic_capacitor>],
	[<metaitem:plateDarkSteel>, <enderio:item_basic_capacitor>, <metaitem:plateDarkSteel>]]);


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
	[<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>],
	[<enderio:block_cap_bank:1>.marked("left"), <enderio:item_basic_capacitor:1>, <enderio:block_cap_bank:1>.marked("right")],
	[<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>]],
	sumCapacitorBankPower);
<enderio:block_cap_bank:2>.displayName = "Advanced Capacitor Bank";

// vibrant capacitor bank
recipes.remove(<enderio:block_cap_bank:3>);
recipes.addShaped(<enderio:block_cap_bank:3>,  [
	[<metaitem:plateVibrantAlloy>,<metaitem:plateVibrantAlloy>,<metaitem:plateVibrantAlloy>],
	[<enderio:block_cap_bank:2>.marked("left"), <ore:itemVibrantCrystal>, <enderio:block_cap_bank:2>.marked("right")],
	[<metaitem:plateVibrantAlloy>,<metaitem:plateVibrantAlloy>,<metaitem:plateVibrantAlloy>]],
	sumCapacitorBankPower);

//slice and splice
recipes.remove(<enderio:block_slice_and_splice>);
recipes.addShaped(<enderio:block_slice_and_splice>, [
	[<metaitem:plateTungstenSteel>, <ore:itemSkull>, <metaitem:plateTungstenSteel>],
	[<metaitem:plateTungstenSteel>, <ore:itemSoulMachineChassi>, <metaitem:plateTungstenSteel>],
	[<ore:gearEnergized>, <enderio:block_dark_iron_bars>, <ore:gearEnergized>]]);

// replaces default flux crystal recipe with one for autoclave
recipes.remove(<redstonearsenal:material:160>);
autoclave.recipeBuilder()
    .inputs([<minecraft:diamond>])
    .fluidInputs([<liquid:redstone> * 720])
    .outputs([<redstonearsenal:material:160>])
    .duration(200).EUt(400).buildAndRegister();

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
	[<metaitem:plateVibrantAlloy>,     compressedoctadiccap,               <metaitem:plateVibrantAlloy>],
	[<metaitem:plateVibrantAlloy>,     energeticjetpack.marked("jetpack"), <metaitem:plateVibrantAlloy>],
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
recipes.addShaped(darksoulariumjetplate, [
	[<enderio:item_material:16>,       <extrautils2:angelring:*>,               <enderio:item_material:16>],
	[<simplyjetpacks:metaitemmods:4>,  armoredvibrantjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:4>],
	[<simplyjetpacks:metaitemmods:11>, doublecompressedoctadiccap,              <simplyjetpacks:metaitemmods:11>]],
	transferTag);

//Flux-Infused Jetplate
recipes.removeByRecipeName("simplyjetpacks:upgraderecipe34");
recipes.addShaped(fluxinfusedjetplate, [
	[compressedoctadiccap,             <extrautils2:angelring:*>,                compressedoctadiccap],
	[<simplyjetpacks:metaitemmods:21>, armoredresonantjetpack.marked("jetpack"), <simplyjetpacks:metaitemmods:21>],
	[<simplyjetpacks:metaitemmods:30>, <redstonearsenal:armor.plate_flux>,       <simplyjetpacks:metaitemmods:30>]],
	transferTag);

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


//Staff of Travel
recipes.remove(<enderio:item_travel_staff>);
recipes.addShaped(<enderio:item_travel_staff>, [
    [null,null,<enderio:item_material:15>],
    [null,<metaitem:stickDarkSteel>,null],
    [<metaitem:stickDarkSteel>,null,null]]);

//Rod of Return
recipes.remove(<enderio:item_rod_of_return>);
recipes.addShaped(<enderio:item_rod_of_return>, [
	[null, <ore:itemPulsatingCrystal>, <ore:itemEnderCrystal>],
	[null, <metaitem:stickDarkSteel>, <ore:itemPulsatingCrystal>],
	[<metaitem:stickDarkSteel>, null, null]]);

//Ender Generator
recipes.remove(<enderio:block_ender_generator>);
recipes.addShaped(<enderio:block_ender_generator>, [
	[<metaitem:plateEndSteel>,<metaitem:plateEndSteel>, <metaitem:plateEndSteel>],
	[<appliedenergistics2:quartz_vibrant_glass>, <ore:skullEnderResonator>, <appliedenergistics2:quartz_vibrant_glass>],
	[<metaitem:gearEndSteel>, <metaitem:plateEndSteel>, <metaitem:gearEndSteel>]]);


//Wireless Dish
recipes.remove(<enderio:item_material:65>);
recipes.addShaped(<enderio:item_material:65>,
    [[<metaitem:emitter.lv>],[<metaitem:stickElectricalSteel>]]);

recipes.remove(<enderio:item_material>); // simple machine chassis
recipes.remove(<enderio:item_material:66>); // end steel chassis

// simple machine chassis
recipes.addShaped(<enderio:item_material>, [
    [<ore:barsIron>, <metaitem:plateIron>, <ore:barsIron>],
    [<metaitem:plateIron>, <ore:dustBedrock>, <metaitem:plateIron>],
    [<ore:barsIron>, <metaitem:plateIron>, <ore:barsIron>]]);

// dark steel rod + grains of infinity => infinity rod
alloy.recipeBuilder()
    .inputs([<metaitem:stickDarkSteel>,<enderio:item_material:20>])
    .outputs([<enderio:item_material:71>])
    .duration(200).EUt(30).buildAndRegister();

// end steel + grains => stellar
alloy.recipeBuilder()
    .inputs([<enderio:item_alloy_ingot:8>,<enderio:item_material:20> * 8])
    .outputs([<enderio:item_alloy_endergy_ingot:3>])
    .duration(200).EUt(2000).buildAndRegister();

// simple machine chassis + grains => industrial machine chassis
alloy.recipeBuilder()
    .inputs([<enderio:item_material>,<enderio:item_material:20> * 2])
    .outputs([<enderio:item_material:1>])
    .duration(200).EUt(30).buildAndRegister();

// end steel plate + industrial machine chassis => end steel chassis
alloy.recipeBuilder()
    .inputs([<enderio:item_material:1>,<metaitem:plateEndSteel> * 8])
    .outputs([<enderio:item_material:66>])
    .duration(800).EUt(30).buildAndRegister();

// fused quartz
alloy.recipeBuilder()
    .inputs([<minecraft:quartz> * 3])
    .outputs([<enderio:block_fused_quartz>])
    .duration(80).EUt(16).buildAndRegister();

//Zombie Generator
recipes.remove(<enderio:block_zombie_generator>);
recipes.addShaped(<enderio:block_zombie_generator>, [
	[<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>],
	[<appliedenergistics2:quartz_vibrant_glass>,<enderio:item_material:41>,<appliedenergistics2:quartz_vibrant_glass>],
	[<metaitem:gearPulsatingIron>,<metaitem:plateElectricalSteel>,<metaitem:gearPulsatingIron>]]);

recipes.remove(<enderio:block_franken_zombie_generator>);
recipes.addShaped(<enderio:block_franken_zombie_generator>, [
	[<ore:ingotSoularium>, <ore:ingotSoularium>, <ore:ingotSoularium>],
	[<ore:skullZombieFrankenstein>, <enderio:block_zombie_generator>, <ore:skullZombieFrankenstein>],
	[<metaitem:gearElectricalSteel>, <ore:ingotSoularium>, <metaitem:gearElectricalSteel>]]);

//The Vat
recipes.remove(<enderio:block_vat>);
recipes.addShaped(<enderio:block_vat>, [
	[<metaitem:plateDarkSteel>, <minecraft:cauldron>, <metaitem:plateDarkSteel>],
	[<enderio:block_tank>, <ore:itemMachineChassi>, <enderio:block_tank>],
	[<metaitem:electric.pump.mv>, <morefurnaces:furnaceblock:3>, <metaitem:electric.pump.mv>]]);

//Solar Cells
recipes.remove(<appliedenergistics2:quartz_fixture>);
recipes.addShaped(<appliedenergistics2:quartz_fixture> * 4, [
    [<appliedenergistics2:quartz_glass>,<appliedenergistics2:quartz_glass>,<appliedenergistics2:quartz_glass>],
    [<appliedenergistics2:material:1>,<appliedenergistics2:material:1>,<appliedenergistics2:material:1>],
    [<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>]]);

//Capacitor
recipes.remove(<enderio:item_basic_capacitor>);
recipes.addShaped(<enderio:item_basic_capacitor>, [
	[null, <enderio:item_alloy_nugget>,null],
	[<enderio:item_alloy_nugget>, <metaitem:circuit.vacuum_tube>, <enderio:item_alloy_nugget>],
	[<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);
recipes.addShaped(<enderio:item_basic_capacitor> * 3, [
	[null, <enderio:item_alloy_nugget>,null],
	[<enderio:item_alloy_nugget>, <metaitem:component.smd.capacitor>, <enderio:item_alloy_nugget>],
	[<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);
recipes.addShaped(<enderio:item_basic_capacitor> * 2, [
	[null, <enderio:item_alloy_nugget>,null],
	[<enderio:item_alloy_nugget>, <metaitem:component.capacitor>, <enderio:item_alloy_nugget>],
	[<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);

//Wired Charger
recipes.remove(<enderio:block_wired_charger>);
recipes.addShaped(<enderio:block_wired_charger>	, [
	[<metaitem:plateDarkSteel>, <appliedenergistics2:charger>, <metaitem:plateDarkSteel>],
	[<enderio:item_power_conduit>, <enderio:item_material:1>, <enderio:item_power_conduit>],
	[<metaitem:plateElectricalSteel>,<enderio:item_power_conduit>,<metaitem:plateElectricalSteel>]]);

//Coordinate Selector
recipes.remove(<enderio:item_coord_selector>);
recipes.addShaped(<enderio:item_coord_selector>	, [
	[<metaitem:emitter.mv>, <metaitem:blockEnderEye>, <metaitem:plateElectricalSteel>], //Ender Eye Block
	[null, <enderio:item_material:13>, <metaitem:plateElectricalSteel>],
	[null,null,<metaitem:plateElectricalSteel>]]);

recipes.remove(<enderio:item_material:11>); // infinity bimetal gear
recipes.remove(<enderio:item_material:12>); // energized bimetal gear
recipes.remove(<enderio:item_material:13>); // vibrant bimetal gear
recipes.remove(<enderio:item_material:14>); // pulsating crystal
recipes.remove(<enderio:item_material:15>); // vibrant crystal
recipes.remove(<enderio:item_material:73>); // dark bimetal gear

recipes.remove(<minecraft:stone:2>);
recipes.remove(<minecraft:stone:4>);
recipes.remove(<minecraft:stone:6>);

recipes.remove(<extrautils2:decorativesolid:2>); // polished stone

// pulsating crystal
autoclave.recipeBuilder()
    .inputs([<minecraft:diamond>])
    .fluidInputs([<liquid:pulsating_iron> * 144])
    .outputs([<enderio:item_material:14>])
    .duration(100).EUt(30).buildAndRegister();

// vibrant crystal
autoclave.recipeBuilder()
    .inputs([<minecraft:emerald>]).fluidInputs([<liquid:vibrant_alloy> * 144])
    .outputs([<enderio:item_material:15>])
    .duration(200).EUt(30).buildAndRegister();

// polished stone
autoclave.recipeBuilder()
    .inputs([<minecraft:stone>]).fluidInputs([<liquid:water> * 250])
    .outputs([<extrautils2:decorativesolid:2>])
    .duration(100).EUt(4).buildAndRegister();

// (granite, diorite, andesite) => polished
autoclave.recipeBuilder()
    .inputs([<minecraft:stone:1>]).fluidInputs([<liquid:water> * 250])
    .outputs([<minecraft:stone:2>])
    .duration(100).EUt(4).buildAndRegister();

autoclave.recipeBuilder()
    .inputs([<minecraft:stone:3>]).fluidInputs([<liquid:water> * 250])
    .outputs([<minecraft:stone:4>])
    .duration(100).EUt(4).buildAndRegister();

autoclave.recipeBuilder()
    .inputs([<minecraft:stone:5>]).fluidInputs([<liquid:water> * 250])
    .outputs([<minecraft:stone:6>])
    .duration(100).EUt(4).buildAndRegister();

// GT certus quartz
autoclave.recipeBuilder()
    .inputs([<metaitem:gemCertusQuartz>])
    .fluidInputs([<liquid:water> * 250])
    .outputs([<appliedenergistics2:material>])
    .duration(80).EUt(16).buildAndRegister();

recipes.remove(<appliedenergistics2:quartz_vibrant_glass>);

alloy.recipeBuilder()
    .inputs([<appliedenergistics2:quartz_glass>,<enderio:item_alloy_ingot:2>])
    .outputs([<appliedenergistics2:quartz_vibrant_glass>])
    .duration(80).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<metaitem:gearIron>,<enderio:item_material:20> * 2])
    .outputs([<enderio:item_material:11>])
    .duration(100).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:11>,<enderio:item_alloy_ingot:6> * 4])
    .outputs([<enderio:item_material:73>])
    .duration(150).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:11>,<enderio:item_alloy_ingot:1> * 4])
    .outputs([<enderio:item_material:12>])
    .duration(150).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:12>,<enderio:item_alloy_ingot:2> * 4])
    .outputs([<enderio:item_material:13>])
    .duration(200).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:1>,<enderio:item_material:74> * 8])
    .outputs([<enderio:item_material:53>])
    .duration(200).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:1>,<simplyjetpacks:metaitemmods:3>])
    .outputs([<enderio:item_material:54>])
    .duration(2000).EUt(30).buildAndRegister();

recipes.remove(<enderio:block_travel_anchor>);
recipes.addShaped(<enderio:block_travel_anchor>, [
	[<metaitem:plateDarkSteel>,<metaitem:plateVibrantAlloy>,<metaitem:plateDarkSteel>],
	[<metaitem:plateVibrantAlloy>,<enderio:item_material:14>,<metaitem:plateVibrantAlloy>],
	[<metaitem:plateDarkSteel>,<metaitem:plateVibrantAlloy>,<metaitem:plateDarkSteel>]]);
recipes.remove(<enderio:block_tele_pad>);
recipes.addShaped(<enderio:block_tele_pad>, [
	[<appliedenergistics2:quartz_vibrant_glass>,<appliedenergistics2:quartz_vibrant_glass>,<appliedenergistics2:quartz_vibrant_glass>],
	[<metaitem:plateDarkSteel>,<enderio:block_travel_anchor>,<metaitem:plateDarkSteel>],
	[<metaitem:plateDarkSteel>,<enderio:item_basic_capacitor:2>,<metaitem:plateDarkSteel>]]);

recipes.removeByRecipeName("enderio:enhanced_combustion_generator");
recipes.removeByRecipeName("enderio:enhanced_wired_charger");
recipes.removeByRecipeName("enderio:the_enhanced_vat");

//Killer Joe
recipes.remove(<enderio:block_killer_joe>);
recipes.addShaped(<enderio:block_killer_joe>, [
	[<metaitem:plateDarkSteel>,<metaitem:plateDarkSteel>,<metaitem:plateDarkSteel>],
	[<armorplus:infused_lava_sword>, <ore:skullZombieFrankenstein>, <armorplus:infused_lava_sword>	],
	[<ore:gearDraconium>, <enderio:block_tank:1>, <ore:gearDraconium>]]);

recipes.remove(<enderio:block_dark_steel_trapdoor>);
recipes.addShaped(<enderio:block_dark_steel_trapdoor>, [
	[<metaitem:plateDarkSteel>,<metaitem:plateDarkSteel>],
	[<metaitem:plateDarkSteel>,<metaitem:plateDarkSteel>]]);

recipes.remove(<enderio:item_xp_transfer>);
recipes.addShaped(<enderio:item_xp_transfer>, [
	[null,null,<enderio:item_material:15>],
	[null,<metaitem:stickVibrantAlloy>,null],
	[<metaitem:stickVibrantAlloy>,null,null]]);

recipes.remove(<enderio:block_xp_vacuum>);
recipes.addShaped(<enderio:block_xp_vacuum>, [
	[<metaitem:plateDarkSteel>, <metaitem:plateDarkSteel>, <metaitem:plateDarkSteel>],
	[<metaitem:plateDarkSteel>, <enderio:item_xp_transfer>, <metaitem:plateDarkSteel>],
	[<metaitem:plateDarkSteel>, <ore:itemPulsatingCrystal>, <metaitem:plateDarkSteel>]]);


//<thermalexpansion:frame:128>.displayName = "Leadstone Energy Cell Frame";
//<thermalexpansion:cell>.displayName = "Leadstone Energy Cell";
<thermalexpansion:frame:130>.displayName = "Micro Miner Engine Frame";
<thermalexpansion:frame:146>.displayName = "Micro Miner Engine Core";
<thermalexpansion:frame:131>.displayName = "Signalum Micro Miner Engine Frame";
<thermalexpansion:frame:147>.displayName = "Signalum Micro Miner Engine Core";
<thermalexpansion:frame:132>.displayName = "Enderium Micro Miner Engine Frame";
<thermalexpansion:frame:148>.displayName = "Enderium Micro Miner Engine Core";

recipes.addShaped(<thermalexpansion:frame:130>, [
	[<metaitem:plateElectrum>, <metaitem:stickElectrum>, <metaitem:plateElectrum>],
	[<metaitem:stickElectrum>, null, <metaitem:stickElectrum>],
	[<metaitem:plateElectrum>, <metaitem:stickElectrum>, <metaitem:plateElectrum>]]);

recipes.addShaped(<thermalexpansion:frame:131>, [
	[<metaitem:plateSignalum>, <metaitem:stickSignalum>, <metaitem:plateSignalum>],
	[<metaitem:stickSignalum>, null, <metaitem:stickSignalum>],
	[<metaitem:plateSignalum>, <metaitem:stickSignalum>, <metaitem:plateSignalum>]]);

recipes.addShaped(<thermalexpansion:frame:132>, [
	[<metaitem:plateEnderium>, <metaitem:stickEnderium>, <metaitem:plateEnderium>],
	[<metaitem:stickEnderium>, null, <metaitem:stickEnderium>],
	[<metaitem:plateEnderium>, <metaitem:stickEnderium>, <metaitem:plateEnderium>]]);

// redstone cell frame (filled) => "micro miner engine core"
alloy.recipeBuilder()
    .inputs([<thermalexpansion:frame:130>, <minecraft:redstone_block> * 2])
    .outputs([<thermalexpansion:frame:146>])
    .duration(500).EUt(480).buildAndRegister();

// signalum cell frame (filled) => "signalum micro miner engine core"
alloy.recipeBuilder()
    .inputs([<thermalexpansion:frame:131>, <minecraft:redstone_block> * 4])
    .outputs([<thermalexpansion:frame:147>])
    .duration(1000).EUt(2000).buildAndRegister();

// resonant cell frame (filled) => "enderium micro miner engine core"
alloy.recipeBuilder()
    .inputs([<thermalexpansion:frame:132>, <minecraft:redstone_block> * 8])
    .outputs([<thermalexpansion:frame:148>])
    .duration(2000).EUt(8000).buildAndRegister();

// Leadstone Energy Cell Frame
recipes.remove(<thermalexpansion:frame:128>);
recipes.addShaped(<thermalexpansion:frame:128>, [
	[<metaitem:plateLead>, <metaitem:stickLead>, <metaitem:plateLead>],
	[<metaitem:stickLead>, <enderio:block_cap_bank:3>.withTag({"enderio:energy": 0}, false), <metaitem:stickLead>],
	[<metaitem:plateLead>, <metaitem:stickLead>, <metaitem:plateLead>]]);

// Leadstone Energy Cell

// hide the multi-tag one from JEI so it's not confusing
mods.jei.JEI.removeAndHide(<thermalexpansion:cell>.withTag({Recv: 10000, RSControl: 0 as byte, Facing: 3 as byte, Energy: 0, SideCache: [2, 1, 1, 1, 1, 1] as byte[] as byte[], Level: 0 as byte, Send: 10000}));

recipes.remove(<thermalexpansion:cell>);

alloy.recipeBuilder()
    .inputs([<thermalexpansion:frame:128>, <minecraft:redstone_block>])
    .outputs([basiccell])
    .duration(500).EUt(30).buildAndRegister();

// Note: applying kits in-world will also update the Send & Recv tags but that's not really needed for auto-crafting.

// Conversion Kit Ugrades via Crafting Table:

// basic => reinforced
recipes.addShapeless("basic_to_reinforced_energy_cell_conversion",
    reinforcedcell,
    [basiccellIng.marked("cell"),<thermalfoundation:upgrade:33>],
    function(out, ins, cInfo) {
        return ins.cell.updateTag({Level: 2 as byte, Creative: 0 as byte});
    } as IRecipeFunction
);

// basic => signalum
recipes.addShapeless("basic_to_signalum_energy_cell_conversion",
    signalumcell,
    [basiccellIng.marked("cell"),<thermalfoundation:upgrade:34>],
    function(out, ins, cInfo) {
        return ins.cell.updateTag({Level: 3 as byte, Creative: 0 as byte});
    } as IRecipeFunction
);

// basic => resonant
recipes.addShapeless("basic_to_resonant_energy_cell_conversion",
    resonantcell,
    [basiccellIng.marked("cell"),<thermalfoundation:upgrade:35>],
    function(out, ins, cInfo) {
        return ins.cell.updateTag({Level: 4 as byte, Creative: 0 as byte});
    } as IRecipeFunction
);

// NOTE: technically you can use conversion kits on non-basic cell tiers but it's kind of wasteful so I'm not gonna bother adding that

val upgradeTierByOne as IRecipeFunction =
    function(out, ins, cinfo) {
        var level = ins.cell.tag.Level.asByte();
        return ins.cell.updateTag({Level: level+1 as byte, Creative: 0 as byte});
    };

// Upgrade Kit
recipes.addShapeless("basic_to_hardened_energy_cell_upgrade",
    hardenedcell,
    [basiccellIng.marked("cell"), <thermalfoundation:upgrade>],
    upgradeTierByOne
);

recipes.addShapeless("hardened_to_reinforced_energy_cell_upgrade",
    reinforcedcell,
    [hardenedcellIng.marked("cell"), <thermalfoundation:upgrade:1>],
    upgradeTierByOne
);

recipes.addShapeless("reinforced_to_signalum_energy_cell_upgrade",
    signalumcell,
    [reinforcedcellIng.marked("cell"), <thermalfoundation:upgrade:2>],
    upgradeTierByOne
);

recipes.addShapeless("signalum_to_resonant_energy_cell_upgrade",
    resonantcell,
    [signalumcellIng.marked("cell"), <thermalfoundation:upgrade:3>],
    upgradeTierByOne
);

// Register all energy cell tiers in JEI
mods.jei.JEI.addItem(basiccell);
mods.jei.JEI.addItem(hardenedcell);
mods.jei.JEI.addItem(reinforcedcell);
mods.jei.JEI.addItem(signalumcell);
mods.jei.JEI.addItem(resonantcell);

<enderio:block_enchanter>.displayName = "Dark Steel Enchanter";
recipes.remove(<enderio:block_enchanter>);
recipes.addShaped(<enderio:block_enchanter>, [
	[<ore:gemDiamond>, <minecraft:book>, <ore:gemDiamond>],
	[<ore:ingotDarkSteel>, <extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), <ore:ingotDarkSteel>],
	[null, <ore:ingotDarkSteel>, null]]);

recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}));
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), [
	[null, <minecraft:writable_book>, null],
	[<ore:gemDiamond>, <extrautils2:machine>, <ore:gemDiamond>],
	[<metaitem:plateSteel>,<metaitem:plateSteel>,<metaitem:plateSteel>]]);

recipes.remove(<enderio:block_soul_binder>);
mods.extendedcrafting.TableCrafting.addShaped(<enderio:block_soul_binder>, [
	[<enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:7>,  <enderio:item_alloy_ingot:7>,<enderio:item_alloy_ingot:7>],
	[<enderio:item_alloy_ingot:7>, <metaitem:plateTungstenSteel>, <enderio:block_enderman_skull>,<metaitem:plateTungstenSteel>,<enderio:item_alloy_ingot:7>],
	[<enderio:item_alloy_ingot:7>, <minecraft:skull:4>,          <ore:itemSoulMachineChassi>,   <minecraft:skull:2>,         <enderio:item_alloy_ingot:7>],
	[<enderio:item_alloy_ingot:7>, <metaitem:plateTungstenSteel>, <minecraft:skull>,             <metaitem:plateTungstenSteel>,<enderio:item_alloy_ingot:7>],
	[<enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:7>, <enderio:item_alloy_ingot:7>,  <enderio:item_alloy_ingot:7>,<enderio:item_alloy_ingot:7>]]);
