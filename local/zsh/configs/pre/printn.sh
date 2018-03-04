#!/usr/bin/env bash

# Function
function cprint {

  # Arguments
  local type="$1"
  local text="$2"

  # Colors
  local fg_n="\033[0m"
  local fg_black="\033[0;30m"
  local fg_graydark="\033[1;30m"
  local fg_red="\033[0;31m"
  local fg_redlight="\033[1;31m"
  local fg_green="\033[0;32m"
  local fg_greenlight="\033[1;32m"
  local fg_orange="\033[0;33m"
  local fg_yellow="\033[1;33m"
  local fg_blue="\033[0;34m"
  local fg_bluelight="\033[1;34m"
  local fg_purple="\033[0;35m"
  local fg_purplelight="\033[1;35m"
  local fg_cyan="\033[0;36m"
  local fg_cyanlight="\033[1;36m"
  local fg_graylight="\033[0;37m"
  local fg_white="\033[1;37m"

  if [ "$type" = "title" ]; then
    local title_delimiter="#"
    local echo_text="$title_delimiter  $text  $title_delimiter"
    local echo_delimiters="$( printf "%${#echo_text}s" |tr " " "$title_delimiter" )"

    echo
    printf "$fg_bluelight$echo_delimiters$fg_n\n"
    printf "$fg_bluelight$echo_text$fg_n\n"
    printf "$fg_bluelight$echo_delimiters$fg_n\n"
    echo

  elif [ "$type" = "success" ]; then
    printf "✔  $fg_green$text$fg_n\n"

  elif [ "$type" = "warning" ]; then
    printf "🔔  $fg_yellow$text$fg_n\n"

  elif [ "$type" = "info" ]; then
    printf "💬  $text\n"

  elif [ "$type" = "error" ]; then
    >&2 printf "𐄂  $fg_red$text$fg_n\n"

  elif [ -z "$text" ]; then
    printf "$type\n"

  else
    printf "$text\n"

  fi

}

