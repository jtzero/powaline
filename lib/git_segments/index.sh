#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

NewGitStatus="$(source ""${POWALINE_LIB_DIR}/git_segments/cmd.sh"")"
if [ "${POWALINE_GIT_STATUS_MEMO}" != "${NewGitStatus}" ] || [ -z ${POWALINE_GIT_STATUS_MEMO+x} ]; then
  POWALINE_GIT_STATUS_MEMO="${NewGitStatus}"
  source "${POWALINE_LIB_DIR}/git_segments/git_segments.sh"
  echo "
POWALINE_GIT_STATUS_MEMO_UPDATED='1'
read -d '' POWALINE_GIT_STATUS_MEMO <<'EOF'
""${POWALINE_GIT_STATUS_MEMO}""
EOF
"
fi
unset NewGitStatus

