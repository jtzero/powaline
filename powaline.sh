#!/usr/bin/env bash

powaline() {
  if [ "${1}" = "load" ]; then
    if [[ ! $PROMPT_COMMAND =~ .*powaline_update_ps1.* ]]; then
      PROMPT_COMMAND="powaline_update_ps1; $PROMPT_COMMAND"
    fi
  elif [ "${1}" = "update_ps1" ]; then
    powaline_update_ps1
  # TODO else help
  fi
}

# TODO remove
powaline_update_ps1() {
  local root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local arg="$(source ${root_dir}/lib/index.sh)"
  #echo "${arg}"
  eval "${arg}"
}

powaline "load"

#PS1=">"
