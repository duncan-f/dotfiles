#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.scripts:$HOME/.config/composer/vendor/bin:$HOME/.vim/bundle/vim-live-latex-preview/bin:$PATH"

export SUDO_ASKPASS="/usr/lib/ssh/x11-ssh-askpass"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DESKTOP_DIR="~/Desktop"
export XDG_DOCUMENTS_DIR="~/Documents"
export XDG_DOWNLOAD_DIR="~/Downloads"
export XDG_PICTURES_DIR="~/Pictures"
export XDG_MUSIC_DIR="~/Music"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"
export TERMINAL="st"
export READER="zathura"
export BIB="$HOME/Documents/LaTeX/bibliography.bib"

#spare_modifier="Hyper_R"
#xmodmap -e "keycode 23 = $spare_modifier"
#xmodmap -e "remove mod1 = $spare_modifier"
#xmodmap -e "add Mod4 = $spare_modifier"
#xmodmap -e "keycode any = Tab"
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
#xcape -e "$spare_modifier=Tab"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
