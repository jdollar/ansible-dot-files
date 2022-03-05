#!/usr/bin/env zsh

#tmux
if which tmux > /dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi

