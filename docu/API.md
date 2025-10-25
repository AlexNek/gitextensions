# API Documentation

This section documents the key APIs and interfaces in GitExtensions, focusing on the plugin system and core classes for extensibility.

## Plugin System

GitExtensions uses the Managed Extensibility Framework (MEF) for plugin loading. Plugins implement specific interfaces to integrate with the application.

### Core Plugin Interface: IGitPlugin

The base interface for all plugins.

```csharp
public interface IGitPlugin
{
    Guid Id { get; }                    // Unique identifier for the plugin.
    string? Name { get; }               // Display name.
    string? Description { get; }        // Description of the plugin.
    Image? Icon { get; }                // Icon for the plugin.
    IGitPluginSettingsContainer? SettingsContainer { get; set; } // Settings management.
    bool HasSettings { get; }           // Indicates if the plugin has settings.
    IEnumerable<ISetting> GetSettings(); // Returns plugin settings.
    void Register(IGitUICommands gitUiCommands); // Called when plugin is loaded.
    void Unregister(IGitUICommands gitUiCommands); // Called when plugin is unloaded.
    bool Execute(GitUIEventArgs args);  // Executes the plugin action.
}
```

### Specialized Plugin Interfaces

- **IGitPluginForRepository**: For plugins that operate on the entire repository (e.g., statistics, branch management).
- **IGitPluginForCommit**: For plugins that enhance the commit process.

### GitUIEventArgs

Passed to Execute method, provides context.

```csharp
public class GitUIEventArgs : EventArgs
{
    public IGitUICommands GitUICommands { get; } // Access to Git commands.
    public IWin32Window? OwnerForm { get; }      // Owner window.
    public bool Cancel { get; set; }             // Set to cancel the event.
}
```

## Core Classes

### IGitUICommands

Facade for UI operations and Git commands.

Key methods:
- `StartBrowseDialog()`: Opens the main repository browser.
- `StartCommitDialog()`: Opens the commit dialog.
- `StartMergeBranchDialog()`: Opens merge dialog.
- And many more for various Git operations.

### IGitModule

Represents a Git repository.

Key properties/methods:
- `WorkingDir`: Repository working directory.
- `GetAllChangedFiles()`: Gets status of changed files.
- `Commit()`: Performs a commit.
- `Push()`: Pushes to remote.

### GitRevision

Represents a Git commit.

```csharp
public class GitRevision
{
    public ObjectId ObjectId { get; }      // Commit hash.
    public string Message { get; }         // Commit message.
    public string Author { get; }          // Author information.
    // Additional properties for date, parents, etc.
}
```

## Extending GitExtensions

### Creating a Plugin

1. **Reference Assemblies**: Include GitUIPluginInterfaces and GitExtensions.Extensibility.

2. **Implement Interface**:
   ```csharp
   [Export(typeof(IGitPlugin))]
   public class SamplePlugin : GitPluginBase, IGitPluginForRepository
   {
       public override bool Execute(GitUIEventArgs args)
       {
           // Your code here
           return true; // Refresh grid if needed
       }
   }
   ```

3. **Settings**:
   - Implement GetSettings() to provide configurable options.
   - Use IGitPluginSettingsContainer for storage.

4. **Deployment**: Place the DLL in the plugins directory (e.g., %APPDATA%\GitExtensions\Plugins).

### Event Handling

Plugins can listen to events via IGitUICommands:
- `PostRepositoryChanged`: After repo state changes.
- `PreCommit`: Before committing.

Example:
```csharp
gitUiCommands.PostRepositoryChanged += OnRepoChanged;
```

## Best Practices

- **Thread Safety**: UI operations must be on the main thread.
- **Error Handling**: Use try-catch in Execute to prevent crashes.
- **Performance**: Avoid long-running operations in Execute.
- **Localization**: Use ResourceManager for strings.

For more examples, see existing plugins in `src/plugins/`.