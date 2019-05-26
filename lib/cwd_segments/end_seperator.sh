#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

cwd_hostname_segment_end_seperator() {
  echo "$(fg_esc $CWD_HOSTNAME_SEGMENT_BG)${1}${SEPERATOR}"
}
cwd_home_segment_end_seperator() {
  echo "$(fg_esc $CWD_HOME_SEGMENT_BG)${1}${SEPERATOR}"
}
cwd_path_segment_end_seperator() {
  echo "$(fg_esc $CWD_PATH_SEGMENT_BG)${1}${SEPERATOR}"
}
cwd_read_only_segment_end_seperator() {
  echo "$(fg_esc $CWD_READ_ONLY_SEGMENT_BG)${1}${SEPERATOR}"
}

