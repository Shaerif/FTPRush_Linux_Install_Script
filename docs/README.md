# FTPRush Installer Script for Linux
> Automated download, installation, desktop integration, and clean removal of FTPRush on Debian-based Linux systems.

[![License: GPL-3.0](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

## 🚀 One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh | sudo bash -s -- --yes install
```

## 📚 Quick Links

- [📋 Changelog](CHANGELOG.md) - Version history and changes
- [👥 Credits](CREDITS.md) - Project contributors and acknowledgments
- [✅ Tasks](tasks.md) - Project tasks and progress
- [📄 License](LICENSE) - GPL-3.0 License

## ⚡ Quick Commands

```bash
# Install FTPRush
curl -fsSL https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh | sudo bash -s -- --yes install

# Uninstall FTPRush  
sudo install_ftprush.sh uninstall

# Launch FTPRush
ftprush
```

---

## Overview
This repository provides a Bash script, `install_ftprush.sh`, that installs FTPRush on Linux by:

- Downloading the official FTPRush Linux tarball
- Extracting it into `/opt/FTPRush`
- Creating a desktop entry at `/usr/share/applications/ftprush.desktop`
- Optionally cleaning up temporary artifacts
- Providing an uninstall option

The script is interactive and guides you through installation or uninstallation.

---

## System Requirements

- Debian-based Linux distribution (Ubuntu, Debian, Linux Mint, Pop!_OS, etc.)
- `sudo` privileges
- Internet connection

---

## Supported Systems

- Ubuntu (current versions)
- Debian 10+
- Linux Mint 19+
- Pop!_OS 20.04+
- Other Debian derivatives (Kubuntu, Xubuntu, etc.)

---

## Installation

You can install the script to a convenient location (e.g., `/usr/local/bin`) and run it with various options.

### Option 1: Direct download

```bash
# Download the installer
sudo wget https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh -O /usr/local/bin/install_ftprush.sh
sudo chmod +x /usr/local/bin/install_ftprush.sh
```

### Option 2: Manual installation

1) Copy `install_ftprush.sh` to `/usr/local/bin/`:

```bash
sudo cp install_ftprush.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/install_ftprush.sh
```

---

## 📖 User Guide

### Getting Started

This guide will walk you through installing and using FTPRush on your Linux system.

#### Step 1: Quick Installation

The fastest way to install FTPRush is using our one-line installer:

```bash
curl -fsSL https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh | sudo bash -s -- --yes install
```

This command will:
- Download the installer script
- Install FTPRush to `/opt/FTPRush`
- Create a desktop entry for easy access
- Set up the command-line wrapper

#### Step 2: Launch FTPRush

After installation, you can launch FTPRush in several ways:

**From Desktop:**
- Look for "FTPRush" in your applications menu
- Click the FTPRush icon on your desktop (if created)

**From Command Line:**
```bash
ftprush
```

**From File Manager:**
- Navigate to `/opt/FTPRush`
- Double-click the `ftprush` executable

#### Step 3: First-Time Setup

When you first launch FTPRush:
1. The application will start with a clean interface
2. Configure your FTP/SFTP connections using the connection manager
3. Set your preferences in the settings menu

### Common Tasks

#### Installing to a Custom Location

If you want to install FTPRush to a different directory:

```bash
sudo install_ftprush.sh --prefix=/your/custom/path install
```

#### Backing Up Configuration

Before major updates or system changes:

```bash
sudo install_ftprush.sh --backup=/path/to/backup install
```

#### Restoring Configuration

To restore a previous configuration:

```bash
sudo install_ftprush.sh --restore=/path/to/backup install
```

#### Uninstalling FTPRush

To completely remove FTPRush:

```bash
sudo install_ftprush.sh uninstall
```

To uninstall while keeping a backup of your settings:

```bash
sudo install_ftprush.sh --backup=/path/to/backup uninstall
```

### Advanced Usage

#### Silent Installation for Scripts

For automated deployments or scripts:

```bash
sudo install_ftprush.sh --yes --no-update-check install
```

#### Managing the Command-Line Wrapper

Install wrapper separately:
```bash
sudo install_ftprush.sh --install-wrapper
```

Remove wrapper:
```bash
sudo install_ftprush.sh --remove-wrapper
```

---

## Usage

### Interactive Mode (Default)

Run the installer without arguments to use the interactive menu:

```bash
sudo install_ftprush.sh
```

### Non-Interactive Mode

For automated installations, you can use command-line arguments:

```bash
# Install with default options (non-interactive)
sudo install_ftprush.sh --yes install

# Install to a custom directory
sudo install_ftprush.sh --yes --prefix=/opt/custom/path install

# Uninstall (removes all files)
sudo install_ftprush.sh --yes uninstall
```

### Command-Line Options

- `--yes` or `--silent`: Run in non-interactive mode, automatically answering 'yes' to all prompts
- `--prefix=PATH`: Install to a custom directory (e.g., `--prefix=/opt/custom/path`)
- `--backup=DIR`: Backup configuration to the specified directory during installation/uninstallation
- `--no-backup`: Skip configuration backup during uninstallation
- `--restore=DIR`: Restore configuration from the specified directory during installation
- `--no-update-check`: Skip checking for script updates
- `--install-wrapper`: Install command-line wrapper (requires root)
- `--remove-wrapper`: Remove command-line wrapper (requires root)
- `--version` or `-v`: Show version information
- `install`: Install FTPRush
- `uninstall`: Remove FTPRush
- `-h` or `--help`: Show help message

### Examples

```bash
# Basic installation
sudo install_ftprush.sh install

# Install silently to a custom directory
sudo install_ftprush.sh --yes --prefix=/opt/myapps/FTPRush install

# Install with configuration backup
sudo install_ftprush.sh --backup=/path/to/backup install

# Install and restore configuration
sudo install_ftprush.sh --restore=/path/to/backup install

# Install command-line wrapper (requires root)
sudo install_ftprush.sh --install-wrapper

# Remove command-line wrapper (requires root)
sudo install_ftprush.sh --remove-wrapper

# Check version information
sudo install_ftprush.sh --version

# Uninstall with backup to a specific directory
sudo install_ftprush.sh --backup=/path/to/backup uninstall

# Uninstall without backup
sudo install_ftprush.sh --no-backup uninstall

# Skip update check (useful for automation)
sudo install_ftprush.sh --no-update-check install
```

## Command-Line Wrapper

After installation, you can run FTPRush from the command line using the wrapper script. The wrapper script is installed to `/usr/local/bin/ftprush` and provides a convenient way to launch FTPRush.

### Installing the Wrapper

The wrapper is automatically installed during the main installation if you run the installer as root. If you need to install it separately:

```bash
sudo install_ftprush.sh --install-wrapper
```

### Using the Wrapper

Once installed, you can simply run:

```bash
ftprush
```

### Removing the Wrapper

To remove the wrapper script:

```bash
sudo install_ftprush.sh --remove-wrapper
```

### How It Works

The wrapper script:
1. Automatically detects the FTPRush installation directory
2. Launches the FTPRush binary with any provided arguments
3. Provides helpful error messages if FTPRush is not found
4. Works with both default and custom installation paths

---

## Usage

When you run the script, you will be prompted with:

```
1. Install FTPRush
2. Uninstall FTPRush
```

- Select `1` to install. The script will:
  - Download the archive to `/tmp/FTPRush_linux.tar.bz2` (or ask to reuse it if already present)
  - Extract contents to `/opt/FTPRush`
  - Set execute permission on `/opt/FTPRush/ftprush`
  - Download an icon and create `/usr/share/applications/ftprush.desktop`
  - Ask if you want to remove the temporary tarball

- Select `2` to uninstall. The script will remove:
  - `/opt/FTPRush`
  - `/usr/share/applications/ftprush.desktop`

---

## Features (Implemented)

- **Automated Installation**
  - Downloads FTPRush tarball with checksum verification
  - Extracts to `/opt/FTPRush` (or custom path) with proper permissions
  - Creates desktop entry at `/usr/share/applications/ftprush.desktop`
  - Downloads and sets up application icon

- **Flexible Configuration**
  - Custom installation directory via `--prefix` option
  - Non-interactive mode with `--yes/--silent` for automation
  - Interactive prompts for user-friendly manual installation

- **Configuration Management**
  - Backup user configuration before uninstallation or upgrade
  - Restore configuration from backup during installation
  - Specify custom backup/restore directories
  - Skip backup with `--no-backup` flag

- **Safety Features**
  - Checksum verification of downloaded files
  - Proper cleanup of temporary files
  - Clear confirmation before removing existing installations
  - Graceful handling of partial installations
  - Automatic backup before uninstallation

- **Uninstallation**
  - Complete removal of all installed files
  - Option to keep or remove configuration files
  - Works with both default and custom installation paths
  - Optional configuration backup

## Known Limitations

- **Configuration Management**
  - Only backs up common configuration directories (`~/.config/FTPRush` and `~/.FTPRush`)
  - Does not back up files outside the user's home directory
  - Backup is not encrypted

- **System Integration**
  - Not added to system `PATH` by default (use full path or create alias)
  - No desktop environment detection for optimal icon placement

## Development

### Running Tests

This project includes a comprehensive test suite that runs in a Linux environment, including WSL (Windows Subsystem for Linux).

#### Prerequisites

- Bash
- BATS (Bash Automated Testing System)
- ShellCheck (for static code analysis)

#### Running Tests

1. **Using WSL (Windows Subsystem for Linux):**
   ```bash
   # Navigate to your project directory in WSL
   cd /mnt/g/Projects/FTP/FTPRush_Linux_Install_Script
   
   # Make the test script executable
   chmod +x run_tests.sh
   
   # Run the tests
   ./run_tests.sh
   ```

2. **On Native Linux:**
   ```bash
   # Make the test script executable
   chmod +x run_tests.sh
   
   # Run the tests
   ./run_tests.sh
   ```

#### What the Tests Do
1. **Version Check**: Verifies the `--version` flag works correctly
2. **Help System**: Tests the `--help` flag and command-line help output
3. **Error Handling**: Verifies proper error messages for invalid options
4. **Basic Functionality**: Ensures the installer can be executed without errors

#### Test Structure
- `test/test_install_ftprush.bats`: Main test file with test cases
- `test/test_helper/`: Helper files for BATS testing
- `.shellcheckrc`: Configuration for ShellCheck

### Test Structure

- `test/test_install_ftprush.bats`: Main test file with test cases
- `test/test_helper/`: Helper files for BATS testing
- `.shellcheckrc`: Configuration for ShellCheck

## Future Enhancements

- [ ] Add more test cases for edge cases
- [ ] Implement CI/CD with GitHub Actions
- [ ] Desktop environment detection for better integration
- [ ] Support for more Linux distributions
- [ ] Package manager integration (deb/rpm)

---

## Troubleshooting

### Common Issues

- **Permission Denied Errors**
  ```bash
  # Ensure the script is executable
  chmod +x install_ftprush.sh
  
  # Run with sudo
  sudo install_ftprush.sh
  ```

- **Backup/Restore Issues**
  ```bash
  # If automatic backup fails, manually backup:
  cp -r ~/.config/FTPRush /path/to/backup/
  cp -r ~/.FTPRush /path/to/backup/
  
  # To restore manually:
  cp -r /path/to/backup/FTPRush ~/.config/
  cp -r /path/to/backup/.FTPRush ~/
  ```

- **Download Failures**
  - Check internet connection
  - Verify the download URL is accessible
  - Try with `wget --no-check-certificate` if SSL verification fails

- **Desktop Entry Not Visible**
  ```bash
  # Refresh desktop database
  sudo update-desktop-database
  
  # Check if the .desktop file exists
  ls -l /usr/share/applications/ftprush.desktop
  ```

- **Custom Installation Path Issues**
  - Ensure the target directory exists and is writable
  - Use absolute paths with `--prefix`
  - Check available disk space: `df -h $(dirname $INSTALL_DIR)`

### Debugging

For more verbose output:

```bash
# Run in debug mode
bash -x install_ftprush.sh --prefix=/custom/path install

# Check installation logs
journalctl -xe | grep -i ftprush
```

---

## Development

The core implementation lives in `install_ftprush.sh`. Contributions to improve robustness, portability, and feature set are welcome.

### Project structure

```
.
├─ docs/
│  ├─ CHANGELOG.md
│  ├─ CREDITS.md
│  ├─ LICENSE
│  └─ README.md (this file)
└─ install_ftprush.sh
```

---

## Contributing

1) Fork the repository
2) Create a feature branch (e.g., `feat/add-silent-mode`)
3) Make changes with clear commit messages
4) Add/update documentation and tests as applicable
5) Open a Pull Request describing the changes and rationale

Please keep documentation in sync with `install_ftprush.sh` behavior.

---

## License

GNU General Public License v3.0. See `LICENSE`.

---

## Credits

See `CREDITS.md`.

---

## Project Statistics

| Metric | Value |
|:------:|:-----:|
| Time Invested | 41 hours and 57 minutes |
| Last Updated | 2025-10-01 11:16:55 EST |