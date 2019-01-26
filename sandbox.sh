#!/bin/bash
set -e
source ./y2mp3-lib.sh

if [[ $(is-link-correct google.com) == "true" ]]; then
  echo "link correct"
else
  echo "incorrect link"
fi

download "https://www.youtube.com/watch?v=clU8c2fpk2s"

echo -n "hai "
echo "anone"