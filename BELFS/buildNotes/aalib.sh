#!/bin/sh
source /.bashrc
cd /sources/aalib-1.2
./configure --prefix=/usr \
            --infodir=/usr/share/info \
            --mandir=/usr/share/man \
            --disable-static && make
