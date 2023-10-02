# Contributing Information & Maintainer Documentation

## Table Of Contents
- **[1. Contributing Rules and Guidelines](#section-1-contributing-rules-and-guidelines)**
  - [1.1. Introduction](#11-introduction) 
  - [1.2. Setting It Up](#12-setting-it-up)
  - [1.3. Guidelines](#13-guidelines)
- **[2. Quest Book Contributing](#section-2-quest-book-contributing)**
  - [2.1. Introduction](#21-introduction)
  - [2.2. Development Json Files](#22-development-json-files)
  - [2.3. Setting It Up](#23-setting-it-up)
  - [2.4. Guidelines](#24-guidelines)
- **[3. Script and Config Contributing](#section-3-script-and-config-contributing)**
  - [3.1. Introduction](#31-introduction)
  - [3.2. Setting It Up](#32-setting-it-up)
- **[4. Translation Contributing](#section-4-translation-contributing)**
  - [4.1. Introduction](#41-introduction)
  - [4.2. Content Tweaker Translations](#42-content-tweaker-translations)
  - [4.3. Quest Book Translations](#43-quest-book-translations)
  - [4.4. Misc Translations](#44-misc-translations)
- **[5. Template Information](#section-5-template-information)**
- **[6. Maintainer Information](#section-6-maintainer-information)**
  - [6.1. Workflows: General Information](#61-workflows-general-information)
  - [6.2. Workflows: Changelog Generation](#62-workflows-changelog-generation)
  - [6.3. Workflows: Transform QB](#63-workflows-transform-qb)
  - [6.4. Workflows: General & Misc](#64-workflows-general-and-misc)
  - [6.5. Misc Information](#65-misc-information)
 

### More to come! Contributions to this file are extremely welcome!

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
   - [Keys](#commit-keys)
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

   i. ***Using BQu's Edit Mode***
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
   
   ii. ***Editing the Quest Book Json Files:***
   - This is not recommended, unless you are experienced.
   - Only edit the [Development Json Files](#22-development-json-files).
   - After you are done, load the json file into your instance, to let BQu format it, to validate it, to add colours and/or formatting, and to check over your changes.

3. **Commit It, and PR it. For more information, see steps 4 and 5 in [1.2: Setting It Up](#12-setting-it-up).**
   - Once the changes are committed to `main`, GitHub Actions will automatically update the main QB `.json` files, and the English QB lang file!

### 2.4: Guidelines
- **Follow all guidelines in [1.3: Guidelines](#13-guidelines).**
- **ONLY EDIT THE DEVELOPMENT JSON FILES!!!**
  - The other json files contain translation keys.
  - Do not edit those json files, or the english lang! These are automatically updated whenever the development json files are changed in `main`.
  - You do not need to test it! If it fails to work, then it is a problem with the workflow, not your contribution.

## Section 3: Script and Config Contributing
### 3.1: Introduction
Scripts and Configs are the lifeblood of Nomi-CEu. They provide the stitching between mods, changes in difficulty, and much more. However, these contributions require at least basic programming knowledge. If you want to start off contributing, it is highly recommended you start with [Quest Book Contributions](#section-2-quest-book-contributing).

As these contributions are more varied, less information is given, although if you are doing these contributions, you should be fine.

If you are contributing scripts, check if your feature or fix can be integrated with configs instead. **This does not apply to recipes for a machine, or similar, of which that mod adds!**

Follow all of these [Guidelines](#13-guidelines).

### 3.2: Setting It Up
1. **Read through the steps in [1.2: Setting It Up](#12-setting-it-up). Follow those steps.**
    - If you decide to update your instance to the current GitHub state, you will either need to update the `scripts` folder, or the `config` folder. Of course, if you are editing other files, then update those folders instead.
    - The Random Patches config files, the Server Property files, and the Issue Template files come from templates. Do not edit them. Read [5. Template Information](#section-5-template-information) for details, and how to edit them.
    - Check if your config change needs to be copied over to one, or both, of the same file, in `config-overrides`.

## Section 4: Translation Contributing
### 4.1: Introduction
Translations are an important part of Nomi-CEu. They allow us to reach to people and places that it would otherwise not. This is an especially important contribution, as we cannot do this ourselves.

We encourage you to add new translations, or improve existing ones. Simply make a PR! 

As usual, read through the steps in [1.2: Setting It Up](#12-setting-it-up), and the guidelines in [1.3: Guidelines](#13-guidelines).

A way to update language files, and inform translators what parts of which ones are out of date, is planned. When that is implemented, this file will be updated with the details.

### 4.2: Content Tweaker Translations
- These are in `/resources/contenttweaker/lang`, and are for our custom items and blocks.

### 4.3: Quest Book Translations
- Both Normal and Expert QB translations are located in one lang file: `/resources/questbook/lang`.
- Each localization entry for each line or quest has a comment above, saying the quest/line id, and the mode it is related to.
- The localization entries for normal and expert are seperated by a comment.
- `line` notes above localization keys are for chapters.
- `db` notes above localization keys are for quests.

### 4.4: Misc Translations
All mods that Nomi-CEu uses can have language files changed or added. Usually, their lang paths are in `/resources/<modid>/lang`. It is recommended to ask a maintainer, on Discord or GitHub, for information on how to do this, as this can be quite difficult.

## Section 5: Template Information
The Random Patches config files, the Server Property files, and the Issue Template files come from templates. Therefore, these should not be edited, as they will be replaced by the template in the next update.

Instead, change the relevant file in `/tools/templates/`. 
- `{{ version }}` will be replaced by the new version.
- `{{ mode }}` will be replaced by the mode that file is being made for.
- `{{ versions }}` will be replaced by the version list. These are the versions that the user can pick from in the issue form.

## Section 6: Maintainer Information
Most of this section is dedicated to explaining workflows.

### 6.1: Workflows: General Information
If you want the workflow to run on a branch, which isn't `main`, change the top option (`Use workflow from...`). Note that this will use the workflow file, and the TypeScript files, from that branch!

### 6.2: Workflows: Changelog Generation
The changelog generation task allows for fast, detailed and consistent changelogs every update.

There are two categories of commits:
- Primary Commits: a commit that edits files in `/overrides` or `manifest.json`.
- Secondary Commits: a commit that does **not** edit files in `/overrides` or `manifest.json`.

If no [Commit Keys](#commit-keys) are set, then:
- Primary Commits: the commit message will be put into the `General` Category, and its `Other` Sub Category, and the changelog commit log.
- Secondary Commits: will not be included in any changelog section, or the changelog commit log.

If commit keys are given, then whatever the commit edits, the commit key will be applied to it. This means that it will be added to the changelog (unless the skip key is used).

Mod Update Commits should contain the No Category Key, as they will be placed in their corresponding mod change section. However, if they fix a bug, or implement a feature, or etc., they should have the corresponding key, and include details.

Mod Change Sections are calculated based on the change in `manifest.json`, not by commits. The commit SHAs and Authors are added by going through the commits, looking for one that edits that projectID.

If you would like to check your commit, you can run the `createChangelog` npx gulp task locally, with the env variable `TEST_CHANGELOG` set to a non-empty string. This will output an error if it occurred, and will otherwise output a changelog to your local repo's root directory.

#### Commit Keys:
These keys do something to the commit that they are added to. These are added to the commit's bodies/descriptions.

Add the `key` part of the commit key to a commit's body to apply it to that commit!

When merging PRs, make sure that no keys are present, or there may be big problems!


***Special Effect Keys***    
These keys are arranged in priority, as only one will take effect. Unless otherwise said, this prevents all other commit keys from taking effect.

*Skip Key*    
Key: `[SKIP]`

Prevents the commit from showing up in the changelog sections, or in the changelog commit log.

Not needed for Secondary Commits, as this is the default behaviour, if no commit keys are in the commit description.

<hr>

*Expand Key*    
Key: `[EXPAND]`

This key essentially creates more commits in the commit, while not adding the original commit to the changelog sections.

The 'subcommits' are stored between two `[EXPAND]`. These must surround it, with nothing else in them. The key at the beginning must be the first appearance of `[EXPAND]` in the commit description.

The data must have an array, with key `messages`, of 'subcommit' objects. The subcommit objects must contain a key `messageTitle`, which is the message title to add to the changelog section, and optionally contain a key `messageBody`, which can be used to place the commit in a Category and/or Sub Category, further expansion, and/or to add details to the commit.

The presence of this key prevents any further parsing of the original commit body, although the commit body in each 'subcommit' object will be parsed.

The syntax is in [TOML](https://toml.io/en/). It is highly recommended you check the syntax [here](https://www.toml-lint.com/) first.

Below is an example of a valid commit body.

```toml
[EXPAND]
[[messages]]
  messageTitle = "Rids QB. AGAIN!!!!"
  messageBody = "[QB]"

[[messages]]
  messageTitle = "Nothing. At least I no longer hate this."
  messageBody = '''
  [QB]
  [HM]
  '''

[[messages]]
  messageTitle = "Bears."
  messageBody = """
  [FEATURE]
  [HM]
  - Five Teddies
  - Two Bears
  [DETAILS]
    details = [
    \"Five Teddies\",
    \"Two Bears\",
    \"\"\"
      [DETAILS]
      details = [
      \\"BEARS WILL INVADE NOMI!\\",
      \\"\\"\\"
        [DETAILS]
        details = [ \\\"BEARS WILL INVADE NOMI!\\\" ]
        [DETAILS]
      \\"\\"\\" ]
      [DETAILS]
  \"\"\"
    ]
  [DETAILS]
  BEARS WILL INVADE NOMI!
  """

[[messages]]
  messageTitle = "Expand Time."
  messageBody = """
  [EXPAND]
  [[messages]]
    messageTitle = \"Done. OR IS IT????\"
    messageBody = \"\"\"
    [FEATURE]
    [QOL]
    \"\"\"
  [EXPAND]
  """
[EXPAND]
```
There can also be text before and after this. It is recommended to have a 'human readable version' above.

Here are some notes:
- `[EXPAND]` which are before the ending key must be indented. 
- The `[EXPAND]` surrounding the data must be without indents.
- For every layer (such as the three layer details in the subcommit `Bears.`), an extra backslash is needed before the double quotes.
- You cannot include the Skip Key anywhere, else this commit will not be parsed!
- Every other key can be included in the subcommits.
- Including other commit keys in the base commit body will do nothing.
- A No Category key in a subcommit will act like a `[SKIP]` for that subcommit, as these subcommits are not added to

<hr>

*Details Key*    
Key: `[DETAILS]`

This key adds indented details beneath your commit.

The messages are stored between two `[DETAILS]`. These must surround it, with nothing else in them. The key at the beginning must be the first appearance of `[DETAILS]` in the commit description.

The data must have an array, with key `details`, of strings, which contain the details.

You can have multiple layers!

The syntax is in [TOML](https://toml.io/en/). It is highly recommended you check the syntax [here](https://www.toml-lint.com/) first.

Below is an example of a valid commit body.

```toml
[DETAILS]
details = [
"Five Teddies",
"Two Bears",
"""
  [DETAILS]
  details = [
  \"BEARS WILL INVADE NOMI!\",
  \"\"\"
    [DETAILS]
    details = [ \\"BEARS WILL INVADE NOMI!\\" ]
    [DETAILS]
  \"\"\" ]
  [DETAILS]
"""
]
[DETAILS]
BEARS WILL INVADE NOMI!
```
There can also be text before and after this. It is recommended to have a 'human readable version' above.

Here are some notes:
- `[DETAILS]` which are before the ending key must be indented.
- The `[DETAILS]` surrounding the data must be without indents.
- To add multiple layers, you simply have a multiline message, containing `[DETAILS]`, and details data stored in TOML.
- For every layer, an extra backslash is needed before the double quotes.
- You cannot include the Skip Key anywhere, else this commit will not be parsed!
- A No Category key in this commit will not do anything.
- The commit, and its subcommits, are placed in the changelog in accordance with commit keys in the commit body. If none are set, there are placed according to the defaults.

<hr>

*No Category Key*    
Key: `[NO CATEGORY]`

This commit just places the commit in the changelog commit log, and does not place it in any changelog section.

#### Category Keys
These place a commit in a category. To use them, include the `Category Key` in the description of your commit, with optional `Sub Category Keys`.

Commits can go in multiple categories.

The category list is arranged by the order of which they appear in the changelog.

If a commit is allowed entry into a category, it will go into a Sub Category. It can only go in one.

The sub category list of each category determines the sub categories in can enter. It is sorted by priority, with the topmost item on the list having the highest piority, and the lowest item having the lowest piority. If no key specifying a sub category is given, then it will be placed in the Default Sub Category.

If the sub category or the default sub category is `N/A`, then the category has no sub categories.

<table>
<tr>
<th>Category Key</th>
<th>Category Description</th>
<th>Default Sub Category</th>
<th>Sub Categories (<code>Key</code>, Description)</th>
</tr>
<tr>
<td><code>[BREAKING]</code></td>
<td>Breaking Changes</td>
<td>N/A</td>
<td>N/A</td>
</tr>
<tr>
<td><code>[BALANCING]</code></td>
<td>Balancing Changes</td>
<td>Both Modes</td>
<td>
<ul>
<li><code>[NM]</code>, Normal Mode</li>
<li><code>[HM]</code>, Hard Mode</li>
</ul>
</td>
<td>
<td></td>
</td>
</tr>
</table>


### 6.3: Workflows: Transform QB
This workflow updates the QB Jsons, and the english lang, every time a commit is pushed to main, which changes one, or both, of the [Development Json Files](#22-development-json-files).
- If you want the QB Transform Workflow to run on your branch, that isn't `main`, prefix the branch with `test_buildscript`
- If you want the QB Transform Workflow to run on your fork, remove or comment out `if: "${{ github.repository_owner == 'Nomi-CEu' }}"` in `/.github/workflows/updateqb.yml` (in your fork)

### 6.4: Workflows: General and Misc
Coming Soon!

### 6.5: Misc Information

