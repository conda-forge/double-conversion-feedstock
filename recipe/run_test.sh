#!/bin/sh
eval "${CC} test.cc -o test.o -I${PREFIX}/include && ./test.o"
