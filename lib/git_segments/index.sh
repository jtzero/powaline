#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

# TODO add additional cmd file for diff checking
diff1="$(git diff --no-ext-diff --quiet --exit-code > /dev/null 2>&1; echo $?)"
diff2="$(git diff-index --cached --quiet HEAD -- > /dev/null 2>&1; echo $?)"
NewGitChangedFlag="${diff1}${diff2}$(git ls-files --others --exclude-standard --error-unmatch -- '*' >/dev/null 2>/dev/null; echo $?)"
if [ -z ${POWALINE_GIT_SEGMENTS_CHANGED_FLAG+x} ] || [ "${POWALINE_GIT_SEGMENTS_CHANGED_FLAG}" != "${NewGitChangedFlag}" ]; then
  NewGitStatus="$(source ""${POWALINE_LIB_DIR}/git_segments/cmd.sh"")"
  if [ "${POWALINE_GIT_STATUS_MEMO}" != "${NewGitStatus}" ] || [ -z ${POWALINE_GIT_STATUS_MEMO+x} ]; then
    POWALINE_GIT_STATUS_MEMO="${NewGitStatus}"
    source "${POWALINE_LIB_DIR}/git_segments/git_segments.sh"
    echo "
  POWALINE_GIT_SEGMENTS_CHANGED_FLAG=""${NewGitChangedFlag}""
  POWALINE_GIT_STATUS_MEMO_UPDATED='1'
  read -d '' POWALINE_GIT_STATUS_MEMO <<'EOF'
  ""${POWALINE_GIT_STATUS_MEMO}""
  EOF
  "
  fi
  unset NewGitStatus
fi
unset NewGitChangedMemo
unset diff1
unset diff2
