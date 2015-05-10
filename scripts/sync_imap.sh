#!/bin/bash
# notify of new mails
mail1="$(find $HOME/.Mail/Gmail/INBOX/new/ -type f | wc -l)"
emailcount="$(($mail1))"
if [[ "${emailcount}" -ne 0 ]]; then
	notify-send "${emailcount} new emails."
fi

# get new mails
read -r pid < ~/.offlineimap/pid

if ps $pid &>/dev/null; then
    echo "offlineimap ($pid): another instance running." >&2
    kill -9 $pid
fi

offlineimap -o -u quiet &
