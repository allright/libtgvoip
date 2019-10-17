#!/bin/sh
autoconf
rm -f aclocal.m4
aclocal
libtoolize --force
automake --add-missing
autoreconf
./configure --enable-audio-callback
make -j8
make install