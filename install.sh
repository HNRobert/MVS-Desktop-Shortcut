#!/bin/bash

# MVS Desktop Shortcut Installer
# This script installs the MVS desktop shortcut and icon

set -e  # Exit on any error

echo "Installing MVS Desktop Shortcut..."

# Check if running as root for system-wide installation
if [[ $EUID -eq 0 ]]; then
    echo "Running as root - installing system-wide"
    DESKTOP_DIR="/usr/share/applications"
else
    echo "Running as user - installing for current user"
    DESKTOP_DIR="$HOME/.local/share/applications"
    # Create directory if it doesn't exist
    mkdir -p "$DESKTOP_DIR"
fi

sudo mkdir -p /opt/MVS

# Copy the icon to /opt/MVS/
echo "Installing MVS icon..."
sudo cp MVS.png /opt/MVS/MVS.png
sudo chmod 644 /opt/MVS/MVS.png

# Copy the desktop file
echo "Installing desktop shortcut..."
sudo cp mvs.desktop "$DESKTOP_DIR/"
sudo chmod 644 "$DESKTOP_DIR/mvs.desktop"

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    echo "Updating desktop database..."
    if [[ $EUID -eq 0 ]]; then
        update-desktop-database /usr/share/applications
    else
        update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
    fi
fi

echo "Installation completed successfully!"
echo ""
echo "The MVS shortcut should now appear in your applications menu."
echo "If you don't see it immediately, try logging out and back in."
echo ""
echo "Files installed:"
echo "  - Desktop file: $DESKTOP_DIR/mvs.desktop"
echo "  - Icon: /opt/MVS/MVS.png"
