#!/bin/sh

# This script display an appropriate brightness icon according to the brightness level

# Requires Material (Icomoon) Font

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

# Dependencies: `xbacklight` or `light-git'

# Prefer the `light` package, use `xbacklight` if `light` not found
#if [[ $(which light) == *"/light"* ]]
#then
#    b=$(light -G)
#else
#    b=$(xbacklight -get)
#fi

# Lets round the float result
bri=$(brightnessctl -m -d intel_backlight | awk -F, '{print substr($4, 0, length($4)-1)}' | tr -d '%')
#bri=brightnessctl -m -d intel_backlight | grep (?<=percentage:          )[^/]+

var20=20
var40=40
var60=60
var80=80

if [ $bri -gt $var80 ]
    then
        echo ""
elif [ $bri -gt $var60 ]
    then
        echo ""
elif [ $bri -gt $var40 ]
    then
        echo ""
elif [ $bri -gt $var20 ]
    then
        echo ""
else
    echo ""
fi