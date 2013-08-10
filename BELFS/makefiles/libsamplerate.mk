package += libsamplerate
libsamplerate_ver = 0.1.8
libsamplerate_url = http://www.mega-nerd.com/SRC/libsamplerate-0.1.8.tar.gz

libsamplerate-add: 
ifeq ($(findstring libsamplerate, $(iPackage)),)
	@echo "Adding "libsamplerate
	@$(getUrl) $(libsamplerate_url) $(CLFS)
	@cp scripts/libsamplerate.sh $(JAIL)
	@$(CHROOT) /libsamplerate.sh $(libsamplerate_ver) add
	@touch $(CACHE)/libsamplerate-$(libsamplerate_ver)
	@rm $(JAIL)/libsamplerate.sh
	@rm -r $(CLFS)/sources/libsamplerate-$(libsamplerate_ver)
endif

libsamplerate-remove: 
ifneq ($(findstring libsamplerate, $(iPackage)),)
	@echo "Adding "libsamplerate
	@$(getUrl) $(libsamplerate_url) $(CLFS)
	@cp scripts/libsamplerate.sh $(JAIL)
	@$(CHROOT) /libsamplerate.sh $(libsamplerate_ver) add
	@rm $(CACHE)/libsamplerate-$(libsamplerate_ver)
	@rm $(JAIL)/libsamplerate.sh
	@rm -r $(CLFS)/sources/libsamplerate-$(libsamplerate_ver)
endif
