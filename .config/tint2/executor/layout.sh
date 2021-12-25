#!/bin/bash

# Requires Material (Icomoon) Font

lang=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
# variant=$(setxkbmap -query | grep variant | sed 's/variant.* //g')


case $1 in 
	icon)
		echo  "";; # "⌨ ";;
	
	layout)
		echo $lang ;;
esac 
