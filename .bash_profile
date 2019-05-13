#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')$HOME/.config/composer/vendor/bin:$PATH"

export SUDO_ASKPASS="/usr/lib/ssh/x11-ssh-askpass"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DESKTOP_DIR="~/Desktop"
export XDG_DOCUMENTS_DIR="~/docs"
export XDG_DOWNLOAD_DIR="~/dl"
export XDG_PICTURES_DIR="~/pics"
export XDG_MUSIC_DIR="~/music"
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"
export TERMINAL="st"
export READER="zathura"
export BIB="$HOME/docs/latex/bibliography.bib"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
