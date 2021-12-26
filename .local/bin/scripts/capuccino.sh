#!/bin/bash
 
## script to toggle screen lock inhibition
 
if [ -f "/home/$USER/.config/openbox/cappuccino" ];
    then rm -f "/home/$USER/.config/openbox/cappuccino" && notify-send "Screen saver enabled!"
    else touch "/home/$USER/.config/openbox/cappuccino" && notify-send "Screen saver disabled!"
fi
