#!/bin/sh

device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

if [ "$1" = "-i" ]; then
  [ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" = "1" ] && echo "on" || echo "off"
  exit 0
fi

[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" = "1" ] && xinput disable "$device" || xinput enable "$device"
