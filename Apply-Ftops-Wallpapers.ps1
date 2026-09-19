# Applies the downloaded F.T.O.P.S wallpapers to the current Windows desktop.
# Run this from the same PowerShell session as the main script, or dot-source it.

$ErrorActionPreference = 'Stop'

function Set-FtopsWallpapers {
    [CmdletBinding()]
    param(
        [string]$Folder = (Join-Path $env:USERPROFILE 'Pictures\FPD-Furry-Wallpapers'),
        [int]$IntervalSeconds = 60
    )

    if (-not (Test-Path -LiteralPath $Folder -PathType Container)) {
        throw "Wallpaper folder does not exist: $Folder"
    }

    Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class FtopsDesktopWallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern bool SystemParametersInfo(
        uint action, uint parameter, string value, uint updateIniFile);

    [ComImport, Guid("B92B56A9-8B55-4E14-9A89-0199BBB6F93B"),
     InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    public interface IDesktopWallpaper {
        void SetWallpaper([MarshalAs(UnmanagedType.LPWStr)] string monitorId,
                          [MarshalAs(UnmanagedType.LPWStr)] string wallpaper);
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

    [DllImport("shell32.dll", CharSet = CharSet.Unicode, PreserveSig = true)]
    public static extern int SHCreateShellItemArrayFromPaths(
        string[] paths, uint attributes, ref Guid riid, out IntPtr array);

    public static readonly Guid ShellItemArrayIid =
        new Guid("B63EA76D-1F85-456F-A19C-48159EFA858B");
    public static readonly Guid DesktopWallpaperClsid =
        new Guid("C2CF3110-460E-4FC1-B9D0-8A1C0C9CC4BD");
}
'@ -ErrorAction SilentlyContinue

    $images = @(Get-ChildItem -LiteralPath $Folder -File |
        Where-Object { $_.Extension -match '^\.(jpg|jpeg|png|bmp)$' } |
        Sort-Object Name)

    # Include converted images too. The old script created these in a subfolder,
    # but then never supplied them to Windows' slideshow API.
    $bmpFolder = Join-Path $Folder 'bmp'
    if (Test-Path -LiteralPath $bmpFolder -PathType Container) {
        $images += @(Get-ChildItem -LiteralPath $bmpFolder -File |
            Where-Object { $_.Extension -match '^\.bmp$' } |
            Sort-Object Name)
    }
    $images = @($images | Select-Object -Unique -Property FullName)

    if ($images.Count -eq 0) {
        throw "No usable wallpaper images were found in: $Folder"
    }

    $firstImage = $images[0].FullName
    # This is the reliable, immediate apply path. It works even when the
    # slideshow COM API is unavailable or Windows has slideshow disabled.
    if (-not [FtopsDesktopWallpaper]::SystemParametersInfo(20, 0, $firstImage, 3)) {
        throw "Windows could not apply wallpaper: $firstImage"
    }

    try {
        $array = [IntPtr]::Zero
        $iid = [FtopsDesktopWallpaper]::ShellItemArrayIid
        $hr = [FtopsDesktopWallpaper]::SHCreateShellItemArrayFromPaths(
            [string[]]$images.FullName, 0, [ref]$iid, [ref]$array)
        if ($hr -lt 0) { [Runtime.InteropServices.Marshal]::ThrowExceptionForHR($hr) }

        try {
            $desktop = [Activator]::CreateInstance(
                [type]::GetTypeFromCLSID([FtopsDesktopWallpaper]::DesktopWallpaperClsid))
            try {
                $desktop.SetSlideshow($array)
                $desktop.SetSlideshowOptions(0, [uint32]([Math]::Max(1, $IntervalSeconds) * 1000))
                $desktop.AdvanceSlideshow($null, 0)
            } finally {
                [Runtime.InteropServices.Marshal]::ReleaseComObject($desktop) | Out-Null
            }
        } finally {
            if ($array -ne [IntPtr]::Zero) { [Runtime.InteropServices.Marshal]::Release($array) | Out-Null }
        }
    } catch {
        # The first image is already applied; keep that behavior if slideshow
        # support is blocked by policy or an older Windows build.
        Write-Warning "Slideshow setup failed; the first wallpaper was applied. $($_.Exception.Message)"
    }

    # Refresh Explorer/Personalization and persist the selected album for the UI.
    $desktopKey = 'HKCU:\Control Panel\Desktop'
    Set-ItemProperty -Path $desktopKey -Name WallpaperStyle -Value '10'
    Set-ItemProperty -Path $desktopKey -Name TileWallpaper -Value '0'
    $wallpaperKey = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers'
    New-Item -Path $wallpaperKey -Force | Out-Null
    New-ItemProperty -Path $wallpaperKey -Name BackgroundType -PropertyType DWord -Value 2 -Force | Out-Null
    New-ItemProperty -Path $wallpaperKey -Name SlideshowDirectoryPath -PropertyType String -Value $Folder -Force | Out-Null
    Start-Process -FilePath (Join-Path $env:SystemRoot 'System32\rundll32.exe') `
        -ArgumentList 'user32.dll,UpdatePerUserSystemParameters 1, True' -Wait -WindowStyle Hidden

    Write-Host "Wallpaper applied: $firstImage" -ForegroundColor Green
    Write-Host "Slideshow images: $($images.Count); interval: $IntervalSeconds seconds" -ForegroundColor Green
}

Set-FtopsWallpapers
