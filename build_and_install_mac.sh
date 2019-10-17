#!/bin/sh
autoconf
rm -f aclocal.m4
aclocal
glibtoolize --force
automake --add-missing
autoreconf
./configure
make -j8
make install