ver_file = echo "1.0.0" > $(1) && date +%Y-%m-%d >> $(1)
all: clean build/testfizzbuzzer

build/version.txt:
	mkdir -p build && $(call ver_file, $@)

dist/version.txt:
	mkdir -p build && $(call ver_file, $@)

external/googletest/googletest/include/gtest/gtest.h:
	git submodule update --init

clean:
	rm -rf build

build/Makefile: build/version.txt
	cd build && cmake ..

build/testfizzbuzzer:  build/Makefile
	cd build && make 

build/test-results:
	cd build && ctest 
	
build/testfizzbuzzer.tar.gz:
	cd build && cpack

build/googletest-examples-base.txt: build/version.txt
	docker build -t googletest-examples-base -f Dockerfile-base . && $(call ver_file, $@)

build/googletest-examples-builder.txt: build/googletest-examples-base.txt
	docker build -t googletest-examples-builder -f Dockerfile-builder . && $(call ver_file, $@)

build/googletest-examples-image.txt: build/googletest-examples-builder.txt
	docker build -t googletest-examples -f Dockerfile . && $(call ver_file, $@)

docker-run: build/googletest-examples-image.txt
	docker run --rm --name googletest-examples googletest-examples:latest

docker/build/testfizzbuzzer: build/googletest-examples-builder.txt
	docker run --rm --name googletest-examples-builder -u 1000:1000 -v $(shell pwd):/usr/src/app googletest-examples-builder:latest make all
