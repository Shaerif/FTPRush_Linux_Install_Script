# Changelog
All notable changes to the FTPRush Linux Installation Script will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- **Version Management**
  - Added `--version` flag to display script version
  - Automatic update checking with GitHub API integration
  - `--no-update-check` option to disable update checks
  - Version tracking for installed FTPRush instances
  - Upgrade notifications when new versions are available

- **Configuration Backup/Restore**
  - Added `--backup=DIR` option to specify backup location
  - Added `--no-backup` flag to skip backups during uninstallation
  - Added `--restore=DIR` option to restore configuration during installation
  - Automatic backup before uninstallation or upgrade
  - Support for restoring configuration after reinstallation

- **Testing & Quality**
  - Removed Windows-specific test files to focus on Linux/WSL testing
  - Updated documentation for WSL-based testing
  - Simplified test structure to focus on Linux environments
  - Improved test coverage for command-line interface
  - Better error messages and test feedback

- **Core Features**
  - Non-interactive mode with `--yes/--silent` flag for automated installations
  - Custom installation paths via `--prefix` option
  - Checksum verification for downloaded files to ensure integrity
  - Improved error handling and user feedback
  - Command-line interface with subcommands (`install`/`uninstall`)
  - Help system with `-h/--help` option
  - Command-line wrapper for easy access (`ftprush` command)
  - Support for installing/removing wrapper script separately

### Changed
- **Code Quality**
  - Added ShellCheck configuration for consistent code style
  - Improved error handling and input validation
  - Better code organization and documentation
  - More robust error messages and status reporting

- **Improved Installation/Uninstallation**
  - More robust handling of existing installations with backup options
  - Better cleanup of temporary files and partial installations
  - Enhanced error messages for backup/restore operations
  - Version-aware upgrades with proper backup/restore flow

- **Documentation**
  - Consolidated documentation under `docs/` with a comprehensive `docs/README.md`
  - Root `README.md` replaced with a pointer to `docs/README.md`
  - Added detailed backup/restore instructions and examples
  - Added version management documentation
  - Aligned documentation with actual `install_ftprush.sh` behavior

- **User Experience**
  - More informative progress messages during backup/restore
  - Better handling of permission issues
  - Improved cleanup of temporary files
  - Clear version information during installation/upgrade
  - Helpful upgrade notifications with version comparison

### Fixed
- Fixed permission issues with custom installation paths
- Improved cleanup of temporary files
- Better handling of interrupted installations

### Known Gaps
- Automatic version checking and update notifications
- Desktop environment detection for optimal icon placement
- System-wide PATH integration for command-line usage

## [1.0.0]
### Added
- Initial release of the FTPRush Linux Installation Script
- Automated download and installation process
- Desktop entry creation with icon
- System-wide integration
- Uninstallation functionality
- Smart download management with resume capability
- Progress tracking and error handling
- Interactive cleanup options
- Support for major Debian-based distributions

### Security
- Implemented proper permission handling
- Secure download verification
- Protected system file operations

## [0.9.0]
### Added
- Beta version with core functionality
- Basic installation and uninstallation features
- Initial documentation
- License implementation

### Changed
- Improved error handling
- Enhanced user interface feedback
- Optimized download process

### Fixed
- Permission issues in system directories
- Desktop entry creation bugs
- Download resume functionality

## [0.8.0]
### Added
- Alpha version with basic functionality
- Command-line interface
- Basic error handling
- Initial system integration
