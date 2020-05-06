SHELL := /bin/bash

IMG ?= tdmproject/ckan-core

clone:
	git clone https://github.com/ckan/ckan.git && \
	cd ckan && \
	git fetch --all --tags  && \
	git checkout tags/ckan-2.8.4

ckan: clone 

images: ckan
	cp patches/ckan-entrypoint.sh ckan/contrib/docker/
	cd ckan && docker build -t ${IMG} .

