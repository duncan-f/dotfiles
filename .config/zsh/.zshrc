# The following lines were added by compinstall
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%{$fg[yellow]%}[%{$fg[green]%}%B%n%b%{$reset_color%}@%{$fg[red]%}%B%m %{$fg[blue]%}%c%b%{$fg[yellow]%}]%{$reset_color%}%B%(#.#.$)%b ${vcs_info_msg_0_}"
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':vcs_info:*' actionformats ' %F{3}[%F{7}%b%F{6}|%F{1}%a%F{3}]%f '
zstyle ':vcs_info:*' formats ' %F{3}[%F{7}%b%F{3}]%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE="$HOME/.cache/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

setopt PROMPT_SUBST
#PROMPT='%{$fg[green]%}%B%n%b@%{$fg[red]%}%B%m %{$fg[blue]%}%c%b %{$reset_color%}%(#.#.$) '
RPROMPT=\$vcs_info_msg_0_

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Fix backspace bug when switching modes
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7d7d7d"

[ -f "$HOME/.config/shortcutsrc" ] && source "$HOME/.config/shortcutsrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
