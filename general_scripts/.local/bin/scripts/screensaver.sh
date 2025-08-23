#!/bin/bash
 
img=/tmp/i3lock.png

scrot -o $img
convert $img -scale 40% -scale 250% -blur 30x30 $img

i3lock -i $img -e -p default -u
