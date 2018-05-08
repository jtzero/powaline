#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

build $TERMINATOR_SEGMENT_BG $TERMINATOR_SEGMENT_FG "${TERMINATOR_SEGMENT_BODY}"
TERMINATOR_SEGMENT="${current_segment}"

function terminator_segment_end_seperator() {
  echo "$(fg_esc $TERMINATOR_SEGMENT_BG)${1}${SEPERATOR}"
}
