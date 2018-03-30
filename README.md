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
 
 2018-03-29:
  * Updated material/common/introduction.xml to add -p option to mkdir 
  * Updated final-preps/settingenviron.xml to add correct export assignment 
  * Updated armMusl.ent with new target board - versatile
  * Updated cross-tools/common/binutils.xml to add -p option to mkdir
  * Updated binutils to 2.27
  * 
  * 
  
 TODO:
  * Update to reflect building gmp/mpfr/mpc with gcc-static 
  * 
  * 
  *  
