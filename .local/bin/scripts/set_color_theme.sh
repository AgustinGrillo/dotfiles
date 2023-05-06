#!/usr/bin/env bash

# Script to set theme.

# TODO: Add default argument
theme="$1"  # dark or light

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Change kitty config
new_conf_path="${SCRIPT_DIR}/../../../.config/kitty/kitty.${theme}.conf"
old_conf_path="${SCRIPT_DIR}/../../../.config/kitty/kitty.conf"
cp "$new_conf_path" "$old_conf_path"

# Change neovim config
cp "${SCRIPT_DIR}/../../../.config/nvim/lua/colorschemes-config/catppuccin.${theme}.lua" "${SCRIPT_DIR}/../../../.config/nvim/lua/colorschemes-config/catppuccin.lua"

# Change wallpaper
nitrogen --set-zoom-fill "${SCRIPT_DIR}/../../../walls/${theme}.jpg"

# Change gtk theme
cp "${SCRIPT_DIR}/../../../.config/gtk-3.0/settings.${theme}.ini" "${SCRIPT_DIR}/../../../.config/gtk-3.0/settings.ini"

# TODO: Change global colors
# Change Rofi colors
echo '@import "colors/'${theme}'.rasi"' > "${SCRIPT_DIR}/../../../.config/rofi/themes/colors/color_picker.rasi"
# Change tint2 colors
# killall -SIGUSR1 tint2
