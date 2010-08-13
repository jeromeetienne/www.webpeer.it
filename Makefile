# raw makefile
# - ease repeatitive operations

all:

jsdoc:
	jsrun.sh -d=docs/jsdoc ../node-neoip/lib

server:
	jekyll --server