#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

function build_time_segment() {
  TIME_SEGMENT="$(date +%T) "
}

function time_segment_end_seperator() {
  echo "$(fg_esc $TIME_SEGMENT_BG)${1}${SEPERATOR}"
}

build_time_segment
