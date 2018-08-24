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

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

DEFAULT_COLOR="\033[01;39m"
BLACK_COLOR="\033[01;30m"
RED_COLOR="\033[01;31m"
GREEN_COLOR="\033[01;32m"
YELLOW_COLOR="\033[01;33m"
BLUE_COLOR="\033[01;34m"
PURPLE_COLOR="\033[01;35m"
CYAN_COLOR="\033[01;36m"
LGRAY_COLOR="\033[01;37m"
DGRAY_COLOR="\033[01;90m"
LRED_COLOR="\033[01;91m"
LGREEN_COLOR="\033[01;92m"
LYELLOW_COLOR="\033[01;93m"
LBLUE_COLOR="\033[01;94m"
LPURPLE_COLOR="\033[01;95m"
LCYAN_COLOR="\033[01;96m"
WHITE_COLOR="\033[01;97m"
RESET_COLOR="\033[00m"

function git_color() {
    local git_status="$(git status 2> /dev/null)"

    if  [[ $git_status =~ "working directory clean" ]]; then
        echo -e $RED_COLOR
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $YELLOW_COLOR
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $GREEN_COLOR
    else
        echo -e $LPURPLE_COLOR
    fi
}

function git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1="[$GREEN_COLOR\u$RESET_COLOR@$PURPLE_COLOR\h$RESET_COLOR]$BLUE_COLOR\w\$(git_color)\$(git_branch)$RESET_COLOR\n\$ "
else
    PS1='[\u@\h:\w]$(git_branch)\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'

alias starwars="telnet towel.blinkenlights.nl"

alias vcfg='vim ~/.vimrc'
alias bcfg='vim ~/.bashrc'
alias bsrc='source ~/.bashrc'
alias icfg='vim ~/.config/i3/config'
alias pcfg='vim ~/.config/polybar/config'
alias xcfg='vim ~/.Xresources'
alias xsrc='xrdb ~/.Xresources'
alias tcfg='vim ~/.tmux.conf'
alias rcfg='vim ~/.config/ranger/rc.conf'
alias ccfg='vim ~/.calcurse/conf'
alias ncfg='vim ~/.newsboat/config'
alias qcfg='vim ~/.config/qutebrowser/config.py'
alias macfg='vim ~/.config/mutt/aliases'
alias mcfg='vim ~/.config/mutt/muttrc'
alias dcfg='vim ~/.config/dunst/dunstrc'
alias fcfg='vim ~/.config/rofi/config'

alias cdp="cd ~/Programming/projects/webdev/phpframework/"
alias cdw="cd ~/Programming/projects/webdev/"
alias phps="php -S localhost:8000 -t public/ -d display_errors=1"

alias upgrade="sudo pacman -Syu"
alias downgrade="sudo pacman -U"
alias uyrt="yaourt -Syu --aur --noconfirm"
alias yt="youtube-dl --add-metadata -ic"
alias yta="youtube-dl --add-metadata -xic"
alias pac="sudo pacman -S"
alias ypac="sudo pacman -Sy"
alias dpac="sudo pacman -Rnsdd"
alias yrt="yaourt -Sy --noconfirm"
 
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export SUDO_ASKPASS="/usr/lib/ssh/x11-ssh-askpass"

export PATH="$HOME/.vim/bundle/vim-live-latex-preview/bin:$PATH"

export XDG_MUSIC_DIR="~/Music/"

# get weather
weather () {
    curl -s wttr.in/$1
    return
}

export -f weather
