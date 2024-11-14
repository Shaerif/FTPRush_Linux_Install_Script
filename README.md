# FTPRush_Linux_Script
FTPRush Installer Script for Linux: Automated Download, Setup, and Desktop Entry Creation

## FTPRush Installer Script for Ubuntu

This guide provides a step-by-step installation process for FTPRush on Ubuntu. The script automates downloading, extracting, and setting up FTPRush, including adding a desktop entry.

### Installation Instructions

1. **Download the Installer Script**

   You can either upload the `install_ftprush.sh` script manually to `/usr/local/bin` or download it directly using `wget`.

   #### Option 1: Manually Upload the Script
   Place the script file at the following path:

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
