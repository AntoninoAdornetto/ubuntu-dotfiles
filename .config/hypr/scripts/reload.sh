#!/bin/env bash

SCRIPTSDIR=$HOME/.config/hypr/scripts/
USERSCRIPTS=$HOME/.config/hypr/user-scripts/

does_file_exist() {
	if [ -e "$1" ];then 
		return 0
	else
		return 1
	fi
}

_ps=(waybar rofi swaync ags)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

# quit ags
ags -q

sleep 0.3
# Relaunch waybar
waybar &

# relaunch swaync
sleep 0.5
swaync > /dev/null 2>&1 &

# relaunch ags
ags &

exit 0
