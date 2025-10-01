<div align="center">

# 🚀 FTPRush Installer Script for Linux

<p align="center">
  <strong>Automated download, installation, desktop integration, and clean removal of FTPRush on Debian-based Linux systems.</strong>
</p>

<p align="center">
  <a href="https://www.gnu.org/licenses/gpl-3.0">
    <img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="License: GPL-3.0">
  </a>
  <a href="https://www.gnu.org/software/bash/">
    <img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg" alt="Made with Bash">
  </a>
  <img src="https://img.shields.io/badge/Platform-Linux-orange.svg" alt="Platform: Linux">
  <img src="https://img.shields.io/badge/Debian-Based-red.svg" alt="Debian-based">
  <img src="https://img.shields.io/badge/Status-Active-brightgreen.svg" alt="Status: Active">
  <img src="https://img.shields.io/badge/Shell-Bash%205.0+-green.svg" alt="Shell: Bash 5.0+">
</p>

<p align="center">
  <a href="#-one-line-installation">🚀 Quick Install</a> •
  <a href="#-user-guide">📖 User Guide</a> •
  <a href="#-features">✨ Features</a> •
  <a href="#-troubleshooting">🔧 Troubleshooting</a> •
  <a href="#-contributing">🤝 Contributing</a>
</p>

</div>

---

## 🚀 One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh | sudo bash -s -- --yes install
```

## 📚 Quick Links

<div align="center">

| 📋 [Changelog](CHANGELOG.md) | 👥 [Credits](CREDITS.md) | ✅ [Tasks](tasks.md) | 📄 [License](LICENSE) |
|:---:|:---:|:---:|:---:|
| Version history | Contributors | Project progress | GPL-3.0 License |

</div>

## ⚡ Quick Commands

<details>
<summary><strong>🔧 Essential Commands</strong></summary>

```bash
# 🚀 Install FTPRush
curl -fsSL https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh | sudo bash -s -- --yes install

# 🗑️ Uninstall FTPRush  
sudo install_ftprush.sh uninstall

# 🎯 Launch FTPRush
ftprush
```

</details>

---

## 📋 Overview
This repository provides a Bash script, `install_ftprush.sh`, that installs FTPRush on Linux by:

<div align="center">

| 🔽 **Download** | 📦 **Extract** | 🖥️ **Desktop Integration** | 🧹 **Cleanup** | 🗑️ **Uninstall** |
|:---:|:---:|:---:|:---:|:---:|
| Official tarball | `/opt/FTPRush` | Desktop entry | Temp artifacts | Complete removal |

</div>

> 💡 **Interactive Experience**: The script guides you through installation or uninstallation with user-friendly prompts.

---

## 🖥️ System Requirements

<table align="center">
<tr>
<td align="center">🐧</td>
<td><strong>Operating System</strong></td>
<td>Debian-based Linux distribution</td>
</tr>
<tr>
<td align="center">🔐</td>
<td><strong>Privileges</strong></td>
<td><code>sudo</code> access required</td>
</tr>
<tr>
<td align="center">🌐</td>
<td><strong>Network</strong></td>
<td>Internet connection for downloads</td>
</tr>
</table>

---

## 🎯 Supported Systems

<div align="center">

| 🟢 **Fully Supported** | 🟡 **Compatible** | 📋 **Requirements** |
|:---:|:---:|:---:|
| Ubuntu (current versions) | Kubuntu, Xubuntu | Debian-based |
| Debian 10+ | Elementary OS | `apt` package manager |
| Linux Mint 19+ | Zorin OS | `systemd` (recommended) |
| Pop!_OS 20.04+ | MX Linux | 64-bit architecture |

</div>

---

## 📥 Installation

You can install the script to a convenient location (e.g., `/usr/local/bin`) and run it with various options.

<div align="center">

### 🌐 Option 1: Direct Download

> **Recommended**: Download directly from GitHub repository

</div>

```bash
# 📥 Download the installer
sudo wget https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh -O /usr/local/bin/install_ftprush.sh

# 🔧 Make executable
sudo chmod +x /usr/local/bin/install_ftprush.sh
```

<div align="center">

### 📁 Option 2: Manual Installation

> **Alternative**: For local development or custom setups

</div>

**Step 1:** Copy the script to system location
```bash
sudo cp install_ftprush.sh /usr/local/bin/
```

**Step 2:** Set executable permissions
```bash
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

## ⚙️ Advanced Usage

<div align="center">

### 🤖 Silent Installation

> **Perfect for automated deployments and CI/CD pipelines**

</div>

```bash
# 🔇 Skip all prompts
sudo install_ftprush.sh --yes install
```

<div align="center">

### 🔗 Command-line Wrapper

> **Launch FTPRush from anywhere in your terminal**

</div>

```bash
# 🛠️ Create wrapper
sudo install_ftprush.sh --create-wrapper
```

> 💡 **Result**: Creates `/usr/local/bin/ftprush` for easy GUI access

---

## 🎛️ Interactive vs Non-Interactive Installation

<div align="center">

| 🖱️ **Interactive Mode** | ⚡ **Non-Interactive Mode** |
|:---:|:---:|
| Menu-driven interface | Direct command execution |
| User-friendly prompts | Automation-friendly |
| Default behavior | Requires explicit actions |

</div>

### 🖱️ Interactive Mode (Default)

```bash
sudo install_ftprush.sh
```

### ⚡ Non-Interactive Mode

<details>
<summary><strong>📋 Available Commands</strong></summary>

```bash
# 🚀 Install FTPRush
sudo install_ftprush.sh install

# 🗑️ Uninstall FTPRush
sudo install_ftprush.sh uninstall

# 🤖 Silent installation
sudo install_ftprush.sh --yes install
```

</details>

---

## 🎯 Command-line Options

<div align="center">

### 📝 Syntax

```bash
sudo install_ftprush.sh [OPTIONS] [ACTION]
```

</div>

<table align="center">
<tr>
<th colspan="3">🔧 Options</th>
</tr>
<tr>
<td><code>--yes</code> / <code>-y</code></td>
<td>🤖</td>
<td>Automatic yes to all prompts</td>
</tr>
<tr>
<td><code>--no-cleanup</code></td>
<td>🗂️</td>
<td>Skip cleanup of temporary files</td>
</tr>
<tr>
<td><code>--custom-dir DIR</code></td>
<td>📁</td>
<td>Install to custom directory</td>
</tr>
<tr>
<td><code>--create-wrapper</code></td>
<td>🔗</td>
<td>Create command-line wrapper</td>
</tr>
<tr>
<td><code>--help</code> / <code>-h</code></td>
<td>❓</td>
<td>Show help message</td>
</tr>
</table>

<table align="center">
<tr>
<th colspan="3">⚡ Actions</th>
</tr>
<tr>
<td><code>install</code></td>
<td>🚀</td>
<td>Install FTPRush</td>
</tr>
<tr>
<td><code>uninstall</code></td>
<td>🗑️</td>
<td>Remove FTPRush</td>
</tr>
<tr>
<td><code>backup</code></td>
<td>💾</td>
<td>Create backup</td>
</tr>
<tr>
<td><code>restore</code></td>
<td>🔄</td>
<td>Restore from backup</td>
</tr>
</table>

---

## 📚 Examples

<details>
<summary><strong>🎯 Basic Installation</strong></summary>

```bash
# 🖱️ Interactive installation
sudo install_ftprush.sh

# 🤖 Silent installation
sudo install_ftprush.sh --yes install
```

</details>

<details>
<summary><strong>🛠️ Custom Installation</strong></summary>

```bash
# 📁 Install to custom directory
sudo install_ftprush.sh install --custom-dir /opt/custom/ftprush

# 🔗 Install with wrapper creation
sudo install_ftprush.sh --yes install --create-wrapper
```

</details>

<details>
<summary><strong>🔧 Maintenance Workflow</strong></summary>

```bash
# 💾 Create backup before update
sudo install_ftprush.sh backup

# 🗑️ Uninstall old version
sudo install_ftprush.sh uninstall

# 🚀 Install new version
sudo install_ftprush.sh --yes install

# 🔄 Restore if needed (optional)
sudo install_ftprush.sh restore
```

</details>

---

## 💻 Command-line Wrapper

<div align="center">

> **Easy terminal access to FTPRush GUI**

</div>

<table align="center">
<tr>
<th>Command</th>
<th>Description</th>
<th>Example</th>
</tr>
<tr>
<td><code>ftprush</code></td>
<td>🚀 Launch FTPRush</td>
<td>Basic startup</td>
</tr>
<tr>
<td><code>ftprush /path/to/file</code></td>
<td>📁 Launch with file</td>
<td>Open specific file</td>
</tr>
<tr>
<td><code>ftprush &</code></td>
<td>🔄 Launch in background</td>
<td>Non-blocking execution</td>
</tr>
</table>

#### Managing the Command-Line Wrapper

### 🔧 Managing the Command-Line Wrapper

<div align="center">

> **Flexible wrapper management for different use cases**

</div>

```bash
# 🗑️ Remove wrapper only
sudo rm /usr/local/bin/ftprush

# 🔄 Recreate wrapper
sudo install_ftprush.sh --create-wrapper
```

---

## 🚀 Launching

<div align="center">

### 🎯 Run the Installer

</div>

**Interactive Mode:**
```bash
sudo install_ftprush.sh
```

**One-Line Installation:**
```bash
curl -fsSL https://raw.githubusercontent.com/Shaerif/FTPRush_Linux_Install_Script/main/install_ftprush.sh | sudo bash -s -- --yes install
```

---

## 🎉 First-time Setup

<div align="center">

> **Automated Process**: The script handles everything for you!

</div>

<table align="center">
<tr>
<td align="center">1️⃣</td>
<td><strong>Check Installation</strong></td>
<td>Verify if FTPRush is already installed</td>
</tr>
<tr>
<td align="center">2️⃣</td>
<td><strong>Download</strong></td>
<td>Fetch latest FTPRush Linux version</td>
</tr>
<tr>
<td align="center">3️⃣</td>
<td><strong>Extract</strong></td>
<td>Install to <code>/opt/FTPRush</code></td>
</tr>
<tr>
<td align="center">4️⃣</td>
<td><strong>Desktop Integration</strong></td>
<td>Create application menu entry</td>
</tr>
<tr>
<td align="center">5️⃣</td>
<td><strong>Cleanup</strong></td>
<td>Remove temporary files (optional)</td>
</tr>
</table>

### 🎯 Launch FTPRush After Installation

<div align="center">

| 📱 **Applications Menu** | 💻 **Terminal** | 🖥️ **Desktop** |
|:---:|:---:|:---:|
| Search for "FTPRush" | `ftprush` command | Desktop shortcut |

</div>

---

## 📖 Usage

### 🖱️ Interactive Mode (Default)

Run the installer without arguments to use the interactive menu:

```bash
sudo install_ftprush.sh
```

### ⚡ Non-Interactive Mode

For automated installations, you can use command-line arguments:

```bash
# 🚀 Install with default options (non-interactive)
sudo install_ftprush.sh --yes install

# 📁 Install to a custom directory
sudo install_ftprush.sh --yes --prefix=/opt/custom/path install

# 🗑️ Uninstall (removes all files)
sudo install_ftprush.sh --yes uninstall
```

### ⚙️ Command-Line Options

- 🤖 `--yes` or `--silent`: Run in non-interactive mode, automatically answering 'yes' to all prompts
- 📁 `--prefix=PATH`: Install to a custom directory (e.g., `--prefix=/opt/custom/path`)
- 💾 `--backup=DIR`: Backup configuration to the specified directory during installation/uninstallation
- ⏭️ `--no-backup`: Skip configuration backup during uninstallation
- 🔄 `--restore=DIR`: Restore configuration from the specified directory during installation
- 🔄 `--no-update-check`: Skip checking for script updates
- 🔗 `--install-wrapper`: Install command-line wrapper (requires root)
- 🗑️ `--remove-wrapper`: Remove command-line wrapper (requires root)
- 📊 `--version` or `-v`: Show version information
- 🚀 `install`: Install FTPRush
- 🗑️ `uninstall`: Remove FTPRush
- ❓ `-h` or `--help`: Show help message

### 💡 Examples

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

## 🛠️ Usage

<div align="center">

### 📋 Interactive Menu

> **User-friendly installation process**

</div>

When you run the script, you will be prompted with:

```
1. Install FTPRush
2. Uninstall FTPRush
```

<details>
<summary><strong>🚀 Option 1: Install FTPRush</strong></summary>

The script will perform these actions:

<table align="center">
<tr>
<td align="center">📥</td>
<td><strong>Download</strong></td>
<td>Archive to <code>/tmp/FTPRush_linux.tar.bz2</code></td>
</tr>
<tr>
<td align="center">📦</td>
<td><strong>Extract</strong></td>
<td>Contents to <code>/opt/FTPRush</code></td>
</tr>
<tr>
<td align="center">🔧</td>
<td><strong>Permissions</strong></td>
<td>Set execute on <code>/opt/FTPRush/ftprush</code></td>
</tr>
<tr>
<td align="center">🖼️</td>
<td><strong>Desktop Entry</strong></td>
<td>Create <code>/usr/share/applications/ftprush.desktop</code></td>
</tr>
<tr>
<td align="center">🧹</td>
<td><strong>Cleanup</strong></td>
<td>Optional removal of temporary files</td>
</tr>
</table>

</details>

<details>
<summary><strong>🗑️ Option 2: Uninstall FTPRush</strong></summary>

The script will remove:

- 📁 `/opt/FTPRush` directory
- 🖥️ `/usr/share/applications/ftprush.desktop` entry
- 🔗 Command-line wrapper (if installed)

> ⚠️ **Note**: Configuration files in user directories are preserved unless explicitly removed

</details>

---

## ✨ Features (Implemented)

- **🤖 Automated Installation**
  - 📥 Downloads FTPRush tarball with checksum verification
  - 📦 Extracts to `/opt/FTPRush` (or custom path) with proper permissions
  - 🖥️ Creates desktop entry at `/usr/share/applications/ftprush.desktop`
  - 🎨 Downloads and sets up application icon

- **⚙️ Flexible Configuration**
  - 📁 Custom installation directory via `--prefix` option
  - 🔇 Non-interactive mode with `--yes/--silent` for automation
  - 🖱️ Interactive prompts for user-friendly manual installation

- **💾 Configuration Management**
  - 🛡️ Backup user configuration before uninstallation or upgrade
  - 🔄 Restore configuration from backup during installation
  - 📂 Specify custom backup/restore directories
  - ⏭️ Skip backup with `--no-backup` flag

- **🔒 Safety Features**
  - ✅ Checksum verification of downloaded files
  - 🧹 Proper cleanup of temporary files
  - ⚠️ Clear confirmation before removing existing installations
  - 🛠️ Graceful handling of partial installations
  - 💾 Automatic backup before uninstallation

- **🗑️ Uninstallation**
  - 🧽 Complete removal of all installed files
  - 📋 Option to keep or remove configuration files
  - 🎯 Works with both default and custom installation paths
  - 💾 Optional configuration backup

## ⚠️ Known Limitations

- **💾 Configuration Management**
  - 📁 Only backs up common configuration directories (`~/.config/FTPRush` and `~/.FTPRush`)
  - 🏠 Does not back up files outside the user's home directory
  - 🔓 Backup is not encrypted

- **🔗 System Integration**
  - 🛤️ Not added to system `PATH` by default (use full path or create alias)
  - 🖥️ No desktop environment detection for optimal icon placement

## 🛠️ Development

### 🧪 Running Tests

This project includes a comprehensive test suite that runs in a Linux environment, including WSL (Windows Subsystem for Linux).

#### 📋 Prerequisites

- 🐚 Bash
- 🦇 BATS (Bash Automated Testing System)
- 🔍 ShellCheck (for static code analysis)

#### 🚀 Running Tests

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

#### 🎯 What the Tests Do
1. **📊 Version Check**: Verifies the `--version` flag works correctly
2. **❓ Help System**: Tests the `--help` flag and command-line help output
3. **⚠️ Error Handling**: Verifies proper error messages for invalid options
4. **⚙️ Basic Functionality**: Ensures the installer can be executed without errors

#### 📁 Test Structure
- 🧪 `test/test_install_ftprush.bats`: Main test file with test cases
- 🛠️ `test/test_helper/`: Helper files for BATS testing
- ⚙️ `.shellcheckrc`: Configuration for ShellCheck

### 📁 Test Structure

- 🧪 `test/test_install_ftprush.bats`: Main test file with test cases
- 🛠️ `test/test_helper/`: Helper files for BATS testing
- ⚙️ `.shellcheckrc`: Configuration for ShellCheck

## 🚀 Future Enhancements

- [ ] 🧪 Add more test cases for edge cases
- [ ] 🔄 Implement CI/CD with GitHub Actions
- [ ] 🖥️ Desktop environment detection for better integration
- [ ] 🐧 Support for more Linux distributions
- [ ] 📦 Package manager integration (deb/rpm)

---

## 🔍 Troubleshooting

<div align="center">

### ⚠️ Common Issues & Solutions

</div>

<details>
<summary><strong>🔐 Permission denied</strong></summary>

**Problem**: Script fails with permission errors

**Solution**: 
```bash
# ✅ Run with sudo privileges
sudo install_ftprush.sh
```

</details>

<details>
<summary><strong>🌐 Download fails</strong></summary>

**Problem**: Cannot download FTPRush archive

**Solutions**:
- ✅ Check internet connection
- ✅ Verify firewall settings
- ✅ Try different network

</details>

<details>
<summary><strong>💾 Extraction fails</strong></summary>

**Problem**: Archive extraction errors

**Solutions**:
- ✅ Ensure sufficient disk space in `/tmp`
- ✅ Check `/opt` directory permissions
- ✅ Verify archive integrity

</details>

<details>
<summary><strong>🖥️ Desktop entry not appearing</strong></summary>

**Problem**: FTPRush not in applications menu

**Solutions**:
```bash
# 🔄 Update desktop database
sudo update-desktop-database

# 🔄 Or logout and login again
```

</details>

### 🆘 Getting Help

<div align="center">

| Step | Action | Description |
|:---:|:---:|:---:|
| 1️⃣ | **Check Output** | Review script error messages |
| 2️⃣ | **Verify Privileges** | Ensure `sudo` access |
| 3️⃣ | **Test Connection** | Verify internet connectivity |
| 4️⃣ | **Check Space** | Ensure sufficient disk space |
| 5️⃣ | **Verbose Mode** | Run with `--verbose` flag |

</div>

---

## 📊 Project Information

<div align="center">

### ⏱️ Development Stats

| **Time Invested** | **Last Updated** |
|:---:|:---:|
| 41 hours and 57 minutes | 2025-10-01 11:16:55 EST |

</div>

### 🔗 Repository Links

<div align="center">

| 🏠 [Repository](https://github.com/Shaerif/FTPRush_Linux_Install_Script) | 🐛 [Issues](https://github.com/Shaerif/FTPRush_Linux_Install_Script/issues) | 📦 [Releases](https://github.com/Shaerif/FTPRush_Linux_Install_Script/releases) |
|:---:|:---:|:---:|

</div>

### 📄 License

<div align="center">

This project is licensed under the **GPL-3.0 License**

📋 See the [LICENSE](LICENSE) file for details

</div>

---

<div align="center">

### 📝 Disclaimer

*This script is not affiliated with FTPRush. FTPRush is a trademark of its respective owners.*

---

**Made with ❤️ for the Linux community**

[![⭐ Star this repo](https://img.shields.io/github/stars/Shaerif/FTPRush_Linux_Install_Script?style=social)](https://github.com/Shaerif/FTPRush_Linux_Install_Script)

</div>