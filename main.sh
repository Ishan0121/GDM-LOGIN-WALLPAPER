#!/bin/bash

echo "🧙‍♂️ Welcome to GDM Login Screen Wizard!"
echo
echo "Choose an option:"
echo "1. 🧾 Backup current theme (recommended if using the script for the first time)"
echo "2. 🖼️ Change GDM login wallpaper"
echo "3. 🧹 Restore GDM theme from backup"
echo "4. 🧽 Restore to default GDM theme"
echo

read -rp "Enter choice [1/2/3/4]: " choice
echo

# Get directory where script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case $choice in
    1)
        if [[ -f "$SCRIPT_DIR/backup-theme.sh" ]]; then
            bash "$SCRIPT_DIR/backup-theme.sh"
        else
            echo "❌ Backup script not found!"
        fi
        ;;
    2)
        if [[ -f "$SCRIPT_DIR/set-wallpaper.sh" ]]; then
            bash "$SCRIPT_DIR/set-wallpaper.sh"
        else
            echo "❌ Wallpaper script not found!"
        fi
        ;;
    3)
        if [[ -f "$SCRIPT_DIR/restore-theme.sh" ]]; then
            bash "$SCRIPT_DIR/restore-theme.sh"
        else
            echo "❌ Restore script not found!"
        fi
        ;;
    4)
        if [[ -f "$SCRIPT_DIR/back_to_default/restore-default.sh" ]]; then
            bash "$SCRIPT_DIR/back_to_default/restore-default.sh"
        else
            echo "❌ Restore script not found!"
        fi
        ;;
    *)
        echo "👻 Invalid choice. Try again with 1, 2, or 3."
        ;;
esac
