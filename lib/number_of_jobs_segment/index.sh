#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

function build_number_of_jobs_segment() {
  # -d doesn't work mac
  local sub_procs="$(ps -A -o ppid= | tr -d '[[:blank:]]' | grep "^$$" | grep . -c )"

  local number_of_sub_procs=$(expr $sub_procs - 1)

  if [ "${number_of_sub_procs}" != "0" ]; then
    build $NUMBER_OF_JOBS_SEGMENT_BG $NUMBER_OF_JOBS_SEGMENT_FG $number_of_sub_procs
    NUMBER_OF_JOBS_SEGMENT="${current_segment}"
  fi
  NUMBER_OF_JOBS_SEGMENT="${current_segment}"
}

function number_of_jobs_segment_end_seperator() {
  echo "$(fg_esc $NUMBER_OF_JOBS_SEGMENT_BG)${1}${SEPERATOR}"
}

build_number_of_jobs_segment
