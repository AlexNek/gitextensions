# Usage Guide

This guide provides an overview of how to use GitExtensions for managing Git repositories.

## Getting Started

1. **Launch GitExtensions**: Open the application from the Start Menu or run `GitExtensions.exe`.
2. **Open a Repository**:
   - **Clone a Repository**: Use File > Clone Repository to clone from a remote URL.
   - **Open Existing**: Use File > Open Repository or select from recent repositories.
   - **Initialize New**: Use File > Create New Repository to initialize a new Git repo.

## Main Interface

The main window (FormBrowse) consists of:
- **Repository Panel**: Shows branches, remotes, submodules, and recent commits.
- **Revision Grid**: Displays commit history with graph visualization.
- **File Tree**: Shows files in the working directory and staged changes.
- **Diff Viewer**: Compares changes between revisions or files.

## Common Operations

### 1. Committing Changes
- Stage files using the File Tree (right-click > Stage).
- Enter a commit message in the Commit tab.
- Click Commit to create a new commit.

### 2. Branching
- **Create Branch**: Right-click on a commit > Create Branch.
- **Switch Branch**: Use the branch dropdown or right-click > Checkout.
- **Merge**: Right-click on branch > Merge into current branch.

### 3. Pulling and Pushing
- **Pull**: Use Pull button or Repository > Pull.
- **Push**: Use Push button or Repository > Push.
- Configure remotes via Repository > Remotes.

### 4. Viewing History
- Select commits in the Revision Grid to view details.
- Use File History (right-click on file) to see changes over time.
- Blame view shows who modified each line.

### 5. Resolving Conflicts
- During merge/rebase, conflicts are marked in the File Tree.
- Use Resolve Conflicts dialog to edit and mark as resolved.

### 6. Stashing
- Stash changes via Repository > Stash.
- Apply stashes from the Stash dialog.

## Advanced Features

### Plugins
- Access additional tools via Tools menu, such as statistics, background fetch, etc.
- Plugins can be enabled/disabled in Settings > Plugins.

### Settings
- Customize appearance, behavior, and integrations in Tools > Settings.
- Key sections: General, Appearance, Git Config, Plugins.

### Command Line Integration
- GitExtensions supports command-line arguments for automation.
- Examples:
  - `GitExtensions.exe browse` to open the browser.
  - `GitExtensions.exe commit` to open commit dialog.

## Keyboard Shortcuts

Common shortcuts (customizable in settings):
- Ctrl+O: Open repository
- Ctrl+N: New repository
- Ctrl+S: Stage selected
- Ctrl+Shift+C: Commit
- F5: Refresh

## Integration with Other Tools

- **Windows Explorer**: Right-click in a Git folder to access GitExtensions commands.
- **Visual Studio**: Use the GitExtensions menu for quick access to repo operations.
- **VS Code Extension**: Available for VS Code users.

## Tips and Best Practices

- **Regular Commits**: Commit often with descriptive messages.
- **Branch Strategy**: Use feature branches for development.
- **Pull Before Push**: Always pull latest changes to avoid conflicts.
- **Backup**: Regularly backup repositories, especially before major operations.
- **Performance**: For large repos, use shallow clones or adjust settings for faster loading.

For more detailed tutorials, refer to the [online manual](https://git-extensions-documentation.readthedocs.org/).