#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


export PATH="$HOME/.config/scripts:$PATH"

export EDITOR="vim"
export BROWSER="qutebrowser"
export TERMINAL="st"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
