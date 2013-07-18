# 2013-005-07 Updated sed for book improvements
s#/opt/clfs#${BUILDDIR}#g 
s#/mnt/clfs#${BUILDDIR}#g 
s/<[^>]\+>/ /g
s#\&lt;#<#g
s#\&gt;#>#g 
s#\&amp;#\&#g 
s#passwd clfs##g
s#chown -Rv clfs ${CLFS}#chown -Rv clfs ${BUILDDIR}#g
s#su - clfs##g
s#source ~/.bash_profile##g

