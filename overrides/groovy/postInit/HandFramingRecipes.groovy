import net.minecraft.nbt.NBTTagCompound

crafting.addShapeless("contenttweaker:hft_sticks", item('contenttweaker:hand_framing_tool').withNbt([sticks: 100]), [item('contenttweaker:hand_framing_tool'), item('minecraft:stick')])

NBTTagCompound tagCompound = new NBTTagCompound()

tagCompound.setInteger("sticks", 100)

tagCompound.setTag("MatS", item('minecraft:wool', 7).writeToNBT(new NBTTagCompound()))
tagCompound.setTag("MatT", item('minecraft:stained_hardened_clay').writeToNBT(new NBTTagCompound()))
tagCompound.setTag("MatF", item('minecraft:sea_lantern').writeToNBT(new NBTTagCompound()))

var result = item('contenttweaker:hand_framing_tool')
result.setTagCompound(tagCompound)

crafting.addShapeless("contenttweaker:hft_decorate", result, [item('contenttweaker:hand_framing_tool'), item('minecraft:stick'), item('minecraft:wool', 7)])