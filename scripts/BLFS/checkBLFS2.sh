#!/bin/sh
# Static test - no need for a tool chain, just meets certain compatability criteria for a high degree of scuccess
# Currently compatability model I have is configure/make/make install thru host_alias/DESTDIR
#TODO:  limit url check to package info section
#TODO:  Check for a packjage section
#TODO:  Check for archive for folder name rather than guessing from url
BUILDDIR=$PWD

# http://www.linuxfromscratch.org/blfs/view/stable
# <a href="default.asp">HTML Tutorial</a>
#These two section are fetchextract

eTD="<td></td>"

#redoing this so evrtime a row is printed with info 

fetch () {


    pkg=${pkgUrl##*/}
        echo $pkg
        [ "$pkg" != """" ] || return 1

      echo "Preparing "$base

       if [ -f /usr/src/$pkg ] 
      then
        SRC_ARCHIVE="/usr/src"
      else  
        [ -f ${BUILDDIR}/usr/src/$pkg ] || wget -t 1 -P ${BUILDDIR}/usr/src  $pkgUrl || dlStatus="Failed"
        SRC_ARCHIVE=${BUILDDIR}/usr/src
      fi  
      dlStatus="Downloaded"
}

extract () {

        tarType=${pkgUrl##*.}

      # pkgFolder=${pkg%%.tar*}
      
      #buildFolder=$( echo -n $pkgFolder | cut -d- -f1 )"-build"

      case $tarType in

            bz2) tar -xjf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;

            tar) tar -xvf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;

            gz)   tar -xzf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;
            
            xz) tar -Jxf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;
            
            tgz)   tar -xzf $SRC_ARCHIVE/$pkg -C ${BUILDDIR}/sources/  ;;
            
            zip)    pkgFolder=${pkg%%.zip*}
                    unzip $SRC_ARCHIVE/$pkg -d ${BUILDDIR}/sources/$pkgFolder ;;

            *)      extStatus="Unsupported"
                    return 1   ;;

      esac
   
   
    if [ "$?" != "0" ]
   then
        extStatus="Corrupted" 
        return 1
   else
        extStatus="Extracted"     
   fi     
   
   
   case $tarType in
    zip) pkgFolder=$pkgFolder ;;
    *)   pkgFolder=$( tar -t --file=$SRC_ARCHIVE/$pkg | head -n 2 | tail -n 1 | cut -d/ -f1  ) ;;
   esac

   if ! [ -d ${BUILDDIR}/sources/$pkgFolder ] 
   then
    extStatus="No folder"
    return 1
   fi  
   
  



}
checkConfigSub () {
    find ${BUILDDIR}/sources/${pkgFolder} -name \config.sub -print  > ${BUILDDIR}/tmp/config.sub.find
    if ! [ -s ${BUILDDIR}/tmp/config.sub.find ] 
    then
        
        return 1 
    fi        

}

checkHostAlias () {
    grep -e "host_alias" ${BUILDDIR}/sources/$pkgFolder/configure > /dev/null
    if ! [ $? ]
    then
          
        return 1 
    fi
}    
            
checkDestdir () {

    grep "DESTDIR" ${BUILDDIR}/sources/$pkgFolder/Makefile.in > /dev/null
    if ! [ $? ]
    then
          
        return 1 
    fi    

}

checkCMake () {

    cd ${BUILDDIR}/sources/$pkgFolder
    if ! [ -f CMakeLists.txt ]
    then
        cd -
        
        return 1
    fi
    cd -
            
}

gbsPrereq () {

    cd ${BUILDDIR}/sources/$pkgFolder
    
    find $PWD -maxdepth 2 -type f -name "config*" > tmpConfig
    
    
    [ -s tmpConfig ] && grep -e "AC_PROG_CXX" `cat tmpConfig` >tmpCPP
    
    if  ! [ -s tmpConfig ]
    then
        useCPP="Unk."
    elif [ -s tmpCPP ]
    then
        useCPP="Yes"
    else
        useCPP="No"
    fi           
   

    [ -s tmpConfig ] && grep -e "AC_CHECK_LIB(ncurse" `cat tmpConfig` >tmpNC
   
    if ! [ -s tmpConfig ]
    then
        useNcurses="Unk"
    elif  [ -s tmpNC ]
    then
        useNcurses="Yes"       
    else
        useNcurses="No"            
    fi    
    
    
    cd ${BUILDDIR}/blfs-book-7.4-html/$blfsDIR
}


rmArchive () {
    rm -rf ${BUILDDIR}/sources/$pkgFolder/*
            rm -rf ${BUILDDIR}/sources/$pkgFolder/.??*
            rmdir ${BUILDDIR}/sources/$pkgFolder &2>../../tmp/folderMsg
    [ -d ${BUILDDIR}/sources ] || exit 1

}

doSkip () {

    

    #[ -f ../../checkBLFS.html ] && grep $page ../../checkBLFS.html  && continue # If restarting start from where left off
    
    hxextract .package $page > ../../tmp/package      2>/dev/null             #Nothing to do if no package
    
    [ -s ../../tmp/package ] ||  dlStatus="No package"   
    [ -s ../../tmp/package ] ||  return 1
        
    [ "$page" == "./docbook-utils.html" ] && dlStatus="Skipped" && return 1  #bad url
    [ "$page" == "./udev-extras.html" ] && dlStatus="Skipped" && return 1   #not a package
    [ "$page" == "./x7font.html" ] && dlStatus="Skipped" && return 1         #Download only
    [ "$page" == "./x7proto.html" ] && dlStatus="Skipped" && return 1        #Download only
    [ "$page" == "./x7app.html" ] && dlStatus="Skipped" && return 1          #Download only
    [ "$page" == "./mitkrb.html" ] && dlStatus="Skipped" && return 1        #Signed TAR
    [ "$page" == "./firefox.html" ] && dlStatus="Skipped" && return 1
    [ "$page" == "./cvsserver.html" ] && dlStatus="Skipped" && return 1
    [ "$page" == "./cvsserver.html" ] && dlStatus="Skipped" && return 1      # Not a package
    [ "$page" == "./perl-modules.html" ] && dlStatus="Skipped" && return 1      # Not a package
    [ "$page" == "./svnserver.html" ] && dlStatus="Skipped" && return 1      # Not a package
    [ "$page" == "./udev.html" ] && dlStatus="Skipped" && return 1     # Not a package
    [ "$page" == "./vulnerabilities.html" ] && dlStatus="Skipped" && return 1     # Not a package
    [ "$page" == "./x7lib.html" ] && dlStatus="Skipped" && return 1      # Not a package
    [ "$page" == "./cacerts.html" ] && dlStatus="Skipped" && return 1      # Not a package
    
    return 0
    
}


printHeader () {



printf "\n%s" "<table border=1>" >> checkBLFS.html
printf "\n%s" "<tr>" >> checkBLFS.html
printf "\n%s" "<th>Package   </th>" >> checkBLFS.html
printf "\n%s" "<th>Downloaded   </th>" >> checkBLFS.html
printf "\n%s" "<th>Extracted   </th>" >> checkBLFS.html
printf "\n%s" "<th>Build System  </th>" >> checkBLFS.html
printf "\n%s" "<th>C++ </th>" >> checkBLFS.html
printf "\n%s" "<th>ncurses  </th>" >> checkBLFS.html
printf "\n%s" "<th>Results  </th>" >> checkBLFS.html
printf "\n%s" "</tr>" >> checkBLFS.html



}



initializeRow () {
page2=$( echo -n $page | cut -d/ -f2  )
page3=$( echo -n $page2 | cut -d. -f1 )

pageLink="<a href=http://www.linuxfromscratch.org/blfs/view/stable/$blfsDIR/$page2>$page3</a>"
dlStatus="Unknown"
extStatus="Unknown"
buildSys="Unknown"
useCPP="TBD"
useNcurses="TBD"
useResults="TBD"

}

printRow () {
myVar=$( grep -e $page3"^" ${BUILDDIR}/testInfo | cut -d^ -f2 )
[ -z $myVar ] || useResults=$myVar
printf "\n%s" "<tr><td>$pageLink</td><td>$dlStatus</td><td>$extStatus</td><td>$buildSys</td><td>$useCPP</td><td>$useNcurses</td><td>$useResults</td></tr>" >> ../../checkBLFS.html   
[ -d ${BUILDDIR}/sources/$pkgFolder ] && rmArchive        
continue

}
#MAIN



#Be a SUBROTINUWE to make header

printHeader

for blfsDIR in basicnet general gnome kde multimedia postlfs pst server x xfce xsoft
do
   cd blfs-book-7.4-html/$blfsDIR
   for page in `find .  -name \*.html -print`
   do
        initializeRow
        #function to initialize variables
        doSkip || printRow
        
        
        pkgUrl=$( cat $page | hxselect -c -s '\n\n' ul.compact | hxselect -c -s '\n\n' a.ulink | head -n 1 )
        pkg=${pkgUrl##*/}
        
        [ "$pkg" != """" ] || pkgUrl=$( cat $page | hxselect -c -s '\n\n' ul.compact | hxselect -c -s '\n\n' a.ulink | head -n 2 | tail -n 1 )
       
        fetch || printRow
        extract || printRow
       
        
        if checkConfigSub && checkHostAlias && checkDestdir 
        then
            buildSys="GNU Build System"
            gbsPrereq
            
        elif checkCMake
        then 
            buildSys="CMake"
           
        else
            buildSys="Unk."
             
        fi
        printRow 
        
   done
   cd ../..
   
done

printf "\n%s" "</table>" >> checkBLFS.html

