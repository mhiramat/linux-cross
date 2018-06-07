#!/bin/sh

set -ex

if [ ! -f /opt/linux/Makefile ]; then
  echo "Error: /opt/linux is not kernel source tree"
  exit 1
fi

mkdir -p /tmp/build
cd /tmp/build

eexit() { # message
  echo $1
  exit 1
}

for arch in $*; do
  ln -sf /opt/linux /tmp/build/source
  echo "Building $arch kernel"
  make.cross ARCH=$arch defconfig
  make.cross ARCH=$arch || eexit "Failed to build $arch kernel"
  rm -rf ./*
done
