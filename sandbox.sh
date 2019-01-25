#!/bin/bash
set -e
source ./y2mp3-lib.sh

if [[ $(is-link-correct google.com) == "true" ]]; then
  echo "link correct"
else
  echo "incorrect link"
fi

download "https://www.youtube.com/watch?v=343Q1V7vJS4&start_radio=1&list=RD343Q1V7vJS4"