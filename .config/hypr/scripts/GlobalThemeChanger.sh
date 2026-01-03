#!/usr/bin/env bash

# User choice
choice=$(wallust theme list \
  | sed '1d; s/^- //' \
  | rofi -dmenu -p "Select Wallust Theme")

# If user requested to exit
[[ -z "$choice" ]] && exit 0

# Apply the theme
wallust theme "$choice"

notify-send "Global theme changed" "Theme selcted $choice"

notify-send "Press SUPER+ALT+R to Refresh Waybar Theme"
