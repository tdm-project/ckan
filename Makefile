all: build

clone:
	git clone https://github.com/ckan/ckan.git && \
	cd ckan && \
	git fetch --all --tags  && \
	git checkout tags/ckan-2.8.4

ckan: clone 

build: ckan
	cp patches/ckan-entrypoint.sh ckan/contrib/docker/
	cd ckan && docker build -t tdmproject/ckan:v2.8.4 .

