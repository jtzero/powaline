#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

function python_segment_end_seperator() {
  echo "$(fg_esc $PYTHON_SEGMENT_BG)${1}${SEPERATOR}"
}
function ruby_segment_end_seperator() {
  echo "$(fg_esc $RUBY_SEGMENT_BG)${1}${SEPERATOR}"
}
function elixir_segment_end_seperator() {
  echo "$(fg_esc $ELIXIR_SEGMENT_BG)${1}${SEPERATOR}"
}
function nodejs_segment_end_seperator() {
  echo "$(fg_esc $NODEJS_SEGMENT_BG)${1}${SEPERATOR}"
}
