<h1 {{{ CENTER_ALIGN }}}>Release 1.7.1</h1>

{{{ CF_REDIRECT }}}

# Changes Since 1.7a

## Balancing Changes:
### Both Modes:
* Alternative Hull Recipes with Higher Tier Plastics ([#1027](https://github.com/Nomi-CEu/Nomi-CEu/pull/1027)) - @IntegerLimit ([`38030cf`](https://github.com/Nomi-CEu/Nomi-CEu/commit/38030cfb5e238b1451025420e6cbcbcc7ec8c40b))
* Alternative Lubricant Recipes ([#1030](https://github.com/Nomi-CEu/Nomi-CEu/pull/1030)) - @IntegerLimit ([`c7f47ba`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c7f47ba3e288b4ac58d4ae43b771a4e0a828aebc))
  * Raw Oil: 2B Input, 1B Output
  * Light Oil: 1B Input, 500mB Output
  * Heavy Oil: 1B Input, 4B Output
* Alternative ULV Covers Recipes ([#1026](https://github.com/Nomi-CEu/Nomi-CEu/pull/1026)) - @IntegerLimit ([`9a4f77c`](https://github.com/Nomi-CEu/Nomi-CEu/commit/9a4f77cda5331f9b0fc7a66abade9e374ca5ac15))
  * Allows Using Higher Tiers of Rubber, and the Assembler.

### Hard Mode:
* Fix Potassium Duplication in PGS EBF Step ([#1036](https://github.com/Nomi-CEu/Nomi-CEu/pull/1036)) - @v3ect0rgames ([`9087ef2`](https://github.com/Nomi-CEu/Nomi-CEu/commit/9087ef2b6204158f68c91c3f9e9d6f0502ccbd43))
  * Potassium Sulfate Output Reduced: 14 -> 7
  * Sulfur Trioxide (1 Bucket) Added to Fluid Outputs

## Performance Improvements:
* Update HEI to 4.26.0 ([#1040](https://github.com/Nomi-CEu/Nomi-CEu/pull/1040)) - @v3ect0rgames ([`94db384`](https://github.com/Nomi-CEu/Nomi-CEu/commit/94db384f7808d1658cee6362987f5adbe7deb474))
  * Saves Time when Loading and Reloading JEI
* Update CraftPresence to v2.5.0 ([#1015](https://github.com/Nomi-CEu/Nomi-CEu/pull/1015)) - @IntegerLimit ([`239aed7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e))
  * Saves ~300MB of Memory on Main Menu
* Update Alfheim Lighting Engine to 1.4 ([#1016](https://github.com/Nomi-CEu/Nomi-CEu/pull/1016)) - @IntegerLimit ([`8ade7ce`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8ade7ceed3f5101e29f951e00f8cedfbb7b4051f))

## Feature Additions:
### Both Modes:
* Advanced Rocketry Tank Improvements ([#1041](https://github.com/Nomi-CEu/Nomi-CEu/pull/1041)) - @IntegerLimit ([`dc7c2fd`](https://github.com/Nomi-CEu/Nomi-CEu/commit/dc7c2fdccdb9ec40f1ef593b0ee8490ff0ee6a3f))
  * Fixes [#276](https://github.com/Nomi-CEu/Nomi-CEu/issues/276)
  * Removed from JEI
* Content Clearing Recipes ([#1035](https://github.com/Nomi-CEu/Nomi-CEu/pull/1035)) - @IntegerLimit ([`478ad65`](https://github.com/Nomi-CEu/Nomi-CEu/commit/478ad65a95838a700231990b9f3f2f57d3d4f371))
  * **Allows Clearing Of:**
  * Buckets (Water, Lava, Forge)
  * Minecraft Shulker Boxes
  * GregTech Crates
  * NuclearCraft Non-Active Coolers
  * Drawers (Wooden, GregTech, Framed, Framed Compacted)
    * Upgrades are NOT Cleared!
  * Thermal Portable Tanks
  * **Adds Tooltip Notifying Clearing Ability For:**
  * GregTech Super/Quantum Chests/Tanks
  * GregTech Drums
  * EnderIO Portable Tanks
* Allows Removal of CraftPresence Without Script Error ([#1015](https://github.com/Nomi-CEu/Nomi-CEu/pull/1015)) - @IntegerLimit ([`239aed7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e))

## Quest Book Changes:
### Both Modes:
* Fix Typo in Fusion Reactor MK I Quest ([#1046](https://github.com/Nomi-CEu/Nomi-CEu/pull/1046)) - @IntegerLimit ([`249e531`](https://github.com/Nomi-CEu/Nomi-CEu/commit/249e53184552a8cc6411b881f5b4b13fa9e2b330))
* Misc Quest Fixes and Cleanup ([#1043](https://github.com/Nomi-CEu/Nomi-CEu/pull/1043)) - @IntegerLimit ([`7617c08`](https://github.com/Nomi-CEu/Nomi-CEu/commit/7617c08a1c26f6459e73833b1267b0178fad1955))
  * Cleans Up Platinum Group Processing quest, Allow Using Tier Three Micro Miner for Initial Ruthenium
  * Improvement in Air Distillation Quests
    * Adds Nitrogen and Basic Air Collection Quests to The Beginning
    * Removes Nitrogen from Mid Game
    * Deletes Air Centrifuging Quest
  * General Improvement in Clarity of Quests
  * Cleanup of The Beginning and Mid Game Lines
* Cleanup of Quest Book Layout ([#1038](https://github.com/Nomi-CEu/Nomi-CEu/pull/1038)) - @IntegerLimit ([`820e19f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/820e19fda108695feb2ef1e65578258941b0e90e))
* Misc Questbook Fixes and Improvements ([#1007](https://github.com/Nomi-CEu/Nomi-CEu/pull/1007)) - @smallming675 ([`454f3c5`](https://github.com/Nomi-CEu/Nomi-CEu/commit/454f3c5f30fa3bfc6fa48382b7f09b70275d1585))
* Fix Misspelling of Neodymium in EV Hull Quest ([#999](https://github.com/Nomi-CEu/Nomi-CEu/pull/999)) - @smallming675 ([`e8e7f5d`](https://github.com/Nomi-CEu/Nomi-CEu/commit/e8e7f5db82219a38277df5ada34e7100cf61c8e0))
* Fix Typo in First Micro Miner Quest ([#986](https://github.com/Nomi-CEu/Nomi-CEu/pull/986)) - @IntegerLimit ([`4836a20`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4836a20cdec9e673f5306d29bac95be52f2fda1c))

### Hard Mode:
* Add T4.5MM as a Dependency to Soul Binder Quest ([#1002](https://github.com/Nomi-CEu/Nomi-CEu/pull/1002)) - @smallming675 ([`66ab026`](https://github.com/Nomi-CEu/Nomi-CEu/commit/66ab026952fa931893ffd24e96bea9ed3415de36))

## Bug Fixes:
### Both Modes:
* Fix Airtight Seal Recipes ([#1042](https://github.com/Nomi-CEu/Nomi-CEu/pull/1042)) - @IntegerLimit ([`5cfea1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/5cfea1f4a3486f93c45fe50c0f0d705cb2ae09ba))
* Update HEI to 4.26.0 ([#1040](https://github.com/Nomi-CEu/Nomi-CEu/pull/1040)) - @v3ect0rgames ([`94db384`](https://github.com/Nomi-CEu/Nomi-CEu/commit/94db384f7808d1658cee6362987f5adbe7deb474))
  * Fixes Issues with Tooltip Search
* Fix GregTech Facades' Tooltip ([#1039](https://github.com/Nomi-CEu/Nomi-CEu/pull/1039)) - @IntegerLimit ([`4d14183`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4d14183e8161488909bae9bb20118e033de9ac8c))
* Fix Transmutating Airtight Seal Recipe ([#1029](https://github.com/Nomi-CEu/Nomi-CEu/pull/1029)) - @IntegerLimit ([`716c957`](https://github.com/Nomi-CEu/Nomi-CEu/commit/716c957b4c41b0a88e64e41977cd845843d76ff6))
  * Caused by Adding Other Mods
* Update Nomi Labs to v0.9 ([#1028](https://github.com/Nomi-CEu/Nomi-CEu/pull/1028)) - @IntegerLimit ([`679a67c`](https://github.com/Nomi-CEu/Nomi-CEu/commit/679a67cd6faa5030007f180dc05001f8ef2927ef))
  * Fixes Disappearing Covers on Pipes ([#987](https://github.com/Nomi-CEu/Nomi-CEu/issues/987))
  * Fixes Cleanroom Loader Incompatibility ([#993](https://github.com/Nomi-CEu/Nomi-CEu/issues/993))
  * Makes Scrolling P2Ps Respect Direction
  * Fixes Drawer Keys on Empty Drawers
* Fix ME Conduit Recipe ([#1025](https://github.com/Nomi-CEu/Nomi-CEu/pull/1025)) - @IntegerLimit ([`2ca3f3d`](https://github.com/Nomi-CEu/Nomi-CEu/commit/2ca3f3d0e0e129a9f27c443713d3eee72b0742ec))
* Fix Hand Framing Display Recipes ([#1024](https://github.com/Nomi-CEu/Nomi-CEu/pull/1024)) - @IntegerLimit ([`7ebb0eb`](https://github.com/Nomi-CEu/Nomi-CEu/commit/7ebb0ebe33fb79648290969e86e3ba9148151cee))
* Fix NBT Problems in Pure Crystal Shortcut Recipes ([#1014](https://github.com/Nomi-CEu/Nomi-CEu/pull/1014)) - @IntegerLimit ([`4afba84`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4afba84af3d80aae3ad4555b9177dc0ca5c20938))
  * Fixes [#1010](https://github.com/Nomi-CEu/Nomi-CEu/issues/1010)
* Fix Issues with Searching Tooltips in JEI ([#992](https://github.com/Nomi-CEu/Nomi-CEu/pull/992)) - @IntegerLimit ([`ace16a5`](https://github.com/Nomi-CEu/Nomi-CEu/commit/ace16a5dda9119553c7bd537b536e72a84670f3c))
* Fix Duplicate and Wrong AE2 Tooltips ([#983](https://github.com/Nomi-CEu/Nomi-CEu/pull/983)) - @v3ect0rgames ([`9044203`](https://github.com/Nomi-CEu/Nomi-CEu/commit/9044203dd41835382cc423a430bb02b3178b784e))

## General Changes:
### Mod Updates:
* Alfheim Lighting Engine: *v1.1.1 ⇥ v1.4* - @IntegerLimit ([`8ade7ce`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8ade7ceed3f5101e29f951e00f8cedfbb7b4051f))
* CraftPresence: *v2.3.5 ⇥ v2.5.0* - @IntegerLimit ([`239aed7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e))
* Had Enough Items: *v4.25.4 ⇥ v4.26.0* - @v3ect0rgames ([`94db384`](https://github.com/Nomi-CEu/Nomi-CEu/commit/94db384f7808d1658cee6362987f5adbe7deb474))
* Nomi Labs: *v0.8.20 ⇥ v0.9.4* - @IntegerLimit ([`dc7c2fd`](https://github.com/Nomi-CEu/Nomi-CEu/commit/dc7c2fdccdb9ec40f1ef593b0ee8490ff0ee6a3f), [`478ad65`](https://github.com/Nomi-CEu/Nomi-CEu/commit/478ad65a95838a700231990b9f3f2f57d3d4f371), [`5b12055`](https://github.com/Nomi-CEu/Nomi-CEu/commit/5b12055e6977450b1ef39ea2e65a189279c6c775), ...)

### Mod Additions:
* UniLib: *v1.0.2* - @IntegerLimit ([`239aed7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e))

## Internal Changes:
* Properly Signal Async Completion with Streams ([#1022](https://github.com/Nomi-CEu/Nomi-CEu/pull/1022)) - @IntegerLimit ([`3b742f4`](https://github.com/Nomi-CEu/Nomi-CEu/commit/3b742f4ddfdf46d7a47d18ca58777962d1f61cc7))
* Use Faster Hashing Library ([#1021](https://github.com/Nomi-CEu/Nomi-CEu/pull/1021)) - @IntegerLimit ([`6baff4e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/6baff4e57a7bd46d848e0fb2965fad26236ed1d8))
* Fix Lang Zips & Cleanup `pack.mcmeta` - @IntegerLimit ([`8388e12`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8388e12cc633d09fc4c952fd757e15503fb47857))
* Make Fork PR Build Only Run on Certain PRs ([#1018](https://github.com/Nomi-CEu/Nomi-CEu/pull/1018)) - @IntegerLimit ([`da5ebbb`](https://github.com/Nomi-CEu/Nomi-CEu/commit/da5ebbb304c67ff467720eea1ba825090e3210e3))


**Full Changelog**: [`1.7a...1.7.1`](https://github.com/Nomi-CEu/Nomi-CEu/compare/1.7a...1.7.1)