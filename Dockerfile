FROM alpine:3.12.3

ENV RAUC_VERSION v1.5

RUN apk add --no-cache git automake autoconf libtool squashfs-tools build-base gcc abuild binutils cmake extra-cmake-modules dbus-dev glib-dev curl-dev json-glib-dev curl make && \
    git clone https://github.com/rauc/rauc.git /rauc && \
    cd /rauc && \
    git checkout "${RAUC_VERSION}" && \
    ./autogen.sh && \
    ./configure --disable-dependency-tracking && \
    make install && \
    mkdir -p /data/input /data/keys /data/output && \
    cd / && \
    rm -rf /rauc && \
    apk del git automake autoconf libtool build-base gcc abuild binutils cmake extra-cmake-modules curl make

RUN rauc --version

VOLUME [ "/data" ]
ENTRYPOINT ["rauc"]
