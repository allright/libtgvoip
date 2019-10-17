#!/bin/sh
autoconf
rm -f aclocal.m4
aclocal
libtoolize --force
automake --add-missing
autoreconf
./configure
make -j8
make install