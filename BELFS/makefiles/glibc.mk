package += glibc
glibc_ver = 2.17
glibc_url = http://ftp.gnu.org/gnu/glibc/glibc-2.17.tar.xz

glibc-add: 
ifeq ($(findstring glibc, $(iPackage)),)
	@echo "Adding "glibc
	@$(getUrl) $(glibc_url) $(CLFS)
	@cp scripts/glibc.sh $(CLFS)
	@$(CLFS)/glibc.sh $(glibc_ver) add
	@touch $(CACHE)/glibc-$(glibc_ver)
	@rm $(CLFS)/glibc.sh
	@rm -r $(CLFS)/sources/glibc-$(glibc_ver)
endif

glibc-remove: 
ifneq ($(findstring glibc, $(iPackage)),)
	@echo "Removing "glibc
	@$(getUrl) $(glibc_url) $(CLFS)
	@cp scripts/glibc.sh $(CLFS)
	@$(CLFS)/glibc.sh $(glibc_ver) remove
	@rm $(CACHE)/glibc-$(glibc_ver)
	@rm $(CLFS)/glibc.sh
	@rm -r $(CLFS)/sources/glibc-$(glibc_ver)
endif
