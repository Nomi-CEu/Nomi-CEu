import gregtech.api.recipes.RecipeMap
import gregtech.api.recipes.builders.*
import gregtech.core.sound.GTSoundEvents
import gregtech.api.gui.GuiTextures

NomiRecipeMaps.NAQUADAH_REACTOR_1 = new RecipeMap<>("naquadah_reactor_1", 1, 1, 0, 0, new FuelRecipeBuilder(), false)
                .setSlotOverlay(false, false, GuiTextures.ATOMIC_OVERLAY_1).setSlotOverlay(false, true, GuiTextures.ATOMIC_OVERLAY_1)
                .setSlotOverlay(true, false, GuiTextures.ATOMIC_OVERLAY_1).setSlotOverlay(true, true, GuiTextures.ATOMIC_OVERLAY_1)
                .setSound(GTSoundEvents.TURBINE);
                
NomiRecipeMaps.NAQUADAH_REACTOR_2 = new RecipeMap<>("naquadah_reactor_2", 1, 1, 0, 0, new FuelRecipeBuilder(), false)
                .setSlotOverlay(false, false, GuiTextures.ATOMIC_OVERLAY_1).setSlotOverlay(false, true, GuiTextures.ATOMIC_OVERLAY_1)
                .setSlotOverlay(true, false, GuiTextures.ATOMIC_OVERLAY_1).setSlotOverlay(true, true, GuiTextures.ATOMIC_OVERLAY_1)
                .setSound(GTSoundEvents.TURBINE);
