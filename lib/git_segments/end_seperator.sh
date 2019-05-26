#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

git_branch_segment_end_seperator() {
  echo "$(fg_esc $POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO)${1}${SEPERATOR}"
}
git_behind_segment_end_seperator() {
  echo "$(fg_esc $GIT_BEHIND_SEGMENT_BG)${1}${SEPERATOR}"
}
git_ahead_segment_end_seperator() {
  echo "$(fg_esc $GIT_AHEAD_SEGMENT_BG)${1}${SEPERATOR}"
}
git_conflicted_segment_end_seperator() {
  echo "$(fg_esc $GIT_CONFLICTED_SEGMENT_BG)${1}${SEPERATOR}"
}
git_staged_segment_end_seperator() {
  echo "$(fg_esc $GIT_STAGED_SEGMENT_BG)${1}${SEPERATOR}"
}
git_modified_segment_end_seperator() {
  echo "$(fg_esc $GIT_MODIFIED_SEGMENT_BG)${1}${SEPERATOR}"
}
git_untracked_segment_end_seperator() {
  echo "$(fg_esc $GIT_UNTRACKED_SEGMENT_BG)${1}${SEPERATOR}"
}
