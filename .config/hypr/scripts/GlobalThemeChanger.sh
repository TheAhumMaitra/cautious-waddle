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

if [[ ! -f "$SOURCE" ]]; then
  rofi -e "Theme file not found:\n$SOURCE"
  exit 1
fi

mkdir -p "$(dirname "$KITTY_CONFIG")"

cp "$SOURCE" "$KITTY_CONFIG"

if [[ -f "$WALLPAPER" ]]; then
  swww img "$WALLPAPER"
  "$SCRIPTSDIR/Refresh.sh"
  sleep 1

fi

if [[ -f "$WAYBAR_WALLUST_COLORS_FILE" ]]; then
  cp "$WAYBAR_WALLUST_COLORS_FILE" "$HOME/$CONFIG_DIR/waybar/wallust/colors-waybar.css"

fi

notify-send -u normal "Theme Changed" "Switched global theme to $choice"
