#!/bin/sh
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize

PS1="\[$(tput bold)\]\[$(tput setaf 3)\][\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput bold)\]\[$(tput setaf 1)\]\h \[$(tput setaf 4)\]\W\[$(tput setaf 3)\]] \[$(tput sgr0)\]\$ "

[ -f "$HOME/.config/shortcutsrc" ] && . "$HOME/.config/shortcutsrc"
[ -f "$HOME/.config/aliasrc" ] && . "$HOME/.config/aliasrc"

