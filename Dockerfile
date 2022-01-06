FROM alpine:latest

RUN apk add --no-cache git \
    && apk add --no-cache --virtual build_dependencies \
    wget \
    unzip \
    g++ \
    make \
    cmake \
    && git clone https://github.com/JHungerford2021/minecraft_upscale \
    && wget https://download.pytorch.org/libtorch/nightly/cpu/libtorch-shared-with-deps-latest.zip \
    && unzip libtorch-shared-with-deps-latest.zip \
    && rm libtorch-shared-with-deps-latest.zip \
    && cd /minecraft_upscale \
    && mkdir build \
    && cmake -DCMAKE_PREFIX_PATH=/libtorch .. \
    && cmake -S . -B build \
    && make --directory build \
    && apk del build_dependencies