# FTPRush Installer Script for Linux
> Automated Download, Setup, and Desktop Entry Creation 🚀

[![License: GPL-3.0](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) ⚖️
[![Made with Bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

## 📖 Overview

A streamlined, automated installer for FTPRush on Ubuntu Linux systems. This script manages the complete installation process, including:
- 📥 Downloading and extraction
- 🎯 Setup in `/opt/FTPRush`
- 🖥️ Desktop entry creation
- 🧹 Cleanup management
- 🗑️ Uninstallation features

## 📋 Table of Contents
- [System Requirements](#-system-requirements)
- [Supported Systems](#-supported-systems)
- [Installation Guide](#-installation-guide)
- [Features](#-features)
- [Uninstallation](#-uninstallation)
- [Troubleshooting](#-troubleshooting)

## 💻 System Requirements
- Debian-based Linux distribution
- `sudo` privileges
- Internet connection

## 🌟 Supported Systems

### Primary Support
- 🐧 **Ubuntu** <img src="https://upload.wikimedia.org/wikipedia/commons/9/9e/UbuntuCoF.svg" width="20"> (All current versions)
- 🐧 **Debian** <img src="https://www.debian.org/logos/openlogo-nd.svg" width="20"> (10+)
- 🌿 **Linux Mint** <img src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Linux_Mint_logo_without_wordmark.svg" width="20"> (19+)
- 🔵 **Pop!_OS** <img src="https://upload.wikimedia.org/wikipedia/commons/0/02/Pop_OS-Logo-nobg.svg" width="20"> (20.04+)

### Additional Compatibility
- 🔷 **Kubuntu** <img src="https://upload.wikimedia.org/wikipedia/commons/1/1f/Kubuntu_logo.svg" width="20">
- 🔹 **Xubuntu** <img src="https://upload.wikimedia.org/wikipedia/commons/a/af/Xubuntu_logo_and_wordmark.svg" width="20">
- Other Debian derivatives

## 📥 Installation Guide

### Option 1: Direct Download 🔄
```bash
wget https://github.com/Shaerif/FTPRush_Linux_Script/raw/main/install_ftprush.sh -O /usr/local/bin/install_ftprush.sh
sudo chmod +x /usr/local/bin/install_ftprush.sh
```

### Option 2: Manual Upload 📤
1. Upload to path:
```bash
/usr/local/bin/install_ftprush.sh
```
2. Set permissions:
```bash
sudo chmod +x /usr/local/bin/install_ftprush.sh
```

### Running Installation ▶️
```bash
sudo /usr/local/bin/install_ftprush.sh
```

## ✨ Features

### Core Functionality
- 📦 **Automated Download and Extraction**
  - Latest FTPRush version
  - Extracts to `/opt/FTPRush`
  - Automatic version management

- 🖼️ **Desktop Integration**
  - Application icon setup
  - Menu shortcut creation
  - System-wide accessibility

- 🔄 **Smart Download Management**
  - Existing file detection
  - Download configuration options
  - Bandwidth optimization

- 🛠️ **System Integration**
  - Automated permissions setup
  - Desktop entry configuration
  - Path environment updates

### Additional Features
- 🧹 **Interactive Cleanup**
  - Temporary file management
  - Installation cleanup
  - System optimization

- 🗑️ **Uninstallation Management**
  - Complete removal option
  - Configuration cleanup
  - System restore

- 📊 **Progress Tracking**
  - Installation status
  - Download progress
  - Error notifications

- ⚙️ **Advanced Options**
  - Custom installation paths
  - Configuration backup
  - Silent installation mode

## 🔧 System Integration

### Installation Path
```plaintext
📂 /opt/FTPRush/
 ├── 📄 FTPRush (executable)
 ├── 📄 license.txt
 ├── 📂 config/
 └── 📂 resources/
```

### Desktop Integration
```plaintext
📂 /usr/share/applications/
 └── 📄 ftprush.desktop
```

## 🗑️ Uninstallation
Remove FTPRush completely:
```bash
sudo /usr/local/bin/install_ftprush.sh
# Select uninstall from menu options
```

## ⚠️ Troubleshooting

### Common Issues

#### 1. Permission Errors 🔒
```bash
sudo /usr/local/bin/install_ftprush.sh
```
- Ensure proper sudo privileges
- Check file permissions

#### 2. Download Problems 📡
- Verify internet connection
- Check proxy settings
- Confirm server availability

#### 3. Desktop Entry Issues 🖥️
- Refresh application menu
- Verify icon paths
- Check desktop environment compatibility

## 🔄 Updates and Maintenance

### Version Control
- Automatic version detection
- Update notifications
- Backup management

### System Cleanup
- Temporary file removal
- Configuration backup
- Log management

## 🤝 Contributing
We welcome contributions! Here's how you can help:

1. 🔍 Fork the repository
2. 🌟 Create your feature branch
3. 💻 Commit your changes
4. 📤 Push to the branch
5. 🎯 Open a Pull Request

## 📄 License ⚖️
GNU General Public License v3.0 - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments
- FTPRush development team
- Linux community contributors
- Open source supporters

---
<p align="center">
<b>Made with ❤️ for the Linux community</b><br>
<i>Copyright © 2024 FTPRush Installer Script Team</i>
</p>