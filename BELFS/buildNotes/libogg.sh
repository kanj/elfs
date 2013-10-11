#!/bin/sh
source /etc/.bashrc

cd ~/sources/libogg-$1
./configure --prefix=/usr --docdir=/usr/share/doc/libogg-1.3.1 --disable-static

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
