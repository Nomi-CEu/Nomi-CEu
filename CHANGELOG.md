<h1 align="center"><a href="https://github.com/Nomi-CEu/Nomi-CEu/releases/tag/1.7.6"><img src="https://raw.githubusercontent.com/Nomi-CEu/Branding/main/Nomi%20CEu/Releases/1.7.6/1.7.6.png" alt="Release 1.7.5"></a></h1>

<p align="center"><b>🎄 The Christmas Release 🎄</b></p>

<p align="center"><em>Featuring: TOP revamp, and many new QoL features, balancing changes, performance improvements and bug fixes!</em></p>

<hr>

## Warning

**Please DO NOT revert any saves that have been loaded in this release to 1.7-beta-5c, 1.6.1b, 1.6.1a, or prior!**

<hr>

**See the [Full Changelog](https://github.com/Nomi-CEu/Branding/blob/main/Nomi%20CEu/Releases/1.7.6/FULL_CHANGELOG.md) for all changes!**

<hr>

# Major Changes Since 1.7.5

## Breaking Changes:
* Change All Extended Crafting Recipes to 'Strict' ([#1394](https://github.com/Nomi-CEu/Nomi-CEu/pull/1394)) - @IntegerLimit ([`9425288`](https://github.com/Nomi-CEu/Nomi-CEu/commit/94252885db91ce80e277e85205e868d10f9e88e3))
  * Large table recipes (5x5, 7x7, 9x9) now MUST be performed in the table of the exact tier!
  * E.g., you can no longer do Elite recipes in an Ultimate table!

## Balancing Changes:
### Both Modes:
* Wireless AE2 Rebalance ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
  * Makes Beam Formers *much* cheaper; moving them to be just a little more expensive than cables
  * Moves AE2 Stuff Wireless Connectors from mid EV to early HV, acting as a progression point between Beam Formers and Quantum Rings
* Rebalance Netherrack + Endstone Dust Processing ([#1384](https://github.com/Nomi-CEu/Nomi-CEu/pull/1384)) - @IntegerLimit ([`e4a3a0e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/e4a3a0e7ce4fde3e64142e878b62717fc0da4ca8))
  * Adds Lava to Netherrack Dust Centrifuging
  * Adds Enderpearl Dust to Endstone Maceration
  * **HM Only** Changes Tier of Endstone Dust Centrifuging from EV to IV
* ...and more!

### Hard Mode:
* **Change Byproduct of Snowchestite from Chalcopyrite to Caesium** ([#1382](https://github.com/Nomi-CEu/Nomi-CEu/pull/1382)) - @IntegerLimit ([`b205562`](https://github.com/Nomi-CEu/Nomi-CEu/commit/b2055628c6d4374e1030a2ee479348ce627bf639))
  * Snowchestite line is now **caesium positive** instead of being a caesium sink!
* Tweak AE2 Early Progression ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
  * Makes Charger require Black Steel, and moves Crystal Growth Chamber from Blue Steel to Black Steel
  * Moves AE2 a little earlier, and reduces confusion as to how AE2 is gated
* Move AE2 Fluid Storage Components from EV to HV ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))

## Performance Improvements:
* Chanced Output Performance Improvements ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Massively improves performance of chanced output calculations at high parallels
* ...and more!

## Feature Additions:
### Quality of Life:
* **Add Universal Circuits** ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Adds general circuits representing any circuit of that voltage
  * Automatically prioritized in pattern importing from JEI, as they are extremely useful for AE2 patterning
* **Allow skipping non-consumable items when filling patterns from JEI** ([#1375](https://github.com/Nomi-CEu/Nomi-CEu/pull/1375)) - @IntegerLimit ([`8f2488f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8f2488f9afeef23f6c0c01a4a188469fa0dfd012))
* ...and more!

### Both Modes:
* **TOP Improvements** ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Adds icons displaying locked and voiding status of various containers
  * Improve display of creative containers
  * Improve consistency of Storage Drawers info
  * Improve consistency of AE2 info
  * Various other polish changes and bugfixes
* AE2 Improvements ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366), [#1387](https://github.com/Nomi-CEu/Nomi-CEu/pull/1387)) - @IntegerLimit ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6), [`5271edc`](https://github.com/Nomi-CEu/Nomi-CEu/commit/5271edc816737f84ba2c210e74b695b30f91f55f))
  * **Craft Overview Sorting:** Placing missing items first, then items to craft, then present items
  * Information about connection status of Quantum Link Chambers in TOP
  * Advanced Memory Card mode improvements
    * Add as Input/Output modes now work across P2P types, auto-converting the selected P2P to the bind target's type, and allows binding to unbound P2Ps
    * 'Bind As' modes now guarantee a new seperate P2P network is created
* Add AE2 Crafting Tree ([#1356](https://github.com/Nomi-CEu/Nomi-CEu/pull/1356)) - @IntegerLimit ([`aa064e1`](https://github.com/Nomi-CEu/Nomi-CEu/commit/aa064e13395e0b60cfcf685138e2fad91497a2c0))
  * Allows for very nice viewing of AE2 crafts
  * Allows for easier debugging of complex crafts
* **Allow Airtight Seal on GT Armors** ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* Quantum Storage Improvements ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Allows Quantum Chests to be locked
  * Displays locked status in world rendering and when in inventory
* ...and more!

## Bug Fixes:
### Both Modes:
* Fix Various AE2 Bugs ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366)) - @IntegerLimit ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6))
  * **Fixes Cross Dimension Energy P2Ps not functioning properly after world load**
  * Fixes Encoded Patterns outputting certain items not rendering correctly
  * Fixes Issues when Right Clicking Adv Memory Card Mode Button
  * Fixes Incorrect Items being allowed in Quantum Link Card slot
* **Fix Crystal Seed Pattern Importing** ([#1370](https://github.com/Nomi-CEu/Nomi-CEu/pull/1370)) - @IntegerLimit ([`943190f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/943190f1a39ddd72b6d285c3f0a469e3e8f78e1c))
  * Fixes NBT Issues
  * Adds a JEI Page for Crystal Growth Chamber Recipes
* **Fix Crash on Cleanroom 0.3.3+** ([#1363](https://github.com/Nomi-CEu/Nomi-CEu/pull/1363)) - @IntegerLimit ([`c83250b`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c83250b2873eceb323dc343850a25f2ba5b746e4))
* ...and more!

### Hard Mode:
* Remove Enchanting Books from Airtight Seal Recipes ([#1464](https://github.com/Nomi-CEu/Nomi-CEu/pull/1464)) - @IntegerLimit ([`bae6186`](https://github.com/Nomi-CEu/Nomi-CEu/commit/bae6186d70ee80f64598d6ea963f14b94df769e7))

## General Changes:
### Just Enough Items:
* JEI Updates ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366), [#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot], @IntegerLimit ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76), [`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6))
  * Adds many new features, including recipe favouriting, better recipe bookmarks, and batch chain crafting within JEI (autocrafting)
  * Custom ItemStack Count Renderer, improving display of item stacks in JEI above 100
  * General Performance Improvements
* ...and more!

## Addon Support Changes:
* Fix Flux Networks' Flux Controller Recipe ([#1413](https://github.com/Nomi-CEu/Nomi-CEu/pull/1413)) - @MasterKogha ([`11406c9`](https://github.com/Nomi-CEu/Nomi-CEu/commit/11406c932f5692a02d149ee045faed2ceea5a46d))
* Fix ZBGT Circuit Assembly and CoAL Recipes ([#1385](https://github.com/Nomi-CEu/Nomi-CEu/pull/1385)) - @kyoumei-kyouki, @IntegerLimit ([`c437917`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c4379175b45db2cdb0d75e218bcfc57369bcacf3), [`214d808`](https://github.com/Nomi-CEu/Nomi-CEu/commit/214d808ff606ef6e4494bd84ebd4dedc6438ddd4))
  * Fixed circuit unwrap recipes giving 16 circuit outputs; they take 1 circuit input
  * Fix ULV Cover and Field Generator recipes in CoAL
  * Fix Circuit Assembly Line recipesnot confuse new players)*
* AE2 Fluid Crafting Rebalance ([#1352](https://github.com/Nomi-CEu/Nomi-CEu/pull/1352), [#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @Mazlaci, @IntegerLimit ([`c693745`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c69374558bef7872672f4ae9ca125838e966c844), [`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
  * Gates AE2 Fluid Crafting to HV in Normal Mode, and EV in Hard Mode
  * Thematic Changes to Recipe for Fluid Assembler
  * Rebalanced Extended Fluid Pattern Terminal and Ultimate Encoder, now needs PAuto's Package Recipe Encoder to craft, similar to its vanilla AE2 counterparts
  * Rebalanced Fluid Level Maintainer, now is unlocked similarly to LazyAE2
* ...and more!

**See the [Full Changelog](https://github.com/Nomi-CEu/Branding/blob/main/Nomi%20CEu/Releases/1.7.6/FULL_CHANGELOG.md) for more exciting changes!**
