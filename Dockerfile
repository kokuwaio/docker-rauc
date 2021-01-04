
FROM debian:bullseye-slim

ENV RAUC_VERSION v1.5

RUN apt-get -y update && \
    apt-get -y install git automake libtool libdbus-1-dev libglib2.0-dev libcurl3-dev libssl-dev libjson-glib-dev squashfs-tools systemd curl make

# Build RAUC
RUN git clone https://github.com/rauc/rauc.git /rauc
WORKDIR /rauc/
RUN git checkout "${RAUC_VERSION}" && \
    ./autogen.sh && \
    ./configure --disable-dependency-tracking && \
    make install

RUN mkdir -p /data/input && \
    mkdir -p /data/output && \
    mkdir -p /data/keys && \
    rm -rf /var/lib/apt/lists/*

RUN rauc --version

VOLUME [ "/data" ]

ENTRYPOINT ["rauc"]
