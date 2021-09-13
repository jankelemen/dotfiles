#!/bin/sh

#id=$(xinput list | awk '$0 ~ /Touchpad/ {print substr($6,4)}')
#isOn=$([ $(xinput list-props $id | awk '$0 ~ /Device Enabled/ {print $4}') = "0" ] && echo "off" || echo "on")
#
#if [ "$1" = "-i" ]; then
#	echo $isOn
#else
#	if [ "$isOn" = "off" ]; then
#		xinput set-prop $id "Device Enrabled" 1 && echo "touchpad enabled"
#	else
#		xinput set-prop $id "Device Enabled" 0 && echo "touchpad disabled"
#	fi
#fi

device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

if [ "$1" = "-i" ]; then
  [ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" = "1" ] && echo "on" || echo "off"
  exit 0
fi

[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" = "1" ] && xinput disable "$device" || xinput enable "$device"
