#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025-present Ahum Maitra theahummaitra@gmail.com
#
# SPDX-License-Identifier: 	GPL-3.0-or-later

# Repository url : https://github.com/TheAhumMaitra/cautious-waddle

THEMES_DIR="$HOME/.config/hypr/themes"
CONFIG_DIR=".config/"
KITTY_CONFIG="$HOME/.config/kitty/colors.conf"

themes=$(ls "$THEMES_DIR")
SCRIPTSDIR="$HOME/.config/hypr/scripts"

choice=$(echo "$themes" | rofi -dmenu -p "Select theme")
[[ -z "$choice" ]] && exit 0

KITTY_THEME_FOLDER="$THEMES_DIR/$choice/kitty"
WALLPAPER="$THEMES_DIR/$choice/wallpapers/default.png"
SOURCE="$KITTY_THEME_FOLDER/colors.conf"
WAYBAR_WALLUST_COLORS_FILE="$THEMES_DIR/$choice/waybar/wallust/colors-waybar.css"
WALLUST_HYPRLAND_CONFIG_FILE_THEME="$THEMES_DIR/$choice/hypr/wallust/wallust-hyprland.conf"

if [[ ! -f "$SOURCE" ]]; then
  rofi -e "Theme file not found:\n$SOURCE"
  exit 1
fi

mkdir -p "$(dirname "$KITTY_CONFIG")"

cp "$SOURCE" "$KITTY_CONFIG"

change_wallpaper=$(printf "Change default wallpaper\nYes\nNo" | rofi -dmenu -p "Do you want to change wallpaper?")

if [[ -f "$WALLPAPER" && "$change_wallpaper" == "Yes" ]]; then
  swww img "$WALLPAPER"
  "$SCRIPTSDIR/Refresh.sh"
  sleep 1

fi

if [[ -f "$WAYBAR_WALLUST_COLORS_FILE" ]]; then
  cp "$WAYBAR_WALLUST_COLORS_FILE" "$HOME/$CONFIG_DIR/waybar/wallust/colors-waybar.css"

fi

if [[ -f "$WALLUST_HYPRLAND_CONFIG_FILE_THEME" ]]; then
  mkdir -p "$HOME/.config/hypr/wallust"
  cp "$WALLUST_HYPRLAND_CONFIG_FILE_THEME" "$HOME/.config/hypr/wallust/wallust-hyprland.conf"

fi
notify-send -u normal "Theme Changed" "Switched global theme to $choice"
notify-send -u normal "Press SUPER+ALT+R to Refresh the theme"
