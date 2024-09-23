#!/bin/false
# shellcheck shell=bash

# $1: the path to add if it is not already present
include_in_path() {
    if ! echo "${PATH}" | grep "${1}" >/dev/null ; then
        export "PATH=${1}:${PATH}"
    fi
}

