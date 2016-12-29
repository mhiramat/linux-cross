#!/bin/sh

set -ex

if [ ! -f /opt/linux/Makefile ]; then
  echo "Error: /opt/linux is not kernel source tree"
  exit 1
fi

mkdir -p /tmp/build
cd /tmp/build

for arch in $*; do
  ln -sf /opt/linux /tmp/build/source
  echo "Building $arch kernel"
  make.cross ARCH=$arch defconfig
  make.cross ARCH=$arch
  rm -rf ./*
done
