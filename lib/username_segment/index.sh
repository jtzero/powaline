#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

build_username_segment() {
  username="$(source ""${POWALINE_LIB_DIR}/username_segment/cmd.sh"")"
  if [ "$username" = "root" ]; then
    build $USERNAME_ROOT_SEGMENT_BG $USERNAME_ROOT_SEGMENT_FG "${username}"
    USERNAME_SEGMENT_BG="${USERNAME_ROOT_SEGMENT_BG}"
  else
    build $USERNAME_NON_ROOT_SEGMENT_BG $USERNAME_NON_ROOT_SEGMENT_FG "${username}"
    USERNAME_SEGMENT_BG="${USERNAME_NON_ROOT_SEGMENT_BG}"
  fi
  USERNAME_SEGMENT="${current_segment}"
}

build_username_segment
