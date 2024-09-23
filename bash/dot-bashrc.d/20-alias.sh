#!/bin/false
# shellcheck shell=bash

alias gits='git status'
alias ga='git add'
__git_complete ga git_add
alias gc='gb commit --no-breaking -m""'
alias gl='gb tree | less'
alias print_path='echo $PATH | tr ":" "\n"'
