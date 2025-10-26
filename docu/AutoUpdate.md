# Auto-Update Concept for GitExtensions Fork

This document describes the auto-update mechanism implemented in this fork of GitExtensions, allowing users to automatically receive updates from this repository.

## Overview

The auto-update feature enables the application to check for newer versions periodically and prompt users to install them. This is particularly useful for maintaining up-to-date installations without manual intervention.

## How It Works

### 1. Update Check Process
- The application checks for updates weekly by default (configurable in Settings > Advanced > "Check for updates weekly").
- It uses the GitHub API to fetch release information from a dedicated `configdata` branch in this repository (`AlexNek/gitextensions`).
- The check is triggered automatically when the application starts, if the last check was more than 7 days ago.

### 2. Release Information Source
- Release data is stored in a file named `GitExtensions.releases` located in the `configdata` branch.
- This file contains version information in INI format, specifying:
  - Version number
  - Release type (Major, HotFix, ReleaseCandidate)
  - Download URL for the installer
  - Required .NET runtime version (optional)

Example format:
```
[Version "4.0.0"]
ReleaseType=Major
DownloadPage=https://github.com/AlexNek/gitextensions/releases/download/v4.0.0/GitExtensions-4.0.0.msi
NetRuntimeVersion=6.0.0
```

### 3. Update Installation
- **Non-Portable Installations**: The application downloads the MSI installer and automatically runs it using `msiexec`.
- **Portable Installations**: Users are directed to the GitHub releases page to download manually.
- The application checks for required .NET runtime versions and prompts to install if necessary.

### 4. User Interface
- Access via **Help > Check for Updates** menu item.
- Settings in **Tools > Settings > Advanced** to enable/disable checks and include release candidates.
- Update dialog shows available versions, changelog links, and download options.

## Configuration for Maintainers

### Setting Up Releases
1. Create a new release on GitHub with the version tag (e.g., `v4.0.0`).
2. Upload the MSI installer as a release asset.
3. Note the direct download URL for the asset.

### Updating the Releases File
1. Switch to the `configdata` branch.
2. Edit `GitExtensions.releases` to add a new section for the release.
3. Commit and push the changes.

### Code Modifications
- The update check is hardcoded to use `AlexNek/gitextensions` in `FormUpdates.cs`.
- For different repositories, modify the repository name in the code accordingly.

## Security and Limitations
- Uses unauthenticated GitHub API requests (rate limited to 60/hour per IP).
- Only supports MSI-based updates for automatic installation.
- Requires internet connection for update checks.

## Testing
- Test update detection by creating a release with a higher version number than the current build.
- Verify download and installation process in a safe environment.

This mechanism ensures users of the fork receive timely updates while maintaining control over the release process.