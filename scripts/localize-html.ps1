$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$htmlPath = Join-Path $root "index.html"
$content = Get-Content $htmlPath -Raw -Encoding UTF8

function To-LocalAsset($url) {
    $clean = $url -replace '\?.*$', ''
    $uri = [Uri]$clean
    $hostName = $uri.Host -replace '\.', '_'
    $path = $uri.AbsolutePath.TrimStart('/')
    if (-not $path) { $path = "index" }
    return "assets/$hostName/$path"
}

# Map external asset URLs to local paths (images/videos only)
$pattern = 'https?://[^\s"''<>]+'
$matches = [regex]::Matches($content, $pattern)
$seen = @{}
foreach ($m in $matches) {
    $url = $m.Value -replace '&amp;', '&'
    if ($url -match '\.(png|jpg|jpeg|gif|webp|mp4|svg)(\?|$)' -or $url -match '/videos/[^?]+\.mp4') {
        if (-not $seen.ContainsKey($url)) {
            $local = To-LocalAsset $url
            $content = $content.Replace($url, $local)
            $seen[$url] = $true
        }
        $baseUrl = ($url -split '\?')[0]
        if ($url -ne $baseUrl -and -not $seen.ContainsKey($baseUrl)) {
            $local = To-LocalAsset $baseUrl
            $content = $content.Replace($baseUrl, $local)
            $seen[$baseUrl] = $true
        }
    }
}

# Rebrand visible text and meta (not third-party URLs)
$content = $content -replace '<title>SPX6900</title>', '<title>Robin6900</title>'
$content = $content -replace 'property="og:site_name">\s*SPX6900', 'property="og:site_name">Robin6900'
$content = $content -replace 'property="og:title">\s*SPX6900', 'property="og:title">Robin6900'
$content = $content -replace 'content="https://www\.spx6900\.com/"', 'content="https://robin6900.com/"'
$content = $content -replace 'href="https://spx6900\.com/"', 'href="https://robin6900.com/"'
$content = $content -replace '>SPX6900<', '>Robin6900<'
$content = $content -replace 'SPX6900 ', 'Robin6900 '
$content = $content -replace ' SPX6900', ' Robin6900'
$content = $content -replace '\$SPX', '$ROBIN6900'
$content = $content -replace 'SPX Originals', 'Robin Originals'
$content = $content -replace 'SPX6900 Labs', 'Robin6900 Labs'
$content = $content -replace 'SPX500', 'Robin500'
$content = $content -replace '© 2023 by \$SPX', '© 2026 by $ROBIN6900'
$content = $content -replace '© 2023 by \$ROBIN6900', '© 2026 by $ROBIN6900'
$content = $content -replace '<title>Robin6900 Website</title>', '<title>Robin6900 Website</title>'

Set-Content $htmlPath $content -Encoding UTF8 -NoNewline
Write-Host "HTML localized and rebranded at $htmlPath"
