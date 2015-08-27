#!/bin/bash

BUILD_DIR=$1

if [ "$BUILD_DIR" == "" ]; then
  BUILD_DIR="build"
fi

set -xe
wrtbuild -y build devices/ $BUILD_DIR
