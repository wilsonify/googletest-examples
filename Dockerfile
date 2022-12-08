FROM googletest-examples-builder:latest as builder
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN make all
WORKDIR /usr/src/app/build
ENTRYPOINT [ "testfizzbuzzer" ]

#FROM googletest-examples-base:latest
#COPY --from=builder /usr/src/app/dist /usr/src/app/dist
