#!/usr/bin/env bash
echo "#%$(git rev-parse --short HEAD 2> /dev/null)
$(git status -b --porcelain 2> /dev/null)"
