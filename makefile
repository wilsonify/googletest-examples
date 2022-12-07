

external/googletest/googletest/include/gtest/gtest.h:
	git submodule update --init

clean:
	rm -rf build

all:
	mkdir -p build && cd build && cmake .. && make && ctest && cpack