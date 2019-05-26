#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

build "${CWD_HOSTNAME_SEGMENT_BG}" "${CWD_HOSTNAME_SEGMENT_FG}" '\h'
printf -v CWD_HOSTNAME_SEGMENT '%q' "${current_segment}"
printf '%q' "CWD_HOSTNAME_SEGMENT=${CWD_HOSTNAME_SEGMENT}"
printf '\n'

setup_home_and_path() {
  local path_seperator_fg_esc="$(fg_esc $CWD_PATH_SEPERATOR_FG)"
  local path_fg_color_esc="$(fg_esc $CWD_PATH_SEGMENT_FG)"
  local tmp_path_body=""

  if [[ "$PWD" == $HOME* ]]; then
    HomeBody="~"
    tmp_path_body=$(echo "${PWD/#$HOME/}" | cut -d"/" -f2-)
    PathBody="${tmp_path_body//\// $path_seperator_fg_esc$CWD_PATH_SEPERATOR$path_fg_color_esc }"
  else
    HomeBody=""
    tmp_path_body="${PWD/#\//}"
    if [ "${tmp_path_body}" = "" ]; then
      PathBody="/"
    else
      PathBody="${tmp_path_body//\// $path_seperator_fg_esc$CWD_PATH_SEPERATOR$path_fg_color_esc }"
    fi
  fi
}

setup_home_and_path
build "${CWD_HOME_SEGMENT_BG}" "${CWD_HOME_SEGMENT_FG}" "${HomeBody}"
printf -v CWD_HOME_SEGMENT '%q' "${current_segment}"
printf '%q' "CWD_HOME_SEGMENT=${CWD_HOME_SEGMENT}"
echo ''

build "${CWD_PATH_SEGMENT_BG}" "${CWD_PATH_SEGMENT_FG}" "${PathBody}"
printf -v CWD_PATH_SEGMENT '%q' "${current_segment}"
printf '%q' "CWD_PATH_SEGMENT=${CWD_PATH_SEGMENT}"
echo ''

if [ ! -w "$(pwd)" ]; then
  build "${CWD_READ_ONLY_SEGMENT_BG}" "${CWD_READ_ONLY_SEGMENT_FG}" "${LOCK}"
  printf -v CWD_READ_ONLY_SEGMENT '%q' "${current_segment}"
fi
printf '%q' "CWD_READ_ONLY_SEGMENT=${CWD_READ_ONLY_SEGMENT}"
echo ''
