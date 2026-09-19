# F.T.O.P.S wallpaper applier
# Applies the downloaded images in the F.T.O.P.S wallpaper folder as the
# current Windows desktop background and configures them as a slideshow.
# Windows PowerShell 5.1 / Windows 10 and 11.

[CmdletBinding()]
param(
    [int]$IntervalSeconds = 60,
    [switch]$Shuffle
)

$ErrorActionPreference = 'Stop'

$wallpaperFolder = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'
$bmpFolder = Join-Path $wallpaperFolder 'bmp'

if (-not (Test-Path -LiteralPath $wallpaperFolder -PathType Container)) {
    throw "Wallpaper folder was not found: $wallpaperFolder"
}

Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public static class FtopsWallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern bool SystemParametersInfo(
        uint action, uint parameter, string value, uint winIni);
}
'@

# Only use files that can be opened as images. This prevents a partially
# downloaded web page or a .download file from becoming the desktop background.
Add-Type -AssemblyName System.Drawing
$imageExtensions = @('.jpg', '.jpeg', '.png', '.bmp')
$images = @(
    Get-ChildItem -LiteralPath $wallpaperFolder -File -ErrorAction SilentlyContinue |
        Where-Object { $imageExtensions -contains $_.Extension.ToLowerInvariant() } |
        ForEach-Object {
            $image = $null
            try {
                $image = [System.Drawing.Image]::FromFile($_.FullName)
                $image.Dispose()
                $_
            }
            catch {
                if ($image) { $image.Dispose() }
                Write-Warning "Skipping invalid image '$($_.FullName)': $($_.Exception.Message)"
            }
        }
)

# If the downloader put only converted files in bmp\, include those too.
if ($images.Count -eq 0 -and (Test-Path -LiteralPath $bmpFolder -PathType Container)) {
    $images = @(
        Get-ChildItem -LiteralPath $bmpFolder -File -ErrorAction SilentlyContinue |
            Where-Object { $imageExtensions -contains $_.Extension.ToLowerInvariant() } |
            ForEach-Object {
                $image = $null
                try {
                    $image = [System.Drawing.Image]::FromFile($_.FullName)
                    $image.Dispose()
                    $_
                }
                catch {
                    if ($image) { $image.Dispose() }
                    Write-Warning "Skipping invalid image '$($_.FullName)': $($_.Exception.Message)"
                }
            }
    )
}

if ($images.Count -eq 0) {
    throw "No valid wallpaper images were found in '$wallpaperFolder' or '$bmpFolder'."
}

# Apply the first downloaded image immediately. The registry settings below
# configure Windows to continue using the complete folder as a slideshow.
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x0001
$SPIF_SENDCHANGE = 0x0002
$firstImage = $images[0].FullName
if (-not [FtopsWallpaper]::SystemParametersInfo(
        $SPI_SETDESKWALLPAPER, 0, $firstImage,
        $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)) {
    throw "Windows could not apply '$firstImage' as the desktop background. Win32 error: $([Runtime.InteropServices.Marshal]::GetLastWin32Error())"
}

$interval = [Math]::Max(5, $IntervalSeconds) * 1000
$slideshowSettings = 'HKCU:\Control Panel\Personalization\Desktop Slideshow'
$wallpaperSettings = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers'
New-Item -Path $slideshowSettings -Force | Out-Null
New-Item -Path $wallpaperSettings -Force | Out-Null
New-ItemProperty -Path $slideshowSettings -Name Interval -PropertyType DWord -Value $interval -Force | Out-Null
New-ItemProperty -Path $slideshowSettings -Name Shuffle -PropertyType DWord -Value ([int]$Shuffle.IsPresent) -Force | Out-Null
New-ItemProperty -Path $wallpaperSettings -Name BackgroundType -PropertyType DWord -Value 2 -Force | Out-Null
New-ItemProperty -Path $wallpaperSettings -Name SlideshowDirectoryPath -PropertyType String -Value $wallpaperFolder -Force | Out-Null
New-ItemProperty -Path $wallpaperSettings -Name SlideshowDirectoryPath1 -PropertyType String -Value $wallpaperFolder -Force | Out-Null

# Ask Explorer to reload the normal Windows Personalization settings.
$refresh = Join-Path $env:SystemRoot 'System32\rundll32.exe'
Start-Process -FilePath $refresh `
    -ArgumentList 'user32.dll,UpdatePerUserSystemParameters 1, True' -Wait -WindowStyle Hidden

Write-Host "Applied: $($images.Count) valid furry image(s)." -ForegroundColor Green
Write-Host "Current image: $firstImage" -ForegroundColor Cyan
Write-Host "Windows slideshow folder: $wallpaperFolder" -ForegroundColor Cyan
Write-Host "Change interval: $([Math]::Max(5, $IntervalSeconds)) seconds" -ForegroundColor Magenta
