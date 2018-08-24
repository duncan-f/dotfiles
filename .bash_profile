#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.config/scripts:$PATH"

export EDITOR="vim"
export BROWSER="qutebrowser"
export TERMINAL="st"

#spare_modifier="Hyper_R"
#xmodmap -e "keycode 23 = $spare_modifier"
#xmodmap -e "remove mod1 = $spare_modifier"
#xmodmap -e "add Mod4 = $spare_modifier"
#xmodmap -e "keycode any = Tab"
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
#xcape -e "$spare_modifier=Tab"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
