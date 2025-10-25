# Developer Guide

This guide is for developers who want to build, contribute to, or extend GitExtensions.

## Building from Source

### Prerequisites
- **Operating System**: Windows 7 SP1+ (for full compatibility).
- **.NET**: .NET 9.0 SDK.
- **Visual Studio**: Visual Studio 2022 (v17.12+), with C# 13 and VC++ support.
- **Git**: Latest version installed.

### Steps
1. **Clone the Repository**:
   ```
   git clone https://github.com/AlexNek/gitextensions.git
   cd gitextensions
   ```

2. **Open the Solution**:
   - Open `GitExtensions.sln` in Visual Studio.

3. **Build**:
   - Select Build > Build Solution (Ctrl+Shift+B).
   - Or use command line: `dotnet build GitExtensions.sln`.

4. **Run**:
   - Set GitExtensions as the startup project and run (F5).
   - Or execute `src/app/GitExtensions/bin/Debug/net9.0/GitExtensions.exe`.

### Build Configurations
- **Debug**: For development with debugging symbols.
- **Release**: Optimized for performance.
- Target platform: Any CPU (x86/x64).

## Project Structure
- **src/app/**: Core application code.
  - GitCommands: Git operations.
  - GitUI: User interface.
  - GitExtUtils: Utilities.
  - GitExtensions: Main entry point.
- **src/plugins/**: Plugin modules.
- **externals/**: Third-party dependencies.
- **tests/**: Unit and integration tests.
- **setup/**: Installer and packaging.

## Contributing

1. **Fork the Repository**: On GitHub, fork the repo and clone your fork.

2. **Create a Branch**: Use a descriptive name, e.g., `feature/new-plugin`.

3. **Make Changes**: Follow coding standards (see .editorconfig, style guides).

4. **Test**: Run unit tests and manual testing.

5. **Commit**: Use conventional commits (e.g., `feat: add new feature`).

6. **Push and PR**: Push to your fork and create a pull request.

### Code Standards
- Use C# 13 features.
- Follow naming conventions: PascalCase for types, camelCase for methods.
- Use async/await for I/O operations.
- Add XML comments for public APIs.
- Ensure tests for new code.

### Plugin Development
To create a plugin:
1. Implement `IGitPlugin` interface.
2. Add [Export(typeof(IGitPlugin))] attribute for MEF discovery.
3. Handle Register/Unregister for UI integration.
4. Provide settings via IGitPluginSettingsContainer.

Example:
```csharp
[Export(typeof(IGitPlugin))]
public class MyPlugin : GitPluginBase
{
    public override bool Execute(GitUIEventArgs args)
    {
        // Plugin logic
        return true;
    }
}
```

## Testing
- **Unit Tests**: In `tests/app/UnitTests/`.
- **Integration Tests**: In `tests/app/IntegrationTests/`.
- Run tests via Visual Studio or `dotnet test`.

## Debugging
- Use Visual Studio debugger.
- Check logs in the application settings folder.
- Enable verbose logging in settings for troubleshooting.

## Packaging and Release
- Use the provided build scripts in `eng/`.
- Create installers via the Setup project.
- Follow the release process in CONTRIBUTING.md.

For more details, see CONTRIBUTING.md and the project wiki.