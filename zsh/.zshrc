#!/bin/zsh
bindkey -e
bindkey "\e[3~" delete-char

PROMPT='[%F{cyan}%n@%m%f %F{magenta}%1~%f]%# '

# Determine if on Mac or Linux
if [[ $(uname) == "Darwin" ]]; then
  # Load bash_completion (brew install bash_completion)
  if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
      . $(brew --prefix)/etc/bash_completion
  fi

  # Load grc from brew, if it exists (brew install grc)
  if [[ -f $(brew --prefix)/etc/grc.bash ]]; then
        . $(brew --prefix)/etc/grc.bash
  fi

  # Add tab completion for `defaults`
  #complete -W "NSGlobalDomain" defaults;
	
elif [[ $(uname) == "Linux" ]]; then
	# Linux
fi

zstyle ':completion:*' menu select

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

setopt interactivecomments

# PATH
export PATH="$HOME/.local/bin:$HOME/work-src/vdevtools/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-2.el8_6.x86_64/jre
export GROOVY_HOME=/opt/groovy-4.0.0
export PATH=$GROOVY_HOME/bin:$PATH

# vimlife
alias vi="vim"

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=10000
HISTSIZE=5000
setopt EXTENDED_HISTORY 
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Color `ls`
if [[ $(uname) == "Darwin" ]]; then
  alias ls="ls -G"
  export LSCOLORS=ExFxCxDxBxegedabagacad
else
  alias ls="ls --color=always"
  export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
fi

export LESS_TERMCAP_md=$(tput bold; tput setaf 3); # Highlight section titles in man pages
export MANPAGER="less -X"; # Don't clear the screen after quitting `man`
