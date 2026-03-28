// SIDE: CLIENT
// ^, Keyboard Overrides affects Client Only

package post.main.general.misc

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.KeyBindingHelpers.*

import net.minecraftforge.client.settings.KeyModifier
import net.minecraftforge.fml.common.Loader
import org.lwjgl.input.Keyboard

// This File overrides the Default Keybinds for New Players.
// All Keybinds that a new player would probably never need to use should probably be unset here.

addOverride('keybind.baublesinventory', Keyboard.KEY_NONE)

addOverride('key.advancements', Keyboard.KEY_NONE)

addOverride('key.loadToolbarActivator', Keyboard.KEY_NONE)
addOverride('key.saveToolbarActivator', Keyboard.KEY_NONE)

// Some People Remove CraftPresence
if (Loader.isModLoaded('craftpresence'))
    addOverride('key.craftpresence.config_keycode.name', Keyboard.KEY_NONE)

addOverride('key.openRocketUI', KeyModifier.CONTROL, Keyboard.KEY_C)

addOverride('key.craftingtweaks.compressAll', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.compressOne', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.compressStack', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.refill_last', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.refill_last_stack', Keyboard.KEY_NONE)

addOverride('enderio.keybind.inventory', KeyModifier.SHIFT, Keyboard.KEY_C)

addOverride('key.draconicevolution.toolConfig', KeyModifier.SHIFT, Keyboard.KEY_C)

// This one is special: It fixes the bug where pressing T in JEI/AE2 would sometimes force you out of the GUI
// Its also replaced by a different mod, FindMyItemsAndFluids.
addOverride('key.xu2.searchforitems', Keyboard.KEY_NONE)

addOverride('key.ftbutilities.nbt', Keyboard.KEY_NONE)
addOverride('key.ftbutilities.trash', Keyboard.KEY_NONE)

addOverride('key.journeymap.fullscreen_chat_position', Keyboard.KEY_NONE)

addOverride('key.little.config', Keyboard.KEY_L)
addOverride('key.little.config.item', KeyModifier.CONTROL, Keyboard.KEY_L)

addOverride('pi.key.open_pi', KeyModifier.SHIFT, Keyboard.KEY_I)
addOverride('pi.key.et_gui', KeyModifier.SHIFT, Keyboard.KEY_I)

addOverride('simplyjetpacks.keybind.emergencyhover', KeyModifier.SHIFT, Keyboard.KEY_H)
addOverride('simplyjetpacks.keybind.hover', Keyboard.KEY_H)

addOverride('key.trashslot.deleteAll', Keyboard.KEY_NONE)
addOverride('key.trashslot.delete', Keyboard.KEY_NONE)
addOverride('key.trashslot.toggle', Keyboard.KEY_NONE)

addOverride('key.jei.toggleOverlay', Keyboard.KEY_NONE)
