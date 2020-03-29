#!/bin/sh

[ -f "$HOME/.config/Xresources" ] && xrdb "$HOME/.config/Xresources"

xset +fp "$HOME/.local/share/fonts" && xset fp rehash &
setxkbmap -layout fr,ar -option 'grp:alt_shift_toggle' &

exec bspwm
