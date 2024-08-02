import com.nomiceu.nomilabs.fluid.registry.LabsFluids
import gregtech.api.fluids.FluidState
import gregtech.api.util.FluidTooltipUtil
import mezz.jei.api.ingredients.VanillaTypes
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.Fluid
import net.minecraftforge.fluids.FluidStack
import net.minecraftforge.fluids.FluidUtil

/*
 * This File fixes Fluids being Items in JEI, as well as adding GT Tooltips to all Fluids.
 *
 * GT Tooltips are important as GT Pipe Temperature Constraints (Cryogenic, Max Temp, etc.), still apply to non-GT Fluids.
 *
 * Redstone (aka Destabilized Redstone) and Glowstone (aka Energized Glowstone) do not need tooltips added, as they have
 * the same name as a GT material.
 */

/* Thermal Foundation */

// Removals
hideFluidItemBucket(item('thermalfoundation:fluid_crude_oil'), fluid('crude_oil'))
hideFluidBucket(fluid('refined_oil'))
hideFluidBucket(fluid('coal'))
hideFluidBucket(fluid('refined_fuel'))
hideFluidBucket(fluid('sap'))
hideFluidBucket(fluid('syrup'))
hideFluidBucket(fluid('resin'))
hideFluidBucket(fluid('tree_oil'))
hideFluidBucket(fluid('biocrude'))
hideFluidBucket(fluid('refined_biofuel'))
hideFluidBucket(fluid('mushroom_stew'))
hideFluidBucket(fluid('experience'))
hideFluidBucket(fluid('potion'))
hideFluidBucket(fluid('potion_splash'))
hideFluidBucket(fluid('potion_lingering'))

// Fixes (Without Tooltip)
fixItemFluid(item('thermalfoundation:fluid_redstone'), fluid('redstone'))
fixItemFluid(item('thermalfoundation:fluid_glowstone'), fluid('glowstone'))

// Fixes (With Tooltip)
fixItemFluidTooltip(item('thermalfoundation:fluid_ender'), fluid('ender'))
fixItemFluidTooltip(item('thermalfoundation:fluid_pyrotheum'), fluid('pyrotheum'))
fixItemFluidTooltip(item('thermalfoundation:fluid_cryotheum'), fluid('cryotheum'))
fixItemFluidTooltip(item('thermalfoundation:fluid_aerotheum'), fluid('aerotheum'), FluidState.GAS)
fixItemFluidTooltip(item('thermalfoundation:fluid_petrotheum'), fluid('petrotheum'))
fixItemFluidTooltip(item('thermalfoundation:fluid_mana'), fluid('mana'))

/* Nomi Labs */

// Tooltip Additions
for (Fluid labsFluid : LabsFluids.BLOCKS.keySet()) {
	addFluidTooltip(new FluidStack(labsFluid, 1))
}

/* Advanced Rocketry */

// Removals
// Interestingly, there is no bucket form of Advanced Rocketry Fluids.
mods.jei.ingredient.hide(VanillaTypes.FLUID, fluid('rocketfuel'))
mods.jei.ingredient.hide(VanillaTypes.FLUID, fluid('enrichedlava'))

/* Ender IO */

// Tooltip Additions
addFluidTooltip(fluid('nutrient_distillation'))
addFluidTooltip(fluid('ender_distillation'))
addFluidTooltip(fluid('vapor_of_levity'), FluidState.GAS)
addFluidTooltip(fluid('hootch'))
addFluidTooltip(fluid('fire_water'))
addFluidTooltip(fluid('xpjuice'))
addFluidTooltip(fluid('liquid_sunshine'))
addFluidTooltip(fluid('cloud_seed'))
addFluidTooltip(fluid('cloud_seed_concentrated'))

/* Actually Additions */

// Fixes (With Tooltip)
fixItemFluidTooltip(item('actuallyadditions:block_canola_oil'), fluid('canolaoil'))
fixItemFluidTooltip(item('actuallyadditions:block_refined_canola_oil'), fluid('refinedcanolaoil'))
fixItemFluidTooltip(item('actuallyadditions:block_crystal_oil'), fluid('crystaloil'))
fixItemFluidTooltip(item('actuallyadditions:block_empowered_oil'), fluid('empoweredoil'))

/* NuclearCraft */

// Fixes (With Tooltip)
fixItemFluidTooltip(item('nuclearcraft:fluid_chocolate_liquor'), fluid('chocolate_liquor'))
fixItemFluidTooltip(item('nuclearcraft:fluid_cocoa_butter'), fluid('cocoa_butter'))
fixItemFluidTooltip(item('nuclearcraft:fluid_unsweetened_chocolate'), fluid('unsweetened_chocolate'))
fixItemFluidTooltip(item('nuclearcraft:fluid_dark_chocolate'), fluid('dark_chocolate'))
fixItemFluidTooltip(item('nuclearcraft:fluid_milk_chocolate'), fluid('milk_chocolate'))
fixItemFluidTooltip(item('nuclearcraft:fluid_sugar'), fluid('sugar'))
fixItemFluidTooltip(item('nuclearcraft:fluid_gelatin'), fluid('gelatin'))
fixItemFluidTooltip(item('nuclearcraft:fluid_hydrated_gelatin'), fluid('hydrated_gelatin'))
fixItemFluidTooltip(item('nuclearcraft:fluid_marshmallow'), fluid('marshmallow'))

// Tooltip Additions
addFluidTooltip(fluid('quartz'))
addFluidTooltip(fluid('lapis'))
addFluidTooltip(fluid('diamond'))
addFluidTooltip(fluid('emerald'))

/* Util Functions */

/**
 * Replaces 'Item Fluids', or fluids that are actually items in JEI, with actual fluid stacks.
 */
static void fixItemFluid(ItemStack itemForm, FluidStack fluidForm) {
	mods.jei.ingredient.hide(itemForm)
	mods.jei.ingredient.add(VanillaTypes.FLUID, fluidForm * 1000)
}

/**
 * Adds GT Tooltips to a fluid. Once added, cannot be removed via reloading.
 * (To be replaced by a Labs one in a future version of Labs)
 */
static void addFluidTooltip(FluidStack fluidForm, FluidState type = FluidState.LIQUID) {
	var existing = FluidTooltipUtil.getFluidTooltip(fluidForm.fluid)

	// Only Register if Not Already Registered (aka previous runs of this script)
	// However, this is not reloadable. To be fixed in a future version of Labs.
	if (existing != null && existing.isEmpty())
		FluidTooltipUtil.registerTooltip(fluidForm.fluid, FluidTooltipUtil.createFluidTooltip(null, fluidForm.fluid, type))
}

/**
 * Does both of the above two util functions.
 */
static void fixItemFluidTooltip(ItemStack itemForm, FluidStack fluidForm, FluidState type = FluidState.LIQUID) {
	fixItemFluid(itemForm, fluidForm)
	addFluidTooltip(fluidForm, type)
}

/**
 * Hides the Item Form and Bucket of a Fluid in JEI.
 */
static void hideFluidItemBucket(ItemStack itemForm, FluidStack fluidForm) {
	mods.jei.ingredient.hide(itemForm)
	mods.jei.ingredient.hide(FluidUtil.getFilledBucket(fluidForm * 1000))
}

/**
 * Hides the Fluid Form and Bucket of a Fluid in JEI.
 */
static void hideFluidBucket(FluidStack fluidForm) {
	mods.jei.ingredient.hide(VanillaTypes.FLUID, fluidForm)
	mods.jei.ingredient.hide(FluidUtil.getFilledBucket(fluidForm * 1000))
}
