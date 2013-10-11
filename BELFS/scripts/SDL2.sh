#!/bin/sh
source /etc/.bashrc

cd ~/sources/SDL2-$1
./configure 

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
