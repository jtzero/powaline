#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

if [ -z ${NewLangs+x} ]; then
  NewLangs="$(source ""${POWALINE_LIB_DIR}/langs_segments/cmd.sh"")"
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

build "${RUBY_SEGMENT_BG}" "${RUBY_SEGMENT_FG}" "$(echo -e '\U0001F48E') ruby ${lang_ruby_version}"
printf -v RUBY_SEGMENT '%q' "${current_segment}"
echo "RUBY_SEGMENT=${RUBY_SEGMENT}"

build "${NODEJS_SEGMENT_BG}" "${NODEJS_SEGMENT_FG}" "$(echo -e '\u2B21') nodejs ${lang_nodejs_version}"
printf -v NODEJS_SEGMENT '%q' "${current_segment}"
echo "NODEJS_SEGMENT=${NODEJS_SEGMENT}"

build "${ELIXIR_SEGMENT_BG}" "${ELIXIR_SEGMENT_FG}" "$(echo -e '\U0001F4A7') elixir ${lang_elixir_version}"
printf -v ELIXIR_SEGMENT '%q' "${current_segment}"
echo "ELIXIR_SEGMENT=${ELIXIR_SEGMENT}"

build "${PYTHON_SEGMENT_BG}" "${PYTHON_SEGMENT_FG}" "$(echo -e '\U0001F40D') python ${lang_python_version}"
printf -v PYTHON_SEGMENT '%q' "${current_segment}"
echo "PYTHON_SEGMENT="${PYTHON_SEGMENT}""

