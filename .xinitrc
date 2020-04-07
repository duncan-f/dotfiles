#!/bin/sh

[ -f "$HOME/.config/Xresources" ] && xrdb "$HOME/.config/Xresources"
[ -f "$HOME/.xprofile" ] && . "$HOME/.xprofile"

exec dwm
