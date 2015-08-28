#!/bin/bash

BUILD_DIR=$1

if [ "$BUILD_DIR" == "" ]; then
  BUILD_DIR="build"
fi

set -xe

devices=$(ls -d devices/*/)

for device in $devices; do
  rm -rf $device/files/trafficcop
  mkdir -p $device/files/trafficcop

  cp -r src/api $devices/files/trafficcop
  cp src/index.html $devices/files/trafficcop/index.html
done


wrtbuild -y build devices/ $BUILD_DIR

