#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

NewCWD="${PWD}"
if [ "${POWALINE_CWD_MEMO}" != "${NewCWD}" ]; then
  POWALINE_CWD_MEMO="${NewCWD}"
  source "${POWALINE_LIB_DIR}/cwd_segments/cwd_segments.sh"
echo "
POWALINE_CWD_MEMO_UPDATED='1'
read -d '' POWALINE_CWD_MEMO <<'EOF'
""${POWALINE_CWD_MEMO}""
EOF
"
fi
unset NewCWD
