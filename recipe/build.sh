#!/bin/bash

# Build shared lib
cmake ${CMAKE_ARGS} . \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON
make -j

test/cctest/cctest --list | tr -d '<' | xargs test/cctest/cctest

make install

# Build static lib
cmake . \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_SHARED_LIBS=OFF \
  -DBUILD_TESTING=OFF
make -j
make install
