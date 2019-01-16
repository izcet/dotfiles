#!/bin/bash

if [ "$#" -ne "2" ] ; then
  echo "Usage: $0 <search directory> <regex pattern>"
  exit 0
fi

TARGET_SEARCH_DIR="$1"
TARGET_SEARCH_REX="$2"

ALL_FILES="$(find "$TARGET_SEARCH_DIR" -name "$TARGET_SEARCH_REX")"
echo $ALL_FILES

function realpath () {
  TARGET="$1"
  echo "$(cd "$(dirname "$TARGET")"; pwd -P)/$(basename "$TARGET")"
}

REAL_FILES="$(realpath $ALL_FILES )"
echo $REAL_FILES
