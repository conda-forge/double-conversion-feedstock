#!/bin/bash

export CFLAGS="${CFLAGS} -D__STDC_FORMAT_MACROS"
export CXXFLAGS="${CXXFLAGS} -D__STDC_FORMAT_MACROS"

# Build static lib
cmake ${CMAKE_ARGS} . \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=ON
make install -j${CPU_COUNT}

# Build shared lib
cmake . \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DBUILD_SHARED_LIBS=ON \
  -DBUILD_TESTING=OFF
make install -j${CPU_COUNT}

test/cctest/cctest --list | tr -d '<' | xargs test/cctest/cctest

