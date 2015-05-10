#!/usr/bin/env bash

mkdir /tmp/tmp_screen
cd /tmp/tmp_screen

# list of keys to reach each desktop
declare -a desks=("F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8")

# iterate over the desktops and screenshot them
for desk in "${desks[@]}"; do
	echo $desk
	xdotool key $desk
	sleep 1
	scrot screen_$desk.png
done

# Return to first workspace
xdotool key F1

# Concatenate all workspace screenshots
montage -geometry +0+0 -tile 2x4 /tmp/tmp_screen/screen_*png ~/all_screens.png

rm -rf /tmp/tmp_screen
