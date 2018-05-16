#!/usr/bin/env bash
shopt -s extglob

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

if [ -z ${NewGitStatus+x} ]; then
  NewGitStatus="$(source ""${POWALINE_LIB_DIR}/git_segments/cmd.sh"")"
fi

function clear_ifs() {
  if [ "$IFS" != '' ]; then
    OLDIFS=$IFS
    IFS=''
  fi
}

function reset_ifs() {
  IFS=$OLDIFS
}

function dirty_status {
  clear_ifs
  modified=0
  staged=0
  deleted=0
  untracked=0
  newfile=0
  copied=0
  renamed=0
  conflicted=0
  they_added=0
  detached=0
  branch_info=""
  branch_name=""
  while read line ; do
      case "${line}" in
        '##'*)                    branch_info=$line ; ;;
        @('UA'|'AU'|'AA')*)       ((they_added++)) ; ((conflicted++)) ; ;;
        @('DU'|'DD'|'UD')*)       ((deleted++)) ; ((conflicted++)) ; ;;
        'UU'*)                    ((modified++)); ((conflicted++)) ; ;;
        'MM'*)                    ((modified++)); ((staged++)) ; ;;
        '??'*)                    ((untracked++)) ; ;;
        ' M'*)                    ((modified++)) ; ;;
        ' D'*)                    ((deleted++)) ; ;;
        ' C'*)                    ((copied++)) ; ;;
        ' R'*)                    ((renamed++)) ; ;;
        @('M'|'A'|'D'|'R'|'C')*)  ((staged++)) ; ;;
      esac
  done <<< "${NewGitStatus}"
  reset_ifs
  # for now
  modified=$(expr $modified + $deleted)

  # TODO switch to --porcelain=2
  local status="$(git status 2> /dev/null)"
  local status_first_line="${status%%$'\n'*}"
  if [[ "${status_first_line}" = *detached* ]]; then
    detached=1
    branch_name="${status_first_line##* }"
  else
    if [[ "${branch_info}" = *"No commits yet"* ]]; then
      branch_name="Big Bang"
    else
      branch_name=$(echo $branch_info | cut -d ' ' -f2 | cut -d'.' -f1)
    fi
  fi
  behind="$(echo ""${branch_info}"" | grep -o -e 'behind\s[[:digit:]]*' | cut -d' ' -f2)"
  ahead="$(echo ""${branch_info}"" | grep -o -e 'ahead\s[[:digit:]]*' | cut -d' ' -f2)"
}

function build_branch() {
  local branch_name=$1
  local status="${2}${3}${4}"
  local detached="${5}"
  local bg_color_esc="$(bg_esc $GIT_BRANCH_SEGMENT_CLEAN_BG)"
  local fg_color_esc="$(fg_esc $GIT_BRANCH_SEGMENT_CLEAN_FG)"
  local detached_content=""
  current_segment=""
  if [ "${detached}" != "0" ]; then
    detached_content="${GIT_DETACHED_SEGMENT_SYMBOL} "
  fi
  if [ ! "${branch_name}" = "" ]; then
    if [ "${status}" != "000" ]; then
      bg_color_esc="$(bg_esc $GIT_BRANCH_SEGMENT_DIRTY_BG)"
      fg_color_esc="$(fg_esc $GIT_BRANCH_SEGMENT_DIRTY_FG)"
      GIT_BRANCH_SEGMENT_BG="${GIT_BRANCH_SEGMENT_DIRTY_BG}"
      POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO="${GIT_BRANCH_SEGMENT_BG}"
    else
      GIT_BRANCH_SEGMENT_BG="${GIT_BRANCH_SEGMENT_CLEAN_BG}"
      POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO="${GIT_BRANCH_SEGMENT_BG}"
    fi
    current_segment="${bg_color_esc}${fg_color_esc} ${detached_content}${branch_name} "
  fi
}

function build_git_segment() {
  local segment_name="git_${1}_segment"
  local count="${2}"
  local upcase_segment_name="${segment_name^^}"
  local bg="${upcase_segment_name}_BG"
  local fg="${upcase_segment_name}_FG"
  local sym="${upcase_segment_name}_SYMBOL"
  current_segment=""
  if [ "${count}" != "0" -a "${count}" != "" ]; then
    if [ "${count}" = "1" ]; then
      build "${!bg}" "${!fg}" "${!sym}"
    else
      build "${!bg}" "${!fg}" "${count}${!sym}"
    fi
  fi
}


dirty_status
build_branch "${branch_name}" "${modified}" "${untracked}" "${deleted}" "${detached}"
printf -v GIT_BRANCH_SEGMENT '%q' "${current_segment}"
echo "GIT_BRANCH_SEGMENT=${GIT_BRANCH_SEGMENT}"
echo "GIT_BRANCH_SEGMENT_BG=${GIT_BRANCH_SEGMENT_BG}"
echo "POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO=${POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO}"
echo "POWALINE_GIT_BRANCH_SEGMENT_BG_MEMO_UPDATED='1'"

build_git_segment 'behind' $behind
printf -v GIT_BEHIND_SEGMENT '%q' "${current_segment}"
echo "GIT_BEHIND_SEGMENT=${GIT_BEHIND_SEGMENT}"

build_git_segment 'ahead' $ahead
printf -v GIT_AHEAD_SEGMENT '%q' "${current_segment}"
echo "GIT_AHEAD_SEGMENT=${GIT_AHEAD_SEGMENT}"

build_git_segment 'conflicted' $conflicted
printf -v GIT_CONFLICTED_SEGMENT '%q' "${current_segment}"
echo "GIT_CONFLICTED_SEGMENT=${GIT_CONFLICTED_SEGMENT}"

build_git_segment 'staged' $staged
printf -v GIT_STAGED_SEGMENT '%q' "${current_segment}"
echo "GIT_STAGED_SEGMENT=${GIT_STAGED_SEGMENT}"

build_git_segment 'modified' $modified
printf -v GIT_MODIFIED_SEGMENT '%q' "${current_segment}"
echo "GIT_MODIFIED_SEGMENT=${GIT_MODIFIED_SEGMENT}"

build_git_segment 'untracked' $untracked
printf -v GIT_UNTRACKED_SEGMENT '%q' "${current_segment}"
echo "GIT_UNTRACKED_SEGMENT=${GIT_UNTRACKED_SEGMENT}"
