#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
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
	#PS1='[\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;35m\]\h\[\033[00m\]]\[\033[01;34m\]\w\[$(git_color)\]\[$(git_branch)\]\[\033[00m\]\n\$ '
    PS1="[$GREEN_COLOR\u$RESET_COLOR@$PURPLE_COLOR\h$RESET_COLOR]$BLUE_COLOR\w\$(git_color)\$(git_branch)$RESET_COLOR\n\$ "
else
    PS1='[\u@\h:\w]$(git_branch)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
alias ncfg='vim ~/.newsboat/urls'
alias qcfg='vim ~/.config/qutebrowser/autoconfig.yml'
alias macfg='vim ~/.config/mutt/aliases'
alias mcfg='vim ~/.config/mutt/muttrc'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export PATH="$HOME/.config/composer/vendor/bin:$PATH"

export PATH="$HOME/.vim/bundle/vim-live-latex-preview/bin:$PATH"

# function to ssh easily
sshin () {
  ssh 192.168.1."$1"
  return
}

export -f sshin

# function to ssh with X argument
sshinx () {
  ssh -X 192.168.1."$1"
  return
}

export -f sshinx

# function to update/upgrade system fast
upgrade () {
  sudo pacman -Syu
  echo -e $GREEN_COLOR "** Your system is up to date **" $RESET_COLOR
  return
}

export -f upgrade

# function to install packages
pac () {
	sudo pacman -S $*
	return
}

export -f pac

# function to install packages with update
upac () {
	sudo pacman -Sy $*
	return
}

export -f upac

# function to delete packages without dependencies
dpac () {
	sudo pacman -Rnsdd $*
	return
}

export -f dpac

#function to install via yaourt
yrt () {
	yaourt -Sy --noconfirm $*
	return
}
export yrt

#PS1='[\u@\h \W]\$ '
