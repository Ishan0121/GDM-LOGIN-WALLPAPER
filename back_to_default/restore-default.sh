#!/bin/bash

set -e

# === Define Paths ===
RESTORE_DIR="$(dirname "$(realpath "$0")")"
RESOURCE_FILE="$RESTORE_DIR/gnome-shell-theme.gresource"
SYSTEM_RESOURCE="/usr/share/gnome-shell/gnome-shell-theme.gresource"

echo "🪄 GNOME Theme Restore Script – Fedora Edition"
echo "📦 Source: $RESOURCE_FILE"
echo "🧱 Target: $SYSTEM_RESOURCE"

# === Checks ===
if [[ ! -f "$RESOURCE_FILE" ]]; then
  echo "❌ Error: The gnome-shell-theme.gresource file is missing in $RESTORE_DIR"
  exit 1
fi

echo "🔐 You need sudo permission to overwrite system files..."
sudo true

# === Restore ===
echo "🗂️ Copying default theme back into system..."
sudo cp "$RESOURCE_FILE" "$SYSTEM_RESOURCE"

echo "✅ Restore complete!"
echo "🔁 Now restart GDM to apply changes:"
echo "    sudo systemctl restart gdm"
