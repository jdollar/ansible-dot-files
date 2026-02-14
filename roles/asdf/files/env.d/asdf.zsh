#!/usr/bin/env zsh

# Reads go version from go mod and go work files
export ASDF_DATA_DIR=$HOME/.asdf
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export ASDF_PLUGIN_MANAGER_PLUGIN_VERSIONS_FILENAME=~/.plugin-versions
export PATH=$ASDF_DATA_DIR/bin:$PATH
export PATH=$ASDF_DATA_DIR/shims:$PATH
export PATH=~/.local/bin:$PATH
source ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
#source ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/java/set-java-home.zsh
