#!/usr/bin/env zsh

# Reads go version from go mod and go work files
export ASDF_DATA_DIR=$HOME/.asdf
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export PATH=$ASDF_DATA_DIR/shims:$PATH
