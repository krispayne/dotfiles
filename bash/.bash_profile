#!/bin/bash

[ -z "$PS1" ] && return

# If `id` returns zero, you’re root. Be red.
if [ $(id -u) -eq 0 ];then
	# you are root, set red color prompt
	export PS1="\[\033[1;31m\][\u@\h \W]\\$ \[\033[0m\]"
else # normal
	export PS1="\[\033[1;33m\][\u@\h \W]\\$ \[\033[0m\]"
fi

# determine if on mac or linux
if [ $(uname) == "Darwin" ]; then

  # Load bash_completion (brew install bash_completion)
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi

  # Load grc from brew, if it exists (brew install grc)
  if [ -f $(brew --prefix)/etc/grc.bash ]; then
        . $(brew --prefix)/etc/grc.bash
  fi

  # Add tab completion for `defaults`
  complete -W "NSGlobalDomain" defaults;

fi

# Tab complete known_hosts
complete -W "$(echo `cat ${HOME}/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# vimlife
alias vi="vim"

# History
export HISTSIZE=10000; # 10,000 lines of history is MORE than enough
export HISTFILESIZE=$HISTSIZE;
export HISTIGNORE="ls:exit:date:history:* --help:* -h"; # ignore unhelpful for time travelling.

# Color the shell
export TERM=screen-256color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
# Color `ls`
if [ $(uname) == "Darwin" ]; then
  alias ls="ls -G"
  export LSCOLORS=ExFxCxDxBxegedabagacad
else
  alias ls="ls --color=always"
  export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
fi

export LESS_TERMCAP_md=$(tput bold; tput setaf 3); # Highlight section titles in man pages

export MANPAGER="less -X"; # Don't clear the screen after quitting `man`

# Language
# this may not be portable in my work environment! Commented by default.
# Prefer US English and use UTF-8
#export LANG="en_US.UTF-8"
#export LC_ALL="en_US.UTF-8"

export EDITOR="vim"

# Add `~/bin` to `$PATH`
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin/vdevtools/bin:$PATH"
