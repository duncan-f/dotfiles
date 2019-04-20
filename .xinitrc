#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb ~/.Xresources

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

setxkbmap -layout fr,ar -option 'grp:alt_shift_toggle'

xcape -e "Hyper_R=Tab"
xset +fp /home/duncan/.local/share/fonts
xset fp rehash
#exec dwm
exec i3
