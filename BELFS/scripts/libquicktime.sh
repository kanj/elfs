#!/bin/sh
source /etc/.bashrc

cd ~/sources/libquicktime-$1
./configure --prefix=/usr \
            --docdir=/usr/share/doc/libquicktime-1.2.4 \
            --enable-gpl \
            --without-doxygen

case $2 in
add) make install ;;
remove)    make  uninstall ;;
esac 
            
