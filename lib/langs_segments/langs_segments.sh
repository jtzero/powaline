#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

if [ -z ${NewLangs+x} ]; then
  #TODO handle error
  # its coming through on stderr?
  NewLangs="$(source ""${POWALINE_LIB_DIR}/langs_segments/cmd.sh"" 2>&1)"
fi

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

parse_versions "${NewLangs}"

build "${RUBY_SEGMENT_BG}" "${RUBY_SEGMENT_FG}" "${RUBY_SEGMENT_SYMBOL} ruby ${lang_ruby_version}"
printf -v RUBY_SEGMENT '%q' "${current_segment}"
printf '%q' "RUBY_SEGMENT=${RUBY_SEGMENT}"
echo ''

build "${NODEJS_SEGMENT_BG}" "${NODEJS_SEGMENT_FG}" "${NODEJS_SEGMENT_SYMBOL} nodejs ${lang_nodejs_version}"
printf -v NODEJS_SEGMENT '%q' "${current_segment}"
printf '%q' "NODEJS_SEGMENT=${NODEJS_SEGMENT}"
echo ''

build "${ELIXIR_SEGMENT_BG}" "${ELIXIR_SEGMENT_FG}" "${ELIXIR_SEGMENT_SYMBOL} elixir ${lang_elixir_version}"
printf -v ELIXIR_SEGMENT '%q' "${current_segment}"
printf '%q' "ELIXIR_SEGMENT=${ELIXIR_SEGMENT}"
echo ''

build "${PYTHON_SEGMENT_BG}" "${PYTHON_SEGMENT_FG}" "${PYTHON_SEGMENT_SYMBOL} python ${lang_python_version}"
printf -v PYTHON_SEGMENT '%q' "${current_segment}"
printf '%q' "PYTHON_SEGMENT=${PYTHON_SEGMENT}"
echo ''

