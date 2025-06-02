#!/bin/bash

echo "♻️ Restoring GNOME Shell theme to its original state..."

LOCAL_BACKUP="./theme-backup/gnome-shell-theme.gresource"
SYSTEM_BACKUP="/usr/share/gnome-shell/gnome-shell-theme.gresource.bak"
TARGET="/usr/share/gnome-shell/gnome-shell-theme.gresource"

if [ -f "$LOCAL_BACKUP" ]; then
    echo "🔁 Restoring from local backup..."
    sudo cp "$LOCAL_BACKUP" "$TARGET"
elif [ -f "$SYSTEM_BACKUP" ]; then
    echo "🔁 Local backup missing. Using system backup..."
    sudo cp "$SYSTEM_BACKUP" "$TARGET"
else
    echo "❌ No backup found in either location."
    echo "💡 Run the backup script first: ./backup-theme.sh"
    exit 1
fi

echo "✅ Theme restored!"
echo "🔄 Restarting GDM to apply changes..."
sudo systemctl restart gdm
