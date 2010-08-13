# raw makefile
# - ease repeatitive operations

all:

doc: myjsdoc

myjsdoc:
	(cd ../node-neoip/lib && jsrun.sh -d=../mw/docs/jsdoc .)

server:
	jekyll --server