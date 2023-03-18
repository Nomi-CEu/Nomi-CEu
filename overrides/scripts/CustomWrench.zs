import crafttweaker.block.IBlock;
import crafttweaker.player.IPlayer;
import crafttweaker.block.IBlockPattern;
import crafttweaker.event.PlayerInteractBlockEvent;

<ore:wrenches>.add(<thermalfoundation:wrench>,
                       <enderio:item_yeta_wrench>,
                       <redstonearsenal:tool.wrench_flux>,
                       <redstonearsenal:tool.battlewrench_flux>);

<ore:wrenches>.addAll(<ore:toolWrench>);

static wrenchables as IBlockPattern = <thermalexpansion:tank> as IBlock |
                                      <thermalexpansion:cell> as IBlock |
                                      <extrautils2:creativeenergy> as IBlock |
                                      <extrautils2:passivegenerator:6> as IBlock |
                                      <extrautils2:drum:4> as IBlock |
                                      <draconicevolution:creative_rf_source> as IBlock |
                                      <appliedenergistics2:creative_energy_cell> as IBlock;

function isNotWrenchable(block as IBlock) as bool {
	return isNull(block) || // no block
		!(wrenchables has block); // not wrenchable
}

function isNotWrenching(player as IPlayer) as bool {
	return isNull(player) || // no player
		!player.isSneaking || // not sneaking
		isNull(player.currentItem) || // no item is held
		!(<ore:wrenches> has player.currentItem); // not a wrench
}

function playerIsNotWrenchingWrenchable(evt as PlayerInteractBlockEvent) as bool {
	// gracefully handle unusual circumstances
	if (isNull(evt) || isNull(evt.world) || evt.canceled || evt.useItem == "DENY")
		return true;

	return isNotWrenching(evt.player) || isNotWrenchable(evt.block);
}

function dropItem(evt as PlayerInteractBlockEvent) as bool {
    if (evt.world.remote)
        return true;

    val stack = evt.world.getPickedBlock(evt.position, evt.player.getRayTrace(4, 0), evt.player);

    if (isNull(stack) || !evt.world.setBlockState(<blockstate:minecraft:air>, evt.position))
        return false;

    // dummy entity to drop the item with
    val dummy = <entity:minecraft:arrow>.createEntity(evt.world);
    dummy.posX = evt.x as double + 0.5;
    dummy.posY = evt.y as double + 0.5;
    dummy.posZ = evt.z as double + 0.5;

    dummy.dropItem(stack);
}

events.onPlayerInteractBlock(function(evt as PlayerInteractBlockEvent) as void {
	if (playerIsNotWrenchingWrenchable(evt))
		return;

    if (dropItem(evt)) {
        evt.cancellationResult = "SUCCESS";
        evt.cancel();
	}
});
