println("[CustomBlocks.groovy] Start Custom Blocks Registration.")

/* --------------------------------- Custom Blocks ----------------------------------------- */

/* Custom Behaviour Blocks:
Excitation Coil and Dust Block have special behaviours, and are found in /classes/blocks. 
All further special behaviour blocks should go there too.*/
content.registerBlock("excitationcoil", new ExcitationCoil(content.getDefaultTab()))
content.registerBlock("block_dust", new DustBlock(content.getDefaultTab()))

/* Normal Blocks */
content.createBlock("densemagma").register()
content.createBlock("denseoilshale").register()
content.createBlock("microverse_casing").register()

println("[CustomBlocks.groovy] End Custom Blocks Registration.")