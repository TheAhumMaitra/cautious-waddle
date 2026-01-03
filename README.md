# cautious-waddle - Theme switcher for Kool's Hyprland

You can switch to any theme you like with this theme launcher on Hyprland (Kool's Hyprland setup).

# Installation

**1. Clone this git repository temporary**

```
git clone https://github.com/TheAhumMaitra/cautious-waddle.git /tmp/hypr-add

```
**2. Merge some folders**

rsync -av /tmp/hypr-add/.config/scripts/ ~/.config/hypr/scripts/
rsync -av /tmp/.config/hypr-add/theme/   ~/.config/hypr/theme/

**3. Make the script executable**

```
cd .config/hypr/scripts
chmod a+x GlobalThemeChanger.sh
```

**4 . Cleanup**

'''
rm -rf /tmp/hypr-add
'''

**5. Add keybind to launch this script in keybinds file**

_You can use this for for Kool's Hyprland:_

```
#HYPRLAND THEME LAUNCHER
bindd = $mainMod, T, Global theme launcher, exec, /home/USERNAME_HERE/.config/hypr/scripts/GlobalThemeChanger.sh

```
# License

[`GNU General Public License v3.0 or later`](LICENSE)
