package += SDL2
SDL2_ver = 2.0.0
SDL2_url = http://www.libsdl.org/release/SDL2-2.0.0.tar.gz

SDL2-add: 
ifeq ($(findstring SDL2, $(iPackage)),)
	@echo "Adding "SDL2
	@$(getUrl) $(SDL2_url) $(CLFS)
	@cp scripts/SDL2.sh $(JAIL)
	@$(CHROOT) /SDL2.sh $(SDL2_ver) add
	@touch $(CACHE)/SDL2-$(SDL2_ver)
	@rm $(JAIL)/SDL2.sh
	@rm -r $(CLFS)/sources/SDL2-$(SDL2_ver)
endif

SDL2-remove: 
ifneq ($(findstring SDL2, $(iPackage)),)
	@echo "Removing "SDL2
	@$(getUrl) $(SDL2_url) $(CLFS)
	@cp scripts/SDL2.sh $(JAIL)
	@$(CHROOT) /SDL2.sh $(SDL2_ver) remove
	@rm $(CACHE)/SDL2-$(SDL2_ver)
	@rm $(JAIL)/SDL2.sh
	@rm -r $(CLFS)/sources/SDL2-$(SDL2_ver)
endif
