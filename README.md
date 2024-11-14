# FTPRush_Linux_Script
FTPRush Installer Script for Linux: Automated Download, Setup, and Desktop Entry Creation

## FTPRush Installer Script for Ubuntu

This guide provides a step-by-step installation process for FTPRush on Ubuntu. The script automates downloading, extracting, and setting up FTPRush, including adding a desktop entry.

### Installation Instructions

1. **Download the Installer Script**

   You can either upload the `install_ftprush.sh` script manually to `/usr/local/bin` or download it directly using `wget`.

   #### Option 1: Manually Upload the Script
   Place the script file on the following path:

   ```bash
   /usr/local/bin/install_ftprush.sh
   ```

   #### Option 2: Download the Script via `wget`
   Run the following commands to download and make the script executable:

   ```bash
   wget https://github.com/Shaerif/FTPRush_Linux_Script/raw/main/install_ftprush.sh -O /usr/local/bin/install_ftprush.sh
   sudo chmod +x /usr/local/bin/install_ftprush.sh
   ```

2. **Run the Installer Script**

   Execute the installer script with `sudo` to start the installation process:

   ```bash
   sudo /usr/local/bin/install_ftprush.sh
   ```

   - The script will prompt you for confirmation if an existing installation of FTPRush is found.
   - It will also ask if you want to remove the downloaded installation file after setup.

3. **Uninstalling FTPRush**

   To uninstall FTPRush, re-run the script and select the uninstall option from the menu.




## Features

The `install_ftprush.sh` script is a fully automated solution for installing and uninstalling FTPRush on Ubuntu, including adding a desktop shortcut for easy access. Key features include:

- **Automated Download and Extraction**: 
  - Automatically downloads the latest version of FTPRush for Linux and extracts it into the `/opt/FTPRush` directory.

- **Icon and Desktop Shortcut Creation**:
  - Downloads the FTPRush icon for a polished look and sets up a desktop entry under `/usr/share/applications/` for easy access via the applications menu.

- **Configurable Download Option**:
  - If an installation file already exists, the script prompts the user to either reuse the existing file or download a fresh copy, minimizing redundant downloads.

- **Interactive Cleanup Option**:
  - Prompts the user after installation to delete the downloaded file, keeping the system clean and organized.

- **Uninstallation Option**:
  - Provides an option to completely remove FTPRush, including its files and desktop entry, for easy maintenance and flexibility.

- **User-Friendly Prompts and Status Updates**:
  - Displays clear, concise messages throughout the installation process, guiding the user through each step.

- **Permission Management**:
  - Automatically sets correct permissions for both the installation directory and executable files, ensuring the application runs smoothly.



