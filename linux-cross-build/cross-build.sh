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

CONFIG=defconfig
opt_arch=

while [ $# -ne 0 ]; do
  case $1 in
  *config)
    CONFIG=$1
    ;;
  *)
    opt_arch="$opt_arch $1"
    ;;
  esac
  shift 1
done

if [ "$opt_arch" ]; then
  ARCHS="$opt_arch"
elif [ -z "$ARCHS" ]; then
  echo "Error: at least one target arch must be specified"
  exit 1
fi

for arch in $ARCHS; do
  ln -sf /opt/linux /tmp/build/source
  echo "Building $arch kernel"
  make.cross ARCH=$arch $CONFIG
  make.cross ARCH=$arch || eexit "Failed to build $arch kernel"
  rm -rf ./*
done
