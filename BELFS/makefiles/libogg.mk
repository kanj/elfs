package += libogg
libogg_ver = 1.3.1
libogg_url = http://downloads.xiph.org/releases/ogg/libogg-1.3.1.tar.xz
libogg_dep = 

libogg-add: 
ifeq ($(findstring libogg, $(iPackage)),)
	@echo "Adding libogg"
	@$(getUrl) $(libogg_url) $(CLFS)
	@cp scripts/libogg.sh $(JAIL)
	@$(CHROOT) /libogg.sh $(libogg_ver) add
	@touch $(CACHE)/libogg-$(libogg_ver)
	@rm $(JAIL)/libogg.sh
	@rm -r $(CLFS)/sources/libogg-$(libogg_ver)
endif

libogg-remove: 
ifneq ($(findstring libogg, $(iPackage)),)
	@echo "Removing "libogg
	@$(getUrl) $(libogg_url) $(CLFS)
	@cp scripts/libogg.sh $(JAIL)
	@$(CHROOT) /libogg.sh $(libogg_ver) remove
	@rm $(CACHE)/libogg-$(libogg_ver)
	@rm $(JAIL)/libogg.sh
	@rm -r $(CLFS)/sources/libogg-$(libogg_ver)
endif
