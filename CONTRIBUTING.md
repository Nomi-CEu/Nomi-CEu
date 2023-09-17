# Contributing

## More to come!

## How to contribute:
- Fork this repository
- Add commits
- PR it back!

## Quest Book Contributing
### Normal Mode:
Change the quest book `.json` located at `/overrides/config/betterquesting/saved_quests/NormalQuestsDev.json`.

### Expert Mode:
Change the quest book ``.json` located at `/overrides/config/betterquesting/saved_quests/ExpertQuestsDev.json`.

**Make sure when you change the files listed above! DO NOT change the lang file(s), or the main `.json` files, which contain translation keys.**

The only exception to this rule is with QB translations. Only change the lang file(s). Notes on how to do this are stated below.

Once the changes are committed to `main`, GH Actions will automatically update the main QB `.json` files, and the English QB lang file!

### Translations:
You can either make a resource pack, with a lang file located in `/questbook/lang`, or you can PR a lang file, placed in `/overrides/resources/questbook/lang`. 
- Note that both Normal and Expert QB translations are located there.
- Each localization entry for each line or quest has a comment above, saying the quest/line id, and the mode it is related to.
- The localization entries for normal and expert are seperated by a comment.
- `line` notes above localization keys are for chapters.
- `db` notes above localization keys are for quests.

## Info for Maintainers:
Here are some basic notes. I hope that you were explained the basic gist of this project, but here are some finer details:
- If you want the QB Transform Workflow to run on your branch, that isn't `main`, prefix the branch with `test_buildscript`
