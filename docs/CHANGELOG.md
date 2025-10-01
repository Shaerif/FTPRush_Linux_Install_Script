# Changelog
All notable changes to the FTPRush Linux Installation Script will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Planned
- Desktop environment detection for optimal icon placement
- System-wide PATH integration for command-line usage
- Enhanced GUI dependency detection and warnings

## [1.1.0] - 2025-10-01
### Added
- **WSL2 Testing & Validation**
  - Comprehensive WSL2 testing framework and documentation
  - WSL2 compatibility verification and issue resolution
  - Detailed testing report with environment setup procedures
  - Test coverage for installation, verification, and uninstallation processes

- **Critical Bug Fixes**
  - Fixed incorrect SHA256 checksum validation (was using placeholder MD5 hash)
  - Resolved executable path mismatch (`ftprush` vs `FTPRush`)
  - Added missing `bzip2` dependency requirement for archive extraction
  - Corrected desktop entry executable path references

- **Enhanced Error Handling**
  - Improved checksum verification with proper error messages
  - Better handling of missing dependencies with clear user guidance
  - Enhanced archive extraction error detection and reporting
  - More robust file permission handling during installation

- **Testing Infrastructure**
  - Added comprehensive WSL2 testing procedures
  - Created detailed testing documentation and reports
  - Implemented systematic testing for all major functionality
  - Added test coverage for edge cases and error conditions

### Changed
- **Installation Process**
  - Updated `EXPECTED_CHECKSUM` to correct SHA256 hash value
  - Fixed `EXEC_PATH` variable to reference correct executable name
  - Improved dependency checking and installation guidance
  - Enhanced desktop integration with correct executable paths

- **Code Quality**
  - Improved variable naming consistency throughout the script
  - Enhanced error message clarity and user feedback
  - Better code organization for maintainability
  - Strengthened input validation and error handling

- **Documentation**
  - Added comprehensive WSL2 testing documentation
  - Updated installation requirements to include `bzip2`
  - Enhanced troubleshooting guide with common issues
  - Improved code comments and inline documentation

### Fixed
- **Critical Issues**
  - Checksum verification failure due to incorrect hash value
  - Desktop entry creation with wrong executable path
  - Archive extraction failure due to missing `bzip2` dependency
  - File permission issues during installation process

- **Installation Issues**
  - Resolved executable not found errors after installation
  - Fixed desktop shortcut pointing to non-existent file
  - Corrected file path references throughout the script
  - Improved cleanup of temporary files on installation failure

### Security
- **Enhanced Verification**
  - Implemented proper SHA256 checksum verification
  - Strengthened file integrity checking during download
  - Improved validation of downloaded archive contents
  - Enhanced security of installation process

### Testing
- **WSL2 Compatibility**
  - Verified full functionality in WSL2 Ubuntu environment
  - Tested installation, verification, and uninstallation processes
  - Confirmed proper handling of GUI limitations in WSL2
  - Validated desktop integration and file associations
## [1.0.0] - 2025-09-30
### Added
- **Core Installation Features**
  - Automated download and installation process for FTPRush Linux
  - Desktop entry creation with icon integration
  - System-wide integration and file associations
  - Complete uninstallation functionality with cleanup
  - Smart download management with resume capability
  - Progress tracking and comprehensive error handling
  - Support for major Debian-based distributions

- **Command-Line Interface**
  - Non-interactive mode with `--yes/--silent` flag for automated installations
  - Custom installation paths via `--prefix` option
  - Help system with `-h/--help` option
  - Command-line interface with subcommands (`install`/`uninstall`)
  - Version display with `--version` flag

- **Advanced Features**
  - Checksum verification for downloaded files to ensure integrity
  - Command-line wrapper for easy access (`ftprush` command)
  - Support for installing/removing wrapper script separately
  - Interactive cleanup options during uninstallation
  - Automatic update checking with GitHub API integration
  - `--no-update-check` option to disable update checks

- **Configuration Management**
  - Configuration backup and restore functionality
  - `--backup=DIR` option to specify backup location
  - `--no-backup` flag to skip backups during uninstallation
  - `--restore=DIR` option to restore configuration during installation
  - Automatic backup before uninstallation or upgrade
  - Version-aware upgrades with proper backup/restore flow

- **Documentation & Testing**
  - Comprehensive documentation under `docs/` directory
  - Detailed installation and usage instructions
  - Testing framework focused on Linux/WSL environments
  - ShellCheck configuration for code quality
  - Improved test coverage for command-line interface

### Changed
- **Code Quality**
  - Added ShellCheck configuration for consistent code style
  - Improved error handling and input validation
  - Better code organization and comprehensive documentation
  - More robust error messages and status reporting

- **User Experience**
  - More informative progress messages during operations
  - Better handling of permission issues
  - Improved cleanup of temporary files
  - Clear version information during installation/upgrade
  - Enhanced error messages for backup/restore operations

- **Documentation Structure**
  - Consolidated documentation under `docs/` with comprehensive `docs/README.md`
  - Root `README.md` replaced with pointer to `docs/README.md`
  - Added detailed backup/restore instructions and examples
  - Added version management documentation
  - Aligned documentation with actual script behavior

### Fixed
- Permission issues with custom installation paths
- Cleanup of temporary files and partial installations
- Handling of interrupted installations
- More robust handling of existing installations

### Security
- Implemented proper permission handling
- Secure download verification with checksum validation
- Protected system file operations
- Enhanced file integrity checking

## [0.9.0] - 2025-09-15
### Added
- Beta version with core functionality
- Basic installation and uninstallation features
- Initial comprehensive documentation
- License implementation (GPL-3.0)
- Basic command-line argument parsing
- Initial desktop integration

### Changed
- Improved error handling and user feedback
- Enhanced user interface with better progress indicators
- Optimized download process with resume capability
- Better file organization and structure

### Fixed
- Permission issues in system directories
- Desktop entry creation bugs and icon handling
- Download resume functionality
- Temporary file cleanup issues

## [0.8.0] - 2025-09-01
### Added
- Alpha version with basic functionality
- Initial command-line interface
- Basic error handling and validation
- Initial system integration framework
- Preliminary download and extraction logic
- Basic file permission handling

### Changed
- Initial code structure and organization
- Basic user interaction patterns

### Fixed
- Initial bug fixes and stability improvements
