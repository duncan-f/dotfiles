#!/bin/sh

[ -f "$HOME/.Xresources" ] && xrdb "$HOME/.Xresources"

xset +fp "$HOME/.local/share/fonts" && xset fp rehash &
setxkbmap -layout fr,ar -option 'grp:alt_shift_toggle' &

exec bspwm
