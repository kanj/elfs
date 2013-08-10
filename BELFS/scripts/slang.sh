#!/bin/sh
source /etc/.bashrc

cd ~/sources/slang-2.2.4
./configure --prefix=/usr --sysconfdir=/etc && make

make install_doc_dir=/usr/share/doc/slang-2.2.4   \
     SLSH_DOC_DIR=/usr/share/doc/slang-2.2.4/slsh \
     install-all             
            
