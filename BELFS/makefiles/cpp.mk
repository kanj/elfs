package += cpp
cpp_ver = 4.6.0
cpp_url = ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.6.0/gcc-4.6.0.tar.bz2

cpp-add: 
ifeq ($(findstring cpp, $(iPackage)),)
	@echo "Adding "cpp
	@$(getUrl) $(cpp_url) $(CLFS)
	@cp scripts/cpp.sh $(CLFS)
	@$(CLFS)/cpp.sh $(cpp_ver) add
	@touch $(CACHE)/cpp-$(cpp_ver)
	@rm $(CLFS)/cpp.sh
	@rm -r $(CLFS)/sources/cpp-$(cpp_ver)
endif

cpp-remove: 
ifneq ($(findstring cpp, $(iPackage)),)
	@echo "Removing "cpp
	@$(getUrl) $(cpp_url) $(CLFS)
	@cp scripts/cpp.sh $(CLFS)
	@$(CLFS)/cpp.sh $(cpp_ver) remove
	@rm $(CACHE)/cpp-$(cpp_ver)
	@rm $(CLFS)/cpp.sh
	@rm -r $(CLFS)/sources/cpp-$(cpp_ver)
endif
