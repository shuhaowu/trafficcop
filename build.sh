#!/bin/bash

BUILD_DIR=$1

if [ "$BUILD_DIR" == "" ]; then
  BUILD_DIR="build"
fi

rm -f $BUILD_DIR/skeleton-modified.css
rm -f $BUILD_DIR/index.html

cssmin src/skeleton-modified.css > $BUILD_DIR/skeleton-modified.css

python - <<EOF

with open("$BUILD_DIR/skeleton-modified.css") as f:
  css = f.read()

with open("src/index.html") as f:
  html = f.read()
  html = html.replace("/* ~css~ */", css)

with open("$BUILD_DIR/index.html", "w") as f:
  f.write(html)

EOF

set -xe

devices=$(ls -d devices/*/)

for device in $devices; do
  rm -rf $device/files/trafficcop
  mkdir -p $device/files/trafficcop

  cp -r src/api $devices/files/trafficcop
  cp $BUILD_DIR/index.html $devices/files/trafficcop/index.html
done


wrtbuild -y build devices/ $BUILD_DIR

