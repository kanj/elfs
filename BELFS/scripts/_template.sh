#!/bin/sh
source `dirname $0`/.bashrc

cd ~/sources/foo-$1
./configure 

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
