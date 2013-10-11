#!/bin/sh
source `dirname $0`/.bashrc

cd ~/sources/glibc-$1

unset CC CXX AR AS LD RANLIB READELF STRIP host_alias DESTDIR

mkdir ../glibc-build
cd ../glibc-build



../glibc-$1/configure                             \
      --prefix=${CLFS}/cross-tools                                 \
      --host=${CLFS_TARGET}                                 \
      --build=${CLFS_HOST} \
      --disable-profile                               \
      --with-headers=${CLFS}/usr/include                   \
      libc_cv_forced_unwind=yes                       \
      libc_cv_ctors_header=yes                        \
      libc_cv_c_cleanup=yes \
      libc_cv_ssp=no

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
