#!/bin/sh
doDownload () {

        
      pkg=${pkgUrl##*/}

      echo "Preparing "$base

      if [ -f /usr/src/$pkg ] 
      then
        SRC_ARCHIVE="/usr/src"
      else  
        [ -f ${BUILDDIR}/usr/src/$pkg ] || wget -P ${BUILDDIR}/usr/src  $pkgUrl
        SRC_ARCHIVE=${BUILDDIR}/usr/src
      fi  

 

      tarType=${pkgUrl##*.}

      pkgFolder=${pkg%%.tar*}

      buildFolder=$( echo -n $pkgFolder | cut -d- -f1 )"-build"

      case $tarType in

            bz2) tar -xjf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;

            tar) tar -xvf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;

            gz)   tar -xzf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;
            
            xz) tar -Jxf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;
            
            tgz)   tar -xzf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;

            *)    echo "Unrecognized archive format " && exit 1   ;;

      esac
   
   
  
   
  
   

}

pkgUrl=$1
BUILDDIR=$2
doDownload

