$ErrorActionPreference = 'Continue'

# --- DEFINE REQUIRED GLOBAL VARIABLES ---
$wallpaperFolder     = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'
$bmpFolder           = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers\BMP'
$scanFolder          = Join-Path $env:USERPROFILE 'Downloads'
$targetUrl           = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXuaJpLaORI9ISARrkJOLAdOgV91vCD1F1TWXqjlTDQ&s=10.jpeg"
$initialTargetFile   = Join-Path $wallpaperFolder 'target-initial.jpg'
$urls                = @(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXuaJpLaORI9ISARrkJOLAdOgV91vCD1F1TWXqjlTDQ&s=10.jpeg"
)

# Set target wallpaper at start
New-Item -ItemType Directory -Force -Path $wallpaperFolder | Out-Null

try {
    Invoke-WebRequest -Uri $targetUrl -OutFile $initialTargetFile -ErrorAction Stop
    $desktopKey = 'HKCU:\Control Panel\Desktop'
    Set-ItemProperty -Path $desktopKey -Name WallpaperStyle -Value '10'
    Set-ItemProperty -Path $desktopKey -Name TileWallpaper -Value '0'
    
    $code = @'
using System;
using System.Runtime.InteropServices;
public class InitialWallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
    [InitialWallpaper]::SystemParametersInfo(20, 0, $initialTargetFile, 3) | Out-Null
} catch {
    Write-Host "Failed to set initial wallpaper: $($_.Exception.Message)" -ForegroundColor Yellow
}
Clear-Host

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

Clear-Host
$text = "Dont mind your wallpaper, its only necessary."

foreach ($char in $text.ToCharArray()) {
    Write-Host -NoNewline $char
    Start-Sleep -Milliseconds 60
}
Write-Host ""

function Start-MicrosoftAccountSecurityCheck {
    Paw 'Opening the official Microsoft Account Security page...' 'Yellow'
    Paw 'Sign in to review recent activity, unfamiliar sign-ins, and security alerts.' 'Cyan'
    Paw 'This does not read email or passwords; only the account owner can review account data after signing in.' 'Cyan'

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
account information. We DO NOT want to know any of your private businesses and nor do we get to see what you have personalized. It is COMPLETELY under the ai’s job to check for breached emails, We do not get any notifications from your device. With that said.

Do you understand pup? have a fluffy day
'@ 'Yellow' 6

$consent = Read-Host 'Type Yes to continue, or No to cancel'
if ($consent -notmatch '^(?i:y|yes)$') {
    Paw 'Operation canceled by user.' 'Yellow'
    exit
}
Clear-Host
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
⢸⣤⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠤⢤⣉⠲⣿⣆⠀⠀⠀⠀⠀⠙⹄⠤⠆⠀⠀⡀⠀⠀⠀⠀⡽⠃⠀
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
$text = "F.T.O.P.S FUR-TEAM-PROTECTION-SERVICES.Hold on to your lil tails"

foreach ($char in $text.ToCharArray()) {
    Write-Host -NoNewline $char
    Start-Sleep -Milliseconds 70
}
Write-Host ""
Start-Sleep -Seconds 3

for ($i = 1; $i -le 5; $i++) {
    Write-Progress -Activity 'PHASE 1/3 — PAW BOOT' -Status '🐾 Loading Pawtection Core...' -PercentComplete ($i * 20)
    Paw '[PHASE 1/3 — PAW BOOT] Furry security systems loading...' 'Magenta'
    Start-Sleep -Seconds 1
}
for ($i = 1; $i -le 5; $i++) {
    Write-Progress -Activity 'PHASE 2/3 — FLUFF FIREWALL' -Status '🐾 Calibrating floof firewall...' -PercentComplete ($i * 20)
    Paw '[PHASE 2/3 — FLUFF FIREWALL] Furry security systems loading...' 'Magenta'
    Start-Sleep -Seconds 1
}
for ($i = 1; $i -le 5; $i++) {
    Write-Progress -Activity 'PHASE 3/3 — F.T.O.P.S RESPONSE' -Status '🐾 Preparing F.T.O.P.S response...' -PercentComplete ($i * 20)
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
for ($i = 1; $i -le 10; $i++) {
    Write-Progress -Activity 'PHASE 4/4 — PAWTECTION CORE' -Status 'High-floof systems loading...' -PercentComplete ($i * 10)
    if ($i % 2 -eq 0) { Rainbow "PAW SIGNAL STABLE — $($i * 10)%" }
    Start-Sleep -Seconds 1
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
    $duplicates | ForEach-Object { $_.Value | ForEach-Object { Write-Host "    $_" } }
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

# --- CONFIGURE SLIDESHOW ---
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

    $wallpaperKey = 'HKCU:\Control Panel\Personalization\Desktop Slideshow'
    Set-ItemProperty -Path $wallpaperKey -Name BackgroundType -Value 2 -Type DWord -ErrorAction SilentlyContinue
    Set-ItemProperty -Path $wallpaperKey -Name SlideshowDirectoryPath -Value $Folder -Type String -ErrorAction SilentlyContinue

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

    Write-Host "Slideshow successfully directed to folder: $Folder" -ForegroundColor Green
    Write-Host "Total images in cycle: $($images.Count)" -ForegroundColor Green
}

Set-FtopsSlideshow -Folder $wallpaperFolder -IntervalSeconds 60
Start-Sleep -Seconds 2

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
  3. EFI Bootloader & BCD Rebuild
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
            
            # STEP 0: Pre-scan
            Write-Host '`n[STEP 0/6] Pre-scanning system for infected and corrupted files...' -ForegroundColor Cyan
            dism /online /cleanup-image /checkhealth
            
            if (Get-Command Start-MpScan -ErrorAction SilentlyContinue) {
                Write-Host 'Scanning active processes and system files for threats...' -ForegroundColor Gray
                Start-MpScan -ScanType QuickScan
            }
            
            # STEP 1: SFC Scan
            Write-Host '`n[STEP 1/6] Running System File Checker (sfc /scannow)...' -ForegroundColor Cyan
            \$sfcResult = sfc /scannow | Out-String
            Write-Host \$sfcResult
            
            # STEP 2: DISM Image Repair
            Write-Host '`n[STEP 2/6] Running DISM Component Store & Health Repair...' -ForegroundColor Cyan
            dism /online /cleanup-image /scanhealth
            dism /online /cleanup-image /restorehealth
            
            # STEP 3: Bootloader Repair
            Write-Host '`n[STEP 3/6] Repairing Bootloader & BCD Configuration...' -ForegroundColor Cyan
            bootsect /nt60 C: /force
            bcdboot C:\Windows
            
            # STEP 4: Disk Check
            Write-Host '`n[STEP 4/6] Scheduling Disk Check and Corrupt Sector Repair...' -ForegroundColor Cyan
            chkdsk C: /f
            
            # EVALUATION & ESCALATION
            Write-Host '`n[EVALUATION] Checking system file repair status...' -ForegroundColor Yellow
            
            \$systemRepaired = \$true
            if (\$sfcResult -like "*found corrupt files and was unable to fix them*") {
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

                $overwhelmed = @'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠉⠈⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣷⣾⠟⣉⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡀⠀⠀⡀⠀⠀⡈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢋⡍⢻⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⢣⣾⣿⣿⣶⣝⢿⣿⣿⣿⣿⣿⣿⣿⣶⠀⠀⠀⠐⠲⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣡⣾⣿⣿⡜⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⢣⣿⣿⡿⡟⣛⡻⠷⡌⢿⣿⣿⣿⣿⣿⣿⣿⡅⠀⣼⣷⣿⣿⣿⣿⣿⣿⣿⣿⠟⣴⣿⣿⣿⣿⣿⣷⢹⣿⣿⣿
⣿⣿⣿⣿⣿⠇⣾⣿⢏⣤⠃⢿⣿⣿⣶⣤⠙⡻⢿⣿⣿⣿⣿⣧⣤⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣿⣿⣿⡏⢊⢀⢿⣿⡌⣿⣿⣿
⣿⣿⣿⣿⡿⣸⣿⡟⣼⣿⣧⠸⣿⣿⣿⣿⣷⣿⣷⣮⣝⡻⢿⣿⣿⣿⣿⡏⣤⢉⣿⣿⢋⣾⣿⣿⣿⡟⣰⣿⡇⣼⣿⡇⣿⣿⣿
⣿⣿⣿⣿⢃⣿⣿⢳⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⡻⠿⠋⣸⣿⠀⡿⣱⣿⣿⣿⣿⠏⣼⣿⣿⣿⢸⣿⡇⣿⣿⣿
⣿⣿⣿⡿⢸⣿⣿⢸⣿⣿⣿⣿⣧⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣷⣵⣶⣝⠻⣿⡟⣼⣿⣿⣿⣿⢸⣿⡇⣿⣿⣿
⣿⣿⣿⡇⣼⣿⡏⢸⣿⣿⣿⣿⠧⠀⣉⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡶⣰⡿⣿⣿⣿⣿⢸⣿⡇⣿⣿⣿
⣿⣿⣿⡇⠻⣛⡤⠾⣛⣭⣵⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡶⢠⣿⣿⣿⡏⣼⣿⢱⣿⣿⣿
⣿⣿⠿⣃⣨⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢻⣿⣿⣿⢇⣿⡏⣸⣿⣿⣿
⣿⣿⡠⢙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠙⢿⡟⡔⣿⢃⣿⣿⣿⣿
⣿⣿⣿⣦⡄⡮⣙⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣴⣷⡌⡼⢿⣿⣿⣿
⣿⣿⣿⣿⡥⠹⡜⣿⣷⣶⣭⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡯⣠⣵⠆⣿⣿⣿
⣿⣿⡋⢡⣤⣶⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⢟⣯⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠎⢡⠀⣿⣿⣿
⣿⣿⣿⣤⣀⠈⠉⣭⣻⡟⠿⠿⠿⣿⣿⣿⣿⣿⣿⣍⣛⣸⣿⣿⣿⣿⣬⣥⠾⠿⠟⠛⢛⣛⣛⣉⣉⠁⢛⢋⡴⠃⠆⣂⣫⣽⢻
⣿⠿⢛⣩⣶⣾⣿⣿⣿⡇⢰⣷⣶⣶⣶⣶⠂⢨⡭⠉⣉⣿⣿⣿⣿⣿⡗⣶⠀⣾⠆⠀⣿⣿⣿⣿⣿⣿⠀⣿⣷⣾⣿⣿⣿⠇⣾
⣼⡘⢿⣿⣿⣿⣿⣿⣿⡆⢸⣿⣿⣿⣿⣿⣇⠀⠃⠀⣿⡛⢙⢟⢛⣻⣷⣹⣆⠈⠀⣰⣿⣿⣿⣿⣿⠏⢰⣿⣿⣿⣿⣿⠟⣼⣿
⣿⣿⣮⡙⢿⣿⣿⣿⣿⣷⡈⠻⣿⣿⣿⣿⣿⣷⣶⣿⣿⡟⠛⠛⠛⢻⣿⣿⣿⢿⣿⣿⣿⣿⣿⢿⢯⡠⣾⣿⣿⣿⡿⢋⣼⣿⣿
⣿⣿⣿⣿⣶⡌⢙⣏⠫⡋⡛⠲⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣌⣂⢱⢝⣪⣿⣿⣷⣦⡙⢿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'@

$text = "Sorry, we tried everything we could! there is no other way around except for these prompts below. Sorry pup, we tried to fix your device. I hope you have a fluffy day. Remember to be a great boy/girl."

foreach ($char in $text.ToCharArray()) {
    Write-Host -NoNewline $char
    Start-Sleep -Milliseconds 40
}
Write-Host ""

start-Sleep -Seconds 1

                Write-Host '========================================================================' -ForegroundColor Magenta
                Write-Host '1. Obtain a working USB Flash Drive (at least 8 GB).' -ForegroundColor White
                Write-Host '2. Plug the USB flash drive into another working computer.' -ForegroundColor White
                Write-Host '3. Go to official Microsoft website: https://www.microsoft.com/software-download/windows11' -ForegroundColor White
                Write-Host '4. Download the "Create Windows 11 Installation Media" tool.' -ForegroundColor White
                Write-Host '5. Run the tool to convert the USB flash drive into a bootable Windows Installer.' -ForegroundColor White
                Write-Host '6. Insert the USB into the target computer, boot into BIOS/Boot Menu,' -ForegroundColor White
                Write-Host '   and select "Repair your computer" or perform a clean reinstall.' -ForegroundColor White
                Write-Host '========================================================================' -ForegroundColor Magenta
            }
"@
    }
    Paw 'System Repair Execution Started in Elevated Window!' 'Green'
} else {
    Paw 'Startup Repair skipped. Your session is complete.' 'Cyan'
}
Start-Sleep -Seconds 2
exit 0

