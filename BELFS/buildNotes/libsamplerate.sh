#!/bin/sh
source /etc/.bashrc

cd ~/sources/libsamplerate-$1
./configure --prefix=/usr --disable-static

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
