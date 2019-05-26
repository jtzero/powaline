#!/usr/bin/env bash

subshell_utils_utils=1

subshell_comment() {
  echo 'Output="${Output}
'"#--- ${1}"'
"'
}
