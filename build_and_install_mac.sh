#!/bin/sh
autoconf
rm -f aclocal.m4
aclocal
glibtoolize --force
automake --add-missing
autoreconf
./configure --enable-audio-callback CXXFLAGS="-I/usr/local/Cellar/openssl@1.1/1.1.1d/include/ -DTGVOIP_LOG_VERBOSITY=0"
make -j8
make install