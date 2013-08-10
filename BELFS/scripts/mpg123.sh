#!/bin/sh
source /etc/.bashrc

cd ~/sources/mpg123-$1
./configure --prefix=/usr

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
