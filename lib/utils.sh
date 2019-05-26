#!/usr/bin/env bash

utils=1

RESET="\[\e[0m\]"

RESET_BG="\[\e[49m\]"

RESET_BG_SUB="\\\[\\\e[49m\\\]"

# https://misc.flogisoft.com/bash/tip_colors_and_formatting#attributes_combination
# fg = 38
# bg = 48
# printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
bg_esc() {
  echo '\[\e[48;5;'"${1}"'m\]'
}

fg_esc() {
  echo '\[\e[38;5;'"${1}"'m\]'
}

bg_esc_sub() {
  echo "\\\[\\\e[48;5;${1}m\\\]"
}

fg_esc_sub() {
  echo "\\\[\\\e[38;5;${1}m\\\]"
}
