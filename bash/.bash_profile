#!/bin/bash

[ -z "$PS1" ] && return

# If `id` returns zero, you’re root. Be red.
if [ $(id -u) -eq 0 ];then
	# you are root, set red color prompt
	export PS1="\[\033[1;31m\][\u@\h \W]\\$ \[\033[0m\]"
else # normal
	export PS1="\[\033[1;33m\][\u@\h \W]\\$ \[\033[0m\]"
fi

if [ $(uname) == "Darwin" ]; then
# Color `ls`
  alias ls="ls -G"
  export LSCOLORS=ExFxCxDxBxegedabagacad
else
# Color `ls`
  alias ls="ls --color=always"
  export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
fi


# determine if on mac or linux
if [ $(uname) == "Darwin" ]; then

  # Add tab completion for `defaults`
  complete -W "NSGlobalDomain" defaults;

fi

# Update PATH
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/bin/vdevtools/bin:$PATH"

alias vi="vim"

# History
export HISTSIZE=10000; # 10,000 lines of history is MORE than enough
export HISTFILESIZE=$HISTSIZE;
export HISTIGNORE="ls:exit:date:history:* --help:* -h"; # ignore unhelpful for time travelling.
export LESS_TERMCAP_md=$(tput bold; tput setaf 3); # Highlight section titles in man pages
export MANPAGER="less -X"; # Don't clear the screen after quitting `man`
export EDITOR="vim"

# Color the shell
export TERM=screen-256color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
