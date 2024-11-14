#!/bin/bash

# Change directory to root to ensure correct paths and permissions
cd / || { echo "Failed to navigate to root directory. Exiting."; exit 1; }

DOWNLOAD_URL="https://www.wftpserver.com/download/FTPRush_linux.tar.bz2"
INSTALL_DIR="/opt/FTPRush"
DESKTOP_ENTRY="/usr/share/applications/ftprush.desktop"
EXEC_PATH="$INSTALL_DIR/ftprush"
TAR_FILE="/tmp/FTPRush_linux.tar.bz2"
ICON_URL="https://www.wftpserver.com/images/ftprush_app_logo.png"
ICON_FILE="$INSTALL_DIR/ftprush.png"

# Function to download the icon
download_icon() {
  echo "Downloading icon..."
  wget -O "$ICON_FILE" "$ICON_URL" || { echo "Icon download failed! Skipping."; }
}

# Function to install FTPRush
install_ftprush() {
  echo "Installing FTPRush..."

  # Check if FTPRush is already installed
  if [ -d "$INSTALL_DIR" ]; then
    echo "FTPRush is already installed. Removing existing installation..."
    sudo rm -rf "$INSTALL_DIR"
    sudo rm "$DESKTOP_ENTRY"
  fi

  # Check for existing downloaded tarball
  if [ -f "$TAR_FILE" ]; then
    echo "Existing FTPRush tarball found. Use it? (y/N)"
    read -p "Enter your choice: " use_existing

    if [[ "$use_existing" == "y" || "$use_existing" == "Y" ]]; then
      echo "Using existing tarball..."
    else
      echo "Downloading FTPRush..."
      wget -O "$TAR_FILE" "$DOWNLOAD_URL" || { echo "Download failed! Exiting."; exit 1; }
    fi
  else
    echo "Downloading FTPRush..."
    wget -O "$TAR_FILE" "$DOWNLOAD_URL" || { echo "Download failed! Exiting."; exit 1; }
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

  # Create a Desktop Entry for all users
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

  echo "FTPRush installation completed successfully!"

  # Prompt user to clean up the downloaded tar file and icon
  echo "Would you like to remove the temporary downloaded files? (y/N)"
  read -p "Enter your choice: " cleanup_choice

  if [[ "$cleanup_choice" == "y" || "$cleanup_choice" == "Y" ]]; then
    echo "Cleaning up temporary files..."
    rm "$TAR_FILE"
    echo "Cleanup completed."
  else
    echo "Temporary files retained in $TAR_FILE."
  fi
}

# Function to uninstall FTPRush
uninstall_ftprush() {
  echo "Uninstalling FTPRush..."
  if [ -d "$INSTALL_DIR" ]; then
    sudo rm -rf "$INSTALL_DIR"
    sudo rm "$DESKTOP_ENTRY"
    echo "FTPRush uninstalled successfully."
  else
    echo "FTPRush is not installed."
  fi
}

# Main menu for user interaction
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
