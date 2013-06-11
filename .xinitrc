#!/bin/bash

#xset +fp /usr/share/fonts/local
#xset fp rehash

#########################################
#xset -b # disable bell
#eval `/usr/bin/ssh-agent`
#
#if test -f /usr/lib/ssh/x11-ssh-askpass # Debian
#then
#	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
#fi
##########################################################

xrdb -merge ~/.Xresources



while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
#	LOCALTIME=$(date +"%Y-%m-%d %H:%M")
	TIME=$(date +"%a, %b %d %R")
#	DATE=$(date +"%Y-%m-%d")
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"


#	if acpi -a | grep off-line > /dev/null
#	then
#		BAT="Bat. $(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')"
#		xsetroot -name "$IP $BAT $VOL $TEMP $TIME"
#	else
#		xsetroot -name "$IP $VOL $TEMP $LOCALTIME"
#	fi

        xsetroot -name "IP:$IP  Vol:$VOL  $TEMP  $TIME"
	sleep 20s
done &

exec dwm
