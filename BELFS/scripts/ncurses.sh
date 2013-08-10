#!/bin/sh
source /etc/.bashrc

cd ~/sources/ncurses-$1
./configure  --with-shared \
    --without-debug --without-ada --without-cxx --enable-overwrite --without-cxx-binding

case $2 in
add) make install ;;
remove)    make  uninstall ;;
esac 
            
