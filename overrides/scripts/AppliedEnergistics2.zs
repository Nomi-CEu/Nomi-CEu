#ignoreBracketErrors

import scripts.common.makeShaped as makeShaped;

// ME Controller
recipes.removeByRecipeName("appliedenergistics2:network/blocks/controller");
makeShaped("me_controller", <appliedenergistics2:controller>,
	["PFP",
	 "FAF",
	 "PFP"],
	{ F : <ore:crystalPureFluix>,
	  P : <ore:plateDarkSteel>,
	  A : <appliedenergistics2:energy_acceptor>});

// Dense Conduit
assembler.recipeBuilder()
	.inputs([<enderio:item_me_conduit> * 4, <ore:itemConduitBinder> * 5])
	.outputs([<enderio:item_me_conduit:1> * 2])
	.duration(80)
	.EUt(16)
	.buildAndRegister();
