$ErrorActionPreference = 'Continue'
# THIS IS ONLY FOR WINDOWS POWERSHELL!

# --- DEFINE REQUIRED PATHS ---
$wallpaperFolder = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'
$bmpFolder       = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers\BMP'
$scanFolder      = Join-Path $env:USERPROFILE 'Downloads'

# --- DEFINE YOUR IMAGE URLS HERE ---
$urls = @(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRouj0gv1XMNOShR9MgLwoXbsCJqpFFC44uUK1AxcOgpQ&s=10.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu144SO4KuTDq5BaLLiESkBgsZEA8meLvuCdzChIawaw&s=10.jpeg",
    "https://miro.medium.com/v2/resize:fit:720/format:webp/1*EO2BJYA4Z5uqA3VCcJN-Tw.jpeg"
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV1muN4IzLhLtX7tp5i8--VRACjYRvyUO_SYnn0AkieA&s=10.jpeg"
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXuaJpLaORI9ISARrkJOLAdOgV91vCD1F1TWXqjlTDQ&s=10.jpeg"
    "https://t.furaffinity.net/66418202@300-1789845041.jpg"
)

Start-Sleep -Seconds 0.5

function Paw {
    param([string]$Text, [string]$Color = 'Cyan')
    Write-Host "🐾  $Text" -ForegroundColor $Color
}

function Rainbow {
    param([string]$Text)
    $colors = @('Cyan', 'Blue', 'Magenta', 'Red', 'Yellow', 'Green')
    for ($i = 0; $i -lt $Text.Length; $i++) {
        Write-Host $Text[$i] -NoNewline -ForegroundColor $colors[$i % $colors.Count]
    }
    Write-Host
}

function Start-MicrosoftAccountSecurityCheck {
    Paw 'Opening the official Microsoft Account Security page...' 'Yellow'
    Paw 'Sign in to review recent activity, unfamiliar sign-ins, and security alerts.' 'Cyan'
    Paw 'This does not read email or passwords; only the account owner can review account data after signing in.' 'Cyan'
    Start-Process 'https://account.microsoft.com/security'
}

function Type-Text {
    param(
        [string]$Text,
        [string]$Color = 'Yellow',
        [int]$DelayMilliseconds = 15
    )
    foreach ($character in $Text.ToCharArray()) {
        if ($character -eq "`r") { continue }
        if ($character -eq "`n") { Write-Host }
        else { Write-Host $character -NoNewline -ForegroundColor $Color }
        Start-Sleep -Milliseconds $DelayMilliseconds
    }
    Write-Host
}

Clear-Host
Type-Text @'
Do you want to start this process? If you do, this means you agree to us deleting duplicate and bad files, downloading necessary files to run this Defender program, and briefly
changing your wallpaper or not if you don’t wanna. It will also open Your Microsoft Account (aka Outlook) so you can
check for breaches or unfamiliar-sign-in detections tied to your email account.

Email threat checking only works if you are signed in to Outlook.
This script does not read your email or passwords; only you can review protected
account information. We DO NOT want to know any of your private businesses and nor do we get to see what you have personalized. It is COMPLETELY under the ai’s job to check for breached emails, We do not get any notifications from your device. With that said. Have a fluffy day pup.
'@ 'Yellow' 6

$consent = Read-Host 'Type Yes to continue, or No to cancel'
if ($consent -notmatch '^(?i:y|yes)$') {
    Paw 'Operation canceled by user.' 'Yellow'
    exit
}

$bootPaw = @'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣀⠀⠀⠀⠀⠀⠘⡏⠓⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠘⡏⠑⢤⣀⠀⠀⠀⠘⢦⠀⠉⠒⠤⢄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠸⡄⠀⠈⠉⠒⠢⠤⢀⣳⣄⠀⠀⠀⠀⠉⠉⠑⠒⠒⠤⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠐⠒⠠⢄⡀⠀⢀⠀⠀⠉⠲⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢟⠉⠙⠛⢶⣶⡿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣦⠀⠀⠀⠉⠛⠢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣀⣈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠀⠀⠀⠀⠀⠀⠀⠈⠓⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡨⠿⠖⠛⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣀⠀⠀⠈⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢠⠔⠉⣀⠀⠀⠀⠘⣍⡓⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⢈⣆⠈⢣⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣰⣧⡴⠋⠁⠀⠀⠀⠀⠈⠻⠷⢤⠎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⠒⠒⠠⠤⣽⡖⠁⠀⠀⠳⡀⠀⠀⠀⠀⠀⠀⠀
⠀⢁⠞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⣷⣦⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢤⡀⠀⢈⠟⠀⠀⠀⠀⠈⠓⢤⡀⠀⠀⠀⠀
⠀⡎⢠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠚⢓⣶⡄⣀⣀⣀⣄⠀⠀⠀⠀⠀⠀⠈⠻⢯⡇⠀⠀⠀⠀⠀⠀⠀⣌⠑⢤⡀⠀
⢰⡷⠁⠀⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣉⠉⠁⠈⢉⡴⠋⠀⠀⠀⠀⠰⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢦⡀⠙⡆
⢸⠃⢀⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠒⠦⡀⠀⠀⠀⠈⠉⠲⡄⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇⢰⠃
⢸⣤⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢤⣉⠲⣿⣆⠀⠀⠀⠀⠀⠙⠹⣄⠤⠆⠀⠀⡀⠀⠀⠀⠀⡽⠃⠀
⠸⡇⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢾⣿⠗⠤⣀⠀⠀⠀⠀⠀⠀⠀⠓⠒⠻⣍⠢⣀⣤⠞⠀⠀⠀
⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣧⡀⠀⠉⠒⠠⣄⡀⠀⠀⠀⠀⢀⡷⡌⣧⠀⠀⠀⠀
⠀⠀⢸⡀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⠇⠀⠀⠀⠀⢨⣿⡷⠶⠶⠿⠋⠀⠸⡿⠀⠀⠀⠀
⠀⠀⠀⢧⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡏⠀⠀⠀⠐⢦⠀⠙⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠈⢧⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠱⣄⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠳⣽⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣆⠀⠀⠀⠀⠀⣿⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⠈⠻⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⠀⠀⠀⠀⠀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⣄⡀⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⡆⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠒⠾⡷⠤⠤⣀⣀⠀⠀⠀⠀⠀⠀⠀⢠⠀⣸⣠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠈⠉⠑⠢⢄⠀⡄⠀⣼⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⣷⣠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'@
Clear-Host
Write-Host $bootPaw -ForegroundColor Magenta
Rainbow 'F.T.O.P.S PATROL — Fur Team Online Protection Services'
Start-Sleep -Seconds 2

for ($i = 1; $i -le 5; $i++) {
    Write-Progress -Activity 'PHASE 1/3 — PAW BOOT-(this might take some time, hold on to your tail pup)' -Status '🐾 Loading Pawtection Core...' -PercentComplete ($i * 20)
    Paw '[PHASE 1/3 — PAW BOOT-(I love that smile on your face pup)] Furry security systems loading...' 'Magenta'
    Start-Sleep -Seconds 2
}
for ($i = 1; $i -le 10; $i++) {
    Write-Progress -Activity 'PHASE 2/3 — FLUFF FIREWALL-(Your quite cool for letting us do this, good pup)' -Status '🐾 Calibrating floof firewall...' -PercentComplete ($i * 10)
    Paw '[PHASE 2/3 — FLUFF FIREWALL-(Hru today pup?)] Furry security systems loading...' 'Magenta'
    Start-Sleep -Seconds 4
}
for ($i = 1; $i -le 10; $i++) {
    Write-Progress -Activity 'PHASE 3/3 — F.T.O.P.S RESPONSE-(Did you know that more movies are becoming furry like?)' -Status '🐾 Preparing F.T.O.P.S response...' -PercentComplete ($i * 10)
    Paw '[PHASE 3/3 — F.T.O.P.S RESPONSE] Furry security systems loading...' 'Magenta'
    Start-Sleep -Seconds 1
}
Write-Progress -Activity 'F.T.O.P.S Boot' -Completed
Start-Sleep -Seconds 1

New-Item -ItemType Directory -Force -Path $wallpaperFolder, $bmpFolder | Out-Null
Add-Type -AssemblyName System.Drawing

for ($i = 0; $i -lt $urls.Count; $i++) {
    $file = Join-Path $wallpaperFolder "furry-paw-$($i + 1).jpg"
    $temporaryFile = "$file.download"
    Paw "Downloading wallpaper $($i + 1) of $($urls.Count)..." 'Yellow'
    try {
        Remove-Item -LiteralPath $temporaryFile -Force -ErrorAction SilentlyContinue
        Invoke-WebRequest -Uri $urls[$i] -OutFile $temporaryFile -ErrorAction Stop
        $testImage = [System.Drawing.Image]::FromFile($temporaryFile)
        $testImage.Dispose()
        Move-Item -LiteralPath $temporaryFile -Destination $file -Force
        Paw "Wallpaper $($i + 1) downloaded to $wallpaperFolder and verified." 'Green'
    } catch {
        Remove-Item -LiteralPath $temporaryFile -Force -ErrorAction SilentlyContinue
        Paw "Could not download wallpaper $($i + 1): $($_.Exception.Message)" 'Yellow'
    }
}

Clear-Host
for ($i = 1; $i -le 40; $i++) {
    Write-Progress -Activity 'PHASE 4/4 — PAWTECTION CORE-(Whos a goodboy?)' -Status 'High-floof systems loading...' -PercentComplete (($i / 40) * 100)
    if ($i % 5 -eq 0) { Rainbow "PAW SIGNAL STABLE — $([int](($i / 40) * 100))%" }
    Start-Sleep -Seconds 2
}
Write-Progress -Activity 'PHASE 4/4' -Completed

if (Get-Command Start-MpScan -ErrorAction SilentlyContinue) {
    Paw 'Starting a real Windows Defender quick scan...' 'Yellow'
    Start-MpScan -ScanType QuickScan
    Paw 'Defender quick scan has been started. Check Windows Security for results.' 'Green'
} else { Paw 'Defender scan command is unavailable.' 'Yellow' }

try {
    $firewall = (Get-NetFirewallProfile | Where-Object Enabled).Name -join ', '
    $connections = @(Get-NetTCPConnection -State Established -ErrorAction SilentlyContinue).Count
    Paw "Enabled firewall profiles: $firewall" 'Green'
    Paw "Established TCP connections right now: $connections" 'Cyan'
} catch { Paw 'Network status check was unavailable.' 'Yellow' }

Start-MicrosoftAccountSecurityCheck

Paw 'Checking Downloads for exact duplicate files...' 'Yellow'
$hashes = @{}
Get-ChildItem -Path $scanFolder -File -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    try {
        $hash = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256 -ErrorAction Stop).Hash
        if (-not $hashes.ContainsKey($hash)) { $hashes[$hash] = @() }
        $hashes[$hash] += $_.FullName
    } catch { }
}

$duplicates = $hashes.GetEnumerator() | Where-Object { $_.Value.Count -gt 1 }
if ($duplicates) {
    Paw 'Duplicate files found:' 'Yellow'
    $duplicates | ForEach-Object { $_.Value | ForEach-Object { Write-Host "   $_" } }
} else { Paw 'No exact duplicate files found in Downloads.' 'Green' }

Start-Process 'https://sofurry.com/'
Start-Process 'https://en.wikifur.com/'
Start-Process 'https://FurryCons.com/'
Start-Process 'https://furrynetwork.com/'
Start-Process 'https://furaffinity.net/'
Start-Process 'https://furtrack.com/'

$finalPaw = @'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⠄⠀⠀⠀⠀⢀⣠⣴⣶⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⢛⡝⠁⠀⠀⠀⠀⠐⠿⢿⡼⠃⠀⠀⠀⠀⠀⢠⠀⠀
⠀⠀⠀⠀⠀⠀⣀⣉⣉⣉⠙⠀⠀⣀⣤⣶⣾⣿⣷⡄⠁⠀⠀⠀⠀⢀⣴⢿⠀⠀
⠀⠀⠀⢀⣴⣿⣿⣟⠯⢹⡇⢀⣾⣿⣿⣿⣿⡍⣸⡇⠀⠀⠀⠀⠐⢿⣃⡞⠀⠀
⠀⠀⣰⣿⣿⣿⣿⡙⢀⣾⠃⣼⣿⣿⣿⡟⠇⣰⡟⢀⣠⣾⣿⣿⣧⠈⡿⠁⠀⠀
⠀⠀⣿⡿⣯⠛⠆⢀⣼⠇⠀⢻⣿⣿⡇⣁⣴⢟⣵⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀
⠀⠀⠈⠛⠶⠾⠿⠛⠁⠀⢀⣀⣈⣙⠛⠋⠁⣾⣿⣿⣿⠻⠉⣽⠃⠀⠀⠀⠀⣠
⠀⣀⣴⣶⣶⣦⣤⣤⣶⣾⣿⣿⣿⣿⣿⣶⡄⣿⣿⠏⠉⢀⣾⠃⠀⠀⢀⣠⣾⡟
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠏⣿⡈⠛⠛⠛⢋⣡⣴⣶⣤⠹⣇⡾⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⢀⣿⠀⢀⣴⣿⣿⣿⣿⣿⣿⠀⠟⠀⠀
⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠁⢸⡟⠀⣸⣿⣿⣿⢻⠏⣹⠏⠀⠀⠀⠀
⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠘⣿⡀⢹⡿⠃⠋⣀⡼⠋⠀⠀⠀⠀⠀
⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⡿⢦⠁⠀⣸⡇⠈⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢻⣿⣿⠻⣿⡙⠛⠀⣠⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠻⠷⣤⣴⣶⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'@
Clear-Host
Write-Host $finalPaw -ForegroundColor Magenta
Write-Host '                Have a fluff-tastic day!' -ForegroundColor Green
Start-Sleep -Seconds 2

function Set-FtopsSlideshow {
    [CmdletBinding()]
    param(
        [string]$Folder = $wallpaperFolder,
        [int]$IntervalSeconds = 60
    )

    if (-not (Test-Path -LiteralPath $Folder -PathType Container)) {
        Paw "Wallpaper folder does not exist: $Folder" 'Yellow'
        return
    }

    $images = Get-ChildItem -LiteralPath $Folder -File | 
        Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|bmp)$' }

    if ($images.Count -eq 0) {
        Paw "No valid images found in $Folder" 'Yellow'
        return
    }

    $wallpaperKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers'
    if (-not (Test-Path $wallpaperKey)) { New-Item -Path $wallpaperKey -Force | Out-Null }

    Set-ItemProperty -Path $wallpaperKey -Name BackgroundType -Value 2 -Type DWord
    Set-ItemProperty -Path $wallpaperKey -Name SlideshowDirectoryPath -Value $Folder -Type String

    $desktopKey = 'HKCU:\Control Panel\Desktop'
    Set-ItemProperty -Path $desktopKey -Name WallpaperStyle -Value '10'
    Set-ItemProperty -Path $desktopKey -Name TileWallpaper -Value '0'

    $intervalMs = [Math]::Max(10000, $IntervalSeconds * 1000)
    Set-ItemProperty -Path 'HKCU:\Control Panel\Personalization\Desktop Slideshow' -Name Interval -Value $intervalMs -Type DWord -ErrorAction SilentlyContinue

    $firstImage = $images[0].FullName
    $code = @'
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
    [Wallpaper]::SystemParametersInfo(20, 0, $firstImage, 3) | Out-Null

    Start-Process -FilePath (Join-Path $env:SystemRoot 'System32\rundll32.exe') `
        -ArgumentList 'user32.dll,UpdatePerUserSystemParameters 1, True' -Wait -WindowStyle Hidden

    Write-Host "Slideshow enabled for folder: $Folder" -ForegroundColor Green
    Write-Host "Total images: $($images.Count)" -ForegroundColor Green
}

Set-FtopsSlideshow -IntervalSeconds 60
Start-Sleep -Seconds 2

$closingArt = @'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣡⢶⣶⣶⡈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣡⣾⣿⢋⢱⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⢃⡆⢿⣿⣧⠈⣿⣿⣿⣿⣿⣿⣿⣿⠟⣰⣿⣿⠁⣼⡈⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⠃⣩⡑⡈⢿⣿⣇⠸⣿⣿⣿⣿⣿⣿⡟⢰⣿⣿⠏⣠⣆⠃⢹⣇⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⡌⣴⣿⣷⡐⠘⣿⣿⡄⢿⣿⣿⣿⣿⣿⣿⣿⡟⢰⣿⣿⣿⠘⣿⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡃⣼⢡⡿⠟⣻⣿⠆⢻⣿⣷⠸⣿⣿⣿⣿⣾⣿⣿⣇⢈⡄⠙⠛⡀⢹⡇⠛⠹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⡇⣇⠀⣿⢨⣂⣬⣤⣴⡇⣸⣿⣿⣦⠘⣿⣿⣾⣿⠿⠿⢿⡈⠿⢿⢿⣿⡈⡟⣠⡇⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⢰⡄⢻⣆⠹⠘⠿⠋⠁⠀⠀⠀⠀⠀⠀⠁⠈⠉⠈⠀⠀⠀⠀⠀⠀⠈⢈⡉⢿⣷⡰⣿⠃⢡⢀⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡌⣿⣶⠟⣣⡀⠀⢴⡤⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠁⠈⠙⢷⣰⡟⣸⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣧⠹⠁⠈⡁⠀⠀⡉⠁⠀⠀⠀⠀⣀⣠⣴⣾⣷⣴⣤⣤⣤⣤⣤⣤⣴⣾⣿⣦⣬⣿⡙⠿⠁⣿⣿⣿⡿⢿⣿
⣧⣬⡙⠤⣤⡖⣠⣴⣿⣷⡾⠨⠀⠀⡼⢿⣿⠁⣭⡉⢻⣿⣿⣿⣿⠟⣩⡍⠙⣿⣿⣿⣿⣿⣿⣿⣿⣷⣴⣶⣤⡤⢂⣼⣿
⣿⣿⣿⣧⣌⣉⠭⢉⣁⣠⣤⣤⠖⠁⠀⡀⢀⠁⠘⠃⣸⣿⣿⣿⣿⣈⡛⠁⣀⡂⠀⡠⠈⣿⣿⣿⡿⢿⣿⡿⢋⣴⣿⣿⣿
⣯⠙⣛⢛⣫⣵⣾⣿⣿⣿⣿⣿⠀⡇⠰⠠⣿⣧⠘⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⡇⢂⡁⢧⣽⣿⣿⣷⣌⠡⢶⣿⡿⠿⠟⣻
⣷⣌⣉⡡⠆⣼⣿⣿⣿⣿⣧⠀⡇⠀⣀⠸⠛⠀⢻⣿⣿⣿⣿⣿⡏⠀⠭⠩⢠⠄⣁⣾⣛⣿⣿⣿⣿⡿⠷⠖⣂⣥⣾⣿
⣧⡉⢭⣵⣶⣧⣀⣭⣽⣿⢿⣿⣿⣿⣶⣦⣭⣴⣤⠟⠛⠋⠙⠛⠻⣿⣶⣿⣷⣿⣿⣿⣿⣿⡿⣿⣿⣿⣓⠂⠩⠿⠿⣿⣿
⣿⣿⡶⣹⡀⠛⢿⣿⣿⣟⠈⣿⣿⡿⠿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⠿⠿⣿⣿⠁⢀⣿⣿⣿⣿⡍⠡⣾⣿⣿
⣟⠡⢞⡛⣻⣦⣽⣿⣿⣿⣦⠸⣿⣷⡀⠸⣿⣿⣿⣿⣷⡆⢰⣾⣿⣿⣿⣿⣿⠋⣤⣶⣿⠇⢠⣾⣿⣿⣿⣿⡇⢿⣿⣿⣿
⣿⡿⢋⣴⣿⣿⣿⣿⣿⠿⣿⣦⡘⢿⣿⣖⠛⠿⣿⣿⠟⠃⠘⢻⣿⣿⣿⠿⠛⣿⣿⠟⠋⣤⣿⣿⣿⠿⢿⣿⡈⣤⣼⣿⣿
⣿⣤⣯⣭⣭⣶⣆⢩⣶⣾⣿⣿⣿⣦⡈⠻⣷⣤⣄⠠⣶⡇⣶⣤⡄⢠⣥⣴⣾⠟⣡⣴⣿⣿⣿⣿⣿⣷⡀⢙⠣⠘⣻⣿⣿
⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⢛⠿⣶⡌⠛⢿⣦⣉⣛⣛⣉⣴⠿⠛⢉⣤⣾⣿⣿⣿⣿⣿⣿⢿⣿⡷⠬⢙⣻⣿⣿⣿
⣿⣿⣿⣿⣭⣐⡛⠿⢛⢋⣿⣿⣿⣆⠓⣶⣿⣿⣶⣦⣤⣤⣭⣽⣦⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⢷⣶⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣟⣠⣛⣛⣛⣥⣾⢸⡟⠀⣿⣿⣿⣿⣿⢻⣿⠿⡻⢿⣿⣿⣿⡿⢿⣿⢛⣭⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠣⢠⠹⣿⣿⡟⣡⣆⣋⣸⣿⣆⣿⠏⣴⡌⢿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠛⢠⣴⣿⣿⣿⣿⣿⡄⢋⣾⣿⣿⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
'@
Clear-Host
Write-Host $closingArt -ForegroundColor Magenta
Rainbow 'Thank you for letting F.T.O.P.S protect you! (The Best Boy! I know you are watching)'
Start-Sleep -Seconds 4

# --- STARTUP REPAIR & ESCALATED SYSTEM RECOVERY SECTION ---
Clear-Host
Paw "F.T.O.P.S SYSTEM MAINTENANCE & ADVANCED REPAIR" "Yellow"
Write-Host

Type-Text @'
WARNING: Escalated System Repair Protocol

Would you like to initiate the full automated repair suite?
If confirmed, this process will run all available system repair tools in order:
  0. Pre-Scan System Integrity & Active Threat Check
  1. System File Checker (sfc /scannow)
  2. DISM Deployment Image Servicing & Management (Check, Scan, & RestoreHealth)
  3. EFI Bootloader & BCD Rebuild (bcdboot / bootsect fallback for UEFI/GPT)
  4. System Drive Disk Scan & Sector Repair (chkdsk C: /f /r)
  5. Windows System Reset (Factory Reset)
  6. Advanced Boot Environment Repair (WinRE)
  7. USB Installation Media Guidance

This process requires Administrator privileges.
'@ 'Cyan' 20

Write-Host
$repairConsent = Read-Host 'Do you want to proceed with full System Repair? (Type Y or N)'

if ($repairConsent -match '^(?i:y\vert{}yes)$') {
    Paw 'Elevating privileges for system recovery...' 'Yellow'

    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)

    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Paw 'Re-launching script with Administrator privileges...' 'Cyan'
        Start-Process powershell -Verb RunAs -ArgumentList '-NoExit', '-Command', @"
            Write-Host '🐾 F.T.O.P.S Repair Console Launched with Administrator Privileges.' -ForegroundColor Yellow
            
            # PHASE 0: Pre-scan for Infected or Corrupted Files
            Write-Host '`n[STEP 0/6] Pre-scanning system for infected and corrupted files...' -ForegroundColor Cyan
            dism /online /cleanup-image /checkhealth
            
            if (Get-Command Start-MpScan -ErrorAction SilentlyContinue) {
                Write-Host 'Scanning active processes and system files for threats...' -ForegroundColor Gray
                Start-MpScan -ScanType QuickScan
            }
            
            # PHASE 1: SFC Scan
            Write-Host '`n[STEP 1/6] Running System File Checker (sfc /scannow)...' -ForegroundColor Cyan
            sfc /scannow
            
            # PHASE 2: DISM Image Repair
            Write-Host '`n[STEP 2/6] Running DISM Component Store & Health Repair...' -ForegroundColor Cyan
            dism /online /cleanup-image /scanhealth
            dism /online /cleanup-image /restorehealth
            
            # PHASE 3: EFI Bootloader & BCD Rebuild
            Write-Host '`n[STEP 3/6] Repairing Bootloader & BCD Configuration...' -ForegroundColor Cyan
            bootsect /nt60 ALL /force /mbr
            bcdboot C:\Windows /l en-us /s C: /f ALL
            
            # PHASE 4: Disk Check
            Write-Host '`n[STEP 4/6] Scheduling Disk Check and Corrupt Sector Repair...' -ForegroundColor Cyan
            chkdsk C: /f /r
            
            # EVALUATION & ESCALATION
            Write-Host '`n[EVALUATION] Checking system file repair status...' -ForegroundColor Yellow
            \$sfcCheck = sfc /scannow
            
            \$systemRepaired = \$true
            if (\$sfcCheck -like "*Windows Resource Protection found corrupt files and was unable to fix them*") {
                \$systemRepaired = \$false
                Write-Host '`n[STEP 5/6] System repair failed. Initiating System Reset Options...' -ForegroundColor Red
                
                \$resetChoice = Read-Host 'Automated repairs failed. Do you want to initiate a System Reset / Factory Reset? (Type Y or N)'
                if (\$resetChoice -match '^(?i:y|yes)\$') {
                    Write-Host 'Launching Windows Reset System...' -ForegroundColor Red
                    systemreset -factoryreset
                } else {
                    Write-Host 'Attempting Windows Recovery Environment (WinRE) Startup Repair...' -ForegroundColor Yellow
                    reagentc /enable
                    shutdown /r /o /t 5
                }
            } else {
                Write-Host '`n🐾 System repairs completed successfully!' -ForegroundColor Green
            }
            
            if (-not \$systemRepaired) {
                Start-Sleep -Seconds 4
                Clear-Host
                
                \$failedArt = @'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣛⣋⣭⣥⣶⣶⣶⣶⣶⣭⣭⣙⡻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣥⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⣝⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢛⣛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣫⣶⣿⣿⣿⣿⣷⣦⣍⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢞⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⢀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⢇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣩⣭⣵⣶⣶⣶⣶⣬⣭⣑⡘⠿⣿⣿⣿⣿⣿⣿⠿⠟⠴⠟⣛⣛⣛⣛⣋⣛⡛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣥⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠐⠀⠁⠀⠂⠘⡩⡴⠶⠛⠋⠘⠉⠉⠉⢹⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⢏⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡻⣿⣿⣿⣿⣿⣿⣿⢃⣠⣤⣬⣤⣤⣤⡡⡶⢛⢠⣶⣿⣧⡀⠀⠀⡀⠀⢸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢹⡿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡸⣿⣿⡏⣭⣭⣥⣾⣿⣿⣿⣿⣿⣿⢋⡄⡾⡿⠛⠻⣿⣿⣷⣤⣄⡀⠼⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿      ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⢿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⢢⣥⣿⣶⣿⣿⣿⣿⡿⠰⣷⣦⣭⡛⢿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣷⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⡿⢡⣯⣿⣿⠿⢛⣡
⠟⠉⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡍⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢱⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠟⣡⣿⣿⣿⣿⣶⡍⢿
⠀⠀⢀⠠⠀⠀⡀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⡿⢛⠻⠿⠉⠀⠀⠀⠀⠀⠉⠻⡟⢡⣶⣶⣿
⠀⠀⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢩⣭⣭⣥⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢿⣿⣿⣿⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⢿⣿⣿⣿⣿⣿⠇⣌⡑⠡⣺⣿⠁⠀⠀⣖⣒⡦⡤⡄⠀⠁⣾⣿⣿⣿
⠀⠀⠀⠄⠀⡀⠄⠀⠀⠀⠁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣤⣾⣧⣽⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣾⣿⣿⣿⣿⣿⠀⢳⣿⣿⣿⣿⣷⣄⠀⠀⠉⠐⠓⠃⢀⣦⢻⣿⣿⣿
⠀⠀⠁⢀⠀⠀⡀⠄⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⡈⣿⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣉⣙⠻⠟⣋⣉⣁⡓⠻⠿⣿⣿⡿⡉⠏⣉⣶⣶⣶⣶⣶⣿⠙⠓⢹⣿⣿
⣷⣄⡀⠀⠠⠀⠀⢀⠀⠀⠠⠐⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⣋⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣇⣿⣿⣿⣿⣿⣿⡇⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡿⢋⣤⣾⣿⣿⣿⣿⣿⣦⠈⣿⣷⣿⣿⣾⣯⡈⢿⣿⣿⣿⣿⢏⣼⣿⣿
⣿⣿⣿⣷⣦⣄⣈⠀⠀⠠⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⠿⢛⣫⣥⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠡⣿⣿⣿⣿⣿⣿⠇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣶⡦⠭⢉⣴⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣬⣭⣭⣭⣩⣭⣭⣥⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⡙⡛⢛⣛⣡⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣶⣤⣭⣭⣭⣭⣴⣶⣶⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣦⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢿⡿⢟⣛⣫⣭⣿⣿⣭⣽⣛⡿⣿⡌⣿⣿⣿⣿⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⡟⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣬⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠻⣿⣿⣿⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣹⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣁⣉⣡⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣎⣿⣿⣿⣿⡿⢛⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣥⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⡏⣸⣿⡿⠟⣋⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⣃⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⠃⣛⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⢤⣼⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠈⣩⣴⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣡⠦⠟⣃⠲⠀⠀⣴⣿⣿⣿⣷⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣋⣴⡾⢫⣠⣾⣿⢿⠙⠀⠀⠈⠻⣿⣿⣿⣗⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣛⣥⣴⣦⡄⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣩⣶⣿⣿⡟⣰⣿⠛⢿⠁⠀⠀⠀⠀⠀⠀⠀⠙⢿⢿⣦⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣩⣶⣿⣿⣿⣿⣿⡇⣷⣷⣠⣶⡇⠀⠀⢀⠈⠀⠀⠀⠀⠠⢉⣰⡆⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣼⣿⣿⡿⠙⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⢋⣥⣏⡀⠀⠀⠀⠀⠀⠈⠀⠀⠀⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣼⡿⣿⣿⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣯⢻⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣭⣤⡄⠀⠀⠀⠀⠁⠀⠐⠀⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⡏⠁⠀⢻⡆⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⠈⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⡆⠿⠛⣋⣥⣴⣶⣿⣿⣿⣿⣿⣿⣿⣤⣍⢷⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣇⣀⣤⣿⣿⣶⣶⣤⣴⣾⣿⣿⣿⣿⡏⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣠⣴⣿⣿⣿⣿⣿⣿⠇⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠂⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⡿⠙⠋⠛⠛⣿⡏⠉⠉⣿⣿⣿⡿⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣿⣿⣿⣿⠏⠀⠀⠉⠉⠙⠛⢿⣿⣿⣿⣿⡅⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⢡⣏⣀⣀⣼⢹⣇⠀⣰⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠻⠿⠿⠿⠌⠿⠿⠟⣋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⠟⠙⢻⣦⣤⣄⣠⣤⣤⣴⣿⠿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣧⡀⣀⣼⠻⣿⠟⠓⢻⣿⡿⠁⠀⠈⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⡿⢸⣇⠀⠀⣸⡛⣷⣦⣤⣾⣿⠗⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⠻⢣⣿⣿⣷⣿⣿⣧⠹⣿⠿⢛⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⢬⣍⣉⣉⣉⡭⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

'@
                Write-Host \$failedArt -ForegroundColor Magenta
                
                Write-Host 'Oof! >-< We tried everything we could! Sorry but here are the instructions to fix your PC!' -ForegroundColor White
                Start-Sleep -Seconds 4
                
                Write-Host '========================================================================' -ForegroundColor Magenta
                Write-Host '1. Obtain a working USB Flash Drive (at least 8 GB).' -ForegroundColor White
                Write-Host '2. Plug the USB flash drive into another working computer.' -ForegroundColor White
                Write-Host '3. Go to official Microsoft website: https://www.microsoft.com/software-download/windows11' -ForegroundColor White
                Write-Host '4. Download the "Create Windows 11 Installation Media" tool.' -ForegroundColor White
                Write-Host '5. Run the tool to convert the USB flash drive into a bootable Windows Installer.' -ForegroundColor White
                Write-Host '6. Insert the USB into the broken computer, boot into BIOS/Boot Menu (usually F12, F11, or DEL),' -ForegroundColor White
                Write-Host '   and select "Repair your computer" or perform a clean reinstall.' -ForegroundColor White
                Write-Host '========================================================================' -ForegroundColor Magenta
            }
"@
    }
    Paw 'System Repair Execution Started in Elevated Window!' 'Green'
} else {
    Paw 'Startup Repair skipped. Your session is complete.' 'Cyan'
}

# Define wallpaper folder path
$wallpaperFolder = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'

# Verify folder exists and contains valid images
if (Test-Path -Path $wallpaperFolder) {
    $images = Get-ChildItem -Path $wallpaperFolder -File | Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|bmp)$' }
    
    if ($images.Count -gt 0) {
        # Configure Windows Registry for Desktop Slideshow
        $wallpaperKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers'
        if (-not (Test-Path $wallpaperKey)) { New-Item -Path $wallpaperKey -Force | Out-Null }
        
        # Set Background Type to Slideshow (Value 2)
        Set-ItemProperty -Path $wallpaperKey -Name BackgroundType -Value 2 -Type DWord
        Set-ItemProperty -Path $wallpaperKey -Name SlideshowDirectoryPath -Value $wallpaperFolder -Type String

        # Set Wallpaper Style to Fill ('10') and disable Tiling ('0')
        $desktopKey = 'HKCU:\Control Panel\Desktop'
        Set-ItemProperty -Path $desktopKey -Name WallpaperStyle -Value '10'
        Set-ItemProperty -Path $desktopKey -Name TileWallpaper -Value '0'

        # Set rotation interval (60000 ms = 1 minute)
        Set-ItemProperty -Path 'HKCU:\Control Panel\Personalization\Desktop Slideshow' -Name Interval -Value 60000 -Type DWord -ErrorAction SilentlyContinue

        # Apply immediate update via User32 API
        $firstImage = $images[0].FullName
        $code = @'
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@
        Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
        [Wallpaper]::SystemParametersInfo(20, 0, $firstImage, 3) | Out-Null

        # Force Explorer to refresh system parameters
        Start-Process -FilePath (Join-Path $env:SystemRoot 'System32\rundll32.exe') -ArgumentList 'user32.dll,UpdatePerUserSystemParameters 1, True' -Wait -WindowStyle Hidden

        Write-Host "Success! Desktop background set to slideshow from: $wallpaperFolder" -ForegroundColor Green
    } else {
        Write-Host "No valid images found in $wallpaperFolder. Make sure the images are downloaded first." -ForegroundColor Yellow
    }
} else {
    Write-Host "Folder does not exist: $wallpaperFolder" -ForegroundColor Red
}
Start-Sleep -Seconds 2
exit 0
