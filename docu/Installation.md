# Installation

This guide explains how to install GitExtensions on your system.

## System Requirements

- **Operating System**: Windows 7 SP1 or later (64-bit recommended).
- **Runtime Environment**: .NET 9.0 SDK or later.
- **Git**: Git must be installed and accessible from the command line.
- **Development Environment** (for building from source): Visual Studio 2022 (v17.12+), C# 13, VC++ (including ATL for x86/x64 installer).

## Download and Install

1. **Download the Latest Release**:
   - Visit the [GitExtensions Releases](https://github.com/gitextensions/gitextensions/releases) page on GitHub.
   - Download the latest version (e.g., v6.0.2) for Windows.
   - Alternatively, use package managers:
     - **Chocolatey**: `choco install gitextensions`
     - **Winget**: `winget install GitExtensionsTeam.GitExtensions`

2. **Run the Installer**:
   - Execute the downloaded `.exe` file.
   - Follow the on-screen instructions to complete the installation.
   - The installer will prompt for administrator privileges if needed.

3. **Post-Installation Steps**:
   - Ensure Git is installed and in your PATH. If not, GitExtensions will prompt you to locate or install it.
   - Optionally, integrate with Windows Explorer and Visual Studio during setup.

## Portable Installation

For a portable version:
- Download the portable release from GitHub.
- Extract to a folder.
- Run `GitExtensions.exe` directly.
- Note: Settings and themes can be customized in the extracted directory.

## Verifying Installation

- Launch GitExtensions from the Start Menu or desktop shortcut.
- The application should open and prompt for a repository or allow cloning.
- Check the About dialog (Help > About) for version information.

## Troubleshooting

- **Git Not Found**: If Git is not detected, use the settings to point to the Git executable or install Git from [git-scm.com](https://git-scm.com/).
- **Integration Issues**: For Windows Explorer or Visual Studio integration, ensure the extensions are enabled in the installer.
- **Permissions**: Run as administrator if you encounter access errors.
- **Updates**: Check for updates via Help > Check for Updates or download from GitHub.

For building from source, see [DeveloperGuide](DeveloperGuide.md).