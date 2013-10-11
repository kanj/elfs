package += SDL
SDL_ver = 1.2.15
SDL_url = http://www.libsdl.org/release/SDL-1.2.15.tar.gz

SDL-add: 
ifeq ($(findstring SDL, $(iPackage)),)
	@echo "Adding "SDL
	@$(getUrl) $(SDL_url) $(CLFS)
	@cp scripts/SDL.sh $(CLFS)
	@$(CLFS)/SDL.sh $(SDL_ver) add
	@touch $(CACHE)/SDL-$(SDL_ver)
	@rm $(CLFS)/SDL.sh
	@rm -r $(CLFS)/sources/SDL-$(SDL_ver)
endif

SDL-remove: 
ifneq ($(findstring SDL, $(iPackage)),)
	@echo "Removing "SDL
	@$(getUrl) $(SDL_url) $(CLFS)
	@cp scripts/SDL.sh $(CLFS)
	@$(CLFS)/SDL.sh $(SDL_ver) remove
	@rm $(CACHE)/SDL-$(SDL_ver)
	@rm $(CLFS)/SDL.sh
	@rm -r $(CLFS)/sources/SDL-$(SDL_ver)
endif
