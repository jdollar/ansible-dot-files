#!/usr/bin/env zsh

opts="--paging=never"

which batcat >/dev/null && alias cat="batcat ${opts}"
which bat >/dev/null && alias cat="bat ${opts}"
