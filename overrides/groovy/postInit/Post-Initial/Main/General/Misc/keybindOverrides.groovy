import com.nomiceu.nomilabs.util.LabsSide
import net.minecraftforge.client.settings.KeyModifier
import org.lwjgl.input.Keyboard

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.KeyBindingHelpers.*

// This File overrides the Default Keybinds for New Players.
// All Keybinds that a new player would probably never need to use should probably be unset here.

// Doesn't matter on Server
// IMPORTANT! This stops the script from crashing on servers!
if (LabsSide.isDedicatedServer()) return

addOverride('key.advancements', Keyboard.KEY_NONE)

addOverride('key.loadToolbarActivator', Keyboard.KEY_NONE)
addOverride('key.saveToolbarActivator', Keyboard.KEY_NONE)

addOverride('key.craftpresence.config_keycode.name', Keyboard.KEY_NONE)

addOverride('Open Rocket GUI', KeyModifier.CONTROL, Keyboard.KEY_C)

addOverride('enderio.keybind.inventory', Keyboard.KEY_C)

addOverride('key.draconicevolution.toolConfig', KeyModifier.SHIFT, Keyboard.KEY_C)

// This one is special: It fixes the bug where pressing T in JEI/AE2 would sometimes force you out of the GUI
addOverride('key.xu2.searchforitems', Keyboard.KEY_NONE)

addOverride('key.groovyscript.reload', Keyboard.KEY_NONE)

addOverride('key.journeymap.fullscreen_chat_position', Keyboard.KEY_NONE)

addOverride('pi.key.open_pi', KeyModifier.SHIFT, Keyboard.KEY_I)
addOverride('pi.key.et_gui', KeyModifier.SHIFT, Keyboard.KEY_I)

addOverride('simplyjetpacks.keybind.emergencyhover', KeyModifier.SHIFT, Keyboard.KEY_H)
addOverride('simplyjetpacks.keybind.hover', Keyboard.KEY_H)

addOverride('key.trashslot.deleteAll', Keyboard.KEY_NONE)
addOverride('key.trashslot.delete', Keyboard.KEY_NONE)
addOverride('key.trashslot.toggle', Keyboard.KEY_NONE)
