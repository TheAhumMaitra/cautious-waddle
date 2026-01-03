#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2025-present Ahum Maitra theahummaitra@gmail.com
#
# SPDX-License-Identifier: 	GPL-3.0-or-later

# Repository url : https://github.com/TheAhumMaitra/cautious-waddle

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
