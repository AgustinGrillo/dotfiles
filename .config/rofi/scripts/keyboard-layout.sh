#!/usr/bin/env bash

rofi_command="rofi -theme themes/keyboard.rasi"

# Options
us=US
sp=SP

# Variable passed to rofi
options="$us\n$sp"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $us)
        setxkbmap us && notify-send 'Keyboard > US'
        ;;
    $sp)
        setxkbmap latam && notify-send 'Keyboard > SP'
        ;;
esac
