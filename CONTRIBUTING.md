# Contributing Information & Maintainer Documentation

// TODO Update this at end
## Table Of Contents
- [1. Contributing Rules and Guidelines](#section-1-contributing-rules-and-guidelines)
  - [1.1. Introduction](#11-introduction) 
  - [1.2. Setting It Up](#12-setting-it-up)
  - [1.3. Guidelines](#13-guidelines)
- [2. Quest Book Contributing](#section-2-quest-book-contributing)
  - [2.1. Introduction](#21-introduction)
  - [2.2. Setting It Up](#22-setting-it-up)
- [3. Script Contributing]
- [4. Config Contributing]
- [4. Translation Contributing]
- [5. Documentation Contributing]
- [6. Template Information]
- [7. Maintainer Information]
  - [7.1. Workflows: Transform QB]
  - [7.2. Workflows: Changelog Generation]
  - [7.3. Workflows: General & Misc]
  - [7.4. Misc Information]
 

### More to come!

## Section 1: Contributing Introduction and Guidelines
### 1.1: Introduction
You should have at least a basic knowledge of git, such as how to Clone & Fork Repos, make Branches, and make Pull Requests.

If not, please go learn that first, such as from a YouTube Video.

### 1.2: Setting It Up
1. **Fork this repository.**
   - Unless you are contributing to other branches, you only need to include the main branch.    
   - Be careful when contributing to other branches, as most of the time, the contributions should go to the `main` branch instead! **Ask a maintainer if in doubt.**
2. **Make a new branch, off the copied branch.**
   - Name it something descriptive! This will prevent both you and us mixing up different branches.
   - When merging PRs, we usually Squash Merge, to keep the commit logs and changelogs clean and readable. This means that every PRs should go in a different branch.
   - Keep your fork's `main` branch in sync with our `main` branch, to allow for easy creating and updating of branches.
3. **Load up an instance of the current GitHub state.**
   - The easiest way to do this is to download the zip file, on our GitHub page.
      - Click the Green `Code` Button on the right, above the code display.
      - Click `Download ZIP`.
      - Import into your favourite launcher.
   - If applicable, you can also ask a maintainer to run the `Build Pack` Workflow, or download from a previous run.
      - Click on the workflow run.
      - Scroll down the bottom, to the artifacts section.
      - Download the `Built Pack` artifact.
      - Extract the downloaded zip. Inside, there are three zips, the `client`, `server`, and `lang` zips. Import the `client` zip into your favourite launcher.
   - If applicable, you can also change your current instance, of the newest Nomi-CEu release, to the GitHub state. Download the relevant files for your contribution, and replace the files in your instance.
      - Be careful with this! Only do this if the other two ways fail, if you are sure in your ability. 
4. **Add commits**
   - Add commits to implement your fix or feature!
   - It is highly recommended to clone your repo locally, so you can easily make and test changes.
   - Make sure that your implementation follows the rules given in that category, if applicable.
5. **PR it back!**
   - In your description, mention discord discussions, issues fixed, etc.
   - Implement suggestions given to your PR.
   - If you are implementing a big feature, do this earlier, so we can suggest, and implement changes quicker!

### 1.3: Guidelines
These are some basic guidelines. Apart from these, please be appropriate, and p
1. **Keep your Commits, and Commit Descriptions, free of:**
   - Profanity
   - Keys // TODO Link this to future keys section
2. **Check for similar PRs! Also check for similar issues, which may have more information, and that you can link to!**
3. **If your PR fixes an issue, have your PR auto-close it using GitHub's [closing keywords](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue).**
4. **Make sure your Commit Messages are descriptive!**
5. **Remember to make a new branch for each PR!**
6. **Do not invoke any workflows! The only exceptions to this are:**
   - If a maintainer asks you to do so
   - If your contribution is related to the workflow YAML or TypeScript files

## Section 2: Quest Book Contributing
### 2.1: Introduction
This section introduces you to quest book contributing. Nomi-CEu uses a special system for the quest books, in order to allow for translations for both quest books.

Quest Book Editing is probably the easiest, but extremely important, contributions to Nomi-CEu. These provide a guideline for the player, and your contributions ensure that the quest book is kept up to date, and at the high standard that the Nomi Series's quest books are praised for.

Make sure you read the [Guidelines](#13-guidelines)! Especially for the quest book, profanity should not be present.

### 2.2: Development Json Files
Throughout this section, the `Development Json Files` will be mentioned. These are (paths relative to your instance's `minecraft` folder):
- `/config/betterquesting/saved_quests/NormalQuestsDev.json` for Normal Mode Quest Book Contributions
- `/config/betterquesting/saved_quests/ExpertQuestsDev.json` for Expert Mode Quest Book Contributions

### 2.3: Setting it Up
1. **Read through the steps in [1.2: Setting It Up](#12-setting-it-up). Follow steps 1 and 3.**
   - If you decide to update your instance to the current GitHub state, you will need to update the [Development Json Files](#22-development-json-files), from the GitHub version.
2. **Edit the QB.**    
   There are two ways to do this:    
   ***Using BQu's Edit Mode***
   - This is the recommended way to edit the quest book.
   - Go into a world, where you have cheats enabled.
   - Load the relevant Development Json File.
     - `/bq_admin default load NormalQuestsDev` for Normal Mode
     - `/bq_admin default load ExpertQuestsDev` for Expert Mode
   - Enable Edit Mode. Run `/bq_admin edit true`.
     - See [this wiki page](https://github.com/Funwayguy/BetterQuesting/wiki/Quest-Instance) for more information on how to use edit mode, although it is pretty self-explanatory.
   - Save to the relevant Development Json File.
     - `/bq_admin default save NormalQuestsDev` for Normal Mode
     - `/bq_admin default save ExpertQuestsDev` for Expert Mode

   ***Editing the Quest Book Json Files:***
   - This is not recommended, unless you are experienced.
   - Only edit the [Development Json Files](#22-development-json-files).
   - After you are done, load the json file into your instance, to let BQu format it, to validate it, to add colours and/or formatting, and to check over your changes.

3. **Commit It, and PR it. For more information, see steps 4 and 5 in [1.2: Setting It Up](#12-setting-it-up).**
   - Once the changes are committed to `main`, GH Actions will automatically update the main QB `.json` files, and the English QB lang file!

### 2.4: Guidelines
- **Follow all guidelines in [1.3: Guidelines](#13-guidelines).**
- **ONLY EDIT THE DEVELOPMENT JSON FILES!!!**
  - The other json files contain translation keys.
  - Do not edit those json files, or the english lang! These are automatically updated whenever the development json files are changed in `main`.
  - You do not need to test it! If it fails to work, then it is a problem with the workflow, not your contribution.

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
- If you want the QB Transform Workflow to run on your fork, remove or comment out `if: "${{ github.repository_owner == 'Nomi-CEu' }}"` in `/.github/workflows/updateqb.yml` (in your fork)
