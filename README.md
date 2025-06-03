# GDM Login Screen Wizard 🧙‍♂️✨

A simple yet powerful set of bash scripts to **backup**, **change**, and **restore** the GNOME Display Manager (GDM) login screen wallpaper on Fedora Workstation (tested on Fedora 42 with GNOME 48.2).

---

## Why?

Fedora's GDM login screen wallpaper isn't easily customizable by default. These scripts let you:

- Save your current login theme safely.
- Swap in a custom wallpaper of your choosing.
- Restore everything back to Fedora’s original pristine state.

---

## Contents

- `main.sh` — The wizard menu script that ties everything together.
- `backup-theme.sh` — Backs up your current GDM theme locally and system-wide.
- `set-wallpaper.sh` — Changes the GDM login wallpaper.
- `restore-theme.sh` — Restores the GDM theme from backup.
- `back_to_default/restore-default.sh` — Restores the GDM theme to the default(fedora 42).
- `wallpapers` — Directory containing wallpapers.

---

## Usage

1- **Clone this repo or download scripts**

```bash
git clone https://github.com/Ishan0121/GDM-LOGIN-WALLPAPER.git
cd GDM-LOGIN-WALLPAPER
rm -rf .git
chmod +x *.sh
```

2- **change dir name (optional)**

```bash
cd ..
mv GDM-LOGIN-WALLPAPER gdm-login-wizard 
cd gdm-login-wizard
````

3- **Run the main wizard script**

```bash
./main.sh
```

4- **Choose your option**

- `1` to backup your current theme (always do this first!)
- `2` to change the login wallpaper (make sure your desired wallpaper is in the correct path as specified in `set-wallpaper.sh`)
- `3` to restore the original theme from backup
- `4` to restore to default GDM theme(fedora 42).

---

## Notes

- **Root permissions** required for modifying system files — you will be prompted for your sudo password.
- Tested on Fedora Workstation 42 with GNOME Shell 48.2.
- Backup files are stored both locally (`./theme-backup/`) and system-wide (`/usr/share/gnome-shell/`).
- Make sure your wallpaper image has the correct permissions and path in `set-wallpaper.sh`.

---

## Customize Your Wallpaper

- I've added some wallpapers though you can find many good repos with great wallpapers out there.
- The script will ask for full path for the wallpaper (I just copy the image and paste it there).

---

## Troubleshooting

- If you experience a broken GDM or UI glitches, use option `3`or`4` in the wizard to restore the original theme.
- Always run the backup script before making changes.

---

## Contributions & Issues

Feel free to open issues or submit pull requests! Help make this tool more magical.

---

## License

MIT License — use freely, just don’t hex the code 😜

---
