#!/bin/bash

PKG_CONFIG_PATH="/home/gluang/project/cpp/third_party/pkg-config"
LD_LIBRARY_PATH="/home/gluang/project/cpp/third_party/libs"

build() {
    mkdir -p build
    rm -rf build/*
    cd build
    cmake ..
    make
}

run() {
    ./bin/$2
}

case "$1" in
build)
    build
    ;;
run)
    run $@
    ;;
*)
    exit 1
    ;;
esac
exit 0
