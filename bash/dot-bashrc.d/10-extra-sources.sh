#!/bin/false
# shellcheck shell=bash

if [ -z "${GIT_COMPLETION_SOURCED}" ]; then
   source /usr/share/bash-completion/completions/git
   GIT_COMPLETION_SOURCED="true"
fi

if [ -z "${CARGO_ENV_SOURCED}" ]; then
    source "${HOME}/.cargo/env"
    CARGO_ENV_SOURCED="true"
fi
