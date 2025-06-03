#!/bin/bash

set -e

echo "✨ GDM Login Wallpaper Patch (GNOME 48 Ready!)"

TEMP_DIR="$HOME/.cache/gdm-theme-rebuild"
RESOURCE="/usr/share/gnome-shell/gnome-shell-theme.gresource"
BACKUP="/usr/share/gnome-shell/gnome-shell-theme.gresource.bak"
WALLPAPER_NAME="login-wallpaper"

read -rp "🖼️ Full path to wallpaper image (PNG or JPG or JPEG or WEBP): " USER_WALLPAPER
if [ ! -f "$USER_WALLPAPER" ]; then
  echo "❌ File not found: $USER_WALLPAPER"
  exit 1
fi

EXT="${USER_WALLPAPER##*.}"
EXT="${EXT,,}"
WALLPAPER="/usr/share/backgrounds/$WALLPAPER_NAME.$EXT"

echo "📁 Preparing temp build directory: $TEMP_DIR"
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR/files"
cd "$TEMP_DIR/files"

echo "🔍 Extracting all files from gresource..."
for FILE in $(gresource list "$RESOURCE"); do
  TARGET="${FILE#/org/gnome/shell/theme/}"
  mkdir -p "$(dirname "$TARGET")"
  gresource extract "$RESOURCE" "$FILE" > "$TARGET"
done

echo "🎨 Patching all CSS files with wallpaper magic..."
CSS_SNIPPET="
#lockDialogGroup {
  background: #2e3440;
  background-image: url(file://$WALLPAPER);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
"

for CSS in *.css; do
  echo "🌈 Patching $CSS..."
  echo "$CSS_SNIPPET" >> "$CSS"
done

echo "🖼️ Installing wallpaper to $WALLPAPER"
sudo cp "$USER_WALLPAPER" "$WALLPAPER"

cd "$TEMP_DIR"

echo "📜 Creating XML manifest..."
cat > gnome-shell-theme.gresource.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">
EOF

cd "$TEMP_DIR/files"
find . -type f | sed 's|^\./|    <file>|;s|$|</file>|' >> ../gnome-shell-theme.gresource.xml

cd "$TEMP_DIR"
cat >> gnome-shell-theme.gresource.xml <<EOF
  </gresource>
</gresources>
EOF

echo "💾 Backing up original gresource..."
sudo cp -n "$RESOURCE" "$BACKUP"

echo "🛠️ Rebuilding gresource..."
glib-compile-resources gnome-shell-theme.gresource.xml --sourcedir=files

echo "📦 Replacing system theme resource..."
sudo cp gnome-shell-theme.gresource "$RESOURCE"

echo "✅ Done! Wallpaper applied to GDM login screen."
echo "🔄 Reboot or run: sudo systemctl restart gdm"
echo "🧯 To restore: sudo cp $BACKUP $RESOURCE"
