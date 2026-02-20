#!/usr/bin/env zsh

# Reads go version from go mod and go work files
export ASDF_DATA_DIR=$HOME/.asdf
export ASDF_PLUGIN_MANAGER_PLUGIN_VERSIONS_FILENAME=~/.plugin-versions
export PATH=$ASDF_DATA_DIR/bin:$PATH
export PATH=$ASDF_DATA_DIR/shims:$PATH
export PATH=$HOME/.local/bin:$PATH

# Java
java_plugin_set_script="${ASDF_DATA_DIR}"/plugins/java/set-java-home.zsh
if [[ -n "${java_plugin_set_script}" ]]; then
  source "${java_plugin_set_script}"
fi

# Go
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
go_plugin_set_script="${ASDF_DATA_DIR}"/plugins/golang/set-env.zsh
if [[ -n "${go_plugin_set_script}" ]]; then
  source "${go_plugin_set_script}"
fi
