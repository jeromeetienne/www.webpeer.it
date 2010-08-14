# raw makefile
# - ease repeatitive operations

all:

PWD := $(shell pwd)

doc: myjsdoc

myjsdoc:
	(cd ../node-neoip/lib && jsrun.sh -d=../../mw/docs/jsdoc .)

server:
	jekyll --server

import_webpeerjs:
	(cd ../node-neoip/web_build && DESTDIR=$(PWD)/js make)
	