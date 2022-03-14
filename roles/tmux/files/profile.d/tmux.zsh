#!/usr/bin/env zsh

#tmux
if which tmux > /dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach -t default || tmux new-session -s default)
fi

