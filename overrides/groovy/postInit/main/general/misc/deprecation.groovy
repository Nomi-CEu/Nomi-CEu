package postInit.main.general.misc

import com.nomiceu.nomilabs.gregtech.material.registry.LabsMaterials
import com.nomiceu.nomilabs.groovy.ChangeRecipeBuilder
import gregtech.api.recipes.RecipeBuilder
import gregtech.api.recipes.category.RecipeCategories
import gregtech.api.recipes.ingredients.GTRecipeOreInput
import gregtech.api.unification.OreDictUnifier
import net.minecraft.item.ItemStack
import net.minecraftforge.fluids.FluidStack

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TooltipHelpers.addTooltip
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.TranslationHelpers.translatable
import static com.nomiceu.nomilabs.groovy.GroovyHelpers.MaterialHelpers.forMaterial
import static gregtech.api.recipes.RecipeMaps.*

var deprecated = translatable('nomiceu.tooltip.mixed.deprecated')
var deprecation = translatable('nomiceu.tooltip.mixed.deprecation')

var deprecate = { ItemStack stack ->
	mods.jei.ingredient.removeAndHide(stack)
	addTooltip(stack, deprecated)
}

var conversion = { ItemStack old, ItemStack curr ->
	crafting.shapelessBuilder()
		.output(curr)
		.input(old)
		.setOutputTooltip(deprecation)
		.register()
}

// Deprecate Old Wireless Crafting Terminal and Upgrades
mods.jei.ingredient.removeAndHide(item('wct:magnet_card'))
conversion(item('wct:magnet_card'), item('appliedenergistics2:material', 60))

mods.jei.ingredient.removeAndHide(item('ae2wtlib:infinity_booster_card'))
conversion(item('ae2wtlib:infinity_booster_card'), item('appliedenergistics2:material', 59))

mods.jei.ingredient.removeAndHide(item('wct:wct'))
conversion(item('wct:wct'), item('appliedenergistics2:material', 58))

// Old Wireless Terminal Tooltips
for (var stack : [item('ae2wtlib:infinity_booster_card'), item('wct:wct'), item('wct:magnet_card')]) {
	addTooltip(stack, [
		translatable('nomiceu.tooltip.ae2.crafting_terminal_removal.1'),
		translatable('nomiceu.tooltip.ae2.crafting_terminal_removal.2'),
		translatable('nomiceu.tooltip.ae2.crafting_terminal_removal.3'),
	])
}

// Hide Creative Wireless Terminal
mods.jei.ingredient.hide(item('wct:wct_creative'))

// Deprecate Extended Crafting's Handheld Crafting Table
deprecate(item('extendedcrafting:handheld_table'))
conversion(item('extendedcrafting:handheld_table'), item('actuallyadditions:item_crafter_on_a_stick'))

// Conversion from Thermal Saltpeter and Obsidian to GT Versions
// Removal is still handled by OreDict.zs for now, but we can move it over later
addTooltip(item('thermalfoundation:material', 770), deprecated)
conversion(item('thermalfoundation:material', 770), metaitem('dustObsidian'))

addTooltip(item('thermalfoundation:material', 772), deprecated)
conversion(item('thermalfoundation:material', 772), metaitem('dustSaltpeter'))

// Conversion from Draconic Evolution's Draconium Dust, Block of Draconium and Block of Awakened Draconium
// Removal is still handled by OreDict.zs for now, but we can move it over later
addTooltip(item('draconicevolution:draconium_dust'), deprecated)
conversion(item('draconicevolution:draconium_dust'), metaitem('nomilabs:dustDraconium'))

addTooltip(item('draconicevolution:draconium_block'), deprecated)
conversion(item('draconicevolution:draconium_block'), metaitem('nomilabs:blockDraconium'))

addTooltip(item('draconicevolution:draconic_block'), deprecated)
conversion(item('draconicevolution:draconic_block'), metaitem('nomilabs:blockAwakenedDraconium'))

// Deprecate GT Mithril and GT Infinity
for (var mat : [LabsMaterials.Mithril, LabsMaterials.Infinity]) {
	forMaterial(mat, { ItemStack stack -> deprecate(stack)},
		{ FluidStack fluid ->
			mods.jei.ingredient.removeAndHide(fluid)
		}, false)
}

// Mana Infused Conversion Recipes
conversion(metaitem('nomilabs:ingotMithril'), item('thermalfoundation:material', 136))
conversion(metaitem('nomilabs:plateMithril'), item('thermalfoundation:material', 72))

// Infinity Conversion Recipes
conversion(metaitem('nomilabs:ingotInfinity'), item('avaritia:resource', 6))
conversion(metaitem('nomilabs:plateInfinity'), item('moreplates:infinity_plate'))

/* Replace Infinity GT Machine Recipes */

// Remove Ingot -> Nugget Recipe
mods.gregtech.alloy_smelter.removeByOutput([metaitem('nomilabs:nuggetInfinity')], null)

// Recipes for Ingot
furnace.removeByOutput(metaitem('nomilabs:ingotInfinity'))
furnace.add(metaitem('nomilabs:dustInfinity'), item('avaritia:resource', 6))

// Arc Furnace: special, we set category, and fix block & plate inputs
mods.gregtech.arc_furnace.changeByOutput([metaitem('nomilabs:ingotInfinity')], null)
	.forEach { ChangeRecipeBuilder builder ->
		builder.builder { RecipeBuilder recipe ->
			recipe.category(RecipeCategories.ARC_FURNACE_RECYCLING)
		}.changeEachInput{
			return new GTRecipeOreInput(OreDictUnifier.getOreDictionaryNames(it.inputStacks[0]).first())
		}.changeEachOutput { item('avaritia:resource', 6) * it.count }
		.replaceAndRegister()
	}

for (var map : [COMPRESSOR_RECIPES, ALLOY_SMELTER_RECIPES]) {
	map.getVirtualized().changeByOutput([metaitem('nomilabs:ingotInfinity')], null)
		.forEach { ChangeRecipeBuilder builder ->
			builder.changeEachOutput { item('avaritia:resource', 6) * it.count }
			.replaceAndRegister()
		}
}

// Recipes for Block
for (var map : [COMPRESSOR_RECIPES, ALLOY_SMELTER_RECIPES, EXTRUDER_RECIPES]) {
	map.getVirtualized().changeByOutput([metaitem('nomilabs:blockInfinity')], null)
		.forEach { ChangeRecipeBuilder builder ->
			builder.changeEachOutput { item('avaritia:block_resource', 1) * it.count }
				.replaceAndRegister()
		}
}

// Recipes for Plate
for (var map : [FORGE_HAMMER_RECIPES, CUTTER_RECIPES, EXTRUDER_RECIPES, BENDER_RECIPES]) {
	map.getVirtualized().changeByOutput([metaitem('nomilabs:plateInfinity')], null)
		.forEach { ChangeRecipeBuilder builder ->
			builder.changeEachOutput { item('moreplates:infinity_plate') * it.count }
				.replaceAndRegister()
		}
}
