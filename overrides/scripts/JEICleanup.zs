#priority -9998

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.mods.IMod;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;


/* Hide all of AE2's facades (can still be crafted, just hiding from JEI) */
val ae2 as IMod = loadedMods["appliedenergistics2"];
if(!isNull(ae2)) {
    val ae2Items as IItemStack[] = ae2.items;

    for item in ae2Items {
        if(item.displayName has "Cable Facade") {
            if(item.displayName has "Block of Neutronium") {
                item.addTooltip(format.darkAqua("Facades can be crafted from most blocks, but are hidden from JEI to reduce clutter"));
            }
            else {
               mods.jei.JEI.hide(item); 
            }
        }
    }
}

//Adding a tooltop to the GTCEu facade
<gregtech:meta_item_1:330>.withTag({Facade: {id: "minecraft:stone", Count: 1 as byte, Damage: 0 as short}}).addTooltip(format.darkAqua("GTCEu Cable facades can be made from most non-tile-entites, and craft into different amounts based on the metal used."));


