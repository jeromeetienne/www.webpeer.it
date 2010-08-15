# raw makefile
# - ease repeatitive operations

all:

PWD := $(shell pwd)

doc: myjsdoc

myjsdoc:
	(cd ../node-neoip/lib && jsrun.sh -d=../../mw/docs/jsdoc .)

server:
	jekyll --server

#################################################################################
#		webpeerjs handling						#
#################################################################################

webpeerjs_import:
	(cd ../node-neoip/web_build && DESTDIR=$(PWD)/js make)
	(cp ../node-neoip/images/badge/* images/badge)

webpeerjs_clean:
	rm -f js/webpeer.js js/webpeer-*.js js/webpeer-*-min.js
