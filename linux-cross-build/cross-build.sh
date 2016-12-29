#!/bin/sh

set -ex

mkdir -p /tmp/build
ln -sf /opt/linux /tmp/build/source
if [ ! -f /opt/linux/Makefile ]; then
  echo "Error: /opt/linux is not kernel source tree"
  exit 1
fi
cd /tmp/build

for arch in $*; do
  echo "Building $arch kernel"
  make.cross ARCH=$arch defconfig
  make.cross ARCH=$arch
done
