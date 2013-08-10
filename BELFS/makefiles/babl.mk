package += babl
babl_ver = 0.1.10
babl_url = ftp://ftp.gimp.org/pub/babl/0.1/babl-0.1.10.tar.bz2

babl-add: 
ifeq ($(findstring babl, $(iPackage)),)
	@echo "Adding "babl
	@$(getUrl) $(babl_url) $(CLFS)
	@cp scripts/babl.sh $(JAIL)
	@$(CHROOT) /babl.sh $(babl_ver) add
	@touch $(CACHE)/babl-$(babl_ver)
	@rm $(JAIL)/babl.sh
	@rm -r $(CLFS)/sources/babl-$(babl_ver)
endif

babl-remove: 
ifneq ($(findstring babl, $(iPackage)),)
	@echo "Removing "babl
	@$(getUrl) $(babl_url) $(CLFS)
	@cp scripts/babl.sh $(JAIL)
	@$(CHROOT) /babl.sh $(babl_ver) remove
	@rm $(CACHE)/babl-$(babl_ver)
	@rm $(JAIL)/babl.sh
	@rm -r $(CLFS)/sources/babl-$(babl_ver)
endif
