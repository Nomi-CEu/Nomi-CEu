// Rhodium Plated Palladium -> Rhodium Plated Lumium-Palladium
material('rhodium_plated_palladium')
        .changeComposition()
        .setComponents([materialstack('palladium') * 3, materialstack('rhodium'), materialstack('nomilabs:lumium') * 2])
        .changeABS()
        .changeMixer()
        .changeDecompositionRecipes()
        .change()
