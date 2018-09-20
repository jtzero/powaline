#!/usr/bin/env bash
#TODO dont't use porcelain easily breakso
echo "#% $(git rev-parse --short HEAD 2> /dev/null)
$(git status -b --porcelain 2> /dev/null)"
