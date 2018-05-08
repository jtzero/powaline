#!/bin/bash


if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

versions="$(asdf current)"

function parse_versions() {
  local cmd="${1}"
  local index=0;
  # TODO handle error
  while read line ; do
    local lang_name="$(echo $line| cut -d ' ' -f1)"
    local ver="$(echo $line | tr -s ' ' | cut -d ' ' -f2 | cut -d '(' -f1 )"
    declare -g lang_${lang_name}_version="${ver}"
  done <<< "$cmd"
}

parse_versions "${versions}"

RUBY_BG="1"
RUBY_FG="15"

append_sub "${RUBY_BG}" "${RUBY_FG}" "$(echo -e '\U0001F48E') ruby ${lang_ruby_version}"


NODEJS_BG="70"
NODEJS_FG="15"
#        powaline.append(version, 15, 70)
append_sub "${NODEJS_BG}" "${NODEJS_FG}" "$(echo -e '\u2B21') nodejs ${lang_nodejs_version}"

ELIXIR_BG="5"
ELIXIR_FG="15"
#        powaline.append(version, 15, 5)
append_sub "${ELIXIR_BG}" "${ELIXIR_FG}" "$(echo -e '\U0001F4A7') elixir ${lang_elixir_version}"


PYTHON_BG="35"
PYTHON_FG="00"
append_sub "${PYTHON_BG}" "${PYTHON_FG}" "$(echo -e '\U0001F40D') python ${lang_python_version}"


#echo "${Power_Line}"
#PS1="${Power_Line}${RESET}>"
