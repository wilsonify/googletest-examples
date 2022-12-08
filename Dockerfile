FROM googletest-examples-builder:latest as builder
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN make all
RUN ldd build/testfizzbuzzer

FROM googletest-examples-base:latest
COPY --from=builder /usr/src/app/build/testfizzbuzzer /usr/src/app/build/testfizzbuzzer
COPY --from=builder /usr/src/app/build/libfizz-buzz-library.so /usr/src/app/build/libfizz-buzz-library.so
WORKDIR /usr/src/app/build
ENTRYPOINT [ "./testfizzbuzzer" ]
