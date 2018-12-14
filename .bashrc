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

PS1="[$GREEN_COLOR\u$RESET_COLOR@$PURPLE_COLOR\h$RESET_COLOR]$BLUE_COLOR\w\$(git_color)\$(git_branch)$RESET_COLOR\n\$ "

# some more aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias lla='ls -hla --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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
alias ccfg='vim ~/.config/compton.conf'
alias calcfg='vim ~/.calcurse/conf'
alias ncfg='vim ~/.newsboat/config'
alias qcfg='vim ~/.config/qutebrowser/config.py'
alias macfg='vim ~/.config/mutt/aliases'
alias mcfg='vim ~/.config/mutt/muttrc'
alias dcfg='vim ~/.config/dunst/dunstrc'
alias fcfg='vim ~/.config/rofi/config'

alias cdp="cd ~/Programming/projects/webdev/phpframework/ && ls -a"
alias cdw="cd ~/Programming/projects/webdev/ && ls -a"
alias cdg="cd ~/Programming/projects/gamedev/ && ls -a"
alias cdm="cd ~/Programming/projects/mobiledev/ && ls -a"
alias cds="cd ~/.scripts/ && ls -a"
alias cdl="cd ~/Documents/LaTeX/ && ls -a"
alias cpa="cp $HOME/Documents/LaTeX/article.tex"
alias cpb="cp $HOME/Documents/LaTeX/beamer.tex"
alias cph="cp $HOME/Documents/LaTeX/handout.tex"

alias phps="php -S localhost:8000 -t public/ -d display_errors=1"

alias upgrade="sudo pacman -Syu"
alias downgrade="sudo pacman -U"
alias pac="sudo pacman"
alias dpac="sudo pacman -Rnsdd"
alias yrt="yaourt -Sy --noconfirm"
alias fullup="yaourt -Syu --aur --noconfirm"
alias yt="youtube-dl --add-metadata -ic"
alias yta="youtube-dl --add-metadata -xic"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias trc="transmission-remote-cli"

alias bw="wal -i $XDG_CONFIG_HOME/wallpaper.png"
 
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
