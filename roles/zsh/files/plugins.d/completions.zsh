#!/usr/bin/env zsh

zinit light zsh-users/zsh-completions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
