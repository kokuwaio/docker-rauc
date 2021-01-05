# RAUC Docker

This build a docker image for [RAUC](https://github.com/rauc/rauc).

## Build Image

Clone this repository, and execute the following commands in the root folder:

```bash
docker build . -t docker.pkg.github.com/kokuwaio/docker-rauc/rauc:1.5
```

## Usage:

```bash
docker run --user `id -u`:`id -g` -v `pwd`/input:/data/input -v `pwd`/keys:/data/keys -v `pwd`/output:/data/output docker.pkg.github.com/kokuwaio/docker-rauc/rauc:1.5 bundle --cert=/data/keys/cert.pem --key=/data/keys/key.pem /data/input/ /data/output/test-0.0.1.raucb
```
