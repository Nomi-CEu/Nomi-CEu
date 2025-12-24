<h1 {{{ CENTER_ALIGN }}}>Release 1.7.6</h1>

{{{ CF_REDIRECT }}}

# Changes Since 1.7.5

## Breaking Changes:
* Change All Extended Crafting Recipes to 'Strict' ([#1394](https://github.com/Nomi-CEu/Nomi-CEu/pull/1394)) - @IntegerLimit ([`9425288`](https://github.com/Nomi-CEu/Nomi-CEu/commit/94252885db91ce80e277e85205e868d10f9e88e3))
  * Large table recipes (5x5, 7x7, 9x9) now MUST be performed in the table of the exact tier!
  * E.g., you can no longer do Elite recipes in an Ultimate table!

## Balancing Changes:
### Both Modes:
* Wireless AE2 Rebalance ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
  * Makes Beam Formers *much* cheaper; moving them to be just a little more expensive than cables
  * Moves AE2 Stuff Wireless Connectors from mid EV to early HV, acting as a progression point between Beam Formers and Quantum Rings
* Earlier Network Visualisation Tool Recipe ([#1410](https://github.com/Nomi-CEu/Nomi-CEu/pull/1410)) - @D-Alessian ([`1aab09f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/1aab09f3067d769d313309e88c89b2e6d2aae897))
* Add Treated Wood Recipes for Coated Circuit Board ([#1409](https://github.com/Nomi-CEu/Nomi-CEu/pull/1409)) - @IntegerLimit ([`bd7a014`](https://github.com/Nomi-CEu/Nomi-CEu/commit/bd7a0147c2f64ea5b2c8f4948c1964517088c315))
  * New Treated Wood Plank/Plate crafting recipe, 2x yield over normal wood
  * Changed assembler recipe for Coated Circuit Board with 2x yield
  * New Treated Wood Plate assembler recipe; 1 plate + 100mb glue for 4 boards
* Rebalance Netherrack + Endstone Dust Processing ([#1384](https://github.com/Nomi-CEu/Nomi-CEu/pull/1384)) - @IntegerLimit ([`e4a3a0e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/e4a3a0e7ce4fde3e64142e878b62717fc0da4ca8))
  * Adds Lava to Netherrack Dust Centrifuging
  * Adds Enderpearl Dust to Endstone Maceration
  * **HM Only** Changes Tier of Endstone Dust Centrifuging from EV to IV
* Buff Cell Recipe Outputs by 4x ([#1376](https://github.com/Nomi-CEu/Nomi-CEu/pull/1376)) - @IntegerLimit ([`00bb42f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/00bb42fb61754d545f217eb3bf0cb7a790a71b01))
* Nerf Outputs of ME Conduit Recipes ([#1371](https://github.com/Nomi-CEu/Nomi-CEu/pull/1371)) - @IntegerLimit ([`4344332`](https://github.com/Nomi-CEu/Nomi-CEu/commit/434433208cef84684f77e437e6ca060c715374d6))
* Balancing Changes to AE2FC (Addon) ([#1352](https://github.com/Nomi-CEu/Nomi-CEu/pull/1352)) - @Mazlaci ([`c693745`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c69374558bef7872672f4ae9ca125838e966c844))
  * Rebalanced Extended Fluid Pattern Terminal and Ultimate Encoder, now needs PAuto
  * Thematic Changes to Recipe for Fluid Assembler
  * Rebalanced Fluid Level Maintainer, now is unlocked similarly to LazyAE2
* Buff Recipes for Red Alloy with Annealed Copper ([#1345](https://github.com/Nomi-CEu/Nomi-CEu/pull/1345)) - @IntegerLimit ([`5d5e424`](https://github.com/Nomi-CEu/Nomi-CEu/commit/5d5e4243cebcd277787cdf746898b20e05d5e92c))
  * Annealed Copper Recipes now take Less Redstone per Craft

### Hard Mode:
* Change Byproduct of Snowchestite from Chalcopyrite to Caesium ([#1382](https://github.com/Nomi-CEu/Nomi-CEu/pull/1382)) - @IntegerLimit ([`b205562`](https://github.com/Nomi-CEu/Nomi-CEu/commit/b2055628c6d4374e1030a2ee479348ce627bf639))
* Move AE2 Fluid Storage Components from EV to HV ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
* Tweak AE2 Early Progression ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
  * Makes Charger require Black Steel, and moves Crystal Growth Chamber from Blue Steel to Black Steel
  * Moves AE2 a little earlier, and reduces confusion as to how AE2 is gated

## Performance Improvements:
* Fix Edge Case EU P2P Performance Issues ([#1452](https://github.com/Nomi-CEu/Nomi-CEu/pull/1452)) - @nomi-ceu-management[bot] ([`fefb329`](https://github.com/Nomi-CEu/Nomi-CEu/commit/fefb329810994d98104b32103de444f5bbfae551))
* Chanced Output Performance Improvements ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Massively improves performance of chanced output calculations at high parallels
* Disable Muffler Hatches for Performance ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Muffler hatch behaviours and interactions are disabled

## Feature Additions:
### Quality of Life:
* Add Wireless Hub and Advanced Wireless Connector ([#1441](https://github.com/Nomi-CEu/Nomi-CEu/pull/1441)) - @IntegerLimit ([`d9b3a7a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/d9b3a7a48f869ad358bcc36b5c033dfe482a1f05))
* Add Universal Circuits ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Adds general circuits representing any circuit of that voltage
  * Extremely useful for AE2 patterning!
* Improvement to 'Add As' Modes in Adv Mem Card ([#1387](https://github.com/Nomi-CEu/Nomi-CEu/pull/1387)) - @IntegerLimit ([`5271edc`](https://github.com/Nomi-CEu/Nomi-CEu/commit/5271edc816737f84ba2c210e74b695b30f91f55f))
  * Now allows binding to unbound P2Ps
  * 'Bind As' modes now guarantee a new seperate P2P network is created
* Add Extruder Recipes from Polymer Pulps to Rods/Blocks ([#1379](https://github.com/Nomi-CEu/Nomi-CEu/pull/1379)) - @IntegerLimit ([`44ff818`](https://github.com/Nomi-CEu/Nomi-CEu/commit/44ff818bead458a6e12f2b058ea98e8fa7e117f4))
* Allow skipping non-consumable items when filling patterns from JEI ([#1375](https://github.com/Nomi-CEu/Nomi-CEu/pull/1375)) - @IntegerLimit ([`8f2488f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8f2488f9afeef23f6c0c01a4a188469fa0dfd012))
* Change the Creative Quantum Tank to produce maximum output per cycle by default ([#1370](https://github.com/Nomi-CEu/Nomi-CEu/pull/1370)) - @IntegerLimit ([`943190f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/943190f1a39ddd72b6d285c3f0a469e3e8f78e1c))

### Both Modes:
* AE2 Improvements ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366)) - @IntegerLimit ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6))
  * **Craft Overview Sorting:** Placing missing items first, then items to craft, then present items
  * Information about connection status of Quantum Link Chambers in TOP
  * Advanced Memory Card's Add as Input/Output modes now work across P2P types, auto-converting the selected P2P to the bind target's type
* TOP Improvements ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Adds icons displaying locked and voiding status of various containers
  * Improve display of creative containers
  * Improve consistency of Storage Drawers info
  * Improve consistency of AE2 info
  * Various other polish changes and bugfixes
* Allow Flux Infused Shovel in Farming Station ([#1467](https://github.com/Nomi-CEu/Nomi-CEu/pull/1467)) - @IntegerLimit ([`03fea3a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/03fea3a64b14089e18ec9520e8e8e98061df2f6a))
  * This is as they can be used as a hoe. See [#1416](https://github.com/Nomi-CEu/Nomi-CEu/issues/1416).
* Allow Copying AdvRocketry Station ID Chips ([#1461](https://github.com/Nomi-CEu/Nomi-CEu/pull/1461)) - @IntegerLimit ([`f245348`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f2453488cc5c4109ae06e7be93b4c1a1bdce4de0))
* Allow Airtight Seal on GT Armors ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* Fluid Container Bar ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Adds a bar showing the fluid stored of fluid containers in the inventory
* JEI Update ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Adds many new features, including better recipe bookmarks, and easier batch crafting
* Quantum Storage Improvements ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
  * Allows Quantum Chests to be locked
  * Displays locked status in world rendering and when in inventory
* Improve ZBGT Integration **(Addon)** ([#1385](https://github.com/Nomi-CEu/Nomi-CEu/pull/1385)) - @kyoumei-kyouki, @IntegerLimit ([`c437917`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c4379175b45db2cdb0d75e218bcfc57369bcacf3), [`214d808`](https://github.com/Nomi-CEu/Nomi-CEu/commit/214d808ff606ef6e4494bd84ebd4dedc6438ddd4))
  * Fixed circuit unwrap recipes giving 16 circuit outputs; they take 1 circuit input
  * Fix ULV Cover and Field Generator recipes in CoAL
  * Fix Circuit Assembly Line recipes
* Add Rock Breaker Recipes for Netherrack and Endstone ([#1383](https://github.com/Nomi-CEu/Nomi-CEu/pull/1383)) - @IntegerLimit ([`875780e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/875780e655fdc8435051ee28d4025ebc7a7e3e65))
* Add Combination Package Crafter to JEI Catalysts ([#1380](https://github.com/Nomi-CEu/Nomi-CEu/pull/1380)) - @IntegerLimit ([`1c2dd56`](https://github.com/Nomi-CEu/Nomi-CEu/commit/1c2dd56bc63286e16df859fc3e27eb5247f84b05))
  * Shows Combination Package Crafter + Marked Pedestals can do Empowerer recipes
* Add Early Game Recipe for Glass Vial ([#1378](https://github.com/Nomi-CEu/Nomi-CEu/pull/1378)) - @IntegerLimit ([`618042e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/618042e3026fdab62748876829332c12cf0752fd))
* Standardise Tooltips for Covers and Pipes ([#1373](https://github.com/Nomi-CEu/Nomi-CEu/pull/1373)) - @IntegerLimit ([`110ebb3`](https://github.com/Nomi-CEu/Nomi-CEu/commit/110ebb38f268464ed68320e51bc2f596ae2d911d))
  * Change ULV Covers' Tooltips to Match GT's Covers
  * Pumps and Pipes now display transfer rate in L/s
* Gold Fluid Cell, for Early Game Acid Storage ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366)) - @IntegerLimit ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6))
* JEI Improvements ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366)) - @IntegerLimit ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6))
  * Custom ItemStack Count Renderer, improving display of item stacks in JEI above 100
  * General Performance Improvements
* Remove All Cooldowns from Homes/Warps by Default ([#1364](https://github.com/Nomi-CEu/Nomi-CEu/pull/1364)) - @IntegerLimit ([`1036f3e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/1036f3e317f613722ab64104c06fa8acfbdacd9c))
* Add Rhodochrosite Recipes for Nether/End Ores ([#1359](https://github.com/Nomi-CEu/Nomi-CEu/pull/1359)) - @IntegerLimit ([`51048bd`](https://github.com/Nomi-CEu/Nomi-CEu/commit/51048bd7b20bc9afef9b3d36c0ae332a22f32605))
* Add Tooltip to Fission Reactor Port ([#1357](https://github.com/Nomi-CEu/Nomi-CEu/pull/1357)) - @IntegerLimit ([`40d6e8f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/40d6e8f559018de028701914ab6a3a0987a95360))
  * States that it is NOT used for fueling active coolers, reducing confusion.
* Add AE2 Crafting Tree ([#1356](https://github.com/Nomi-CEu/Nomi-CEu/pull/1356)) - @IntegerLimit ([`aa064e1`](https://github.com/Nomi-CEu/Nomi-CEu/commit/aa064e13395e0b60cfcf685138e2fad91497a2c0))
  * Allows for very nice viewing of AE2 crafts
  * Allows for easier debugging of complex crafts
* ZBGT Addon Script Changes ([#1349](https://github.com/Nomi-CEu/Nomi-CEu/pull/1349)) - @Mazlaci ([`823113c`](https://github.com/Nomi-CEu/Nomi-CEu/commit/823113c646288d33c1eddfa9449ef08aeebf99f0))
  * JEI Cleanup
  * YOTTanks are now buildable!
* Add Fuel Dust to Fuel (Gem) Recipes ([#1344](https://github.com/Nomi-CEu/Nomi-CEu/pull/1344)) - @simcye ([`5a37517`](https://github.com/Nomi-CEu/Nomi-CEu/commit/5a3751706734db1a06279762236ec286a627d604))

## Quest Book Changes:
### Both Modes:
* Misc QB Changes for 1.7.6 ([#1475](https://github.com/Nomi-CEu/Nomi-CEu/pull/1475)) - @IntegerLimit ([`c32e3de`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c32e3de6724a946d596e540afb6aa602edaf1dcd))
* Improve the Quest Book's Description for Endervoirs ([#1463](https://github.com/Nomi-CEu/Nomi-CEu/pull/1463)) - @YourHuckleberry ([`243a8a7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/243a8a7a5906d69c76873d59c432692c41b11735))
* Fix Snad Quest Not Recognizing Vacuum Chest After Being Placed Down ([#1340](https://github.com/Nomi-CEu/Nomi-CEu/pull/1340)) - @RMSCA ([`951a1f1`](https://github.com/Nomi-CEu/Nomi-CEu/commit/951a1f1701fcd22418c19a81debbbdcb7829d999))
* Fix Extractor Description Mentioning 'Unlocking' of Steel ([#1311](https://github.com/Nomi-CEu/Nomi-CEu/pull/1311)) - @IntegerLimit ([`bab61f4`](https://github.com/Nomi-CEu/Nomi-CEu/commit/bab61f416b52f61eb96005fdc7a769e4ef9e674b))

### Hard Mode:
* Fix Pulsating Iron Quest's Icon ([#1311](https://github.com/Nomi-CEu/Nomi-CEu/pull/1311)) - @IntegerLimit ([`bab61f4`](https://github.com/Nomi-CEu/Nomi-CEu/commit/bab61f416b52f61eb96005fdc7a769e4ef9e674b))

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
* Fix Ender Fluid Cover Stripping Leading Zeros ([#1476](https://github.com/Nomi-CEu/Nomi-CEu/pull/1476)) - @nomi-ceu-management[bot] ([`a5b2800`](https://github.com/Nomi-CEu/Nomi-CEu/commit/a5b2800224654482534684a529b9844ba2dcdaa3))
* Fix Elevator and Slime Dying Recipes ([#1474](https://github.com/Nomi-CEu/Nomi-CEu/pull/1474)) - @IntegerLimit ([`09d0884`](https://github.com/Nomi-CEu/Nomi-CEu/commit/09d088428aeccf40299b691d6e74c7513b325bde))
  * Fixes the dye ingredient missing for light gray and blue recipes
* Fix Actually Additions Auto Breaker Dupe ([#1452](https://github.com/Nomi-CEu/Nomi-CEu/pull/1452)) - @nomi-ceu-management[bot] ([`fefb329`](https://github.com/Nomi-CEu/Nomi-CEu/commit/fefb329810994d98104b32103de444f5bbfae551))
* Fix UV Energy Cluster Recipe Only Accepting Wetware ([#1442](https://github.com/Nomi-CEu/Nomi-CEu/pull/1442)) - @IntegerLimit ([`e8aea84`](https://github.com/Nomi-CEu/Nomi-CEu/commit/e8aea841476aeb41898b1a2082a9c9927625a1f7))
* Fix JEI Mismatch for Naqaudah EM Separator Recipe ([#1439](https://github.com/Nomi-CEu/Nomi-CEu/pull/1439)) - @IntegerLimit ([`d518b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/d518b6f0bb53e1e9adddb9dd8ee900c62913dfb5))
  * Fixes a mismatch between the ore processing page and the actual recipe
* Fix Advanced Inscriber Dupe with Name Plates ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* Fix Running Particles of ArchitectureCraft Blocks ([#1431](https://github.com/Nomi-CEu/Nomi-CEu/pull/1431)) - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* [ADDON] Fix Flux Networks' Flux Controller Recipe ([#1413](https://github.com/Nomi-CEu/Nomi-CEu/pull/1413)) - @MasterKogha ([`11406c9`](https://github.com/Nomi-CEu/Nomi-CEu/commit/11406c932f5692a02d149ee045faed2ceea5a46d))
* Don't Add NBT to Newly Crafted EIO Capacitor Banks ([#1412](https://github.com/Nomi-CEu/Nomi-CEu/pull/1412)) - @ProTriforcer ([`176d153`](https://github.com/Nomi-CEu/Nomi-CEu/commit/176d1533a01aacd45f78eee9eb1c3d560b82deaf))
* Fix EIO Enchanter Recipes for Reaper Enchantment ([#1398](https://github.com/Nomi-CEu/Nomi-CEu/pull/1398)) - @v3ect0rgames ([`3dd2216`](https://github.com/Nomi-CEu/Nomi-CEu/commit/3dd22164ac22e9459fb8b0f2392e326cb8ec9fdc))
* Fix Various JEI Bugs ([#1366](https://github.com/Nomi-CEu/Nomi-CEu/pull/1366)) - @IntegerLimit ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6))
  * Fixes ABS structure displaying with a HV Muffler Hatch
  * Fixes Energy Bars for some DE Fusion Recipes overflowing
* Fix Skullfire Sword not Accepting All Logs ([#1367](https://github.com/Nomi-CEu/Nomi-CEu/pull/1367)) - @IntegerLimit ([`c07e39c`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c07e39c2cc511f70835b0d59aca3b5d9a407f342))
* Correct Amount of Silicone Rubber used for ME Covered Cables ([#1355](https://github.com/Nomi-CEu/Nomi-CEu/pull/1355)) - @D-Alessian ([`b9d61c9`](https://github.com/Nomi-CEu/Nomi-CEu/commit/b9d61c94f1c71525358d2331d766b43841503ea2))
  * Was 76L, Corrected to 72L.
* Fix Fueling Station in Edge Case Environments ([#1339](https://github.com/Nomi-CEu/Nomi-CEu/pull/1339)) - @CiangCing14 ([`03e904e`](https://github.com/Nomi-CEu/Nomi-CEu/commit/03e904e64ba8d230c50fc46fdcd0ac5ccc487d00))
* Fix Stacked Drums Being Voided in Fluid Crafting ([#1328](https://github.com/Nomi-CEu/Nomi-CEu/pull/1328)) - @IntegerLimit ([`fe316b3`](https://github.com/Nomi-CEu/Nomi-CEu/commit/fe316b300d2b1b9996c970b252622a5ca2556f52))
* **Addon** Fix Impossible ZBGT Recipes ([#1322](https://github.com/Nomi-CEu/Nomi-CEu/pull/1322)) - @IntegerLimit ([`517a3a9`](https://github.com/Nomi-CEu/Nomi-CEu/commit/517a3a9308aecc93489c99e6db2dcb211a4035bf))

### Hard Mode:
* Remove Ench Books from Airtight Seal Recipes ([#1464](https://github.com/Nomi-CEu/Nomi-CEu/pull/1464)) - @IntegerLimit ([`bae6186`](https://github.com/Nomi-CEu/Nomi-CEu/commit/bae6186d70ee80f64598d6ea963f14b94df769e7))

## General Changes:
### Just Enough Items:
* Fix AE2 Pure Crystal JEI Descriptions ([#1479](https://github.com/Nomi-CEu/Nomi-CEu/pull/1479)) - @IntegerLimit ([`b791760`](https://github.com/Nomi-CEu/Nomi-CEu/commit/b791760390f8d7ade58b6c72abb2889f29f55cb5))
  * Changes its recommendation from placing seeds in water to using the Crystal Growth Chamber
* Properly Remove OreDicts from Project Red's Red Alloy ([#1458](https://github.com/Nomi-CEu/Nomi-CEu/pull/1458)) - @IntegerLimit ([`50eb09f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/50eb09f4c6b6545728ee890f865724a4276b1aa3))
* **Hard Mode**: Remove Nomicoin Related Items from JEI ([#1435](https://github.com/Nomi-CEu/Nomi-CEu/pull/1435)) - @AU12321 ([`6cfa4ba`](https://github.com/Nomi-CEu/Nomi-CEu/commit/6cfa4bae2b28bf28e9de410989624e46f8c5dd54))
* Remove Unobtainable Ores from JEI ([#1435](https://github.com/Nomi-CEu/Nomi-CEu/pull/1435)) - @AU12321 ([`6cfa4ba`](https://github.com/Nomi-CEu/Nomi-CEu/commit/6cfa4bae2b28bf28e9de410989624e46f8c5dd54))
* Fix Missing Plutonium 239 Block in JEI ([#1406](https://github.com/Nomi-CEu/Nomi-CEu/pull/1406)) - @IntegerLimit ([`01deab6`](https://github.com/Nomi-CEu/Nomi-CEu/commit/01deab6e84b3f7bf3deedbf25c6b4c0bc06c37a5))
* Hide Unused Dense Ores from JEI ([#1403](https://github.com/Nomi-CEu/Nomi-CEu/pull/1403)) - @IntegerLimit ([`3b71fd7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/3b71fd72069a8c904f5713c708298faaeef6a27d))

### Mod Updates:
* AE2 Stuff Unofficial: *v0.9 ⇥ v0.10* - @IntegerLimit ([`d9b3a7a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/d9b3a7a48f869ad358bcc36b5c033dfe482a1f05))
* Alfheim Lighting Engine: *v1.5 ⇥ v1.6* - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* CensoredASM: *v5.28 ⇥ v5.30* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef), [`3adee34`](https://github.com/Nomi-CEu/Nomi-CEu/commit/3adee34accf1d05906b263f762268fbfd9568c8d))
* Controlling: *v3.0.12.2 ⇥ v3.0.12.4* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* CraftPresence: *v2.5.4 ⇥ v2.7.0* - @IntegerLimit ([`3adee34`](https://github.com/Nomi-CEu/Nomi-CEu/commit/3adee34accf1d05906b263f762268fbfd9568c8d))
* CraftTweaker: *v4.1.20.692 ⇥ v4.1.20.709* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* Enchantment Descriptions: *v1.1.15 ⇥ v1.1.20* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* Forgelin-Continuous: *v2.0.10.0 ⇥ v2.2.21.0* - @IntegerLimit ([`c83250b`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c83250b2873eceb323dc343850a25f2ba5b746e4), [`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* GroovyScript: *v1.1.3 ⇥ v1.3.3* - @nomi-ceu-management[bot], @IntegerLimit ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76), [`407a1bb`](https://github.com/Nomi-CEu/Nomi-CEu/commit/407a1bbcb9b23a36ea824ce221f3125983db95c0))
* Had Enough Items: *v4.27.3 ⇥ v4.29.13* - @IntegerLimit, @nomi-ceu-management[bot] ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6), [`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76), [`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef), ...)
* Inventory Bogo Sorter: *v1.4.9 ⇥ v1.5.0* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* JEI Utilities: *v0.2.12 ⇥ v0.2.13* - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* Just Enough Resources (JER): *v0.9.2.60 ⇥ v0.9.3.203* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* LibrarianLib-Continuous: *v1 ⇥ v3* - @IntegerLimit ([`c83250b`](https://github.com/Nomi-CEu/Nomi-CEu/commit/c83250b2873eceb323dc343850a25f2ba5b746e4))
* MixinBooter: *v9.3 ⇥ v10.7* - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))
* ModularUI: *v2.4.2 ⇥ v3.0.4* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* Nomi Labs: *v0.15.1 ⇥ v0.17.10* - @IntegerLimit, @nomi-ceu-management[bot] ([`f4ccc0a`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6), [`943190f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/943190f1a39ddd72b6d285c3f0a469e3e8f78e1c), [`8f2488f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8f2488f9afeef23f6c0c01a4a188469fa0dfd012), ...)
* PackagedAuto: *v1.0.18.63 ⇥ v1.0.23.72* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* PackagedDraconic: *v1.0.2.19 ⇥ v1.0.4.24* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* PackagedExCrafting: *v1.0.2.27 ⇥ v1.0.3.33* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* Placebo: *v1.6.0 ⇥ v1.6.1* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* UniLib: *v1.0.5 ⇥ v1.2.0* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* Universal Tweaks: *v1.14.0 ⇥ v1.17.0* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* VintageFix: *v0.5.5 ⇥ v0.6.2* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))

### Mod Additions:
* AE2 Crafting Tree - Legacy: *v0.1.2* - @IntegerLimit ([`aa064e1`](https://github.com/Nomi-CEu/Nomi-CEu/commit/aa064e13395e0b60cfcf685138e2fad91497a2c0))
* Key Binding Patch: *v1* - @IntegerLimit ([`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* SussyPatches: *v1.9.2* - @nomi-ceu-management[bot], @IntegerLimit ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76), [`4810a1f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef))
* TheOneSmeagle: *v1.1.5* - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))

### Mod Removals:
* The One Probe: *v1.4.28* ***(Replaced by The One Smeagle (fork))*** - @nomi-ceu-management[bot] ([`f9a0b6f`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76))

### Other:
* [ADDON] AE2 Fluid Crafting Rebalance ([#1465](https://github.com/Nomi-CEu/Nomi-CEu/pull/1465)) - @IntegerLimit ([`8a01b69`](https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf))
  * Gates AE2 Fluid Crafting to HV in Normal Mode, and EV in Hard Mode
* Add Voltage to Tricorder Name for Clarity ([#1469](https://github.com/Nomi-CEu/Nomi-CEu/pull/1469)) - @v3ect0rgames ([`78d29da`](https://github.com/Nomi-CEu/Nomi-CEu/commit/78d29da27ff62da104bfcb2cba61e63ff9963438))
* [Addon] Deprecate ZBGT Generic Circuits ([#1457](https://github.com/Nomi-CEu/Nomi-CEu/pull/1457)) - @IntegerLimit ([`533e806`](https://github.com/Nomi-CEu/Nomi-CEu/commit/533e80652de7dbe4b9b11a4c8ca019a577360ae8))
  * They have been replaced by Universal Circuits in native Nomi-CEu.
  * HOWEVER, you can still use ZBGT's generic circuits in recipes, and you can still make them via the old assembler recipe *(although it is now hidden to not confuse new players)*
* Change Window Title Format ([#1451](https://github.com/Nomi-CEu/Nomi-CEu/pull/1451)) - @IntegerLimit ([`f28d716`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f28d7161049d55ea48713a28950e9ce4a3366203))
  * From `Nomifactory CEu, v1.7.5, Normal Mode` to `Nomi-CEu — Normal Mode — v1.7.5`

## Internal Changes:
* Change Nightly Versioning Format + Other Internal Changes ([#1451](https://github.com/Nomi-CEu/Nomi-CEu/pull/1451)) - @IntegerLimit ([`f28d716`](https://github.com/Nomi-CEu/Nomi-CEu/commit/f28d7161049d55ea48713a28950e9ce4a3366203))
  * From `Nightly Build (main branch, 1234567)` to `Nightly (11 Dec 2025, main-1234567)`
* Manifest and Groovy Script Linting ([#1405](https://github.com/Nomi-CEu/Nomi-CEu/pull/1405)) - @IntegerLimit ([`24c85d7`](https://github.com/Nomi-CEu/Nomi-CEu/commit/24c85d7b0a65b17ea1d388454ad2f6d62208871a))


**Full Changelog**: [`1.7.5...1.7.6`](https://github.com/Nomi-CEu/Nomi-CEu/compare/1.7.5...1.7.6)