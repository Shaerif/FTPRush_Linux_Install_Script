#!/bin/bash

# Function to check for script updates
check_for_updates() {
    if [ "$CHECK_FOR_UPDATES" = false ]; then
        return 0
    fi
    
    # Skip update check if we don't have internet connectivity or required tools
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        return 0
    fi
    
    # Try to get the latest version from GitHub
    local latest_version
    if command -v curl >/dev/null 2>&1; then
        latest_version=$(curl -s "$VERSION_CHECK_URL" | grep -oP '"tag_name":\s*"v?\K[0-9.]+' | head -1)
    else
        latest_version=$(wget -qO- "$VERSION_CHECK_URL" | grep -oP '"tag_name":\s*"v?\K[0-9.]+' | head -1)
    fi
    
    if [ -z "$latest_version" ]; then
        return 0
    fi
    
    # Remove 'v' prefix if present for comparison
    local current_version="${SCRIPT_VERSION#v}"
    latest_version="${latest_version#v}"
    
    # Compare versions
    if [ "$current_version" != "$latest_version" ] && [ "$(printf "%s\n%s" "$current_version" "$latest_version" | sort -V | tail -n1)" != "$current_version" ]; then
        echo ""
        echo "===================================================================="
        echo " A new version of FTPRush Installer is available: v$latest_version"
        echo " You are currently using v$current_version"
        echo ""
        echo " To update, please visit:"
        echo " https://github.com/Shaerif/FTPRush_Linux_Install_Script"
        echo "===================================================================="
        echo ""
        
        if [ "$INTERACTIVE" = true ]; then
            if prompt_yes_no "Would you like to continue with the current version?" "y"; then
                return 0
            else
                echo "Installation aborted. Please update the script and try again."
                exit 0
            fi
        fi
    fi
}

# Function to get the installed FTPRush version
get_installed_version() {
    if [ -f "$INSTALL_DIR/version.txt" ]; then
        cat "$INSTALL_DIR/version.txt" | head -n1
    elif [ -f "$INSTALL_DIR/ftprush" ]; then
        # Try to extract version from binary if version.txt doesn't exist
        strings "$INSTALL_DIR/ftprush" 2>/dev/null | grep -oP '\d+\.\d+(\.\d+)?' | head -1 || echo "unknown"
    else
        echo "not_installed"
    fi
}

# Function to get the latest available FTPRush version
get_latest_ftp_rush_version() {
    # This would ideally query the official FTPRush website or repository
    # For now, we'll return a static version or implement a simple web check
    echo "1.0.0"  # Placeholder - should be replaced with actual version check
}

# This script handles the installation and uninstallation of FTPRush on Linux systems
# It provides a user-friendly interface for managing the FTPRush application

# Script version
SCRIPT_VERSION="1.1.0"

# Default values
INTERACTIVE=true
CUSTOM_PREFIX=""
INSTALL_MODE=""
BACKUP_DIR=""
NO_BACKUP=false
RESTORE_DIR=""
CHECK_FOR_UPDATES=true
VERSION_CHECK_URL="https://api.github.com/repos/Shaerif/FTPRush_Linux_Install_Script/releases/latest"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --yes|--silent)
      INTERACTIVE=false
      shift
      ;;
    --prefix=*)
      CUSTOM_PREFIX="${1#*=}"
      shift
      ;;
    --backup=*)
      BACKUP_DIR="${1#*=}"
      shift
      ;;
    --no-backup)
      NO_BACKUP=true
      shift
      ;;
    --restore=*)
      RESTORE_DIR="${1#*=}"
      shift
      ;;
    install|uninstall)
      INSTALL_MODE="$1"
      shift
      ;;
    --version)
      echo "FTPRush Installer v$SCRIPT_VERSION"
      exit 0
      ;;
    --no-update-check)
      CHECK_FOR_UPDATES=false
      shift
      ;;
    --install-wrapper)
      if [ "$(id -u)" -ne 0 ]; then
        echo "Error: This operation requires root privileges." >&2
        exit 1
      fi
      install_wrapper_script
      exit 0
      ;;
    --remove-wrapper)
      if [ "$(id -u)" -ne 0 ]; then
        echo "Error: This operation requires root privileges." >&2
        exit 1
      fi
      uninstall_wrapper_script
      exit 0
      ;;
    -h|--help)
      echo "FTPRush Linux Installer v$SCRIPT_VERSION"
      echo "Usage: $0 [command] [options]"
      echo ""
      echo "Commands:"
      echo "  install         Install FTPRush (default if no command provided)"
      echo "  uninstall       Remove FTPRush"
      echo "  --version, -v   Show version information"
      echo "  --help, -h      Show this help message"
      echo ""
      echo "Options:"
      echo "  --yes, --silent    Run in non-interactive mode"
      echo "  --prefix=PATH      Install to a custom directory"
      echo "  --backup=DIR       Backup configuration to the specified directory"
      echo "  --no-backup        Skip configuration backup during uninstallation"
      echo "  --restore=DIR      Restore configuration from the specified directory"
      echo "  --no-update-check  Skip checking for script updates"
      echo "  --install-wrapper  Install command-line wrapper (requires root)"
      echo "  --remove-wrapper   Remove command-line wrapper (requires root)"
      echo ""
      echo "After installation, you can run 'ftprush' from the command line if the wrapper is installed."
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

# Change directory to root to ensure correct paths and permissions
# This is important for maintaining consistent paths across the installation process
cd / || { echo "Failed to navigate to root directory. Exiting."; exit 1; }

# Configuration variables for the installation
# These define the core paths and URLs needed throughout the script
DOWNLOAD_URL="https://www.wftpserver.com/download/FTPRush_linux.tar.bz2"

# Set installation directory based on prefix if provided
if [ -n "$CUSTOM_PREFIX" ]; then
    INSTALL_DIR="${CUSTOM_PREFIX%/}/FTPRush"  # Ensure no trailing slash
    echo "Using custom installation directory: $INSTALL_DIR"
else
    INSTALL_DIR="/opt/FTPRush"  # Default installation directory
fi

# Derived paths
DESKTOP_ENTRY="/usr/share/applications/ftprush.desktop"  # System-wide desktop shortcut
EXEC_PATH="$INSTALL_DIR/FTPRush"         # Executable path
TAR_FILE="/tmp/FTPRush_linux.tar.bz2"    # Temporary download location
ICON_URL="https://www.wftpserver.com/images/ftprush_app_logo.png"
ICON_FILE="$INSTALL_DIR/ftprush.png"     # Local icon storage

# Function to download the application icon
# This ensures the application has proper visual representation in desktop environments
download_icon() {
    echo "Downloading icon..."
    if ! wget -q -O "$ICON_FILE" "$ICON_URL"; then
        echo "Warning: Icon download failed! Skipping."
        return 1
    fi
}

# Function to verify checksum of downloaded file
verify_checksum() {
    local file="$1"
    local expected_checksum="$2"
    
    if [ ! -f "$file" ]; then
        echo "Error: File $file not found for checksum verification"
        return 1
    fi
    
    echo "Verifying checksum..."
    local actual_checksum=$(sha256sum "$file" | awk '{print $1}')
    
    if [ "$actual_checksum" != "$expected_checksum" ]; then
        echo "Error: Checksum verification failed!"
        echo "Expected: $expected_checksum"
        echo "Found:    $actual_checksum"
        return 1
    fi
    
    echo "Checksum verified successfully."
    return 0
}

# Function to backup FTPRush configuration
backup_config() {
    local backup_dir="${1:-/tmp/ftprush_backup_$(date +%Y%m%d_%H%M%S)}"
    local config_dirs=("$HOME/.config/FTPRush" "$HOME/.FTPRush")
    local has_backup=0

    echo "Backing up FTPRush configuration..."
    
    # Create backup directory
    mkdir -p "$backup_dir" || {
        echo "Error: Failed to create backup directory $backup_dir"
        return 1
    }

    # Backup each config directory that exists
    for dir in "${config_dirs[@]}"; do
        if [ -d "$dir" ]; then
            echo "  - Backing up $dir..."
            cp -r "$dir" "$backup_dir/" && has_backup=1 || {
                echo "Warning: Failed to backup $dir"
            }
        fi
    done

    if [ $has_backup -eq 1 ]; then
        echo "Configuration backed up to: $backup_dir"
        echo "To restore: cp -r $backup_dir/* ~/"
        return 0
    else
        echo "No configuration found to backup."
        rmdir "$backup_dir" 2>/dev/null || true
        return 1
    fi
}

# Function to restore FTPRush configuration
restore_config() {
    local backup_dir="$1"
    
    if [ ! -d "$backup_dir" ]; then
        echo "Error: Backup directory $backup_dir not found"
        return 1
    fi
    
    echo "Restoring FTPRush configuration from $backup_dir..."
    
    # Restore each item in the backup directory
    for item in "$backup_dir"/*; do
        if [ -e "$item" ]; then
            local dest="$HOME/$(basename "$item")"
            echo "  - Restoring to $dest..."
            cp -r "$item" "$dest" || {
                echo "Warning: Failed to restore $item"
            }
        fi
    done
    
    echo "Configuration restored from: $backup_dir"
    return 0
}

# Function to prompt user with yes/no question
# Returns 0 for yes, 1 for no
prompt_yes_no() {
    local prompt="$1"
    local default="$2"  # 'y' or 'n'
    
    if [ "$INTERACTIVE" = false ]; then
        [ "$default" = "y" ] && return 0 || return 1
    fi
    
    while true; do
        read -p "$prompt " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) 
                if [ -n "$default" ]; then
                    [ "$default" = "y" ] && return 0 || return 1
                fi
                echo "Please answer yes or no.";;
        esac
    done
}

# Install wrapper script
install_wrapper_script() {
    local wrapper_path="/usr/local/bin/ftprush"
    local wrapper_source="$(dirname "$(readlink -f "$0")")/ftprush-wrapper"
    
    # Check if wrapper script exists in the same directory as the installer
    if [ ! -f "$wrapper_source" ]; then
        echo "Warning: Could not find wrapper script at $wrapper_source"
        return 1
    fi
    
    echo "Installing FTPRush wrapper script to $wrapper_path..."
    
    # Copy the wrapper script
    cp "$wrapper_source" "$wrapper_path"
    chmod +x "$wrapper_path"
    
    echo "Wrapper script installed. You can now run 'ftprush' from the command line."
}

# Uninstall wrapper script
uninstall_wrapper_script() {
    local wrapper_path="/usr/local/bin/ftprush"
    
    if [ -f "$wrapper_path" ]; then
        echo "Removing wrapper script from $wrapper_path..."
        rm -f "$wrapper_path"
    fi
}

# Main installation function
# Handles the complete installation process including:
# - Checking for existing installations
# - Downloading and extracting the application
# - Setting up desktop integration
install_ftprush() {
    echo "Starting FTPRush installation..."
    
    # Set installation directory
    local INSTALL_DIR="${CUSTOM_PREFIX:-/opt/FTPRush}"
    local DESKTOP_ENTRY="/usr/share/applications/ftprush.desktop"
    local TAR_FILE="/tmp/FTPRush_linux.tar.bz2"
    local DOWNLOAD_URL="https://www.wftpserver.com/download/FTPRush_linux.tar.bz2"
    local EXPECTED_CHECKSUM="cbbef468f257814a10fafdd7ce6938ca6253b90ea0bf1e63e35f03c8f66cfc6d"  # SHA256 checksum of FTPRush_linux.tar.bz2
    
    # Check current installation
    local current_version=$(get_installed_version)
    local latest_version=$(get_latest_ftp_rush_version)
    
    if [ "$current_version" != "not_installed" ]; then
        echo "Detected existing FTPRush installation (version: $current_version)"
        
        if [ "$(printf "%s\n%s" "$current_version" "$latest_version" | sort -V | tail -n1)" != "$current_version" ] && \
           [ "$current_version" != "unknown" ] && [ "$latest_version" != "$current_version" ]; then
            echo "A newer version of FTPRush is available: $latest_version"
            if [ "$INTERACTIVE" = true ] && ! prompt_yes_no "Would you like to upgrade from $current_version to $latest_version?" "y"; then
                echo "Upgrade cancelled by user."
                return 0
            fi
        elif [ "$INTERACTIVE" = true ] && ! prompt_yes_no "Reinstall FTPRush $current_version?" "n"; then
            echo "Installation cancelled by user."
            return 0
        fi
    fi
    
    # Check for and handle existing installation
    if [ -d "$INSTALL_DIR" ] || [ -f "$DESKTOP_ENTRY" ]; then
        if [ "$INTERACTIVE" = true ]; then
            echo "FTPRush appears to be already installed."
            if ! prompt_yes_no "Do you want to remove the existing installation?" "y"; then
                echo "Installation aborted by user."
                exit 0
            fi
            
            # Handle backup based on command line arguments
            if [ -n "$BACKUP_DIR" ]; then
                echo "Backing up configuration to specified directory: $BACKUP_DIR"
                backup_config "$BACKUP_DIR"
            elif [ "$NO_BACKUP" = false ]; then
                if prompt_yes_no "Would you like to backup your current configuration?" "y"; then
                    backup_config
                fi
            fi
        else
            # In non-interactive mode, backup if not explicitly disabled
            if [ "$NO_BACKUP" = false ]; then
                if [ -n "$BACKUP_DIR" ]; then
                    backup_config "$BACKUP_DIR"
                else
                    backup_config
                fi
            fi
        fi
        
        echo "Removing existing installation..."
        sudo rm -rf "$INSTALL_DIR"
        sudo rm -f "$DESKTOP_ENTRY"
        
        # Check if we should restore configuration
        if [ -n "$RESTORE_DIR" ]; then
            echo "Restoring configuration from: $RESTORE_DIR"
            restore_config "$RESTORE_DIR"
        fi
    fi

    # Check if we should use existing tarball
    local use_existing=false
    if [ -f "$TAR_FILE" ]; then
        if [ "$INTERACTIVE" = true ]; then
            if prompt_yes_no "Existing FTPRush tarball found. Use it?" "y"; then
                use_existing=true
            fi
        else
            echo "Using existing tarball (non-interactive mode)."
            use_existing=true
        fi
    fi
    
    # Download the file if needed
    if [ "$use_existing" = false ]; then
        echo "Downloading FTPRush from $DOWNLOAD_URL..."
        if ! wget -O "$TAR_FILE" "$DOWNLOAD_URL"; then
            echo "Error: Download failed! Exiting."
            exit 1
        fi
        
        # Verify checksum if we just downloaded the file
        if ! verify_checksum "$TAR_FILE" "$EXPECTED_CHECKSUM"; then
            if [ "$INTERACTIVE" = true ]; then
                if ! prompt_yes_no "Checksum verification failed. Continue anyway?" "n"; then
                    echo "Installation aborted by user."
                    exit 1
                fi
            else
                echo "Error: Checksum verification failed in non-interactive mode. Exiting."
                exit 1
            fi
        fi
    fi

    # Extract to /opt/FTPRush
    echo "Extracting FTPRush to $INSTALL_DIR..."
    sudo mkdir -p "$INSTALL_DIR"
    if ! sudo tar -xjf "$TAR_FILE" -C "$INSTALL_DIR" --strip-components=1; then
        echo "Extraction failed. Please check permissions and try again."
        exit 1
    fi

    # Set executable permissions for the FTPRush binary
    echo "Setting executable permissions for $EXEC_PATH..."
    sudo chmod +x "$EXEC_PATH"

    # Download icon
    download_icon

    # Desktop integration setup
    # Creates a standard-compliant .desktop file for system-wide access
    echo "Creating desktop entry..."
    if ! sudo tee "$DESKTOP_ENTRY" <<EOF > /dev/null
[Desktop Entry]
Version=1.0
Name=FTPRush
Comment=FTP Client for File Transfers
Exec=$EXEC_PATH
Icon=$ICON_FILE
Terminal=false
Type=Application
Categories=Network;FileTransfer;
EOF
    then
        echo "Failed to create desktop entry. Please check permissions."
    else
        sudo chmod +x "$DESKTOP_ENTRY"
        echo "Desktop entry created successfully."
    fi

    # Save version information
    echo "$latest_version" | sudo tee "$INSTALL_DIR/version.txt" > /dev/null
    
    echo "FTPRush $latest_version installation completed successfully!"
    
    # Handle configuration restore if specified or if this was an upgrade
    if [ -n "$RESTORE_DIR" ]; then
        echo "Restoring configuration from: $RESTORE_DIR"
        restore_config "$RESTORE_DIR"
    elif [ "$INTERACTIVE" = true ] && [ -d "/tmp/ftprush_backup_"* ] 2>/dev/null; then
        if prompt_yes_no "Would you like to restore your previous configuration?" "y"; then
            restore_config "/tmp/ftprush_backup_"*
        fi
    fi
    
    # Show version information
    local installed_version=$(get_installed_version)
    echo "Installed version: $installed_version"
    if [ "$installed_version" != "$latest_version" ] && [ "$installed_version" != "unknown" ]; then
        echo "Note: The installed version ($installed_version) is different from the expected latest version ($latest_version)"
    fi

    # Install wrapper script if not in silent mode
    if [ "$INTERACTIVE" = true ]; then
        if [ "$(id -u)" -eq 0 ]; then
            install_wrapper_script
        else
            echo "Note: To install the command-line wrapper, run this script as root."
            echo "      You can install it later by running: sudo $0 --install-wrapper"
        fi
    fi
    
    # Cleanup downloaded file if requested or in non-interactive mode
    if [ "$INTERACTIVE" = true ]; then
        if prompt_yes_no "Would you like to remove the temporary downloaded files?" "y"; then
            echo "Cleaning up temporary files..."
            rm -f "$TAR_FILE"
            echo "Cleanup completed."
        else
            echo "Temporary files retained in $TAR_FILE"
        fi
    else
        # In non-interactive mode, clean up by default
        echo "Cleaning up temporary files..."
        rm -f "$TAR_FILE"
    fi
}

# Uninstallation function
# Provides clean removal of all FTPRush components from the system
uninstall_ftprush() {
    echo "=== FTPRush Uninstallation ==="
    
    local uninstall=true
    
    if [ "$INTERACTIVE" = true ]; then
        if [ -d "$INSTALL_DIR" ] || [ -f "$DESKTOP_ENTRY" ]; then
            if ! prompt_yes_no "This will remove FTPRush from $INSTALL_DIR. Continue?" "n"; then
                echo "Uninstallation cancelled by user."
                return 1
            fi
        else
            echo "FTPRush does not appear to be installed."
            return 0
        fi
    fi
    
    # Handle backup before uninstallation
    if [ -n "$BACKUP_DIR" ]; then
        echo "Backing up configuration to specified directory: $BACKUP_DIR"
        backup_config "$BACKUP_DIR"
    elif [ "$NO_BACKUP" = false ]; then
        if [ "$INTERACTIVE" = true ]; then
            if prompt_yes_no "Would you like to backup your current configuration before uninstalling?" "y"; then
                backup_config
            fi
        else
            # In non-interactive mode, backup by default unless --no-backup is specified
            backup_config
        fi
    fi
    
    echo "Removing FTPRush files..."
    if [ -d "$INSTALL_DIR" ]; then
        sudo rm -rf "$INSTALL_DIR"
        echo "Removed installation directory: $INSTALL_DIR"
    fi
    
    if [ -f "$DESKTOP_ENTRY" ]; then
        sudo rm -f "$DESKTOP_ENTRY"
        echo "Removed desktop entry: $DESKTOP_ENTRY"
    fi
    
    # Remove wrapper script if running as root
    if [ "$(id -u)" -eq 0 ]; then
        uninstall_wrapper_script
    else
        echo "Note: To remove the command-line wrapper, run: sudo $0 --remove-wrapper"
    fi
    
    if [ ! -d "$INSTALL_DIR" ] && [ ! -f "$DESKTOP_ENTRY" ]; then
        echo "FTPRush was successfully uninstalled."
    else
        echo "Warning: Some files might not have been removed. Please check $INSTALL_DIR and $DESKTOP_ENTRY"
        return 1
    fi
}

# Handle installation based on command line arguments or show interactive menu
if [ -n "$INSTALL_MODE" ]; then
    # Non-interactive mode based on command line arguments
    case "$INSTALL_MODE" in
        install)
            install_ftprush
            ;;
        uninstall)
            uninstall_ftprush
            ;;
    esac
else
    # Interactive mode
    echo "Choose an option:"
    echo "1. Install FTPRush"
    echo "2. Uninstall FTPRush"
    read -p "Enter your choice: " choice

    case "$choice" in
        1)
            install_ftprush
            ;;
        2)
            uninstall_ftprush
            ;;
        *)
            echo "Invalid choice. Exiting."
            exit 1
            ;;
    esac
fi