package += python
python_ver = 2.7.2
python_url = http://www.python.org/ftp/python/2.7.2/Python-2.7.2.tar.xz

python-add: 
ifeq ($(findstring python, $(iPackage)),)
	@echo "Adding "python
	@$(getUrl) $(python_url) $(CLFS)
	@cp scripts/python.sh $(JAIL)
	@$(CHROOT) /python.sh $(python_ver) add
	@touch $(CACHE)/python-$(python_ver)
	@rm $(JAIL)/python.sh
	@rm -r $(CLFS)/sources/python-$(python_ver)
endif

python-remove: 
ifneq ($(findstring python, $(iPackage)),)
	@echo "Removing "python
	@$(getUrl) $(python_url) $(CLFS)
	@cp scripts/python.sh $(JAIL)
	@$(CHROOT) /python.sh $(python_ver) remove
	@rm $(CACHE)/python-$(python_ver)
	@rm $(JAIL)/python.sh
	@rm -r $(CLFS)/sources/python-$(python_ver)
endif
