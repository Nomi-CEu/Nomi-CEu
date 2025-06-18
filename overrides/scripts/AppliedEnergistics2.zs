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
