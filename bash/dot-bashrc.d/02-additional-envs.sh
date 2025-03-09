#!/bin/false
# shellcheck shell=bash

if [ -z "${ADDITIONAL_ENVS_SOURCED}" ]; then
    BASH_COMPLETION_USER_DIR="${XDG_DATA_HOME:-"${HOME}/.local/share"}/bash-completion/completions"
    ADDITIONAL_ENVS_SOURCED="true"
fi
