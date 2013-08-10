foo = 
package += libogg
libogg_ver = 1.3.1
libogg_url = http://downloads.xiph.org/releases/ogg/libogg-1.3.1.tar.xz
libogg_dep = 
addPackage += libogg-add3
libogg-add3: override foo = libogg

libogg-add2: 
ifeq ($(findstring libogg, $(iPackage)),)
	@echo "Adding "$(foo)
	@read a
	@$(getUrl) $($(foo)_url) $(CLFS)
	@cp scripts/libogg.sh $(JAIL)
	@$(CHROOT) /libogg.sh $(libogg_ver) add
	@touch $(CACHE)/libogg-$(libogg_ver)
	@rm $(JAIL)/libogg.sh
	@rm -r $(CLFS)/sources/libogg-$(libogg_ver)
endif

package += libquicktime
libquicktime_ver = 1.2.4
libquicktime_url = http://downloads.sourceforge.net/libquicktime/libquicktime-1.2.4.tar.gz
libquicktime_dep = 

package += ncurses
ncurses_ver = 5.9
ncurses_url = ftp://ftp.gnu.org/gnu/ncurses/ncurses-$(ncurses_ver).tar.gz
ncurses_dep =	


package += mpg123
mpg123_ver = 1.15.4
mpg123_url = http://downloads.sourceforge.net/mpg123/mpg123-1.15.4.tar.bz2
mpg123_dep =	


