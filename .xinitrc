#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

setxkbmap -layout fr,ar -option 'grp:alt_shift_toggle'

xcape -e "Hyper_R=Tab"

exec i3
