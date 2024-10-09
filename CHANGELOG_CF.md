<h1 style="text-align:center"><a href="https://github.com/Nomi-CEu/Nomi-CEu/releases/tag/1.7"><img src="https://raw.githubusercontent.com/Nomi-CEu/Branding/main/Nomi%20CEu/Releases/1.7/1.7.png" alt="Release 1.7"></a></h1>

<p style="text-align:center"><em><b>The Culimation of 1 Year of Work, and over 6 Alpha and Beta Releases.</em></b></p>

<p style="text-align:center"><em>Featuring Assembly Line Research, Many Feature and Quality of Life Additions, and Bug Fixes Galore!</em></p>

<hr>

<h2>Warning</h2>
<p><b>Please DO NOT revert any saves that have been loaded in this release to 1.7-beta-5c, 1.6.1b, 1.6.1a, or prior!</b></p>

<hr>
<p>{{{ CF_REDIRECT }}}</p>
<h1>Changes Since 1.7a</h1>
<h2>Balancing Changes:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Alternative Hull Recipes with Higher Tier Plastics (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1027">#1027</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/38030cfb5e238b1451025420e6cbcbcc7ec8c40b"><code>38030cf</code></a>)</li>
<li>Alternative Lubricant Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1030">#1030</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/c7f47ba3e288b4ac58d4ae43b771a4e0a828aebc"><code>c7f47ba</code></a>)<ul>
<li>Raw Oil: 2B Input, 1B Output</li>
<li>Light Oil: 1B Input, 500mB Output</li>
<li>Heavy Oil: 1B Input, 4B Output</li>
</ul>
</li>
<li>Alternative ULV Covers Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1026">#1026</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/9a4f77cda5331f9b0fc7a66abade9e374ca5ac15"><code>9a4f77c</code></a>)<ul>
<li>Allows Using Higher Tiers of Rubber, and the Assembler.</li>
</ul>
</li>
</ul>
<h3>Hard Mode:</h3>
<ul>
<li>Fix Potassium Duplication in PGS EBF Step (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1036">#1036</a>) - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/9087ef2b6204158f68c91c3f9e9d6f0502ccbd43"><code>9087ef2</code></a>)<ul>
<li>Potassium Sulfate Output Reduced: 14 -&gt; 7</li>
<li>Sulfur Trioxide (1 Bucket) Added to Fluid Outputs</li>
</ul>
</li>
</ul>
<h2>Performance Improvements:</h2>
<ul>
<li>Update HEI to 4.26.0 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1040">#1040</a>) - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/94db384f7808d1658cee6362987f5adbe7deb474"><code>94db384</code></a>)<ul>
<li>Saves Time when Loading and Reloading JEI</li>
</ul>
</li>
<li>Update CraftPresence to v2.5.0 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1015">#1015</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e"><code>239aed7</code></a>)<ul>
<li>Saves ~300MB of Memory on Main Menu</li>
</ul>
</li>
<li>Update Alfheim Lighting Engine to 1.4 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1016">#1016</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8ade7ceed3f5101e29f951e00f8cedfbb7b4051f"><code>8ade7ce</code></a>)</li>
</ul>
<h2>Feature Additions:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Advanced Rocketry Tank Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1041">#1041</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/dc7c2fdccdb9ec40f1ef593b0ee8490ff0ee6a3f"><code>dc7c2fd</code></a>)<ul>
<li>Fixes <a href="https://github.com/Nomi-CEu/Nomi-CEu/issues/276">#276</a></li>
<li>Removed from JEI</li>
</ul>
</li>
<li>Content Clearing Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1035">#1035</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/478ad65a95838a700231990b9f3f2f57d3d4f371"><code>478ad65</code></a>)<ul>
<li><strong>Allows Clearing Of:</strong></li>
<li>Buckets (Water, Lava, Forge)</li>
<li>Minecraft Shulker Boxes</li>
<li>GregTech Crates</li>
<li>NuclearCraft Non-Active Coolers</li>
<li>Drawers (Wooden, GregTech, Framed, Framed Compacted)<ul>
<li>Upgrades are NOT Cleared!</li>
</ul>
</li>
<li>Thermal Portable Tanks</li>
<li><strong>Adds Tooltip Notifying Clearing Ability For:</strong></li>
<li>GregTech Super/Quantum Chests/Tanks</li>
<li>GregTech Drums</li>
<li>EnderIO Portable Tanks</li>
</ul>
</li>
<li>Allows Removal of CraftPresence Without Script Error (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1015">#1015</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e"><code>239aed7</code></a>)</li>
</ul>
<h2>Quest Book Changes:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Fix Typo in Fusion Reactor MK I Quest (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1046">#1046</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/249e53184552a8cc6411b881f5b4b13fa9e2b330"><code>249e531</code></a>)</li>
<li>Misc Quest Fixes and Cleanup (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1043">#1043</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/7617c08a1c26f6459e73833b1267b0178fad1955"><code>7617c08</code></a>)<ul>
<li>Cleans Up Platinum Group Processing quest, Allow Using Tier Three Micro Miner for Initial Ruthenium</li>
<li>Improvement in Air Distillation Quests<ul>
<li>Adds Nitrogen and Basic Air Collection Quests to The Beginning</li>
<li>Removes Nitrogen from Mid Game</li>
<li>Deletes Air Centrifuging Quest</li>
</ul>
</li>
<li>General Improvement in Clarity of Quests</li>
<li>Cleanup of The Beginning and Mid Game Lines</li>
</ul>
</li>
<li>Cleanup of Quest Book Layout (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1038">#1038</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/820e19fda108695feb2ef1e65578258941b0e90e"><code>820e19f</code></a>)</li>
<li>Misc Questbook Fixes and Improvements (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1007">#1007</a>) - @smallming675 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/454f3c5f30fa3bfc6fa48382b7f09b70275d1585"><code>454f3c5</code></a>)</li>
<li>Fix Misspelling of Neodymium in EV Hull Quest (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/999">#999</a>) - @smallming675 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/e8e7f5db82219a38277df5ada34e7100cf61c8e0"><code>e8e7f5d</code></a>)</li>
<li>Fix Typo in First Micro Miner Quest (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/986">#986</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4836a20cdec9e673f5306d29bac95be52f2fda1c"><code>4836a20</code></a>)</li>
</ul>
<h3>Hard Mode:</h3>
<ul>
<li>Add T4.5MM as a Dependency to Soul Binder Quest (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1002">#1002</a>) - @smallming675 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/66ab026952fa931893ffd24e96bea9ed3415de36"><code>66ab026</code></a>)</li>
</ul>
<h2>Bug Fixes:</h2>
<h3>Both Modes:</h3>
<ul>
<li>Fix Airtight Seal Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1042">#1042</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/5cfea1f4a3486f93c45fe50c0f0d705cb2ae09ba"><code>5cfea1f</code></a>)</li>
<li>Update HEI to 4.26.0 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1040">#1040</a>) - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/94db384f7808d1658cee6362987f5adbe7deb474"><code>94db384</code></a>)<ul>
<li>Fixes Issues with Tooltip Search</li>
</ul>
</li>
<li>Fix GregTech Facades&#39; Tooltip (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1039">#1039</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4d14183e8161488909bae9bb20118e033de9ac8c"><code>4d14183</code></a>)</li>
<li>Fix Transmutating Airtight Seal Recipe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1029">#1029</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/716c957b4c41b0a88e64e41977cd845843d76ff6"><code>716c957</code></a>)<ul>
<li>Caused by Adding Other Mods</li>
</ul>
</li>
<li>Update Nomi Labs to v0.9 (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1028">#1028</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/679a67cd6faa5030007f180dc05001f8ef2927ef"><code>679a67c</code></a>)<ul>
<li>Fixes Disappearing Covers on Pipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/issues/987">#987</a>)</li>
<li>Fixes Cleanroom Loader Incompatibility (<a href="https://github.com/Nomi-CEu/Nomi-CEu/issues/993">#993</a>)</li>
<li>Makes Scrolling P2Ps Respect Direction</li>
<li>Fixes Drawer Keys on Empty Drawers</li>
</ul>
</li>
<li>Fix ME Conduit Recipe (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1025">#1025</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/2ca3f3d0e0e129a9f27c443713d3eee72b0742ec"><code>2ca3f3d</code></a>)</li>
<li>Fix Hand Framing Display Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1024">#1024</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/7ebb0ebe33fb79648290969e86e3ba9148151cee"><code>7ebb0eb</code></a>)</li>
<li>Fix NBT Problems in Pure Crystal Shortcut Recipes (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1014">#1014</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/4afba84af3d80aae3ad4555b9177dc0ca5c20938"><code>4afba84</code></a>)<ul>
<li>Fixes <a href="https://github.com/Nomi-CEu/Nomi-CEu/issues/1010">#1010</a></li>
</ul>
</li>
<li>Fix Issues with Searching Tooltips in JEI (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/992">#992</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/ace16a5dda9119553c7bd537b536e72a84670f3c"><code>ace16a5</code></a>)</li>
<li>Fix Duplicate and Wrong AE2 Tooltips (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/983">#983</a>) - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/9044203dd41835382cc423a430bb02b3178b784e"><code>9044203</code></a>)</li>
</ul>
<h2>General Changes:</h2>
<h3>Mod Updates:</h3>
<ul>
<li>Alfheim Lighting Engine: <em>v1.1.1 ⇥ v1.4</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8ade7ceed3f5101e29f951e00f8cedfbb7b4051f"><code>8ade7ce</code></a>)</li>
<li>CraftPresence: <em>v2.3.5 ⇥ v2.5.0</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e"><code>239aed7</code></a>)</li>
<li>Had Enough Items: <em>v4.25.4 ⇥ v4.26.0</em> - @v3ect0rgames (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/94db384f7808d1658cee6362987f5adbe7deb474"><code>94db384</code></a>)</li>
<li>Nomi Labs: <em>v0.8.20 ⇥ v0.9.4</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/dc7c2fdccdb9ec40f1ef593b0ee8490ff0ee6a3f"><code>dc7c2fd</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/478ad65a95838a700231990b9f3f2f57d3d4f371"><code>478ad65</code></a>, <a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/5b12055e6977450b1ef39ea2e65a189279c6c775"><code>5b12055</code></a>, ...)</li>
</ul>
<h3>Mod Additions:</h3>
<ul>
<li>UniLib: <em>v1.0.2</em> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/239aed709d9d056431eb66b32d8606a518b6295e"><code>239aed7</code></a>)</li>
</ul>
<h2>Internal Changes:</h2>
<ul>
<li>Properly Signal Async Completion with Streams (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1022">#1022</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/3b742f4ddfdf46d7a47d18ca58777962d1f61cc7"><code>3b742f4</code></a>)</li>
<li>Use Faster Hashing Library (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1021">#1021</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/6baff4e57a7bd46d848e0fb2965fad26236ed1d8"><code>6baff4e</code></a>)</li>
<li>Fix Lang Zips &amp; Cleanup <code>pack.mcmeta</code> - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/8388e12cc633d09fc4c952fd757e15503fb47857"><code>8388e12</code></a>)</li>
<li>Make Fork PR Build Only Run on Certain PRs (<a href="https://github.com/Nomi-CEu/Nomi-CEu/pull/1018">#1018</a>) - @IntegerLimit (<a href="https://github.com/Nomi-CEu/Nomi-CEu/commit/da5ebbb304c67ff467720eea1ba825090e3210e3"><code>da5ebbb</code></a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Nomi-CEu/Nomi-CEu/compare/1.7a...1.7.1"><code>1.7a...1.7.1</code></a></p>
