#!/bin/sh

source `dirname $0`/.bashrc

cd ~/sources/gcc-$1

unset CC CXX AR AS LD RANLIB READELF STRIP host_alias DESTDIR

mkdir ../gcc-build
cd ../gcc-build


case ${CLFS_ARCH} in
arm)    
    AR=ar LDFLAGS="-Wl,-rpath,${CLFS}/cross-tools/lib" \
  ../gcc-$1/configure --prefix=${CLFS}/cross-tools \
  --build=${CLFS_HOST} --target=${CLFS_TARGET} --host=${CLFS_HOST} \
  --with-sysroot=${CLFS} --disable-nls --enable-shared \
  --enable-languages=c,c++ --enable-c99 --enable-long-long \
  --with-mpfr=${CLFS}/cross-tools --with-gmp=${CLFS}/cross-tools \
  --with-mpc=${CLFS}/cross-tools --disable-multilib \
  --with-abi=${CLFS_ABI} --with-arch=${CLFS_ARM_ARCH} \
  --with-mode=${CLFS_ARM_MODE} --with-float=${CLFS_FLOAT} \
  --with-fpu=${CLFS_FPU} 
  ;;
i386) 
    AR=ar LDFLAGS="-Wl,-rpath,${CLFS}/cross-tools/lib" \
  ../gcc-$1/configure --prefix=${CLFS}/cross-tools \
  --build=${CLFS_HOST} --target=${CLFS_TARGET} --host=${CLFS_HOST} \
  --with-sysroot=${CLFS} --disable-nls --enable-shared \
  --enable-languages=c,c++ --enable-c99 --enable-long-long \
  --with-mpfr=${CLFS}/cross-tools --with-gmp=${CLFS}/cross-tools \
  --with-mpc=${CLFS}/cross-tools --disable-multilib \
  --with-arch=${CLFS_CPU}
  ;;
*) return 1 ;;
esac

case $2 in
add) make && make  install ;;
remove) make uninstall;;
esac     
            
