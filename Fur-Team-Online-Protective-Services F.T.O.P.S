$ErrorActionPreference = 'Continue'
#THIS IS ONLY FOR WINDOWS POWERSHELL! LINUX IS BEING DEVELOPED AS WELL AS STARTUP REPAIRS!!!!
# F.T.O.P.S: A script that provides security checks, runs the extra parameters so that you are secured, and adds a furry wallpaper to your background. you can obviously keep it or not
Start-Sleep -Seconds 2
$wallpaperFolder = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'
$bmpFolder = Join-Path $wallpaperFolder 'bmp'
$scanFolder = Join-Path $env:USERPROFILE 'Downloads'
$intervalSeconds = 60
function Paw {
   param([string]$Text, [string]$Color = 'Cyan')
   Write-Host "🐾  $Text" -ForegroundColor $Color
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
account information. We DO NOT want to know any of your private businesses and nor do we get to see what you have personalized. It is COMPLETELY under the ai’s job to check for breached emails, we also do not get any notifications from YOUR DEVICE. With that said, Have a fluffy day.
'@ 'Yellow' 32
$consent = Read-Host 'Type Yes to continue, or No to cancel'
if ($consent -notmatch '^(?i:y|yes)$') {
   Write-Host 'FPD Wallpaper Patrol was cancelled. No downloads or system changes were made.' -ForegroundColor Cyan
   exit 0
}
$bootPaw = @'
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣀⠀⠀⠀⠀⠀⠘⡏⠓⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠘⡏⠑⢤⣀⠀⠀⠀⠘⢦⠀⠉⠒⠤⢄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠸⡄⠀⠈⠉⠒⠢⠤⢀⣳⣄⠀⠀⠀⠀⠉⠉⠑⠒⠒⠤⠤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
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
⠸⡇⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢾⣿⠗⠤⣀⠀⠀⠀⠀⠀⠀⠓⠒⠻⣍⠢⣀⣤⠞⠀⠀⠀
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
$urls = @(
   'https://tse4.mm.bing.net/th/id/OIP.xnMkw0BlXjkNA-UI9XGb2wHaQd?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
   'https://th.bing.com/th/id/OIP.88cgGTKzwTJ6VjZ2Q15k3AHaHa?w=170&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
   'https://th.bing.com/th/id/OIP.D8aEa5SxTWc0E_NZofnxIQHaHC?w=192&h=184&c=7&r=0&o=7&pid=1.7&rm=3',
   'https://th.bing.com/th/id/OIP.xC7dHxbazYqTqJIdYUFH_AHaHZ?w=183&h=182&c=7&r=0&o=7&pid=1.7&rm=3'
)
for ($i = 0; $i -lt $urls.Count; $i++) {
   $file = Join-Path $wallpaperFolder "furry-paw-$($i + 1).jpg"
   $temporaryFile = "$file.download"
   Paw "Downloading wallpaper $($i + 1) of $($urls.Count)..." 'Yellow'
   try {
       Remove-Item -LiteralPath $temporaryFile -Force -ErrorAction SilentlyContinue
       Invoke-WebRequest -Uri $urls[$i] -OutFile $temporaryFile -ErrorAction Stop
       # A Bing error page may still download successfully; opening it as an image
       # ensures only actual wallpapers replace the existing file.
       $testImage = [System.Drawing.Image]::FromFile($temporaryFile)
       $testImage.Dispose()
       Move-Item -LiteralPath $temporaryFile -Destination $file -Force
       Paw "Wallpaper $($i + 1) downloaded and verified." 'Green'
   } catch {
       Remove-Item -LiteralPath $temporaryFile -Force -ErrorAction SilentlyContinue
       Paw "Could not download a usable wallpaper $($i + 1): $($_.Exception.Message)" 'Yellow'
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
# Microsoft account activity is protected behind the account owner's sign-in.
# This opens the official review page; it does not attempt to collect credentials.
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
   $duplicates | ForEach-Object { $_.Value | ForEach-Object { Write-Host "  $_" } }
} else { Paw 'No exact duplicate files found in Downloads.' 'Green' }
# These open the same 6 community resources.
Start-Process 'https:/sofurry.com/'
Start-Process 'https:/en.wikifur.com/'
Start-Process 'https:/FurryCons.com/'
Start-Process 'https:/furrynetwork.com/'
Start-Process 'https:/furaffinity.net/'
Start-Process 'https:/furtrack.com/'
$finalPaw = @'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⠄⠀⠀⠀⠀⢀⣠⣴⣶⠟⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⢛⡝⠁⠀⠀⠀⠀⠐⠿⢿⡼⠃⠀⠀⠀⠀⠀⢠⠀⠀
⠀⠀⠀⠀⠀⠀⣀⣉⣉⣉⠙⠀⠀⣀⣤⣶⣾⣿⣷⡄⠁⠀⠀⠀⠀⢀⣴⢿⠀⠀
⠀⠀⠀⢀⣴⣿⣿⣟⠯⢹⡇⢀⣾⣿⣿⣿⣿⡍⣸⡇⠀⠀⠀⠀⠐⢿⣃⡞⠀⠀
⠀⠀⣰⣿⣿⣿⣿⡙⢀⣾⠃⣼⣿⣿⣿⡟⠇⣰⡟⢀⣠⣾⣿⣿⣧⠈⡿⠁⠀⠀
⠀⠀⣿⡿⣯⠛⠆⢀⣼⠇⠀⢻⣿⣿⡇⣁⣴⢟⣵⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀
⠀⠀⠈⠛⠶⠾⠿⠛⠁⠀⢀⣀⣈⣙⠛⠋⠁⣾⣿⣿⣿⠻⠉⣽⠃⠀⠀⠀⠀⣠
⠀⣀⣴⣶⣶⣦⣤⣤⣶⣾⣿⣿⣿⣿⣿⣶⡄⣿⣿⠏⠉⢀⣾⠃⠀⠀⢀⣠⣾⡟
⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠏⣿⡈⠛⠛⠛⢋⣡⣴⣶⣤⠹⣇⡾⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⢀⣿⠀⢀⣴⣿⣿⣿⣿⣿⣿⠀⠟⠀⠀
⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠁⢸⡟⠀⣸⣿⣿⣿⢻⠏⣹⠏⠀⠀⠀⠀
⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠘⣿⡀⢹⡿⠃⠋⣀⡼⠋⠀⠀⠀⠀⠀
⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⡿⢦⠁⠀⣸⡇⠈⠛⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢻⣿⣿⠻⣿⡙⠛⠀⣠⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠻⠷⣤⣴⣶⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'@
Clear-Host
Write-Host $finalPaw -ForegroundColor Magenta
Write-Host '              Have a fluff-tastic day!' -ForegroundColor Green
Start-Sleep -Seconds 2
if (-not ('FpdSlideshow' -as [type])) {
   Add-Type @'
using System;
using System.Runtime.InteropServices;
[ComImport, Guid("B92B56A9-8B55-4E14-9A89-0199BBB6F93B"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IDesktopWallpaper {
   void SetWallpaper([MarshalAs(UnmanagedType.LPWStr)] string monitorId, [MarshalAs(UnmanagedType.LPWStr)] string wallpaper);
   IntPtr GetWallpaper([MarshalAs(UnmanagedType.LPWStr)] string monitorId);
   IntPtr GetMonitorDevicePathAt(uint monitorIndex);
   uint GetMonitorDevicePathCount();
   void GetMonitorRECT([MarshalAs(UnmanagedType.LPWStr)] string monitorId, IntPtr displayRect);
   void SetBackgroundColor(uint color);
   uint GetBackgroundColor();
   void SetPosition(int position);
   int GetPosition();
   void SetSlideshow(IntPtr items);
   IntPtr GetSlideshow();
   void SetSlideshowOptions(uint options, uint slideshowTick);
   void GetSlideshowOptions(out uint options, out uint slideshowTick);
   void AdvanceSlideshow([MarshalAs(UnmanagedType.LPWStr)] string monitorId, int direction);
   int GetStatus();
   void Enable([MarshalAs(UnmanagedType.Bool)] bool enable);
}
public static class FpdSlideshow {
   private static readonly Guid ShellItemIid = new Guid("43826D1E-E718-42EE-BC55-A1E261C37BFE");
   private static readonly Guid DesktopWallpaperClsid = new Guid("C2CF3110-460E-4FC1-B9D0-8A1C0C9CC4BD");
   [DllImport("shell32.dll", CharSet = CharSet.Unicode, PreserveSig = true)]
   private static extern int SHCreateItemFromParsingName(string path, IntPtr bindContext, ref Guid riid, out IntPtr shellItem);
   [DllImport("shell32.dll", PreserveSig = true)]
   private static extern int SHCreateShellItemArrayFromShellItem(IntPtr shellItem, out IntPtr shellItemArray);
   public static void Start(string folder, uint intervalMilliseconds) {
       IntPtr folderItem = IntPtr.Zero;
       IntPtr itemArray = IntPtr.Zero;
       try {
           Guid shellItemIid = ShellItemIid;
           Marshal.ThrowExceptionForHR(SHCreateItemFromParsingName(folder, IntPtr.Zero, ref shellItemIid, out folderItem));
           Marshal.ThrowExceptionForHR(SHCreateShellItemArrayFromShellItem(folderItem, out itemArray));
           var desktop = (IDesktopWallpaper)Activator.CreateInstance(Type.GetTypeFromCLSID(DesktopWallpaperClsid));
           desktop.SetSlideshow(itemArray);
           desktop.SetSlideshowOptions(0, intervalMilliseconds); // 0 = no shuffle
           desktop.AdvanceSlideshow(null, 0); // show the first image immediately
           Marshal.ReleaseComObject(desktop);
       }
       finally {
           if (itemArray != IntPtr.Zero) Marshal.Release(itemArray);
           if (folderItem != IntPtr.Zero) Marshal.Release(folderItem);
       }
   }
}
'@
}
$converted = @()
Get-ChildItem -Path $wallpaperFolder -File | Where-Object { $_.Extension -match '^\.(jpg|jpeg|png)$' } | ForEach-Object {
   try {
       $image = [System.Drawing.Image]::FromFile($_.FullName)
       $output = Join-Path $bmpFolder "$($_.BaseName).bmp"
       $bitmap = [System.Drawing.Bitmap]::new($image)
       $bitmap.Save($output, [System.Drawing.Imaging.ImageFormat]::Bmp)
       $bitmap.Dispose()
       $image.Dispose()
       # Confirm the converted asset can be opened before putting it in rotation.
       $verifiedBitmap = [System.Drawing.Image]::FromFile($output)
       $verifiedBitmap.Dispose()
       $converted += (Resolve-Path -LiteralPath $output).Path
       Paw "Converted: $($_.Name)" 'Green'
   } catch {
       Paw "Could not convert $($_.Name)" 'Yellow'
       if ($image) { $image.Dispose() }
       if ($bitmap) { $bitmap.Dispose() }
   }
}
$wallpaperImages = @(Get-ChildItem -Path $wallpaperFolder -File -ErrorAction SilentlyContinue |
   Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|bmp)$' })
if ($wallpaperImages.Count -eq 0) {
   Paw "No wallpaper images are directly inside: $wallpaperFolder" 'Red'
   return
}
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallpaperStyle -Value '10'
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallpaper -Value '0'
try {
   # Configure the exact settings that the normal Windows Personalization page uses:
   # BackgroundType 2 = Slideshow, with the selected album set to our wallpaper folder.
   $slideshowSettings = 'HKCU:\Control Panel\Personalization\Desktop Slideshow'
   $wallpaperSettings = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers'
   New-Item -Path $slideshowSettings -Force | Out-Null
   New-Item -Path $wallpaperSettings -Force | Out-Null
   New-ItemProperty -Path $slideshowSettings -Name 'Interval' -PropertyType DWord -Value ($intervalSeconds * 1000) -Force | Out-Null
   New-ItemProperty -Path $slideshowSettings -Name 'Shuffle' -PropertyType DWord -Value 0 -Force | Out-Null
   New-ItemProperty -Path $wallpaperSettings -Name 'BackgroundType' -PropertyType DWord -Value 2 -Force | Out-Null
   New-ItemProperty -Path $wallpaperSettings -Name 'SlideshowDirectoryPath' -PropertyType String -Value $wallpaperFolder -Force | Out-Null
   New-ItemProperty -Path $wallpaperSettings -Name 'SlideshowDirectoryPath1' -PropertyType String -Value $wallpaperFolder -Force | Out-Null
   # Ask Windows to reload the normal Personalization settings, then show them.
   Start-Process -FilePath (Join-Path $env:SystemRoot 'System32\rundll32.exe') -ArgumentList 'user32.dll,UpdatePerUserSystemParameters 1, True' -Wait
   $backgroundType = (Get-ItemProperty -Path $wallpaperSettings -Name 'BackgroundType').BackgroundType
   $album = (Get-ItemProperty -Path $wallpaperSettings -Name 'SlideshowDirectoryPath').SlideshowDirectoryPath
   if ($backgroundType -ne 2 -or $album -ne $wallpaperFolder) { throw 'Windows did not retain the requested slideshow album.' }
   Paw "Windows Background mode: Slideshow" 'Green'
   Paw "Slideshow album selected: $wallpaperFolder" 'Green'
   Paw "Wallpaper changes every $intervalSeconds seconds. Slideshow applied." 'Magenta'
} catch {
   Paw "Windows slideshow could not be enabled: $($_.Exception.Message)" 'Red'
   Paw "Verified wallpapers are stored in: $wallpaperFolder" 'Yellow'
}
$closingArt = @'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠟⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣡⢶⣶⣶⡈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣡⣾⣿⢋⢱⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⢃⡆⢿⣿⣧⠈⣿⣿⣿⣿⣿⣿⣿⣿⠟⣰⣿⣿⠁⣼⡈⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⠃⣩⡑⡈⢿⣿⣇⠸⣿⣿⣿⣿⣿⣿⡟⢰⣿⣿⠏⣠⣆⠃⢹⣇⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⡌⣴⣿⣷⡐⠘⣿⣿⡄⢿⣿⣿⣿⣿⣿⢁⣿⣿⡟⢰⣿⣿⣿⠘⣿⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡃⣼⢡⡿⠟⣻⣿⠆⢻⣿⣷⠸⣿⣿⣿⣿⢃⣾⣿⣿⣇⢈⡄⠙⠛⡀⢹⡇⠛⠹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⡇⣇⠀⣿⢨⣂⣬⣤⣴⡇⣸⣿⣿⣦⠘⣿⣿⢁⣾⣿⠿⠿⢿⡈⠿⢿⢿⣿⡈⡟⣠⡇⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⢰⡄⢻⣆⠹⠘⠿⠋⠁⠀⠀⠀⠀⠀⠀⠁⠈⠉⠈⠀⠀⠀⠀⠀⠀⠈⢈⡉⢿⣷⡰⣿⠃⢡⢀⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡌⣿⣶⠟⣣⡀⠀⢴⡤⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠁⠈⠙⢷⣰⡟⣸⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣧⠹⠁⠈⡁⠀⠀⡉⠁⠀⠀⠀⠀⣀⣠⣴⣾⣷⣴⣤⣤⣤⣤⣤⣤⣴⣾⣿⣦⣬⣿⡙⠿⠁⣿⣿⣿⡿⢿⣿
⣧⣬⡙⠤⣤⡖⣠⣴⣿⣷⡾⠨⠀⠀⡼⢿⣿⠁⣭⡉⢻⣿⣿⣿⣿⠟⣩⡍⠙⣿⣿⣿⣿⣿⣿⣿⣿⣷⣴⣶⣤⡤⢂⣼⣿
⣿⣿⣿⣧⣌⣉⠭⢉⣁⣠⣤⣤⠖⠁⠀⡀⢀⠁⠘⠃⣸⣿⣿⣿⣿⣈⡛⠁⣀⡂⠀⡠⠈⣿⣿⣿⡿⢿⣿⡿⢋⣴⣿⣿⣿
⣯⠙⣛⢛⣫⣵⣾⣿⣿⣿⣿⣿⠀⡇⠰⠠⣿⣧⠘⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⡇⢂⡁⢧⣽⣿⣿⣷⣌⠡⢶⣿⡿⠿⠟⣻
⡟⣷⣌⣉⡡⠆⣼⣿⣿⣿⣿⣧⠀⡇⠀⣀⠸⠛⠀⢻⣿⣿⣿⣿⣿⡏⠀⠭⠩⢠⠄⣁⣾⣛⣿⣿⣿⣿⡿⠷⠖⣂⣥⣾⣿
⣧⡉⢭⣵⣶⣧⣀⣭⣽⣿⢿⣿⣿⣿⣶⣦⣭⣴⣤⠟⠛⠋⠙⠛⠻⣿⣶⣿⣷⣿⣿⣿⣿⣿⡿⣿⣿⣿⣓⠂⠩⠿⠿⣿⣿
⣿⣿⡶⣹⡀⠛⢿⣿⣿⣟⠈⣿⣿⡿⠿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⠿⠿⣿⣿⠁⢀⣿⣿⣿⣿⡍⠡⣾⣿⣿
⣟⠡⢞⡛⣻⣦⣽⣿⣿⣿⣦⠸⣿⣷⡀⠸⣿⣿⣿⣿⣷⡆⢰⣾⣿⣿⣿⣿⣿⠋⣤⣶⣿⠇⢠⣾⣿⣿⣿⣿⡇⢿⣿⣿⣿
⣿⡿⢋⣴⣿⣿⣿⣿⣿⠿⣿⣦⡘⢿⣿⣖⠛⠿⣿⣿⠟⠃⠘⢻⣿⣿⣿⠿⠛⣿⣿⠟⠋⣤⣿⣿⣿⠿⢿⣿⡈⣤⣼⣿⣿
⣿⣤⣯⣭⣭⣶⣆⢩⣶⣾⣿⣿⣿⣦⡈⠻⣷⣤⣄⠠⣶⡇⣶⣤⡄⢠⣥⣴⣾⠟⣡⣴⣿⣿⣿⣿⣿⣷⡀⢙⠣⠘⣻⣿⣿
⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⢛⠿⣶⡌⠛⢿⣦⣉⣛⣛⣉⣴⠿⠛⢉⣤⣾⣿⣿⣿⣿⣿⣿⢿⣿⡷⠬⢙⣻⣿⣿⣿
⣿⣿⣿⣿⣭⣐⡛⠿⢛⢋⣿⣿⣿⣆⠓⣶⣿⣿⣶⣦⣤⣤⣭⣽⣦⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⢷⣶⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣟⣠⣛⣛⣛⣥⣾⢸⡟⠀⣿⣿⣿⣿⣿⢻⣿⠿⡻⢿⣿⣿⣿⡿⢿⣿⢛⣭⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠣⢠⠹⣿⣿⡟⣡⣆⣋⣸⣿⣆⢻⣿⠏⣴⡌⢿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠛⢠⣴⣿⣿⣿⣿⣿⡄⢋⣾⣿⣿⣤⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
'@
Clear-Host
Write-Host $closingArt -ForegroundColor Magenta
Rainbow 'Thank you for letting F.T.O.P.S to protect you!(The Best Boy! I know your watching)'
Start-Sleep -Seconds 4


# --- STARTUP REPAIR & ESCALATED SYSTEM RECOVERY SECTION ---
Clear-Host
Paw "F.T.O.P.S SYSTEM MAINTENANCE & ADVANCED REPAIR" "Yellow"
Write-Host

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

    # Verify or request Administrator privileges
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)

    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Paw 'Re-launching script with Administrator privileges...' 'Cyan'
        Start-Process powershell -Verb RunAs -ArgumentList '-NoExit', '-Command', @"
            Write-Host '🐾 F.T.O.P.S Repair Console Launched with Administrator Privileges.' -ForegroundColor Yellow
            
            # PHASE 0: Pre-scan for Infected or Corrupted Files
            Write-Host '`n[STEP 0/6] Pre-scanning system for infected and corrupted files...' -ForegroundColor Cyan
            
            # Check image integrity status
            dism /online /cleanup-image /checkhealth
            
            # Run Defender threat scan on memory and system boot files if Defender is active
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
            Write-Host 'Updating master boot code on all partitions...' -ForegroundColor Gray
            bootsect /nt60 ALL /force /mbr
            
            Write-Host 'Rebuilding BCD store from OS image using BCDBoot...' -ForegroundColor Gray
            bcdboot C:\Windows /l en-us /s C: /f ALL
            
            # PHASE 4: Disk Check
            Write-Host '`n[STEP 4/6] Scheduling Disk Check and Corrupt Sector Repair...' -ForegroundColor Cyan
            chkdsk C: /f /r
            
            # EVALUATION & ESCALATION
            Write-Host '`n[EVALUATION] Checking system file repair status...' -ForegroundColor Yellow
            $sfcCheck = sfc /scannow
            
            $systemRepaired = `$true
            if (`$sfcCheck -like "*Windows Resource Protection found corrupt files and was unable to fix them*") {
                $systemRepaired = `$false
                Write-Host '`n[STEP 5/6] System repair failed. Initiating System Reset Options...' -ForegroundColor Red
                
                $resetChoice = Read-Host 'Automated repairs failed. Do you want to initiate a System Reset / Factory Reset? (Type Y or N)'
                if (`$resetChoice -match '^(?i:y\vert{}yes)$') {
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
            
            # FINAL FALLBACK SCREEN IF ALL AUTOMATED REPAIRS AND RESETS FAIL
            if (-not `$systemRepaired) {
                Start-Sleep -Seconds 4
                Clear-Host
                
                `$overwhelmedArt = @'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣛⣋⣭⣥⣶⣶⣶⣶⣶⣭⣭⣙⡻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣥⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⣝⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣫⣶⣿⣿⣿⣿⣷⣦⣍⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢋⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿ ⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢞⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⢀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⢇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣿⣿⣭⣵⣶⣶⣶⣶⣬⣭⣑⡘⠿⣿⣿⣿⣿⣿⣿⠿⠟⠴⠟⣛⣛⣛⣛⣋⣛⡛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣥⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠐⠀⠁⠀⠂⠘⡩⡴⠶⠛⠋⠘⠉⠉⠉⢹⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢣⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⢏⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡻⣿⣿⣿⣿⣿⣿⢃⣠⣤⣬⣤⣤⣤⡡⡶⢛⢠⣶⣿⣧⡀⠀⠀⡀⠀⢸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢠⣿⣿⣿⣿⣿⣿⣿⣿⡟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢹⡿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡸⣿⣿⡏⣭⣭⣥⣾⣿⣿⣿⣿⣿⣿⣿⡄⡾⡿⠛⠻⣿⣿⣷⣤⣄⡀⠼⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⢃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡴⡈⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣙⢿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡃⢢⣥⣿⣶⣿⣿⣿⣿⡿⠰⣷⣦⣭⡛⢿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣷⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⡿⢡⣯⣿⣿⠿⢛⣡
 ⠉⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡍⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢱⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠟⣡⣿⣿⣿⣿⣶⡍⢿
⠀⠀⢀⠠⠀⠀   ⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⡿⢛⠻⠿⠉⠀⠀⠀⠀⠀⠉⠻⡟⢡⣶⣶⣿
⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⢩⣭⣭⣥⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢿⣿⣿⣿⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡘⢿⣿⣿⣿⣿⣿⠇⣌⡑⠡⣺⣿⠁⠀⠀⣖⣒⡦⡤⡄⠀⠁⣾⣿⣿⣿
⠀⠀⠄⠀⡀⠄⠀⠀⠀⠁⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣤⣾⣧⣽⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣾⣿⣿⣿⣿⣿⠀⢳⣿⣿⣿⣿⣷⣄⠀⠀⠉⠐⠓⠃⢀⣦⢻⣿⣿⣿
⠀⠀⠁⢀⠀⠀⡀⠄⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⡈⣿⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣉⣙⠻⠟⣋⣉⣁⡓⠻⠿⣿⣿⡿⡉⠏⣉⣶⣶⣶⣶⣶⣿⠙⠓⢹⣿⣿
⣷⣄⡀⠀⠠⠀⠀⢀⠀⠀⠠⠐⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⣋⣥⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣇⣿⣿⣿⣿⣿⣿⡇⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡿⢋⣤⣾⣿⣿⣿⣿⣿⣦⠈⣿⣷⣿⣿⣾⣯⡈⢿⣿⣿⣿⣿⢏⣼⣿⣿
⣿⣿⣿⣷⣦⣄⣈⠀⠀⠠⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⠿⢛⣫⣥⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠡⣿⣿⣿⣿⣿⣿⠇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣶⡦⠭⢉⣴⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣬⣭⣭⣭⣩⣭⣥⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⡙⡛⢛⣛⣡⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢡⣶⣤⣭⣭⣭⣭⣴⣶⣶⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣦⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢿⡿⢟⣛⣫⣭⣿⣿⣭⣽⣛⡿⣿⡌⣿⣿⣿⣿⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣿⣿⣿⣿⣿⣿⣿⣿⡟⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣬⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠻⣿⣿⣿⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣹⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣁⣉⣡⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣎⣿⣿⣿⣿⡿⢛⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣥⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⡏⣸⣿⡿⠟⣋⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⣃⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣛⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⢤⣼⣿⣇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠈⣩⣴⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣡⠦⠟⣃⠲⠀⠀⣴⣿⣿⣿⣷⡘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣋⣴⡾⢫⣠⣾⣿⢿⠙⠀⠀⠈⠻⣿⣿⣿⣗⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣛⣥⣴⣦⡄⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣩⣶⣿⣿⡟⣰⣿⠛⢿⠁⠀⠀⠀⠀⠀⠀⠀⠙⢿⢿⣦⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣡⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣩⣶⣿⣿⣿⣿⣿⡇⣷⣷⣠⣶⡇⠀⠀⢀⠈⠀⠀⠀⠀⠠⢉⣰⡆⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣼⣿⣿⡿⠙⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣩⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⢋⣥⣏⡀⠀⠀⠀⠀⠀⠈⠀⠀⠀⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⣼⡿⣿⣿⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣯⢻⠟⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣭⣤⡄⠀⠀⠀⠀⠁⠀⠐⠀⣿⣿⣿⣧⢹⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⡏⠁⠀⢻⡆⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⠈⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⡆⠿⠛⣋⣥⣴⣶⣿⣿⣿⣿⣿⣿⣿⣤⣍⢷⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣇⣀⣤⣿⣿⣶⣶⣤⣴⣾⣿⣿⣿⣿⡏⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣠⣴⣿⣿⣿⣿⣿⣿⠇⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠂⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⡿⠙⣿⠋⠛⠛⣿⡏⠉⠉⣿⣿⣿⡿⣡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣿⣿⣿⣿⠏⠀⠀⠉⠉⠙⠛⢿⣿⣿⣿⣿⡅⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⢡⣏⣀⣀⣼⢹⣇⠀⣰⣿⡿⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⠟⠙⢻⣦⣤⣄⣠⣤⣤⣴⣿⠿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠻⠿⠿⠿⠌⠿⠿⠟⣋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⠟⠙⢻⣦⣤⣄⣠⣤⣤⣴⣿⠿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣾⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣧⡀⣀⣼⠻⣿⠟⠓⢻⣿⡿⠁⠀⠈⣿⡿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⡿⢸⣇⠀⠀⣸⡛⣷⣦⣤⣾⣿⠗⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⢬⣍⣉⣉⣉⡭⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
'@
Start-Sleep 4
                
                Write-Host `$overwhelmedArt -ForegroundColor Magenta
                Write-Host
                
                # PHASE 6: USB Recovery Instructions
                Write-Host '========================================================================' -ForegroundColor Magenta
                Write-Host '1. Obtain a working USB Flash Drive (at least 8 GB).' -ForegroundColor White
                Write-Host '2. Plug the USB flash drive into another working computer.' -ForegroundColor White
                Write-Host '3. Go to official Microsoft website: https://www.microsoft.com/software-download/windows11' -ForegroundColor White
                Write-Host '4. Download the "Create Windows 11 Installation Media" tool.' -ForegroundColor White
                Write-Host '5. Run the tool to convert the USB flash drive into a bootable Windows Installer.' -ForegroundColor White
                Write-Host '6. Insert the USB into the broken computer, boot into BIOS/Boot Menu (usually F12, F11, or DEL),' -ForegroundColor White
                Write-Host '   and select "Repair your computer" or perform a clean reinstall.' -ForegroundColor White
                Write-Host '========================================================================' -ForegroundColor Magenta
            }
"@
    }
    Paw 'System Repair Execution Started in Elevated Window!' 'Green'
} else {
    Paw 'Startup Repair skipped. Your session is complete.' 'Cyan'
}


Start-Sleep -Seconds 2

Exit 0
