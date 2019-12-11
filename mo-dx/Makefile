export SHELL = sh
PACKAGE = aicra
VERSION = 0.0.1-1
COPYRIGHTYEAR = 2019
AUTHOR = AICRA
EMAIL = aicra@faqlinux.com

all: debian

debian: 
	[ ! -d ./build/debian/ ] || rm -r ./build/debian/
	mkdir -p ./build/debian/
	mkdir -p ./dist
	
	cp -r src/* ./build/debian/
	
	./tools/mogui.sh "$(PACKAGE)" "$(VERSION)" "$(AUTHOR)" "$(EMAIL)" "all"


clean:
	rm -rf dist
	rm -rf build

