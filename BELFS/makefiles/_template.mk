package += foo
foo_ver = 
foo_url = 

foo-add: 
ifeq ($(findstring foo, $(iPackage)),)
	@echo "Adding "foo
	@$(getUrl) $(foo_url) $(CLFS)
	@cp scripts/foo.sh $(CLFS)
	@$(CLFS)/foo.sh $(foo_ver) add
	@touch $(CACHE)/foo-$(foo_ver)
	@rm $(CLFS)/foo.sh
	@rm -r $(CLFS)/sources/foo-$(foo_ver)
endif

foo-remove: 
ifneq ($(findstring foo, $(iPackage)),)
	@echo "Removing "foo
	@$(getUrl) $(foo_url) $(CLFS)
	@cp scripts/foo.sh $(CLFS)
	@$(CLFS)/foo.sh $(foo_ver) remove
	@rm $(CACHE)/foo-$(foo_ver)
	@rm $(CLFS)/foo.sh
	@rm -r $(CLFS)/sources/foo-$(foo_ver)
endif
