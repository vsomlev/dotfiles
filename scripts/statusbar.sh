print_power() {
  	status="$(cat /sys/class/power_supply/ACAD/online)"
  	battery="$(cat /sys/class/power_supply/BAT0/capacity)"
  	if [[ "${status}" == 1 && "${battery}" == 100 ]]; then
		echo -ne ""
	elif [[ "${status}" == 1 ]]; then
    	echo -ne "plugged ${battery}% | "
  	else
    	echo -ne "battery ${battery}% | "
  	fi
}

print_email_count() {
   	mail1="$(find $HOME/.Mail/Gmail/INBOX/new/ -type f | wc -l)"
   	emailcount="$(($mail1))"
    if [[ "${emailcount}" -ne 0 ]]; then
        echo -en "mail ${emailcount} | "
    fi
}

print_volume(){
    mix=`amixer get Master | tail -1`
    vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
    if [[ $mix == *\[off\]* ]]; then
      	echo -e ""
    elif [[ $mix == *\[on\]* ]]; then
      	echo -e "${vol}% | "
    else
      	echo -e "---"
    fi
}

print_datetime() {
  	datetime="$(date "+%a %d %b %H:%M")"
	echo -ne "${datetime}"
}

print_spotify() {
	sp_status=`sp`
	if [ "$sp_status" = "Error: Spotify is not running." ]; then
		echo -ne ""
	else
		eval `sp eval`
		echo -ne $SPOTIFY_ARTIST
		echo -ne " - "
		echo -ne $SPOTIFY_TITLE
		echo -ne " | "
	fi
}

print_mpd() {
	mpd_status=`mpc 2>&1`
	if [ "$mpd_status" = "error: Connection refused" ]; then
		echo -ne ""
	else
		# song_progress="$(mpc | head -2 | tail -1 | awk '{print $4}')"
		echo -ne `mpc current`
		# echo -ne " "
		# echo -ne $song_progress
		echo -ne " | "
	fi
}

xsetroot -name "$(print_mpd)$(print_spotify)$(print_power)$(print_email_count)$(print_datetime)"

