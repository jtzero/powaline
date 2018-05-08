function powaline_load() {
  if [[ ! $PROMPT_COMMAND =~ .*powaline_update_ps1.* ]]; then
    PROMPT_COMMAND="powaline_update_ps1; $PROMPT_COMMAND"
  fi
}

function powaline_update_ps1() {
  local root_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  local arg="$(source ${root_dir}/lib/index.sh)"
  #echo "${arg}"
  eval "${arg}"
}

powaline_load

#PS1=">"
#( set -o posix ; set ) | grep 'POWALINE_'
