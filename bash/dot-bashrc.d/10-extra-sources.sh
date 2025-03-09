#!/bin/false
# shellcheck shell=bash

if [ -z "${CARGO_ENV_SOURCED}" ]; then
    source "${HOME}/.cargo/env"
    CARGO_ENV_SOURCED="true"
fi
