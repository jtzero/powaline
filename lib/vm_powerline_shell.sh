#!/bin/bash

declare local POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${POWALINE_LIB_DIR}/core.sh"

source "${POWALINE_LIB_DIR}/default_theme.sh"

coproc langsfd {
  source "${POWALINE_LIB_DIR}/lang_segments.sh"
  Power_Line="${Power_Line}${RESET_BG_SUB}${Previous_Seperator}"
  echo "${Power_Line}"
}

# Copy file descriptor banana[0] to 3
exec 3>&${langsfd[0]}

source "${POWALINE_LIB_DIR}/cwd_segments.sh"
source "${POWALINE_LIB_DIR}/git_segments.sh"

sub_procs=$(ps -A -o ppid= | grep $$ | wc -l)

number_of_sub_procs=$(expr $sub_procs - 1)

PROCS_FG=39
PROCS_BG=238

if [ "${number_of_sub_procs}" != "0" ]; then
  append $PROCS_BG $PROCS_FG $number_of_sub_procs
fi

append $TERMINATOR_BG $TERMINATOR_FG $TERMINATOR_BODY
end_color=$(fg_esc $PATH_BG)

IFS= read -d '' -u 3 langs_segment
Powaline="${langs_segment}${Power_Line}${end_color}${RESET_BG}${SEPERATOR}${RESET}"

#echo $Powaline
#PS1="${Powaline}>"
