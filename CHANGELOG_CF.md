<h1 {{{ CENTER_ALIGN }}}>Release 1.7.6</h1>

<p>{{{ CF_REDIRECT }}}</p>
<h1>Changes Since 1.7.5</h1>
<h2>Breaking Changes:</h2>
<ul>
<li>Change All Extended Crafting Recipes to &#39;Strict&#39; (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1394">#1394</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/94252885db91ce80e277e85205e868d10f9e88e3"><code>9425288</code></a>)<ul>
<li>Large table recipes (5x5, 7x7, 9x9) now MUST be performed in the table of the exact tier!</li>
<li>E.g., you can no longer do Elite recipes in an Ultimate table!</li>
</ul>
</li>
</ul>
<h2>Balancing Changes:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Wireless AE2 Rebalance (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)<ul>
<li>Makes Beam Formers <em>much</em> cheaper; moving them to be just a little more expensive than cables</li>
<li>Moves AE2 Stuff Wireless Connectors from mid EV to early HV, acting as a progression point between Beam Formers and Quantum Rings</li>
</ul>
</li>
<li>Earlier Network Visualisation Tool Recipe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1410">#1410</a>) - @D-Alessian (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/1aab09f3067d769d313309e88c89b2e6d2aae897"><code>1aab09f</code></a>)</li>
<li>Add Treated Wood Recipes for Coated Circuit Board (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1409">#1409</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/bd7a0147c2f64ea5b2c8f4948c1964517088c315"><code>bd7a014</code></a>)<ul>
<li>New Treated Wood Plank/Plate crafting recipe, 2x yield over normal wood</li>
<li>Changed assembler recipe for Coated Circuit Board with 2x yield</li>
<li>New Treated Wood Plate assembler recipe; 1 plate + 100mb glue for 4 boards</li>
</ul>
</li>
<li>Rebalance Netherrack + Endstone Dust Processing (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1384">#1384</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/e4a3a0e7ce4fde3e64142e878b62717fc0da4ca8"><code>e4a3a0e</code></a>)<ul>
<li>Adds Lava to Netherrack Dust Centrifuging</li>
<li>Adds Enderpearl Dust to Endstone Maceration</li>
<li><strong>HM Only</strong> Changes Tier of Endstone Dust Centrifuging from EV to IV</li>
</ul>
</li>
<li>Buff Cell Recipe Outputs by 4x (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1376">#1376</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/00bb42fb61754d545f217eb3bf0cb7a790a71b01"><code>00bb42f</code></a>)</li>
<li>Nerf Outputs of ME Conduit Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1371">#1371</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/434433208cef84684f77e437e6ca060c715374d6"><code>4344332</code></a>)</li>
<li>Balancing Changes to AE2FC (Addon) (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1352">#1352</a>) - @Mazlaci (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c69374558bef7872672f4ae9ca125838e966c844"><code>c693745</code></a>)<ul>
<li>Rebalanced Extended Fluid Pattern Terminal and Ultimate Encoder, now needs PAuto</li>
<li>Thematic Changes to Recipe for Fluid Assembler</li>
<li>Rebalanced Fluid Level Maintainer, now is unlocked similarly to LazyAE2</li>
</ul>
</li>
<li>Buff Recipes for Red Alloy with Annealed Copper (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1345">#1345</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/5d5e4243cebcd277787cdf746898b20e05d5e92c"><code>5d5e424</code></a>)<ul>
<li>Annealed Copper Recipes now take Less Redstone per Craft</li>
</ul>
</li>
</ul>
<h3>Hard Mode:</h3>
<ul>
<li>Change Byproduct of Snowchestite from Chalcopyrite to Caesium (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1382">#1382</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/b2055628c6d4374e1030a2ee479348ce627bf639"><code>b205562</code></a>)</li>
<li>Move AE2 Fluid Storage Components from EV to HV (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)</li>
<li>Tweak AE2 Early Progression (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)<ul>
<li>Makes Charger require Black Steel, and moves Crystal Growth Chamber from Blue Steel to Black Steel</li>
<li>Moves AE2 a little earlier, and reduces confusion as to how AE2 is gated</li>
</ul>
</li>
</ul>
<h2>Performance Improvements:</h2>
<ul>
<li>Fix Edge Case EU P2P Performance Issues (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1452">#1452</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/fefb329810994d98104b32103de444f5bbfae551"><code>fefb329</code></a>)</li>
<li>Chanced Output Performance Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Massively improves performance of chanced output calculations at high parallels</li>
</ul>
</li>
<li>Disable Muffler Hatches for Performance (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Muffler hatch behaviours and interactions are disabled</li>
</ul>
</li>
</ul>
<h2>Feature Additions:</h2>
<h3>Quality of Life:</h3>
<ul>
<li>Add Wireless Hub and Advanced Wireless Connector (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1441">#1441</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/d9b3a7a48f869ad358bcc36b5c033dfe482a1f05"><code>d9b3a7a</code></a>)</li>
<li>Add Universal Circuits (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Adds general circuits representing any circuit of that voltage</li>
<li>Extremely useful for AE2 patterning!</li>
</ul>
</li>
<li>Improvement to &#39;Add As&#39; Modes in Adv Mem Card (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1387">#1387</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/5271edc816737f84ba2c210e74b695b30f91f55f"><code>5271edc</code></a>)<ul>
<li>Now allows binding to unbound P2Ps</li>
<li>&#39;Bind As&#39; modes now guarantee a new seperate P2P network is created</li>
</ul>
</li>
<li>Add Extruder Recipes from Polymer Pulps to Rods/Blocks (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1379">#1379</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/44ff818bead458a6e12f2b058ea98e8fa7e117f4"><code>44ff818</code></a>)</li>
<li>Allow skipping non-consumable items when filling patterns from JEI (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1375">#1375</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8f2488f9afeef23f6c0c01a4a188469fa0dfd012"><code>8f2488f</code></a>)</li>
<li>Change the Creative Quantum Tank to produce maximum output per cycle by default (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1370">#1370</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/943190f1a39ddd72b6d285c3f0a469e3e8f78e1c"><code>943190f</code></a>)</li>
</ul>
<h3>Both Modes:</h3>
<ul>
<li>AE2 Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>)<ul>
<li><strong>Craft Overview Sorting:</strong> Placing missing items first, then items to craft, then present items</li>
<li>Information about connection status of Quantum Link Chambers in TOP</li>
<li>Advanced Memory Card&#39;s Add as Input/Output modes now work across P2P types, auto-converting the selected P2P to the bind target&#39;s type</li>
</ul>
</li>
<li>TOP Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Adds icons displaying locked and voiding status of various containers</li>
<li>Improve display of creative containers</li>
<li>Improve consistency of Storage Drawers info</li>
<li>Improve consistency of AE2 info</li>
<li>Various other polish changes and bugfixes</li>
</ul>
</li>
<li>Allow Flux Infused Shovel in Farming Station (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1467">#1467</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/03fea3a64b14089e18ec9520e8e8e98061df2f6a"><code>03fea3a</code></a>)<ul>
<li>This is as they can be used as a hoe. See <a href="https://github.com/Nomi-CEu/Nomi-CEu/issues/1416">#1416</a>.</li>
</ul>
</li>
<li>Allow Copying AdvRocketry Station ID Chips (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1461">#1461</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f2453488cc5c4109ae06e7be93b4c1a1bdce4de0"><code>f245348</code></a>)</li>
<li>Allow Airtight Seal on GT Armors (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>Fluid Container Bar (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Adds a bar showing the fluid stored of fluid containers in the inventory</li>
</ul>
</li>
<li>JEI Update (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Adds many new features, including better recipe bookmarks, and easier batch crafting</li>
</ul>
</li>
<li>Quantum Storage Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Allows Quantum Chests to be locked</li>
<li>Displays locked status in world rendering and when in inventory</li>
</ul>
</li>
<li>Improve ZBGT Integration <strong>(Addon)</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1385">#1385</a>) - @kyoumei-kyouki, @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c4379175b45db2cdb0d75e218bcfc57369bcacf3"><code>c437917</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/214d808ff606ef6e4494bd84ebd4dedc6438ddd4"><code>214d808</code></a>)<ul>
<li>Fixed circuit unwrap recipes giving 16 circuit outputs; they take 1 circuit input</li>
<li>Fix ULV Cover and Field Generator recipes in CoAL</li>
<li>Fix Circuit Assembly Line recipes</li>
</ul>
</li>
<li>Add Rock Breaker Recipes for Netherrack and Endstone (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1383">#1383</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/875780e655fdc8435051ee28d4025ebc7a7e3e65"><code>875780e</code></a>)</li>
<li>Add Combination Package Crafter to JEI Catalysts (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1380">#1380</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/1c2dd56bc63286e16df859fc3e27eb5247f84b05"><code>1c2dd56</code></a>)<ul>
<li>Shows Combination Package Crafter + Marked Pedestals can do Empowerer recipes</li>
</ul>
</li>
<li>Add Early Game Recipe for Glass Vial (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1378">#1378</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/618042e3026fdab62748876829332c12cf0752fd"><code>618042e</code></a>)</li>
<li>Standardise Tooltips for Covers and Pipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1373">#1373</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/110ebb38f268464ed68320e51bc2f596ae2d911d"><code>110ebb3</code></a>)<ul>
<li>Change ULV Covers&#39; Tooltips to Match GT&#39;s Covers</li>
<li>Pumps and Pipes now display transfer rate in L/s</li>
</ul>
</li>
<li>Gold Fluid Cell, for Early Game Acid Storage (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>)</li>
<li>JEI Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>)<ul>
<li>Custom ItemStack Count Renderer, improving display of item stacks in JEI above 100</li>
<li>General Performance Improvements</li>
</ul>
</li>
<li>Remove All Cooldowns from Homes/Warps by Default (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1364">#1364</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/1036f3e317f613722ab64104c06fa8acfbdacd9c"><code>1036f3e</code></a>)</li>
<li>Add Rhodochrosite Recipes for Nether/End Ores (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1359">#1359</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/51048bd7b20bc9afef9b3d36c0ae332a22f32605"><code>51048bd</code></a>)</li>
<li>Add Tooltip to Fission Reactor Port (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1357">#1357</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/40d6e8f559018de028701914ab6a3a0987a95360"><code>40d6e8f</code></a>)<ul>
<li>States that it is NOT used for fueling active coolers, reducing confusion.</li>
</ul>
</li>
<li>Add AE2 Crafting Tree (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1356">#1356</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/aa064e13395e0b60cfcf685138e2fad91497a2c0"><code>aa064e1</code></a>)<ul>
<li>Allows for very nice viewing of AE2 crafts</li>
<li>Allows for easier debugging of complex crafts</li>
</ul>
</li>
<li>ZBGT Addon Script Changes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1349">#1349</a>) - @Mazlaci (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/823113c646288d33c1eddfa9449ef08aeebf99f0"><code>823113c</code></a>)<ul>
<li>JEI Cleanup</li>
<li>YOTTanks are now buildable!</li>
</ul>
</li>
<li>Add Fuel Dust to Fuel (Gem) Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1344">#1344</a>) - @simcye (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/5a3751706734db1a06279762236ec286a627d604"><code>5a37517</code></a>)</li>
</ul>
<h2>Quest Book Changes:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Misc QB Changes for 1.7.6 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1475">#1475</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c32e3de6724a946d596e540afb6aa602edaf1dcd"><code>c32e3de</code></a>)</li>
<li>Improve the Quest Book&#39;s Description for Endervoirs (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1463">#1463</a>) - @YourHuckleberry (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/243a8a7a5906d69c76873d59c432692c41b11735"><code>243a8a7</code></a>)</li>
<li>Fix Snad Quest Not Recognizing Vacuum Chest After Being Placed Down (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1340">#1340</a>) - @RMSCA (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/951a1f1701fcd22418c19a81debbbdcb7829d999"><code>951a1f1</code></a>)</li>
<li>Fix Extractor Description Mentioning &#39;Unlocking&#39; of Steel (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1311">#1311</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/bab61f416b52f61eb96005fdc7a769e4ef9e674b"><code>bab61f4</code></a>)</li>
</ul>
<h3>Hard Mode:</h3>
<ul>
<li>Fix Pulsating Iron Quest&#39;s Icon (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1311">#1311</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/bab61f416b52f61eb96005fdc7a769e4ef9e674b"><code>bab61f4</code></a>)</li>
</ul>
<h2>Bug Fixes:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Fix Various AE2 Bugs (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>)<ul>
<li><strong>Fixes Cross Dimension Energy P2Ps not functioning properly after world load</strong></li>
<li>Fixes Encoded Patterns outputting certain items not rendering correctly</li>
<li>Fixes Issues when Right Clicking Adv Memory Card Mode Button</li>
<li>Fixes Incorrect Items being allowed in Quantum Link Card slot</li>
</ul>
</li>
<li><strong>Fix Crystal Seed Pattern Importing</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1370">#1370</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/943190f1a39ddd72b6d285c3f0a469e3e8f78e1c"><code>943190f</code></a>)<ul>
<li>Fixes NBT Issues</li>
<li>Adds a JEI Page for Crystal Growth Chamber Recipes</li>
</ul>
</li>
<li><strong>Fix Crash on Cleanroom 0.3.3+</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1363">#1363</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c83250b2873eceb323dc343850a25f2ba5b746e4"><code>c83250b</code></a>)</li>
<li>Fix Ender Fluid Cover Stripping Leading Zeros (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1476">#1476</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/a5b2800224654482534684a529b9844ba2dcdaa3"><code>a5b2800</code></a>)</li>
<li>Fix Elevator and Slime Dying Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1474">#1474</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/09d088428aeccf40299b691d6e74c7513b325bde"><code>09d0884</code></a>)<ul>
<li>Fixes the dye ingredient missing for light gray and blue recipes</li>
</ul>
</li>
<li>Fix Actually Additions Auto Breaker Dupe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1452">#1452</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/fefb329810994d98104b32103de444f5bbfae551"><code>fefb329</code></a>)</li>
<li>Fix UV Energy Cluster Recipe Only Accepting Wetware (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1442">#1442</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/e8aea841476aeb41898b1a2082a9c9927625a1f7"><code>e8aea84</code></a>)</li>
<li>Fix JEI Mismatch for Naqaudah EM Separator Recipe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1439">#1439</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/d518b6f0bb53e1e9adddb9dd8ee900c62913dfb5"><code>d518b6f</code></a>)<ul>
<li>Fixes a mismatch between the ore processing page and the actual recipe</li>
</ul>
</li>
<li>Fix Advanced Inscriber Dupe with Name Plates (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>Fix Running Particles of ArchitectureCraft Blocks (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>[ADDON] Fix Flux Networks&#39; Flux Controller Recipe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1413">#1413</a>) - @MasterKogha (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/11406c932f5692a02d149ee045faed2ceea5a46d"><code>11406c9</code></a>)</li>
<li>Don&#39;t Add NBT to Newly Crafted EIO Capacitor Banks (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1412">#1412</a>) - @ProTriforcer (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/176d1533a01aacd45f78eee9eb1c3d560b82deaf"><code>176d153</code></a>)</li>
<li>Fix EIO Enchanter Recipes for Reaper Enchantment (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1398">#1398</a>) - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/3dd22164ac22e9459fb8b0f2392e326cb8ec9fdc"><code>3dd2216</code></a>)</li>
<li>Fix Various JEI Bugs (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>)<ul>
<li>Fixes ABS structure displaying with a HV Muffler Hatch</li>
<li>Fixes Energy Bars for some DE Fusion Recipes overflowing</li>
</ul>
</li>
<li>Fix Skullfire Sword not Accepting All Logs (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1367">#1367</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c07e39c2cc511f70835b0d59aca3b5d9a407f342"><code>c07e39c</code></a>)</li>
<li>Correct Amount of Silicone Rubber used for ME Covered Cables (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1355">#1355</a>) - @D-Alessian (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/b9d61c94f1c71525358d2331d766b43841503ea2"><code>b9d61c9</code></a>)<ul>
<li>Was 76L, Corrected to 72L.</li>
</ul>
</li>
<li>Fix Fueling Station in Edge Case Environments (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1339">#1339</a>) - @CiangCing14 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/03e904e64ba8d230c50fc46fdcd0ac5ccc487d00"><code>03e904e</code></a>)</li>
<li>Fix Stacked Drums Being Voided in Fluid Crafting (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1328">#1328</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/fe316b300d2b1b9996c970b252622a5ca2556f52"><code>fe316b3</code></a>)</li>
<li><strong>Addon</strong> Fix Impossible ZBGT Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1322">#1322</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/517a3a9308aecc93489c99e6db2dcb211a4035bf"><code>517a3a9</code></a>)</li>
</ul>
<h3>Hard Mode:</h3>
<ul>
<li>Remove Ench Books from Airtight Seal Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1464">#1464</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/bae6186d70ee80f64598d6ea963f14b94df769e7"><code>bae6186</code></a>)</li>
</ul>
<h2>General Changes:</h2>
<h3>Just Enough Items:</h3>
<ul>
<li>Fix AE2 Pure Crystal JEI Descriptions (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1479">#1479</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/b791760390f8d7ade58b6c72abb2889f29f55cb5"><code>b791760</code></a>)<ul>
<li>Changes its recommendation from placing seeds in water to using the Crystal Growth Chamber</li>
</ul>
</li>
<li>Properly Remove OreDicts from Project Red&#39;s Red Alloy (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1458">#1458</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/50eb09f4c6b6545728ee890f865724a4276b1aa3"><code>50eb09f</code></a>)</li>
<li><strong>Hard Mode</strong>: Remove Nomicoin Related Items from JEI (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1435">#1435</a>) - @AU12321 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/6cfa4bae2b28bf28e9de410989624e46f8c5dd54"><code>6cfa4ba</code></a>)</li>
<li>Remove Unobtainable Ores from JEI (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1435">#1435</a>) - @AU12321 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/6cfa4bae2b28bf28e9de410989624e46f8c5dd54"><code>6cfa4ba</code></a>)</li>
<li>Fix Missing Plutonium 239 Block in JEI (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1406">#1406</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/01deab6e84b3f7bf3deedbf25c6b4c0bc06c37a5"><code>01deab6</code></a>)</li>
<li>Hide Unused Dense Ores from JEI (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1403">#1403</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/3b71fd72069a8c904f5713c708298faaeef6a27d"><code>3b71fd7</code></a>)</li>
</ul>
<h3>Mod Updates:</h3>
<ul>
<li>AE2 Stuff Unofficial: <em>v0.9 ⇥ v0.10</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/d9b3a7a48f869ad358bcc36b5c033dfe482a1f05"><code>d9b3a7a</code></a>)</li>
<li>Alfheim Lighting Engine: <em>v1.5 ⇥ v1.6</em> - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>CensoredASM: <em>v5.28 ⇥ v5.30</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/3adee34accf1d05906b263f762268fbfd9568c8d"><code>3adee34</code></a>)</li>
<li>Controlling: <em>v3.0.12.2 ⇥ v3.0.12.4</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>CraftPresence: <em>v2.5.4 ⇥ v2.7.0</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/3adee34accf1d05906b263f762268fbfd9568c8d"><code>3adee34</code></a>)</li>
<li>CraftTweaker: <em>v4.1.20.692 ⇥ v4.1.20.709</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>Enchantment Descriptions: <em>v1.1.15 ⇥ v1.1.20</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>Forgelin-Continuous: <em>v2.0.10.0 ⇥ v2.2.21.0</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c83250b2873eceb323dc343850a25f2ba5b746e4"><code>c83250b</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>GroovyScript: <em>v1.1.3 ⇥ v1.3.3</em> - @nomi-ceu-management[bot], @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/407a1bbcb9b23a36ea824ce221f3125983db95c0"><code>407a1bb</code></a>)</li>
<li>Had Enough Items: <em>v4.27.3 ⇥ v4.29.13</em> - @IntegerLimit, @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>, ...)</li>
<li>Inventory Bogo Sorter: <em>v1.4.9 ⇥ v1.5.0</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>JEI Utilities: <em>v0.2.12 ⇥ v0.2.13</em> - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>Just Enough Resources (JER): <em>v0.9.2.60 ⇥ v0.9.3.203</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>LibrarianLib-Continuous: <em>v1 ⇥ v3</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c83250b2873eceb323dc343850a25f2ba5b746e4"><code>c83250b</code></a>)</li>
<li>MixinBooter: <em>v9.3 ⇥ v10.7</em> - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>ModularUI: <em>v2.4.2 ⇥ v3.0.4</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>Nomi Labs: <em>v0.15.1 ⇥ v0.17.10</em> - @IntegerLimit, @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/943190f1a39ddd72b6d285c3f0a469e3e8f78e1c"><code>943190f</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8f2488f9afeef23f6c0c01a4a188469fa0dfd012"><code>8f2488f</code></a>, ...)</li>
<li>PackagedAuto: <em>v1.0.18.63 ⇥ v1.0.23.72</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>PackagedDraconic: <em>v1.0.2.19 ⇥ v1.0.4.24</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>PackagedExCrafting: <em>v1.0.2.27 ⇥ v1.0.3.33</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>Placebo: <em>v1.6.0 ⇥ v1.6.1</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>UniLib: <em>v1.0.5 ⇥ v1.2.0</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>Universal Tweaks: <em>v1.14.0 ⇥ v1.17.0</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>VintageFix: <em>v0.5.5 ⇥ v0.6.2</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
</ul>
<h3>Mod Additions:</h3>
<ul>
<li>AE2 Crafting Tree - Legacy: <em>v0.1.2</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/aa064e13395e0b60cfcf685138e2fad91497a2c0"><code>aa064e1</code></a>)</li>
<li>Key Binding Patch: <em>v1</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>SussyPatches: <em>v1.9.2</em> - @nomi-ceu-management[bot], @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4810a1fb8656b7c6aaa9ed10c37153192f096aef"><code>4810a1f</code></a>)</li>
<li>TheOneSmeagle: <em>v1.1.5</em> - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
</ul>
<h3>Mod Removals:</h3>
<ul>
<li>The One Probe: <em>v1.4.28</em> <em><strong>(Replaced by The One Smeagle (fork))</strong></em> - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
</ul>
<h3>Other:</h3>
<ul>
<li>[ADDON] AE2 Fluid Crafting Rebalance (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)<ul>
<li>Gates AE2 Fluid Crafting to HV in Normal Mode, and EV in Hard Mode</li>
</ul>
</li>
<li>Add Voltage to Tricorder Name for Clarity (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1469">#1469</a>) - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/78d29da27ff62da104bfcb2cba61e63ff9963438"><code>78d29da</code></a>)</li>
<li>[Addon] Deprecate ZBGT Generic Circuits (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1457">#1457</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/533e80652de7dbe4b9b11a4c8ca019a577360ae8"><code>533e806</code></a>)<ul>
<li>They have been replaced by Universal Circuits in native Nomi-CEu.</li>
<li>HOWEVER, you can still use ZBGT&#39;s generic circuits in recipes, and you can still make them via the old assembler recipe <em>(although it is now hidden to not confuse new players)</em></li>
</ul>
</li>
<li>Change Window Title Format (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1451">#1451</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f28d7161049d55ea48713a28950e9ce4a3366203"><code>f28d716</code></a>)<ul>
<li>From <code>Nomifactory CEu, v1.7.5, Normal Mode</code> to <code>Nomi-CEu — Normal Mode — v1.7.5</code></li>
</ul>
</li>
</ul>
<h2>Internal Changes:</h2>
<ul>
<li>Change Nightly Versioning Format + Other Internal Changes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1451">#1451</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f28d7161049d55ea48713a28950e9ce4a3366203"><code>f28d716</code></a>)<ul>
<li>From <code>Nightly Build (main branch, 1234567)</code> to <code>Nightly (11 Dec 2025, main-1234567)</code></li>
</ul>
</li>
<li>Manifest and Groovy Script Linting (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1405">#1405</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/24c85d7b0a65b17ea1d388454ad2f6d62208871a"><code>24c85d7</code></a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Nomi-CEu/Nomi-CEu/compare/1.7.5...1.7.6"><code>1.7.5...1.7.6</code></a></p>
