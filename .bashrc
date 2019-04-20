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
        echo -e $PURPLE_COLOR
    fi
}

function git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="[$GREEN_COLOR\u$RESET_COLOR@$RED_COLOR\h$RESET_COLOR] $BLUE_COLOR\w\$(git_color)\$(git_branch)$RESET_COLOR\n\$ "

[ -f "$HOME/.bash_shortcuts" ] && source "$HOME/.bash_shortcuts"
[ -f "$HOME/.bash_aliases" ] && source "$HOME/.bash_aliases"

# ruby location
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
