#!/bin/bash

# function to check is link youtube is correct 
function is-link-correct () {
  if [[ $1 == *"youtube.com"* ]]; then
    echo true
  else
    echo false
  fi
}

# function to download file
function download () {
  if ! [[ -z $1 ]]; then
    if [[ $(is-link-correct $1) == "true" ]]; then
      y2mp3_api="www.convertmp3.io/fetch/?video="
      # get file
      echo "|- downloading..."
      linked_download=$y2mp3_api$1
      wget --directory-prefix=$(pwd)/download \
            --content-disposition \
            -E -c $linked_download \
            && echo "downloading $1 success..."
    else
      # exception
      echo "|- error $?"
    fi
  else
    echo "|- "
  fi
}