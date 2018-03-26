#!/bin/bash
# https://medium.freecodecamp.org/tmux-in-practice-integration-with-system-clipboard-bcd72c62ff7b
set -eu

# get data either from stdin of from file
buf=$(cat "$@")

# get buffer length
buflen=$( printf %s "$buf" | wc -c )

maxlen=74994

# warn if selection exceeds $maxlen
if [ "$buflen" -gt "$maxlen" ]; then
  printf "Input is %d bytes too long" "$(( buflen - maxlen ))" >&2
fi

# build OSC 52 ANSI escapse sequence
esc="\033]52;c;$( printf %s "$buf" | head -c $maxlen | base64 | tr -d '\r\n' )\a"
esc="\033Ptmux;\033$esc\033\\"

pane_active_tty=$(tmux list-panes -F "#{pane_active} #{pane_tty}" | awk '$1=="1" { print $2 }')

printf "$esc" > "$pane_active_tty"

# resolve target terminal to send escape sequence
# if we are on remote machine, send directly to SSH_TTY to transport escape sequence
# to terminal on local machine, so data lands in clipboard on our local machine
pane_active_tty=$(tmux list-panes -F "#{pane_active} #{pane_tty}" | awk '$1=="1" { print $2 }')
target_tty="${SSH_TTY:-$pane_active_tty}"

printf "$esc" > "$target_tty"
