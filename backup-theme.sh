#!/bin/bash

echo "📦 Backing up GNOME Shell theme..."

# Directories and file paths
BACKUP_DIR="./theme-backup"
SYSTEM_THEME="/usr/share/gnome-shell/gnome-shell-theme.gresource"
LOCAL_BACKUP="$BACKUP_DIR/gnome-shell-theme.gresource"
SYSTEM_BACKUP="/usr/share/gnome-shell/gnome-shell-theme.gresource.bak"

# Create local backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Check if the original theme exists
if [ ! -f "$SYSTEM_THEME" ]; then
    echo "❌ Error: Theme file not found at $SYSTEM_THEME"
    exit 1
fi

# Backup to local dir
cp "$SYSTEM_THEME" "$LOCAL_BACKUP"
echo "✅ Local backup saved at $LOCAL_BACKUP"

# Backup to system dir (with sudo)
sudo cp "$SYSTEM_THEME" "$SYSTEM_BACKUP"
echo "✅ System backup saved at $SYSTEM_BACKUP"

echo "🎉 Backup completed!"
