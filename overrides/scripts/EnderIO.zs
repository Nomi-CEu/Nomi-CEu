import mods.jei.JEI.removeAndHide as rh;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

import scripts.common.makeShaped as makeShaped;

/*

  EnderIO Removals

*/

// Construction Alloy Block
rh(<enderio:block_alloy:9>);
recipes.remove(<enderio:block_alloy:9>);

// Construction Alloy Ingot
rh(<enderio:item_alloy_ingot:9>);
recipes.remove(<enderio:item_alloy_ingot:9>);

// Construction Alloy Nugget
rh(<enderio:item_alloy_nugget:9>);
recipes.remove(<enderio:item_alloy_nugget:9>);

rh(<enderio:item_material:46>); // Clippings and Trimmings
rh(<enderio:item_material:47>); // Twigs and Prunings
rh(<enderio:item_material:75>); // Infinity Goop
rh(<enderio:item_material:76>); // Clay-Coated Glowstone
rh(<enderio:item_material:21>); // Flour
//rh(<enderio:item_species_item_filter>); // Species Filter (Forestry)
<ore:dustWheat>.remove(<enderio:item_material:21>); // Flour

rh(<enderio:item_material:67>); // Enhanced Dye Blend
rh(<enderio:item_material:52>); // Soul-Attuned Dye
rh(<enderio:item_material:49>); // Organic Brown Dye
rh(<enderio:item_material:48>); // Organic Green Dye
rh(<enderio:item_material:51>); // Industrial Dye Blend
recipes.remove(<enderio:item_material:67>); // Enhanced Dye Blend
recipes.remove(<enderio:item_material:51>); // Industrial Dye Blend

rh(<enderio:item_material:55>);             // Soulless Chassis
recipes.remove(<enderio:item_material:55>); // Soulless Chassis
rh(<enderio:block_industrial_insulation>);  // Industrial Insulation

rh(<enderio:item_material:69>);             // Simple Chassis Parts
recipes.remove(<enderio:item_material:69>); // Simple Chassis Parts

// Get rid of useless ingots
val uselessIngots = [
    0   // "CrudeSteel"
    , 1 // "CrystallineAlloy"
    , 2 // "MelodicAlloy"
    , 4 // "CrystallinePinkSlime"
    , 6 // "VividAlloy"
] as int[];

val variants = [
    "block_alloy_endergy"
    , "item_alloy_endergy_nugget"
    , "item_alloy_endergy_ingot"
] as string[];

for metadata in uselessIngots {
    for variant in variants {
        var item = itemUtils.getItem("enderio:" + variant, metadata) as IItemStack;
        if (!isNull(item)) {
            recipes.remove(item);
            rh(item);
        }
    }
}

// Grinding Balls
for item in <enderio:item_alloy_ball:*>.items as IItemStack[] {
    rh(item);
    recipes.remove(item);
}

for item in <enderio:item_alloy_endergy_ball:*>.items as IItemStack[] {
    rh(item);
    recipes.remove(item);
}

var teBalls = [<enderio:item_material:57>, <enderio:item_material:58>, <enderio:item_material:59>] as IItemStack[];
for item in teBalls {
    rh(item);
    recipes.remove(item);
}

/*

  EnderIO Additions

*/

// Blank Dark Steel Upgrade
alloy.recipeBuilder()
    .inputs([<metaitem:plateDarkSteel>, <ore:dustPulsating>])
    .outputs([<enderio:item_dark_steel_upgrade>])
    .duration(100)
    .EUt(20)
    .buildAndRegister();

// Glowstone Nano-Particles
macerator.recipeBuilder()
    .inputs([<minecraft:glowstone_dust>])
    .outputs([<enderio:block_holy_fog>])
    .duration(100)
    .EUt(20)
    .buildAndRegister();

/*

  Solar Upgrades (Helmet)

*/

// Simple Solar
recipes.remove(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar"}));
recipes.addShapeless(
    <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar"})
    , [<enderio:item_dark_steel_upgrade>, <solarflux:solar_panel_1>]
);

// Solar
recipes.remove(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar1"}));
recipes.addShapeless(
    <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar1"})
    , [<enderio:item_dark_steel_upgrade>, <solarflux:solar_panel_2>]
);

// Solar II
recipes.remove(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar2"}));
recipes.addShapeless(
    <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar2"})
    , [<enderio:item_dark_steel_upgrade>, <solarflux:solar_panel_3>]
);

// Solar III
recipes.remove(<enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar3"}));
recipes.addShapeless(
    <enderio:item_dark_steel_upgrade:1>.withTag({"enderio:dsu": "enderiomachines:solar3"})
    , [<enderio:item_dark_steel_upgrade>, <solarflux:solar_panel_4>]
);


/*

  Extra Enderio Glasses

*/

// Enlightened Clear Glass
alloy.recipeBuilder()
    .inputs([<ore:fusedGlass>, <minecraft:glowstone>])
    .outputs([<enderio:block_enlightened_fused_glass:0>])
    .duration(160)
    .EUt(16)
    .buildAndRegister();

//Dark Clear Glass
alloy.recipeBuilder()
    .inputs([<ore:fusedGlass>, <actuallyadditions:item_misc:5>])
    .outputs(<enderio:block_dark_fused_glass>)
    .duration(200).EUt(32).buildAndRegister();

// Fused quartz
alloy.recipeBuilder()
    .inputs([<minecraft:quartz> * 3])
    .notConsumable(<metaitem:shape.mold.block>)
    .outputs([<enderio:block_fused_quartz>])
    .duration(80).EUt(16).buildAndRegister();

// Enlightened Fused Quartz
alloy.recipeBuilder()
    .inputs([<ore:fusedQuartz>, <minecraft:glowstone>])
    .outputs([<enderio:block_enlightened_fused_quartz:0>])
    .duration(160)
    .EUt(16)
    .buildAndRegister();

//Dark Fused Quartz
alloy.recipeBuilder()
    .inputs([<ore:fusedQuartz>, <actuallyadditions:item_misc:5>])
    .outputs([<enderio:block_dark_fused_quartz:0>])
    .duration(200)
    .EUt(32)
    .buildAndRegister();

/* More Ender IO Alloy Recipes */

// Dark steel rod + grains of infinity => infinity rod
alloy.recipeBuilder()
    .inputs([<metaitem:stickDarkSteel>,<enderio:item_material:20>])
    .outputs([<enderio:item_material:71>])
    .duration(200).EUt(30).buildAndRegister();

// End steel + grains => stellar
alloy.recipeBuilder()
    .inputs([<ore:ingotEndSteel>,<enderio:item_material:20> * 8])
    .outputs([<enderio:item_alloy_endergy_ingot:3>])
    .duration(200).EUt(2000).buildAndRegister();

// Simple machine chassis + grains => industrial machine chassis
alloy.recipeBuilder()
    .inputs([<enderio:item_material>,<enderio:item_material:20> * 2])
    .outputs([<enderio:item_material:1>])
    .duration(200).EUt(30).buildAndRegister();

// End steel plate + industrial machine chassis => end steel chassis
alloy.recipeBuilder()
    .inputs([<enderio:item_material:1>,<metaitem:plateEndSteel> * 8])
    .outputs([<enderio:item_material:66>])
    .duration(800).EUt(30).buildAndRegister();

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

//Capacitors
recipes.remove(<enderio:item_basic_capacitor>);
recipes.addShaped(<enderio:item_basic_capacitor>, [
    [null, <ore:nuggetElectricalSteel>,null],
    [<ore:nuggetElectricalSteel>, <metaitem:circuit.vacuum_tube>, <ore:nuggetElectricalSteel>],
    [<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);
recipes.addShaped(<enderio:item_basic_capacitor> * 3, [
    [null, <ore:nuggetElectricalSteel>,null],
    [<ore:nuggetElectricalSteel>, <metaitem:component.smd.capacitor>, <ore:nuggetElectricalSteel>],
    [<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);
recipes.addShaped(<enderio:item_basic_capacitor> * 2, [
    [null, <ore:nuggetElectricalSteel>,null],
    [<ore:nuggetElectricalSteel>, <metaitem:component.capacitor>, <ore:nuggetElectricalSteel>],
    [<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);
recipes.addShaped(<enderio:item_basic_capacitor> * 12, [
    [null, <ore:nuggetElectricalSteel>,null],
    [<ore:nuggetElectricalSteel>, <metaitem:component.advanced_smd.capacitor>, <ore:nuggetElectricalSteel>],
    [<ore:wireGtSingleTin>,null,<ore:wireGtSingleTin>]]);

recipes.addShaped(compressedoctadiccap, [
	[<enderio:item_basic_capacitor:2>,<enderio:item_basic_capacitor:2>,<enderio:item_basic_capacitor:2>],
	[<enderio:item_basic_capacitor:2>,<enderio:item_basic_capacitor:2>,<enderio:item_basic_capacitor:2>],
	[<enderio:item_basic_capacitor:2>,<enderio:item_basic_capacitor:2>,<enderio:item_basic_capacitor:2>]]);

recipes.addShaped(doublecompressedoctadiccap, [
	[compressedoctadiccap,compressedoctadiccap,compressedoctadiccap],
	[compressedoctadiccap,compressedoctadiccap,compressedoctadiccap],
	[compressedoctadiccap,compressedoctadiccap,compressedoctadiccap]]);

//Replace old compressed capacitors with functional ones
recipes.addShapeless(compressedoctadiccap, [<contenttweaker:compressedoctadiccapacitor>]);
recipes.addShapeless(doublecompressedoctadiccap, [<contenttweaker:doublecompressedoctadiccapacitor>]);

//An attempt to do the same in JEI
mods.jei.JEI.addItem(compressedoctadiccap);
mods.jei.JEI.addItem(doublecompressedoctadiccap);
<contenttweaker:compressedoctadiccapacitor>.addTooltip(format.white("Put the item into a crafting window if it has no lore"));
<contenttweaker:doublecompressedoctadiccapacitor>.addTooltip(format.white("Put the item into a crafting window if it has no lore"));

// Crafter
recipes.remove(<enderio:block_crafter>);
recipes.addShaped(<enderio:block_crafter>, [
    [<extrautils2:ingredients>,<avaritia:compressed_crafting_table>,<extrautils2:ingredients>],
    [<ore:gearIronInfinity>, <ore:itemMachineChassi>, <ore:gearIronInfinity>],
    [<enderio:item_item_conduit>,<enderio:item_item_conduit>,<enderio:item_item_conduit>]]);

// Buffer
recipes.remove(<enderio:block_buffer:1>);
recipes.addShaped(<enderio:block_buffer:1>,  [
    [<metaitem:plateIron>, <metaitem:plateRedAlloy>, <metaitem:plateIron>],
    [<metaitem:plateRedAlloy>, <ore:blockRedstone>, <metaitem:plateRedAlloy>],
    [<metaitem:plateIron>, <metaitem:plateRedAlloy>, <metaitem:plateIron>]]);

//Zombie Generator
recipes.remove(<enderio:block_zombie_generator>);
recipes.addShaped(<enderio:block_zombie_generator>, [
    [<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>,<metaitem:plateElectricalSteel>],
    [<appliedenergistics2:quartz_vibrant_glass>,<enderio:item_material:41>,<appliedenergistics2:quartz_vibrant_glass>],
    [<metaitem:gearPulsatingIron>,<metaitem:plateElectricalSteel>,<metaitem:gearPulsatingIron>]]);

recipes.remove(<enderio:block_franken_zombie_generator>);
recipes.addShaped(<enderio:block_franken_zombie_generator>, [
    [<ore:plateSoularium>, <ore:plateSoularium>, <ore:plateSoularium>],
    [<ore:skullZombieFrankenstein>, <enderio:block_zombie_generator>, <ore:skullZombieFrankenstein>],
    [<metaitem:gearElectricalSteel>, <ore:plateSoularium>, <metaitem:gearElectricalSteel>]]);

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

//Wired Charger
recipes.remove(<enderio:block_wired_charger>);
recipes.addShaped(<enderio:block_wired_charger> , [
    [<metaitem:plateDarkSteel>, <appliedenergistics2:charger>, <metaitem:plateDarkSteel>],
    [<enderio:item_power_conduit>, <enderio:item_material:1>, <enderio:item_power_conduit>],
    [<metaitem:plateElectricalSteel>,<enderio:item_power_conduit>,<metaitem:plateElectricalSteel>]]);

//Coordinate Selector
recipes.remove(<enderio:item_coord_selector>);
recipes.addShaped(<enderio:item_coord_selector> , [
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

<enderio:block_enchanter>.displayName = "Dark Steel Enchanter";
recipes.remove(<enderio:block_enchanter>);
recipes.addShaped(<enderio:block_enchanter>, [
    [<ore:gemDiamond>, <minecraft:book>, <ore:gemDiamond>],
    [<ore:ingotDarkSteel>, <extrautils2:machine>.withTag({Type: "extrautils2:enchanter"}), <ore:ingotDarkSteel>],
    [null, <ore:ingotDarkSteel>, null]]);

    
recipes.remove(<enderio:block_soul_binder>);
mods.extendedcrafting.TableCrafting.addShaped(<enderio:block_soul_binder>, [
    [<ore:plateSoularium>, <ore:plateSoularium>, <ore:plateSoularium>,  <ore:plateSoularium>,<ore:plateSoularium>],
    [<ore:plateSoularium>, <metaitem:plateTungstenSteel>, <enderio:block_enderman_skull>,<metaitem:plateTungstenSteel>,<ore:plateSoularium>],
    [<ore:plateSoularium>, <minecraft:skull:4>,          <ore:itemSoulMachineChassi>,   <minecraft:skull:2>,         <ore:plateSoularium>],
    [<ore:plateSoularium>, <metaitem:plateTungstenSteel>, <minecraft:skull>,             <metaitem:plateTungstenSteel>,<ore:plateSoularium>],
    [<ore:plateSoularium>, <ore:plateSoularium>, <ore:plateSoularium>,  <ore:plateSoularium>,<ore:plateSoularium>]]);

// Pulsating crystal
autoclave.recipeBuilder()
    .inputs([<minecraft:diamond>])
    .fluidInputs([<liquid:pulsating_iron> * 144])
    .outputs([<enderio:item_material:14>])
    .duration(100).EUt(30).buildAndRegister();

// Vibrant crystal
autoclave.recipeBuilder()
    .inputs([<minecraft:emerald>]).fluidInputs([<liquid:vibrant_alloy> * 144])
    .outputs([<enderio:item_material:15>])
    .duration(200).EUt(30).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<metaitem:gearIron>,<enderio:item_material:20> * 2])
    .outputs([<enderio:item_material:11>])
    .duration(100).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:11>,<ore:ingotDarkSteel> * 4])
    .outputs([<enderio:item_material:73>])
    .duration(150).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:11>,<ore:ingotEnergeticAlloy> * 4])
    .outputs([<enderio:item_material:12>])
    .duration(150).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:12>,<ore:ingotVibrantAlloy> * 4])
    .outputs([<enderio:item_material:13>])
    .duration(200).EUt(16).buildAndRegister();

alloy.recipeBuilder()
    .inputs([<enderio:item_material:1>,<ore:dustSoularium> * 8])
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
    [<armorplus:infused_lava_sword>, <ore:skullZombieFrankenstein>, <armorplus:infused_lava_sword>  ],
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


// Slice'n'Splice
recipes.remove(<enderio:block_slice_and_splice>);
recipes.addShaped(<enderio:block_slice_and_splice>, [
    [<metaitem:plateTungstenSteel>, <ore:itemSkull>, <metaitem:plateTungstenSteel>],
    [<metaitem:plateTungstenSteel>, <ore:itemSoulMachineChassi>, <metaitem:plateTungstenSteel>],
    [<ore:gearEnergized>, <enderio:block_dark_iron_bars>, <ore:gearEnergized>]]);


/*

  Extra Slice'n'Splice Recipes

*/

var bonus = 1 as int;
var cost  = 20000 as int;
var capacitors as IItemStack[] = [
    <enderio:item_basic_capacitor:1>,
    <enderio:item_basic_capacitor:2>
];

var wafers as IItemStack[] = [
    <metaitem:wafer.glowstone>,
    <metaitem:wafer.naquadah>
];

for i, wafer in wafers {
    bonus = bonus * 2;
    cost  = cost  * 2;

    // EnderIO Light
    makeShaped("enderio_light_" + bonus, <enderio:block_electric_light> * bonus, [
        "GGG",
        "WDW",
        "WCW"
    ], {
        W: wafer,
        D: <ore:dustGlowstone>,
        G: <ore:fusedQuartz>,
        C: capacitors[i]
    });
}

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

//Alloy Smelter recipe for Organic Black Dye
alloy.recipeBuilder()
    .inputs(<minecraft:slime_ball>,<metaitem:dustCarbon>)
    .outputs(<enderio:item_material:50>)
    .duration(100)
    .EUt(16)
    .buildAndRegister();

// Z-Logic Controller (Cheap)
recipes.addShaped(<enderio:item_material:41>, [
    [<metaitem:ingotSoularium>,<minecraft:skull:2> ,<metaitem:ingotSoularium>],
    [<metaitem:ingotSoularium>,<ore:circuitMv> ,<metaitem:ingotSoularium>],
    [<metaitem:wafer.silicon>, <metaitem:blockRedAlloy>,<metaitem:wafer.silicon>]
]);

// Soul Vials

recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:zombie"}), [
	[null,<minecraft:skull:2>,null],
	[<minecraft:skull:2>,<enderio:item_soul_vial>,<minecraft:skull:2>],
	[null,<minecraft:skull:2>,null]]);

recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:ghast"}), [
	[null,<minecraft:ghast_tear>,null],
	[<minecraft:ghast_tear>,<enderio:item_soul_vial>,<minecraft:ghast_tear>],
	[null,<minecraft:ghast_tear>,null]]);
	
recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:villager"}), [
	[null,<minecraft:emerald>,null],
	[<minecraft:emerald>,<enderio:item_soul_vial>,<minecraft:emerald>],
	[null,<minecraft:emerald>,null]]);

recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:enderman"}), [
	[null,<enderio:block_enderman_skull>,null],
	[<enderio:block_enderman_skull>,<enderio:item_soul_vial>,<enderio:block_enderman_skull>],
	[null,<enderio:block_enderman_skull>,null]]);
	
recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:shulker"}), [
	[null,<minecraft:shulker_shell>,null],
	[<minecraft:shulker_shell>,<enderio:item_soul_vial>,<minecraft:shulker_shell>],
	[null,<minecraft:shulker_shell>,null]]);

recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:witch"}), [
	[<minecraft:glowstone_dust>,<minecraft:redstone>,<minecraft:glowstone_dust>],
	[<minecraft:redstone>,<enderio:item_soul_vial>,<minecraft:redstone>],
	[<minecraft:glowstone_dust>,<minecraft:redstone>,<minecraft:glowstone_dust>]]);

recipes.addShaped(<enderio:item_soul_vial:1>.withTag({entityId: "minecraft:bat"}), [
	[null,<actuallyadditions:item_misc:15>,null],
	[<actuallyadditions:item_misc:15>,<enderio:item_soul_vial>,<actuallyadditions:item_misc:15>],
	[null,<actuallyadditions:item_misc:15>,null]]);
	
recipes.addShaped(<actuallyadditions:item_misc:15>, [
	[null,null,null],
	[<minecraft:leather>,<minecraft:leather>,<minecraft:leather>],
	[<minecraft:leather>,<minecraft:leather>,<minecraft:leather>]]);
	


recipes.addShapeless(<enderio:block_cap_bank:1>, [<enderio:block_cap_bank:1>]);
recipes.addShapeless(<enderio:block_cap_bank:2>, [<enderio:block_cap_bank:2>]);
recipes.addShapeless(<enderio:block_cap_bank:3>, [<enderio:block_cap_bank:3>]);
