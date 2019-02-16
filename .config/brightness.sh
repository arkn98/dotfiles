#!/bin/bash

function increase() {
  typeset -i currentbrightness=$(</sys/class/backlight/radeon_bl0/brightness)
  typeset -i maxbrightness=$(</sys/class/backlight/radeon_bl0/max_brightness)
  typeset -i ceil=$maxbrightness-10
  typeset -i diff=$max_brightness-$currentbrightness
  if [ $currentbrightness -le $ceil ]; then
    currentbrightness=$currentbrightness+10
    echo "$currentbrightness" | tee /sys/class/backlight/radeon_bl0/brightness > /dev/null
  elif [ $diff -lt 10 ]; then
    currentbrightness=$maxbrightness
    echo "$currentbrightness" | tee /sys/class/backlight/radeon_bl0/brightness > /dev/null
  fi
}

function decrease() {
  typeset -i currentbrightness=$(</sys/class/backlight/radeon_bl0/brightness)
  typeset -i minbrightness=0
  typeset -i floor=$minbrightness+10
  typeset -i diff=$currentbrightness-$minbrightness
  if [ $currentbrightness -ge $floor ]; then
    currentbrightness=$currentbrightness-10
    echo "$currentbrightness" | tee /sys/class/backlight/radeon_bl0/brightness > /dev/null
  elif [ $diff -lt 10 ]; then
    currentbrightness=0
    echo "$currentbrightness" | tee /sys/class/backlight/radeon_bl0/brightness > /dev/null
  fi
}

function usage() {
  echo "usage"
  echo -e "\t-d --decrease\t-\tdecrease brightness by 10 units"
  echo -e "\t-h --help\t-\tshow help"
  echo -e "\t-i --increase\t-\tincrease brightness by 10 units"
}

POSITIONAL=()
if [ $# -gt 0 ]; then
  while [[ $# -gt 0 ]]
  do
    key="$1"

    case $key in
      -h|--help)
      usage
      shift
      ;;
      -i|--increase)
      increase
      shift
      ;;
      -d|--decrease)
      decrease
      shift
      ;;
      *)
      usage
      POSITIONAL+=("$1")
      shift
      ;;
    esac
  done
else
  usage
fi

set -- "${POSITIONAL[@]}"
