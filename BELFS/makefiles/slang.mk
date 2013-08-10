slang_ver = 2.2.4
slang_url = ftp://space.mit.edu/pub/davis/slang/v2.2/slang-$(slang_ver).tar.bz2

slang-add: 
	@cp scripts/slang.sh $(JAIL)
	#@$(getUrl) $(slang_url) $(CLFS)/sources
	#@echo $(CLFS)/sources/slang-2.2.4
	@$(CHROOT) /slang.sh
	#@make -C $(CLFS)/sources/slang-2.2.4 install
	@rm $(JAIL)/slang.sh
	
