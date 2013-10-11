#!/bin/sh
source `dirname $0`/.bashrc

cd ~/sources/SDL-$1
./configure 

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
