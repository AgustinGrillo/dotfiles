#!/bin/bash

# Requires Material (Icomoon) Font

function batt_percent {
	#acpi | awk '{print substr($4, 1, length($4)-1)}'
	#upower -i /org/freedesktop/UPower/devices/DisplayDevice  | grep -oP '(?<=percentage:          )[^/]+'
	echo $(upower -i /org/freedesktop/UPower/devices/DisplayDevice  | grep -oP '(?<=percentage:          ).*(?=%)') | awk '{print int($1+0.5)}'
}

function batt_icon {
	#acpi | awk '{print substr($3, 1, length($3)-1)}'
	upower -i /org/freedesktop/UPower/devices/DisplayDevice  | grep -oP '(?<=state:               )[^/]+'
}

batt=`batt_percent`
batticon=`batt_icon`



case $1 in
	percent)
	echo "$batt"%;;
	
	icon)
	if [[ "$batticon" == "charging" ]];
	then
		echo ""

	else
		#echo ""
		
		if [[ "$batt" -ge "80" ]];
		then
			echo "  " # "$batt_full"
		elif [[ "$batt" -ge "60" ]];
		then 
			echo "  "  # "$batt_ninety"
		elif [[ "$batt" -ge "40" ]];
		then 
			echo "  "  # "$batt_seventy"
		elif [[ "$batt" -ge "20" ]];
		then 
			echo "  "  # "$batt_medium"
		else 
			echo "  "  # "$batt_critical"
		fi
		
	fi
	;;
esac
