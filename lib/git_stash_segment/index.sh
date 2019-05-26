#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

build_git_stash_segment() {
  local tmp=$(git stash list | wc -l | tr -s " ")
  build $GIT_STASH_SEGMENT_BG $GIT_STASH_SEGMENT_FG $tmp
  GIT_STASH_SEGMENT="${current_segment} "
}

git_stash_segment_end_seperator() {
  echo "$(fg_esc $GIT_STASH_SEGMENT_BG)${1}${SEPERATOR}"
}

build_git_stash_segment
