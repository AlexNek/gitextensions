# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Comment Management System**: Implemented a new comment strategy system for handling commit comments, including default, extended, and Git-specific strategies. Added UI components for comment input and validation.
- **Commit Message Manager**: Enhanced commit message handling with improved testability and new interfaces for better modularity.
- **Settings Enhancements**: Added settings for commit dialog, including a checkbox for reading from Git after app start and template comment validation.
- **New Tests**: Added tests for message box service exceptions, comment string handling, and commit message manager functionality.

### Changed
- **UI Updates**: Updated various dialog forms (e.g., FormCommit, FormMergeBranch, FormRevertCommit) and editor components for better user experience.
- **Refactoring**: Adjusted comment skipping logic in commit templates and made functions non-static for better access and testing.
- **Code Structure**: Introduced new services like WinFormsMessageBoxService and updated extensibility interfaces.

### Fixed
- **Exception Handling**: Corrected exceptions related to message box services and merge operations.
- **Warnings and Errors**: Fixed compiler warnings, merge errors, and unit test issues.
- **Validation**: Improved validation for commit messages and settings pages.

### Updated
- **Translations**: Updated English.xlf translation file with new strings and corrections.
- **Documentation**: Updated contributors.txt file.

## [Branch Comparison: an_master vs master]

This section summarizes the differences introduced in the `an_master` branch compared to `master`. For detailed commit history, see the git log.

- **Total Files Changed**: 30
- **Lines Added**: 836
- **Lines Deleted**: 156

Key modified files include:
- `src/app/GitCommands/CommitMessageManager.cs`
- `src/app/GitUI/GitComments/CommentStrategyFactory.cs`
- `src/app/GitUI/CommandsDialogs/SettingsDialog/Pages/CommitDialogSettingsPage.cs`
- Various test files and translation resources.

For more details, refer to the commit messages or run `git log master..an_master --oneline`.