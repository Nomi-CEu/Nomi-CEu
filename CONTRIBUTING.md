# Contributing Information & Maintainer Documentation

## Table Of Contents
**[Part 1: Contributing Information](#part-1-contributing-information)**
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

<hr>

**[Part 2: Maintainer Documentation](#part-2-maintainer-documentation)**
- **[6. Workflows Documentation](#section-6-workflows-documentation)**
  - [6.1. General Information](#61-general-information)
  - [6.2. Create Changelog](#62-create-changelog)
  - [6.3. Create Release Commit](#63-create-release-commit)
  - [6.4. Deploy to GitHub Releases & CurseForge](#64-deploy-to-github-releases-and-curseforge)
  - [6.5. Build Pack](#65-build-pack)
  - [6.6. Create Release Commit & Changelog](#66-create-release-commit--changelog)
  - [6.7. Release Commit & Deploy](#67-release-commit--deploy)
  - [6.8. Update Quest Book Jsons and Lang](#68-update-quest-book-jsons-and-lang)
  - [6.9. Un-Callable Workflows](#69-un-callable-workflows)
  - [6.10: Typical Usage](#610-typical-usage)
- **[7. Misc Information](#section-7-misc-information)**
 

### More to come! Contributions to this file are extremely welcome!

# Part 1: Contributing Information
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

# Part 2: Maintainer Documentation
## Section 6: Workflows Documentation
### 6.1: General Information
#### Activating the workflow on another branch
If you want the workflow to run on a branch, which isn't `main`, change the top option (`Use workflow from...`).   

This will cause the workflow to run all operations, such as build or making a release commit, on that branch.   
Note that this will use the workflow file, and the TypeScript files, from that branch!

#### Re-running jobs
All of the combined workflows are split into jobs. If one fails, for example, when deploying the release, if deploying to CurseForge fails, then if the other jobs are allowed to run, they will continue to run.

To re-run it, click the `Re-run Jobs` button. There are two options:
- `Re-run failed jobs` will re-run all failed jobs, and their dependencies. This is useful in the example, where the pack will be built again and deployed to CurseForge, without deploying to GitHub Releases again. This is what should be used typically.
- `Re-run all jobs` will re-run all jobs.

Re running jobs uses the same workflow file, even if the file was changed, and uses the same original inputs.

### 6.2: Create Changelog
The workflow allows for fast, detailed and consistent changelogs every update.

This workflow does not run automatically.

This workflow uploads both generated changelogs (GitHub & CF) as an artifact.

When run, the options are (excluding the [branch selection](#activating-the-workflow-on-another-branch) available to all workflows):

<table>
<tr>
<th>Name</th>
<th>Description</th>
<th>Optional?</th>
</tr>
<tr>
<td align="center">Tag</td>
<td>The tag to checkout. This will be the newest commit parsed for the changelog. The TypeScript files will also be used from this tag.</td>
<td align="center">No</td>
</tr>
<tr>
<td align="center">Release Type</td>
<td>Must be one of <code>Release</code>, <code>Beta Release</code> or <code>Alpha Release</code>. The Release Type of the release. This will be used in the title at the beginning of the changelog.</td>
<td align="center">No</td>
</tr>
<tr>
<td align="center">Compare Tag</td>
<td>Tag to compare against. The changelog will contain all commits after the <code>Compare Tag</code>, up to and including the <code>Tag</code>.</td>
<td align="center">Yes. If not set, will use the tag before <code>Tag</code>.</td>
</tr>
<tr>
<td align="center">Branch</td>
<td>Branch to push Changelog to. They will be pushed to the Root Directory. Intended for use with the <code>Deploy to GitHub Releases and CurseForge</code> workflow.</td>
<td align="center">Yes. If not set, changelogs will just be uploaded as an artifact.</td>
</tr>
</table>

***Important Note:***   
**The branch input cannot have the same name as the input tag, or any other tag present!**   
This will cause the commit push to crash!   
It is recommended to have the branch name be `<tag>-changelog` to make it easily differentiable, and to avoid problems!

**There are two parts to the changelog:**
- Changelog Sections: These provide a seperated and neat list of the changes that have occurred.
- Commit List: This is a commit list, that is sorted by date, and is filtered.

There are two categories of commits:
- Primary Commits: a commit that edits files in `/overrides` or `manifest.json`.
- Secondary Commits: a commit that does **not** edit files in `/overrides` or `manifest.json`.

There are two changelogs generated:
- CHANGELOG.md: The changelog for use in GitHub Releases, and to put into the pack. Written in markdown, and some small html (to center elements).
- CHANGELOG_CF.md: The changelog for use in CurseForge Releases. Written in pure html.

If no [Commit Keys](#commit-keys) are set, then:
- Primary Commits: the commit message will be put into the `General` Category, and its `Other` Sub Category, and the changelog commit log.
- Secondary Commits: will not be included in any changelog section, or the changelog commit log.

If commit keys are given, then whatever the commit edits, the commit key will be applied to it. This means that it will be added to the changelog (unless the skip key is used).

Mod Update Commits should contain the No Category Key, as they will be placed in their corresponding mod change section. However, if they fix a bug, or implement a feature, or etc., they should have the corresponding key, and include details.

Mod Change Sections are calculated based on the change in `manifest.json`, not by commits. The commit SHAs and Authors are added by going through the commits, looking for one that edits that projectID.

If you would like to check your commit, you can run the `createChangelog` npx gulp task locally, with the env variable `TEST_CHANGELOG` set to a non-empty string. This will output an error if it occurred, and will otherwise output a changelog to your local repo's root directory.

The output changelogs will contain two keys. These are surrounded by `{{{`. These are only replaced by their correct values once they are added to their respective release locations.

You can add more of these tags, or remove them, and there can be a different amount 

#### `{{{ CENTER_ALIGN }}}`
This is replaced by the relevant html style attribute, to center text and images in both changelogs.
Note that for some reason, currently, images cannot be center aligned in the CF changelog!

#### `{{{ CF_REDIRECT }}}`
This is replaced by nothing in the GitHub Release, and it is replaced by:   
`Looks way better here.`   
with the `here` linking to the GitHub Release.

#### Commit Keys:
These keys do something to the commit that they are added to. These are added to the commit's bodies/descriptions.

Add the `key` part of the commit key to a commit's body to apply it to that commit!

When merging PRs, make sure that no keys are present, or there may be big problems, or unexpected parsing!

##### List of all Keys:
Intended for use to check for unexpected keys in commit descriptions.  
To be safe, avoid all use of `[]`!

<table>
<tr>
<th>Key</th>
<th>Description</th>
</tr>
<tr>
<th colspan="2">Special Effect Keys:</th>
</tr>
<tr>
<td><code>[SKIP]</code></td>
<td>Skips parsing for the commit.</td>
</tr>

<tr>
<td><code>[EXPAND]</code></td>
<td>Expands a commit into subcommits.</td>
</tr>

<tr>
<td><code>[DETAILS]</code></td>
<td>Adds submessages to a commit.</td>
</tr>

<tr>
<td><code>[NO CATEGORY]</code></td>
<td>Puts the commit in the changelog commit list, but not in the sections.</td>
</tr>

<tr>
<th colspan="2">Category Keys:</th>
</tr>

<tr>
<td><code>[BREAKING]</code></td>
<td>Breaking Changes</td>
</tr>

<tr>
<td><code>[BALANCING]</code></td>
<td>Balancing Changes</td>
</tr>

<tr>
<td><code>[PERFORMANCE]</code></td>
<td>Performance Improvements</td>
</tr>

<tr>
<td><code>[FEATURE]</code></td>
<td>Feature Additions</td>
</tr>

<tr>
<td><code>[QB]</code></td>
<td>Quest Book Changes</td>
</tr>

<tr>
<td><code>[BUG]</code></td>
<td>Bug Fixes</td>
</tr>

<tr>
<td><code>[GENERAL]</code></td>
<td>General Changes</td>
</tr>

<tr>
<td><code>[INTERNAL]</code></td>
<td>Internal Changes</td>
</tr>

<tr>
<th colspan="2">Sub Category Keys:</th>
</tr>

<tr>
<td><code>[NM]</code></td>
<td>Normal Mode</td>
</tr>

<tr>
<td><code>[HM]</code></td>
<td>Hard Mode</td>
</tr>

<tr>
<td><code>[QOL]</code></td>
<td>Quality Of Life</td>
</tr>
</table>

##### Skip to:
*[Special Effect Keys](#special-effect-keys)*
- [[SKIP]](#skip-key)
- [[EXPAND]](#expand-key)
- [[DETAILS]](#details-key)
- [[NO CATEGORY]](#no-category-key)

*[Category Keys](#category-keys)*

<hr>

##### Special Effect Keys
These keys are arranged in priority, as only one will take effect. Unless otherwise said, this prevents all other commit keys from taking effect.

###### Skip Key
Key: `[SKIP]`

Prevents the commit from being parsed. More simply put, it prevents the commit from showing up in the changelog sections, or in the changelog commit log.

Not needed for Secondary Commits, as this is the default behaviour, if no commit keys are in the commit description.

<hr>

###### Expand Key
Key: `[EXPAND]`

This key essentially creates more commits in the commit, while not adding the original commit to the changelog sections.

The 'subcommits' are stored between two `[EXPAND]`. These must surround it, with nothing else in them. The key at the beginning must be the first appearance of `[EXPAND]` in the commit description.

The data must have an array, with key `messages`, of 'subcommit' objects. The subcommit objects must contain a key `messageTitle`, which is the message title to add to the changelog section, and optionally contain a key `messageBody`, which can be used to place the commit in a Category and/or Sub Category, further expansion, and/or to add details to the commit.

The presence of this key prevents any further parsing of the original commit body, although the commit body in each 'subcommit' object will be parsed.

The syntax is in [TOML](https://toml.io/en/). It is highly recommended you check the syntax [here](https://www.toml-lint.com/) first.

Below is an example of a valid commit body, and its output.

**Commit Body:**
```toml
- Rids QB Again!
- Bears
& more!

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

/* Commits: */
* Thyme to leave.
* Stop Reading this
* GReAt
* Article
```

**Output (Snipped from Changelog, with Commit Authors and SHAs removed):**
```markdown
## Feature Additions:
### Quality Of Life:
* Done. OR IS IT????

### Hard Mode:
* Bears.
    * Five Teddies
    * Two Bears
        * BEARS WILL INVADE NOMI!
            * BEARS WILL INVADE NOMI!

## Quest Book Changes:
### Both Modes:
* Rids QB. AGAIN!!!!

### Hard Mode:
* Nothing. At least I no longer hate this.
```

As seen, there can also be text before and after this. It is recommended to have a 'human readable version' above.

Here are some notes:
- `[EXPAND]` which are before the ending key must be indented. 
- The `[EXPAND]` surrounding the data must be without indents.
- For every layer (such as the three layer details in the subcommit `Bears.`), an extra backslash is needed before the double quotes.
- You cannot include the Skip Key anywhere, else this commit will not be parsed!
- Every other key can be included in the subcommits.
- Including other commit keys in the base commit body will do nothing.
- A No Category key in a subcommit will act like a `[SKIP]` for that subcommit, as these subcommits are not added to the changelog commit list
- The base commit would still be added to the changelog commit list.

<hr>

###### Details Key
Key: `[DETAILS]`

This key adds indented details beneath your commit.

The messages are stored between two `[DETAILS]`. These must surround it, with nothing else in them. The key at the beginning must be the first appearance of `[DETAILS]` in the commit description.

The data must have an array, with key `details`, of strings, which contain the details.

You can have multiple layers!

The syntax is in [TOML](https://toml.io/en/). It is highly recommended you check the syntax [here](https://www.toml-lint.com/) first.

Below is an example of a valid commit body, and its output.

**Commit Body:**
```toml
[FEATURE]
[HM]

- Five Teddies
- Two Bears
  - BEARS WILL INVADE
    - NOMI
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

**Output (Snipped from Changelog, with Commit Authors and SHAs removed):**
```markdown
## Feature Additions:
### Hard Mode:
* Bears.
    * Five Teddies
    * Two Bears
        * BEARS WILL INVADE NOMI!
            * BEARS WILL INVADE NOMI!
```

As seen, there can also be text before and after this. It is recommended to have a 'human readable version' above.

Here are some notes:
- `[DETAILS]` which are before the ending key must be indented.
- The `[DETAILS]` surrounding the data must be without indents.
- To add multiple layers, you simply have a multiline message, containing `[DETAILS]`, and details data stored in TOML.
- For every layer, an extra backslash is needed before the double quotes.
- You cannot include the Skip Key anywhere, else this commit will not be parsed!
- A No Category key in this commit will not do anything.
- The commit, and its subcommits, are placed in the changelog in accordance with commit keys in the commit body. If none are set, there are placed according to the defaults.

<hr>

###### No Category Key
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
</tr>

<tr>
<td><code>[PERFORMANCE]</code></td>
<td>Performance Improvements</td>
<td>N/A</td>
<td>N/A</td>
</tr>

<tr>
<td><code>[FEATURE]</code></td>
<td>Feature Additions</td>
<td>Both Modes</td>
<td>
<ul>
<li><code>[QOL]</code>, Quality Of Life</li>
<li><code>[NM]</code>, Normal Mode</li>
<li><code>[HM]</code>, Hard Mode</li>
</ul>
</td>
</tr>

<tr>
<td><code>[QB]</code></td>
<td>Quest Book Changes</td>
<td>Both Modes</td>
<td>
<ul>
<li><code>[NM]</code>, Normal Mode</li>
<li><code>[HM]</code>, Hard Mode</li>
</ul>
</td>
</tr>

<tr>
<td><code>[BUG]</code></td>
<td>Bug Fixes</td>
<td>Both Modes</td>
<td>
<ul>
<li><code>[NM]</code>, Normal Mode</li>
<li><code>[HM]</code>, Hard Mode</li>
</ul>
</td>
</tr>

<tr>
<td><code>[GENERAL]</code></td>
<td>General Changes</td>
<td>N/A (Mod Changes Sub Categories are parsed separately)</td>
<td>N/A</td>
</tr>

<tr>
<td><code>[INTERNAL]</code></td>
<td>Internal Changes</td>
<td>N/A</td>
<td>N/A</td>
</tr>
</table>

### 6.3: Create Release Commit
This workflow allows for streamlined, worry free and consistent release commits. These commits split up the commit logs nicely, and change relevant parts, such as window titles (in Random Patches Config) and Issue Templates to the new version.

This workflow does not run automatically.

This workflow uploads no artifacts.

When run, the options are (excluding the [branch selection](#activating-the-workflow-on-another-branch) available to all workflows):

<table>
<tr>
<th>Name</th>
<th>Description</th>
<th>Optional?</th>
</tr>

<tr>
<td align="center">Release Version</td>
<td>Will be added to the Issue Templates dropdown, and used to replace all version fields. (aka 1.6.1a, 1.6.1-beta-3, 1.7.3-alpha-5, 1.8, etc.). See version numbering below. This is also the name of the tag generated.</td>
<td align="center">No</td>
</tr>

<tr>
<td align="center">Release Type</td>
<td>Must be one of <code>Release</code>, <code>Beta Release</code> or <code>Alpha Release</code>. Will be ignored if not a release.</td>
<td align="center">No</td>
</tr>

<tr>
<td align="center">Not Release?</td>
<td>Whether this run is not a release. If the checkbox is selected, then the version above should be the newest current version, and checks for similar version will not be conducted. Furthermore, the commit will not have a tag. Used to update the actual files from changes in the templates. <b>Note that this input is reversed! Checking it will make the commit NOT a release!</b></td>
<td align="center">Yes</td>
</tr>

</table>


#### Version Numbering
Nomi-CEu uses a sequential numbering system, although the numbering system for alphas and betas are slightly different.

*Releases:*   
`<major>.<minor>.<patch> <emergency-fix>`

Major versions are only changed when an extremely big release occurs. This is pretty much never changed. This is a number.

Minor versions are changed every big release. This is a number.

Patches are fixes between each big release. This is a number.

Emergency fixes occur when a patch needs to be removed, due to an extremely large problem. These are letters, starting from `a`.

For example:   
`1.6 -> 1.6.1 -> 1.6.1a -> 1.7 -> 1.7.1 -> 1.7.2 -> 1.8 -> ...`

*Alphas & Betas:*   
`<incoming-release>-<status>-<pre-num> <emergency-fix>`

The incoming release is the next release, that this beta puts out to test.

The status is either `alpha` or `beta`, dependent on how stable the release is.

The pre-num is a number that increases with each alpha/beta for a certain release. This is a number, starting from `1`.

Emergency fixes occur when a alpha/beta needs to be removed, due to an extremely large problem. These are letters, starting from `a`.

For example:   
`1.6 -> 1.6.1-alpha-1 -> 1.6.1-beta-2 -> 1.6.1-beta-3 -> 1.6.1-beta-4 -> 1.6.1 -> 1.6.1a -> 1.7-beta-1 -> ...`

### 6.4: Deploy to GitHub Releases and CurseForge
This workflow allows for a streamlined, fast and reliable way to deploy a release to both GitHub Releases and CurseForge.

This workflow does not run automatically.

This workflow uploads all three built zips (client, server & lang) as an artifact.

When run, the options are (excluding the [branch selection](#activating-the-workflow-on-another-branch) available to all workflows):

<table>
<tr>
<th>Name</th>
<th>Description</th>
<th>Optional?</th>
</tr>

<tr>
<td align="center">Tag</td>
<td>The tag to checkout. This will be the newest commit parsed for the changelog, if one is generated. This will also be the version number used for the release. The TypeScript files will also be used from this tag.</td>
<td align="center">No</td>
</tr>

<tr>
<td align="center">Release Type</td>
<td>Must be one of <code>Release</code>, <code>Beta Release</code> or <code>Alpha Release</code>.</td>
<td align="center">No</td>
</tr>

<tr>
<td align="center">Changelog URL</td>
<td>Where to download the Changelog File from. This must be a link to a file. (Raw file if hosted on GitHub). For this to be used, the <code>Changelog CF URL</code> input must also be filled in!</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Changelog CF URL</td>
<td>Where to download the CF Changelog File from. This must be a link to a file. (Raw file if hosted on GitHub). For this to be used, the <code>Changelog URL</code> input must also be filled in!</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Changelog Branch</td>
<td>Nomi-CEu branch to download the CF Changelog File from. On that branch, there must be <code>CHANGELOG.md</code> and <code>CHANGELOG_CF.md</code> in the root directory.</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Compare Tag</td>
<td>The tag to compare to, when generating a changelog. This is only used, and a new changelog only generated, if all of the above three inputs are not filled in!</td>
<td align="center">Yes</td>
</tr>
</table>

- The workflow generates a changelog, based on the tag and the compare tag, if the Changelog/Changelog CF URLs and the Changelog Branch inputs are not filled in.
- The Changelog Branch input is usually more convenient than the branch input, but the URL inputs are useful when testing in a fork, or the branch input is not working.
- The Changelog / Changelog CF URLs have a higher priority than the Changelog branch, if both inputs are filled in.
- The Changelog Branch input is intended for use with the [create changelog](#62-create-changelog) workflow's branch input.
- For more information about changelogs, see the [create changelog documentation](#62-create-changelog).

### 6.5: Build Pack
This workflow builds the pack, without having to worry about setting environment variables. Useful to make a `Cutting Edge Build`. Usually just used as a step in other workflows.

This workflow does not run automatically.

This workflow uploads all three built zips (client, server & lang) as an artifact.

When run, the options are (excluding the [branch selection](#activating-the-workflow-on-another-branch) available to all workflows):
<table>
<tr>
<td align="center">Tag</td>
<td>The tag to checkout. This will be the newest commit parsed for the changelog, if one is generated. This will also be the version number used for the release. The TypeScript files will also be used from this tag. If not provided, will just build <code>HEAD</code>.</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Release Type</td>
<td>Must be one of <code>Release</code>, <code>Beta Release</code>, <code>Alpha Release</code> or <code>Cutting Edge Build</code>.</td>
<td align="center">No</td>
</tr>

<tr>
<td align="center">Changelog URL</td>
<td>Where to download the Changelog File from. This must be a link to a file. (Raw file if hosted on GitHub). For this to be used, the <code>Changelog CF URL</code> input must also be filled in!</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Changelog CF URL</td>
<td>Where to download the CF Changelog File from. This must be a link to a file. (Raw file if hosted on GitHub). For this to be used, the <code>Changelog URL</code> input must also be filled in!</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Changelog Branch</td>
<td>Nomi-CEu branch to download the CF Changelog File from. On that branch, there must be <code>CHANGELOG.md</code> and <code>CHANGELOG_CF.md</code> in the root directory.</td>
<td align="center">Yes</td>
</tr>

<tr>
<td align="center">Compare Tag</td>
<td>The tag to compare to, when generating a changelog. This is only used, and a new changelog only generated, if all of the above three inputs are not filled in!</td>
<td align="center">Yes</td>
</tr>
</table>

For cutting edge builds, all of the inputs can be ignored, apart from changing the `Release Type` to `Cutting Edge Build`.

When building a cutting edge build, the changelog title will not contain the default `<release-type> <tag>`, but will contain `Cutting Edge Build <time-date>`.

**The Cutting Edge Build Release Type is only available for this workflow, and for the [create changelog workflow](#62-create-changelog)! It is not available for any other deploy or release related workflow!**

[//]: # (TEMPLATE)
<tr>
<td align="center"></td>
<td></td>
<td align="center"></td>
</tr>

### 6.6: Create Release Commit & Changelog
This workflow combines the [create release commit workflow] and the [create changelog workflow]. Because the create changelog workflow is usually

### 6.7: Release Commit & Deploy


### 6.8: Update Quest Book Jsons and Lang
This workflow updates the QB Jsons, and the english lang, every time a commit is pushed to main, which changes one, or both, of the [Development Json Files](#22-development-json-files).

This is done automatically, although you can also run it manually, if something is out of date, for some reason. Calling the workflow has no additional inputs. (Apart from the [branch selection](#activating-the-workflow-on-another-branch), present in all workflows.)

When running automatically, if you want the QB Transform Workflow to run on a branch, that isn't `main`, prefix the branch with `test_buildscript`.

This workflow is disabled, both when running automatically, and manually, on forks of this repository.

If you want the QB Transform Workflow to run on your fork, remove or comment out `if: "${{ github.repository_owner == 'Nomi-CEu' }}"` in `/.github/workflows/updateqb.yml` (in your fork)

### 6.9: Un-Callable Workflows
Workflows that have their name prefixed with `[NOT CALLABLE]` are not callable. They are used as steps for other workflows.

### 6.10: Typical Usage
**Releases:**

**Alpha & Beta Releases:**

**'Cutting Edge' Builds:**

## Section 7: Misc Information

