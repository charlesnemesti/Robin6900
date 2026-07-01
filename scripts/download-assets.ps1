$ErrorActionPreference = "Continue"
$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$assetsDir = Join-Path $root "assets"

$urls = @(
    "https://spx.uwu.ai/assets/images/card.jpg?v=e04cab75",
    "https://i.ibb.co/N2zg6BWB/28081-2.png",
    "https://spx.uwu.ai/assets/images/gallery03/78b6292c.png?v=e04cab75",
    "https://d21buns5ku92am.cloudfront.net/26628/images/419679-1x1_SoundCloudLogo_cloudmark-f5912b-large-1645807040.jpg",
    "https://storage.googleapis.com/pr-newsroom-wp/1/2023/05/Spotify_Primary_Logo_RGB_White.png",
    "https://i.imgur.com/ws2kAA0.png",
    "https://i.ibb.co/xqdPShjh/aeon-logo.png",
    "https://i.ibb.co/xqC04gZP/spx500.png",
    "https://spx.uwu.ai/assets/videos/video01.mp4.jpg?v=e04cab75",
    "https://spx.uwu.ai/assets/videos/video01.mp4",
    "https://i.ibb.co/wrhCr0J1/Untitled.png",
    "https://spx.uwu.ai/assets/videos/video04.mp4.jpg?v=e04cab75",
    "https://spx.uwu.ai/assets/videos/video04.mp4",
    "https://i.ibb.co/spDNhjYQ/aeon-new.png",
    "https://i.ibb.co/YTLM2GcK/glow.jpg",
    "https://i.ibb.co/tpSQ06Bp/7b2fd50296242db4a238849daabcf0a6.jpg",
    "https://i.ibb.co/B5S71DGM/031c918065aab46740c92fe49beaf88f.jpg",
    "https://dd.dexscreener.com/ds-data/tokens/solana/J3NKxxXZcnNiMjKw9hYb2K4LUxgwB6t1FtPtQVsv3KFr.png?size=lg&key=655313",
    "https://spx.uwu.ai/assets/images/gallery01/e9b03406.png?v=e04cab75",
    "https://spx.uwu.ai/assets/images/gallery01/f1c189b1.png?v=e04cab75",
    "https://spx.uwu.ai/assets/images/gallery01/65056e12.jpg?v=e04cab75",
    "https://spx.uwu.ai/assets/images/gallery01/80af6e51.png?v=e04cab75",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wSYWfbBGBKMQL1MwcFspgJULhRUYxHqBAQ&s",
    "https://s3-eu-west-1.amazonaws.com/tpd/logos/5900cd240000ff0005a144b5/0x0.png",
    "https://spx.uwu.ai/assets/videos/video14.mp4.jpg?v=e04cab75",
    "https://spx.uwu.ai/assets/videos/video14.mp4",
    "https://spx.uwu.ai/assets/videos/video15.mp4.jpg",
    "https://spx.uwu.ai/assets/videos/video15.mp4",
    "https://spx.uwu.ai/assets/videos/video16.mp4.jpg?v=e04cab75",
    "https://spx.uwu.ai/assets/videos/video16.mp4",
    "https://spx.uwu.ai/assets/videos/video05.mp4.jpg?v=e04cab75",
    "https://spx.uwu.ai/assets/videos/video05.mp4"
)

function Get-LocalPath($url) {
    $clean = $url -replace '\?.*$', ''
    $uri = [Uri]$clean
    $hostName = $uri.Host -replace '\.', '_'
    $path = $uri.AbsolutePath.TrimStart('/')
    if (-not $path) { $path = "index" }
    return Join-Path $assetsDir "$hostName\$path"
}

foreach ($url in $urls) {
    $localPath = Get-LocalPath $url
    $dir = Split-Path $localPath -Parent
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    if (Test-Path $localPath) {
        Write-Host "Skip (exists): $localPath"
        continue
    }
    try {
        Write-Host "Downloading: $url"
        Invoke-WebRequest -Uri $url -OutFile $localPath -UserAgent "Mozilla/5.0" -TimeoutSec 120
    } catch {
        Write-Warning "Failed: $url - $_"
    }
}

Write-Host "Done. Assets saved to $assetsDir"
