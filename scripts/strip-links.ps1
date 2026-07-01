$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$htmlPath = Join-Path $root "index.html"
$c = [System.IO.File]::ReadAllText($htmlPath)

$twitter = "https://x.com/Robin6900index"
$telegram = "https://t.me/Robin6900RH"
$buy = "https://fun.noxa.fi/robinhood"

$nav = @"
    <ul class="links" data-visibility="desktop" id="links04">
    <li class="n03">
    <a href="$twitter" target="_blank" rel="noopener noreferrer">TWITTER</a>
    </li>
    <li class="n02">
    <a href="$telegram" target="_blank" rel="noopener noreferrer">TELEGRAM</a>
    </li>
    <li class="n04">
    <a href="$buy" id="buy-link" target="_blank" rel="noopener noreferrer">BUY</a>
    </li>
    </ul>
"@

$footerNav = @"
    <ul class="links" data-visibility="mobile" id="links07">
    <li class="n03">
    <a href="$twitter" target="_blank" rel="noopener noreferrer">TWITTER</a>
    </li>
    <li class="n02">
    <a href="$telegram" target="_blank" rel="noopener noreferrer">TELEGRAM</a>
    </li>
    <li class="n04">
    <a href="$buy" target="_blank" rel="noopener noreferrer">BUY</a>
    </li>
    </ul>
"@

$c = [regex]::Replace($c, '(?s)<ul class="links" data-visibility="desktop" id="links04">.*?</ul>', $nav)
$c = [regex]::Replace($c, '(?s)<ul class="links" data-visibility="mobile" id="links07">.*?</ul>', $footerNav)
$c = [regex]::Replace($c, '(?s)<ul class="links" id="links01">.*?</ul>', '')

# Remove social gallery in header
$c = [regex]::Replace($c, '(?s)<div class="gallery full" id="gallery03">.*?</div>\s*</div>\s*</div>', '</div></div>')

# Remove explorer buttons and dex gallery
$c = [regex]::Replace($c, '(?s)<ul class="buttons" id="buttons06">.*?</ul>', '')
$c = [regex]::Replace($c, '(?s)<p id="text51">.*?</p>', '')
$c = [regex]::Replace($c, '(?s)<div class="gallery full" id="gallery01">.*?</div>\s*</div>', '')

# Remove coingecko/cmc linked block
$c = [regex]::Replace($c, '(?s)<strong>Track \$ROBIN Across the Realm.*?</a>\s*', '')

# Unwrap any remaining external links but keep inner content
$c = [regex]::Replace($c, '<a[^>]*href="https?://[^"]*"[^>]*>', '')
$c = [regex]::Replace($c, '<a[^>]*href="/cdn-cgi[^"]*"[^>]*>', '')
$c = $c -replace '</a>', ''

# Fix asset paths for Vercel static hosting
$c = $c -replace '(?<==")assets/', '/assets/'
$c = $c -replace '(?<==")/assets//assets/', '/assets/'

# Fix dexscreener image query string
$c = $c -replace '/assets/dd_dexscreener_com/ds-data/tokens/solana/J3NKxxXZcnNiMjKw9hYb2K4LUxgwB6t1FtPtQVsv3KFr\.png\?[^"]*', '/assets/dd_dexscreener_com/ds-data/tokens/solana/J3NKxxXZcnNiMjKw9hYb2K4LUxgwB6t1FtPtQVsv3KFr.png'

# Add buy anchor id to tokenomics block
$c = $c -replace '<div id="embed03">', '<div id="buy"></div><div id="embed03">'

# Plain contact text
$c = $c -replace 'Contact: \[email[^\]]*\][^<]*', 'Contact: hello@robin6900.com'

$utf8 = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($htmlPath, $c, $utf8)
Write-Host "Links stripped and asset paths fixed."
