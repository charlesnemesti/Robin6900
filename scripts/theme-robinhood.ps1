$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$htmlPath = Join-Path $root "index.html"
$c = Get-Content $htmlPath -Raw -Encoding UTF8

$replacements = [ordered]@{
    '<title>Robin6900</title>' = '<title>ROBIN6900 — Steal the Future on Robin Hood L2</title>'
    'content="Robin6900 " property="og:site_name"' = 'content="ROBIN6900" property="og:site_name"'
    'content="Robin6900 " property="og:title"' = 'content="ROBIN6900 | The Outlaw Token on Robin Hood L2" property="og:title"'
    '<meta content="website" property="og:type">' = '<meta content="6900 outlaws are stronger than 500 knights of old finance. $ROBIN lives on Robin Hood L2 — Ethereum''s layer where fees get robbed from the rich and returned to the people." property="og:description">
    <meta content="website" property="og:type">'

    '>CHART</a>' = '>TREASURY</a>'
    '>DYOR</a>' = '>LORE</a>'
    '>SWAP</a>' = '>RAID</a>'
    '>BRIDGE</a>' = '>FOREST BRIDGE</a>'

    '<em>($ROBIN EXPLAINER FOR MID CURVE)</em>' = '<em>($ROBIN EXPLAINER FOR THE PEASANT CLASS)</em>'
    '<p id="text25">The Big Take</p>' = '<p id="text25">The Sheriff''s Nightmare</p>'
    '<p id="text07">Thousands are waking up to the reality that 6900 is more than 500</p>' = '<p id="text07">Thousands are waking up: 6900 outlaws &gt; 500 knights of Nottingham Finance</p>'

    '<p id="text03">WTF is Robin6900?</p>' = '<p id="text03">WTF is ROBIN6900?</p>'
    'This tiny coin is taking over the noosphere.' = 'This outlaw token is raiding the mempool of consciousness.'
    '<strong>We are <em>everywhere</em></strong>.' = '<strong>We rob from the fees. We give to the people.</strong>'

    '<p id="text56">Is the cure to male loneliness memeing Robin6900 with your friends?</p>' = '<p id="text56">Is the cure to male loneliness raiding the treasury of loneliness with your Merry Men?</p>'
    '<p id="text57">Explainer</p>' = '<p id="text57">The Hood Gospel</p>'
    '<p id="text58">The secret to life is PLOG: Peaceful Life Over Greed</p>' = '<p id="text58">The secret to life is RHOD: Robin Hood Over Despair</p>'
    '5 reasons why Gen Z thinks the traditional stock market is boring' = '5 reasons why Gen Z thinks the Sheriff''s stock market is rigged'
    'Vietnamese whale songs decoded - and they''re talking about tiny crypto tokens?' = 'Sherwood whale songs decoded — and they''re chanting $ROBIN?'
    '<p id="text27">Manifesto</p>' = '<p id="text27">The Sherwood Manifesto</p>'

    '<p id="text15">Federal Reserve Chairman Jerome Printwell Struggles to Balance the Pressures of Mass Money Printing </p>' = '<p id="text15">Sheriff Greedfoot of Wall Street Cannot Stop Printing Gold Certificates</p>'
    '<em>(Jerome Printwell and his out of control money printer.)</em>' = '<em>(Sheriff Greedfoot and his infinite tax machine.)</em>'

    '<p id="text01">Aeons are much more than just cute girls on the blockchain!</p>' = '<p id="text01">The Merry Men are more than legends — they''re on-chain!</p>'

    '<strong>Check Robin6900 Out On CoinGecko and CoinMarketCap!<br></strong>' = '<strong>Track $ROBIN Across the Realm — CoinGecko &amp; CoinMarketCap<br></strong>'
    'Robin Originals' = 'Robin Hood Originals'
    '<p id="text21">Stop trading and believe in something!</p>' = '<p id="text21">Stop paying the Sheriff. Start believing in the Hood.</p>'
    '<p id="text32">You ''ll never be able to see him in his final form!</p>' = '<p id="text32">You''ll never see him miss a shot in his final form.</p>'
    '<p id="text38">KOBE COMES BACK!? THE JOBS NOT DONE!?</p>' = '<p id="text38">ROBIN RETURNS!? THE HOOD''S NOT DONE!?</p>'
    '<p id="text29">George W Based!</p>' = '<p id="text29">Little John Based!</p>'

    '<span class="label">Etherscan</span>' = '<span class="label">RH L2 Explorer</span>'
    '<span class="label">Solscan</span>' = '<span class="label">Ethereum L1</span>'
    '<span class="label">Basescan</span>' = '<span class="label">Forest Bridge</span>'

    '<strong>CLICK THE ICONS BELOW TO SWAP ON RESPECTIVE DEX/CHAIN or APP</strong>' = '<strong>CLICK BELOW TO TRADE IN SHERWOOD — DEX &amp; BRIDGE</strong>'
    '<em>(SWAP on Uniswap (ETH), Jup.ag (SOL), or Aero (BASE)</em>' = '<em>(RAID on Robin Hood L2 DEX, Uniswap L1, or cross the Forest Bridge from ETH)</em>'

    '© 2023 by $ROBIN. All rights reserved!' = '© 2026 by $ROBIN &amp; the Merry Men. All rights reserved!'
    '<title>Robin6900 Website</title>' = '<title>ROBIN6900 — Sherwood Terminal</title>'
    'Powered by Mayhem' = 'Forged in Sherwood'
}

foreach ($key in $replacements.Keys) {
    if ($c.Contains($key)) {
        $c = $c.Replace($key, $replacements[$key])
    } else {
        Write-Warning "Pattern not found: $($key.Substring(0, [Math]::Min(60, $key.Length)))..."
    }
}

Set-Content $htmlPath $c -Encoding UTF8 -NoNewline
Write-Host "Theme pass 1 complete."
