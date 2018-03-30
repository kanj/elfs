Embedded Linux From Source
=============

This is a fork from the Cross Linux From Scratch - Embedded Book

The purpose of this fork are four fold:
  * Support alternate C libraries. 
  * Support automated testing
  * Build against specific platforms
  * Build gcc as a single stage
  
How to - execute from BOOK :
  * make $(arch)-dump dumps all the commands in ../render/commands/$(arch). 
  * make $(arch)-html creates an html version of the book for the specified architecture. 
  * make $(arch)-build should create a working system. It is currently broken. 

TODO:
  * Get musl to succesfully compile
 
2018-03-30:
  * modified:   BOOK/armMusl.ent to reflect current packages
  * modified:   BOOK/cross-tools/arm/gcc-static-musl.xml to reflect use of ./config/download_prerequisites
  * modified:   BOOK/cross-tools/armMusl-chapter.xml to reflect removal of gmp/mpc/mpfr steps
  * modified:   BOOK/cross-tools/common/gcc-static.xml to reflect use of ./config/download_prerequisites
  * modified:   BOOK/packages.ent
  * modified:   README.md
   
 2018-03-29:
  * Updated material/common/introduction.xml to add -p option to mkdir 
  * Updated final-preps/settingenviron.xml to add correct export assignment 
  * Updated armMusl.ent with new target board - versatile
  * Updated cross-tools/common/binutils.xml to add -p option to mkdir
  * Updated binutils to 2.27

  
 
