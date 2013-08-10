package += mpg123
mpg123_ver = 1.15.4
mpg123_url = http://downloads.sourceforge.net/mpg123/mpg123-1.15.4.tar.bz2

mpg123-add: 
ifeq ($(findstring mpg123, $(iPackage)),)
	@echo "Adding "mpg123
	@$(getUrl) $(mpg123_url) $(CLFS)
	@cp scripts/mpg123.sh $(JAIL)
	@$(CHROOT) /mpg123.sh $(mpg123_ver) add
	@touch $(CACHE)/mpg123-$(mpg123_ver)
	@rm $(JAIL)/mpg123.sh
	@rm -r $(CLFS)/sources/mpg123-$(mpg123_ver)
endif

mpg123-remove: 
ifneq ($(findstring mpg123, $(iPackage)),)
	@echo "Adding "mpg123
	@$(getUrl) $(mpg123_url) $(CLFS)
	@cp scripts/mpg123.sh $(JAIL)
	@$(CHROOT) /mpg123.sh $(mpg123_ver) remove
	@rm $(CACHE)/mpg123-$(mpg123_ver)
	@rm $(JAIL)/mpg123.sh
	@rm -r $(CLFS)/sources/mpg123-$(mpg123_ver)
endif
