#!/usr/bin/env bash

theme="settings"
dir="$HOME/.config/rofi/themes"

time_icon=" "
time=$(date "+%H:%M")

date_icon=" "
date=$(date "+%a - %b %d")

battery_icon=$(~/.config/tint2/executor/battery-stat.sh icon)
battery=$(~/.config/tint2/executor/battery-stat.sh percent)

rofi_command="rofi -theme $dir/$theme"

# Options
keyboard=""
redshift=$(~/.config/tint2/executor/brightness-icon.sh)  # =""
wifi=$(~/.config/tint2/executor/network icon)  # =" "
bluetooth=$(~/.local/bin/rofi-bluetooth --status)  # =""
power=""

# Variable passed to rofi
options="$keyboard\n$redshift\n$wifi\n$bluetooth\n$power"

chosen="$(echo -e "$options" | $rofi_command -p "   $time_icon $time            $date_icon  $date            $battery_icon  $battery" -dmenu -selected-row 2)"
case $chosen in
    $keyboard)
        ~/.config/rofi/scripts/keyboard-layout.sh
        ;;
    $redshift)
        pkill -USR1 redshift && notify-send "Redshift toggled"
        ;;
    $wifi)
        ~/.local/bin/networkmanager_dmenu
        ;;
    $bluetooth)
        ~/.local/bin/rofi-bluetooth
        ;;
    $power)
        bash -c ~/.config/rofi/scripts/powermenu.sh
        ;;
esac
