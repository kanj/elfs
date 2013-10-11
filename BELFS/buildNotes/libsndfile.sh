#!/bin/sh
source /etc/.bashrc

cd ~/sources/libsndfile-$1
./configure --prefix=/usr --disable-static

case $2 in
add) make && make htmldocdir=/usr/share/doc/libsndfile-1.0.25 install ;;
remove) make uninstall;;
esac     
            
