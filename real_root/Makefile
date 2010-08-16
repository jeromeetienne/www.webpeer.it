# raw makefile
# - ease repeatitive operations

all:

PWD		:= $(shell pwd)
JEKYLL_DST	:=..
NODE_NEOIP_DIR	:= ../../node-neoip

doc: myjsdoc

myjsdoc:
	(cd $(NODE_NEOIP_DIR)/lib && jsrun.sh -d=../../mw/real_root/docs/jsdoc .)

server:
	~/.gem/ruby/1.8/bin/jekyll --server
	
generate:
	touch $(JEKYLL_DST)/.nojekyll
	/home/jerome/work/jekyll/bin/jekyll . $(JEKYLL_DST)

#################################################################################
#		webpeerjs handling						#
#################################################################################

webpeerjs_import:
	(cd ../node-neoip/web_build && DESTDIR=$(PWD)/js make)
	(cp ../node-neoip/images/badge/* images/badge)

webpeerjs_clean:
	rm -f js/webpeer.js js/webpeer-*.js js/webpeer-*-min.js
	rm -f images/badge/*
