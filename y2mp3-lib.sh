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
      echo -n "|- downloading... $1 -- "
      linked_download=$y2mp3_api$1
      downloader=$(
            wget --directory-prefix=$(pwd)/download \
            --content-disposition \
            -E -c $linked_download \
            > /dev/null 2>&1 ;echo $?
            )
      if [[ $downloader -gt 0 ]]; then
        echo "failed, status : $downloader"
      else
        echo "success, status : $downloader"
      fi
    else
      # exception
      echo "|- error $?"
    fi
  else
    echo "|- "
  fi
}