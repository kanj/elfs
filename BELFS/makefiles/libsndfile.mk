package += libsndfile
libsndfile_ver = 1.0.25
libsndfile_url = http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.25.tar.gz

libsndfile-add: 
ifeq ($(findstring libsndfile, $(iPackage)),)
	@echo "Adding "libsndfile
	@$(getUrl) $(libsndfile_url) $(CLFS)
	@cp scripts/libsndfile.sh $(JAIL)
	@$(CHROOT) /libsndfile.sh $(libsndfile_ver) add
	@touch $(CACHE)/libsndfile-$(libsndfile_ver)
	@rm $(JAIL)/libsndfile.sh
	@rm -r $(CLFS)/sources/libsndfile-$(libsndfile_ver)
endif

libsndfile-remove: 
ifneq ($(findstring libsndfile, $(iPackage)),)
	@echo "Adding "libsndfile
	@$(getUrl) $(libsndfile_url) $(CLFS)
	@cp scripts/libsndfile.sh $(JAIL)
	@$(CHROOT) /libsndfile.sh $(libsndfile_ver) add
	@rm $(CACHE)/libsndfile-$(libsndfile_ver)
	@rm $(JAIL)/libsndfile.sh
	@rm -r $(CLFS)/sources/libsndfile-$(libsndfile_ver)
endif
