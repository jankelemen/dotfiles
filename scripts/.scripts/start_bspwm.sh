#!/bin/sh

# Increase key speed via a rate change
xset r rate 300 50

# Map the caps lock key to super
# setxkbmap -option caps:super

# But when it is pressed only once, treat it as escape
# killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'

# setxkbmap -layout us,sk -variant ,qwerty -option "grp:win_space_toggle"

sxhkd &
exec bspwm

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar mybar &