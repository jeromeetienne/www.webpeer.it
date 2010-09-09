# raw makefile
# - ease repeatitive operations

all:

PWD		:= $(shell pwd)
JEKYLL_DST	:= /home/jerome/webwork/www.webpeer.it.gh-pages
NODE_NEOIP_DIR	:= /home/jerome/webwork/node-neoip

build:	jsdoc_build webpeerjs_import

clean: jsdoc_clean webpeerjs_clean

server:
	lighttpd -f lighttpd.conf  -D
		
upload: jekyll_build
	(cd $(JEKYLL_DST) && git add . && git commit -a -m 'new build' && git push origin gh-pages)

jekyll_build:
	(cd $(JEKYLL_DST) && git reset --hard origin/gh-pages)
	touch $(JEKYLL_DST)/.nojekyll
	/home/jerome/work/jekyll/bin/jekyll . $(JEKYLL_DST)
	
jekyll_monitor:
	(while inotifywait -r -e modify,attrib,create . ; do make jekyll_build; done)

#################################################################################
#		doc handling							#
#################################################################################

doc: jsdoc_build

jsdoc_build:
	(cd $(NODE_NEOIP_DIR)/lib && jsrun.sh -d=$(PWD)/docs/jsdoc .)

jsdoc_clean:
	rm -rf docs/jsdoc/*

#################################################################################
#		webpeerjs handling						#
#################################################################################

webpeerjs_import:
	(cd $(NODE_NEOIP_DIR)/web_build && DESTDIR=$(PWD)/js make)
	(cp $(NODE_NEOIP_DIR)/images/badge/* images/badge)

webpeerjs_clean:
	rm -f js/webpeer.js js/webpeer-*.js js/webpeer-*-min.js
	rm -f images/badge/*
