#!/bin/false
# shellcheck shell=bash
USER_COLOR="\[$(tput setaf 2 bold)\]"
PWD_COLOR="\[$(tput setaf 6)\]"
GIT_COLOR="\[$(tput setaf 3)\]"
EXIT_STATUS_COLOR="\[$(tput setaf 1)\]"
PROMPT_SYMBOL_COLOR="\[$(tput setaf 15)\]"

RESET="\[$(tput sgr0)\]"

PROMPT_DIRTRIM=3

function simple_parse_git_branch {
  if git rev-parse --git-dir > /dev/null 2>&1 ; then
    NUM_OF_BRANCHES=$(git branch | wc -l)
    if [ "$NUM_OF_BRANCHES" -eq 0 ]; then
      CURRENT_BRANCH_NAME="$(git config init.defaultBranch)"
    else
      CURRENT_BRANCH_NAME="$(git branch | grep -F '*' | cut -d ' ' -f2-)"
    fi
    echo "[ ${CURRENT_BRANCH_NAME} ] "
  else
    echo ""
  fi
  return
}

function __prompt_command {
  local EXIT_STATUS="$?"
  PS1="${USER_COLOR}\u${RESET} ${PWD_COLOR}\w${RESET} ${GIT_COLOR}\$(simple_parse_git_branch)${RESET}${EXIT_STATUS_COLOR}($EXIT_STATUS)${RESET} ${PROMPT_SYMBOL_COLOR}:>${RESET} "
  if [ "$(command -v __vte_osc7)" ]; then
    __vte_osc7
  fi
}

PROMPT_COMMAND=__prompt_command
