//backport 1.14 dye mechanics
<ore:dyeBlack>.remove(<minecraft:dye:0>);
<ore:dye>.remove(<minecraft:dye:0>);
recipes.addShapeless(<metaitem:dye.black>, [<minecraft:dye:0>]);

<ore:dyeBrown>.remove(<minecraft:dye:3>);
<ore:dye>.remove(<minecraft:dye:3>);
recipes.addShapeless(<metaitem:dye.brown>, [<minecraft:dye:3>]);
<ore:dyeBrown>.remove(<nuclearcraft:cocoa_solids>);
recipes.addShaped(<metaitem:dye.brown>, [[null,null,null], [null,null,null], [null,null,<nuclearcraft:cocoa_solids>]]);
recipes.addShaped(<metaitem:dye.brown>, [[null,null,null], [null,null,null], [null,null,<metaitem:dustCocoa>]]); //NC cocoa solids and vanilla cocoa stop being a dye when turned into GT cocoa dust
<ore:dyeBrown>.remove(<metaitem:dustMetalMixture>);
recipes.addShaped(<metaitem:dye.brown>, [[null,null,null], [null,null,null], [null,null,<metaitem:dustMetalMixture>]]);

<ore:dyeBlue>.remove(<minecraft:dye:4>);
<ore:dye>.remove(<minecraft:dye:4>);
recipes.addShapeless(<metaitem:dye.blue>, [<minecraft:dye:4>]);
<ore:dyeBlue>.remove(<metaitem:gemLazurite>);
recipes.addShapeless(<metaitem:dye.blue>, [<metaitem:gemLazurite>]);
<ore:dyeBlue>.remove(<metaitem:gemSodalite>);
recipes.addShapeless(<metaitem:dye.blue>, [<metaitem:gemSodalite>]);
<ore:dyeBlue>.remove(<metaitem:dustLapis>);
recipes.addShaped(<metaitem:dye.blue>, [[null,null,null], [null,null,null], [null,null,<metaitem:dustLapis>]]);
<ore:dyeBlue>.remove(<metaitem:dustLazurite>);
recipes.addShaped(<metaitem:dye.blue>, [[null,null,null], [null,null,null], [null,null,<metaitem:dustLazurite>]]);
<ore:dyeBlue>.remove(<metaitem:dustSodalite>);
recipes.addShaped(<metaitem:dye.blue>, [[null,null,null], [null,null,null], [null,null,<metaitem:dustSodalite>]]);

<ore:dyeMagenta>.remove(<extrautils2:ingredients:3>);
recipes.addShapeless(<metaitem:dye.magenta>, [<extrautils2:ingredients:3>]);

<ore:dyeWhite>.remove(<minecraft:dye:15>);
<ore:dye>.remove(<minecraft:dye:15>);
recipes.addShaped(<metaitem:dye.white>, [[null,null,null], [null,null,null], [null,null,<minecraft:dye:15>]]);

//fix elevator redyeing recipes
recipes.removeByRecipeName("elevatorid:redye_white");
recipes.addShapeless(<elevatorid:elevator_white>, [<ore:blockElevator>,<ore:dyeWhite>]);
recipes.removeByRecipeName("elevatorid:redye_orange");
recipes.addShapeless(<elevatorid:elevator_orange>, [<ore:blockElevator>,<ore:dyeOrange>]);
recipes.removeByRecipeName("elevatorid:redye_magenta");
recipes.addShapeless(<elevatorid:elevator_magenta>, [<ore:blockElevator>,<ore:dyeMagenta>]);
recipes.removeByRecipeName("elevatorid:redye_light_blue");
recipes.addShapeless(<elevatorid:elevator_light_blue>, [<ore:blockElevator>,<ore:dyeLightBlue>]);
recipes.removeByRecipeName("elevatorid:redye_yellow");
recipes.addShapeless(<elevatorid:elevator_yellow>, [<ore:blockElevator>,<ore:dyeYellow>]);
recipes.removeByRecipeName("elevatorid:redye_lime");
recipes.addShapeless(<elevatorid:elevator_lime>, [<ore:blockElevator>,<ore:dyeLime>]);
recipes.removeByRecipeName("elevatorid:redye_pink");
recipes.addShapeless(<elevatorid:elevator_pink>, [<ore:blockElevator>,<ore:dyePink>]);
recipes.removeByRecipeName("elevatorid:redye_gray");
recipes.addShapeless(<elevatorid:elevator_gray>, [<ore:blockElevator>,<ore:dyeGray>]);
recipes.removeByRecipeName("elevatorid:redye_silver");
recipes.addShapeless(<elevatorid:elevator_silver>, [<ore:blockElevator>,<ore:dyeLightGray>]);
recipes.removeByRecipeName("elevatorid:redye_cyan");
recipes.addShapeless(<elevatorid:elevator_cyan>, [<ore:blockElevator>,<ore:dyeCyan>]);
recipes.removeByRecipeName("elevatorid:redye_purple");
recipes.addShapeless(<elevatorid:elevator_purple>, [<ore:blockElevator>,<ore:dyePurple>]);
recipes.removeByRecipeName("elevatorid:redye_blue");
recipes.addShapeless(<elevatorid:elevator_blue>, [<ore:blockElevator>,<ore:dyeBlue>]);
recipes.removeByRecipeName("elevatorid:redye_brown");
recipes.addShapeless(<elevatorid:elevator_brown>, [<ore:blockElevator>,<ore:dyeBrown>]);
recipes.removeByRecipeName("elevatorid:redye_green");
recipes.addShapeless(<elevatorid:elevator_green>, [<ore:blockElevator>,<ore:dyeGreen>]);
recipes.removeByRecipeName("elevatorid:redye_red");
recipes.addShapeless(<elevatorid:elevator_red>, [<ore:blockElevator>,<ore:dyeRed>]);
recipes.removeByRecipeName("elevatorid:redye_black");
recipes.addShapeless(<elevatorid:elevator_black>, [<ore:blockElevator>,<ore:dyeBlack>]);

//fix slime block redyeing recipes
recipes.removeByRecipeName("darkutils:dyed_slime_block_white");
recipes.addShaped(<darkutils:slime_dyed:0> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeWhite>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_orange");
recipes.addShaped(<darkutils:slime_dyed:1> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeOrange>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_magenta");
recipes.addShaped(<darkutils:slime_dyed:2> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeMagenta>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_light_blue");
recipes.addShaped(<darkutils:slime_dyed:3> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeLightBlue>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_yellow");
recipes.addShaped(<darkutils:slime_dyed:4> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeYellow>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_lime");
recipes.addShaped(<darkutils:slime_dyed:5> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeLime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_pink");
recipes.addShaped(<darkutils:slime_dyed:6> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyePink>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_gray");
recipes.addShaped(<darkutils:slime_dyed:7> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeGray>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_silver");
recipes.addShaped(<darkutils:slime_dyed:8> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeLightGray>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_cyan");
recipes.addShaped(<darkutils:slime_dyed:9> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeCyan>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_purple");
recipes.addShaped(<darkutils:slime_dyed:10> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyePurple>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_blue");
recipes.addShaped(<darkutils:slime_dyed:11> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeBlue>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_brown");
recipes.addShaped(<darkutils:slime_dyed:12> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeBrown>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_green");
recipes.addShaped(<darkutils:slime_dyed:13> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeGreen>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_red");
recipes.addShaped(<darkutils:slime_dyed:14> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeRed>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);
recipes.removeByRecipeName("darkutils:dyed_slime_block_black");
recipes.addShaped(<darkutils:slime_dyed:15> * 8, [[<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>], [<ore:blockSlime>,<ore:dyeBlack>,<ore:blockSlime>], [<ore:blockSlime>,<ore:blockSlime>,<ore:blockSlime>]]);

//fix satchel redyeing
<ore:dye>.addAll(<ore:dyeWhite>);
<ore:dye>.addAll(<ore:dyeOrange>);
<ore:dye>.addAll(<ore:dyeMagenta>);
<ore:dye>.addAll(<ore:dyeLightBlue>);
<ore:dye>.addAll(<ore:dyeYellow>);
<ore:dye>.addAll(<ore:dyeLime>);
<ore:dye>.addAll(<ore:dyePink>);
<ore:dye>.addAll(<ore:dyeGray>);
<ore:dye>.addAll(<ore:dyeLightGray>);
<ore:dye>.addAll(<ore:dyeCyan>);
<ore:dye>.addAll(<ore:dyePurple>);
<ore:dye>.addAll(<ore:dyeBlue>);
<ore:dye>.addAll(<ore:dyeBrown>);
<ore:dye>.addAll(<ore:dyeGreen>);
<ore:dye>.addAll(<ore:dyeRed>);
<ore:dye>.addAll(<ore:dyeBlack>);
