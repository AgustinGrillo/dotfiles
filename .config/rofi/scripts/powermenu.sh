#!/usr/bin/env bash

# Requires Material (Icomoon) Font

rofi_command="rofi -theme themes/sidebar/five.rasi"

# Options
shutdown=""
reboot=""
lock=" "
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        ~/.config/rofi/scripts/promptmenu.sh --yes-command "poweroff" --query "      Poweroff?"
        ;;
    $reboot)
        ~/.config/rofi/scripts/promptmenu.sh --yes-command "reboot" --query "       Reboot?"
        ;;
    $lock)
        sh -c "/home/$USER/.local/bin/scripts/screensaver.sh -f"
        ;;
    $suspend)
        mpc -q pause
        # Change screensaver
        sh -c "/home/$USER/.local/bin/scripts/change_screensaver.sh -f"
        # systemd
        systemctl suspend
        # elogind (runit, etc)
        #loginctl suspend
        ;;
    $logout)
        ~/.config/rofi/scripts/promptmenu.sh --yes-command "pkill -KILL -u $(whoami)" --query "       Logout?"
        ;;
esac
