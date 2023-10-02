# Contributing Information & Maintainer Documentation

// TODO Update this at end
## Table Of Contents
- [1. Contributing Rules and Guidelines](#section-1-contributing-rules-and-guidelines)
  - [1.1 Introduction](#11-introduction) 
- [2. Quest Book Contributing](#quest-book-contributing)

### More to come!

## Section 1: Contributing Introduction and Guidelines
### 1.1: Introduction
You should have at least a basic knowledge of git, such as how to Clone & Fork Repos, make Branches, and make Pull Requests.

If not, please go learn that first, such as from a YouTube Video.

### 1.2: Setting It Up
1. **Fork this repository.**
   - Unless you are contributing to other branches, you only need to include the main branch.    
   - Be careful when contributing to other branches, as most of the time, the contributions should go to the `main` branch instead! Ask a maintainer if in doubt.**
2. **Make a new branch, off the copied branch.**
   - When merging PRs, we tend to Squash Merge a lot. This means that every PRs should go in a different branch.
   - Keep your fork's `main` branch in sync with our `main` branch, to allow for easy creating and updating of branches.
3. **Add commits**
   - Add commits to implement your fix or feature!
   - It is highly recommended to clone your repo locally, so you can easily make and test changes.
   - Make sure that your implementation follows the rules given in that category, if applicable.
4. **PR it back!**
   - In your description, mention discord discussions, issues fixed, etc.
   - Implement suggestions given to your PR.
   - If you are implementing a big feature, do this earlier, so we can suggest, and implement changes quicker!

### 1.3: Guidelines
These are some basic guidelines. Apart from these, please be appropriate, and p
1. **Keep your Commits, and Commit Descriptions, free of:**
   - Profanity
   - Keys // TODO Link this to future keys section
2. **Check for similar PRs! Also check for similar issues, which may have more information, and that you can link to!**
3. **If your PR fixes an issue, have your PR auto-close it using GitHub's [closing keywords](https://docs.github.com/en/enterprise/2.16/user/github/managing-your-work-on-github/closing-issues-using-keywords).**
2. **Make sure your Commit Messages are descriptive!**
3. **Remember to make a new branch for each PR!**

## Section 2: Quest Book Contributing
### 2.1: Introduction
This section introduces you to quest book contributing. Nomi-CEu uses a special system for the quest books, in order to allow for translations for both quest books.

Quest Book Editing is probably the easiest, but extremely important, contributions to Nomi-CEu. These provide a guideline for the player, and your contributions ensure that the quest book is kept up to date, and at the high standard that the Nomi Series's quest books are praised for.

Make sure you read the [Guidelines](#13-guidelines)! Especially for the quest book, profanity should not be present.

### 2.2: Setting it Up
1. **Read through the steps in [1.2: Setting It Up](#12-setting-it-up). Follow steps 1 and 2.**
2. 

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
- If you want the QB Transform Workflow to run on your fork, remove or comment out `if: "${{ github.repository_owner == 'Nomi-CEu' }}"` in `/.github/workflows/updateqb.yml` (in your fork)
