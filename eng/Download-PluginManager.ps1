[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True, Position=1)]
    [string] $ExtractRootPath
)

# Normalize path by replacing double backslashes with single
$ExtractRootPath = $ExtractRootPath -replace '\\\\', '\'

# If the DLL already exists, skip
if (Test-Path "$ExtractRootPath\GitExtensions.PluginManager.dll") {
    Write-Host "PluginManager DLL already exists."
    exit 0
}

Push-Location $PSScriptRoot

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $Releases = Invoke-RestMethod -Uri 'https://api.github.com/repos/gitextensions/gitextensions.pluginmanager/releases'
} catch {
    Write-Host "Failed to fetch releases: $_"
    exit 0
}

$Assets = $Releases[0].assets;
foreach ($Asset in $Assets)
{
    if ($Asset.name.StartsWith('GitExtensions.PluginManager') -and $Asset.name.EndsWith('.zip'))
    {
        $AssetToDownload = $Asset;
        break;
    }
}

if (!($null -eq $AssetToDownload))
{
    $AssetUrl = $AssetToDownload.browser_download_url;

    $DownloadName = [System.IO.Path]::GetFileName($AssetToDownload.name);
    $DownloadFilePath = [System.IO.Path]::Combine($ExtractRootPath, $DownloadName);
    $ExtractPath = $ExtractRootPath;

    if (!(Test-Path $DownloadFilePath))
    {
        if (!(Test-Path $ExtractRootPath))
        {
            New-Item -ItemType directory -Path $ExtractRootPath | Out-Null;
        }

        if (!(Test-Path $ExtractPath))
        {
            New-Item -ItemType directory -Path $ExtractPath | Out-Null;
        }

        Write-Host "Downloading '$DownloadName'.";

        Invoke-WebRequest -Uri $AssetUrl -OutFile $DownloadFilePath;
        Expand-Archive $DownloadFilePath -DestinationPath $ExtractPath -Force
    }
    else 
    {
        Write-Host "Download '$DownloadName' already exists.";
    }
}
else {
    Write-Host "PluginManager release not found."
    exit 0
}

Pop-Location