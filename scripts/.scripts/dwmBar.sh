#!/bin/sh

print_brightness() {
  printf "SCREEN: %.0f%s" "$(light -G)" %
}

print_mem() {
  echo RAM: "$(free -m | awk 'NR==2 {printf "%.1f", $7/1000}')"GB
}

print_bat() {
  echo BATTERY: "$(cat /sys/class/power_supply/BAT*/capacity)"%
}

print_date() {
  echo DATE: "$(date "+%a %m-%d %I:%M %p")"
}

print_wifi() {
  echo WIFI: "$(nmcli -t -f NAME connection show --active)"
}

print_volume() {
  echo VOL: "$(pamixer --get-volume-human)"
}

print_mike() {
  echo "MIKE:" $(amixer -D pulse sget Capture | awk -F"[][]" 'BEGIN { RS="" } /Front Left/ { if ($4 == "off") { print "muted" } else { print $2 } }')
}

print_layout() {
  xkblayout-state print %s
}

xsetroot -name " $(print_date) | $(print_mem) | $(print_wifi) | $(print_brightness) | $(print_bat) | $(print_volume) | $(print_mike) | $(print_layout) "
