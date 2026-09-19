$ErrorActionPreference = 'Stop'

# F.T.O.P.S wallpaper-only mode
# Applies a working furry wallpaper to the desktop and leaves the rest of the system alone.

$wallpaperFolder = Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'
$urls = @(
    'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=1600&q=80',
    'https://images.unsplash.com/photo-1537151608828-ea2b11777ee8?auto=format&fit=crop&w=1600&q=80',
    'https://images.unsplash.com/photo-1474511320723-9a56873867b5?auto=format&fit=crop&w=1600&q=80',
    'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?auto=format&fit=crop&w=1600&q=80'
)

New-Item -ItemType Directory -Force -Path $wallpaperFolder | Out-Null

foreach ($url in $urls) {
    try {
        $fileName = [System.IO.Path]::GetFileName([System.Uri]$url.AbsoluteUri)
        if (-not $fileName) {
            $fileName = "wallpaper-$([guid]::NewGuid().ToString('N')).jpg"
        }

        $fullPath = Join-Path $wallpaperFolder $fileName
        if (-not (Test-Path $fullPath)) {
            Invoke-WebRequest -Uri $url -OutFile $fullPath -UseBasicParsing
        }

        $image = [System.Drawing.Image]::FromFile($fullPath)
        $image.Dispose()
        Write-Host "Ready: $fullPath" -ForegroundColor Green
    }
    catch {
        Write-Host "Could not load wallpaper from $url`n$($_.Exception.Message)" -ForegroundColor Yellow
    }
}

$images = @(Get-ChildItem -Path $wallpaperFolder -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Extension -match '\.(jpg|jpeg|png|bmp)$' })

if ($images.Count -eq 0) {
    throw "No wallpaper images were found in $wallpaperFolder"
}

$selected = Get-Random -InputObject $images
$selectedPath = $selected.FullName

Add-Type @'
using System;
using System.Runtime.InteropServices;
public static class WallpaperApi {
    private const int SPI_SETDESKWALLPAPER = 0x0014;
    private const int SPIF_UPDATEINIFILE = 0x01;
    private const int SPIF_SENDCHANGE = 0x02;

    [DllImport("user32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);

    public static void Set(string path) {
        int result = SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, path, SPIF_UPDATEINIFILE | SPIF_SENDCHANGE);
        if (result == 0) {
            throw new System.ComponentModel.Win32Exception();
        }
    }
}
'@

Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallpaperStyle -Value '10' -Type DWord -Force
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallpaper -Value '0' -Type DWord -Force

try {
    [WallpaperApi]::Set($selectedPath)
    Write-Host "Wallpaper applied: $selectedPath" -ForegroundColor Green
}
catch {
    $desktop = [System.IO.Path]::Combine($env:USERPROFILE, 'Desktop')
    Copy-Item -Path $selectedPath -Destination $desktop -Force
    $desktopWallpaper = Join-Path $desktop $selected.Name
    [WallpaperApi]::Set($desktopWallpaper)
    Write-Host "Wallpaper applied from fallback path: $desktopWallpaper" -ForegroundColor Yellow
}

Write-Host 'F.T.O.P.S wallpaper mode complete.' -ForegroundColor Cyan
Exit 0
