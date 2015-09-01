#!/bin/bash

BUILD_DIR=$1

if [ "$BUILD_DIR" == "" ]; then
  BUILD_DIR="build"
fi

set -e

devices=$(ls -d devices/*/)

for device in $devices; do
  if [ ! -e $device/files/etc/dropbear/authorized_keys ]; then
    echo "ERROR: need authorized_keys for $device"
    exit 1
  fi
done


wrtbuild -y build devices/ $BUILD_DIR

