#!/bin/bash
 
## This script creates a screenshot of the current workspace, pixelates and blurs it
## and makes it GNOME background, then it activates gnome-screensaver and switches off the display.
    
## scrot/convert part is adapted from https://faq.i3wm.org/question/83/how-to-run-i3lock-after-computer-inactivity/
## gesttings part is taken from Variety
## cappuccino is inspired by but not based on the caffeine application
 
# inhibt screen saver use -f switch to force screen saver
if [ "$1" != "-f" -a -f "/home/$USER/.config/openbox/cappuccino" ]; then
    exit
fi
     
# inhibit screen saver when media players are running
# cheap method, add missing players to regex
if [ "$1" != "-f" -a `ps -u $USER | grep -Ec "(totem|mpv|vlc|*mplayer)"` -gt 0 ]; then
    exit
fi
 
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
# lock screen using gnome-screensaver
exec gnome-screensaver-command -l &
# lets wait a bit before switching off the screen
sleep 10
# next lets get the state of the screen saver, if still active, switch off the screen
bla="The screensaver is inactive"
state=`gnome-screensaver-command -q`
if [ "$state" != "$bla" ]; then
    # turn off display
    xset dpms 0 0 1; sleep 2
    # make display turn off automatically after 20 sec
    xset dpms 0 0 20
else
    exit
fi

# lets keep the script running in background until the screen saver gets switched off
# in other words: until you login. basically, it does nothing, most of the time it sleeps
while [ "$state" != "$bla" ]; do
    sleep 5
    state=`gnome-screensaver-command -q`
done
# set display to not turn off automatically
xset dpms 0 0 0
