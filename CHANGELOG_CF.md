<h1 style="text-align: center;"><a href="https://github.com/Nomi-CEu/Nomi-CEu/releases/tag/1.7.6"><img src="https://raw.githubusercontent.com/Nomi-CEu/Branding/main/Nomi%20CEu/Releases/1.7.6/1.7.6.png" alt="Release 1.7.5"></a></h1>

<p></p>

<p style="text-align: center;"><b>🎄 The Christmas Release 🎄</b></p>

<p style="text-align: center;"><em>Featuring: TOP revamp, and many new QoL features, balancing changes, performance improvements and bug fixes!</em></p>

<p></p>
<hr>
<p></p>

<h2>Warning</h2>

<b>Please DO NOT revert any saves that have been loaded in this release to 1.7-beta-5c, 1.6.1b, 1.6.1a, or prior!</b>

<p></p>
<hr>
<p></p>

<b>Wondering how this will impact your setups and patterns?<br>Checkout the <a href = "https://github.com/Nomi-CEu/Branding/blob/main/Nomi%20CEu/Releases/1.7.6/RECIPE_CHANGELOG.md">Recipe Changelog</a>.</b>

<b>See the <a href="https://github.com/Nomi-CEu/Branding/blob/main/Nomi%20CEu/Releases/1.7.6/FULL_CHANGELOG.md">Full Changelog</a> for all changes!</b>

<p></p>
<hr>
<p></p>

<h1 id="major-changes-since-1-7-5">Major Changes Since 1.7.5</h1>
<h2 id="breaking-changes-">Breaking Changes:</h2>
<ul>
<li>Change All Extended Crafting Recipes to &#39;Strict&#39; (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1394">#1394</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/94252885db91ce80e277e85205e868d10f9e88e3"><code>9425288</code></a>)<ul>
<li>Large table recipes (5x5, 7x7, 9x9) now MUST be performed in the table of the exact tier!</li>
<li>E.g., you can no longer do Elite recipes in an Ultimate table!</li>
</ul>
</li>
</ul>

<p></p>
<h2 id="balancing-changes-">Balancing Changes:</h2>
<h3 id="both-modes-">Both Modes:</h3>
<ul>
<li>Wireless AE2 Rebalance (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)<ul>
<li>Makes Beam Formers <em>much</em> cheaper; moving them to be just a little more expensive than cables</li>
<li>Moves AE2 Stuff Wireless Connectors from mid EV to early HV, acting as a progression point between Beam Formers and Quantum Rings</li>
</ul>
</li>
<li>Rebalance Netherrack + Endstone Dust Processing (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1384">#1384</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/e4a3a0e7ce4fde3e64142e878b62717fc0da4ca8"><code>e4a3a0e</code></a>)<ul>
<li>Adds Lava to Netherrack Dust Centrifuging</li>
<li>Adds Enderpearl Dust to Endstone Maceration</li>
<li><strong>HM Only</strong> Changes Tier of Endstone Dust Centrifuging from EV to IV</li>
</ul>
</li>
<li>...and more!</li>
</ul>

<p></p>
<h3 id="hard-mode-">Hard Mode:</h3>
<ul>
<li><strong>Change Byproduct of Snowchestite from Chalcopyrite to Caesium</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1382">#1382</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/b2055628c6d4374e1030a2ee479348ce627bf639"><code>b205562</code></a>)<ul>
<li>Snowchestite line is now <strong>caesium positive</strong> instead of being a caesium sink!</li>
</ul>
</li>
<li>Tweak AE2 Early Progression (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)<ul>
<li>Makes Charger require Black Steel, and moves Crystal Growth Chamber from Blue Steel to Black Steel</li>
<li>Moves AE2 a little earlier, and reduces confusion as to how AE2 is gated</li>
</ul>
</li>
<li>Move AE2 Fluid Storage Components from EV to HV (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)</li>
</ul>

<p></p>
<h2 id="performance-improvements-">Performance Improvements:</h2>
<ul>
<li>Chanced Output Performance Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Massively improves performance of chanced output calculations at high parallels</li>
</ul>
</li>
<li>...and more!</li>
</ul>

<p></p>
<h2 id="feature-additions-">Feature Additions:</h2>
<h3 id="quality-of-life-">Quality of Life:</h3>
<ul>
<li><strong>Add Universal Circuits</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Adds general circuits representing any circuit of that voltage</li>
<li>Automatically prioritized in pattern importing from JEI, as they are extremely useful for AE2 patterning</li>
</ul>
</li>
<li><strong>Allow skipping non-consumable items when filling patterns from JEI</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1375">#1375</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8f2488f9afeef23f6c0c01a4a188469fa0dfd012"><code>8f2488f</code></a>)</li>
<li>...and more!</li>
</ul>

<p></p>
<h3 id="both-modes-">Both Modes:</h3>
<ul>
<li><strong>TOP Improvements</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Adds icons displaying locked and voiding status of various containers</li>
<li>Improve display of creative containers</li>
<li>Improve consistency of Storage Drawers info</li>
<li>Improve consistency of AE2 info</li>
<li>Various other polish changes and bugfixes</li>
</ul>
</li>
<li>AE2 Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1387">#1387</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/5271edc816737f84ba2c210e74b695b30f91f55f"><code>5271edc</code></a>)<ul>
<li><strong>Craft Overview Sorting:</strong> Placing missing items first, then items to craft, then present items</li>
<li>Information about connection status of Quantum Link Chambers in TOP</li>
<li>Advanced Memory Card mode improvements<ul>
<li>Add as Input/Output modes now work across P2P types, auto-converting the selected P2P to the bind target&#39;s type, and allows binding to unbound P2Ps</li>
<li>&#39;Bind As&#39; modes now guarantee a new seperate P2P network is created</li>
</ul>
</li>
</ul>
</li>
<li>Add AE2 Crafting Tree (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1356">#1356</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/aa064e13395e0b60cfcf685138e2fad91497a2c0"><code>aa064e1</code></a>)<ul>
<li>Allows for very nice viewing of AE2 crafts</li>
<li>Allows for easier debugging of complex crafts</li>
</ul>
</li>
<li><strong>Allow Airtight Seal on GT Armors</strong> (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)</li>
<li>Quantum Storage Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot] (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>)<ul>
<li>Allows Quantum Chests to be locked</li>
<li>Displays locked status in world rendering and when in inventory</li>
</ul>
</li>
<li>...and more!</li>
</ul>

<p></p>
<h2 id="bug-fixes-">Bug Fixes:</h2>
<h3 id="both-modes-">Both Modes:</h3>
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
<li>...and more!</li>
</ul>

<p></p>
<h3 id="hard-mode-">Hard Mode:</h3>
<ul>
<li>Remove Enchanting Books from Airtight Seal Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1464">#1464</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/bae6186d70ee80f64598d6ea963f14b94df769e7"><code>bae6186</code></a>)</li>
</ul>

<p></p>
<h2 id="general-changes-">General Changes:</h2>
<h3 id="just-enough-items-">Just Enough Items:</h3>
<ul>
<li>JEI Updates (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1366">#1366</a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1431">#1431</a>) - @nomi-ceu-management[bot], @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f9a0b6f73f8edc3370631432369bc9b249acfa76"><code>f9a0b6f</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/f4ccc0afd70faa2682e6227532d7c442ff9cbed6"><code>f4ccc0a</code></a>)<ul>
<li>Adds many new features, including recipe favouriting, better recipe bookmarks, and batch chain crafting within JEI (autocrafting)</li>
<li>Custom ItemStack Count Renderer, improving display of item stacks in JEI above 100</li>
<li>General Performance Improvements</li>
</ul>
</li>
<li>...and more!</li>
</ul>

<p></p>
<h2 id="addon-support-changes-">Addon Support Changes:</h2>
<ul>
<li>Fix Flux Networks&#39; Flux Controller Recipe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1413">#1413</a>) - @MasterKogha (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/11406c932f5692a02d149ee045faed2ceea5a46d"><code>11406c9</code></a>)</li>
<li>Fix ZBGT Circuit Assembly and CoAL Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1385">#1385</a>) - @kyoumei-kyouki, @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c4379175b45db2cdb0d75e218bcfc57369bcacf3"><code>c437917</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/214d808ff606ef6e4494bd84ebd4dedc6438ddd4"><code>214d808</code></a>)<ul>
<li>Fixed circuit unwrap recipes giving 16 circuit outputs; they take 1 circuit input</li>
<li>Fix ULV Cover and Field Generator recipes in CoAL</li>
<li>Fix Circuit Assembly Line recipesnot confuse new players)*</li>
</ul>
</li>
<li>AE2 Fluid Crafting Rebalance (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1352">#1352</a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1465">#1465</a>) - @Mazlaci, @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c69374558bef7872672f4ae9ca125838e966c844"><code>c693745</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8a01b695171715a2a8ebee356c763dfa1ec1ddaf"><code>8a01b69</code></a>)<ul>
<li>Gates AE2 Fluid Crafting to HV in Normal Mode, and EV in Hard Mode</li>
<li>Thematic Changes to Recipe for Fluid Assembler</li>
<li>Rebalanced Extended Fluid Pattern Terminal and Ultimate Encoder, now needs PAuto&#39;s Package Recipe Encoder to craft, similar to its vanilla AE2 counterparts</li>
<li>Rebalanced Fluid Level Maintainer, now is unlocked similarly to LazyAE2</li>
</ul>
</li>
<li>...and more!</li>
</ul>
<p></p>
<p><strong>See the <a href="https://github.com/Nomi-CEu/Branding/blob/main/Nomi%20CEu/Releases/1.7.6/FULL_CHANGELOG.md">Full Changelog</a> for more exciting changes!</strong></p>

