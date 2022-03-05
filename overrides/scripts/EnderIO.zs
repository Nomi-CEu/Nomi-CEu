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
    .inputs([<enderio:block_fused_glass:*>, <minecraft:glowstone>])
    .outputs([<enderio:block_enlightened_fused_glass:0>])
    .duration(160)
    .EUt(16)
    .buildAndRegister();

//Dark Clear Glass
alloy.recipeBuilder()
    .inputs([<enderio:block_fused_glass:*>, <actuallyadditions:item_misc:5>])
    .outputs(<enderio:block_dark_fused_glass>)
    .duration(200).EUt(32).buildAndRegister();

// Enlightened Fused Quartz
alloy.recipeBuilder()
    .inputs([<enderio:block_fused_quartz:*>, <minecraft:glowstone>])
    .outputs([<enderio:block_enlightened_fused_quartz:0>])
    .duration(160)
    .EUt(16)
    .buildAndRegister();

//Dark Fused Quarz
alloy.recipeBuilder()
    .inputs([<actuallyadditions:item_misc:5>, <enderio:block_fused_quartz:*>])
    .outputs([<enderio:block_dark_fused_quartz:0>])
    .duration(200)
    .EUt(32)
    .buildAndRegister();

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
    [<metaitem:ingotSoularium>,<ore:circuitGood> ,<metaitem:ingotSoularium>],
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
