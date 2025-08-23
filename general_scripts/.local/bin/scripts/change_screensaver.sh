#!/bin/bash
 
## This script creates a screenshot of the current workspace, pixelates and blurs it
## and makes it GNOME background.
 
screen1="/home/$USER/screensaver/lockscreen1.png"
screen2="/home/$USER/screensaver/lockscreen2.png"
# take screenshot
scrot $screen1
# pixelate and blur image using convert (could use mogrify but is slower)
convert $screen1 -scale 40% -scale 250% -blur 10x10 $screen2
# delete first screen1
rm $screen1
# make screenshot gnome background
gsettings set org.gnome.desktop.background picture-uri "file://$screen2" 2> /dev/null