#!/usr/bin/env bash

core=1

if [[ ! -v POWALINE_ROOT_DIR ]]; then
  POWALINE_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"
fi

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="${POWALINE_ROOT_DIR}/lib"
fi

if [[ ! -v POWALINE_PLUGIN_DIR ]]; then
  POWALINE_PLUGIN_DIR="${POWALINE_ROOT_DIR}/plugins"
fi

if [[ ! -v utils ]]; then
  source "${POWALINE_LIB_DIR}/utils.sh"
fi

if [[ ! -v current_theme ]]; then
  source "${POWALINE_ROOT_DIR}/plugins/current_theme.sh"
fi

function build() {
  local bg_color="${1}"
  local fg_color="${2}"
  local content="${3}"
  local seperator="${4}"
  current_segment=""
  if [ "${seperator}" = "" ]; then
    seperator="${SEPERATOR}"
  fi
  if [ "${content}" != "" ]; then
    local bg_color_esc="$(bg_esc $bg_color)"
    local fg_color_esc="$(fg_esc $fg_color)"
    current_segment="${bg_color_esc}${fg_color_esc} ${content} "
  fi
}

function append_sub() {
  local bg_color="${1}"
  local fg_color="${2}"
  local content="${3}"
  local seperator="${4}"
  if [ "${seperator}" = "" ]; then
    seperator="${SEPERATOR}"
  fi
  if [ "${content}" != "" ]; then
    local bg_color_esc="$(bg_esc_sub $bg_color)"
    local fg_color_esc="$(fg_esc_sub $fg_color)"
    local segment="${fg_color_esc} ${content} "
    Power_Line="${Power_Line}${bg_color_esc}${Previous_Seperator}${segment}"
    Previous_Seperator="$(fg_esc_sub $bg_color)${seperator}"
  fi
}
