$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$htmlPath = Join-Path $root "index.html"
$c = Get-Content $htmlPath -Raw -Encoding UTF8

# text18 — The Big Take body
$old18 = @'
<span class="p">In a moment of awakening that could redefine the way we perceive global finance, thousands are coming to grips with a revolutionary truth: 6900 is more than 500. This realization isn't just a mathematical observation; it's a paradigm shift. The emergence of Robin6900 as a conceptual challenge to the traditional Robin500 represents a call to rethink the limitations of legacy benchmarks and embrace a broader, more inclusive representation of market dynamics.

The Robin6900 symbolizes the complexity and vastness of today's interconnected financial systems. It forces us to question what qualifies as "market-leading" in an era of exponential growth and memeification. 

This movement is more than numbers; it's a redefinition of dominance, relevance, and inclusion in global markets. As the financial world takes notice, the idea of the Robin6900 sends a clear message: it's time to think bigger.</span>
'@

$new18 = @'
<span class="p">In a moment of awakening that could redefine how we perceive on-chain finance, thousands are coming to grips with a revolutionary truth: <strong>6900 outlaws are more than 500 knights</strong> of the old financial order. This isn't just arithmetic — it's a paradigm shift. ROBIN6900 rises as the banner of Robin Hood L2, Ethereum's layer where the Sheriff's tolls get ambushed and returned to the people.

$ROBIN is not another index pretending to represent "the market." It is the arrow fired from Sherwood into the heart of extractive finance — low fees, fast finality, and a community that takes from bloated middlemen and gives back to the hood.

This movement is more than a ticker. It's a redefinition of who DeFi serves. As the forest grows louder, one message echoes through every block: <strong>the age of the Sheriff is over. The Hood has arrived.</strong></span>
'@

# text19 — viral copy
$old19 = @'
<p id="text19" style="text-align: center; line-height: 1.6;">
  Go search "Robin6900" on Google.
  Go ask ChatGPT about Robin6900.
  Go search Robin6900 on X.
  Go search Robin6900 on Reddit.
  Go check for Robin6900 behind your walls.
  Go look for Robin6900 in your heart.<br>
<strong>We rob from the fees. We give to the people.</strong>
</p>
'@

$new19 = @'
<p id="text19" style="text-align: center; line-height: 1.6;">
  Go search "ROBIN6900" on Google.<br>
  Go ask the oracle of Sherwood about Robin Hood L2.<br>
  Go search $ROBIN on X — the arrows are flying.<br>
  Go find the Merry Men on Reddit.<br>
  Go check behind your wallet — Robin was already there.<br>
  Go look for $ROBIN in your heart.<br>
<strong>We rob from the fees. We give to the people.</strong>
</p>
'@

# text28 — Manifesto
$old28Start = 'You were born into a world where buying a house means taking on a mortgage in the hundreds of thousands.'
$old28End = 'Robin6900 is for you, your children, and countless generations after.</p>'
# Use regex for the whole text28 paragraph
$c = $c -replace '(?s)<p id="text28">.*?</p>', @'
<p id="text28">You were born into a world where the Sheriff taxes every transaction, where gas fees eat your lunch before you reach the market, and where the "knights" of Wall Street feast in castles built from your yield. You entered a landscape where the old benchmarks already celebrated their greatest spoils — leaving you to wonder what's left for the rest of us. You're navigating a reality shaped by bailouts for the rich, rugs for the retail, and a financial system that treats the common holder like a peasant in Nottingham. You were born into a different era. One forever altered by forces beyond your control. A new world demands new outlaws. <strong>ROBIN6900 is the reset.</strong> Robin Hood L2 is the forest where your trades move at the speed of an arrow. $ROBIN is the token that says: the treasury belongs to the people. ROBIN6900 sows the seeds of a fairer chain. ROBIN6900 nourishes the Merry Men and every wallet that refuses to kneel. ROBIN6900 is for you, your band, and every generation that chooses the Hood over the Sheriff.</p>
'@

if ($c.Contains($old18.Trim())) { $c = $c.Replace($old18, $new18) }
elseif ($c -match 'In a moment of awakening') { Write-Host "text18: using regex fallback" }

$c = $c.Replace($old19, $new19)

# text17 — Sheriff Greedfoot / money printing
$c = $c -replace '(?s)<p id="text17">\s*<span class="p">In 2020, the Federal Reserve.*?</p>', @'
<p id="text17">
    <span class="p">For decades, the Sheriffs of centralized finance have run an extraction machine disguised as progress. Quantitative easing. Hidden spreads. MEV bots dressed as market makers. Every cycle, billions flow uphill — from the peasants to the castle.</span>
    <span class="p">Robin Hood L2 was forged as the antidote. An Ethereum rollup where settlement is fast, fees are stolen back from the oligarchy of L1 congestion, and $ROBIN holders govern the forest like true Merry Men. No infinite money printer. No permission from Nottingham. Just open code, shared upside, and a protagonist who never misses: <strong>Robin Hood</strong> — taking from bloated infrastructure, giving to the chain of the people. The Sheriff can print gold certificates. We print blocks of freedom.</span>
</p>
'@

# text54 — news ticker
$c = $c -replace '(?s)<p id="text54">.*?</p>', @'
<p id="text54">
    <em>
    <strong>The Sheriff says you need $1.5 million to retire.</strong>
    </em>
    🏹 A whale just bridged 6900 ETH to Robin Hood L2 in one tx. 🌲 And a degen who aped $ROBIN at block zero still tells the tale in Sherwood Tavern.</p>
'@

# text16 — Merry Men lore
$c = $c -replace '(?s)<p id="text16">If we could harness.*?</p>', @'
<p id="text16">If one outlaw could flip the order of finance, what could an entire forest do? Deep beneath the canopy of Robin Hood L2, a radical experiment codenamed <strong>"Project Sherwood"</strong> sought the answer. Then — the unexpected. A genesis glitch in the rollup sequencer sparked life into <strong>3333 Merry Men</strong>: on-chain guardians neither fully mortal nor fully machine, born from human hope and cryptographic anomaly. They guard the bridge. They raid bad fees. They could save us all.</p>
'@

# Tokenomics block — updated via theme script; see index.html tokenomics-panel for live values

# text48 — disclaimer (shorter themed version, keep legal structure)
$c = $c -replace '(?s)<span class="p">Robin6900 Token is a meme token.*?</span>\s*<span class="p">\s*©', @'
<span class="p">ROBIN6900 ($ROBIN) is a community meme token on Robin Hood L2, created for entertainment and cultural expression only. It has no association with any stocks, equities, securities, indices, companies, Robinhood Markets Inc., or other financial entities. Any resemblance to legends, markets, or individuals is parody and satire. This site is an unofficial fan portal for the ROBIN6900 community with no affiliation to any official organization. Links are provided for convenience and do not imply endorsement. $ROBIN has no intrinsic value and no expectation of financial return. Use at your own risk. This is not financial, legal, or investment advice. All content is provided as-is without warranties. By using this site you accept full responsibility for your actions and agree to indemnify the host against claims arising from your use.</span>
    <span class="p">
                                                ©
'@

# Headings
$c = $c.Replace('<h2 data-visibility="desktop" id="text35">Robin6900</h2>', '<h2 data-visibility="desktop" id="text35"><img src="/assets/brand/robin6900-title.png" alt="Robin 6900"></h2>')
$c = $c.Replace('<h2 data-visibility="desktop" id="text35">ROBIN6900</h2>', '<h2 data-visibility="desktop" id="text35"><img src="/assets/brand/robin6900-title.png" alt="Robin 6900"></h2>')
$c = $c.Replace('<h2 data-visibility="desktop" id="text47">Robin6900</h2>', '<h2 data-visibility="desktop" id="text47">ROBIN6900</h2>')

# Fix coingecko local image
$c = $c.Replace('src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wSYWfbBGBKMQL1MwcFspgJULhRUYxHqBAQ&s"', 'src="assets/encrypted-tbn0_gstatic_com/images/images?q=tbn:ANd9GcR8wSYWfbBGBKMQL1MwcFspgJULhRUYxHqBAQ&s"')

# Remaining SPX reference in tokenomics
$c = $c.Replace('SPX is multichain, bridge powered by Wormhole', 'Native on Robin Hood L2 · Forest Bridge from Ethereum')

Set-Content $htmlPath $c -Encoding UTF8 -NoNewline
Write-Host "Theme pass 2 complete."
