# Script to set theme.

# TODO: Receive theme as argument
theme="light"  # dark or light
theme="dark"  # dark or light

# Change kitty config
new_conf_path="./../../../.config/kitty/kitty.${theme}.conf"
old_conf_path="./../../../.config/kitty/kitty.conf"
cp "$new_conf_path" "$old_conf_path"

# Change neovim config
cp "./../../../.config/nvim/lua/colorschemes-config/catppuccin.${theme}.lua" ./../../../.config/nvim/lua/colorschemes-config/catppuccin.lua

# Change wallpaper
nitrogen --set-zoom-fill "./../../../walls/${theme}.jpg"
