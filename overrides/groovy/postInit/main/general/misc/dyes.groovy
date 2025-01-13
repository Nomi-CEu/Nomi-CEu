package postInit.main.general.misc

import com.cleanroommc.groovyscript.helper.ingredient.OreDictIngredient
import com.nomiceu.nomilabs.groovy.ShapedConversionRecipe
import net.minecraft.item.EnumDyeColor
import net.minecraft.item.ItemStack

// Backport MC 1.14 Dye Mechanics
ore('dyeBlack').remove(item('minecraft:dye', 0))
ore('dye').remove(item('minecraft:dye', 0))
addShapedConversionRecipe(metaitem('dye.black'), item('minecraft:dye', 0))

ore('dyeBrown').remove(item('minecraft:dye', 3))
ore('dye').remove(item('minecraft:dye', 3))
addShapedConversionRecipe(metaitem('dye.brown'), item('minecraft:dye', 3))
ore('dyeBrown').remove(item('nuclearcraft:cocoa_solids'))
addShapedConversionRecipe(metaitem('dye.brown'), item('nuclearcraft:cocoa_solids'))
// NC cocoa solids and vanilla cocoa stop being a dye when turned into GT cocoa dust
addShapedConversionRecipe(metaitem('dye.brown'), metaitem('dustCocoa'))
ore('dyeBrown').remove(metaitem('dustMetalMixture'))
addShapedConversionRecipe(metaitem('dye.brown'), metaitem('dustMetalMixture'))

ore('dyeBlue').remove(item('minecraft:dye', 4))
ore('dye').remove(item('minecraft:dye', 4))
addShapedConversionRecipe(metaitem('dye.blue'), item('minecraft:dye', 4))
ore('dyeBlue').remove(metaitem('gemLazurite'))
addShapedConversionRecipe(metaitem('dye.blue'), metaitem('gemLazurite'))
ore('dyeBlue').remove(metaitem('gemSodalite'))
addShapedConversionRecipe(metaitem('dye.blue'), metaitem('gemSodalite'))
ore('dyeBlue').remove(metaitem('dustLapis'))
addShapedConversionRecipe(metaitem('dye.blue'), metaitem('dustLapis'))
ore('dyeBlue').remove(metaitem('dustLazurite'))
addShapedConversionRecipe(metaitem('dye.blue'), metaitem('dustLazurite'))
ore('dyeBlue').remove(metaitem('dustSodalite'))
addShapedConversionRecipe(metaitem('dye.blue'), metaitem('dustSodalite'))

ore('dyeMagenta').remove(item('extrautils2:ingredients', 3))
addShapedConversionRecipe(metaitem('dye.magenta'), item('extrautils2:ingredients', 3))

ore('dyeWhite').remove(item('minecraft:dye', 15))
ore('dye').remove(item('minecraft:dye', 15))
addShapedConversionRecipe(metaitem('dye.white'), item('minecraft:dye', 15))

def dyeHelperMap = [:]
for (def color : EnumDyeColor.values()) {
	dyeHelperMap.put(color.getName(), ore('dye' + color.getName().capitalize()))
}

// Fix Elevator Redyeing
for (def entry in dyeHelperMap.entrySet()) {
	crafting.remove('elevatorid:redye_' + entry.key)
	crafting.addShapeless(item('elevatorid:elevator_' + entry.key), [ore('blockElevator'), entry.value])
}

// Fix Slime Block Redyeing
for (def color : EnumDyeColor.values()) {
	def name = color.getName()
	def meta = color.getMetadata()
	def oreIng = dyeHelperMap.get(name)
	crafting.remove('darkutils:dyed_slime_block_' + name)
	crafting.shapedBuilder()
		.output(item('darkutils:slime_dyed', meta) * 8)
		.matrix('SSS',
			'SDS',
			'SSS')
		.key('S', ore('blockSlime'))
		.key('D', oreIng)
		.register()
}

// Fix Satchel Redeying
addOreDictToOreDict(ore('dye'), dyeHelperMap.values())

static void addOreDictToOreDict(OreDictIngredient addTo, Collection<OreDictIngredient> from) {
	for (def ing in from) {
		for (def stack in ing) {
			addTo.add(stack)
		}
	}
}

static void addShapedConversionRecipe(ItemStack outputStack, ItemStack inputStack) {
	crafting.shapedBuilder()
		.output(outputStack)
		.matrix([[inputStack]])
		.recipeClassFunction((output, width, height, ingredients) -> new ShapedConversionRecipe(output, ingredients, width, height))
		.register()
}
