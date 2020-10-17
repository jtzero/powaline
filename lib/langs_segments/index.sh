#!/usr/bin/env bash

if [[ ! -v POWALINE_LIB_DIR ]]; then
  POWALINE_LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )"/../ && pwd )"
fi

if [[ ! -v core ]]; then
  source "${POWALINE_LIB_DIR}/core.sh"
fi

NewLangs="$(source ""${POWALINE_LIB_DIR}/langs_segments/cmd.sh"" 2>&1 )"
                                                              # this will never be false
if [ "${POWALINE_LANGS_SEGMENTS_MEMO}" != "${NewLangs}" ] || [ -z ${POWALINE_LANGS_SEGMENTS_MEMO+x} ]; then
  POWALINE_LANGS_SEGMENTS_MEMO="${NewLangs}"
  source "${POWALINE_LIB_DIR}/langs_segments/langs_segments.sh"
echo "
POWALINE_LANGS_SEGMENTS_MEMO_UPDATED='1'
read -d '' POWALINE_LANGS_SEGMENTS_MEMO <<'EOF'
""${POWALINE_LANGS_SEGMENTS_MEMO}""
EOF
"
fi

unset NewLangs

