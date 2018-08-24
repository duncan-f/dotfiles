#!/bin/sh

#[[ -f ~/.bash_profile ]] && . ~/.bash_profile

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

xcape -e "Hyper_R=Tab"

exec i3

