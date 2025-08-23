#!/bin/bash

# Uses scrot and xclip packages

rofi_command="rofi -theme themes/screenshot.rasi"

# Options: 

# Take a screenshot
# scrot 'snap_%y_%m_%d_%H_%M_%S.png' -e 'mv $f ~/Pictures/'
# Take a screenshot of a window
# scrot -s -f 'snap_%y_%m_%d_%H_%M_%S.png' -e 'mv $f ~/Pictures/'
# Take a screenshot of an area
# scrot -s -f 'snap_%y_%m_%d_%H_%M_%S.png' -e 'mv $f ~/Pictures/'
# Copy a screenshot to clipboard
# scrot '/tmp/screenshot.png' -e 'xclip -selection clipboard -t image/png -i $f'
# Copy a screenshot of a window to clipboard
# scrot -s -f '/tmp/screenshot.png' -e 'xclip -selection clipboard -t image/png -i $f'
# Copy a screenshot of an area to clipboard
# scrot -s -f '/tmp/screenshot.png' -e 'xclip -selection clipboard -t image/png -i $f'

#               
ss=""  
ss_window=""
ss_area=""
ss_window_copy=""
ss_area_copy=""

# Variable passed to rofi
options="$ss\n$ss_window\n$ss_area\n$ss_window_copy\n$ss_area_copy"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $ss)
        scrot 'snap_%y_%m_%d_%H_%M_%S.png' -e 'mv $f ~/Pictures/  ; notify-send Screenshot -i ~/Pictures/$f -u normal "Snapshot Taken" '
        ;;
    $ss_window)
        scrot -s -f 'snap_%y_%m_%d_%H_%M_%S.png' -e 'mv $f ~/Pictures/  ; notify-send Screenshot -i ~/Pictures/$f -u normal "Snapshot Taken" '
	;;
    $ss_area)
        scrot -s -f 'snap_%y_%m_%d_%H_%M_%S.png' -e 'mv $f ~/Pictures/  ; notify-send Screenshot -i ~/Pictures/$f -u normal "Snapshot Taken" '
	;;
    $ss_window_copy)
        scrot -s -f '/tmp/screenshot.png' -e 'xclip -selection clipboard -t image/png -i $f  ; notify-send Screenshot -i /tmp/screenshot.png -u normal "Snapshot Copied" '
	;;
    $ss_area_copy)
        scrot -s -f '/tmp/screenshot.png' -e 'xclip -selection clipboard -t image/png -i $f  ; notify-send Screenshot -i /tmp/screenshot.png -u normal "Snapshot Copied" '
	;;
esac

