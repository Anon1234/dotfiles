#!/bin/bash


usage() {
	echo "Usage: $0 <period> <title>"
	echo
	echo "	period  - minimum time between notifications in seconds"
	echo "	title   - title for notification"
	exit 1
}

[[ $# -ne 2 ]] && usage


PERIOD=$1
TITLE=$2

last_notify=$(date "+%s")
lines=""

while true; do

	read -r -t 10 line && lines+="$line\n" \
		               && echo "[$(date +%X)] $line" \
		               || echo "[$(date +%X)] Nothing new."

	time_now=$(date "+%s")
	dt=$(($time_now-$last_notify))
	if [[ $dt -ge $PERIOD ]] && [[ -n $lines  ]]; then

		notify-send -i stock_dialog-warning \
		            -u critical "[$(date +%X)] $TITLE" "$lines"

		echo "[$(date +%X)] New notification ($dt sec since last one)."

		lines=""
		last_notify=$time_now
	fi

done
