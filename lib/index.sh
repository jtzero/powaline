#!/usr/bin/env bash

declare local POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${POWALINE_LIB_DIR}/core.sh"

source "${POWALINE_PLUGIN_DIR}/current_theme.sh"

Output=""
PreviousSeperator=""
Powaline=""
LastVisibleSegment=""

assemble() {
  build_segments
  for segment_name in "${config[@]}";
  do
    local upcase_segment_name="${segment_name^^}"
    local value="${!upcase_segment_name}"
    append_output_variables "${upcase_segment_name}" "POWALINE_"
  done
  get_previous_seperator "END"
  local end=""
  printf -v end '%q' "${RESET}"
  Output="${Output}
PS1="${Powaline}${PreviousSeperator}${end}"
"
}

build_segments() {
  local i=0;
  local fds=();
  local pids=()
  for generator_name in "${GENERATORS[@]}"; do
    local multi_name="${generator_name}_MULTI"
    local generator_path_name="${generator_name}_PATH"
    local generator_path="${!generator_path_name}"
    if [ "${!multi_name}" = "1" ]; then
      local tmpfd=''
      exec {tmpfd}< <(source "${generator_path}/index.sh" 2>&1 )
      local pid=$!
      fds[$pid]=$tmpfd
      pids[$i]=$pid
      if [ -f "${generator_path}/end_seperator.sh" ]; then
        source "${generator_path}/end_seperator.sh"
      fi
      ((i++))
    else
      source "${generator_path}/index.sh"
      declare -g "${generator_name}"="${!generator_name}"
      if [ -f "${generator_path}/end_seperator.sh" ]; then
        source "${generator_path}/end_seperator.sh"
      fi
    fi
  done
  local outloop=$'
'
  while [ ${#fds[@]} -ne 0 ]
  do
    local j=0;
    for pid in "${pids[@]}";
    do
      if ! kill -0  "${pid}" 2> /dev/null ; then
        # exited
        local fd="${fds[$pid]}"
        printf -v multi_value '\n'
        until [ $fd_read ]
        do
          read <&$fd line
          if [ $? != 0 ]; then
            fd_read=1
            continue
          fi
          multi_value+="${line}
"
        done
        unset fd_read
        eval "${multi_value}"
        unset pids[$j]
        unset fds[$pid]
      elif [ ${#pids[@]} -eq 1 ]; then
        local fd="${fds[$pid]}"
        while kill -0  "${pid}" 2> /dev/null
        do
          read -d '' line <&$fd
          outloop+="${line}
"
        done
        eval "${outloop}"
        unset pids[$j]
        unset fds[$pid]
      fi
      ((j++))
    done
    pids=("${pids[@]}")
  done
}

add_memo_to_output() {
  local memo_name="${1}"
  local memo_name_added="${memo_name}_ADDED"
  if [ "${!memo_name_added}" != "1" ]; then
    add_variable_as_heredoc_to_output "${memo_name}" "${!memo_name}"
    declare -g "${memo_name_added}"=1
  fi
}

append_output_variables() {
  local upcase_segment_name="${1}"
  local upcase_segment_name_prefix="${2}"
  local upcase_segment_name_w_prefix="${upcase_segment_name_prefix}${upcase_segment_name}"
  local value=""
  local memo_name_holder="${upcase_segment_name}_MEMO_NAME"
  local memo_name="${!memo_name_holder}"
  local flag_name_holder="${upcase_segment_name}_FLAG_NAME"
  local flag_name="${!flag_name_holder}"
  local has_memo=0
  if [ "${flag_name}" != '' ] && [ -n "${!flag_name+x}" ]; then
    add_memo_to_output "${flag_name}"
  fi
  if [ "${memo_name}" != '' ] && [ -n "${!memo_name+x}" ]; then
    has_memo='1'
    add_memo_to_output "${memo_name}"
    local memo_updated_name="${memo_name}_UPDATED"
    # was it updated since it was added to output?
    if [ "${!memo_updated_name}" = "1" ]; then
      value="${!upcase_segment_name}"
      if [ "${value}" = "" -o "${value}" = "''" ]; then
        if [ -n "${!upcase_segment_name_w_prefix+x}" ]; then
          Output="${Output}
unset ${upcase_segment_name_w_prefix}
"
        fi
      fi

    else
      value="${!upcase_segment_name_w_prefix}"
    fi
  else
    value="${!upcase_segment_name}"
  fi
  if [ "${value}" != "" -a "${value}" != "''" ]; then
    get_previous_seperator "${upcase_segment_name}"
    local escaped_value=''
    printf -v escaped_value '%q' "${value}"
    # no memo? don't bother adding it to output
    if [ "${has_memo}" = '1' ]; then
      add_variable_to_output "${upcase_segment_name_w_prefix}" "${escaped_value}"
    fi
    Powaline="${Powaline}${PreviousSeperator}${escaped_value}"
    set_last_visible_segment "${upcase_segment_name}"
  fi
}

get_previous_seperator() {
  PreviousSeperator=""
  local current_upcase_segment_name="${1}"
  if [ "${LastVisibleSegment}" != "" ]; then
    local last_visible_segment_path="${LastVisibleSegment}_PATH"
    local function_name="${LastVisibleSegment,,}_end_seperator"
    if [ "$(type -t $function_name)" != "function" ]; then
      #TODO STDERR
      echo "'$function_name' is not defined"
    fi
    local bg_var_name="${current_upcase_segment_name}_BG"
    local bg_var_value="${!bg_var_name}"
    if [[ "${bg_var_value}" = "" ]]; then
      # check for a memo variable
      bg_var_name="POWALINE_${bg_var_name}_MEMO"
      bg_var_value="${!bg_var_name}"
    fi
    if [[ "${bg_var_value}" =~ ^[0-9]+$ ]]; then
      local bg_escaped="$(bg_esc ""${bg_var_value}"")"
    else
      local bg_escaped="${bg_var_value}"
    fi
    local previous_seperator_unescaped="$($function_name """${bg_escaped}""")"
    printf -v PreviousSeperator '%q' "${previous_seperator_unescaped}"
  fi
}

set_last_visible_segment() {
  local segment_name="${1}"
  if [ "${segment_name}" = "NEWLINE_SEGMENT" ]; then
    LastVisibleSegment=""
  else
    LastVisibleSegment="${segment_name}"
  fi
}

add_variable_as_heredoc_to_output() {
  local name="${1}"
  local value="${2}"
  Output="${Output}
read -d '' ${name} <<'EOF'
""${value}""
EOF
"
}

add_variable_to_output() {
  local name="${1}"
  local value="${2}"
  Output="${Output}
${name}=""${value}""
"
}

add_comment() {
  Output="${Output}
#${1}
"
}

assemble

echo "${Output}"
