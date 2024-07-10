import com.nomiceu.nomilabs.util.LabsSide
import net.minecraftforge.client.settings.KeyModifier
import org.lwjgl.input.Keyboard

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.KeyBindingHelpers.*

// This File overrides the Default Keybinds for New Players.
// All Keybinds that a new player would probably never need to use should probably be unset here.

// Doesn't matter on Server
// IMPORTANT! This stops the script from crashing on servers!
if (LabsSide.isDedicatedServer()) return

addOverride('keybind.baublesinventory', Keyboard.KEY_NONE)

addOverride('key.advancements', Keyboard.KEY_NONE)

addOverride('key.loadToolbarActivator', Keyboard.KEY_NONE)
addOverride('key.saveToolbarActivator', Keyboard.KEY_NONE)

addOverride('key.craftpresence.config_keycode.name', Keyboard.KEY_NONE)

addOverride('Open Rocket GUI', KeyModifier.CONTROL, Keyboard.KEY_C)

addOverride('key,cofh.multimode', Keyboard.KEY_NONE)

addOverride('key.craftingtweaks.compressAll', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.compressOne', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.compressStack', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.refill_last', Keyboard.KEY_NONE)
addOverride('key.craftingtweaks.refill_last_stack', Keyboard.KEY_NONE)

addOverride('enderio.keybind.inventory', KeyModifier.SHIFT,Keyboard.KEY_C)

addOverride('key.draconicevolution.toolConfig', KeyModifier.SHIFT, Keyboard.KEY_C)

// This one is special: It fixes the bug where pressing T in JEI/AE2 would sometimes force you out of the GUI
addOverride('key.xu2.searchforitems', Keyboard.KEY_NONE)

addOverride('key.ftbutilities.nbt', Keyboard.KEY_NONE)
addOverride('key.ftbutilities.trash', Keyboard.KEY_NONE)

addOverride('key.groovyscript.reload', Keyboard.KEY_NONE)

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
